Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 21D3C7DE7D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 19:58:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44znNb5Bqnz7k
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 21:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557345536;
	bh=Zqo8HvLofZJweKuC38/Ss7RF8zOv5SBGmcEx5dUX6QE=;
	h=From:To:Subject:Date:From;
	b=Xp5LHcBt9wHUIbCNc2YBYZTTMC6UfjwuMkivzTTZkE1gFtBgUfXOVGF2CaT2WsLo1
	sgxb445yYJv2PDm1nH0XibPtoPeNCeNGsjsRxcQHTTTKqcyfDHqWTzE2pCv8GZZpsO
	tZ+wIfA2O//VnVHuCff5QPYEjqhsJgY7OOTT0+Dp3km+GDyyRbtwfa8b3EoUbisbnA
	xcSPG1/39D26f8x+7UYiu0Mkz1rfN1S/l7fqHfzMrIdCUfEG9s8Yc4EQjr0Xc0N66v
	zXH6zC/mjYti3hMImvvqhg5X/DSRyUDRgzUsAzwxXmJQ1M1J+LQLpL2bmG6S+TMqAm
	5JPgPyaSGZfdtdhK9P7a8PW4CuzrZ9xLDizAzjFVsH54GXbqMpeVxDPfNWXX3OuMfs
	mtfTU5lPZHdBxM0k38lfpiG8j1v38XcpJH9wvTzkvNwKRaoXDmR3o1C+HSUjHtDmaS
	m2xPIAYofpzq0Dqov5TqLxHY68RhpRlo/OFCRBOBhQKroUhHpXIi4K13QEKcE5czcM
	I2ydJEvcyN4OAmyyaZKL+0GYTPOJD2/XplUsOtrEWeACXY0WxReslVMwPXMrFfUl0u
	C2kjNC0WpTjD36rXLBAWxBJV4RHfyWkjgLpIBhJQoywSTbUtfckx1PTVZr6Xhr6TOz
	kjPTf3kwOQ8bUswmLdJrgwzI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 22:58:49 +0300
Message-Id: <20190508195852.28803-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] schroedinger: Remove the obsolete DEPENDS on liboil
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
X-List-Received-Date: Wed, 08 May 2019 19:58:55 -0000

schroedinger switched from liboil to orc several years ago.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-multimedia/schroedinger/schroedinger_1.0.11.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
index d38eb9477..d026c69a8 100644
--- a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
+++ b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d91a46405fc074b88c963cc4f2a0aae9 \
                     file://COPYING.MIT;md5=8b345371b3536b4ce37ead1eafc88221 \
                     file://COPYING.MPL;md5=0117647fecb9a932c25a7bbfc0333c37"
 
-DEPENDS = "liboil orc-native orc"
+DEPENDS = "orc-native orc"
 
 SRC_URI = "http://www.diracvideo.org/download/schroedinger/${BP}.tar.gz \
            file://configure.ac.patch"
-- 
2.17.1


