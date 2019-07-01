Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF707E52D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 14:58:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45cr8p5Xs6z3t
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 16:58:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561993098;
	bh=jXBsSVH7pwxxQi8rU5H2VrLv4yBBbEg8uWEbsF3NEB0=;
	h=From:To:Subject:Date:From;
	b=lwP6fhm97pwp3vw6pDQRNFVNyOCnY3XIGZFv/kBMhHWZACDXR4CHd24N0UDQxS5xg
	nFjVcikneZMzbt793OQKEuOe3AoGVu8qrYobryUhaA0UhpmZdEhgtZDBKYLpeI/WJA
	YDr1ozzUVP5o2p4VTBBvk7UE1fTHX7kC45Hl6Gr22mB6glM6SEycG3npu8UD2RBBz4
	SwetxM/blJyDylsuHdzBY2d5yIsTxi5HBWL4IAzUiFFKzY5UOGyA1j5sDc2sE6K0if
	ZmDThVy6Z29lcGHfuNJGGVhPblFELfCNEgOMNgAj9L2ZRHxPeNjn/+PeEFmj3Alij3
	0gX/FVEG3ObZNs5b9+39B/Bkz2Bwo8DyjZK0cijOoPpEOByppsn/uur2bURvKYJZOL
	RaE7dIWp5UfNqx1vk2EqvS1lkJq8Ku9iI+Adm5KQKZICYj4+zRBJIo+9qkDsUH1j10
	RPuXqTuPkIsHcgG2VYrlxKhDL/Q7ASdN5jKoqUjVhw087MbbtZ+o+dWr34WQmGi5ez
	+ic7pqXHN5xsdNwSirY2T1Fp6jT5vhDpBYbutW3Wgf7vszd30ghDVwkxiF95jP/wPg
	Dsdc83lRxrDubogxNV5jM32Ttpk4peZIXUL2HgIIqGSbh0MbMCdRMn8I95abtSHhyp
	rqclu430EdCNc+cAN8mEFuok=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jul 2019 17:58:17 +0300
Message-Id: <20190701145817.22852-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH] gnome-bluetooth: Drop bluez4 support
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
X-List-Received-Date: Mon, 01 Jul 2019 14:58:18 -0000

bluez4 was removed from meta-oe 2 years ago.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
index 8cfd65af3..d0eebda38 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 SECTION = "x11/gnome"
 
 DEPENDS = "udev gtk+3 libnotify libcanberra intltool-native gnome-common-native \
-    ${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)} \
+    bluez5 \
 "
 
 inherit gnomebase gtk-icon-cache gobject-introspection distro_features_check
-- 
2.17.1


