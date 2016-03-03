Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC41770E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 15:50:44 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l68so137365293wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 07:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=C8RfgBNFb/r2IWna6KS0lSZHo25g9GnELfcgz3xg5ME=;
	b=xwhab/X6/OhTUN//zH7YO125CXWAdbbp4Mez0m1hM9tX7MUyaGvZKNgCnwZrif8h0f
	w1IxJ+eWUrWO5uzuCsHGbbM3JUSSuA6sW4yxnOGBTXO9nnq7SQmvN/fFq3YTgYc/nSG8
	hmQmtxYYYSiJzXNO+vuxgCrTQtPVzTt4rAwOvTXxoBiHFgMwRfUVBPc6+hMbOI3PCgSs
	AZJAU2V7+rsD7jLvKxF5GYsDm43nFwfrKWiJgSmSEyG0ZNVDSJv8xuMx4hJ9Wv3rylfC
	Zoq22vAF8zZYR8I8sX8lu7CUznATZhlLkpE08jSdqPY8TTBcB5w9HFBtKx9CKLgXOT0s
	XGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=C8RfgBNFb/r2IWna6KS0lSZHo25g9GnELfcgz3xg5ME=;
	b=QPEJjaGFnTQN/YcKJ+VkO1Uk918G628vH9kWhxul+SuVCMdaUyGgmPiQldlbrKAcsD
	nAeiuGxCAk3VJBj930l8oUmM31xMKXmpBwEXGR15SfvSigwpWh+ROjGBehmncq1wZs3C
	/iTRyf8hXFgae9EFst0UP+lq5HMKmR1n3KvOc9/RXDwWDxNuRpyq5Ty0MJaTZVjkw1MU
	1ovlJ45jUx5lQOmVhSXz9+CrJhZ7Nyq22Gdv2BBS5EXIZ0SS+3hWh+bX5+aHvQLV7Mzq
	t5gdSafCTUYSSzPa1q+FgXgdvRQKv2AWN9SU6V/HxNUUpevdwKovwZjUkR0XFJyVDEt+
	UhdA==
X-Gm-Message-State: AD7BkJIWw8nGZQLxpXePBHNEsy6Zj4ourCTcPBtufQsYp49fpR74CArsOdThMnTLvhhT/g==
X-Received: by 10.28.20.145 with SMTP id 139mr6754771wmu.76.1457020244786;
	Thu, 03 Mar 2016 07:50:44 -0800 (PST)
Received: from localhost.localdomain ([81.56.255.191])
	by smtp.gmail.com with ESMTPSA id z65sm3388184wmg.1.2016.03.03.07.50.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 07:50:44 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Mar 2016 16:50:31 +0100
Message-Id: <1457020231-24024-4-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1457020231-24024-1-git-send-email-funman@videolan.org>
References: <20160302192515.GG10529@jama>
	<1457020231-24024-1-git-send-email-funman@videolan.org>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCHv2 4/4] vlc: add libpng PACKAGECONFIG (on by default)
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
X-List-Received-Date: Thu, 03 Mar 2016 15:50:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WARNING: vlc-2.2.2-r0 do_package_qa: QA Issue: vlc rdepends on libpng, but it isn't a build dependency, missing libpng in DEPENDS or PACKAGECONFIG? [build-deps]
Signed-off-by: Rafaël Carré <funman@videolan.org>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index c77f2d1..8142e16 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -25,7 +25,6 @@ EXTRA_OECONF = "\
     --disable-screen --disable-caca \
     --enable-httpd --enable-vlm \
     --enable-freetype \
-    --enable-png \
     --enable-tremor \
     --enable-v4l2 --disable-aa --disable-faad \
     --enable-dbus \
@@ -38,7 +37,7 @@ EXTRA_OECONF = "\
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "
 
-PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 sdl', '', d)}"
+PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 sdl', '', d)}"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl libsdl-image "
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
@@ -72,6 +71,7 @@ PACKAGECONFIG[freetype] = "--enable-freetype,--disable-freetype, freetype"
 PACKAGECONFIG[dvdread] = "--enable-dvdread,--disable-dvdread, libdvdread libdvdcss"
 PACKAGECONFIG[vnc] = "--enable-vnc,--disable-vnc, libvncserver"
 PACKAGECONFIG[x11] = "--with-x --enable-xcb,--without-x --disable-xcb,  xcb-util-keysyms libxpm libxinerama"
+PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
2.5.0


