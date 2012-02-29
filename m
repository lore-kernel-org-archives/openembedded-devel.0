Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S2j0O-0008Tm-OP
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Feb 2012 13:51:40 +0100
Received: by wgbdr12 with SMTP id dr12so3460410wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Feb 2012 04:43:12 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.79.229 as permitted sender)
	client-ip=10.180.79.229; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.79.229 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.79.229])
	by 10.180.79.229 with SMTP id m5mr512465wix.6.1330519392052 (num_hops =
	1); Wed, 29 Feb 2012 04:43:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.79.229 with SMTP id m5mr417932wix.6.1330519391999;
	Wed, 29 Feb 2012 04:43:11 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	hb10sm86617218wib.10.2012.02.29.04.43.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Feb 2012 04:43:11 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Feb 2012 13:43:04 +0100
Message-Id: <1330519384-27144-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQkyMtUYJUy5lxEAYQuAQrc32Q5uZOQnOet3rbhvtTH4XNGA0rQB5DY9at2NZIxsmM5KTA4o
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe] systemd: address logind problem on BE machines
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Feb 2012 12:51:40 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../0001-systemd-journald-fix-endianess-bug.patch  |   29 ++++++++++++++++++++
 meta-oe/recipes-core/systemd/systemd_git.bb        |    3 +-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-core/systemd/systemd/0001-systemd-journald-fix-endianess-bug.patch

diff --git a/meta-oe/recipes-core/systemd/systemd/0001-systemd-journald-fix-endianess-bug.patch b/meta-oe/recipes-core/systemd/systemd/0001-systemd-journald-fix-endianess-bug.patch
new file mode 100644
index 0000000..b41d5eb
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/0001-systemd-journald-fix-endianess-bug.patch
@@ -0,0 +1,29 @@
+From d228134ff5af3bd0ef1087e9bee66583c1546553 Mon Sep 17 00:00:00 2001
+From: Dirk Eibach <eibach@gdsys.de>
+Date: Wed, 29 Feb 2012 12:45:46 +0100
+Subject: [PATCH] systemd-journald: fix endianess bug
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+
+Upstream-status: Submitted
+
+ src/journal/journal-file.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
+index 20ca3f6..275caea 100644
+--- a/src/journal/journal-file.c
++++ b/src/journal/journal-file.c
+@@ -238,7 +238,7 @@ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size)
+         if (fstat(f->fd, &f->last_stat) < 0)
+                 return -errno;
+ 
+-        f->header->arena_size = new_size - htole64(f->header->arena_offset);
++        f->header->arena_size = htole64(new_size - le64toh(f->header->arena_offset));
+ 
+         return 0;
+ }
+-- 
+1.7.7.4
+
diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 4c458bd..62a326e 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r16"
+PR = "r17"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -23,6 +23,7 @@ SRCREV = "d26e4270409506cd398875216413b651d6ee7de6"
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            file://0001-docs-fix-build-without-xsltproc.patch \
            file://0002-systemd-logind-don-t-kill-user-processes-on-exit.patch \
+           file://0001-systemd-journald-fix-endianess-bug.patch \
            ${UCLIBCPATCHES} \
           "
 UCLIBCPATCHES = ""
-- 
1.7.2.5



