Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id EDEBC7D2D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 11:07:18 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id v13so14468414ljk.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 04:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=sOpuvqnaacM/CMKwmwq4XBzjTMaqip1XfwSpNVPe1Iw=;
	b=RsKhlGDyvQ1BDKz+pf0kHtgia0ThNYENNOGw/4lCAIf5PRLrB/GM2vqiMW6fFTI0xn
	/8/6gclkKckjDXl3oaCVgRCkgfOk2ATr7SbADO9BX4ykB6S0N1+FiZiIR0AX61aW6PHP
	q6Er4Y5b1WDp4Bc+xibF89dB/A+9Ta1tZJuaNOUX92GYC8AsvIC6VP0dIo039xD3cMIO
	8uFuZI9nYmxVnw+h7587Ew+1L+8z9gCp5X8mzwOCDsDFfdkiwSBzshvY2v/SRL8QbFVp
	xr+sVFo74m0Lt59VcMtuQxRyiG88B0AOKSncRAO3/hiB8HjPy/G0Pn3n5+VpeEpMkVIV
	ZybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sOpuvqnaacM/CMKwmwq4XBzjTMaqip1XfwSpNVPe1Iw=;
	b=MLGU42FPn6aEsEcilQtYMWGdp4acmVDUnf78U/1B2bpRr2I7nbEtbJIKQ4EkCuKKc8
	hPXJ6WRQP9Naol4y6bLmHtYhMha3xBesssRETLCyvw/ubWctQVM7tmOcuTLZX7ZEqooa
	8iP0nEEKRWBbgM1nL99DFtm4k+9L8pSVkbR7+n1irQ9cgkMVoxC0WTwnsR73nz2XwUEG
	3LsV8iDUnSNXveTbmKpz/wAOun8olAVLv5uxMt2fVNEV6uB2cYpmPXcEFDAswYIbNOeL
	IfTTtZXWImRQAkxyyQwlIJBl7UU/uoa2WONBEt+9t5TVqyw2maSxYLdMLQs7y4Ho4P3j
	JoCA==
X-Gm-Message-State: APjAAAXABdWYFEM9iAaXDszTzzILbwhPJC30T2o/oncix2JAfs/wR9OJ
	btb7SPhj+UjAoCDwJsgS1ZcBP2Pk3lw=
X-Google-Smtp-Source: APXvYqz9QfZ6Dec3sH6QvfaGTCslVP1IDrD5zkOC5dN+O8jVAV+2WdlOz927eUtocJBsXLL05fDsOQ==
X-Received: by 2002:a2e:8616:: with SMTP id a22mr4086981lji.173.1554289639473; 
	Wed, 03 Apr 2019 04:07:19 -0700 (PDT)
Received: from scout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	u11sm2902348lfb.17.2019.04.03.04.07.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 04:07:19 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Apr 2019 13:07:14 +0200
Message-Id: <20190403110714.49147-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [meta-oe] libsocketcan: update to 0.0.11
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
X-List-Received-Date: Wed, 03 Apr 2019 11:07:19 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../{libsocketcan_0.0.10.bb => libsocketcan_0.0.11.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/socketcan/{libsocketcan_0.0.10.bb => libsocketcan_0.0.11.bb} (88%)

diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.10.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb
similarity index 88%
rename from meta-oe/recipes-extended/socketcan/libsocketcan_0.0.10.bb
rename to meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb
index 60ca58016..0debe47e0 100644
--- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.10.bb
+++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb
@@ -5,7 +5,7 @@ SECTION = "libs/network"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://src/libsocketcan.c;beginline=3;endline=17;md5=97e38adced4385d8fba1ae2437cedee1"
 
-SRCREV = "51f1610160a1707f026f8c2d714a6f7aa3ca232b"
+SRCREV = "0ff01ae7e4d271a7b81241e7a7026bfcea0add3f"
 
 SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git"
 
-- 
2.17.1


