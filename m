Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id A0172605FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 12:55:28 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id f206so27724524wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 04:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=kbQdC1F1+JBplbRhSYk0RQSvgJfeT9p/pA8Fj484uo0=;
	b=w3qXts+EV5rvMvpDOVXfgMZGpKSEwJNGl9RKt+jke5gKbQuJtrLcY1Z1DJ0TxYcr8u
	2Zvg+xFHw7ON4ei/zKvxpDV3Ki1y9CrrPRJ2NTmpOoWR/Ve6IH8GWudQYPDH5EgV1T1o
	uYceAgyUtKQwclz7Vz4b7lev9d7apLWlnjV18ZWted7ak2ID2KdjOHzt/TsDFBrUtGWu
	x1woHwLXCNy/23kcSDG1kKSVayntbR1GLcysBczxoG2qZ3+YKsDIfx4HSmtH+7Mnn/m6
	vbVH+8qliPXP0nejtrIWz01poWC8wgM8FbjXKtZdU7l1ZCuVOaSltbpVaZcFVAaO2MsA
	E9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kbQdC1F1+JBplbRhSYk0RQSvgJfeT9p/pA8Fj484uo0=;
	b=QH7Nri3fvkHLhDzFi7hNbLL98SU6LuwvVoLXIWsSVNJ2PpT8p/5S2MXzHr8x0Z4nd9
	JAZ250cy8Ba2jIIhyhipSmoYIqKyDySUuRwDBWcT4dfMxIyZYI3hAtyL9mAES7ydtIQN
	WW4Vmgswy2q5tyU3nsAl35lsQlaCOFGUjoY6nc0vzz0p2TYV4WBrJTFqD/f0h2J6EosV
	CMkbReyEhfz/iiDtH9BOl8L8tLOgphRE6LaF7YIxcMluN6D1p9+JW9QDhMAohBn969NZ
	Vodh3SCJ1O5V8m/NdArGPVl9kaKy7TnQcx7LaFGNv5OnhdP/ssqgpY8XqPTQmQRxtzO8
	Tigg==
X-Gm-Message-State: ALoCoQk133MaZ/WqayQZmN/JJacom1yqxtPU9IsdeyAOpkEwiDPaQpBvsykgg6Iz67902QHdczCzDOtCtmTrGuB3iWKkSvNjcQ==
X-Received: by 10.194.119.68 with SMTP id ks4mr100084916wjb.45.1451998528698; 
	Tue, 05 Jan 2016 04:55:28 -0800 (PST)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id
	ko2sm40086231wjc.9.2016.01.05.04.55.27
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 05 Jan 2016 04:55:27 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jan 2016 13:55:25 +0100
Message-Id: <1451998525-10849-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.0.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] xf86-video-nouveau: update to 1.0.12
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
X-List-Received-Date: Tue, 05 Jan 2016 12:55:28 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../{xf86-video-nouveau_1.0.9.bb => xf86-video-nouveau_1.0.12.bb}    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-nouveau_1.0.9.bb => xf86-video-nouveau_1.0.12.bb} (76%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb
similarity index 76%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb
index 7b52de0..3a7507c 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb
@@ -12,5 +12,6 @@ RDEPENDS_${PN} += "xserver-xorg-module-exa"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "8b2c0df5de3929597ade8c5ddb489a44"
-SRC_URI[sha256sum] = "b247c800e532fad1c80a5666d8ca0d4e5712064b6d7a3b030b32206a8de04482"
+SRC_URI[md5sum] = "dc79910c7b9e32321cefc7af250c7765"
+SRC_URI[sha256sum] = "0ea057ad7fc31caba2d4e46c7e418fe2b3c762b04fb8d382f53383397fd8391e"
+
-- 
2.0.1


