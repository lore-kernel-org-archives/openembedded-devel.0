Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C2A04608B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 06:27:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99797066"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Aug 2015 14:31:05 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7J6RjqA017820
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 14:27:45 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 19 Aug 2015 14:27:48 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Aug 2015 14:27:33 +0800
Message-ID: <1439965653-8940-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] libjs-sizzle: upgrade 1.9.3 -> 1.10.18
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
X-List-Received-Date: Wed, 19 Aug 2015 06:27:51 -0000
Content-Type: text/plain

* Modify SRC_URI to avoid do_fetch failed.
* Modify LICENSE file,and the LICENSE has been changed.
* Replace the hardcoded strings "/usr/share"

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 ...bjs-sizzle_1.9.3.bb => libjs-sizzle_1.10.18.bb} | 24 ++++++++++------------
 1 file changed, 11 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-support/libjs/{libjs-sizzle_1.9.3.bb => libjs-sizzle_1.10.18.bb} (15%)

diff --git a/meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb b/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
similarity index 15%
rename from meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb
rename to meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
index ad0f9c6..92ab31f 100644
--- a/meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb
+++ b/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
@@ -1,20 +1,18 @@
 SUMMARY = "Pure-JavaScript CSS selector engine"
-LICENSE = "GPLv2+ & MIT & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://usr/share/doc/libjs-sizzle/copyright;md5=9b35efb1635ff8f06d1984376b06ee5a"
+LICENSE = "GPL-2.0 & MIT & AFL-2.1"
+LIC_FILES_CHKSUM = "file://MIT-LICENSE.txt;md5=e43aa437a6a1ba421653bd5034333bf9"
 
-SRC_URI = "http://kr.archive.ubuntu.com/ubuntu/pool/universe/s/sizzle/${BPN}_${PV}-1_all.deb;subdir=${BP}"
-SRC_URI[md5sum] = "748b8805e21caed658f6765f7c491d46"
-SRC_URI[sha256sum] = "2a6468763c40a30f6f7d0df8906cd17aaebd6edaa5478aeaffd7b6b5fb8abd35"
+SRC_URI = "http://kr.archive.ubuntu.com/ubuntu/pool/universe/s/sizzle/sizzle_1.10.18.orig.tar.gz"
+SRC_URI[md5sum] = "91477c1edeef9f8100ffd6c4d31725b5"
+SRC_URI[sha256sum] = "8e04ab84bb74b2e338dffc63cd2e52b007f1d8af01b3d25da4d2e07f2b5890f8"
 
-SIZZLEDIR = "${datadir}/javascript/sizzle"
-SIZZLEDOCDIR = "${docdir}/libjs-sizzle"
+S = "${WORKDIR}/sizzle-${PV}"
+
+SIZZLEDIR = "${S}/dist"
 
 do_install() {
-    install -d -m 0755 ${D}${SIZZLEDIR}
-    install -m 0644 ${S}${SIZZLEDIR}/sizzle.js ${D}${SIZZLEDIR}/
-    install -m 0644 ${S}${SIZZLEDIR}/sizzle.min.js ${D}${SIZZLEDIR}/
-    install -d -m 0755 ${D}${SIZZLEDOCDIR}
-    install -m 0644 ${S}${SIZZLEDOCDIR}/* ${D}${SIZZLEDOCDIR}/
+    install -d -m 0755 ${D}/${datadir}/javascript/sizzle/
+    install -m 0644 ${SIZZLEDIR}/*.js ${D}/${datadir}/javascript/sizzle/
 }
 
-FILES_${PN} = "/usr/share/javascript/sizzle/"
+FILES_${PN} = "${datadir}/javascript/sizzle/"
-- 
1.8.4.2


