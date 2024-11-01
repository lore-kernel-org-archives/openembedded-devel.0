Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8144BE6B27C
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 13:10:05 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.37025.1730466105240251981
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Nov 2024 06:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: lgo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <lgo@pengutronix.de>)
	id 1t6rHb-0002Fb-Oq; Fri, 01 Nov 2024 14:01:43 +0100
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lgo@pengutronix.de>)
	id 1t6rHb-001Vt1-1a;
	Fri, 01 Nov 2024 14:01:43 +0100
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <lgo@pengutronix.de>)
	id 1t6rHb-00ANdA-19;
	Fri, 01 Nov 2024 14:01:43 +0100
From: =?UTF-8?B?TGVvbmFyZCBHw7ZocnM=?= <l.goehrs@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
Subject: [meta-oe][PATCH 1/2] panel-mipi-dbi: initial addition of the firmware blob assembler
Date: Fri,  1 Nov 2024 14:01:36 +0100
Message-Id: <20241101130137.2474093-1-l.goehrs@pengutronix.de>
X-Mailer: git-send-email 2.39.5
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113385

This python script assembles a list of human readable commands into
a firmware blob.

The firmware blob is interpreted by the `panel-mipi-dbi` Linux driver
to initialize a MIPI DBI display panel and its controller.

MIPI DBI is not to be confused with MIPI DSI.
The former is usually used to drive small displays that are attached
via SPI, while the latter is a fast communication standard using
differential signaling, that is also suitable for larger displays.

Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
---
 .../panel-mipi-dbi-native_git.bb              | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb

diff --git a/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb b/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb
new file mode 100644
index 000000000..0e88e84af
--- /dev/null
+++ b/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Firmware file compiler for the panel-mipi-dbi display driver"
+DESCRIPTION = "The panel-mipi-dbi Linux display driver allows using the same \
+               driver for most MIPI DBI based display panels. \
+               This means many displays attached via SPI, even if the \
+               datasheet does not explicitly mention DBI support. \
+               To do so it uses tiny firmware files that contain \
+               display/controller-specific initialization commands. \
+               The mipi-dbi-cmd tool compiles these firmware files from a \
+               text format to a firmware blob format."
+HOMEPAGE = "https://github.com/notro/panel-mipi-dbi"
+SECTION = "graphics"
+LICENSE = "CC0-1.0"
+LIC_FILES_CHKSUM = "file://mipi-dbi-cmd;beginline=4;endline=13;md5=5e3d3f14cc87aa9e8976d728520cbcae"
+SRCREV = "1cbd40135a8c7f25d7b444a7fac77fd3c3ad471e"
+
+SRC_URI = "git://github.com/notro/panel-mipi-dbi.git;protocol=https;branch=main"
+
+S = "${WORKDIR}/git"
+
+inherit native
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_install () {
+    install -D -p -m 0755 ${S}/mipi-dbi-cmd ${D}${bindir}/mipi-dbi-cmd
+}
+
+RDEPENDS:${PN} += "python3-native"
-- 
2.39.5


