Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8491371951
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 16:26:22 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id iv1so17240167pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5dKAJpLS/Fv3BEAv4RmiuJJrjDD33wCgpgs2Kjnp6Wo=;
	b=FnxHwDoucipm6ao72DlBNaIr4twa1+0UeKDLLR6wnAItoLGsID9bnFhtBPDDvQS38M
	2fM1W+6T11EwYDOl5cl2k8Xu7uZcL2sn49pLCYhAhtZm8sG9YOIOx2McLKQFIv5auUt2
	zLwRuLWJ4p9Tfns8V7E03lV6oAP6Npd09CDs7sYGynAmsTbsY2jT0IkjEN4wYeXz6SXu
	ATKP7fLOwG6UQffbbZbtneRBfmhdjVHsVrh52CgiSKR1ftiHY0e4foB/TeZdyebApqzl
	XUL9IaIT/InVtsXOiKUwrDmaL5OBVX3L7CIwbVN0c2Edpo5xy15tMzuGNJz1NI6AStoY
	KwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5dKAJpLS/Fv3BEAv4RmiuJJrjDD33wCgpgs2Kjnp6Wo=;
	b=WgJu1SoatWj9W9rBFuifpsPLr2xYukpIomlt3hYTWSiWuZZF6jONUhcNDJZ/o0A5C4
	lufPvhqanW93N2yQ0eijgvZetYKOYPcScoLax4FSwvmwqsKg8p0eAV+4yt4AX4SQU6x2
	wHbew/tIenxOQJS2m54j38iWn5sOU8dNpNmP8YXVGtD9rdi7IulMmScR0OvXpjDeK0Dt
	AX3cV08Od6g+MityO75R6fFNjc2/eMTXJWFBXJkVrAH/+htg5aKoEuh9J7XzXF6nNZSF
	ex9rF515tiAaXo2UvAKtEfxKozX/W9GN5QgoKCpe0J0bCkN3ne5FgdjWURLX27AUIsOH
	qfKg==
X-Gm-Message-State: AOPr4FVqNC/SJ8qnPAUOr+O3wLNMbE0ysZECFc00JOCR2U3iGL5DNq8DweVPrcb/2IhEvA==
X-Received: by 10.66.182.134 with SMTP id ee6mr9020901pac.89.1461601583075;
	Mon, 25 Apr 2016 09:26:23 -0700 (PDT)
Received: from haswell.localdomain ([2601:646:8800:5a9a:e493:6aff:fe07:db7a])
	by smtp.gmail.com with ESMTPSA id
	dr4sm13418172pac.11.2016.04.25.09.26.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Apr 2016 09:26:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2016 09:26:18 -0700
Message-Id: <1461601578-3292-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [PATCH V2] ltrace: Remove deprecated readdir_r()
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
X-List-Received-Date: Mon, 25 Apr 2016 16:26:23 -0000

New glibc >= 2.24 will remove it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-replace-readdir_r-with-readdir.patch      | 36 ++++++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch
new file mode 100644
index 0000000..65c7d53
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-readdir.patch
@@ -0,0 +1,36 @@
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
+diff --git a/sysdeps/linux-gnu/proc.c b/sysdeps/linux-gnu/proc.c
+index 953fd86..edb716d 100644
+--- a/sysdeps/linux-gnu/proc.c
++++ b/sysdeps/linux-gnu/proc.c
+@@ -242,9 +242,10 @@ process_tasks(pid_t pid, pid_t **ret_tasks, size_t *ret_n)
+ 	size_t alloc = 0;
+ 
+ 	while (1) {
+-		struct dirent entry;
+ 		struct dirent *result;
+-		if (readdir_r(d, &entry, &result) != 0) {
++		errno = 0;
++		result = readdir(d);
++		if (errno != 0) {
+ 		fail:
+ 			free(tasks);
+ 			closedir(d);
+-- 
+2.8.0
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 850e8e3..d5f6943 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -17,6 +17,7 @@ DEPENDS = "elfutils"
 RDEPENDS_${PN} = "elfutils"
 SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=master \
            file://configure-allow-to-disable-selinux-support.patch \
+           file://0001-replace-readdir_r-with-readdir.patch \
           "
 S = "${WORKDIR}/git"
 
-- 
2.8.0


