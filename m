Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37945.1795594109302407563
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RiFFcpP+;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so13984571eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594109; x=1796198909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BrZ6mRY2QzlL2Zhis8Xicmtc5VRRq3RYd6wvKPYJl7U=;
        b=RiFFcpP+1qgmqmP0TtmQn7DD6jkkkgJdUr4c4Th91PB3LAyMmZzIWogh0KuoTmCQTl
         UDQhShkXCv5X26LJ54KoTbzKC0RTEm1ej/Xj1V+Hsh1WVoH+PorOCvwl2ghdx1+kQty1
         jbI812yI60hLOQvC5K4PLF1Z85Zwkunl9EIsTZTvMYqWjbHO8X4/JnHDFsteKm0Fac0B
         qMJ7/wUDK3cV9EgnswXeP3Z4H53QSH3YzY6hI1zHZx0OTdWcCLTj0jZg43SolRub6AZZ
         vD+pjkIGikntQZb8RihGRdNojZIpv7LEseyDl9j43k55p1snfH7r0auqUWM4svcp5lUF
         XU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594109; x=1796198909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BrZ6mRY2QzlL2Zhis8Xicmtc5VRRq3RYd6wvKPYJl7U=;
        b=GZZa53nf5tViqqjtfXTFvsSu/6n1oHo1DA2zqsRifW3w2+YSuGsUkab/I7Aa5ZbLlF
         fWz9nggR1Sa03aMRpA7L1eGoL42KkRBH92sRkIDUuIN7jqBsL3+9LggBAXpCXPaS8xs+
         oymzEtUqeAKxngSouWq/IBWxiBmRF6cdTwsNjK9DFBU6DmQ3kNxMrMbnBXmjaJPJKmH7
         JJlsvKCRyUS7En/T+nABVR4feEt/pUA2NPvllIk98uFAaBpMGhpcT48sd1auKSWDJxZN
         qSVMf98Sfzz9pDXiPaF+hxVdqwj9Lu8RIkMniiuDUdwqp5jq877uTyJum/lrKp3oGNcV
         WMkg==
X-Gm-Message-State: APuU4Z/WI0BBnqzE3Uab68s3fZnKCLrjzrgjiB5r/K1sbK/Ja+8WSDp2
	/wEHmggdtbGVtZuOrNbeF2IDehgDgpGDyufOU1IXcDLxeaVerM48AsgvKTH2JZKE
X-Gm-Gg: AZFdTZfs12edVRAS5+r2dQXKH/PTPBVnFfI+fjuBdK4S1ZyJGw1ppR6gchm2G8ss9Ih
	FkbT3agRcAZR1iKuhqCgKXuQI7ZKMvKg73b5GKr5g+BtkxmtZY7ogNPHRzQuaJaXplJ9ma7NgKv
	fZMGtvwRCuLpTdDP832uiZr0d1strM0bOIx0eYIb0ABOgRxnyl4Ky/IW4cGjnafnEbANNNqTUxt
	y1eXJ8VamjpwT9g7I93BZ9rM6dwERs8b/Ltf+rFET3IYten36APxE3fH4dzYEJYyqtGzGS8TBEQ
	bM/NYyhBJOgmK17DQiRXzRmRPJ0M45x8xtG7pkpxKWqBBV7tcJ8rYVQDsPwW8FFXXByj7Lggdn5
	VgCDCSbMxBc7Q1D2tY6wr90y8QZZEdkNeDcKTnRNu4TKLntk2sHH5JPWENU4EBbh2zBdBHxG2AD
	O7kDRcjZKWSJj1+lBOFXgfOsTHo51O4/M/G4mXu/Vf2earl28vxUYXqUboyWjSejR4+5m4MNY1+
	9UdJxxVj3vL93u/gsqTX+SD11o2QbWk4sRQcn8zLlVndhKF9fc6TuoZvWNA9zlqaPvVy8LMQ5vt
	JyIakgfxtHnddm4FqDKfZqNGzupi53sxQNt4b0DRKIyAzqnpIs4j5HypB3QuLIW8iAyey7co8Em
	P0DyeXnX0f0v7vk13LWWxFKvw1qhGheNZGhyOtzT67+i/fRWgiy3S/IFwE8DcSz5+B1sN6gRzzI
	6cr2tqgsxeCe5kHBdAGBzH4sH58bgmrlfkVbVXr7p/gnzz05NibbphQJvcfvojWbvmkeBPZF2NE
	qd191Jq/i/XUZ+5cFDSwmCgMEeFpw9IUryXZv1hscHYDzogiV7TMrayMDEKdEbNp0Y5j1/f5uPM
	ZRm/
X-Received: by 2002:a05:693c:894c:20b0:386:b566:85e with SMTP id 5a478bee46e88-386b5660d73mr8265487eec.16.1795594108633;
        Wed, 25 Nov 2026 00:08:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 37/55] tigervnc: Build the viewer with fltk1.3
Date: Wed, 25 Nov 2026 00:06:53 -0800
Message-ID: <20261125080732.2419614-43-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133040
Content-Type: text/plain; charset="utf-8"

fltk is now 1.4, and TigerVNC (even upstream master) only supports
FLTK 1.3: its CMake fails with "Incompatible version of FLTK".
Upstream has not ported to 1.4 because of rendering issues, so, like
Fedora and Arch, build against the fltk1.3 compatibility library.

Depend on fltk1.3 and pass its include directory and libraries to
CMake's FindFLTK, which otherwise searches the default paths.

Add UPSTREAM_CHECK_GITTAGREGEX matching release tags only; the
x.y.9x tags are betas.

oe-core xorg libraries now depend on util-macros-native instead of
util-macros, so it no longer reaches the sysroot through them; depend
on util-macros-native directly for autoreconf of the bundled X server.
Update XORG_PV to 21.1.26 to match oe-core.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-graphics/tigervnc/tigervnc_1.16.2.bb | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
index c96ba2f40f..d8f7e0ee9a 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "TigerVNC remote display system"
 HOMEPAGE = "http://www.tigervnc.com/"
 LICENSE = "GPL-2.0-or-later"
 SECTION = "x11/utils"
-DEPENDS = "gettext-native xserver-xorg gnutls nettle jpeg pixman libxtst fltk libpam libx11 libxdamage libxfixes libxrandr xkbcomp"
+DEPENDS = "gettext-native util-macros-native xserver-xorg gnutls nettle jpeg pixman libxtst fltk1.3 libpam libx11 libxdamage libxfixes libxrandr xkbcomp"
 RDEPENDS:${PN} = "coreutils hicolor-icon-theme perl bash xkbcomp"
 
 LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
@@ -23,13 +23,15 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=master;protocol=https \
            file://0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0003-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
 "
+# x.y.90+ tags are betas
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+\.\d+\.[0-8]?\d)$"
 
 # Keep sync with xorg-server in oe-core
 XORG_PN ?= "xorg-server"
-XORG_PV ?= "21.1.24"
+XORG_PV ?= "21.1.26"
 SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.xz;name=xorg"
 XORG_S = "${UNPACKDIR}/${XORG_PN}-${XORG_PV}"
-SRC_URI[xorg.sha256sum] = "1a4eb36ca65cc3b1b936566d677a9786e13c11cd5806e951ac55f3f5ce3984af"
+SRC_URI[xorg.sha256sum] = "c8609f9cdafde14de7ec7cb406dac9507add1d536df8d3c3e3d3d9c1cd864066"
 
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.
@@ -76,6 +78,14 @@ EXTRA_OECONF = "--disable-xorg --disable-xnest --disable-xvfb \
 
 EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DCMAKE_INSTALL_UNITDIR=${systemd_system_unitdir}', '-DINSTALL_SYSTEMD_UNITS=OFF', d)}"
 
+# The viewer needs FLTK 1.3; point CMake's FindFLTK at the side-by-side fltk1.3 install
+EXTRA_OECMAKE += " \
+    -DFLTK_INCLUDE_DIR=${STAGING_INCDIR}/fltk1.3 \
+    -DFLTK_BASE_LIBRARY_RELEASE=${STAGING_LIBDIR}/fltk1.3/libfltk.so \
+    -DFLTK_IMAGES_LIBRARY_RELEASE=${STAGING_LIBDIR}/fltk1.3/libfltk_images.so \
+    -DFLTK_FORMS_LIBRARY_RELEASE=${STAGING_LIBDIR}/fltk1.3/libfltk_forms.so \
+"
+
 do_configure:append () {
     autotools_do_configure
 }
