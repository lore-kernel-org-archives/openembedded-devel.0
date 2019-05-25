Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11F677E4F2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 12:42:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4PCgCaM022457
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 05:42:22 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sat, 25 May 2019 05:42:01 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 25 May 2019 08:41:57 -0400
Message-ID: <20190525124158.184776-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190525124158.184776-1-kai.kang@windriver.com>
References: <20190525124158.184776-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 2/3] xfce4-screensaver: add recipe
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
X-List-Received-Date: Sat, 25 May 2019 12:42:32 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

xfce4-screensaver is a screen saver and locker which used by Xfce module
'actions' when click 'Lock Screen'.

* add a patch to fix configure QA issue for cross compile

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfce4-screensaver/fix-cross-compile.patch | 60 +++++++++++++++++++
 .../xfce4-screensaver_0.1.4.bb                | 19 ++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-cross-compile.patch
 create mode 100644 meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.4.bb

diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-cross-compile.patch b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-cross-compile.patch
new file mode 100644
index 000000000..f726064e2
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-cross-compile.patch
@@ -0,0 +1,60 @@
+It adds '-I$includedir' to CPPFLAGS and adds '-L$libdir' to LDFLAGS in
+configure.ac which causes 'configure-unsafe' QA error. Don't add them for cross
+compile to avoid the QA issues.
+
+Upstream-Status: Inappropriate [cross compile specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+diff --git a/configure.ac b/configure.ac
+index f0ec537..05c393d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -230,9 +230,9 @@ dnl ---------------------------------------------------------------------------
+ #
+ AC_DEFUN([AC_CHECK_X_HEADER], [
+   ac_save_CPPFLAGS="$CPPFLAGS"
+-  if test \! -z "$includedir" ; then
+-    CPPFLAGS="$CPPFLAGS -I$includedir"
+-  fi
++#  if test \! -z "$includedir" ; then
++#    CPPFLAGS="$CPPFLAGS -I$includedir"
++#  fi
+   CPPFLAGS="$CPPFLAGS $X_CFLAGS"
+   AC_CHECK_HEADER([$1],[$2],[$3],[$4])
+   CPPFLAGS="$ac_save_CPPFLAGS"])
+@@ -241,9 +241,9 @@ AC_DEFUN([AC_CHECK_X_HEADER], [
+ #
+ AC_DEFUN([AC_TRY_X_COMPILE], [
+   ac_save_CPPFLAGS="$CPPFLAGS"
+-  if test \! -z "$includedir" ; then
+-    CPPFLAGS="$CPPFLAGS -I$includedir"
+-  fi
++#  if test \! -z "$includedir" ; then
++#    CPPFLAGS="$CPPFLAGS -I$includedir"
++#  fi
+   CPPFLAGS="$CPPFLAGS $X_CFLAGS"
+   AC_TRY_COMPILE([$1], [$2], [$3], [$4])
+   CPPFLAGS="$ac_save_CPPFLAGS"])
+@@ -257,15 +257,15 @@ AC_DEFUN([AC_CHECK_X_LIB], [
+   ac_save_LDFLAGS="$LDFLAGS"
+ #  ac_save_LIBS="$LIBS"
+ 
+-  if test \! -z "$includedir" ; then
+-    CPPFLAGS="$CPPFLAGS -I$includedir"
+-  fi
++#  if test \! -z "$includedir" ; then
++#    CPPFLAGS="$CPPFLAGS -I$includedir"
++#  fi
+   # note: $X_CFLAGS includes $x_includes
+   CPPFLAGS="$CPPFLAGS $X_CFLAGS"
+ 
+-  if test \! -z "$libdir" ; then
+-    LDFLAGS="$LDFLAGS -L$libdir"
+-  fi
++#  if test \! -z "$libdir" ; then
++#    LDFLAGS="$LDFLAGS -L$libdir"
++#  fi
+   # note: $X_LIBS includes $x_libraries
+   LDFLAGS="$LDFLAGS $ALL_X_LIBS"
+ 
diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.4.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.4.bb
new file mode 100644
index 000000000..fb2be6609
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.4.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Xfce screensaver Application"
+DESCRIPTION = "Xfce screensaver is a screen saver and locker that aims to have simple, sane, secure defaults and be well integrated with the desktop."
+HOMEPAGE = "https://git.xfce.org/apps/xfce4-screensaver/about/"
+SECTION = "x11/application"
+
+LICENSE = "GPLv2+ & LGPLv2+ "
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
+                    "
+
+DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf"
+
+inherit xfce-app
+
+SRC_URI_append = " file://fix-cross-compile.patch"
+SRC_URI[md5sum] = "18a619849f85c24d784c7fa27279ca4b"
+SRC_URI[sha256sum] = "ed04ae32034b8e13a78495ca2bd7789a20ec7f67891ab9e92826a944371eabef"
+
+FILES_${PN} += "${datadir}/dbus-1 ${datadir}/desktop-directories"
-- 
2.20.0


