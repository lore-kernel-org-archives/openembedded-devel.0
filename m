Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id E984E7C0AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 09:35:47 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id o17so5689737wrw.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 01:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZHbMi/v+1a0pWyqq70P8QR5HtS66dUDZ1I2txsH+OGM=;
	b=dpBZLsGMUI2L7ycW4IrynU0cKxuxTMgytRfFxGqkyYHZJ1jV3jBChwAnjIj/ZUlLi5
	zmrDTU88judcowPkTasNqMSgWOIcCp+0psbnlyNiOjY9i2MmDmyq0YoRJeFXd2wCliQE
	ImeX6AHgBnXRwN37D4t9wzdFGIf2VmaFzxrc0BSMcWVJ1nY6fhZOffnM/OEu7orJGeAg
	eUoxJjazydlb6/Ffr7Mz7RPd/EmXOkNxuirXUz+3rSU3PvBjYyDGQWuPH1YoRjKSkR3J
	YNs8QZeixG+LwsQDcNv++/Xn3UZttbjs8EedIxpgnDj+2qkJ571h/45xlivAXyX+e3sx
	ZAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZHbMi/v+1a0pWyqq70P8QR5HtS66dUDZ1I2txsH+OGM=;
	b=s3hxwN3OCGdoDXrW4f3utP2OVzkxFoAMm4ba5+6j42g9h41yeMCbxd7oPqOvwFXOtm
	ml6uYnrKpaAY+f/3HsKnspxE0sykG3JbZqSd742TyRisD5cjTk1EzGjZui28iZ6o86J9
	3yxGlGy4SJuL+e//LgoI7RzWewREvPRIr8s9FYjb31j1mEI8w07/5HNqv9o60zS0w1Qt
	cjBZbiTkeGSGsqbWa4qxre9x8YCBWYcK73cH94p18jas8/n9RuZGvhrZNH17N/x310L5
	rnfwdx6iJ/XBWrvna1cRoaYwNpolxoKCQx5Qou8xjrcZdN9+w6G8/gcvClFAl3LLNE/o
	PzyQ==
X-Gm-Message-State: AHQUAubTUaf68DDiAqpR7/LamZrkqmtxUb6ZR+uxVrpKH6Bo8eBR+wMb
	P9x9GbOhimaviPO3II1LGH12HZsy
X-Google-Smtp-Source: AHgI3IZCg7epQKGEuu87OeLi7sl5FSzszDCC36Tv8cCdGBQT3+RKGb/yt71lHaVRR3nYd4RV1s1LNA==
X-Received: by 2002:a5d:52c3:: with SMTP id r3mr1997519wrv.163.1550136947867; 
	Thu, 14 Feb 2019 01:35:47 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id e6sm1258232wrt.14.2019.02.14.01.35.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Feb 2019 01:35:46 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Feb 2019 10:35:30 +0100
Message-Id: <20190214093534.10835-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/5] catfish: upgrade 1.4.6 -> 1.4.7
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
X-List-Received-Date: Thu, 14 Feb 2019 09:35:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../catfish/{catfish_1.4.6.bb => catfish_1.4.7.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/catfish/{catfish_1.4.6.bb => catfish_1.4.7.bb} (72%)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb b/meta-xfce/recipes-apps/catfish/catfish_1.4.7.bb
similarity index 72%
rename from meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb
rename to meta-xfce/recipes-apps/catfish/catfish_1.4.7.bb
index 229f882d0..84d5692ef 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_1.4.7.bb
@@ -9,8 +9,8 @@ DEPENDS += "python3-distutils-extra-native"
 
 B = "${S}"
 
-SRC_URI[md5sum] = "879197c9400be2a80d51abf494bfffb6"
-SRC_URI[sha256sum] = "e1caee14c5268ac781434701c0eb26eddfced2c0f1ae066549583ed05f99adbf"
+SRC_URI[md5sum] = "f4c1c2b2c560824cab8d7f6c7bd624ca"
+SRC_URI[sha256sum] = "48caaac872d29e2762e31e59ade1310cb860af55f1a36f2520ce1d90c39227e9"
 
 FILES_${PN} += "${datadir}/metainfo"
 
-- 
2.20.1


