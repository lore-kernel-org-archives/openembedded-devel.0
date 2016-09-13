Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 30A75731CF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 08:31:31 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id s29so6834831lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 01:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SxbNyb+o5BLLpeRtIwKawLL+W1V4D+8d5Ly4N00FwfA=;
	b=VtKTVPjFHB+TKouFlX0N0dIYlFoG1Cphhu63QxgcPp+JGur1BHujAqFj0rITBWX4NF
	PB+lNCZ4D32Gxw6F5I2h3z+uhac89htBiyyAoXCrNhIG1ZgTxUFE7TbFXm2ZL+A8I+QZ
	yf5tahK4Y4pTeE6SdLO92J5rOistN045uETeK3MIpyVRTm4Nqu+dJncw4pFKdk4VTQgM
	9taEr5jdBwXuAvHbIWSTvUOwLr1500T4awikMEGtQX5dUIj2/z4iYDWhHx1UQ3fRsrBw
	vJtUbFPwJCbXzXwnLKWrEVZfrAwLpw6hBUZ4Ez8hzXr4naSDR/7CN4EJiRnbhFDqpqtT
	ZXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SxbNyb+o5BLLpeRtIwKawLL+W1V4D+8d5Ly4N00FwfA=;
	b=TO1nxX9rgg5zKzjqFA3ZBx2ULRFVtEnDDkaB7tB2TMmHifH4d6O28vjVle85VDRiS4
	o0dtY2swM9L3wMUywGezVbtwKiUhWO22oX6N4/SfaSCjPNe9p4aKWihlTDRk1Fu68lGH
	7AdSbdSv/NG3jvpGM20mVt6uVp24mZN3wZjOVPOeiiJHgMyPLs9f9csNK2r0OTjVpifC
	vb93pCYWfDQ5xHPzb616RTz2TMAyokyaeMFJTCYj2GUI/xBaspeCdknnvfr/rX7WYhg2
	WbK06pRqAgfON3knxC4Cdt+gamwnBhOEXbopvMREjiw39abKJtRGJcImuziBIu3xqeYh
	WS7g==
X-Gm-Message-State: AE9vXwNQDuncj4diWDBSXjp4G1s+MJyCYyO8MrYKNKOG4hO2LpLV2D+0pwUyIdnRbms83A==
X-Received: by 10.25.25.18 with SMTP id 18mr7305029lfz.49.1473755491364;
	Tue, 13 Sep 2016 01:31:31 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	s187sm3745352lfd.3.2016.09.13.01.31.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Sep 2016 01:31:30 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, patrick.ohly@intel.com,
	bkylerussell@gmail.com, daniel.mcgregor@vecima.com, maxin.john@intel.com
Date: Tue, 13 Sep 2016 10:31:27 +0200
Message-Id: <20160913083128.24725-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-java][PATCH 1/2] icedtea7-native: Add missing dependencies
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
X-List-Received-Date: Tue, 13 Sep 2016 08:31:32 -0000

Without this patch icedtea uses host make and linux32

checking for make... /usr/bin/make
checking for linux32... /usr/bin/linux32

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index d4c5c29e6f9f..4314fb51b259 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -8,7 +8,7 @@ DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
            giflib-native jpeg-native libpng-native \
            glib-2.0-native freetype-native zlib-native \
            fontconfig-native zip-native \
-	   unzip-native \
+	   unzip-native make-native util-linux-native\
           "
 
 PACKAGECONFIG ??= ""
-- 
2.9.3


