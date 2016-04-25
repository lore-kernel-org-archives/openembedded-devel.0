Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6C84170018
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 00:12:25 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id iv1so8919148pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Apr 2016 17:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AdnqiSRTfxAeHZbPd2Bk96QbEV8SGgusMrMki8RAqP0=;
	b=n6jhbjZ0DMoMo+tILdvxfPJ+aD2r/TEV5HZHaIUVoe0uoPbeImOB0WhFT/RbnKQjyg
	5fu2Sjg/QcVuK4QKDfGqYiwyruH/qp4ZV9uPQgqOlrm5UfBmmncgBm0wECaxoutIYFy7
	7m7uWZGdKfDnblc5WrnNYndP1OY1xxITaTNA9kYhhW0xZmA/gxMjUluVjOXzSB9YWHLH
	6eHkLDT9s920r3jDqbKReFLZY8195ZYti2f0K3zahaxZWu3H5hH2H6G+VbsvU32OMktq
	z2X0khmNFTqIPbB/O0rpriO9eGLwGjWhPTQfNoaQOIJqCZ8q63fynZMnxdZnJUtEqPQh
	ZRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AdnqiSRTfxAeHZbPd2Bk96QbEV8SGgusMrMki8RAqP0=;
	b=dngSUGnsUNsPR7OMOuSPckMya6H3VdbHfAaID/g+oKXaS1MHopT/OizAN3gkc09rYR
	rCK5smimQMTbW7i7Ysrrg/Rzi9GxoGuviWVhJyDLZpJCbXEkKnWaYt3sIvmu7iVaoFcL
	HAdzCSDCJspf7xQANgQ5ebELYRO4npJtr05GQS/sbqsR3+667HWTQn3Ejs9p3p7hydAh
	zuosxW1U/qpW7Id19xHKIHCbNeQie+/GLJI5F8noK16owwtwQ5KVoDrSY55Baij1kKHj
	v15WxLlTMbmumjsJhKdvsx5trYk4TvIjNPPunUxuAJhqbwLgXmwZOuk0XxracF67mAmT
	BdWw==
X-Gm-Message-State: AOPr4FVozaVs5mcRVdgrHl9ptlPHbIidw8tOnoOIORk3AgEJemDxeEwcNnbj7O79jv0XfQ==
X-Received: by 10.66.222.3 with SMTP id qi3mr44540175pac.24.1461543145936;
	Sun, 24 Apr 2016 17:12:25 -0700 (PDT)
Received: from haswell.localdomain ([2601:646:8800:5a9a:e493:6aff:fe07:db7a])
	by smtp.gmail.com with ESMTPSA id
	a64sm4578171pfa.6.2016.04.24.17.12.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Apr 2016 17:12:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Apr 2016 17:12:18 -0700
Message-Id: <1461543138-25293-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [meta-oe][PATCH] ltrace: Remove deprecated readdir_r()
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Apr 2016 00:12:25 -0000

New glibc >= 2.24 will remove it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-replace-readdir_r-with-readdir.patch      | 33 ++++++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch
new file mode 100644
index 0000000..8d2c264
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch
@@ -0,0 +1,33 @@
+From 64f98f84fd88797e219f9dde1ca387fee4b509f0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 24 Apr 2016 16:58:17 -0700
+Subject: [PATCH] replace readdir_r with readdir
+
+glibc 2.24 has deprecated readdir_r
+
+https://sourceware.org/ml/libc-alpha/2016-02/msg00093.html
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ sysdeps/linux-gnu/proc.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+Index: git/sysdeps/linux-gnu/proc.c
+===================================================================
+--- git.orig/sysdeps/linux-gnu/proc.c
++++ git/sysdeps/linux-gnu/proc.c
+@@ -240,9 +240,10 @@ process_tasks(pid_t pid, pid_t **ret_tas
+ 	size_t alloc = 0;
+ 
+ 	while (1) {
+-		struct dirent entry;
+ 		struct dirent *result;
+-		if (readdir_r(d, &entry, &result) != 0) {
++		errno = 0;
++		result = readdir(d);
++		if (errno != 0) {
+ 			free(tasks);
+ 			return -1;
+ 		}
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index d8d037e..7a7174c 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=ltrace-0.7 \
            file://ltrace-0.7.2-unused-typedef.patch \
            file://configure-allow-to-disable-selinux-support.patch \
            file://0001-ltrace-fix-gcc-5-logical-not-parentheses.patch \
+           file://0001-replace-readdir_r-with-readdir.patch \
           "
 S = "${WORKDIR}/git"
 
-- 
2.8.0


