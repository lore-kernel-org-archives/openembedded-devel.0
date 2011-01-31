Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pk19R-0001q2-Co
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 22:19:09 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 2FD32EB2B9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 22:18:13 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Als8AJu1Rk1T4zjzPGdsb2JhbACWWI4gDAEBAQE1L7BrAY0ChU4EjCE
X-IronPort-AV: E=Sophos;i="4.60,405,1291590000"; d="scan'208";a="1710715217"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb4.telenor.se with ESMTP; 31 Jan 2011 22:18:13 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 22:18:07 +0100
Message-Id: <1296508688-5770-7-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1296508688-5770-6-git-send-email-ulf.samuelsson@atmel.com>
References: <1296508688-5770-1-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-2-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-3-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-4-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-5-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-6-git-send-email-ulf.samuelsson@atmel.com>
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH v3 07/08] Add Wi-Fi support to at91
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Jan 2011 21:19:09 -0000

Add support for the EXTWIFI board, from H&D Wireless.
http://www.hd-wireless.se/

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/owl-wifi/owl-wifi_1.0.4.bb |   31 +++++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 recipes/owl-wifi/owl-wifi_1.0.4.bb

diff --git a/recipes/owl-wifi/owl-wifi_1.0.4.bb b/recipes/owl-wifi/owl-wifi_1.0.4.bb
new file mode 100644
index 0000000..5e31b82
--- /dev/null
+++ b/recipes/owl-wifi/owl-wifi_1.0.4.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Driver for HD Wireless Wi-Fi device"
+HOMEPAGE = "http://www.hd-wireless.se"
+PRIORITY = "optional"
+SECTION = "kernel/modules"
+LICENSE = "GPL"
+PR = "r1"
+RDEPENDS = "wireless-tools \
+	 wpa-supplicant \
+	 "
+
+SRC_URI = "http://www.hd-wireless.se/images/stories/public_pdf/owl-linux-arm-${PV}.tar.gz \
+	"
+
+S = "${WORKDIR}/owl-linux-arm-${PV}"
+
+inherit module
+
+do_compile () {
+        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS CC LD CPP
+        oe_runmake 'MODPATH=${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/net' \
+                   'KERNELDIR=${STAGING_KERNEL_DIR}' \
+                   'KDIR=${STAGING_KERNEL_DIR}' \
+                   'KERNEL_VERSION=${KERNEL_VERSION}' \
+                   'CC=${KERNEL_CC}' \
+                   'LD=${KERNEL_LD}'
+}
+
+do_install() {
+        install -d ${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/net
+        install -m 0644 ${S}/owl*${KERNEL_OBJECT_SUFFIX} ${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/net
+}
-- 
1.6.3.3



