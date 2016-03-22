Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 964A760796
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:57:52 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2M9vqsN016576; Tue, 22 Mar 2016 04:57:52 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016032204575245-75308 ;
	Tue, 22 Mar 2016 04:57:52 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2016 11:57:16 +0200
Message-Id: <1458640636-9492-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/22/2016 04:57:52 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/22/2016 04:57:52 AM,
	Serialize complete at 03/22/2016 04:57:52 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-22_06:, , signatures=0
Cc: James Minor <james.minor@ni.com>
Subject: [meta-oe][PATCH] ti-wifi-utils: add recipe
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
X-List-Received-Date: Tue, 22 Mar 2016 09:57:52 -0000

This recipe is for a TI WiFi calibrator utility [1]. The firmware from
this project is already shipped inside linux-firmware so we do not
package it in this recipe.

[1] http://linuxwireless.sipsolutions.net/en/users/Drivers/wl12xx/#Calibration

Signed-off-by: James Minor <james.minor@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../ti-wifi-utils/ti-wifi-utils_git.bb             | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb

diff --git a/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb b/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb
new file mode 100644
index 0000000..fcae729
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "The calibrator and other useful utilities for TI wireless solution based on wl12xx driver"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
+
+DEPENDS = "libnl"
+
+PV = "0.1+gitr${SRCPV}"
+
+SRCREV = "b03d9ce6362e6d22d6929f2736409af3b0fd3c88"
+SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;branch=r5-jb"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} \
+                CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" \
+                CFLAGS="${CFLAGS} -I${STAGING_INCDIR}/libnl3 -DCONFIG_LIBNL20" NLVER=3 \
+                LDFLAGS="${LDFLAGS} ${TOOLCHAIN_OPTIONS}" \
+'
+
+#only install the calibrator utility, firmware is already within linux-firmware
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 calibrator ${D}${bindir}/
+}
-- 
2.7.4


