Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id ED7C7789E1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 18:58:39 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-227-236-43.adslplus.ch
	[84.227.236.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 806AC2175C;
	Thu,  5 Jul 2018 18:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1530817121;
	bh=cf1aLO7SVfqAhcnuINEgRpTAbtJ8Uo8hu5R0ZCr2mfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ClH9muUeUDNu/uIeM9Hg9UJxITck85XWixqjc693osiYcwWXRf4CMavR9drPLWRb+
	3M2kkl3YRkE93+QMhH59gfr2NKst2zzX67vfxIrP0JWBm+un5aFlg3bVWZPB1av0xx
	YNUoxZW4dkxESosl5L8yOqqXdf9GIDAuUfxWI1TY=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2018 20:58:11 +0200
Message-Id: <20180705185812.23209-3-krzk@kernel.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180705185812.23209-1-krzk@kernel.org>
References: <20180705185812.23209-1-krzk@kernel.org>
Subject: [meta-networking][PATCH v5 2/3] wireless-regdb: Add wireless-regdb-static package with static regulatory data
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
X-List-Received-Date: Thu, 05 Jul 2018 18:58:40 -0000

Small embedded systems might:
1. Want to get rid of daemons as much as possible (therefore be built
   without CRDA),
2. Not receive user-space incremental updates but an entire system
   upgrade (with kernel).

Linux kernel since v4.15 allows loading static regulatory data from
/lib/firmware/regulatory.db.

Add additional package to wireless-regdb recipe which provides such
static data.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../wireless-regdb/wireless-regdb_2018.05.31.bb             | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
index 8bb866ff1281..2ae9e85427bc 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
@@ -15,6 +15,19 @@ do_install() {
     install -d -m0755 ${D}${sysconfdir}/wireless-regdb/pubkeys
     install -m 0644 regulatory.bin ${D}${libdir}/crda/regulatory.bin
     install -m 0644 sforshee.key.pub.pem ${D}${sysconfdir}/wireless-regdb/pubkeys/sforshee.key.pub.pem
+
+    install -m 0644 -D regulatory.db ${D}${nonarch_base_libdir}/firmware/regulatory.db
+    install -m 0644 regulatory.db.p7s ${D}${nonarch_base_libdir}/firmware/regulatory.db.p7s
 }
 
+# Install static regulatory DB in /lib/firmware for kernel to load.
+# This requires Linux kernel >= v4.15.
+PACKAGES =+ "${PN}-static"
+RCONFLICTS_${PN} = "${PN}-static"
+
+FILES_${PN}-static = " \
+    ${nonarch_base_libdir}/firmware/regulatory.db \
+    ${nonarch_base_libdir}/firmware/regulatory.db.p7s \
+"
+
 RSUGGESTS_${PN} = "crda"
-- 
2.14.1


