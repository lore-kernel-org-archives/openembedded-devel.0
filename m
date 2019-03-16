Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id D863C7BF70
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 16:06:15 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id j25so4046555lji.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 09:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=T9muiyMWGA3/spb6u9uE15eS8mCfqQuTO64ZAClJRpM=;
	b=SMRce/6xUkmw9kPHaqtJkyggrqRXsYO4vAez4V6U1ZIV39sD4pavRt+GlCeH22c1Tx
	V0bmB/Om/lIVksEq0X/bYbGQULYWGx9nsggEkc261of/MVBjlTyFtojgCb17HXp7dV/m
	3G+Mqa9+JMKAlmCwwh7KlSdNM5pLQ8MguFS52SfRe7dhWEABiK4SaBkeqeLA8a6SD5zE
	SwtVim1gbmoR49hDE8G8IRPXdZHhQnfpTtghS4o4m4P8pcoPVWiuiwHyMHENx/t2MkHx
	iq2RUbaZe10lmba7r7XXDKnCmEet4X51zkCZYJbfNF9gfGPFavCUiTIeVTxPQIPHHY1u
	xORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T9muiyMWGA3/spb6u9uE15eS8mCfqQuTO64ZAClJRpM=;
	b=HqxDou0J7stWV6GJyVVq4XK4WVUXqDuelzdP0/QtmSWM26mOQMNE29H1yLiT1AcSdl
	FvI6RpLyjnwaFY1eLtMlZo0NZuSike4qaw2d85RlNsmORvbhGkl3Y4GpRa0sP2bMSg1x
	gC/cNM5QyRkQUlKYRik1wcdoSf0ywNpE+OgsrS4re5LsVM3Kt8aBR47tBWcSw2bDxNNl
	kwek8CHrHe6ea1hi8f/fxjtBgB4S/fFOJZ8EbXf1LyMOnfqK2HoZUiIqNbgf8E7CJQAn
	VcYrWW1w8luNExAuEfFduLk0qdCyU6R2kd9JUOcXdGPsi1Flxyq5d35IV8nUjJak13TN
	U5Jw==
X-Gm-Message-State: APjAAAX424DxVTSkCcd2Ncdc178NOe70u4Y5gwGu3krnWjci5mhDGfPr
	x4fir/JsGedtZ3N7JjiwmgtSXpzOSiI=
X-Google-Smtp-Source: APXvYqwqqgVr4bK41VE6SxOi6YgYt9Gdp1/LSbFTc5BxQ1K5khOjgBl6X4l7zwIzl4A5fA4KpBlyGA==
X-Received: by 2002:a2e:500d:: with SMTP id e13mr2464813ljb.169.1552752375818; 
	Sat, 16 Mar 2019 09:06:15 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	p22sm1023438lfh.93.2019.03.16.09.06.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Mar 2019 09:06:15 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Mar 2019 17:06:06 +0100
Message-Id: <20190316160606.775-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] mosquitto: update to 1.5.8
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
X-List-Received-Date: Sat, 16 Mar 2019 16:06:16 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../mosquitto/{mosquitto_1.5.4.bb => mosquitto_1.5.8.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.5.4.bb => mosquitto_1.5.8.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.8.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.8.bb
index 8f406ff9c..768b5930f 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.8.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
 "
 
-SRC_URI[md5sum] = "4fe8eb707777eb4bfcb5cd432c30a467"
-SRC_URI[sha256sum] = "5fd7f3454fd6d286645d032bc07f44a1c8583cec02ef2422c9eb32e0a89a9b2f"
+SRC_URI[md5sum] = "bbbcceb32db3657d9d436a8440a9db1c"
+SRC_URI[sha256sum] = "78d7e70c3794dc3a1d484b4f2f8d3addebe9c2da3f5a1cebe557f7d13beb0da4"
 
 inherit systemd update-rc.d useradd
 
-- 
2.17.1


