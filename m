Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id D9DCF71AFA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:52 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id p66so668776pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Zsd0eSG3LTnX7GJRKDdOmZhSDoqdgEiYgMXr/8J19+w=;
	b=M0gZYIu+R5U2KU5jmRs3WycOPopP5CwcwBd0m1ISESrJn1i140VUFs2GAHAHh37WO2
	1XtAnxk3PoSYhlfjA9UCC6ygQbdxrcPLIyA9mggEDfeEuao4+KXE6Zo0yuYz3KkFfzKl
	3I3llvZz+br3/j0HmFwpa3zg8HegKYmvz9n5qP7K5vSiJkxpqLGcAh0gvNBc884ZFXlj
	TP2was5K+pCzYWGyhQa9Se91CuQWnfsdiS8PxxbikjnqdbO4vyWcpFQindNyr+c/Vdum
	mJIDJZ8LANjP8WEzqpxZdGDBNcwLaRR3xYtoKHMVpepcY+amSRYvPlss9pqIBlIrydsV
	iecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Zsd0eSG3LTnX7GJRKDdOmZhSDoqdgEiYgMXr/8J19+w=;
	b=BiTfC0iQRiMdHxdwtLMIjGKiYhBOUwKk3+naIAy/B3UqWUpYPY3JrkEFnLxFCSSdoP
	zJE/F1h/BLKt/Rty+cfMpMIEbrfjeiH+w15i3ca8JTyXy26xlalAuGLy9ThR2IaxVq5R
	3gQmDGYGE3AtKQ7cgdTtTuLXHXS+CoeD97DnBw/JaE/kZbGN/7P6GQNu78sfacJLO2JE
	HhFNCH2L4vui6ZwFnsm0mz6jkbdiyPjPe0sPvcEND1ufMuvzM2WJlZtxYxO63AJ5lbxP
	hVdJHP+KvwMXKBfAl/GoGOrxt7ZXDzm8R/vHHXgD/wbQZ1D8iP5pc4dycmJfFFX79Umb
	11kQ==
X-Gm-Message-State: AKaTC02QCXbwAJg9WiOwynOAoHXJTE3O0RGueytiQDsRj9xQCADFCWHv2WeqcsGrYKtweA==
X-Received: by 10.84.193.129 with SMTP id f1mr4569719pld.129.1479892974428;
	Wed, 23 Nov 2016 01:22:54 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:22:08 -0800
Message-Id: <20161123092209.23699-48-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 48/49] vlc: Add packageconfig for vdpau
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:53 -0000

Fix packaging of libvlc_vdpau.so since this plugin
does not have soname version

Fixes

QA Issue: non -dev/-dbg/nativesdk- package contains symlink .so: vlc path '/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/vlc/2.2.2-r0/packages-split/vlc/usr/lib/vlc/libvlc_vdpau.so' [dev-so]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 0972b61..087baab 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -37,7 +37,7 @@ EXTRA_OECONF = "\
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "
 
-PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 sdl', '', d)}"
+PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 sdl vdpau', '', d)}"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl libsdl-image "
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
@@ -72,6 +72,7 @@ PACKAGECONFIG[dvdread] = "--enable-dvdread,--disable-dvdread, libdvdread libdvdc
 PACKAGECONFIG[vnc] = "--enable-vnc,--disable-vnc, libvncserver"
 PACKAGECONFIG[x11] = "--with-x --enable-xcb,--without-x --disable-xcb,  xcb-util-keysyms libxpm libxinerama"
 PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
+PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
@@ -94,6 +95,7 @@ FILES_${PN} += "\
     ${datadir}/applications \
     ${datadir}/vlc/ \
     ${datadir}/icons \
+    ${lindir}/vlc/vlc/libvlc_vdpau.so \
 "
 
 FILES_${PN}-dbg += "\
@@ -104,3 +106,6 @@ FILES_${PN}-dbg += "\
 FILES_${PN}-staticdev += "\
     ${libdir}/vlc/plugins/*/*.a \
 "
+
+INSANE_SKIP_${PN} = "dev-so"
+
-- 
2.10.2


