Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1FDED61769
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:44:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PNk26GvNz40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:44:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582317883;
	bh=Cv7ELb24QbonU4WwUxJX6ZU/KW1fuVoRHhBnxFH0wSU=;
	h=From:To:Subject:Date:From;
	b=VxXdsXzttojUEb2tHe0maHmmaLO6rWDs35WbiGJyByvtbSEGR7UsFPrWq4tGc6sqk
	beE4ItdXaaO6a/VIUOe6FEzhJMOWEClK3h0a7a7AYt6AO32WjMr7fkWK0WfVUpZLPX
	ZdrtbTvOAnlhoT3PwD5YRqUppPRDxapC7T/HbzkQmJ9CyZXZwwS2rgPFg7/Zw2n8bj
	ysxXC6x+DqvF26mL5GhH9kv9CZp4X4WVRu2/fFUlu5DwLE3tFj6HqCwlOKLbkFE3mS
	vOJ3h0d9aTordtYa1oTw9PVsnisEIyzTvNrrXOvojCmGauh6pKXpvC/dCRJsPr6Rg9
	trFusrPx7SWpEwYlhYfz73kacRpcl5+l/zAVQXmUlaGk3IBbCuLouoLbeAXavzfkoy
	ng4ZZnDSPzghTKTVjZ6F0Qu+hxmwTiObnFhe0e3XIAcagVSVqsYW/780KtAV4pV81W
	XuSMKKTBPmb+AY/f9Gm8XgEUuLYC13YmmEWr4HiqCHiwm2dxcYqDW+qike01jxJkSU
	G5S1aAkC3W/xKl4f/z8piaY5+8goDwqS2dL2HxEpfflmZacZmxPoF5VEVUeyi2TMb3
	qDU0ZlBHvug11wXH+8A51Caph2qsBnFemdrHC6mPvrCo1tIhZocFmtkvBvkUQbU6r1
	dUiSjUeoDdVVter6D+Sic0wE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2020 22:44:38 +0200
Message-Id: <20200221204440.16807-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][warrior][PATCH] modemmanager: Upgrade 1.8.2 -> 1.8.4
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
X-List-Received-Date: Fri, 21 Feb 2020 20:44:43 -0000

Bugfix release on the 1.8 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{modemmanager_1.8.2.bb => modemmanager_1.8.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.8.2.bb => modemmanager_1.8.4.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.4.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.4.bb
index f9b302a3d..5895a8b76 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.4.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.t
            file://0001-Do-not-pass-null-string-to-s-printf-formatted-string.patch \
            "
 
-SRC_URI[md5sum] = "a49c9f73e46c7b89e5efedda250d22c0"
-SRC_URI[sha256sum] = "96f2a5f0ed15532b4c4c185b756fdc0326e7c2027cea26a1264f91e098260f80"
+SRC_URI[md5sum] = "460661e12b7cc1da5c0920bdfe9f38de"
+SRC_URI[sha256sum] = "d9d0ef25e256586ce3c9bbe4b27f443721f8c891340e5e9087a21f5d70e637da"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.17.1


