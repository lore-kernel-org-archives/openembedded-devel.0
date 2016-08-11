Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 934DD77196
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 10:10:56 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q128so428862wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 03:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T/yOWgEFdhONmS9Ypu2GqgwVhM3QO8YqyyXxHdMXR+o=;
	b=MuPz1nivRgruXAGrX9/loSWAf72RzBJGwpW5jeHvD7RquLJ7V6feRPJBlIkmgzXesp
	T75veSN6eKoDXOO2hYtPQ7mieoDlvWsSuu7Dn4iuIBJ7zWbJr0BDdpO3Zzhd9m22RDCb
	6kDgn0bqHZkSwlHIzRD94BgD5ar1RM92Y7EkPW7Wy1kTdUvpMz9L6Q89iuB+viy/+uKz
	UCT/piJLyrH73551rvGFXTdAaEV3JZY0SFQoLQ0vVRHRK8VYAADgpqCiwAf94mP3Fgq+
	ycJcv/n7forAwkawkKYyVuZeHrKY+c2NGCHawozhYalgBL5EXZQbeQ0GXRGQ43xaQiQk
	eUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T/yOWgEFdhONmS9Ypu2GqgwVhM3QO8YqyyXxHdMXR+o=;
	b=P9tqUtT8y4SyET29RBc0p7JJSc5aeaImWI3vgPEC85HfsbznLwXU1ePs0m6F9R2l+X
	Is17/esSvjEB9KzSrTQOKfSJWx8nkq3m3iPyMpkt800H1If/WIcFmsupnpTX5ySmh9SB
	cXUaQB0qbpHEY0Qa5JUepBBSXr/5vyaFIsa0B7lQuE/kXIcWvhfbdqUfYH/4N9nR8ETg
	Gm7uWXAc3weLrFMG1cW0qPAnaTl2oP+2J2xS9k4lr8BkK+wawG2CtWelaXcYk5aUXFjP
	Y/+iTnrekDWdJO3D6ftRwDdf/XtEhtQ6sUz1o3I6Yzvo3B4RJS4u+rjjocsrMtftt8Sh
	6ZuQ==
X-Gm-Message-State: AEkoouu9KjgK+zt2N8yyPwU41mjoFh/W7c8l9IuKg+GZlJ451WFJbukI7MBbJIx/J+Nugg==
X-Received: by 10.25.29.85 with SMTP id d82mr1361811lfd.60.1470910256674;
	Thu, 11 Aug 2016 03:10:56 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id a15sm437793lfb.34.2016.08.11.03.10.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Aug 2016 03:10:55 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Aug 2016 12:10:46 +0200
Message-Id: <1470910246-952-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1470910246-952-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1470910246-952-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 2/2] glog: Update to version 0.3.4
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
X-List-Received-Date: Thu, 11 Aug 2016 10:10:56 -0000

-The repository has been moved to github.
-There is a new release 0.3.4
-Add a user configurable dependency on gflag
-Merge .inc file on the recipe

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/glog/glog.inc              | 11 -------
 ...configure.ac-Allow-user-to-disable-gflags.patch | 35 ++++++++++++++++++++++
 meta-oe/recipes-support/glog/glog_0.3.3.bb         |  6 ----
 meta-oe/recipes-support/glog/glog_0.3.4.bb         | 22 ++++++++++++++
 4 files changed, 57 insertions(+), 17 deletions(-)
 delete mode 100644 meta-oe/recipes-support/glog/glog.inc
 create mode 100644 meta-oe/recipes-support/glog/glog/0001-configure.ac-Allow-user-to-disable-gflags.patch
 delete mode 100644 meta-oe/recipes-support/glog/glog_0.3.3.bb
 create mode 100644 meta-oe/recipes-support/glog/glog_0.3.4.bb

diff --git a/meta-oe/recipes-support/glog/glog.inc b/meta-oe/recipes-support/glog/glog.inc
deleted file mode 100644
index 8a1fb4250bbb..000000000000
--- a/meta-oe/recipes-support/glog/glog.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "The glog library implements application-level logging. This \
-library provides logging APIs based on C++-style streams and various helper \
-macros."
-HOMEPAGE = "https://code.google.com/p/google-glog/"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
-
-DEPENDS = "libunwind"
-
-inherit autotools pkgconfig
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
diff --git a/meta-oe/recipes-support/glog/glog_0.3.4.bb b/meta-oe/recipes-support/glog/glog_0.3.4.bb
new file mode 100644
index 000000000000..6d91ae941ac3
--- /dev/null
+++ b/meta-oe/recipes-support/glog/glog_0.3.4.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "The glog library implements application-level logging. This \
+library provides logging APIs based on C++-style streams and various helper \
+macros."
+HOMEPAGE = "https://github.com/google/glog"
+
+SRC_URI = "\
+	   https://github.com/google/glog/archive/v${PV}.tar.gz \
+	   file://0001-configure.ac-Allow-user-to-disable-gflags.patch \
+	   "
+
+SRC_URI[md5sum] = "df92e05c9d02504fb96674bc776a41cb"
+SRC_URI[sha256sum] = "ce99d58dce74458f7656a68935d7a0c048fa7b4626566a71b7f4e545920ceb10"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
+
+DEPENDS = "libunwind"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gflags] = ",--without-gflags,gflags,"
+
+inherit autotools pkgconfig
-- 
2.8.1


