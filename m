Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id A047C6EAFE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:25 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so2621888eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=OeYWCzBk/aihGVDWJlbYOqhd2JDckbDModCjrf7mAT8=;
	b=Iplb2JzFPuybPOvfl/IywMhWp/+0ygoV1oWIJk40B5TevFvIy/Mpd+vJ90zOP1ncR+
	9E1iaUtdZpuPJpMAE5eZDoSvs1xuil9NRUwB6NzY0uagcsSp9J5K/5yjz+wOvHCzjex4
	JC3RdwXSh4xymLqzv3mNiByngLt9XTt1g8s8N2h98epcaVmGopHhLozNvf1UcpKGo5jC
	Q1z7ylATtPoBvBjs//8KYEXUOscZfjntDjk5im5Q21VYQ/Arg5wwY+dChjFfoE26+Hcq
	MiDSYgD+7KCGNGZdYPvDNqU2KL9choQJIvnoQ5O0AwzB3Zm/i5HIsbtK/qo6OjGUKYXy
	PXFw==
X-Received: by 10.14.32.67 with SMTP id n43mr29947908eea.17.1391240066403;
	Fri, 31 Jan 2014 23:34:26 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k41sm46123762eey.0.2014.01.31.23.34.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:04 +0100
Message-Id: <c027dd0a6536bf26f4bb0de2f427afa11c022c84.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 08/20] evas-generic-loaders: upgrade to 1.8.1
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:26 -0000

* package generic pdf loaders as well

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas-generic-loaders.inc  | 49 +++++++++++++++++++---
 .../recipes-efl/efl/evas-generic-loaders_1.7.9.bb  |  8 ----
 .../recipes-efl/efl/evas-generic-loaders_1.8.1.bb  |  8 ++++
 3 files changed, 52 insertions(+), 13 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.9.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.8.1.bb

diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
index 5b07557..904527c 100644
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Evas generic loaders"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=06568fc31423f3c8ad84f375e061c342"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f86abf15f4d911ae87092e90222d0ef3"
 DEPENDS = "eina poppler librsvg cairo"
 
 inherit efl
@@ -15,17 +15,56 @@ EXTRA_OECONF = " \
     --disable-spectre \
 "
 
-python populate_packages_prepend () {
+PACKAGESPLITFUNCS_prepend = "split_evas_loader_packages "
+
+python split_evas_loader_packages () {
     bb.note( "splitting packages for evas generic loaders" )
     basedir = d.expand( '${libdir}/evas/utils')
 
-    do_split_packages(d, basedir, '^evas_image_loader\.(.*)$',
+    do_split_packages(d, basedir, 'evas_image_loader\.(.*)$',
     output_pattern = "evas-generic-loader-%s",
     description = 'Evas generic loaders - module %s',
     allow_dirs=True, recursive=False, extra_depends="" )
+
+    do_split_packages(d, basedir, 'evas_generic_pdf_loader\.(.*)$',
+    output_pattern = "evas-generic-pdf-loader-%s",
+    description = 'Evas generic pdf loaders - module %s',
+    allow_dirs=True, recursive=False, extra_depends="" )
 }
 
-FILES_evas-generic-loader-xcf += "${libdir}/evas/utils/*.xcf.gz"
+# add symlinks for different format (it doesn't make much sense to package them in separate packages)
+FILES_evas-generic-loader-xcf += " \
+    ${libdir}/evas/utils/evas_image_loader.xcf.gz \
+"
+FILES_evas-generic-loader-svg += " \
+    ${libdir}/evas/utils/evas_image_loader.svg.gz \
+    ${libdir}/evas/utils/evas_image_loader.svgz \
+"
+FILES_evas-generic-loader-pdf += " \
+    ${libdir}/evas/utils/evas_image_loader.doc \
+    ${libdir}/evas/utils/evas_image_loader.docx \
+    ${libdir}/evas/utils/evas_image_loader.odp \
+    ${libdir}/evas/utils/evas_image_loader.ods \
+    ${libdir}/evas/utils/evas_image_loader.odt \
+    ${libdir}/evas/utils/evas_image_loader.ppt \
+    ${libdir}/evas/utils/evas_image_loader.pptx \
+    ${libdir}/evas/utils/evas_image_loader.rtf \
+    ${libdir}/evas/utils/evas_image_loader.xls \
+    ${libdir}/evas/utils/evas_image_loader.xlsx \
+"
+FILES_evas-generic-pdf-loader-libreoffice += " \
+    ${libdir}/evas/utils/evas_generic_pdf_loader.doc \
+    ${libdir}/evas/utils/evas_generic_pdf_loader.docx \
+    ${libdir}/evas/utils/evas_generic_pdf_loader.odp \
+    ${libdir}/evas/utils/evas_generic_pdf_loader.ods \
+    ${libdir}/evas/utils/evas_generic_pdf_loader.odt \
+    ${libdir}/evas/utils/evas_generic_pdf_loader.ppt \
+    ${libdir}/evas/utils/evas_generic_pdf_loader.pptx \
+    ${libdir}/evas/utils/evas_generic_pdf_loader.rtf \
+    ${libdir}/evas/utils/evas_generic_pdf_loader.xls \
+    ${libdir}/evas/utils/evas_generic_pdf_loader.xlsx \
+"
+
 FILES_${PN}-dbg += "${libdir}/evas/utils/.debug"
 
-PACKAGES_DYNAMIC += "^evas-generic-loader-.*"
+PACKAGES_DYNAMIC += "^evas-generic-loader-.* ^evas-generic-pdf-loader-.*"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.9.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.9.bb
deleted file mode 100644
index 45eea84..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.9.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "01bb7cf2c97014f087bbba4de237b3e8"
-SRC_URI[sha256sum] = "e163a97db7311cbc8489572f201c404929a52099b3156e54a9af2181f8389824"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.8.1.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.8.1.bb
new file mode 100644
index 0000000..21e57f9
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.8.1.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "2f39de031a236e53d251beefb4f6fcfd"
+SRC_URI[sha256sum] = "fa5d40324367b2e126853ba70f6522552fff9e80f6dd91566b2dacc4b0ffebc0"
-- 
1.8.5.3


