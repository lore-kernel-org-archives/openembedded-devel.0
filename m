Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRW7K-0006Yp-Nm
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 May 2012 00:09:18 +0200
Received: by werb13 with SMTP id b13so1115315wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 14:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=LqAsubHWGymW8xcVJgy4vwSB42Ew/iNo7QK3O4dx7u0=;
	b=uu4BXHffyaaFhiwg+lnyVEtfy1RJsmnO6a1cgHixkG5Jpa2EaO3qBzfIjQKaYzXmcU
	DbdrvXaIvqGV2v6H3ZlANu3Nexgo7AudH0A85zxpX60NUGK2aieD7jDDP5a+TO1782NP
	2R+yFvfEeXIVth0ycQYRMRZZ3oebQ4Ix0rUQk6+3PWaZj4+f4jat1rgSO+FpNiyIUZS2
	PndP8ny0iAsQaGVbDjp/Jdte/6kX3DegaOHsM3yv1ZrWSpUFp/Q2U8br58A1kMcWcpfx
	CTWtqhpf8swJ4NWf/RYig4sblvVbL+AEr1a4zDfjToXFlwFhBh0jpjoqKX/Gntm+EQ6O
	iVSg==
Received: by 10.180.83.72 with SMTP id o8mr38959366wiy.5.1336427968021;
	Mon, 07 May 2012 14:59:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm38483776wib.0.2012.05.07.14.59.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 14:59:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 May 2012 23:59:15 +0200
Message-Id: <1336427955-8168-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH] libxaw: upgrade to 1.0.10 to fix -Werror=pointer-to-int-cast when building for x86-64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 May 2012 22:09:18 -0000

* 1.0.9 fails with:
  | XawIm.c:1410:23: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  | XawIm.c:1415:23: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
* fixed upstream:
  http://cgit.freedesktop.org/xorg/lib/libXaw/commit/?id=49c0a2441946f0d70fbd2612f193c95b84dde102
* COPYING changed only formally, stripping trailing spaces in
  http://cgit.freedesktop.org/xorg/lib/libXaw/commit/COPYING?id=37ffe69b10ae29e8f91de6ef647d06804b9d159b

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-lib/{libxaw_1.0.9.bb => libxaw_1.0.10.bb} |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-graphics/xorg-lib/{libxaw_1.0.9.bb => libxaw_1.0.10.bb} (75%)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
similarity index 75%
rename from meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb
rename to meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
index ea4f38b..89338d9 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
@@ -2,13 +2,12 @@ require recipes-graphics/xorg-lib/xorg-lib-common.inc
 DESCRIPTION = "X Athena Widget Set"
 DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau xmlto-native"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=f1beacbc336a5a256bb28dbfcf01c2be"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
 
 PE = "1"
-PR = "r12"
 
-SRC_URI[md5sum] = "ccc57478c41b7a75b9702241b889b1d4"
-SRC_URI[sha256sum] = "a83977546b78e24ac5dca86affc10b6404a87c16272405b05386feca1a2db037"
+SRC_URI[md5sum] = "f1ea52debce7a18cc26b21647a00ad8b"
+SRC_URI[sha256sum] = "2d96bcf92638b8ec5c91d379f5ec2e7b15133adeb2ba22066d48bf3239ee1bdd"
 
 # disable docs as groff detection doesn't work on some hosts while cross compilling
 EXTRA_OECONF += " --disable-docs "
-- 
1.7.8.6



