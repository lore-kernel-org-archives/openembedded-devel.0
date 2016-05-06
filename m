Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 81DD1731C4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:01:53 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id r184so60386164qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=GVKDJoz2MHYCwu9aFDwyxqh1W36zfPM42uVSndiLYIk=;
	b=E8cUCYRo4jsIZPMGCzroeNcLw4bX4FJNTVe8wMGJSgdtBNp1JiDyurMPmaEd/8901q
	InkutD631goBj6b8tnA0ymNjH8qbeU0g2C0fbmXFgFNfMMPYLeY/sqB06RQvMu7MfNvS
	1DzgCuoop7XyCTxKJWcwCcLIp8V8rGqdd/vEz9d543KGF1DBzC/8g6lkFs1f3jFCYgKo
	fKYz4GUyPDWP26EMEyos5KI+tDgsUAfRSZNzuKrKgTwj8W67rs+j2dJI8ZzetX2oerzl
	kKCK3FLfurgdFGjKdrYmI6O0z6PWhtrnmHxp3uBE4Hd+ZjUwxQsxJ9DDlAUK6bcb5UBE
	KbPQ==
X-Gm-Message-State: AOPr4FUvakCVCrgqG5FKP8qX0vMlAHsp7JOzYwqh4gM4aG0i+q8zOR+jphAEhe9+sZfGlg==
X-Received: by 10.55.201.134 with SMTP id m6mr19656434qkl.79.1462543313754;
	Fri, 06 May 2016 07:01:53 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	x189sm5745218qhb.43.2016.05.06.07.01.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:01:52 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:01:48 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:46 -0300
Message-Id: <1462543259-7206-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 09/22] ltrace: Remove deprecated readdir_r()
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
X-List-Received-Date: Fri, 06 May 2016 14:01:53 -0000

From: Khem Raj <raj.khem@gmail.com>

New glibc >= 2.24 will remove it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
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
index 19899f9..c27e21d 100644
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
2.8.2


