Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qe0-f47.google.com (mail-qe0-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id A3BB561222
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 00:31:29 +0000 (UTC)
Received: by mail-qe0-f47.google.com with SMTP id t7so4553361qeb.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 16:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=E6bqu9yekn3jhNEtDX18+e0AZmiDitmkppqYCvUdDrU=;
	b=IQ8B6Op7F+E5/++GINqTOQbYpTpm1wvPklp0nAOpsuKFkA7VKzZPHLyVTGxeOKwYRc
	TSmOlVBRIjwwLcYw7KMGL42PDjTU1oiBIlWirg1GbkJJ9WDVouAUJZKE+DS6/umSkvUH
	GRDH/GgKRwv+3Q7d5r00C2MFZRitstV7sinRw21Wfdfs98EBAV/aPqj2AJZRfzjqx3ib
	s3hZoEWlas96DOAmf0e329DyuWw7+ew5sKpCOAgBsLmbnt7ok1ToJrUkAj+a8IfhNHst
	+Zl5krqHaleb1zSXueaTSMDD40Ms49ZDx/h9L8zu0yCtG6rx92NqV0OC+Lg0KtOEk6hq
	IKmQ==
X-Received: by 10.49.34.207 with SMTP id b15mr10842488qej.49.1387240288571;
	Mon, 16 Dec 2013 16:31:28 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.90.230.254])
	by mx.google.com with ESMTPSA id lc1sm45375839qeb.5.2013.12.16.16.31.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Dec 2013 16:31:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 1EAB117643BAF; Mon, 16 Dec 2013 22:31:14 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Dec 2013 22:30:58 -0200
Message-Id: <1387240261-7045-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1387240261-7045-1-git-send-email-otavio@ossystems.com.br>
References: <1387240261-7045-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH v2 3/6] geos: Update to 3.4.2 and rework the packaging
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
X-List-Received-Date: Tue, 17 Dec 2013 00:31:29 -0000

This updates to the 3.4.2 release and rework the packaging splitting
the C bindings in another binary package to reduce footprint in
rootfs; this also moves geos-config to the development package as it
should.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2: None

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


