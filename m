Return-Path: <f.pflug@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CB1C79FA1
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 11:22:55 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4792.1788866565871959171
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 04:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: f.pflug@pengutronix.de)
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1x3tuV-0001f2-Vp; Tue, 08 Sep 2026 13:22:43 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 1/2] fitimage: add support for specifying FITIMAGE_CONFIG_FDTO_PREFIX
Date: Tue,  8 Sep 2026 13:22:42 +0200
Message-ID: <20260908112243.1085856-1-f.pflug@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::5c
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 11:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129858

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

FITIMAGE_CONFIG_PREFIX is only used for configurations that contain a
kernel image, but not for mere overlay configurations.

This is inconsistent with the original kernel-fitimage.bbclass.
As the name may be hardcoded in the bootloader, add a new
FITIMAGE_CONFIG_FDTO_PREFIX to be able to customize the prefix for
device tree overlay configuration nodes as well.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
 meta-oe/classes/fitimage.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.bbclass
index 0e2a02636c..adcfec0f0e 100644
--- a/meta-oe/classes/fitimage.bbclass
+++ b/meta-oe/classes/fitimage.bbclass
@@ -88,7 +88,9 @@ FITIMAGE_HASH_ALGO[doc] = "Hash algorithm to use"
 FITIMAGE_ENCRYPT_ALGO ?= "rsa2048"
 FITIMAGE_ENCRYPT_ALGO[doc] = "Signature algorithm to use"
 FITIMAGE_CONFIG_PREFIX ?= "conf-"
-FITIMAGE_CONFIG_PREFIX[doc] = "Prefix to use for FIT configuration node name"
+FITIMAGE_CONFIG_PREFIX[doc] = "Prefix to use for bootable FIT configuration node name"
+FITIMAGE_CONFIG_FDTO_PREFIX ?= ""
+FITIMAGE_CONFIG_FDTO_PREFIX[doc] = "Prefix to use for fdto FIT configuration node name"
 FITIMAGE_CMDLINE ?= ""
 FITIMAGE_CMDLINE[doc] = "Kernel command line to embed in the FIT configuration node"
 
@@ -347,9 +349,11 @@ def fitimage_emit_section_config(d, fd, dtb, kernelcount, ramdiskcount, setupcou
 #
 def fitimage_emit_section_config_fdto(d, fd, dtb, compatible):
     sign = d.getVar("FITIMAGE_SIGN")
+    conf_prefix = d.getVar('FITIMAGE_CONFIG_FDTO_PREFIX') or ""
+
     bb.note("Adding overlay config section to ITS file")
 
-    fd.write(f'\t\t{dtb} {{\n')
+    fd.write(f'\t\t{conf_prefix}{dtb} {{\n')
     fd.write(f'\t\t\tdescription = "Device Tree Overlay";\n')
     fd.write(f'\t\t\tfdt = "fdt-{dtb}";\n')
     if compatible:
-- 
2.47.3


