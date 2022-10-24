Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91004C433FE
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 01:27:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.14778.1666574872647397317
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 18:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=BibZi/Y/;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.201, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 7E7ED1BF205;
	Mon, 24 Oct 2022 01:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1666574870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oXMeGi0NDUeAddZMJqu7Ozlyrcx/W8eFxh5D3vN1hWI=;
	b=BibZi/Y/5rhXouVazPTpuaXhgG3yu9rM01NXZ1/dJ2LZpYLYisQk/pjisKfA1UmqUJ4lsg
	E9RvzCEQoYe2kiELSDLjwqD7hdpAZ4pcfdCZ89l45S7A5y4N/scrk8J9vNHWJRu8HesalX
	1Gur73mAD8Oky6doWQrPT49xLwbsfhylT7Z6yZ9QBDOTMk4NzbmJWKI68rO+eQu/ofHO/0
	PfHGm+cdTUJMOnKxIHG6Bppssp32YkrIDDLvINz7JowOqhkxQM97l+vbz164XFR6o4HgV6
	Ha8vB/cQucBE3AMy/3Vi1v9H8Mrw1VWofpXO9GKvwpm4U9yheMHgx8vlTGn8Mg==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][master][langdale][PATCH] fwupd: Fix plugin_gpio PACKAGECONFIG
Date: Sun, 23 Oct 2022 18:27:16 -0700
Message-Id: <20221024012716.1444793-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 01:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99261

Trying to disable the gpio plugin results in an error

	ERROR: Option 'plugin_gpio' must have a value separated by equals sign.

Correct the PACKAGECONFIG for this option so it can be disabled.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
index 72f37aea8..99077923d 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
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


