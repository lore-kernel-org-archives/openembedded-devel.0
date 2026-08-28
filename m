Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F19C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 15:48:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3229.1787930471797519306
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 08:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GXKl7CNi;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: thomas.bonnefille@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AC6A04E41407
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 15:15:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6367A60537
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 15:15:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 401F111C7815E;
	Fri, 28 Aug 2026 17:15:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787930101; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=knIlsge8L8Y9UTTHFQjzJivCj6Hu1l1/FyCB5PltKzw=;
	b=GXKl7CNijI3vZEJaPaH9QjJr3X3u4CltAO++9YWd20EQrs8vrncUzrfCeOG0hqp6EMZIM4
	LeY+muh/ED69a7s3S3ShoLxNoBO/CFN+g4VNyxxIOxzqNYY49UviJLPMO1tDgDqw40GIPs
	bdIPg7S/RFtqnSDF20ejRA3oYvh5yRL0+am3WvGnWwtcQAWZT8m5drz2h4KyBonc7D5ZRJ
	c5/OpIOH7fKl1q//A/DdrZVdhJj6w1v9lhpMwwVwdCm5WzIj9W5mir/D9w0a1mIDW8Z/g3
	Vjjru+S/s3c5OUO+S/SXQ8ZTti0kVEGPj8ytPcHSG3gSBbyna0ByZjyNafRwGQ==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Fri, 28 Aug 2026 17:14:43 +0200
Subject: [meta-oe][PATCH] fitimage.bbclass: add command line property
MIME-Version: 1.0
Message-Id: <20260828-add-cmdline-fitimage-v1-1-50a1e023ea6a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCMBCE4auUfe5CjDSIVyl9iMmkXTFpSaIIp
 Xc36uMHM/9OBVlQ6NrtlPGSImtqOPUducWmGSy+mbTSRl20Yes9u+gfksBBqkTbNsEBajgHAzN
 Qu24ZQd6/7Dj9XZ63O1z9tsaIannFRMfxAbk2/qSBAAAA
X-Change-ID: 20260826-add-cmdline-fitimage-fcee053f6e65
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 15:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129558

Since version 0.9 of the fit image specification, it is possible to
embed the command line in the fit image.
Add the option to embed a command line argument for the next boot stage
in the fit image.

Link: https://github.com/open-source-firmware/flat-image-tree/releases/tag/v0.9

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 meta-oe/classes/fitimage.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.bbclass
index 03fa2fcd57..0e2a02636c 100644
--- a/meta-oe/classes/fitimage.bbclass
+++ b/meta-oe/classes/fitimage.bbclass
@@ -36,6 +36,10 @@
 #    FITIMAGE_IMAGE_bootscript[type] ?= "bootscript"
 #    FITIMAGE_IMAGE_bootscript[file] ?= "boot.scr"
 #
+#    Add a kernel command line as an optional property of the configuration
+#    node
+#    FITIMAGE_CMDLINE ?= "root=/dev/mydisk"
+#
 # Valid options for the [type] varflag are: "kernel", "fdt", "fdto", "fdtapply", "ramdisk", "bootscript".
 #
 # To enable signing, set
@@ -85,6 +89,8 @@ FITIMAGE_ENCRYPT_ALGO ?= "rsa2048"
 FITIMAGE_ENCRYPT_ALGO[doc] = "Signature algorithm to use"
 FITIMAGE_CONFIG_PREFIX ?= "conf-"
 FITIMAGE_CONFIG_PREFIX[doc] = "Prefix to use for FIT configuration node name"
+FITIMAGE_CMDLINE ?= ""
+FITIMAGE_CMDLINE[doc] = "Kernel command line to embed in the FIT configuration node"
 
 FITIMAGE_LOADADDRESS ??= ""
 FITIMAGE_ENTRYPOINT  ??= ""
@@ -286,6 +292,7 @@ def fitimage_emit_subsection_signature(d, fd, sign_images_list):
 #
 def fitimage_emit_section_config(d, fd, dtb, kernelcount, ramdiskcount, setupcount, bootscriptid, compatible, dtbcount):
     sign = d.getVar("FITIMAGE_SIGN")
+    cmdline = d.getVar("FITIMAGE_CMDLINE")
     conf_default = None
     conf_prefix = d.getVar('FITIMAGE_CONFIG_PREFIX') or ""
 
@@ -300,6 +307,8 @@ def fitimage_emit_section_config(d, fd, dtb, kernelcount, ramdiskcount, setupcou
          conf_desc += ", setup"
     if bootscriptid:
          conf_desc += ", u-boot script"
+    if cmdline:
+         conf_desc += ", command line"
     if dtbcount == 1:
         conf_default = d.getVar('FITIMAGE_DEFAULT_CONFIG') or f'{conf_prefix}{dtb}'
 
@@ -314,6 +323,8 @@ def fitimage_emit_section_config(d, fd, dtb, kernelcount, ramdiskcount, setupcou
         fd.write(f'\t\t\tramdisk = "ramdisk-{ramdiskcount}";\n')
     if bootscriptid:
         fd.write(f'\t\t\tbootscr = "bootscr-{bootscriptid}";\n')
+    if cmdline:
+        fd.write(f'\t\t\tcmdline = "{cmdline}";\n')
     if compatible:
         fd.write(f'\t\t\tcompatible = "{compatible}";\n')
 

---
base-commit: f191557494e09df5a47bedcccdb6181cb8b6dbd4
change-id: 20260826-add-cmdline-fitimage-fcee053f6e65

Best regards,
--  
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


