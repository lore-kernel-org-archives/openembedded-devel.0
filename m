Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id F0E446BD87
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 23:11:41 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so552169eaj.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TCm4i+V15mzMXsam5KJNmoNl70AOJ/lPhgaCV9+DKGU=;
	b=e0ZZWe92xMcJTzgKZ1MxKof3QzShDhrgp+uGUs2xWxtLnaLVK1CeNE/GUtBFDH3+7K
	5IbJXus844VNchDNeguTIbOCwHoKlRG7QObKWUlrALoaRoEEiaB4ys1TW9BXC3d92fQ/
	W7JOng7hm8Ini9sjAFBeuWQTUogXfoE6CaDe2IlMKczgulqLtl3lkPz34+KQ9zTIdp4J
	2ErGkqUNC0o8Zl/GwcNfKvZjHDngpz8fr5vD0+giKlXMt6jGR91M6WElqke1gmd8yKlr
	uwJ7wtKeMJUwP5yGROH2Fudr3aqT+pOgdjcIOZSH2P5wizd5AvYA0ln9XSTlcVAEe9us
	gyQA==
X-Received: by 10.14.108.9 with SMTP id p9mr7544043eeg.8.1377817902436;
	Thu, 29 Aug 2013 16:11:42 -0700 (PDT)
Received: from mizar.localdomain
	(host202-221-dynamic.17-79-r.retail.telecomitalia.it.
	[79.17.221.202])
	by mx.google.com with ESMTPSA id a6sm49952754eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 16:11:41 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Aug 2013 01:11:30 +0200
Message-Id: <ceea9c54762207f2dff5a167b6f55ae3a289a87b.1377817383.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1377817383.git.andrea.adami@gmail.com>
References: <cover.1377817383.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1377817383.git.andrea.adami@gmail.com>
References: <cover.1377817383.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 2/3] klcc-cross_2.0.2: refactor recipe to respect exec_prefix
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
X-List-Received-Date: Thu, 29 Aug 2013 23:11:43 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-devtools/klibc/klcc-cross_2.0.2.bb     | 11 ++++------
 .../klibc/klibc-2.0.2/klcc_prefix.patch            | 24 ----------------------
 2 files changed, 4 insertions(+), 31 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klcc_prefix.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
index b30d165..17ae0c1 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
@@ -3,10 +3,7 @@ PR = "${INC_PR}.0"
 require klibc.inc
 SUMMARY = "The klcc crosscompiler for klibc"
 
-export KLCC_INST = "${STAGING_DIR_TARGET}/lib/klibc"
-
-SRC_URI += "file://klcc_prefix.patch \
-            file://use-env-for-perl.patch"
+SRC_URI += "file://use-env-for-perl.patch"
 
 DEPENDS = "klibc"
 
@@ -19,10 +16,10 @@ do_configure () {
 }
 
 do_compile() {
-    oe_runmake klcc
+    oe_runmake 'INSTALLDIR=${STAGING_DIR_TARGET}${target_libdir}/klibc' klcc
 }
 
 do_install() {
-    install -d ${D}${base_bindir}
-    install -m 0755 klcc/klcc ${D}${base_bindir}/${TARGET_PREFIX}klcc
+    install -d ${D}${bindir}
+    install -m 0755 klcc/klcc ${D}${bindir}/${TARGET_PREFIX}klcc
 }
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klcc_prefix.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klcc_prefix.patch
deleted file mode 100644
index a4a0026..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klcc_prefix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id a29bf15b9c9c0d15f96c254b2ed830e104ae3436
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
-Index: klibc-1.5.19/klcc/Kbuild
-===================================================================
---- --- klibc-1.5.19.orig/klcc/Kbuild	2010-07-07 14:07:48.000000000 +0200
-+++ --- klibc-1.5.19./klcc/Kbuild	2010-08-18 23:39:23.000000000 +0200
-@@ -22,10 +22,10 @@
- 	$(Q)echo 'EMAIN=$(KLIBCEMAIN)' >> $@
- 	$(Q)echo 'BITSIZE=$(KLIBCBITSIZE)' >> $@
- 	$(Q)echo 'VERSION=$(shell cat $(srctree)/usr/klibc/version)' >> $@
--	$(Q)echo 'prefix=$(INSTALLDIR)' >> $@
--	$(Q)echo 'bindir=$(INSTALLDIR)/$(KCROSS)bin' >> $@
--	$(Q)echo 'libdir=$(INSTALLDIR)/$(KCROSS)lib' >> $@
--	$(Q)echo 'includedir=$(INSTALLDIR)/$(KCROSS)include' >> $@
-+	$(Q)echo 'prefix=$(KLCC_INST)' >> $@
-+	$(Q)echo 'bindir=$(KLCC_INST)/$(KCROSS)bin' >> $@
-+	$(Q)echo 'libdir=$(KLCC_INST)/$(KCROSS)lib' >> $@
-+	$(Q)echo 'includedir=$(KLCC_INST)/$(KCROSS)include' >> $@
- 
- 
- # Generate klcc
-- 
1.8.1.5


