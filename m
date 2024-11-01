Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8061AE6B27B
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 13:10:05 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.37026.1730466106951707562
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Nov 2024 06:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: lgo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <lgo@pengutronix.de>)
	id 1t6rHd-0002GT-FW; Fri, 01 Nov 2024 14:01:45 +0100
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lgo@pengutronix.de>)
	id 1t6rHd-001Vt5-0v;
	Fri, 01 Nov 2024 14:01:45 +0100
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <lgo@pengutronix.de>)
	id 1t6rHd-00ANdH-0U;
	Fri, 01 Nov 2024 14:01:45 +0100
From: =?UTF-8?B?TGVvbmFyZCBHw7ZocnM=?= <l.goehrs@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
Subject: [meta-oe][PATCH 2/2] panel-mipi-dbi.bbclass: initial addition of the firmware blob class
Date: Fri,  1 Nov 2024 14:01:37 +0100
Message-Id: <20241101130137.2474093-2-l.goehrs@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241101130137.2474093-1-l.goehrs@pengutronix.de>
References: <20241101130137.2474093-1-l.goehrs@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: lgo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Nov 2024 13:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113386

The `panel-mipi-dbi.bbclass` can be used to build a firmware file for use
with the `panel-mipi-dbi` Linux driver.

The class uses the `mipi-dbi-cmd` from `panel-mipi-dbi-native` to
assemble a human readable list of init commands into a firmware file
for use with the `panel-mipi-dbi` Linux driver.

Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
---
 meta-oe/classes/panel-mipi-dbi.bbclass | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta-oe/classes/panel-mipi-dbi.bbclass

diff --git a/meta-oe/classes/panel-mipi-dbi.bbclass b/meta-oe/classes/panel-mipi-dbi.bbclass
new file mode 100644
index 000000000..7ceebc72e
--- /dev/null
+++ b/meta-oe/classes/panel-mipi-dbi.bbclass
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright Pengutronix <yocto@pengutronix.de>
+#
+# Class to generate firmware files for use with the `panel-mipi-dbi` Linux
+# driver.
+#
+# The firmware source file contains a list of commands to send to the display
+# controller in order to initialize it:
+#
+#   $ cat shineworld,lh133k.txt
+#   command 0x11 # exit sleep mode
+#   delay 120
+#
+#   # Enable color inversion
+#   command 0x21 # INVON
+#   ...
+#
+# A recipe to compile such a command list into a firmware blob for use with
+# the `panel-mipi-dbi` driver looks something like this:
+#
+#   $ cat panel-shineworld-lh133k.bb
+#   inherit panel-mipi-dbi
+#
+#   SRC_URI = "file://${PANEL_FIRMWARE}"
+#
+#   PANEL_FIRMWARE = "shineworld,lh133k.txt"
+#   ...
+
+DEPENDS = "panel-mipi-dbi-native"
+
+PANEL_FIRMWARE_BIN ?= "${@d.getVar('PANEL_FIRMWARE').removesuffix('.txt')}.bin"
+
+do_configure[noexec] = "1"
+
+do_compile () {
+    mipi-dbi-cmd \
+        "${B}/${PANEL_FIRMWARE_BIN}" \
+        "${UNPACKDIR}/${PANEL_FIRMWARE}"
+}
+
+do_install () {
+    install -m 0644 -D \
+        "${B}/${PANEL_FIRMWARE_BIN}" \
+        "${D}${nonarch_base_libdir}/firmware/${PANEL_FIRMWARE_BIN}"
+}
+
+FILES:${PN} = "${nonarch_base_libdir}/firmware/"
-- 
2.39.5


