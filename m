Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id EC2B178916
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 10:35:21 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id m5so5553468wrg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 02:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1xazicUEyVNYmjP7RhetsmYqCp91h1kDH1wjtdYhwEM=;
	b=L/Tss8rCoDSyFYlMEfsmP18HrRCtwb0bxEKTl+4MH1mCIDgKrDzY5ed+pqVwS48mzg
	hEvDLP4Pf6bLJxRsgShvBDLPH9ZcKU7p9lk3eWL/Vp2S+3Leec9uTHcrHUjZSNbQ7PpD
	T+H6KQ6yZif9RrYPoqb1AoXQQX+8+qNRw2XsJIwppukaYoe9BVopOY5V6Dl42HkByLLm
	FvjakwWYwHbU2hPJI4XwAbr6MKjpBjOLChVHgvkK1zHkm9GcVehnc7rSwas9s2lub0+s
	FkIOR7ncVznKFGhKDy0rhvKQGbJ0y69mNxWB8F2V1nDTSSn/y1Iy076/U6rti53dG24M
	RZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1xazicUEyVNYmjP7RhetsmYqCp91h1kDH1wjtdYhwEM=;
	b=H2KM7SwYm5v9/7KQdZHEife5PunZa5kivxnBIMwWwQbLMgK4tYR1uIIIMHBlBo7UK1
	nutodA9Gxfs3I+mJRDPpxolQHESv2axDXaOP+1mxfDpI6fLm658Ny4+EghRkCgX/pC8j
	y8P2htKvt/nZdXBMmNbV3gKiYw+sLtGaP/UMzZVQM8TCx6+Do7sXsUaB/MlT8k+EXhzU
	c8DYETb2OcrDXxl6yRFDDn6Jv2Ug1P6ucaOLA7g0BhVLzYFHNxviUuDdM3uWHFSPOSsR
	qlBXGfWqF6DJBjaQAT61oRwiuq4g264QNvAzbTdQag2i/vz1dAWkJVZv1kBdmD5zZkzC
	SSKA==
X-Gm-Message-State: APf1xPBCAVTIhMEjr/ZXLRXi4aKUn6umAkzWDq+THd3V3dattSwmSviT
	JJnOAnWYMzOvidU0AXqHCZzmow==
X-Google-Smtp-Source: AG47ELv6qUk2rPbOsmpSlhpnLbrLZyOqmIbDrH7VikvZdPhKT+sk4LUN8yKPDXKAAq0XmJI4b5tybQ==
X-Received: by 10.223.173.18 with SMTP id p18mr1370504wrc.29.1519900522545;
	Thu, 01 Mar 2018 02:35:22 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id b7sm4148879wmg.41.2018.03.01.02.35.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 02:35:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2018 10:35:15 +0000
Message-Id: <20180301103517.7653-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-oe][PATCH 1/3] kodi: add PACKAGECONFIG for samba and enable only with pam in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 01 Mar 2018 10:35:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 5158f05b66..656aefeff8 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -50,7 +50,6 @@ DEPENDS = " \
             lzo \
             mpeg2dec \
             python \
-            samba \
             sqlite3 \
             taglib \
             virtual/egl \
@@ -102,8 +101,10 @@ ACCEL ?= ""
 ACCEL_x86 = "vaapi vdpau"
 ACCEL_x86-64 = "vaapi vdpau"
 
-PACKAGECONFIG ??= "${ACCEL} opengl"
-PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', ' openglesv2', d)}"
+PACKAGECONFIG ??= "${ACCEL} opengl \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'openglesv2', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'samba', '', d)} \
+"
 
 PACKAGECONFIG[opengl] = "--enable-gl,--enable-gles,"
 PACKAGECONFIG[openglesv2] = "--enable-gles,--enable-gl,virtual/egl"
@@ -113,6 +114,7 @@ PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,libxinerama libxmu libxrandr libxtst"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[lcms] = "--enable-lcms2,--disable-lcms2,lcms"
+PACKAGECONFIG[samba] = "--enable-samba,--disable-samba,samba"
 
 EXTRA_OECONF = " \
     --disable-debug \
-- 
2.15.1


