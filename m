Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B869277245
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 13:08:06 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o80so1306716wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7QEvN1AjTNlK1fkjau0pRzPJSwKM6SQRDbBNwrETpv0=;
	b=U5VU+L7PHzIIkz4t2fcUWoT7xHOs/MpahUtFBgYyNmtrSrIBDw6r7hpJk5ZDKiB71+
	EqNYArTjxt0+OzVDxTQsQeDHr1pkEer04QKg8b5HyZU8RNcoeVqYdBMdySCNY87R8Pog
	T6eMr3M+IuPLB8ym4h/GAj5gNmejO2L8apcMCtvfjqrJJ1d3l1PrVdfwBOs1yw218/4F
	Drp/GuIltvmnsZk6t+krPRofL8aU2PVi0KxrkT46wIsX3xY5mZeE2M1lPUuT+9beEWjM
	YwzlUzK0+UyIq5ezzd4jKTJies4X2i2SbEWSi9IaeGFuJLIW1OfBcyXK2pWqCoOEv97q
	Noow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7QEvN1AjTNlK1fkjau0pRzPJSwKM6SQRDbBNwrETpv0=;
	b=cCHVzOtzeVuyccgz6dh/XasJXp1Sh7u8pp8cQo/7Xjyzouv5rgRfCzVkeXzQ1Z2A6m
	MmETkwtdigIcIgXcAkn6EmNTNBhRNup8DDWpwQV+0Ster/jlLQePnhsKAKXxm+IyZjmU
	Or6HeK742VrNXRprpyW5bTuhHlcU1KP7RXlD8C0xFzSctSSwK5roIz7wMa7uT32r4Ta6
	quo3fXd7lVsyIHXbfleUV3270VYAGR6jykzC9Yd6GeQGOQoek53pizh3fz9V42tOb6c0
	mZU5jsyS4+Az0I2MzA/790nbEAebS1jCXxJP+TfadS0QayVdlcjzkafM8Y4vSX9pEev1
	nH2w==
X-Gm-Message-State: AEkoout5LG3G14Xji/0u79BKBRdKl4km6o9VJlp/Yn+ktXI6/UBXeStb4RBU7BpqNpGi2A==
X-Received: by 10.46.33.5 with SMTP id h5mr1613445ljh.43.1470920886747;
	Thu, 11 Aug 2016 06:08:06 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id f64sm106493lfi.36.2016.08.11.06.08.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Aug 2016 06:08:05 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Aug 2016 15:07:56 +0200
Message-Id: <1470920876-22501-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1470920876-22501-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1470920876-22501-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v3 2/2] glog: Update to version 0.3.4
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
X-List-Received-Date: Thu, 11 Aug 2016 13:08:07 -0000

-The repository has been moved to github.
-There is a new release 0.3.4
-Add a user configurable dependency on gflag
-Merge .inc file on the recipe

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 ...configure.ac-Allow-user-to-disable-gflags.patch | 35 ++++++++++++++++++++++
 meta-oe/recipes-support/glog/glog_0.3.3.bb         |  6 ----
 .../glog/{glog.inc => glog_0.3.4.bb}               | 15 ++++++++--
 3 files changed, 47 insertions(+), 9 deletions(-)
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
index 8a1fb4250bbb..27beef5f9a45 100644
--- a/meta-oe/recipes-support/glog/glog.inc
+++ b/meta-oe/recipes-support/glog/glog_0.3.4.bb
@@ -1,11 +1,20 @@
 DESCRIPTION = "The glog library implements application-level logging. This \
 library provides logging APIs based on C++-style streams and various helper \
 macros."
-HOMEPAGE = "https://code.google.com/p/google-glog/"
-
+HOMEPAGE = "https://github.com/google/glog"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
-
 DEPENDS = "libunwind"
 
+SRCREV = "d8cb47f77d1c31779f3ff890e1a5748483778d6a"
+SRC_URI = " \
+    git://github.com/google/glog.git \
+    file://0001-configure.ac-Allow-user-to-disable-gflags.patch \
+"
+
+S = "${WORKDIR}/git"
+
 inherit autotools pkgconfig
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gflags] = ",--without-gflags,gflags,"
-- 
2.8.1


