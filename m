Return-Path: <leon.anavi@konsulko.com>
Received: from anavi.org (unknown [91.215.217.29])
	by mail.openembedded.org (Postfix) with ESMTP id 9B42578936
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org; 
	s=default;
	h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version
	:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BTC6vS4BtdAUs5DNm6Og9NmgJ3cVVeQFQsQuKO/XIjM=;
	b=e4ebzXj9KOhHQTAhLw5pwuJHHX
	KCP4aZruXh8g+kpAkrvWUkUjpN0iT1gcPLO/Ur8OIhkmepHoSep3wliKCt2gatW41xyWBq72cUhBw
	K6J3uFCWzMP1X/gzS0GPAisiqxF+roYCjIMRtxVIMMYdVpaKZ4EaAt0TfenV1PVOI8d0=; 
Received: from [78.130.197.109] (port=41646
	helo=leon-ThinkPad-T460s.speak.local)
	by voyager.icnhost.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1fa1Jc-0002Ye-1E; Mon, 02 Jul 2018 19:04:36 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Jul 2018 19:04:22 +0300
Message-Id: <20180702160423.5965-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.14.1
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] paho-mqtt-c: Upgrade to 1.2.1
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
X-List-Received-Date: Mon, 02 Jul 2018 16:04:36 -0000

Upgrade paho.mqtt.c to the latest stable release from April 10.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../paho-mqtt-c/{paho-mqtt-c_1.2.0.bb => paho-mqtt-c_1.2.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.2.0.bb => paho-mqtt-c_1.2.1.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.0.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.1.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.0.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.1.bb
index fec380ce6..a7a9b5a6c 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.0.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.1.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http"
 
-SRCREV = "e8d34da24ad807f5e698b327d67591fd4b4bfa7e"
+SRCREV = "09fe0744e02f317b907e96dd5afcc02224ddbb85"
 
 DEPENDS = "openssl"
 
-- 
2.11.0


