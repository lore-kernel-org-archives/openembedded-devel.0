Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C5ADB7F07F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 11:41:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45kvJc4jZGz6b
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 13:41:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562845264;
	bh=NzEaQ5fuZ1h3gaioWY1V5ONfRQoOegaoVguizkeTx94=;
	h=From:To:Subject:Date:From;
	b=O9Ew0eiVA6LhVrhwD5sS53R/flQDo+32GqiZ6yX5dzVnUCw9j7ua2I2omlmrrMDUu
	UaE2e/aBiLZI+Uen9FfUO6CLh1oyGUY70ihmLwbGmulaRz+SaFXduZVYT9hjAGWzxq
	C4v4OB4PhrkFYpwciF3CFpLcc0i5ppNLa92gNq/zMWx012UslxHJU5ieN7aiYOSSY3
	QKSUtF0HmZzZ3RA1ZpVOohJa8xjRwWskKOROtmZUentwd9dPUod3E+h6XX2o3OMhl+
	rlxYKTarfD/APOAYLRk9eeVVhDPVROMiVIUv3YJ6iJTJ+J82VfHZ5QoECBspGbUxD3
	9VWX4TOBfWv3K4cPeNPV4vOdrXTnBbF7ZbTZBZ+wFr7DvoDrEkzapGvGVnF+xNXhEL
	PRVqp9/HqFq6NitMk8RBaxb2C+P4vZAEafibwm5V+t/Hx41LQHoEbBe5lfsZJbz2U6
	X64yO/8MnDyL/V7UDQWSm41Au17DA9dj1DLtiyWaSjghyqS1cG9AtrEx/an7pxFHyX
	ugmyxNRDaUxw42kEawdsyJZdlOWBMs6sCaQlsXtvDW2IuBgfgB7AHJX8PQH176e0WN
	89570KyC7toWNI1FpOl5zkCL/+eI9XYCxVQTtdK1yF0Z4XdL3b9e8p1qD/mPltj6Yj
	1Wur+KWB6XrUNpSCVas6h1+I=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Jul 2019 14:41:03 +0300
Message-Id: <20190711114103.20709-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] libao: Remove the non-default esound PACKAGECONFIG
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
X-List-Received-Date: Thu, 11 Jul 2019 11:41:05 -0000

esound has been removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
index 4c0976e43..05134614a 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
@@ -28,7 +28,6 @@ python populate_packages_prepend () {
 }
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)}"
-PACKAGECONFIG[esound] = "--enable-esd,--disable-esd,esound"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 FILES_${BPN}-ckport = "${libdir}/ckport"
-- 
2.17.1


