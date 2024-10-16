Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B65D206A2
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 06:48:04 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.17066.1729061282650267541
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Oct 2024 23:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1t0xpA-0004qW-Rt; Wed, 16 Oct 2024 08:48:00 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1t0xp9-002D0E-IE; Wed, 16 Oct 2024 08:47:59 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <uol@pengutronix.de>)
	id 1t0xp9-0037Eu-1P;
	Wed, 16 Oct 2024 08:47:59 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [meta-oe][PATCH] fitimage: fix name of default configuration
Date: Wed, 16 Oct 2024 08:47:56 +0200
Message-Id: <20241016064756.742803-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 06:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112936

The new fitimage.bbclass was introduced via GitHub pullrequest [1]. There was a
small force-push which implemented a prefix for the names of the configuration
nodes to harmonize the class with the mechanism found in OE-core (see [2] & [3]).
Unfortunately it was forgotten to also apply that prefix to the name of the
configuration to utilize by default - fix that.

[1] https://github.com/openembedded/meta-openembedded/pull/882
[2] https://github.com/openembedded/meta-openembedded/pull/882#issuecomment-2402218973
[3] https://github.com/openembedded/meta-openembedded/compare/0773f63e829b399a3e87cee03b009846c48b8429..32e7947154ea10e17f5db95d6bfaaf5074663fc7

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta-oe/classes/fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.bbclass
index 78e30eca3395..ebd034883b97 100644
--- a/meta-oe/classes/fitimage.bbclass
+++ b/meta-oe/classes/fitimage.bbclass
@@ -302,7 +302,7 @@ def fitimage_emit_section_config(d, fd, dtb, kernelcount, ramdiskcount, setupcou
     if bootscriptid:
          conf_desc += ", u-boot script"
     if dtbcount == 1:
-        conf_default = d.getVar('FITIMAGE_DEFAULT_CONFIG', True) or dtb
+        conf_default = d.getVar('FITIMAGE_DEFAULT_CONFIG', True) or f'{conf_prefix}{dtb}'
 
     if conf_default:
         fd.write(f'\t\tdefault = "{conf_default}";\n')
-- 
2.39.5


