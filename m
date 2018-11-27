Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0891F6D040
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:17:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR8Hg83012780
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2018 00:17:43 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 00:17:41 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 16:32:45 +0800
Message-ID: <f75ed4eb895b333ae5a6ae45328ff0bdbf3fa438.1543307294.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1543307294.git.hongxu.jia@windriver.com>
References: <cover.1543307294.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 11/12] libblockdev: 2.18 -> 2.20
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
X-List-Received-Date: Tue, 27 Nov 2018 08:17:43 -0000
Content-Type: text/plain

Add nvdimm support since upstream python3-blivet [20ae5ea Re-add
nvdimm plugin Recommends on 3.1+.]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libblockdev/{libblockdev_2.18.bb => libblockdev_2.20.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.18.bb => libblockdev_2.20.bb} (92%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.20.bb
similarity index 92%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_2.20.bb
index 35f0cc0..54a188d 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.20.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
 inherit autotools python3native gobject-introspection
 
-SRCREV = "0debeb45562ac3d8f6f43f6f942b238abab55be9"
+SRCREV = "cb308566c3c5222b8422f78997a1742713b265a9"
 SRC_URI = " \
     git://github.com/rhinstaller/libblockdev;branch=master \
 "
@@ -19,7 +19,7 @@ S = "${WORKDIR}/git"
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
 
-PACKAGECONFIG ??= "python3 lvm dm kmod parted fs escrow btrfs crypto mdraid kbd mpath"
+PACKAGECONFIG ??= "python3 lvm dm kmod parted fs escrow btrfs crypto mdraid kbd mpath nvdimm"
 PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
 PACKAGECONFIG[python2] = "--with-python2, --without-python2,,python2"
 PACKAGECONFIG[lvm] = "--with-lvm, --without-lvm, multipath-tools, lvm2"
@@ -30,7 +30,7 @@ PACKAGECONFIG[kmod] = "--with-kbd, --without-kbd, kmod"
 PACKAGECONFIG[parted] = "--with-part, --without-part, parted"
 PACKAGECONFIG[fs] = "--with-fs, --without-fs, util-linux"
 PACKAGECONFIG[doc] = "--with-gtk-doc, --without-gtk-doc, gtk-doc-native"
-PACKAGECONFIG[nvdimm] = "--with-nvdimm, --without-nvdimm"
+PACKAGECONFIG[nvdimm] = "--with-nvdimm, --without-nvdimm, ndctl util-linux"
 PACKAGECONFIG[vdo] = "--with-vdo, --without-vdo"
 PACKAGECONFIG[escrow] = "--with-escrow, --without-escrow, nss volume-key"
 PACKAGECONFIG[btrfs] = "--with-btrfs,--without-btrfs,libbytesize btrfs-tools"
-- 
2.7.4


