Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 190A46C102
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2018 22:00:15 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id b5so7173315plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2018 14:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=PPJKq1RjhY037dX2Q5y0tFo5RLMy6xENU9oLUVk3b6U=;
	b=aC0vhI/2hbVJhl57Q54bRck3MgaVMUrSrD1vXmylAsLX/b01H5sP2m9NsdKCkOg9lZ
	t41hi7/v19JATO2BGA4+bTQKAnq0QbQAkNksfb/MAQwG5ys6iffj+NdPVrQyQxZ0vB8C
	xCSm6sybO5cVTz5dKHeyXJK/ecJLzXSF1k0hJwfl/h9okXZ86i1LZCF8T+CZInbAC87C
	MUJx4J0YUsTda9VI1JWM67zFWqNNteqg0u+mZZD3Tqfby8U/iui/4lRTJFaSnqY0ALGm
	OjPZv867Kkb4OuYpSqIpIcTwzOriqZhRXiM16NKoa5yv9vW/g1N2BNGS4UFfkYDUFoUJ
	yjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PPJKq1RjhY037dX2Q5y0tFo5RLMy6xENU9oLUVk3b6U=;
	b=QYHask7DrpyHfhv0KLhk2n8/fTScXfHX+V6NPHBX/awLhLyCLp/YOTpXp7ZnT5R3/O
	ANwPeIS1x2eMRLG3Q28MvtMRFFNjlWQAhxpL+wPy9dTHxJNEZZVvsAYFs5l00KbRcNqt
	cEVIazkDsiKoGr6aYz5OT/e1pjK0YQ7VxidifMI6taqEnX0FF+I9hicqEhCUJFBS3qlR
	4UT1JxxrSFPM1sepN7DaMd0prR795fqIPBBYnpMhM9bcqDS95Srsuz1FNk7UYndX9ux9
	F7w7GteF7EKubNiChMBpJzcoyrBrYbeqE1mBNbyB9w1GzSE44MBOWzKRA9oaOphy4BcJ
	W2xA==
X-Gm-Message-State: AGRZ1gIk/T65kxGLnF2sLYzCADVG9zHqjUGAucGqwdb6YnIVn/ZoGLJT
	81KNB921Ae0uTYR7Yx89Hwgpmmv3
X-Google-Smtp-Source: AJdET5dkEHAtstIo42OhgQNEElB1pisMSYU9GIHXUkNvRe3tp4Xkr4VBZkzlrcq55cVVV847tRlNJQ==
X-Received: by 2002:a17:902:2cc3:: with SMTP id
	n61-v6mr19999737plb.76.1542578416851; 
	Sun, 18 Nov 2018 14:00:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:8599:3a91:5ee0:9f77])
	by smtp.gmail.com with ESMTPSA id
	q25sm41456009pgb.2.2018.11.18.14.00.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Nov 2018 14:00:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Nov 2018 14:00:14 -0800
Message-Id: <1542578415-27437-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/2] packagegroup-meta-oe: fix build issues
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
X-List-Received-Date: Sun, 18 Nov 2018 22:00:16 -0000

ERROR: Required build target 'meta-oe-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-oe-image', 'packagegroup-meta-oe', 'freeglut']

ERROR: Required build target 'meta-oe-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-oe-image', 'packagegroup-meta-oe', 'libsdl2-ttf']

ERROR: Required build target 'meta-oe-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-oe-image', 'packagegroup-meta-oe', 'libmad']

ERROR: Required build target 'meta-oe-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-oe-image', 'packagegroup-meta-oe', 'faad2']

ERROR: Required build target 'meta-oe-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-oe-image', 'packagegroup-meta-oe', 'mpv']

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 4526e99..08b4bbf 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -138,9 +138,9 @@ RDEPENDS_packagegroup-meta-oe-gnome ="\
 
 RDEPENDS_packagegroup-meta-oe-graphics ="\
     babl cairomm dietsplash directfb directfb-examples dnfdragora \
-    fbgrab fbida fontforge freeglut fvwm gegl gimp glm gphoto2 libgphoto2 \
+    fbgrab fbida fontforge fvwm gegl gimp glm gphoto2 libgphoto2 \
     gtkperf jasper leptonica libmng libsdl2-image libsdl2-mixer libsdl2-net \
-    libsdl2-ttf libsdl-gfx libsdl-image libsdl-mixer libsdl-net libsdl-ttf \
+    libsdl-gfx libsdl-image libsdl-mixer libsdl-net libsdl-ttf \
     libvncserver libyui libyui-ncurses lxdm numlockx openbox openjpeg \
     packagegroup-fonts-truetype pangomm qrencode takao-fonts terminus-font \
     tesseract tesseract-lang tigervnc tslib source-han-sans-cn-fonts \
@@ -152,6 +152,7 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
     font-adobe-100dpi font-adobe-utopia-100dpi \
     font-bh-100dpi font-bh-lucidatypewriter-100dpi font-bitstream-100dpi font-cursor-misc \
     font-misc-misc xorg-fonts-100dpi liblbxutil libxaw libxkbui libxpresent xserver-common \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "freeglut libsdl2-ttf", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-oe-kernel ="\
@@ -160,13 +161,14 @@ RDEPENDS_packagegroup-meta-oe-kernel ="\
     "
 
 RDEPENDS_packagegroup-meta-oe-multimedia ="\
-    alsa-oss audiofile cdrkit esound faad2 id3lib \
+    alsa-oss audiofile cdrkit esound id3lib \
     a2jmidid jack libass libburn libcdio libcdio-paranoia \
-    libdvdread libmad libmms libmodplug libopus live555 \
+    libdvdread libmms libmodplug libopus live555 \
     mplayer-common opus-tools \
     sound-theme-freedesktop v4l-utils yavta wavpack libvpx \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext pavucontrol mpv xsp", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext pavucontrol xsp", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "libmikmod", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libmad faad2 mpv", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-oe-navigation ="\
-- 
2.7.4


