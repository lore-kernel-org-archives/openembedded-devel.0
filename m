Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oz2eN-0003U5-L6
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 09:24:56 +0200
Received: by pxi11 with SMTP id 11so745330pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 00:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=6BLNOS+Akm95RqYGSeH9mZOiiw8MFpsbAwpLT36/GvA=;
	b=lyr4GBHujH5Z3zx9aRT+CIupFmMYJre0pCquBQGdiet+HGMoef64mUzpm3Ph2C2tuN
	7GoYx1KoAy8+RhdjqwEPHok/FckZwNAew+CAc3AuEpoqfFwHkRgUZtRAcqiV7XbZ93Qv
	5DfMij/pE497i5IIIFVXjHNqnpAr7KOsROMh4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=QLfGE8355vFk8e6VVkSMKMn7IydamHGf3lsEKbDj8SEH339RXwPHSIQVpm+t31b8LG
	B9Ud3uGp5Fnfe1yfrLgTvBj6dwDybB8SabDUI6ROb7X2E4KJcfmeXloI9ImWEl3U1yst
	vytKOwL62BK/Gq0cSCVXyafRcrtVayt1HzuGw=
Received: by 10.142.246.7 with SMTP id t7mr2355421wfh.239.1285313087563;
	Fri, 24 Sep 2010 00:24:47 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id v3sm1914861wfv.11.2010.09.24.00.24.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 24 Sep 2010 00:24:46 -0700 (PDT)
Message-ID: <4C9C5238.1060207@gmail.com>
Date: Fri, 24 Sep 2010 16:54:40 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] imlib_1.9.15, qiv_1.9: move to obsolete.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Sep 2010 07:24:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Motivation for removal:
ERROR: QA Issue with staging: imlib.pc failed sanity test (tmpdir) in path /mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/lib/pkgconfig

This 3 year old qiv recipe is the only in tree user of imlib1. Newer
versions of qiv which use imlib2 are available from http://spiegl.de/qiv/

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/imlib/files/configure.patch          |   31 --------------------------
 recipes/imlib/imlib_1.9.15.bb                |   23 -------------------
 recipes/obsolete/imlib/files/configure.patch |   31 ++++++++++++++++++++++++++
 recipes/obsolete/imlib/imlib_1.9.15.bb       |   23 +++++++++++++++++++
 recipes/obsolete/qiv/files/makefile.patch    |   22 ++++++++++++++++++
 recipes/obsolete/qiv/qiv_1.9.bb              |   23 +++++++++++++++++++
 recipes/qiv/files/makefile.patch             |   22 ------------------
 recipes/qiv/qiv_1.9.bb                       |   23 -------------------
 8 files changed, 99 insertions(+), 99 deletions(-)
 delete mode 100644 recipes/imlib/files/configure.patch
 delete mode 100644 recipes/imlib/imlib_1.9.15.bb
 create mode 100644 recipes/obsolete/imlib/files/configure.patch
 create mode 100644 recipes/obsolete/imlib/imlib_1.9.15.bb
 create mode 100644 recipes/obsolete/qiv/files/makefile.patch
 create mode 100644 recipes/obsolete/qiv/qiv_1.9.bb
 delete mode 100644 recipes/qiv/files/makefile.patch
 delete mode 100644 recipes/qiv/qiv_1.9.bb

diff --git a/recipes/imlib/files/configure.patch b/recipes/imlib/files/configure.patch
deleted file mode 100644
index 90879c1..0000000
--- a/recipes/imlib/files/configure.patch
+++ /dev/null
@@ -1,31 +0,0 @@
---- /tmp/configure.in	2006-09-02 12:44:16.000000000 +0200
-+++ imlib-1.9.15/configure.in	2006-09-02 12:44:22.975780000 +0200
-@@ -43,19 +43,6 @@
-   oCFLAGS="$CFLAGS"
-   LIBS="$LIBS `glib-config --libs gmodule`"
-   CFLAGS="$CFLAGS `glib-config --cflags gmodule`"
--  AC_TRY_RUN([
--#include <glib.h>
--#include <gmodule.h>
--main ()
--{
--    if (g_module_supported ())
--        exit (0);
--    else
--        exit (1);
--}
--], dynworks=true)
--  LIBS="$oLIBS"
--  CFLAGS="$oCFLAGS"
- fi
- 
- dnl Now we check to see if our libtool supports shared lib deps
-@@ -141,7 +128,7 @@
- fi
- AC_SUBST(GX_LIBS)
- 
--CPPFLAGS="$CPPFLAGS -I$includedir -I$prefix/include"
-+CPPFLAGS="$CPPFLAGS"
- 
- SUPPORT_LIBS=""
- 
diff --git a/recipes/imlib/imlib_1.9.15.bb b/recipes/imlib/imlib_1.9.15.bb
deleted file mode 100644
index ee624d0..0000000
--- a/recipes/imlib/imlib_1.9.15.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Image loading library"
-LICENSE = "GPLv2"
-DEPENDS = "gtk+-1.2 jpeg tiff libpng libungif"
-
-inherit gnome binconfig
-
-SRC_URI += "file://configure.patch"
-
-EXTRA_OECONF = " --enable-modules \
-		 --disable-gtktest \
-		ac_cv_dynworks=true \
-		"
-
-do_stage() {
-	install -m 644 Imlib/*.h ${STAGING_INCDIR}
-	install -m 644 gdk_imlib/*.h ${STAGING_INCDIR}
-	oe_libinstall -a -so -C Imlib libImlib ${STAGING_LIBDIR}
-	oe_libinstall -a -so -C gdk_imlib libgdk_imlib ${STAGING_LIBDIR}
-}
-
-
-SRC_URI[archive.md5sum] = "7db987e6c52e4daf70d7d0f471238eae"
-SRC_URI[archive.sha256sum] = "4e6a270308a9ae16586bfc133c1a3dfb2e56f431edb66aaa3a80e36e5ed84ce0"
diff --git a/recipes/obsolete/imlib/files/configure.patch b/recipes/obsolete/imlib/files/configure.patch
new file mode 100644
index 0000000..90879c1
--- /dev/null
+++ b/recipes/obsolete/imlib/files/configure.patch
@@ -0,0 +1,31 @@
+--- /tmp/configure.in	2006-09-02 12:44:16.000000000 +0200
++++ imlib-1.9.15/configure.in	2006-09-02 12:44:22.975780000 +0200
+@@ -43,19 +43,6 @@
+   oCFLAGS="$CFLAGS"
+   LIBS="$LIBS `glib-config --libs gmodule`"
+   CFLAGS="$CFLAGS `glib-config --cflags gmodule`"
+-  AC_TRY_RUN([
+-#include <glib.h>
+-#include <gmodule.h>
+-main ()
+-{
+-    if (g_module_supported ())
+-        exit (0);
+-    else
+-        exit (1);
+-}
+-], dynworks=true)
+-  LIBS="$oLIBS"
+-  CFLAGS="$oCFLAGS"
+ fi
+ 
+ dnl Now we check to see if our libtool supports shared lib deps
+@@ -141,7 +128,7 @@
+ fi
+ AC_SUBST(GX_LIBS)
+ 
+-CPPFLAGS="$CPPFLAGS -I$includedir -I$prefix/include"
++CPPFLAGS="$CPPFLAGS"
+ 
+ SUPPORT_LIBS=""
+ 
diff --git a/recipes/obsolete/imlib/imlib_1.9.15.bb b/recipes/obsolete/imlib/imlib_1.9.15.bb
new file mode 100644
index 0000000..ee624d0
--- /dev/null
+++ b/recipes/obsolete/imlib/imlib_1.9.15.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Image loading library"
+LICENSE = "GPLv2"
+DEPENDS = "gtk+-1.2 jpeg tiff libpng libungif"
+
+inherit gnome binconfig
+
+SRC_URI += "file://configure.patch"
+
+EXTRA_OECONF = " --enable-modules \
+		 --disable-gtktest \
+		ac_cv_dynworks=true \
+		"
+
+do_stage() {
+	install -m 644 Imlib/*.h ${STAGING_INCDIR}
+	install -m 644 gdk_imlib/*.h ${STAGING_INCDIR}
+	oe_libinstall -a -so -C Imlib libImlib ${STAGING_LIBDIR}
+	oe_libinstall -a -so -C gdk_imlib libgdk_imlib ${STAGING_LIBDIR}
+}
+
+
+SRC_URI[archive.md5sum] = "7db987e6c52e4daf70d7d0f471238eae"
+SRC_URI[archive.sha256sum] = "4e6a270308a9ae16586bfc133c1a3dfb2e56f431edb66aaa3a80e36e5ed84ce0"
diff --git a/recipes/obsolete/qiv/files/makefile.patch b/recipes/obsolete/qiv/files/makefile.patch
new file mode 100644
index 0000000..42707be
--- /dev/null
+++ b/recipes/obsolete/qiv/files/makefile.patch
@@ -0,0 +1,22 @@
+--- /tmp/Makefile	2006-09-02 13:04:25.000000000 +0200
++++ qiv-1.9/Makefile	2006-09-02 13:05:05.255780000 +0200
+@@ -4,7 +4,7 @@
+ ######################################################################
+ 
+ # Directory where qiv will be installed under.
+-PREFIX = /usr/local
++PREFIX = /usr/
+ 
+ # Font to use for statusbar in fullscreen mode
+ STATUSBAR_FONT = "fixed"
+@@ -53,10 +53,6 @@
+ # Do not edit below here!
+ ######################################################################
+ 
+-CC        = gcc
+-CFLAGS    = -O2 -Wall -fomit-frame-pointer -finline-functions \
+-	    -fcaller-saves -ffast-math -fno-strength-reduce \
+-	    -fthread-jumps #-march=pentium #-DSTAT_MACROS_BROKEN
+ 
+ INCLUDES  = `imlib-config --cflags-gdk`
+ LIBS      = `imlib-config --libs-gdk`
diff --git a/recipes/obsolete/qiv/qiv_1.9.bb b/recipes/obsolete/qiv/qiv_1.9.bb
new file mode 100644
index 0000000..a1b63c6
--- /dev/null
+++ b/recipes/obsolete/qiv/qiv_1.9.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Qiv is a very small and pretty fast gdk/Imlib image viewer."
+LICENSE = "GPLv2"
+SECTION = "x11/graphics"
+DEPENDS = "gtk+-1.2 imlib"
+PR = "r1"
+
+SRC_URI = "http://www.klografx.net/qiv/download/qiv-1.9-src.tgz \
+		file://makefile.patch \
+		"
+inherit pkgconfig binconfig
+
+CFLAGS += " -lSM -lICE -lXdmcp"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -d ${D}${mandir}/man1/
+
+	install -s -m 0755 qiv ${D}${bindir}/qiv
+        install -m 0644 qiv.1 ${D}${mandir}/man1/qiv.1
+}
+
+SRC_URI[md5sum] = "b368e00543b2b1d9a87b37fd5ba60c57"
+SRC_URI[sha256sum] = "7ffeb0b90892d71eff4f26227962f5b306d52a55539f1cb2a72993c8252ca518"
diff --git a/recipes/qiv/files/makefile.patch b/recipes/qiv/files/makefile.patch
deleted file mode 100644
index 42707be..0000000
--- a/recipes/qiv/files/makefile.patch
+++ /dev/null
@@ -1,22 +0,0 @@
---- /tmp/Makefile	2006-09-02 13:04:25.000000000 +0200
-+++ qiv-1.9/Makefile	2006-09-02 13:05:05.255780000 +0200
-@@ -4,7 +4,7 @@
- ######################################################################
- 
- # Directory where qiv will be installed under.
--PREFIX = /usr/local
-+PREFIX = /usr/
- 
- # Font to use for statusbar in fullscreen mode
- STATUSBAR_FONT = "fixed"
-@@ -53,10 +53,6 @@
- # Do not edit below here!
- ######################################################################
- 
--CC        = gcc
--CFLAGS    = -O2 -Wall -fomit-frame-pointer -finline-functions \
--	    -fcaller-saves -ffast-math -fno-strength-reduce \
--	    -fthread-jumps #-march=pentium #-DSTAT_MACROS_BROKEN
- 
- INCLUDES  = `imlib-config --cflags-gdk`
- LIBS      = `imlib-config --libs-gdk`
diff --git a/recipes/qiv/qiv_1.9.bb b/recipes/qiv/qiv_1.9.bb
deleted file mode 100644
index a1b63c6..0000000
--- a/recipes/qiv/qiv_1.9.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Qiv is a very small and pretty fast gdk/Imlib image viewer."
-LICENSE = "GPLv2"
-SECTION = "x11/graphics"
-DEPENDS = "gtk+-1.2 imlib"
-PR = "r1"
-
-SRC_URI = "http://www.klografx.net/qiv/download/qiv-1.9-src.tgz \
-		file://makefile.patch \
-		"
-inherit pkgconfig binconfig
-
-CFLAGS += " -lSM -lICE -lXdmcp"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -d ${D}${mandir}/man1/
-
-	install -s -m 0755 qiv ${D}${bindir}/qiv
-        install -m 0644 qiv.1 ${D}${mandir}/man1/qiv.1
-}
-
-SRC_URI[md5sum] = "b368e00543b2b1d9a87b37fd5ba60c57"
-SRC_URI[sha256sum] = "7ffeb0b90892d71eff4f26227962f5b306d52a55539f1cb2a72993c8252ca518"
-- 
1.7.1



