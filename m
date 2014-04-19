Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3EFA065D18
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 08:58:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3J8w1lo017791
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 01:58:02 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sat, 19 Apr 2014 01:58:01 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 19 Apr 2014 04:57:59 -0400
Message-ID: <1397897879-31925-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gnome-themes: enables the path to the icon-name-mapping to be specified
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Apr 2014 08:58:04 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Ported a patch from sato-icon-theme which enables the path to the
icon-name-mapping tool to be specified to fix the build failure:
configure: error: icon-naming-utils >= 0.8.7 is required to build and install gnome-themes

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../themes/gnome-themes/iconpath-option.patch      |   52 ++++++++++++++++++++
 .../recipes-gnome/themes/gnome-themes_2.32.1.bb    |   10 ++--
 2 files changed, 56 insertions(+), 6 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option.patch

diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option.patch b/meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option.patch
new file mode 100644
index 0000000..1b4096d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option.patch
@@ -0,0 +1,52 @@
+
+The patch is ported from sato-icon-theme.
+
+pkg-config will only search the target sysroot and we want the native script. This 
+patch adds an option to allow the path to the tool to be specified.
+
+Upstream-Status: Pending
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.in |   26 ++++++++++++++++----------
+ 1 file changed, 16 insertions(+), 10 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 5f7a18c..e8fc31e 100644
+--- a/configure.in
++++ b/configure.in
+@@ -74,16 +74,22 @@ AC_ARG_ENABLE([icon-mapping],
+ ICONMAP="true"
+ if test "x$enable_mapping" != "xno"; then
+    UTILS_REQUIRED=0.8.7
+-
+-   AC_MSG_CHECKING([icon-naming-utils >= $UTILS_REQUIRED])
+-   PKG_CHECK_EXISTS(icon-naming-utils >= $UTILS_REQUIRED, have_utils=yes, have_utils=no)
+-   if test "x$have_utils" = "xyes"; then
+-      UTILS_PATH="`$PKG_CONFIG --variable=program_path icon-naming-utils`"
+-      ICONMAP="$UTILS_PATH/icon-name-mapping"
+-      AC_MSG_RESULT([yes])
+-   else
+-	AC_MSG_RESULT([no])
+-   	AC_MSG_ERROR([icon-naming-utils >= $UTILS_REQUIRED is required to build and install gnome-themes])
++   PKG_PROG_PKG_CONFIG()
++   AC_ARG_WITH(iconmap,
++   	    AC_HELP_STRING([--with-iconmap=<dir>], [The location of the icon-name-mapping script to use]),
++   	    ICONMAP=$withval, ICONMAP="")
++   if test "x$ICONMAP" = "x"; then
++      AC_MSG_CHECKING([icon-naming-utils >= $UTILS_REQUIRED])
++      PKG_CHECK_EXISTS(icon-naming-utils >= $UTILS_REQUIRED, have_utils=yes, have_utils=no)
++      if test "x$have_utils" = "xyes"; then
++         UTILS_PATH="`$PKG_CONFIG --variable=program_path icon-naming-utils`"
++         ICONMAP="$UTILS_PATH/icon-name-mapping"
++
++         AC_MSG_RESULT([yes])
++      else
++         AC_MSG_RESULT([no])
++         AC_MSG_ERROR([icon-naming-utils >= $UTILS_REQUIRED is required to build and install gnome-themes"])
++      fi
+    fi
+ fi
+ AC_SUBST(ICONMAP)
+-- 
+1.7.9.5
+
diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index 864c953..6226e7c 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -8,14 +8,12 @@ SECTION = "x11/gnome"
 DEPENDS = "gtk-engines icon-naming-utils icon-naming-utils-native glib-2.0 intltool-native libxml-simple-perl-native"
 RDEPENDS_${PN} = "gnome-icon-theme"
 
-EXTRA_OECONF += "--enable-all-themes --disable-hicolor-check"
+EXTRA_OECONF += "--enable-all-themes --disable-hicolor-check \
+    --with-iconmap=${STAGING_LIBDIR_NATIVE}/icon-naming-utils/icon-name-mapping \
+"
 
 inherit gnome perlnative
 
-do_configure_prepend() {
-    sed -i -e 's:`$PKG_CONFIG --variable=program_path icon-naming-utils`:${STAGING_DIR_NATIVE}${libdir}/icon-naming-utils:g' configure.in
-}
-
 PACKAGES =+ " gnome-theme-crux gnome-theme-highcontrast gnome-theme-highcontrastinverse gnome-theme-highcontrastlargeprint gnome-theme-highcontrastlargeprintinverse gnome-theme-largeprint gnome-theme-mist"
 FILES_gnome-theme-crux = "${datadir}/themes/Crux ${datadir}/icons/Crux"
 FILES_gnome-theme-highcontrast = "${datadir}/themes/HighContrast ${datadir}/icons/HighContrast"
@@ -27,6 +25,6 @@ FILES_gnome-theme-mist = "${datadir}/themes/Mist ${datadir}/icons/Mist"
 
 FILES_${PN} += "${datadir}/themes ${datadir}/icons"
 
+SRC_URI += "file://iconpath-option.patch" 
 SRC_URI[archive.md5sum] = "41db9e3cb25d35af2675c599e67944d1"
 SRC_URI[archive.sha256sum] = "8601ee24c2e096593221cbd6ebdb6686042225a03c02a01c0d67c163f9febd1a"
-
-- 
1.7.9.5


