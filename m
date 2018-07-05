Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id C2DB278A1B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 18:58:40 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-227-236-43.adslplus.ch
	[84.227.236.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 934562175C;
	Thu,  5 Jul 2018 18:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1530817122;
	bh=jqM2PD20271bc31Jz3LUGAOwwk28wfu4ZJMtdtfXIiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KV1Sq0x1drp/9hS8lrNj1dCNTiFwIwpv3dehTi7FMMyc3pw6kzB3uQuervHQOGzE7
	aNcvRm1S2aLbCXMfwL82yeTtjdQuUKyA1O4lnXxOPN0jYnqpJNyZBxrIAZ7U9AtCqO
	s5Q1N5pbJ3WrOH0hoVlAEJhug6KZK/y3rnejLKdQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2018 20:58:12 +0200
Message-Id: <20180705185812.23209-4-krzk@kernel.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180705185812.23209-1-krzk@kernel.org>
References: <20180705185812.23209-1-krzk@kernel.org>
Subject: [meta-networking][PATCH v5 3/3] kernel_wireless_regdb: Add class for embedding regulatory data into older kernel
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
X-List-Received-Date: Thu, 05 Jul 2018 18:58:41 -0000

Linux kernels before v4.15, allowed to be compiled with static
regulatory database if it was put under net/wireless/db.txt.

Add kernel_wireless_regdb class which allows in such cases to embed the
wireless regulatory database directly in the Linux kernel during build
process.

Usage:
1. The class should be inherited by kernel recipe (e.g. in
   linux-yocto_%.bbappend).
2. For Linux kernels up to v4.14, build kernel with CONFIG_EXPERT and
   CONFIG_CFG80211_INTERNAL_REGDB.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../classes/kernel_wireless_regdb.bbclass            | 20 ++++++++++++++++++++
 .../wireless-regdb/wireless-regdb_2018.05.31.bb      |  9 +++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-networking/classes/kernel_wireless_regdb.bbclass

diff --git a/meta-networking/classes/kernel_wireless_regdb.bbclass b/meta-networking/classes/kernel_wireless_regdb.bbclass
new file mode 100644
index 000000000000..1238172bd4b7
--- /dev/null
+++ b/meta-networking/classes/kernel_wireless_regdb.bbclass
@@ -0,0 +1,20 @@
+# Linux kernels before v4.15, allowed to be compiled with static
+# regulatory database if it was put under net/wireless/db.txt.
+#
+# This class copies the regulatory plaintext database to kernel sources before
+# compiling.
+#
+# Usage:
+# 1. The class should be inherited by kernel recipe (e.g. in
+#    linux-yocto_%.bbappend).
+# 2. For Linux kernels up to v4.14, build kernel with CONFIG_EXPERT and
+#    CONFIG_CFG80211_INTERNAL_REGDB.
+
+DEPENDS += "wireless-regdb-native"
+
+SRCTREECOVEREDTASKS += "do_kernel_add_regdb"
+do_kernel_add_regdb() {
+    cp ${STAGING_LIBDIR_NATIVE}/crda/db.txt ${S}/net/wireless/db.txt
+}
+do_kernel_add_regdb[dirs] = "${S}"
+addtask kernel_add_regdb before do_build after do_configure
diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
index 2ae9e85427bc..d1c8d567597b 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
@@ -22,6 +22,7 @@ do_install() {
 
 # Install static regulatory DB in /lib/firmware for kernel to load.
 # This requires Linux kernel >= v4.15.
+# For kernel <= v4.14, inherit the kernel_wireless_regdb.bbclass in kernel's recipe.
 PACKAGES =+ "${PN}-static"
 RCONFLICTS_${PN} = "${PN}-static"
 
@@ -30,4 +31,12 @@ FILES_${PN}-static = " \
     ${nonarch_base_libdir}/firmware/regulatory.db.p7s \
 "
 
+# Native users might want to use the source of regulatory DB.
+# This is for example used by Linux kernel <= v4.14 and kernel_wireless_regdb.bbclass.
+do_install_append_class-native() {
+    install -m 0644 -D db.txt ${D}${libdir}/crda/db.txt
+}
+
 RSUGGESTS_${PN} = "crda"
+
+BBCLASSEXTEND = "native"
-- 
2.14.1


