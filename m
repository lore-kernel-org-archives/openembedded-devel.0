Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id D3DE078A54
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 16:55:45 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-227-236-43.adslplus.ch
	[84.227.236.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8DFC624053;
	Thu,  5 Jul 2018 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1530809747;
	bh=zUmVpfCYxW/eBdAU0Ao/y7NNe5cnY21DQZ1qSkldN/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CrmFjbjp8pnD7LLlBAGsFnRQK66yqNyhtEA8EAycyXC0G2Pa6LFtGfZnoJCZTE37T
	VZr4Y9uSphX0Q3r6dNwvo+ucEGagC87Z2aZ0qdcSo/VLyuj/Cb6KzdOBQUPFUgEYtH
	A3DxQYPiVwfBRo8r7HbuEkdXG3saBzzC20VcBZa8=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2018 18:55:12 +0200
Message-Id: <20180705165513.28142-3-krzk@kernel.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180705165513.28142-1-krzk@kernel.org>
References: <20180705165513.28142-1-krzk@kernel.org>
Subject: [meta-networking][PATCH v4 2/3] wireless-regdb: Add wireless-regdb-static package with static regulatory data
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
X-List-Received-Date: Thu, 05 Jul 2018 16:55:46 -0000

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
 .../wireless-regdb/wireless-regdb_2018.05.31.bb            | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
index 8bb866ff1281..d40756ff2bbf 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
@@ -15,6 +15,20 @@ do_install() {
     install -d -m0755 ${D}${sysconfdir}/wireless-regdb/pubkeys
     install -m 0644 regulatory.bin ${D}${libdir}/crda/regulatory.bin
     install -m 0644 sforshee.key.pub.pem ${D}${sysconfdir}/wireless-regdb/pubkeys/sforshee.key.pub.pem
+
+    install -d -m0755 ${D}${nonarch_base_libdir}/firmware/
+    install -m 0644 regulatory.db ${D}${nonarch_base_libdir}/firmware/regulatory.db
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


