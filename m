Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73632C4167B
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 10:04:58 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.59629.1702634689679589535
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Dec 2023 02:04:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jdYG15G2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 116532000E;
	Fri, 15 Dec 2023 10:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702634687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ORn1BfzJnqaHv2dOCs77v4Ok5ybngOJVgx0Oq1mdf08=;
	b=jdYG15G2FL2EKkxMvG+hNT2l2eE12UKXJihFEwrmSvqLXseNnvLK3AYl0IraWIdqv9fYgE
	cWE7EAkSFnt11m/TqRbyzhfznTt6WEWdVv57ttFkNw6aflGZwlITNq6YX8aXk5n8sWIWJe
	rdHZfDmkON6aBfdVjVhXibBni7MddxsO5vm+O+/1YfGkz1CcslHs+1rNXICXU/Q6ZpSeSw
	Eqy19YdhZHWWNREnAdPUSA0BikVEOX42JUjEsTKskAI64IF/BbjEBeFw5e6i0zsLqiWrlf
	SHQPVvVAo+yNrGN6zNbpG3X93LxXhFonhjwjZ3lEaudgHvSeIt1aVsJnUubBsw==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-networking][PATCH] networkmanager: add missing modemmanager rdepends
Date: Fri, 15 Dec 2023 11:04:44 +0100
Message-ID: <20231215100444.122616-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 10:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107514

From: Thomas Perrot <thomas.perrot@bootlin.com>

Fix rdepends with modemmanager PACKAGECONFIG enabled.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .../networkmanager/networkmanager_1.44.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
index d213ef650faa..c686ecec1e22 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
@@ -88,7 +88,7 @@ PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false,polkit"
 PACKAGECONFIG[bluez5] = "-Dbluez5_dun=true,-Dbluez5_dun=false,bluez5"
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "-Dsession_tracking_consolekit=true,-Dsession_tracking_consolekit=false,consolekit,consolekit"
-PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info"
+PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info,modemmanager mobile-broadband-provider-info"
 PACKAGECONFIG[ppp] = "-Dppp=true -Dpppd=${sbindir}/pppd,-Dppp=false,ppp"
 PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
-- 
2.43.0


