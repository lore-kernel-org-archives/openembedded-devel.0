Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id B3B1071723
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:27 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id l18so469809wgh.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=SKvh187gxXXodd+4MsZuoxt6bjHSdbEuXgz8xULsJiw=;
	b=cfkn/vHUwuMAbouryD3GugstteNf00AfvkFpYB1O06Tx2u8pTdE7iLnBAiiu4s+5FK
	Avojd8/Oq+JneuI6YFe2hhdBa5hT+AUCdiJePIw0J3YqMfO+LUoMqb7cBiUAvgvo957m
	+kwqeqlXWLxyZEPEWO0K7VRcq7JO+uFK2A/1AQkpKJIAUz7K5LPbadKm0PuUhCeo98tE
	WjPwgQeUb9l5jGfqF23F8cExaJBkfb8CwidehVm2JA2arStdT2ADUh3p3ZxMj7ONJNVE
	dCLL5M2zlEADgKMa6ROFErHoPk0JWDOT01fhGIaMRFZgFOIR7WyZdY8OHJeckUO+WqQW
	gr1g==
X-Received: by 10.194.58.229 with SMTP id u5mr1515370wjq.133.1412151568527;
	Wed, 01 Oct 2014 01:19:28 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:05 +0200
Message-Id: <1412151555-19865-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 05/15] tumbler: update to 0.1.30
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
X-List-Received-Date: Wed, 01 Oct 2014 08:19:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* find freetype2 by packageconfig -> get out of blacklist
* inherit gtk-doc to avoid
| gtk-doc.make:7: error: GTK_DOC_USE_LIBTOOL does not appear in AM_CONDITIONAL
| docs/reference/tumbler/Makefile.am:84:   'gtk-doc.make' included from here
| gtk-doc.make:59: error: GTK_DOC_BUILD_HTML does not appear in AM_CONDITIONAL
| docs/reference/tumbler/Makefile.am:84:   'gtk-doc.make' included from here
| gtk-doc.make:64: error: GTK_DOC_BUILD_PDF does not appear in AM_CONDITIONAL
| docs/reference/tumbler/Makefile.am:84:   'gtk-doc.make' included from here
| gtk-doc.make:73: error: ENABLE_GTK_DOC does not appear in AM_CONDITIONAL
| docs/reference/tumbler/Makefile.am:84:   'gtk-doc.make' included from here
| gtk-doc.make:294: error: HAVE_GTK_DOC does not appear in AM_CONDITIONAL
| docs/reference/tumbler/Makefile.am:84:   'gtk-doc.make' included from here
| tumblerd/Makefile.am:93: warning: '%'-style pattern rules are a GNU make extension
| autoreconf: automake failed with exit status: 1

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...01-configure-use-pkg-config-for-freetype2.patch | 45 ++++++++++++++++++++++
 .../{tumbler_0.1.29.bb => tumbler_0.1.30.bb}       |  9 ++---
 2 files changed, 49 insertions(+), 5 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/tumbler/tumbler/0001-configure-use-pkg-config-for-freetype2.patch
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.29.bb => tumbler_0.1.30.bb} (81%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler/0001-configure-use-pkg-config-for-freetype2.patch b/meta-xfce/recipes-xfce/tumbler/tumbler/0001-configure-use-pkg-config-for-freetype2.patch
new file mode 100644
index 0000000..5ecc35e
--- /dev/null
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler/0001-configure-use-pkg-config-for-freetype2.patch
@@ -0,0 +1,45 @@
+From f5c283b1251ad005da7342e654cd2ec5ae9e5fb2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 26 Sep 2014 13:44:36 +0200
+Subject: [PATCH] configure: use pkg-config for freetype2
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ acinclude.m4 | 16 +---------------
+ 1 file changed, 1 insertion(+), 15 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 66e79d1..4c70b00 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -52,21 +52,7 @@ if test x"$ac_tumbler_font_thumbnailer" = x"yes"; then
+   PKG_CHECK_MODULES([GDK_PIXBUF], [gdk-pixbuf-2.0 >= 2.14], 
+   [
+     dnl Check for FreeType 2.x
+-    FREETYPE_LIBS=""
+-    FREETYPE_CFLAGS=""
+-    AC_PATH_PROG([FREETYPE_CONFIG], [freetype-config], [no])
+-    if test x"$FREETYPE_CONFIG" != x"no"; then
+-      AC_MSG_CHECKING([FREETYPE_CFLAGS])
+-      FREETYPE_CFLAGS="`$FREETYPE_CONFIG --cflags`"
+-      AC_MSG_RESULT([$FREETYPE_CFLAGS])
+-    
+-      AC_MSG_CHECKING([FREETYPE_LIBS])
+-      FREETYPE_LIBS="`$FREETYPE_CONFIG --libs`"
+-      AC_MSG_RESULT([$FREETYPE_LIBS])
+-    else
+-      dnl We can only build the font thumbnailer if FreeType 2.x is available
+-      ac_tumbler_font_thumbnailer=no
+-    fi
++    PKG_CHECK_MODULES(FREETYPE, freetype2, , [ac_tumbler_font_thumbnailer=no])
+     AC_SUBST([FREETYPE_CFLAGS])
+     AC_SUBST([FREETYPE_LIBS])
+   ], [ac_tumbler_font_thumbnailer=no])
+-- 
+1.8.3.1
+
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb
similarity index 81%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb
index ed986c2..8651d00 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb
@@ -4,12 +4,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "dbus-glib freetype gdk-pixbuf poppler curl xfce4-dev-tools-native"
 
-inherit xfce
+inherit xfce gtk-doc
 
-PNBLACKLIST[tumbler] = "BROKEN: needs to be updated to use freetype2 pkg-config instead of freetype2-config"
-
-SRC_URI[md5sum] = "f844215c5e3918eae58abdd85f146780"
-SRC_URI[sha256sum] = "c3bac4ee609e22be6c7f01a4fdf6086bc6b57940d82f99570a2d9d547a32fc93"
+SRC_URI[md5sum] = "2524e39439c13238565160da0b6fed2d"
+SRC_URI[sha256sum] = "e7c20d79c830465f8b3b792893f05e8b8d5ba90aec4973e7517e07ef31537304"
+SRC_URI += "file://0001-configure-use-pkg-config-for-freetype2.patch"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-- 
1.8.3.1


