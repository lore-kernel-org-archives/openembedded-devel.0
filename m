Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 40AC171C56
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 06:45:52 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id t3so4562373pgt.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 23:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+3r35qiPP76pED7vP0UFB35mAPAbtzqw2vGad2TqlUM=;
	b=DjN1vhj/zPsZ8OwTSCjA385T/FrDbvcgGI4tssb5yagTEg0VI530AIItC5L8+43k97
	1jXXcvfpotjlAOxs3qNJaLlBkcc3Siot/CSRrZBulEkh8+OxlzPcfgbdK2XKE1urR5CU
	uxTYT4Y7HFuoFYqmWcH/BA1rnE4Fe9JbTGtYyciu/6jsPuUdNTYj4vgc5hWOB3hA0rlR
	i2SAy3oWbhWsI5wLxFRbxS5H23xnEL3EqrZ1KrMTUGHH0UwkY2nQYS6y1i1O20UCfwaB
	rz0JwjHeOX1AtXMi8poLaw9kvvaMC3Y3cM3B41SOTJeb0wQaQfUmXFyFsYU9SSiCliCQ
	aokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+3r35qiPP76pED7vP0UFB35mAPAbtzqw2vGad2TqlUM=;
	b=h7cwOYSyoh/YspZKE3X66z9YRx4xFBlfozDsna/v971jO3jX87nqed45/I8byM4zRA
	5SKLXccCiKxY0wRzeZa74pt+Z06fK9B26IU3ZexWuc0RdfCyQNhkvcmBr2co/YFEHigc
	nMZOKw+KM87DAyaeKxiCVhoMgt0teXoVQlSCZ0BE7Ib0JbLNw1LN+m3OtW/huWFEnv1O
	J6IMB1a6oU2HImbEYkTLRSKUJMQiSJsv7tOOkWx1H8xzRfS8RLlKBuwhus0kjClyScw4
	PvheGlZn8Z8bDADDXKoi+2OjBz5pAffmQ3sv3ktAHmrzF+1KImNwLTkt93dM18WHPGTL
	2GLg==
X-Gm-Message-State: AHPjjUhnA0NbMbhD4R6pvDljh3Uyh6I2NHVpbgk3PL4i5YpZdc9UWfWn
	/wehmrwPcg0Ra36V
X-Google-Smtp-Source: ADKCNb7JoZqLUPnk4fVSRz/kKq2LBK6NA2i1Scyfo/2bNXnaVyz2TfD2Wrj674m2ioCFzHjJZojJXw==
X-Received: by 10.99.2.5 with SMTP id 5mr1641118pgc.369.1504766753987;
	Wed, 06 Sep 2017 23:45:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id
	x28sm2187951pgc.91.2017.09.06.23.45.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Sep 2017 23:45:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Sep 2017 23:45:41 -0700
Message-Id: <20170907064543.11580-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/3] leptonica: Upgrade to 1.74.4
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
X-List-Received-Date: Thu, 07 Sep 2017 06:45:53 -0000

copyright year changed to 2016

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../leptonica/{leptonica_1.73.bb => leptonica_1.74.4.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/leptonica/{leptonica_1.73.bb => leptonica_1.74.4.bb} (69%)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb
similarity index 69%
rename from meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
rename to meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb
index c32d24aca..91fa00cc9 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.74.4.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "A pedagogically-oriented open source site containing software that is broadly useful for image processing and image analysis applications"
 DEPENDS = "jpeg tiff libpng zlib"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=20cdd3af097ca431b82004c691f406a6"
+LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=34aa579294e8284b7b848c8d5d361e8f"
 
 SRC_URI = "http://leptonica.com/source/leptonica-${PV}.tar.gz"
-SRC_URI[md5sum] = "092cea2e568cada79fff178820397922"
-SRC_URI[sha256sum] = "19e4335c674e7b78af9338d5382cc5266f34a62d4ce533d860af48eaa859afc1"
+SRC_URI[md5sum] = "4f32be9bd2e2c142ba018037ab5d746f"
+SRC_URI[sha256sum] = "29c35426a416bf454413c6fec24c24a0b633e26144a17e98351b6dffaa4a833b"
 
 EXTRA_OECONF += " \
     --without-libwebp \
-- 
2.14.1


