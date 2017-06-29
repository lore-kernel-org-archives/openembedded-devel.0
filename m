Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5107C77D9F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jun 2017 02:23:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5T2Ng7R007819
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 19:23:42 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 28 Jun 2017 19:23:41 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Jun 2017 10:23:38 +0800
Message-ID: <20170629022338.7752-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] hwloc: add several PACKAGECONFIG items
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
X-List-Received-Date: Thu, 29 Jun 2017 02:23:44 -0000
Content-Type: text/plain

Add PACKAGECONFIG items to allow for more flexiblity.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
index e067f2799..5cf6e7eb9 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
@@ -13,10 +13,16 @@ SRC_URI[sha256sum] = "95d80286dfe658a3f79e2ac90698782bb36e5504f4bac1bba2394ba14d
 
 inherit autotools
 
-DEPENDS += "cairo ncurses udev libxml2 zlib libpciaccess"
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
+DEPENDS += "ncurses udev zlib"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux', '', d)}"
 
+PACKAGECONFIG ?= "pci libxml2 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+
+PACKAGECONFIG[numactl] = "--enable-libnuma,--disable-libnuma,numactl,numactl"
+PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2,libxml2"
+PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 cairo,cairo"
+PACKAGECONFIG[pci] = "--enable-pci,--disable-pci,libpciaccess,libpciaccess"
+
 # Split hwloc library into separate subpackage
 PACKAGES_prepend = " lib${PN} "
 FILES_lib${PN} += "${libdir}/lib${PN}.so*"
-- 
2.11.0


