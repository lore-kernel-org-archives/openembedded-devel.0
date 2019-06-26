Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A680C7E638
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jun 2019 08:50:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45YcF90z2wz2C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jun 2019 10:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561539053;
	bh=HzjXR5XMTB0ehuX+NWUVLlivNxOWt9oGO605ScZhpHE=;
	h=From:To:Subject:Date:From;
	b=LvkcrZau3hM/Nw0/ed2gk5TPH0uifKyNdYPKHBPiG3nWoWr/K70JhSYIJ+OJZL9s+
	Dw8dG1gvhSc7KKNPKTeFagvv2xSrfe3K0Fp86iPTH2AV3aKuF3McMDXV3iAXRPZddA
	xdl/mfYrFZeW2TlOG4mLt+p3FA3ilSdYIsnmRLYom7mMrAbiOMlvcwvKShWiLZUI10
	7Q47WM7RsvtLJp6NnoXQUN5x12fq5FZ+I1XFer2dZHBnSOT/Rxr3LiFmtuTLv7uHMx
	cVXLkiFtMCLbBKRViZiQwEHVUpHNLsitjwrZOHi4YRhZVT0HRKrDUIUO0k17aUZqTc
	q0uQsk674jD+C6GbMlx4maXbRAXFG9+i2ZRdtpBa15A1lhrrPpq0tisjJHT4Z9cRsj
	lmfFRAeEv9/SJcFnRTt0lOxgF73sf98GF7a2vfoF1RviOThvShVWB4FNs7dGxip6NM
	bE16pXPlVkKxmhGqFsC0DYLfG6m/i6NulGvuvEoR6plMc8EmKqxJ7i+ooRl8UKHXCl
	gUuFSb9oSC/BaWrHAfiQnkQZlqcC0WQQZdJCd11lTSnMWfyovxyJki37dhwklHkAL6
	Ca+fhmeC61R9ThtLllw/MT02oBZmGbQjlbImRw9EAfXN61VP+3EdYFKbl8VAGWKr+H
	bJE6dO2q4MK9ApsKQ7zby56A=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jun 2019 11:50:52 +0300
Message-Id: <20190626085052.5193-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] vlc: notify switched to GTK+3 some time ago
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
X-List-Received-Date: Wed, 26 Jun 2019 08:50:52 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 9bbc6685d..0bedc5da9 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -72,7 +72,7 @@ PACKAGECONFIG[dc1394] = "--enable-dc1394,--disable-dc1394,libdc1394"
 PACKAGECONFIG[dv1394] = "--enable-dv1394,--disable-dv1394,libraw1394 libavc1394"
 PACKAGECONFIG[svg] = "--enable-svg,--disable-svg,librsvg"
 PACKAGECONFIG[svgdec] = "--enable-svgdec,--disable-svgdec,librsvg cairo"
-PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
+PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+3"
 PACKAGECONFIG[fontconfig] = "--enable-fontconfig,--disable-fontconfig, fontconfig"
 PACKAGECONFIG[freetype] = "--enable-freetype,--disable-freetype, freetype"
 PACKAGECONFIG[dvdread] = "--enable-dvdread,--disable-dvdread, libdvdread libdvdcss"
-- 
2.17.1


