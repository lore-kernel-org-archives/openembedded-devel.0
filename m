Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D4C6077CE8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:14 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id d79so8686592wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=MfNJS8us38bmS0/VC5RMWQNWuFWLslzLDAfvnMgK2q8=;
	b=MNX1qgLmhaLAvrbR41h6GSAG1AKm3FfaKpQS1Qtb1jE6bq1/nyB9tDXEKvKD6bfQvI
	FLxDQwi/TOy6EcA6bEtGIu/hhYYEFV5s5BTwZVyFyOFbLR2RJtmSFBRXkcjhLSnpAvp6
	QRGEy0q2N/VUK23uIo+3CrQTYekxOZVjHZL3CCwrkaE2xRd7e/pyMiPlzAKEKZoRm9va
	8+PGYxr8doSaVXCVun2vyLlQwywic3v/gSjFrhIyUdXOqgZbuaqc9sS/oDdUwO7Ved/Y
	55OrND1DS3ce/rVGeKhoSdD/Q2RWJjtJhOKFUd2uxROuLTV6R55N5M557K7MkpPQ/iTq
	B/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MfNJS8us38bmS0/VC5RMWQNWuFWLslzLDAfvnMgK2q8=;
	b=JPGzf/+4l3vyVNFUl68DIcHleo/O2Bd4NCq/trTctWAL4FCNNN8E91pyUE7TKDYvpB
	zL340amwrRT6zle7nJ7Qq1J0reuTym9Og6vKWnd7BOsDLQrlOsjC7LyA37lmQT8YQ9KP
	CnzRQIi1ui+fzOgoz0/0qGZMlxE/5sHWJSJrMfaRpgkYKrvO8leYTSlTmtI1coLG0IUG
	yG2P7YSerUvt2ARQaZY7T1C6PJ/aCaQnbS6IXAD65wisqfGtc90oy+xWzX5DH5Nw1VBy
	GmzkN0rJbAea02YcN35QXhXlW/i6Z23bBO97w6qZeMlHLFS0GsyY27ZzOQLsk1dA1BzG
	ezHw==
X-Gm-Message-State: AN3rC/40QqJLOQ/Fwvu3eDUWgGozxqwNquT/cI4yO/oiMeaza0lffChE
	8iRXnDsaf0p4C+Yg
X-Received: by 10.28.125.137 with SMTP id y131mr18622922wmc.141.1492027035615; 
	Wed, 12 Apr 2017 12:57:15 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:35 +0200
Message-Id: <20170412195638.3243-27-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 26/29] mpv: add PACKAGECONFIG for drm/gbm/vdpau/wayland
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
index 3f46dc1..60f653a 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "mpv is a fork of mplayer2 and MPlayer. It shares some features wi
 SECTION = "multimedia"
 HOMEPAGE = "http://www.mpv.io/"
 DEPENDS = "zlib ffmpeg jpeg virtual/libx11 xsp libxv \
-           libxscrnsaver libv4l libxinerama libvdpau \
+           libxscrnsaver libv4l libxinerama \
 "
 
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -24,14 +24,23 @@ SRC_URI[waf.sha256sum] = "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f2
 inherit waf pkgconfig pythonnative distro_features_check
 
 # Note: both lua and libass are required to get on-screen-display (controls)
-PACKAGECONFIG ??= "lua libass"
+PACKAGECONFIG ??= " \
+    lua \
+    libass \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
+"
+PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
+PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/mesa"
 PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua luajit"
 PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
 PACKAGECONFIG[libarchive] = "--enable-libarchive,--disable-libarchive,libarchive"
 PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
 PACKAGECONFIG[vaapi] = "--enable-vaapi, --disable-vaapi,libva"
+PACKAGECONFIG[vdpau] = "--enable-vdpau, --disable-vdpau,libvdpau"
+PACKAGECONFIG[wayland] = "--enable-wayland, --enable-wayland,wayland"
 
 SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '')}"
+
 EXTRA_OECONF = " \
     --prefix=${prefix} \
     --target=${SIMPLE_TARGET_SYS} \
-- 
2.9.3


