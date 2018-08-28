Return-Path: <radek.dostal@streamunlimited.com>
X-Greylist: delayed 2903 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Aug 2018 08:05:21 UTC
Received: from bsmtp8.bon.at (bsmtp8.bon.at [213.33.87.20])
	by mail.openembedded.org (Postfix) with ESMTP id 79A2772EB0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 08:05:21 +0000 (UTC)
Received: from bsmtp7.bon.at (unknown [192.168.181.108])
	by bsmtp8.bon.at (Postfix) with ESMTPS id 4200SF0tjBz5tlk
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:17:01 +0200 (CEST)
Received: from rdostal-desktop.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp7.bon.at (Postfix) with ESMTPSA id 4200SC4dmDz5tlZ;
	Tue, 28 Aug 2018 09:16:59 +0200 (CEST)
From: =?UTF-8?q?Radek=20Dost=C3=A1l?= <radek.dostal@streamunlimited.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2018 09:15:32 +0200
Message-Id: <1535440532-15992-1-git-send-email-radek.dostal@streamunlimited.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: =?UTF-8?q?Radek=20Dost=C3=A1l?= <radek.dostal@streamunlimited.com>
Subject: [meta-networking][PATCH] wireless-regdb: make wireless-regdb architecture independent
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
X-List-Received-Date: Tue, 28 Aug 2018 08:05:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is no compilation involved in wireless-regdb and package should
produce  the same results on all architectures => making it allarch saves
build time.

Additionally this fixes issue: "On machines where ${libdir} equals to
/usr/lib64/ regulatory.bin is not found by crda". Reason was that
crda-3.18/crda.c looks only in following paths:
  "/usr/local/lib/crda/regulatory.bin", /* Users/preloads can override */
  "/usr/lib/crda/regulatory.bin", /* General distribution package usage */
  "/lib/crda/regulatory.bin", /* alternative for distributions */

Signed-off-by: Radek Dostál <radek.dostal@streamunlimited.com>
---
 .../wireless-regdb/wireless-regdb_2018.05.31.bb                     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

4MartinJansa: dneska přestupuju v České Třebové :)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
index d1c8d56..2b990db 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
@@ -8,12 +8,12 @@ SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
 SRC_URI[md5sum] = "0cbbdc21186c76cf58aba01b03f3dc5b"
 SRC_URI[sha256sum] = "e1dfbc3b97771373077f430c3c05082fae883145b37db5b2cfd12c56676fbe7b"
 
-inherit bin_package
+inherit bin_package allarch
 
 do_install() {
-    install -d -m0755 ${D}${libdir}/crda
+    install -d -m0755 ${D}${nonarch_libdir}/crda
     install -d -m0755 ${D}${sysconfdir}/wireless-regdb/pubkeys
-    install -m 0644 regulatory.bin ${D}${libdir}/crda/regulatory.bin
+    install -m 0644 regulatory.bin ${D}${nonarch_libdir}/crda/regulatory.bin
     install -m 0644 sforshee.key.pub.pem ${D}${sysconfdir}/wireless-regdb/pubkeys/sforshee.key.pub.pem
 
     install -m 0644 -D regulatory.db ${D}${nonarch_base_libdir}/firmware/regulatory.db
-- 
2.7.4


