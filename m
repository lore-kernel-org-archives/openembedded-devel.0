Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id F0B33760A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 14:29:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p65so4374217wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 06:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=i/CerzRF1RLlxDxeByMUmTqtDgz3RiW7KOi27EmjVug=;
	b=GhcbsO8Nwd5dLqbo33meCC4oRXYp8NpsyNVQoZuqL0+1xL9H7yIn0WyJWu+S1LPLiI
	y7SaUS6Hpk53p8D2tHCD+Im/yBEIvYgR6JDFJIGyhWN/gCgSIQOYepXbkSjzHvtgAupK
	0QfNERLQ11BbQFLO/98mqnGYgD672u2a0dQ/r8OJdlRqVmgbldh3GP+QwxNRLFEUHOZO
	QhScDc00OfpkQj49sm1mgzlkDl+HRqhbfcdXDE8MEmZpDpFofCD4cHq7DZbCucNdhzWx
	zlRhvm5V/hJ62vnVLBop3/8WZElTcbpZm1RlYCML1vEeDQHCzS5WZ76l/ZBaamZMvHJT
	HPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=i/CerzRF1RLlxDxeByMUmTqtDgz3RiW7KOi27EmjVug=;
	b=GjHQHE2dyqxYhsdj5a1eCXPgJd5ryR0Ujg7v7E2b4QmNlJs5Jgq0q+3xNDrGJT4/u2
	g1EKFucu+vILnFuZg/ewSeEWHzoEtg6Yq0iI65XsSFZivoG2x48xvt9cMMgt2JRze6Cq
	Hane2b6mbu7NHbk4Km9vsXXUR09xwm3qW0b+mAnpIiPPkqtmTFtvbrn6dYwKeavOnAWR
	KH9o1f9BJUDIGoPj2UG8X618NnkxFQfLEtCVWfccrYRKMzP/flTruTBTLg2gb1OiR0pV
	0poFLpaBAduJ+2J0zk9Ng8MzR25eIebjC7PRovC2viaJ7bYBNYxyz70/1v4ATFvtPNA0
	PrRA==
X-Gm-Message-State: AD7BkJKd4ZNKRtzIbdsGPJGizSzKnJxXrANaF6oIIbAJLOoclSaJiC1xSdg2Q3cMnkr38A==
X-Received: by 10.194.123.102 with SMTP id lz6mr3730077wjb.2.1457015342299;
	Thu, 03 Mar 2016 06:29:02 -0800 (PST)
Received: from localhost.localdomain ([81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	k124sm9177231wmb.11.2016.03.03.06.29.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 06:29:01 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Mar 2016 15:28:50 +0100
Message-Id: <1457015330-16676-4-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1457015330-16676-1-git-send-email-funman@videolan.org>
References: <20160302192515.GG10529@jama>
	<1457015330-16676-1-git-send-email-funman@videolan.org>
Subject: [meta-multimedia][PATCH 4/4] vlc: add libpng PACKAGECONFIG (on by default)
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
X-List-Received-Date: Thu, 03 Mar 2016 14:29:03 -0000

WARNING: vlc-2.2.2-r0 do_package_qa: QA Issue: vlc rdepends on libpng, but it isn't a build dependency, missing libpng in DEPENDS or PACKAGECONFIG? [build-deps]
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


