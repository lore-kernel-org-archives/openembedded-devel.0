Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@ossystems.com.br>) id 1LXebP-0008EO-P8
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 17:39:52 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id B21F4402FA;
	Thu, 12 Feb 2009 12:38:49 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 42CA4740D9;
	Thu, 12 Feb 2009 14:38:48 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id AADF4610131; Thu, 12 Feb 2009 14:38:35 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 14:38:30 -0200
Message-Id: <1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.2.rc0
In-Reply-To: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/6] rt61-firmware: add 1.2
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
X-List-Received-Date: Thu, 12 Feb 2009 16:39:52 -0000

---
 packages/rt2x00/rt61-firmware_1.2.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 packages/rt2x00/rt61-firmware_1.2.bb

diff --git a/packages/rt2x00/rt61-firmware_1.2.bb b/packages/rt2x00/rt61-firmware_1.2.bb
new file mode 100644
index 0000000..ae683c8
--- /dev/null
+++ b/packages/rt2x00/rt61-firmware_1.2.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Firmware for rt61 based USB wifi adaptors"
+LICENSE = "unknown"
+
+SRC_URI = "http://www.ralinktech.com.tw/data/RT61_Firmware_V${PV}.zip"
+
+S = "${WORKDIR}/RT61_Firmware_V${PV}"
+
+do_install() {
+	install -d ${D}/${base_libdir}/firmware
+	install -m 0644 rt61.bin ${D}/${base_libdir}/firmware/
+}
+
+FILES_${PN} = "${base_libdir}/firmware/"
+PACKAGE_ARCH = "all"
-- 
1.6.2.rc0



