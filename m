Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id A47FB787F8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 17:03:07 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z12so5944585wrg.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 10:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fu9MZgZ6P1ZvOICjtG79wBCJNiAsZwG6Hou1Gp5omiY=;
	b=j1v81wRPoUmA5EIia+vO7mDWe0YSa2Rd2QrGoxZ7kX6u09Wan9fG948W3Fd64zv/+w
	f9TRdj/SBmlnKpMNIxD7rYWB+BdJ0wVsGVe4QTMFZ8dP0AlfQeiHIuD232pbZ6U07X/l
	fXjoiO+B1k9Kr74EymWSVtg55V+B2ujgITi6xunOQghfMYQTmMHPCxafqiNhQnrstbuG
	WTS4wMPGY5vQa4Fyds/LJBoHPPyKCedw1JI0E00L3Pn41FLmyYXgskGzuiWV08cz9syz
	rtO62ij0j7X2ZpUoEDF+6ATGfW2AAD3nuKHQki2J3vPnatHdZAfOGY8R7EmR6d62+XGA
	T/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fu9MZgZ6P1ZvOICjtG79wBCJNiAsZwG6Hou1Gp5omiY=;
	b=ZJ29uE5a/xdt/i1WiybmKXn3kXz/GK/x+dgE4v39sXvdZvl2ngeFabzj0vWz+2mb9C
	ZP4sYRIk7E6VU47PNAxev8XNqnIB2/aUOE4RwV8KTRf99jz5+Kmm0rNf5/WU2zEVyhO6
	ou1/fqBPrp0/jaHw7WH05CG69VNaQkcii4VWtapCTXxZiplNFxf9BxsYsYtfbDlEiBhL
	wT6lhAj0fGBkSv+zS2yy/9AbgMoacFRfzFpBipuRsXRWIb/1guZUMQBFZCOZ5KBXg0bf
	RGw5PSqa4HYL01CEBvVWLGxz6a5Dedw00Xynpsq9K9uFLJ2ik+GwgLifb+qKXxG99wUX
	yO9A==
X-Gm-Message-State: AElRT7FXO68TQy/sCUwQuD74oSwju2sdFmMHLRAzdpEnWYJqH6l/fift
	jFNCS0+X+Mqu+Ofc8qyYdCCHHQ==
X-Google-Smtp-Source: AG47ELuZKy1UaHCMjRoFohmxcwld9RtXr9c5YnjUgFIczz6HTBbKuBATTuToyX92hmRdH/0mjFlzEQ==
X-Received: by 10.223.172.226 with SMTP id o89mr5289789wrc.264.1521651788171; 
	Wed, 21 Mar 2018 10:03:08 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 95sm4599437wrb.47.2018.03.21.10.03.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Mar 2018 10:03:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 17:03:06 +0000
Message-Id: <20180321170306.5607-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <CA+chaQdJFduUSaZ=YqBczO9vkUcJpWjM42JUR=sfv2shcouS5g@mail.gmail.com>
References: <CA+chaQdJFduUSaZ=YqBczO9vkUcJpWjM42JUR=sfv2shcouS5g@mail.gmail.com>
Subject: [meta-oe][PATCHv2 1/4] krb5: refresh patches
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
X-List-Received-Date: Wed, 21 Mar 2018 17:03:07 -0000

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
 meta-oe/recipes-connectivity/krb5/krb5_1.16.bb        |  6 +++---
 4 files changed, 30 insertions(+), 25 deletions(-)

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
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
index 80bc8afe94..f8eb0ec50b 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
@@ -21,9 +21,9 @@ inherit autotools-brokensep binconfig perlnative systemd update-rc.d
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
-           file://0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch \
-           file://debian-suppress-usr-lib-in-krb5-config.patch;striplevel=2 \
-           file://crosscompile_nm.patch \
+           file://0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch;patchdir=..\
+           file://debian-suppress-usr-lib-in-krb5-config.patch;patchdir=.. \
+           file://crosscompile_nm.patch;patchdir=.. \
            file://etc/init.d/krb5-kdc \
            file://etc/init.d/krb5-admin-server \
            file://etc/default/krb5-kdc \
-- 
2.15.1


