Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6F8A67FA43
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 18:54:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4723mn1j5Wz8b
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 19:54:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572288889;
	bh=5BlkuNYMPP00qKLl9yBzxsKng40HFhgFoukeYL9Ao4M=;
	h=From:To:Subject:Date:From;
	b=iIz+epYgcm8AvLHR6DTKQRostTD4BVrHZdOwTW9Tj8VLTwxVIz5atEGrURUwhZ6xO
	3grel4wixaaUxhOH3iPY9Mv9O3ppR94/LneWb87XtpWKQvtsv2acC4e/xxsnjqvxr1
	LY2Rg0fGvEN0zTzTFKpTqQed8QDDuuEzW95xmKsy2bjr8RZUmNwviv3JbhQZNzt4t1
	uqbqduaIxCX7IzsN+Vonm6gCc/CF33bwPIEKE/CMw0GlVa4VZgfcj+yB+TrMKIvP/A
	ATjOvZcNUAlh/jACp3OGuJxMA/SVj4i4hsSRNc3WAh7qm99VkqRi4f5NxEH4eJ/sCE
	x1Jg07qC/aZEcn59Abj1vRImHxbMFy7DB3e37Rh1yM7BKvl16k1Dn7LeJuxm4K2wtJ
	gsj1VogO1ArA6pzYT6tgJc+lV8jhnWKjQqySBr2wfDPMSIChAbiXPVfXKURx9fI3P5
	USLFHkJ9pAK1RfxQWej7eAguGTmOyuZ6wAZpJ3q5q1DEGu0Hx1tXPA/QBUYhOdsrwS
	FkE2qyz7iYIRITrO0W4jcjBL7mO+6RVA8gHAE1HyOCd68NQkIzauY69WJxa7JpW7l+
	VAP1Z3wl/sHBQBp+fAo8sp4BptdAtWmgXnw64FGCWeehEJpAQeDL+5aj5Antczcrio
	zZRg6LW/hzyZXwx30HAXk3SI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 20:54:47 +0200
Message-Id: <20191028185447.3553-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] vlc: Upgrade 3.0.6 -> 3.0.8
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
X-List-Received-Date: Mon, 28 Oct 2019 18:54:49 -0000

Workaround for riscv64 issue fixed upstream removed.
Also merge the inc into the recipe.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb   | 11 -----------
 .../recipes-multimedia/vlc/{vlc.inc => vlc_3.0.8.bb}  |  8 +++++++-
 2 files changed, 7 insertions(+), 12 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb
 rename meta-multimedia/recipes-multimedia/vlc/{vlc.inc => vlc_3.0.8.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb
deleted file mode 100644
index fcd321cb0..000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ${BPN}.inc
-
-LDFLAGS_append_riscv64 = " -pthread"
-
-SRC_URI += " \
-            file://0006-make-opencv-configurable.patch \
-            file://0007-use-vorbisidec.patch \
-            file://0008-fix-luaL-checkint.patch \
-"
-SRC_URI[md5sum] = "4ff71d262e070fd19f86a1c3542c7b4e"
-SRC_URI[sha256sum] = "18c16d4be0f34861d0aa51fbd274fb87f0cab3b7119757ead93f3db3a1f27ed3"
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/vlc/vlc.inc
rename to meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
index 7308465b1..8ea09b921 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
@@ -16,7 +16,13 @@ DEPENDS = "coreutils-native fribidi libtool libgcrypt libgcrypt-native \
 # While this item does not require it, it depends on ffmpeg which does
 LICENSE_FLAGS = "commercial"
 
-SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz"
+SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
+           file://0006-make-opencv-configurable.patch \
+           file://0007-use-vorbisidec.patch \
+           file://0008-fix-luaL-checkint.patch \
+"
+SRC_URI[md5sum] = "744442ec0c145453ea1d257914c8072e"
+SRC_URI[sha256sum] = "e0149ef4a20a19b9ecd87309c2d27787ee3f47dfd47c6639644bc1f6fd95bdf6"
 
 inherit autotools gettext pkgconfig distro_features_check
 
-- 
2.17.1


