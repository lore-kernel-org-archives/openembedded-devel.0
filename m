Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D225EC433FE
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 02:52:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.15296.1666579941915540320
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 19:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=Ll5U1xQ6;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.201, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 8B74D1BF205;
	Mon, 24 Oct 2022 02:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1666579939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Lg077h0/bl7p2urFQGH0SFXG+VDgpeSJN7s4I+JnkIU=;
	b=Ll5U1xQ6FU9uRK1VJkM0hGQQjrAqsaIBp+iMU+DVEyaIjwPOmk7V/L9hHowNqT7M7b6I8j
	l29DmgcVIN7CtmXC5J2sMd5geQSJic7nEpCcNbqud+gBEygv/wv72ViyA4W7M/MnDrY1DW
	KEHZxeUE+9G0Il4XxxffZ9qGnFp0UHxf3vJH8tUjYNNa8zZ8P22EtTA9s87Au5S9unkLbX
	7nG6DVPxSLEULqVSVL5cHYRfqPB5ayjuWfforpgk94RIwn/Q9u9Lpyq55V1xasLeJjCmUh
	3Iopoork829h829UU3m4dj61AlKsvJFfOILm6ZEjsk151pa33uZS/3vsSx5nIA==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][kirkstone][PATCH] fwupd: Fix plugin_gpio PACKAGECONFIG
Date: Sun, 23 Oct 2022 19:51:41 -0700
Message-Id: <20221024025141.2506774-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 02:52:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99262

Trying to disable the gpio plugin results in an error

	ERROR: Option 'plugin_gpio' must have a value separated by equals sign.

Correct the PACKAGECONFIG for this option so it can be disabled.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
index 53f1720b0..62d054586 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
@@ -83,7 +83,7 @@ PACKAGECONFIG[plugin_emmc] = "-Dplugin_emmc=true,-Dplugin_emmc=false"
 PACKAGECONFIG[plugin_ep963x] = "-Dplugin_ep963x=true,-Dplugin_ep963x=false"
 PACKAGECONFIG[plugin_fastboot] = "-Dplugin_fastboot=true,-Dplugin_fastboot=false"
 PACKAGECONFIG[plugin_flashrom] = "-Dplugin_flashrom=true,-Dplugin_flashrom=false,flashrom"
-PACKAGECONFIG[plugin_gpio] = "-Dplugin_gpio=true,-Dplugin_gpio"
+PACKAGECONFIG[plugin_gpio] = "-Dplugin_gpio=true,-Dplugin_gpio=false"
 PACKAGECONFIG[plugin_intel_spi] = "-Dplugin_intel_spi=true -Dlzma=true,-Dplugin_intel_spi=false -Dlzma=false,xz"
 PACKAGECONFIG[plugin_logitech_bulkcontroller] = "-Dplugin_logitech_bulkcontroller=true,-Dplugin_logitech_bulkcontroller=false,protobuf-c-native protobuf-c"
 PACKAGECONFIG[plugin_modem_manager] = "-Dplugin_modem_manager=true,-Dplugin_modem_manager=false,libqmi modemmanager"
-- 
2.37.4


