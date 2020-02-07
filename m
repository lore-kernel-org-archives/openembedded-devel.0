Return-Path: <bunk@stusta.de>
X-Greylist: delayed 384 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Feb 2020 22:15:36 UTC
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F165660CE7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2020 22:15:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48DqFz3mGdz22
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2020 23:09:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1581113351;
	bh=buQ3REZbFpb9JXYiYLMXG3fuuJKE0+wP4oPAYrsB9zk=;
	h=From:To:Subject:Date:From;
	b=J0X9eNCcoIWlQkCTzF788rUg0is57ZWcyPakCB9hFZSQZW84oDr0pIR/3PdkINkeM
	WxKBQgfsLCZBMGxPERCRkKkc08wNHUNCwyVsRU7DmV4EB4Xloj2+QktN5W1egUQCsw
	7+GdpujK85ed/PLgh5llb1Wg5/PZeBfar8rDeDgvUF0MPvPAGq4MvfaZGALVmi6sCd
	/mZHjkpcevl/vWN5QWl4FGyIs+7mYgwyRPeVYoWPkW0eJMrAmExwMhcX+wN4j/hRgD
	yImgrA1Er6lXirT5Lv8C8WkH0az8jJSnCAh1JdiGLbmzwTA4EsCOCH++1us33nmba/
	EQ93YdPz9a5nuBZRH/uT+JN7Uk8DoifUYkQ0hMUAdfhW56ktCv161KgKt/BnnG1YnU
	wQ5U1wCTmtkU2WeFa5x2nsOCdNafcvPKpQukGgcPG7aLG7lXZQ93UWdp6225iaZCOJ
	RI60S0FC7mP0ft+h/JigAlp2QIQiqBP20hQ3r4d8AFYNrkqAVdM4ahARVWSEVx4ncP
	3ovPNt6wen8xMH4coI/aqj2J85hY1TDHaAEbvnDDxfoeewqNJH85lzRjd7vqPCumNn
	IutoURug0VgbpqcJOl3ghdDN7kQqPEDXN2BjrzihwPvnp1NY8QNVGv5b1TIgmjf9BW
	cPsam98oR3n1yC3XzsCQjIA4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Feb 2020 00:09:10 +0200
Message-Id: <20200207220910.31762-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] modemmanager: Add a PACKAGECONFIG for the new --with-at-command-via-dbus option
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
X-List-Received-Date: Fri, 07 Feb 2020 22:15:37 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.4.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.4.bb
index 3639f02ca..1f64be09e 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.4.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.4.bb
@@ -23,6 +23,7 @@ PACKAGECONFIG ??= "mbim qmi \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd polkit', d)} \
 "
 
+PACKAGECONFIG[at] = "--with-at-command-via-dbus"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,"
 PACKAGECONFIG[polkit] = "--with-polkit=yes,--with-polkit=no,polkit"
 # Support WWAN modems and devices which speak the Mobile Interface Broadband Model (MBIM) protocol.
-- 
2.17.1


