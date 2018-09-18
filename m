Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 5AEEE79605
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 08:35:58 +0000 (UTC)
Received: from heron.blarg.de (p3EE2FF12.dip0.t-ipconnect.de [62.226.255.18])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 5DC412208A0;
	Tue, 18 Sep 2018 10:26:15 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 10:26:07 +0200
Message-Id: <20180918082608.1088-8-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180918082608.1088-1-max+openembedded@blarg.de>
References: <20180918082608.1088-1-max+openembedded@blarg.de>
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 8/8] [meta-oe] libblockdev: make various features optional
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
X-List-Received-Date: Tue, 18 Sep 2018 08:35:58 -0000

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../libblockdev/libblockdev_2.18.bb                | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
index bf33b968e..021f64142 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
@@ -10,12 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
 inherit autotools python3native gobject-introspection
 
-DEPENDS += " \
-    cryptsetup \
-    libbytesize \
-    btrfs-tools \
-"
-
 SRCREV = "0debeb45562ac3d8f6f43f6f942b238abab55be9"
 SRC_URI = " \
     git://github.com/rhinstaller/libblockdev;branch=master \
@@ -25,7 +19,7 @@ S = "${WORKDIR}/git"
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
 
-PACKAGECONFIG ??= "python3 lvm dm kmod parted fs escrow"
+PACKAGECONFIG ??= "python3 lvm dm kmod parted fs escrow btrfs crypto mdraid kbd lvm-dbus"
 PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
 PACKAGECONFIG[python2] = "--with-python2, --without-python2,,python2"
 PACKAGECONFIG[lvm] = "--with-lvm, --without-lvm, multipath-tools, lvm2"
@@ -39,6 +33,12 @@ PACKAGECONFIG[doc] = "--with-gtk-doc, --without-gtk-doc, gtk-doc-native"
 PACKAGECONFIG[nvdimm] = "--with-nvdimm, --without-nvdimm"
 PACKAGECONFIG[vdo] = "--with-vdo, --without-vdo"
 PACKAGECONFIG[escrow] = "--with-escrow, --without-escrow, nss volume-key"
+PACKAGECONFIG[btrfs] = "--with-btrfs,--without-btrfs,libbytesize btrfs-tools"
+PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,cryptsetup nss volume-key"
+PACKAGECONFIG[mdraid] = "--with-mdraid,--without-mdraid,libbytesize"
+PACKAGECONFIG[kbd] = "--with-kbd,--without-kbd,libbytesize"
+PACKAGECONFIG[lvm-dbus] = "--with-lvm_dbus,--without-lvm_dbus"
+PACKAGECONFIG[mpath] = "--with-mpath,--without-mpath"
 
 export GIR_EXTRA_LIBS_PATH="${B}/src/utils/.libs"
 
-- 
2.18.0


