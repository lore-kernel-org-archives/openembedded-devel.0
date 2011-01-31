Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pk0mc-0007wU-3E
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 21:55:34 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id ADD8AEA6D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 21:32:41 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aqw+ANOqRk1T4zjzPGdsb2JhbACIXo16jiAMAQEBATUvvhqFTgSMIQ
X-IronPort-AV: E=Sophos;i="4.60,405,1291590000"; d="scan'208";a="169036346"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb2.telenor.se with ESMTP; 31 Jan 2011 21:32:41 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 21:32:38 +0100
Message-Id: <1296505958-4465-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] Add support for user-defined multimedia in rootfs
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
X-List-Received-Date: Mon, 31 Jan 2011 20:55:34 -0000

---
 recipes/multimedia/multimedia_1.0.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/multimedia/multimedia_1.0.bb

diff --git a/recipes/multimedia/multimedia_1.0.bb b/recipes/multimedia/multimedia_1.0.bb
new file mode 100644
index 0000000..2abfefa
--- /dev/null
+++ b/recipes/multimedia/multimedia_1.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "MultiMedia files"
+LICENSE = "GPL"
+PR = "r5"
+
+# This package allows you to add multimedia contents to the file system
+# To add this, you define 
+# MULTIMEDIA_FILES=<path><filename>.tar.bz2 in local.conf
+# and include "multimedia" in your image
+
+do_install() {
+	install -d ${D}/usr/share/multimedia
+	if [ "x${MULTIMEDIA_FILES}" != "x" ] ; then
+		if [ -f ${MULTIMEDIA_FILES} ] ; then
+			tar jxvf ${MULTIMEDIA_FILES}	-C ${D}/usr/share/multimedia
+		fi
+	fi
+}
+
+FILES_${PN} = "\
+	/usr/share/multimedia/* \
+	/usr/share/multimedia \
+	"
+
-- 
1.6.3.3



