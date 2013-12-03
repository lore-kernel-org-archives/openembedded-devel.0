Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id EEF426DDF4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2013 21:44:22 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id i72so10678070yha.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Dec 2013 13:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=KpLKsgJjyJrf/+G2MMA6PG4OsS1PkcVBu+xP5+K5cK0=;
	b=gm6271M6XJdbQLyrqnqnAo8DJVvcWaqbNzyS9wK0CPYdyLWQIGTyA7/IXNI1RXZtVv
	GTBjunIzxAlqwlLcnGAapjHek1SanmnJqihTuJ5N6jviRipgxRblD2zB+1UWkVtdg94u
	WdxM1d8V1TC93beP5VbEsOGRZINLd8foeTeCNik+4VNB2A0qeXkk1ifY/jrkGVt42pQ2
	WFz+p+am4doU2XrnEeyDFnTs5Xi/V3O+GwVYx9IVqfjuXnDWGsmv9v6piHdFlad2zTv5
	w+sBxDkB2vgw32hyX+OzkEiANECIjxCKgtjStHNtXj2O9BtmYVVGvSMDghGUaB1/1RYN
	WMEg==
X-Received: by 10.236.117.103 with SMTP id i67mr50490281yhh.7.1386107062450;
	Tue, 03 Dec 2013 13:44:22 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	v45sm136308718yha.2.2013.12.03.13.44.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Dec 2013 13:44:21 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 1693E175EF895; Tue,  3 Dec 2013 19:44:16 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue,  3 Dec 2013 19:44:05 -0200
Message-Id: <1386107047-27409-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
References: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe 3/5] geos: Update to 3.4.2 and rework the packaging
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
X-List-Received-Date: Tue, 03 Dec 2013 21:44:23 -0000

This updates to the 3.4.2 release and rework the packaging splitting
the C bindings in another binary package to reduce footprint in
rootfs; this also moves geos-config to the development package as it
should.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../geos-config-Add-includedir-variable.patch      | 39 ++++++++++++++++++++++
 meta-oe/recipes-navigation/geos/geos.inc           | 19 +++++------
 meta-oe/recipes-navigation/geos/geos_3.3.2.bb      |  7 ----
 meta-oe/recipes-navigation/geos/geos_3.4.2.bb      |  6 ++++
 4 files changed, 53 insertions(+), 18 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-variable.patch
 delete mode 100644 meta-oe/recipes-navigation/geos/geos_3.3.2.bb
 create mode 100644 meta-oe/recipes-navigation/geos/geos_3.4.2.bb

diff --git a/meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-variable.patch b/meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-variable.patch
new file mode 100644
index 0000000..645e6f6
--- /dev/null
+++ b/meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-variable.patch
@@ -0,0 +1,39 @@
+From 9d51027c228dafd7db2d0cffca1f0fc695e950fd Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Mon, 2 Dec 2013 11:33:26 -0200
+Subject: [PATCH] geos-config: Add includedir variable
+
+This fixes cross-compile as it is easier to mangle the includedir
+during sysroot generation.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ tools/geos-config.in |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/geos-config.in b/tools/geos-config.in
+index 9b45b5f..1749892 100644
+--- a/tools/geos-config.in
++++ b/tools/geos-config.in
+@@ -1,6 +1,7 @@
+ #!/bin/sh
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
++includedir=@includedir@
+ libdir=@libdir@
+ 
+ usage()
+@@ -38,7 +39,7 @@ case $1 in
+     echo @VERSION@
+      ;;
+     --cflags)
+-    echo -I${prefix}/include 
++    echo -I${includedir}
+       ;;
+     --libs)
+       # TODO: make an alias for --clibs
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-navigation/geos/geos.inc b/meta-oe/recipes-navigation/geos/geos.inc
index e0c82bc..5fae12e 100644
--- a/meta-oe/recipes-navigation/geos/geos.inc
+++ b/meta-oe/recipes-navigation/geos/geos.inc
@@ -2,20 +2,17 @@ DESCRIPTION = "GEOS - Geometry Engine, Open Source"
 HOMEPAGE = "http://trac.osgeo.org/geos/"
 SECTION = "libs"
 
-INC_PR = "r1"
-
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "http://download.osgeo.org/geos/geos-${PV}.tar.bz2"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig binconfig
+
+PACKAGES =+ "geoslib ${PN}-c1"
+
+DESCRIPTION_${PN}lib = "Geometry engine for Geographic Information Systems - C++ Library"
+FILES_${PN}lib += "${libdir}/libgeos-${PV}.so"
 
-# libgeos-${PV}.so is needed in PV
-FILES_SOLIBSDEV = ""
-FILES_${PN}-dev = "${libdir}/*.la \
-                   ${libdir}/libgeos.so \
-                   ${libdir}/libgeos_c.so \
-                   ${includedir}"
-FILES_${PN} += " ${libdir}/libgeos-${PV}.so"
-INSANE_SKIP_${PN} = "dev-so"
+DESCRIPTION_${PN}-c1 = "Geometry engine for Geographic Information Systems - C Library"
+FILES_${PN}-c1 += "${libdir}/libgeos_c.so.*"
diff --git a/meta-oe/recipes-navigation/geos/geos_3.3.2.bb b/meta-oe/recipes-navigation/geos/geos_3.3.2.bb
deleted file mode 100644
index e57ca6b..0000000
--- a/meta-oe/recipes-navigation/geos/geos_3.3.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require geos.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "5b7270c73fd1c516f368af8fd1962323"
-SRC_URI[sha256sum] = "ec64d3a92540a1618aa3b91dc1235caae1c370ec23afd59a2734062bf182ed5b"
-
diff --git a/meta-oe/recipes-navigation/geos/geos_3.4.2.bb b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
new file mode 100644
index 0000000..3a9a028
--- /dev/null
+++ b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
@@ -0,0 +1,6 @@
+require geos.inc
+
+SRC_URI += "file://geos-config-Add-includedir-variable.patch"
+
+SRC_URI[md5sum] = "fc5df2d926eb7e67f988a43a92683bae"
+SRC_URI[sha256sum] = "15e8bfdf7e29087a957b56ac543ea9a80321481cef4d4f63a7b268953ad26c53"
-- 
1.8.4.3


