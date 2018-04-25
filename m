Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id C6ED1744F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:33:54 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E594D20C09;
	Wed, 25 Apr 2018 14:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E594D20C09
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Apr 2018 16:33:41 +0200
Message-Id: <1524666822-16866-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][rocko][PATCH v2 1/2] kernel_wireless_regdb: Add class for embedding regulatory data into the kernel
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
X-List-Received-Date: Wed, 25 Apr 2018 14:33:54 -0000

Small embedded systems might:
1. Want to get rid of daemons as much as possible (therefore be built
   without CRDA),
2. Not receive user-space incremental updates but an entire system
   upgrade (with kernel).

Add class kernel_wireless_regdb which allows in such cases to embed the
wireless regulatory database directly in the Linux kernel during build
process.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Remove debugging echo.
---
 meta-networking/classes/kernel_wireless_regdb.bbclass         | 11 +++++++++++
 .../wireless-regdb/wireless-regdb_2016.06.10.bb               |  8 ++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-networking/classes/kernel_wireless_regdb.bbclass

diff --git a/meta-networking/classes/kernel_wireless_regdb.bbclass b/meta-networking/classes/kernel_wireless_regdb.bbclass
new file mode 100644
index 000000000000..a2c945ad11cf
--- /dev/null
+++ b/meta-networking/classes/kernel_wireless_regdb.bbclass
@@ -0,0 +1,11 @@
+# Copies the regulatory plaintext database to kernel sources before compiling.
+# Linux kernel must be compiled with CONFIG_CFG80211_INTERNAL_REGDB to use it.
+
+DEPENDS += "wireless-regdb-native"
+
+SRCTREECOVEREDTASKS += "do_kernel_add_regdb"
+do_kernel_add_regdb() {
+    cp ${STAGING_LIBDIR_NATIVE}/crda/db.txt ${S}/net/wireless/db.txt
+}
+do_kernel_add_regdb[dirs] = "${S}"
+addtask kernel_add_regdb before do_configure after do_patch
diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
index 64e9401e7a3c..14bf272f4050 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
@@ -17,4 +17,12 @@ do_install() {
     install -m 0644 sforshee.key.pub.pem ${D}${sysconfdir}/wireless-regdb/pubkeys/sforshee.key.pub.pem
 }
 
+# Native users might want to use source db.txt
+do_install_append_class-native() {
+    install -d -m 0755 ${D}${libdir}/crda
+    install -m 0644 db.txt ${D}${libdir}/crda/db.txt
+}
+
 RSUGGESTS_${PN} = "crda"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


