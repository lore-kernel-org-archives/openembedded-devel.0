Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 559DF7FD81
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 18:05:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47s3M42vkDz4J
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 19:05:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1578333904;
	bh=gH0bupsj7mHTE1d3QxS+syYdxd/tf7CMnG82ZjiWEuU=;
	h=From:To:Subject:Date:From;
	b=buMfY6CVHc0HqMKBuPWfinfF/SBQETzkydt7spFJfznVg9p/t9ty8jglypfX1gXXD
	//0K65CBqltb0MpnNWkQvzGUNHmbCdrR5Esivl25/rDY52PNVu4wpxr/8NjXS2memT
	SYeBtd75q5YGr7sB4a7Zju+D0aROcWUo+zNBJHvJkVlUxQgjVdiyBjFMzkvUVdO2jy
	91fuRpaxXKtvZrzhZcrRPCZiXk52bzXqg4UVfs0Pahx3ZX95Fa4vwx7aL7D8XA1ExT
	OFo8TsbzLewODQZSUcnOvhJO2m/4O1f7XNKIPasj5DdkcAYhYtat0PWrg394zbzVCX
	NdTNm/gBqIWDU0c4MrePinATFP3KrUsYx/xbwDoezhs/f8i1A4VunQRMoWEjVuiPPu
	4EyuoGEZK7IqsnAgRjcDd722XIiyrDlaDoWzrsKBGO/om6iHRdACgI6z0E5xdbRAs2
	hjV2oNZwJwj0JfRxGx5zFACMZuoV7YySeTNIJGolqw1Lq/0gQ+lbf8BKyPgXdedUfp
	7QKwrlKL1+XWTWtLMwgFAseTpveoJ8cyLvyftlcCIHxrA8C886blm/S5hoBPgiT+Ku
	YKE4DMyk7JdA0VrwM8ujIEvO/YUi3vA7AqpcrEiuUyOCt/1SYfg/cRgJv1wWAPs2wr
	0vy3Y8ljQdJAPiwGfv1oDA5A=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 20:05:02 +0200
Message-Id: <20200106180503.8105-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] enchant2: Upgrade 2.2.3 -> 2.2.7
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
X-List-Received-Date: Mon, 06 Jan 2020 18:05:06 -0000

Also add UPSTREAM_CHECK_URI.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../enchant/{enchant2_2.2.3.bb => enchant2_2.2.7.bb}        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/enchant/{enchant2_2.2.3.bb => enchant2_2.2.7.bb} (76%)

diff --git a/meta-oe/recipes-support/enchant/enchant2_2.2.3.bb b/meta-oe/recipes-support/enchant/enchant2_2.2.7.bb
similarity index 76%
rename from meta-oe/recipes-support/enchant/enchant2_2.2.3.bb
rename to meta-oe/recipes-support/enchant/enchant2_2.2.7.bb
index 42150c88f..b30b2d8e4 100644
--- a/meta-oe/recipes-support/enchant/enchant2_2.2.3.bb
+++ b/meta-oe/recipes-support/enchant/enchant2_2.2.7.bb
@@ -9,8 +9,10 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[md5sum] = "4b8abb58e00e93363591b3f5ea4f52d5"
-SRC_URI[sha256sum] = "abd8e915675cff54c0d4da5029d95c528362266557c61c7149d53fa069b8076d"
+SRC_URI[md5sum] = "8a6ea1bb143c64e0edf5e49c7e7cb984"
+SRC_URI[sha256sum] = "1b22976135812b35cb5b8d21a53ad11d5e7c1426c93f51e7a314a2a42cab3a09"
+
+UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
 S = "${WORKDIR}/enchant-${PV}"
 
-- 
2.17.1


