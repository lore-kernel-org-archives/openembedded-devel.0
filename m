Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SFPXU-00078p-Vu
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 14:42:17 +0200
Received: by mail-gx0-f175.google.com with SMTP id y3so65910ggc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2012 05:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=XfHXSa1mdIwwOdOMI9XSjydGP3F0Vne4N/c2oxokZog=;
	b=yG/kkMoudiQHwEM9w+7TiAMFT3FkbTvSROj0X4HfubPiPkp2uLtw/U5CO6LuRZa6uY
	e5slE1h0KCoRTl+9OkfwvPjvatn4mZ5qdof37uVkKOPxdh7AXdJHSSboYlEeypJy1j4s
	UMC9Qrs8V11L/WRJoJI7yv2VzHPVQW9PdPrxRyFdcZGp8MckFzDMU2BYleL6d17n+gSX
	eBEHQ0baOCxv2tASGFHGR+/tJj3sdga5ll4KXmhFIohnQaIIawS2NoXmD6q52Ch24yMv
	GOEPouxOxOTic4FszwESXESeWZwsG1tGCSV0YIws5eP6xmyz9Zb9pTp5MHDb86/lRcvb
	uuWg==
Received: by 10.236.134.211 with SMTP id s59mr14543591yhi.131.1333542788615;
	Wed, 04 Apr 2012 05:33:08 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d25sm2044087yhe.4.2012.04.04.05.33.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Apr 2012 05:33:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Apr 2012 12:32:53 +0000
Message-Id: <5b082f1f7fb949976d047f7238283d83d2112331.1333542709.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1333542709.git.otavio@ossystems.com.br>
References: <cover.1333542709.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1333542709.git.otavio@ossystems.com.br>
References: <cover.1333542709.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 2/3] openmotif: add 2.3.3
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
X-List-Received-Date: Wed, 04 Apr 2012 12:42:17 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../openmotif/openmotif/configure.patch            |   15 ++++++++
 .../recipes-support/openmotif/openmotif_2.3.3.bb   |   38 ++++++++++++++++++++
 2 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/openmotif/openmotif/configure.patch
 create mode 100644 meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb

diff --git a/meta-oe/recipes-support/openmotif/openmotif/configure.patch b/meta-oe/recipes-support/openmotif/openmotif/configure.patch
new file mode 100644
index 0000000..8868e80
--- /dev/null
+++ b/meta-oe/recipes-support/openmotif/openmotif/configure.patch
@@ -0,0 +1,15 @@
+--- a/configure.ac~	2009-10-27 14:10:23.000000000 -0200
++++ b/configure.ac	2011-05-31 10:51:00.207232036 -0300
+@@ -3,12 +3,6 @@
+ AC_CONFIG_SRCDIR([lib/Xm/Form.c])
+ AC_PREREQ(2.52)
+ AC_CONFIG_AUX_DIR(.)
+-AC_CHECK_FILE(/usr/X/include/X11/X.h,
+-  AC_PREFIX_DEFAULT(/usr/X),
+-  AC_PREFIX_DEFAULT(/usr))
+-AC_CHECK_FILE(/usr/X11R6/include/X11/X.h,
+-  AC_PREFIX_DEFAULT(/usr/X11R6),
+-  AC_PREFIX_DEFAULT(/usr))
+ 
+ dnl AM_MAINTAINER_MODE
+ AC_CANONICAL_TARGET
diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
new file mode 100644
index 0000000..2e9c2de
--- /dev/null
+++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
@@ -0,0 +1,38 @@
+SECTION = "libs"
+DESCRIPTION = "OSM/Motif implementation."
+LICENSE = "OGPL"
+DEPENDS = "xbitmaps virtual/libx11 libxt libxp"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=14f692c82491db3d52419929d2f3b343"
+
+SRC_URI = "http://openmotif.com/files/public_downloads/openmotif/2.3/2.3.3/openmotif-2.3.3.tar.gz \
+           file://configure.patch;patch=1"
+
+SRC_URI[md5sum] = "fd27cd3369d6c7d5ef79eccba524f7be"
+SRC_URI[sha256sum] = "c85f5545e218fa0c59a3789192132d472fc5a33e914a221a568eee4fc10cd103"
+
+inherit autotools
+
+PACKAGES += "${PN}-bin"
+
+FILES_${PN}-bin = "${bindir}"
+
+do_compile() {
+	(
+		# HACK: build a native binaries need during the build
+		unset CC LD CXX CCLD CFLAGS
+		oe_runmake -C config/util CC="${BUILD_CC}" LD="${BUILD_LD}" CXX="${BUILD_CXX}" LIBS="" makestrs
+    )
+    if [ "$?" != "0" ]; then
+        exit 1
+    fi
+    oe_runmake -C lib
+    oe_runmake -C include
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} -C lib install
+    oe_runmake DESTDIR=${D} -C include install
+}
+
+LEAD_SONAME = "libXm.so.4"
-- 
1.7.2.5



