Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 37CEC7D577
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 08:30:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b10so14677510wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gUaGjiP7w4U5aevu/Y2YeiBXpjtXYmWkVIBw07at7cg=;
	b=n8o/LkqzEeMAIgSPpz9VXr2DRvrjljanupYi6W2AWjAr1S2vgyaxvmmzhnE6MsJPEr
	aKt2gmFeXvXO61B75VBYNKXVrn9vAvsGag7HfSWoF6W3i2/4NB36sVKwRSiibfWMMEwx
	AUxdSiAYpsZMQRtMn91YuaLohGEL7Zf/BioPTXDAS+TpLzP8VUmMGxBk8Jirjl2alPOW
	Vy4slzMCiZaWK9IYrMVMvSS3njT0x/pK1WGXRPIdhhKgFbDZajP7e29xQljYWW5VL6TJ
	YdcNa5EhGak+E/ME8jPKb816wN2M6Q/pgajUfN+nWfN3G+tgfYvgG6VG+cRXdwQ8sp0k
	7gmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gUaGjiP7w4U5aevu/Y2YeiBXpjtXYmWkVIBw07at7cg=;
	b=D9cUZzNA9BnQgCJkheIFGdBOA8/IsANKzm3Ov74akkeL2wiGIvtxt5Ku8o2N38C7xm
	l5ao+6sDZ47+9HIzMoLtwJ90Br5qiElMybE76EzVOHrzkDWfjinpJzGcAQeah0LBA17O
	xSOwGe51z4U7JpP4Fgf2kLk9Uuc3Pt/dgcDNJhzdd82tmnt/2KAuAfbjy5pyn/00exkI
	OGxRSSeIr0Jh6YJZfnCib5QjtGnD0rnBS+bfAYTr1s+2QzglHeBm8HixdtxQ9IdxMS7S
	vIj2NZaPFUZMvL1Bke0f8AffolPg95tF+MSSaqycKM7jTxhGO4uVMoubUBHo+zkEpnjm
	6Xew==
X-Gm-Message-State: APjAAAUdM6A1zlM3uMmkUydAprMq4Kj9qRzWGMP4+zwHIJA4tpg1pXlM
	wfdBPQvoAhmLhPcO7Skjs+cgFQt1
X-Google-Smtp-Source: APXvYqwn+Xg/NwCnQXwM72rnFDUpeImjM3y+J+TCM5Bl8KsjUtLzfWUnnXU9A3r9qsHBfKzSsXVXMw==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr4294300wmc.15.1557131405916; 
	Mon, 06 May 2019 01:30:05 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	a22sm7526235wmb.47.2019.05.06.01.30.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 01:30:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 10:29:44 +0200
Message-Id: <20190506082948.22276-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506082948.22276-1-schnitzeltony@gmail.com>
References: <20190506082948.22276-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] fontforge: upgrade 20170731 -> 20190413
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
X-List-Received-Date: Mon, 06 May 2019 08:30:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Features added and bugs fixed. For more information see [1]
* add gtk-icon-cache mime to inherit

[1] https://github.com/fontforge/fontforge/releases

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{fontforge_20170731.bb => fontforge_20190413.bb}  | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-graphics/fontforge/{fontforge_20170731.bb => fontforge_20190413.bb} (88%)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190413.bb
similarity index 88%
rename from meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb
rename to meta-oe/recipes-graphics/fontforge/fontforge_20190413.bb
index 661b5e8c5..ee3bc58bc 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190413.bb
@@ -3,19 +3,19 @@ HOMEPAGE = "http://fontforge.github.io/en-US/"
 LICENSE = "BSD-3-Clause & GPLv3"
 LIC_FILES_CHKSUM = " \
     file://COPYING.gplv3;md5=d32239bcb673463ab874e80d47fae504 \
-    file://LICENSE;md5=3f922b42ed0033fa0fd4cd3268f6429c \
+    file://LICENSE;md5=5f9637af5c51f2e8d06385ef38eb48f1 \
 "
 
 DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool uthash gnulib gettext-native"
 DEPENDS_append_class-target = " libxi"
 
-inherit autotools pkgconfig pythonnative distro_features_check gettext
+inherit autotools pkgconfig pythonnative distro_features_check gettext gtk-icon-cache mime
 
 REQUIRED_DISTRO_FEATURES_append_class-target = " x11"
 
 SRC_URI = "git://github.com/${BPN}/${BPN}.git"
-# tag 20170731
-SRCREV = "b9149c13e8f9464fc21473f1f676b36a2130775d"
+# tag 20190413
+SRCREV = "7f6f1d021fdfea7789972f9534ba3241616d8dfc"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF_append_class-native = " with_x=no"
@@ -50,8 +50,9 @@ PACKAGES =+ "${PN}-python"
 RPROVIDES_${PN}-dbg += "${PN}-python-dbg"
 
 FILES_${PN} += " \
+    ${datadir}/appdata \
+    ${datadir}/metainfo \
     ${datadir}/mime \
-    ${datadir}/icons \
 "
 
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR} ${datadir}/${BPN}/python"
-- 
2.20.1


