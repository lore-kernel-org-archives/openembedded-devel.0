Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 988CE6FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2018 15:50:08 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id d54so40144873qtd.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Feb 2018 07:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:organization;
	bh=qP9vdB9NuIf1Kr6lY/aqLPyh3oJYPhrH0CvBPil3Q1M=;
	b=x6x6EZEOh1FVZvTCaJWwChLlw1tr9rNF818VA9Vq5Bvoxv7FtvYb6ETsCG9rQ+mBim
	G3YpeVvGgd/g+oHantWXfQT9a0hqHWE+YRMrX0Gve8PQFwNF25a132tDmizmC2FGFujm
	QbdCy/HWPf0qdVIZV27oKSsy2VXrYbucMDELE442cjIGF6k0tZkueuDdCWnnx2hKEQwv
	8ExHjF7HEGGYXb4EF1CZufUDRvxcxgNgD9wBzorOuwcs97IK/tWb2c+63wtvTXNAeSUg
	P3jBTGBSnFJicrfUjCCNOCwmqLKNv++HQgaBaWqFk5b87cokmasV4bgQdDLGr+2AvGdS
	/RUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:organization;
	bh=qP9vdB9NuIf1Kr6lY/aqLPyh3oJYPhrH0CvBPil3Q1M=;
	b=aLZUO6yFXx1valVGQF2HcMKDff+uyQ7E0jSABtzNfx+CtawZU2TFUcObMt9yudtMyu
	wQ4zAY1/O7c9S9p98H0GtZ0iRhOQGO3Jb4P3t+Ox77YBWl3vsa5x0bjnBfpEJ/flGwuC
	WfETvLlzE1Pk6TtZl/DFfa4pE5pSmn1bfjDD/QAPwTz0jH9Qb5fQBVJNvQFPANtnmfgT
	QT2kWMAqiwG5IpK89agdWhE1gtmr/NZ/IKLuYmR7XS8Wu2HYLalJ/8lIsSB53Mn3IUkS
	XuQm9BtNUqVGUvgC9eMcRA8mqDIkRup7nZeHu4w/dBzpNrkAVf9NnjpcKY8WLWWwfg6D
	d02Q==
X-Gm-Message-State: APf1xPCmJHd9iY51IAqFi/z7KqdIrYGb6DMZyBI72COgrQAds/v4HatR
	qDatirjLVdOf1XNjqHxDk9vgUdu2
X-Google-Smtp-Source: AH8x227jVV0dUJug0fy3CELYqdkGD5JZg+C1bzsiSHACp/D8eyikavOKwQ7stE9VeJeMfuRp+zohVw==
X-Received: by 10.200.24.136 with SMTP id s8mr6729964qtj.239.1517845809454;
	Mon, 05 Feb 2018 07:50:09 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	t90sm6068619qtd.42.2018.02.05.07.50.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 07:50:08 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Feb 2018 13:49:55 -0200
Message-Id: <20180205154955.4244-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH] libqmi: Update to version 1.20.0
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
X-List-Received-Date: Mon, 05 Feb 2018 15:50:08 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../libqmi/{libqmi_1.16.0.bb => libqmi_1.20.0.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.16.0.bb => libqmi_1.20.0.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.0.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.20.0.bb
index 80c26c05c..9301cbd5e 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.0.bb
@@ -14,5 +14,5 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-Detect-clang.patch \
            "
-SRC_URI[md5sum] = "4970c110f160b33637a3515004c637b2"
-SRC_URI[sha256sum] = "7ab6bb47fd23bf4d3fa17424e40ea5552d08b19e5ee4f125f21f316c8086ba2a"
+SRC_URI[md5sum] = "797e365521df76b77b067e6317618b41"
+SRC_URI[sha256sum] = "21428cd3749c56246565123f707fee51238651a22c60bdc85ebce97388626eb4"
-- 
2.14.2


