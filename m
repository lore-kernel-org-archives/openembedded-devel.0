Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE3A71C64
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Feb 2017 18:10:22 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r18so7295091wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2017 10:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/5tgPdV0u43ntXoh8AzzfePPk4IZfhY0Ts9ILzsnjTo=;
	b=NHYIMlG3hiPRONz1k7wIFyTxssYuR+CAclPcGGDUyFtsv3kBA6N9IRX1MsLoNhWJtf
	so/UMCeR5WkY7eB11fCVDrdcLQxF1oxs/EvrSNsCHpZcOJIckwVAeqYq9KkNMPIgv4bs
	QzOo/zm2aSDIlCy/tVltprOINRrMtZV70N3ni/TeYmnNruR+dGZHvJ5HPHxF/kIl1130
	xOsC8MhOGLyAYFn4La6mLigUOuifTo15zv/B+EtWQOo7/mhUSFF5b9N7rmmB+93p0zJA
	IFfWCA1uqmDDQWyQmmo10F5oph0hNP/ouO8RMSZ3romb8Lt/dBAsrmosT1jn6a3JhHq+
	Ba+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/5tgPdV0u43ntXoh8AzzfePPk4IZfhY0Ts9ILzsnjTo=;
	b=RYkrTR1M9H0NdVNgxyxQTsG9/YouQN6QEJYDsJ8axMzPpJdl31bsmDoh7uOLYJlIAd
	7KCgZOgMUVir6HT4/wJWMGMcGj1C97LAujorgeuTjbSpqLIzss+ys8kMgpCvgzL4RVB+
	etZfDdRDyTXTJxfHl+doTgGkZnqTMWt3ubUN7SEatqWvKJ7//l+xz+XCKTdUp9+xPVS5
	Z2ED6yTgRnoGTacWE8pzSE4axditLro2I07Wg+F3ImYSaRaGr9GWbIsCk6OzMB5wwUv+
	qgvOuFQbo6Qjz+4eRSWCLGhuGp8gSoDiYfFJ6hhE7gl/qjr9S/36ZMKiam39pojle3AT
	ZZmw==
X-Gm-Message-State: AIkVDXL12CdGuaaMbUlFXOEI9AY6HDiArhQrjiCCxfhfyqemnJ7vZC1AXAWQnlB1vFNfag==
X-Received: by 10.28.20.144 with SMTP id 138mr18695698wmu.41.1485972622284;
	Wed, 01 Feb 2017 10:10:22 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m29sm35321336wrm.38.2017.02.01.10.10.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Feb 2017 10:10:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Feb 2017 19:10:17 +0100
Message-Id: <20170201181018.12894-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH][meta-oe 1/2] vboxguestdrivers: upgrade to 5.1.14 to fix compatibility with 4.9 kernel
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
X-List-Received-Date: Wed, 01 Feb 2017 18:10:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{vboxguestdrivers_5.1.6.bb => vboxguestdrivers_5.1.14.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.1.6.bb => vboxguestdrivers_5.1.14.bb} (93%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.6.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.14.bb
similarity index 93%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.6.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.14.bb
index 8665267..dde5b0b 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.6.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.14.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
            file://Makefile.utils \
 "
-SRC_URI[md5sum] = "8c2331a718cfc038963c1214c2ba9811"
-SRC_URI[sha256sum] = "2e0112b0d85841587b8f212e6ba8f6c35b31e1cce6b6999497dc917cd37e6911"
+SRC_URI[md5sum] = "21eaec9f21477d555559a63761779880"
+SRC_URI[sha256sum] = "8267bb026717c6e55237eb798210767d9c703cfcdf01224d9bc26f7dac9f228a"
 
 S = "${WORKDIR}/vbox_module"
 
-- 
2.10.2


