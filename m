Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 68CF96E688
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 13:25:23 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u2HDPLXT027422
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 14:25:21 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.85.179])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id u2HDPLJo031546;
	Thu, 17 Mar 2016 14:25:21 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Mar 2016 14:25:10 +0100
Message-Id: <1458221111-14049-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Freudiger Raphael <raphael.freudiger@siemens.com>
Subject: [meta-networking][PATCH 1/2] dhcpcd: cleanup recipe
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
X-List-Received-Date: Thu, 17 Mar 2016 13:25:24 -0000

- use autotools-brokensep instead of B = "${S}"
- make udev configurable via PACKAGECONFIG
- make ipv6 configurable via PACKAGECONFIG

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
Signed-off-by: Freudiger Raphael <raphael.freudiger@siemens.com>
---
 meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
index 058a932..76d0103 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
@@ -12,11 +12,13 @@ SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "f39c5773e7c4bea352d9fb7367c899de"
 SRC_URI[sha256sum] = "ab56af9b2e86913c55a965cb0f835e87749df78318564acf90d5d698f413ad35"
 
-inherit autotools
+inherit autotools-brokensep
 
-B = "${S}"
-EXTRA_OECONF = "--enable-ipv4 --enable-ipv6"
+PACKAGECONFIG ?= "udev ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
 
-FILES_${PN}-dbg += "${libdir}/dhcpcd/dev/.debug"
+PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
+
+EXTRA_OECONF = "--enable-ipv4"
 
-RDEPENDS_${PN} = "udev"
+FILES_${PN}-dbg += "${libdir}/dhcpcd/dev/.debug"
-- 
2.1.4


