Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id E596460807
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 16:52:02 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id z73so5901006wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 09:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BSyYfPT4rxEAysPL/KF093db34i+hyGKi89YVM42Cnc=;
	b=ehdur1mMFHkB9BEwpiyr6bayE7KNgktQYqZZaySKZUqMLqe73w1dsC2SPTgfdJLmRY
	n77yzuWT6wKXLlfYIgANiREBg9PUd4FuSKEw9NwOIh0KzkqGXMVMM7Cho0qNq1mmewWG
	HHE1PdJ7rQqNZoZuQjvYQfrcnbE/WiFuS54K7Yq2jo8/oSOzxmsbJRgTUStn4g2LmiPY
	3RtXMvGMRUPjope33oFh8SAZY6SJTjmtu4A6tUhKK6hZwzbw4pe0cGRYjTlE8b2BMXPN
	ngxiiSUfRK6JVUwy7qY1AnSApHwvMY4+nDt22wV7C2A0hWxXYHrXZHQamdYO2M6+KYuB
	b2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BSyYfPT4rxEAysPL/KF093db34i+hyGKi89YVM42Cnc=;
	b=KhI+WHRhTjh+KygZo7YJnwdMRG16BxmLLtoQwa1QIovTNeuMv8+JMD2F77iyDAph5R
	YhP7e93UCkfiSIi+VScYxj77RS/wdmu/w2GFyuxcEdLK4PORce6d3iQpPhcByFOodo3Q
	d+w5xEHUE9xYRYeMCnSLurkMoUmfumrwu2mA9rdbzaxc+esQ9TImMSTmwBcgwK7i1LlB
	GiRN3uRBRVXzlVr7eZKEdeojcpdhWCExGoK8rBmwxjMIolzBg//Lleib8C527Tyzh43V
	CiyLH9lA3DPxio55hwP4+vnPyDL4M+FQIucy7xtsr4nAItW0EWyzm4KaaYiaTVPkAxtr
	MZBg==
X-Gm-Message-State: AElRT7FLQQI2QEdQ5VZ8zK/OnIM7xA+mF9zIo0cyE7U7Y8YHz8B9Nykz
	UCbO+H65xNnY1pqtBHZrw7P+XA==
X-Google-Smtp-Source: AG47ELuQbFGO4i87GJ4tLJZlqRlUkZy9paOLhuqQlgtAAYhtCNX2pd97lYRJHJ0RLPT9PPDhFcsKNA==
X-Received: by 10.223.188.1 with SMTP id s1mr17864384wrg.243.1521651123520;
	Wed, 21 Mar 2018 09:52:03 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y75sm4775125wme.13.2018.03.21.09.52.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Mar 2018 09:52:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 16:51:59 +0000
Message-Id: <20180321165202.1777-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-oe][PATCH 1/4] krb5: refresh patches
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
X-List-Received-Date: Wed, 21 Mar 2018 16:52:03 -0000

WARNING: krb5-1.16-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
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
Applying patch
0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
patching file aclocal.m4
Hunk #1 succeeded at 1679 with fuzz 1 (offset 29 lines).

Now at patch
0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-Add-parameter-to-disable-keyutils-detection.patch | 19 +++++++++----------
 .../krb5/krb5/crosscompile_nm.patch                   | 19 ++++++++++++-------
 .../krb5/debian-suppress-usr-lib-in-krb5-config.patch | 11 ++++++-----
 3 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
index f0c310c5e8..fe8282eba1 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
+++ b/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
@@ -1,18 +1,19 @@
-From ecb62f3467f493cc0d679323f05367eebbf0fb67 Mon Sep 17 00:00:00 2001
+From 16aaa5ee8b42cf6f628f6ab75fedc738e4d167ca Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 1 Oct 2013 22:22:57 +0200
 Subject: [PATCH] aclocal: Add parameter to disable keyutils detection
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
- aclocal.m4 | 4 ++++
+ src/aclocal.m4 | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/aclocal.m4 b/aclocal.m4
-index 210c473..83b1f02 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -1650,11 +1650,15 @@ fi
+diff --git a/src/aclocal.m4 b/src/aclocal.m4
+index d6d1279..80ce604 100644
+--- a/src/aclocal.m4
++++ b/src/aclocal.m4
+@@ -1679,12 +1679,16 @@ fi
  dnl
  dnl If libkeyutils exists (on Linux) include it and use keyring ccache
  AC_DEFUN(KRB5_AC_KEYRING_CCACHE,[
@@ -28,6 +29,4 @@ index 210c473..83b1f02 100644
 +fi
  ])dnl
  dnl
--- 
-1.8.3.2
-
+ dnl If libkeyutils supports persistent keyrings, use them
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/crosscompile_nm.patch b/meta-oe/recipes-connectivity/krb5/krb5/crosscompile_nm.patch
index d3e6937515..ddca7090aa 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5/crosscompile_nm.patch
+++ b/meta-oe/recipes-connectivity/krb5/krb5/crosscompile_nm.patch
@@ -1,19 +1,24 @@
+From cbce5720435778296c71811101ac732a833525d6 Mon Sep 17 00:00:00 2001
+From: Amy Fong <amy.fong@windriver.com>
+Date: Sun, 28 Sep 2014 05:35:37 -0400
+Subject: [PATCH] krb5: update to version 1.12.2
+
 Modifies export-check.pl to use look for $ENV{'NM'} before
 defaulting to using 'nm'
 
 Upstream-Status: Pending
 
 Signed-off-by: Amy Fong <amy.fong@windriver.com>
----
 
- export-check.pl |    7 ++++++-
+---
+ src/util/export-check.pl | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
-Index: src/util/export-check.pl
-===================================================================
---- src.orig/util/export-check.pl
-+++ src/util/export-check.pl
-@@ -38,7 +38,12 @@
+diff --git a/src/util/export-check.pl b/src/util/export-check.pl
+index eaec7d6..21a2300 100755
+--- a/src/util/export-check.pl
++++ b/src/util/export-check.pl
+@@ -38,7 +38,12 @@ if ($#ARGV != 1) {
  my($exfile, $libfile) = @ARGV;
  
  @missing = ();
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/debian-suppress-usr-lib-in-krb5-config.patch b/meta-oe/recipes-connectivity/krb5/krb5/debian-suppress-usr-lib-in-krb5-config.patch
index f0182ee5db..de21ae0945 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5/debian-suppress-usr-lib-in-krb5-config.patch
+++ b/meta-oe/recipes-connectivity/krb5/krb5/debian-suppress-usr-lib-in-krb5-config.patch
@@ -1,3 +1,6 @@
+From 044be28e4de2cf6f47c719d1f8fbbfe46d1eac20 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Sun, 28 Sep 2014 05:35:37 -0400
 Subject: [PATCH] debian: suppress /usr/lib in krb5-config
 
 Upstream-Status: Pending
@@ -7,9 +10,10 @@ Handel multi-arch suppressions
 The patch is from debian.
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
- src/build-tools/krb5-config.in |   14 +++++++++-----
- 1 files changed, 9 insertions(+), 5 deletions(-)
+ src/build-tools/krb5-config.in | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
 
 diff --git a/src/build-tools/krb5-config.in b/src/build-tools/krb5-config.in
 index f6184da..637bad7 100755
@@ -43,6 +47,3 @@ index f6184da..637bad7 100755
      # Ugly gross hack for our build tree
      lib_flags=`echo $CC_LINK | sed -e 's/\$(CC)//' \
  	    -e 's/\$(PURE)//' \
--- 
-1.7.1
-
-- 
2.15.1


