Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B305772EC9
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 20:14:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g8so13878807wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2018 13:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pJW5lQ2cVMfsJ4r4rZqtKPJ7uO5wiptlclJqO1oAUHY=;
	b=g9gyKfkpyx6MkKBs+zbVTqAv7vrcP2ZnBTQDxHuYJcoITKdimEDL+0+ZqM5lh7Dgng
	xnqg3gWxGKhOYDOjrQVeagPI3WEj0fFrkmYF2WqUUN41cyeC5nN0HxOcYnd4uFw8LsfJ
	P68cmuP6t3gQhbY2+5Iz1q7GCocQQHpVaTPvug1XXqRh8KsgfdUlpKx385BPRosIiSWc
	PSm+hlrK9Ui7OkdeYCXnYkJdM/nXoLlVXsR78y5jR4ZSTPfPEAoR3vipXh2haJo0DpvM
	fAbfZm2QpNIIidA0gEfVZp0BohA4Q1yYac2nzPjBaJL9nUPyA+bUHJChrRwHSUI4g69D
	O9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pJW5lQ2cVMfsJ4r4rZqtKPJ7uO5wiptlclJqO1oAUHY=;
	b=KjyGQU+AUdL/8/QLReJzxB0eMpIaQ4vOayJJcQ4rLDN7H7SdgRdvarLhGZWd5gX7bn
	un1fsFnOzBr29J+uuzkQHFHFxeSJaFpDhr4DZNJWoXy8RWvmb2/6hF/srx6wGZ3E0fT2
	F9fVnEP6aZXjD/YIUjSFOCwzWQ79RWJbamzvrsXMndglN5TmKKZD01Z7o2I6jtA65IkU
	UYIyWHFmgmQBeFl1XeWPLfuGdfqOebn6M+ReXvqkZXU/4/DGJlAQbBtInqyUUWBTbE5/
	P6J0cgUwbEBKYFW5VaIiwZrSUaR8GZ4mHfUp9Z9JJrpZo93pwTlh2jvDoTUxvijcsgJe
	znfg==
X-Gm-Message-State: AElRT7FrXzwh+WSDat3RgtfjOiJvpJgO7tWQdpqRGJb91im7KyZv2M2k
	661/VwgwfRcMLZFtDxYvwXX/VQ==
X-Google-Smtp-Source: AIpwx48h/OPtMj651c6U4d0Fp5lLLL0m7AJQR0J+s0i98CG7BRkOP7UUvrbb10PViyVL9FGbwMLqUg==
X-Received: by 10.28.63.212 with SMTP id m203mr18276493wma.124.1523218474193; 
	Sun, 08 Apr 2018 13:14:34 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	55sm34140538wrw.52.2018.04.08.13.14.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 08 Apr 2018 13:14:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Apr 2018 20:14:39 +0000
Message-Id: <20180408201440.31986-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-oe][PATCH 1/2] android-tools: refresh patch
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
X-List-Received-Date: Sun, 08 Apr 2018 20:14:34 -0000

WARNING: android-tools-5.1.1.r37-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch preserve-ownership.patch
patching file system/extras/ext4_utils/make_ext4fs_main.c
Hunk #1 succeeded at 47 with fuzz 2 (offset -2 lines).
Hunk #2 succeeded at 81 (offset -2 lines).
Hunk #3 succeeded at 144 (offset -2 lines).
patching file system/extras/ext4_utils/make_ext4fs.c

Now at patch preserve-ownership.patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../android-tools/preserve-ownership.patch         | 71 ++++++++++++----------
 .../android-tools/android-tools_5.1.1.r37.bb       |  2 +-
 2 files changed, 41 insertions(+), 32 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch b/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
index 85af81f0f9..5c90397194 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
@@ -1,19 +1,50 @@
+From aa669312a380611d280d126cb509fa282080707e Mon Sep 17 00:00:00 2001
+From: Markus Mayer <mmayer@mmayer.net>
+Date: Wed, 7 Sep 2016 12:58:47 +0300
+Subject: [PATCH] android-tools: add recipe from AOSP tag android-5.1.1_r37
+
 Description: add -o argument to preserve ownership
-Author: Markus Mayer <mmayer@mmayer.net>
 
 See also https://android-review.googlesource.com/#/c/100312/
 
 Upstream-Status: Inappropriate
+
 ---
- system/extras/ext4_utils/make_ext4fs.c      |    6 ++++++
- system/extras/ext4_utils/make_ext4fs_main.c |   10 ++++++++--
+ ext4_utils/make_ext4fs.c      |  6 ++++++
+ ext4_utils/make_ext4fs_main.c | 10 ++++++++--
  2 files changed, 14 insertions(+), 2 deletions(-)
 
---- a/system/extras/ext4_utils/make_ext4fs_main.c
-+++ b/system/extras/ext4_utils/make_ext4fs_main.c
-@@ -49,13 +49,15 @@ extern struct fs_info info;
+diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4fs.c
+index 2f89ae8a..cc41d623 100644
+--- a/ext4_utils/make_ext4fs.c
++++ b/ext4_utils/make_ext4fs.c
+@@ -68,6 +68,8 @@
+ 
+ #endif
+ 
++int preserve_owner = 0;
++
+ /* TODO: Not implemented:
+    Allocating blocks in the same block group as the file inode
+    Hash or binary tree directories
+@@ -186,6 +188,10 @@ static u32 build_directory_structure(const char *full_path, const char *dir_path
+ 		} else {
+ 			dentries[i].mtime = fixed_time;
+ 		}
++		if (preserve_owner) {
++			dentries[i].uid = stat.st_uid;
++			dentries[i].gid = stat.st_gid;
++		}
+ 		uint64_t capabilities;
+ 		if (fs_config_func != NULL) {
+ #ifdef ANDROID
+diff --git a/ext4_utils/make_ext4fs_main.c b/ext4_utils/make_ext4fs_main.c
+index a6c5f616..7af0dddf 100644
+--- a/ext4_utils/make_ext4fs_main.c
++++ b/ext4_utils/make_ext4fs_main.c
+@@ -48,13 +48,15 @@ struct selabel_handle;
+ extern struct fs_info info;
  
- extern struct selabel_handle* selinux_android_file_context_handle(void);
  
 +extern int preserve_owner;
 +
@@ -28,7 +59,7 @@ Upstream-Status: Inappropriate
  	fprintf(stderr, "    <filename> [<directory>]\n");
  }
  
-@@ -81,7 +83,7 @@ int main(int argc, char **argv)
+@@ -80,7 +82,7 @@ int main(int argc, char **argv)
  	struct selinux_opt seopts[] = { { SELABEL_OPT_PATH, "" } };
  #endif
  
@@ -37,7 +68,7 @@ Upstream-Status: Inappropriate
  		switch (opt) {
  		case 'l':
  			info.len = parse_num(optarg);
-@@ -144,6 +146,10 @@ int main(int argc, char **argv)
+@@ -143,6 +145,10 @@ int main(int argc, char **argv)
  			}
  #endif
  			break;
@@ -48,25 +79,3 @@ Upstream-Status: Inappropriate
  		case 'v':
  			verbose = 1;
  			break;
---- a/system/extras/ext4_utils/make_ext4fs.c
-+++ b/system/extras/ext4_utils/make_ext4fs.c
-@@ -67,6 +67,8 @@
- 
- #endif
- 
-+int preserve_owner = 0;
-+
- /* TODO: Not implemented:
-    Allocating blocks in the same block group as the file inode
-    Hash or binary tree directories
-@@ -185,6 +187,10 @@ static u32 build_directory_structure(con
- 		} else {
- 			dentries[i].mtime = fixed_time;
- 		}
-+		if (preserve_owner) {
-+			dentries[i].uid = stat.st_uid;
-+			dentries[i].gid = stat.st_gid;
-+		}
- 		uint64_t capabilities;
- 		if (fs_config_func != NULL) {
- #ifdef ANDROID
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index d3ccd1d064..5d8f8a8435 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
     file://remove-selinux-android.patch \
     file://use-capability.patch \
     file://use-local-socket.patch \
-    file://preserve-ownership.patch \
+    file://preserve-ownership.patch;patchdir=system/extras \
     file://mkbootimg-Add-dt-parameter-to-specify-DT-image.patch \
     file://remove-bionic-android.patch \
     file://define-shell-command.patch \
-- 
2.15.1


