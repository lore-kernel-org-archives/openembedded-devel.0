Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25CDB7D58A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 07:06:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7S75tIm017763
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 00:06:06 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 28 Aug 2019 00:05:44 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Aug 2019 15:05:43 +0800
Message-ID: <20190828070543.19658-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libblockdev: fix PACKAGECONFIG regarding python
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
X-List-Received-Date: Wed, 28 Aug 2019 07:06:15 -0000
Content-Type: text/plain

The python2 PACKAGECONFIG was added during an upgrade, defaulting to
be disabled. The RDEPENDS part should be 'python' instead 'python2'
because there's no python2 recipe.

Also, we don't need to inherit some python classes. We just need to specify
FILES variable. After this change, the python2 and python3 PACKAGECONFIG
items could correctly work.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/libblockdev/libblockdev_2.22.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.22.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.22.bb
index c5fc928a7..985bd03e4 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.22.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.22.bb
@@ -8,7 +8,7 @@ SECTION = "devel/lib"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
-inherit autotools python3native gobject-introspection
+inherit autotools gobject-introspection
 
 SRCREV = "f6e4538485d0442b3674e182c01ffe5a0f258ad4"
 SRC_URI = " \
@@ -17,11 +17,11 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
+FILES_${PN} += "${libdir}/python2.7/dist-packages ${libdir}/python3.7/site-packages"
 
 PACKAGECONFIG ??= "python3 lvm dm kmod parted fs escrow btrfs crypto mdraid kbd mpath nvdimm"
 PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
-PACKAGECONFIG[python2] = "--with-python2, --without-python2,,python2"
+PACKAGECONFIG[python2] = "--with-python2, --without-python2,,python"
 PACKAGECONFIG[lvm] = "--with-lvm, --without-lvm, multipath-tools, lvm2"
 PACKAGECONFIG[lvm-dbus] = "--with-lvm_dbus, --without-lvm_dbus, multipath-tools, lvm2"
 PACKAGECONFIG[dm] = "--with-dm, --without-dm, multipath-tools, lvm2"
-- 
2.17.1


