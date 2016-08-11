Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C2F2077207
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 11:14:49 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o80so738844wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FJNO33EYSY8+fFtuQSf7gWKL0Zee8GWbpF5mUwtOvlo=;
	b=a777p90Vb34++SblMquqn8WdNIZlMxsFAJlp3hWhAOKRigv5uPNHNyI6OkN4CiaVSa
	ETig7Eup9vJTOHZO+68dsbU2WloY5Y+6F4+a6Rxivn9JE8xlnDgY+soBTNAquNl4W26u
	ylwEDZwy3aRzJxIZMmkOYlCaO/+vsQQLnOFBfNshBSjDv1L6HckgBvutW+8PbgsNzOd/
	cQy/Tyy/2BCyf+mIcqIHZWJ1+GCWZNOB0kiLrm/j7SRGMVVZ1vKNomIxrEvDfnKgfqKA
	TQKoGAW+sh5u0OCVZOQtd23I4eIMMOnUXq7adpC2lJfZols2GLoh1tSuv2PBmtspcT8m
	S5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FJNO33EYSY8+fFtuQSf7gWKL0Zee8GWbpF5mUwtOvlo=;
	b=KEUl+/cGuZn0uHmniAharSU/PqDNHRiIWXzG86DOuOuMUu5/7C+30zJYAkyG4vjqPN
	acmu3pTgIjr0zaT26CF2ByTDPltijkVF2FlvEyfK8Vof470DKgUTfwyZNQvm0lxifX3D
	TD2fZz6ePIx8BEcpPenqzdzbjoMl+o0GWaQThMGyxjU3RW0D2MhsY1x2XoXeUF83ZfVC
	ttcChTH1N84HdQNDiA6G8BaqklmNhz9ZZw2Kq+duVctpAu4/2dnvJGfmJvZG1+hsvGmL
	fQelimM8f2X+2CAxvpElVf7rsdra7BBYqhgOQkeKnoMzyGmd/Y39CNIwBgizinEtpQDP
	kQ0g==
X-Gm-Message-State: AEkooutvt73yc4Rr0l0jDbi8VjHC8o0pA50sjPc+SvPiIuu/lYagnQI9Liz63GayK5Vuzg==
X-Received: by 10.25.15.84 with SMTP id e81mr1560749lfi.3.1470914089895;
	Thu, 11 Aug 2016 04:14:49 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id u2sm485002lja.16.2016.08.11.04.14.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Aug 2016 04:14:48 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Aug 2016 13:14:05 +0200
Message-Id: <1470914045-8059-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-oe][PATCH v2] glog: Update to version 0.3.4
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
X-List-Received-Date: Thu, 11 Aug 2016 11:14:51 -0000

-The repository has been moved to github.
-There is a new release 0.3.4
-Add a user configurable dependency on gflag
-Merge .inc file on the recipe

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 ...configure.ac-Allow-user-to-disable-gflags.patch | 35 ++++++++++++++++++++++
 meta-oe/recipes-support/glog/glog_0.3.3.bb         |  6 ----
 .../glog/{glog.inc => glog_0.3.4.bb}               | 15 ++++++++--
 3 files changed, 48 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-user-to-disable-gflags.patch
 delete mode 100644 meta-oe/recipes-support/glog/glog_0.3.3.bb
 rename meta-oe/recipes-support/glog/{glog.inc => glog_0.3.4.bb} (49%)

diff --git a/meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-user-to-disable-gflags.patch b/meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-user-to-disable-gflags.patch
new file mode 100644
index 000000000000..596281ff6842
--- /dev/null
+++ b/meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-user-to-disable-gflags.patch
@@ -0,0 +1,35 @@
+From 0fabde0515e180c53961c27346dd7a79cffa4c1f Mon Sep 17 00:00:00 2001
+From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Date: Thu, 11 Aug 2016 11:49:36 +0200
+Subject: [PATCH] configure.ac: Allow user to disable gflags
+
+Under some circumstances like cross-compilation, the user might not want
+to enable support for gflags.
+
+This patch allows support for --without-gflags
+
+Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+---
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7b4d21e7ae8a..eba5e5cda1ea 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -136,7 +136,11 @@ AC_ARG_WITH(gflags, AS_HELP_STRING[--with-gflags=GFLAGS_DIR],
+   CFLAGS="$CFLAGS $GFLAGS_CFLAGS"
+   LIBS="$LIBS $GFLAGS_LIBS"
+ )
+-AC_CHECK_LIB(gflags, main, ac_cv_have_libgflags=1, ac_cv_have_libgflags=0)
++if test x"$with_gflags" = x"no"; then
++  ac_cv_have_libgflags=0
++else
++  AC_CHECK_LIB(gflags, main, ac_cv_have_libgflags=1, ac_cv_have_libgflags=0)
++fi
+ if test x"$ac_cv_have_libgflags" = x"1"; then
+   AC_DEFINE(HAVE_LIB_GFLAGS, 1, [define if you have google gflags library])
+   if test x"$GFLAGS_LIBS" = x""; then
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/glog/glog_0.3.3.bb b/meta-oe/recipes-support/glog/glog_0.3.3.bb
deleted file mode 100644
index de3f0765dec9..000000000000
--- a/meta-oe/recipes-support/glog/glog_0.3.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require glog.inc
-
-SRC_URI = "http://google-glog.googlecode.com/files/glog-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "a6fd2c22f8996846e34c763422717c18"
-SRC_URI[sha256sum] = "fbf90c2285ba0561db7a40f8a4eefb9aa963e7d399bd450363e959929fe849d0"
diff --git a/meta-oe/recipes-support/glog/glog.inc b/meta-oe/recipes-support/glog/glog_0.3.4.bb
similarity index 49%
rename from meta-oe/recipes-support/glog/glog.inc
rename to meta-oe/recipes-support/glog/glog_0.3.4.bb
index 8a1fb4250bbb..87b27c1eda41 100644
--- a/meta-oe/recipes-support/glog/glog.inc
+++ b/meta-oe/recipes-support/glog/glog_0.3.4.bb
@@ -1,11 +1,22 @@
 DESCRIPTION = "The glog library implements application-level logging. This \
 library provides logging APIs based on C++-style streams and various helper \
 macros."
-HOMEPAGE = "https://code.google.com/p/google-glog/"
-
+HOMEPAGE = "https://github.com/google/glog"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
 
 DEPENDS = "libunwind"
 
+SRC_URI = "\
+	   git://github.com/google/glog.git \
+	   file://0001-configure.ac-Allow-user-to-disable-gflags.patch \
+	   "
+
+SRCREV = "d8cb47f77d1c31779f3ff890e1a5748483778d6a"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gflags] = ",--without-gflags,gflags,"
+
 inherit autotools pkgconfig
-- 
2.8.1


