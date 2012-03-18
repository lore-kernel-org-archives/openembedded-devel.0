Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9C2F-0007bm-Um
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 10:04:19 +0100
Received: by wera1 with SMTP id a1so5116931wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2012 01:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=nsmLkn50i70Kp1LHNE3hrPmRNJTC88tNnx0huVLPMUM=;
	b=enDHwnVOWh+yNjQjUQ1sIvGkwzDM4wJ4Pe2q74i4c/YH2WqG1owyY3CyKyAok1617S
	I54/pwmsuDsbt/ihXo0eZ8EXxPx76wfY9Nlfuc0iwgMMKWcWAfIQ6xy6H+HF+YWAeYsK
	doYe7+9ke6qy8BGcjMpPJDgEPaEV4dvnAxuWbRw2Jbojfi5WtUeIzR6A49pLc28Lqpcn
	o8Dr5qjV0/VW8K9darTByIHRL205LEGAvtzZrskfasUZu4DBCiFD3aMVyfefRR6kHgfZ
	Q38u5DF0yCOVlBnBj/lNFoTrRZ4A/Te2DfYME1JfZiLJ5JDE+qMqAbQgPa1DbjU+o0m1
	oXgQ==
Received: by 10.180.85.69 with SMTP id f5mr11173832wiz.18.1332060930293;
	Sun, 18 Mar 2012 01:55:30 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ff2sm24110067wib.9.2012.03.18.01.55.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Mar 2012 01:55:29 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2012 09:55:20 +0100
Message-Id: <1332060920-2772-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQlZt9rG4++XIdr24sMdAhEuu3MxtxGcJ5H2gnBoGaZWe/djkppWH+56XdvaSogwKoDDF2vs
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe] systemd: update to v44 + CVE fix
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
X-List-Received-Date: Sun, 18 Mar 2012 09:04:20 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...nald-allocate-PAGE_SIZE-bytes-for-selinux.patch |   34 ++++++++++++++++++++
 meta-oe/recipes-core/systemd/systemd_git.bb        |    5 ++-
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/systemd/systemd/0001-Revert-journald-allocate-PAGE_SIZE-bytes-for-selinux.patch

diff --git a/meta-oe/recipes-core/systemd/systemd/0001-Revert-journald-allocate-PAGE_SIZE-bytes-for-selinux.patch b/meta-oe/recipes-core/systemd/systemd/0001-Revert-journald-allocate-PAGE_SIZE-bytes-for-selinux.patch
new file mode 100644
index 0000000..9c74f67
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/0001-Revert-journald-allocate-PAGE_SIZE-bytes-for-selinux.patch
@@ -0,0 +1,34 @@
+From 9d3226c3a3dd34e7299aa693544e45b8ebe9410b Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sun, 18 Mar 2012 09:18:39 +0100
+Subject: [PATCH] Revert "journald: allocate PAGE_SIZE bytes for selinux label length"
+
+This reverts commit 2d44fc7ba5aaf700672baa7b0697caefddafdc53.
+---
+ src/journal/journald.c |    3 +--
+ 1 files changed, 1 insertions(+), 2 deletions(-)
+
+diff --git a/src/journal/journald.c b/src/journal/journald.c
+index baad3ab..3dde891 100644
+--- a/src/journal/journald.c
++++ b/src/journal/journald.c
+@@ -29,7 +29,6 @@
+ #include <sys/ioctl.h>
+ #include <linux/sockios.h>
+ #include <sys/statvfs.h>
+-#include <sys/user.h>
+ 
+ #include <systemd/sd-journal.h>
+ #include <systemd/sd-login.h>
+@@ -2144,7 +2143,7 @@ static int process_event(Server *s, struct epoll_event *ev) {
+                                 uint8_t buf[CMSG_SPACE(sizeof(struct ucred)) +
+                                             CMSG_SPACE(sizeof(struct timeval)) +
+                                             CMSG_SPACE(sizeof(int)) +
+-                                            CMSG_SPACE(PAGE_SIZE)]; /* selinux label */
++                                            CMSG_SPACE(LINE_MAX)]; /* selinux label */
+                         } control;
+                         ssize_t n;
+                         int v;
+-- 
+1.7.2.5
+
diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index e99be88..a320299 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,13 +14,14 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r22"
+PR = "r23"
 
 inherit useradd pkgconfig autotools vala perlnative
 
-SRCREV = "03f38e74984d93aa83c056893d414a5e3eac5763"
+SRCREV = "5ebff5337594d690b322078c512eb222d34aaa82"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
+           file://0001-Revert-journald-allocate-PAGE_SIZE-bytes-for-selinux.patch \
            file://0002-systemd-logind-don-t-kill-user-processes-on-exit.patch \
            ${UCLIBCPATCHES} \
           "
-- 
1.7.2.5



