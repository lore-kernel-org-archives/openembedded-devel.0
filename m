Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6088C74245
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2015 00:49:22 +0000 (UTC)
Received: by ykax123 with SMTP id x123so98927127yka.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Aug 2015 17:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BG8zrnBwdHTm8JipXAtcEoKkjpnQ1rJ/lSVA7Am6y7E=;
	b=ewMylJLVpZqpB5FCg3Tksn1ry/aKm1f8cOWjzv8DAhEE+C03JSkTNfutGZmqWrZrYZ
	FflNz+j3wlzGpjNyxUmnedcMtO+/hNaz5wmbpVyErUO7mwuyigf6OVnUwtiN8v9fhz1u
	qE9+IqnVEMSwCAQjD7ULOBCfYiNGMFxRjSjBMTx6Ddbyk+u/VOTBpXqPJ7WsXCWKJmjq
	dIatnd+HbcvaYnElB4vhWjk3XfTKe3ykngAhpO3MAxyC2Kp4qeKvpA4Ai7PdF8UKTCgV
	DRzd5J4KzPU5w+PWxFgRo8RQlC68AaqS+T9S7393FoCk2EYuMroty90rDJ0XY8Wh8/8i
	6BOA==
X-Received: by 10.13.230.142 with SMTP id p136mr16469199ywe.51.1438562962763; 
	Sun, 02 Aug 2015 17:49:22 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	p190sm12132107ywp.56.2015.08.02.17.49.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Aug 2015 17:49:21 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Aug 2015 17:47:23 -0700
Message-Id: <1438562844-16736-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][meta-multimedia][PATCH 1/2] libdvdread: update to 5.0.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Aug 2015 00:49:24 -0000

* libdvdread > 4.9 required for vlc 2.2.1

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../vlc/{vlc_2.1.4.bb => vlc_2.2.1.bb}                  |  0
 .../recipes-multimedia/libdvdread/libdvdread_4.2.0.bb   | 17 -----------------
 .../recipes-multimedia/libdvdread/libdvdread_5.0.3.bb   | 13 +++++++++++++
 3 files changed, 13 insertions(+), 17 deletions(-)
 rename meta-multimedia/recipes-multimedia/vlc/{vlc_2.1.4.bb => vlc_2.2.1.bb} (100%)
 delete mode 100644 meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
 create mode 100644 meta-oe/recipes-multimedia/libdvdread/libdvdread_5.0.3.bb

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
similarity index 100%
rename from meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
rename to meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb b/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
deleted file mode 100644
index 4895dd2..0000000
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "DVD access multimeda library"
-SECTION = "libs/multimedia"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=64e753fa7d1ca31632bc383da3b57c27"
-SRC_URI = "http://dvdnav.mplayerhq.hu/releases/libdvdread-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "ab7a19d3ab1a437ae754ef477d6231a4"
-SRC_URI[sha256sum] = "0bea15da842a4b04a482b009d72dcc6d9c9524ccc1bf67e5748319ec5ada8097"
-
-inherit autotools lib_package binconfig pkgconfig
-
-CONFIGUREOPTS_remove = "--disable-silent-rules"
-
-do_configure_prepend() {
-    # For some weird reason, libdvdread only provides a `configure2' script...
-    cp ${S}/configure2 ${S}/configure
-}
diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_5.0.3.bb b/meta-oe/recipes-multimedia/libdvdread/libdvdread_5.0.3.bb
new file mode 100644
index 0000000..0506725
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_5.0.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "DVD access multimeda library"
+SECTION = "libs/multimedia"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=64e753fa7d1ca31632bc383da3b57c27"
+SRC_URI = "http://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "b7b7d2a782087ed2a913263087083715"
+SRC_URI[sha256sum] = "321cdf2dbdc83c96572bc583cd27d8c660ddb540ff16672ecb28607d018ed82b"
+
+inherit autotools lib_package binconfig pkgconfig
+
+CONFIGUREOPTS_remove = "--disable-silent-rules"
+
-- 
2.1.0


