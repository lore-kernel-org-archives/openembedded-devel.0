Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E75C43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 13:41:11 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5105.1783777261677773570
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jul 2026 06:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jJvMoVYG;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso1146909f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Jul 2026 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783777260; x=1784382060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tsaLFheFKA35cjYbOtp89+y/Pm94HPId6QLrSoMTsnw=;
        b=jJvMoVYGsEsnsJ6W02kUbH6tPFMGem74fce8zx5qHD+mGHtJOiJ1gSL8L/9hMUlGFU
         s/xyI+fBebjMuNiT6CqQuyse7CvvEHzHhnuGWwcqTHaqoplSWnCL/i3CzN/le6hfyvCG
         0ztfM6dpUVOEo9oq1t/KAf0CZl8z4gN5BFdbQZKan7SrBK15b2IwV60mgcjBleBtbc8s
         OYqTvuohW6t4ezQc29ExI/hvPpJK7QiQRzy/a80G0m6z1lL/YXq3emtmPXh0/yZ/Js/G
         tLslaLcQMfZc/FeO/GzysoWOcjCpB65TpktCCnYXT9EDJz6Cd21koO/zop1ZYQjPuvmS
         HCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783777260; x=1784382060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsaLFheFKA35cjYbOtp89+y/Pm94HPId6QLrSoMTsnw=;
        b=q8ndpr3d87wekd6SCZ+6plrAVFQuVJ71PQvIqpRPnyHzLl5mL6oHQI1NCpXnLVfnjr
         OrTWyiDCF0PzR5HdVpPa+LRitDb5lfblpq6eeGaAHlNaD3Byn+p735/DZBNZsASolEc8
         /kC0Yk/8YZ+qrb5ps8abCUn9v7XsASLxskKFdWuODYIVEZqj5wu4Mjhn3iY10uUGusKV
         9se+TyxwTIyu2UEahRbM8Y4y++Uu40H8xt6Zc9cqZzwWmBwXvcsep8aYvnhS79WaPl0F
         fZPXXyI9uRhbJ4G5oR/GP7NSSK1MprFTsJGJCiKFqFdiPx8aDbxOJ08d6o5byYRtfil+
         goNg==
X-Gm-Message-State: AOJu0YyoDFsazf9rgnp3Ul60w64uaDD9zNMfwDPxfV3iUBLf7PHd4dkM
	o5st06TyGolXYddfaCIbZncBwAbtj7UukKKKB6eboe02OOpHAD7ibd29v8uawg==
X-Gm-Gg: AfdE7clT+7D6vfEADJ3VrVGXfUvD1Uy8vUEJJoP3RtDi58N34qNAf7VuymKWkCjAHCL
	9mTGXf4oa0zzx9cV+H24ics7poN6mrMwUe4PJDOCMDVLdRRUgfW0pnH52Xj5Qgfhy9RMYcyPnBt
	zA3zTLsZMMHPoikTgM6qA9nhbdZVDBH7j1JoDVlQH7sUGccJS7ByzpnhlsyU8pFdomGwiSU9YUl
	qmcCCf7LQEZsrDSW8VfNeDuMkPyQx5k2NCQD11vUY2LPUgHrUhN5RZsXlTZgj2faiKEp8xdcZoQ
	2W59eQOrLh3INt1tKOi8+RupVGhOrUHdJKwZS1s4M7gGxlOr2UxcKwf9tL4Yw+prkgpOCHLj4gU
	AkoNEF8kxx90wifCzJyFP5EAJStKPV9WlroTWM0gv/RU+pY5KwrLn0h3go1vvla+q/JQZFt5m25
	OO658Jxt8iLbIwYGDoF8b2me3vh+WL1LJW9ckEWuR9dRlOLwi7HfBW956h3FRms+NMtgi6FGsp
X-Received: by 2002:a05:600c:628e:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-493f882918bmr24596055e9.27.1783777259545;
        Sat, 11 Jul 2026 06:40:59 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493fbae1cdbsm23547645e9.10.2026.07.11.06.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 06:40:59 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-multimedia][PATCH] pjproject: Add recipe
Date: Sat, 11 Jul 2026 14:40:29 +0100
Message-ID: <20260711134028.1527888-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Jul 2026 13:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128136

SIP/RTP/NAT-traversal stack plus SWIG-generated pjsua2 Python bindings.

AI-Generated: Claude Sonnet 5 (claude.ai/code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../pjproject/pjproject_2.17.bb               | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
new file mode 100644
index 000000000000..44100c8231b3
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -0,0 +1,118 @@
+SUMMARY = "Open source SIP and media stack, plus pjsua2 Python bindings"
+DESCRIPTION = "PJSIP is a free and open source multimedia communication library \
+written in C with high level API in C, C++, Java, C#, and Python languages. It \
+implements standard based protocols such as SIP, SDP, RTP, STUN, TURN, and ICE. \
+It combines signaling protocol (SIP) with rich multimedia framework and NAT \
+traversal functionality into high level API that is portable and suitable for \
+almost any type of systems ranging from desktops, embedded systems, to mobile \
+handsets."
+HOMEPAGE = "https://www.pjsip.org/"
+SECTION = "libs"
+
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag=${PV}"
+SRCREV = "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
+
+DEPENDS = "swig-native python3-setuptools-native"
+
+inherit pkgconfig python3native python3targetconfig
+
+# Not autotools: ./configure is a one-line wrapper round pjproject's own
+# aconfigure, which may or may not be autotools... there appears to be no
+# documentation.
+B = "${S}"
+
+EXTRA_OECONF = "${PACKAGECONFIG_CONFARGS} ${@ '' if d.getVar('DISABLE_STATIC') == '' else '--enable-shared' }"
+
+do_configure() {
+	./configure --host=${HOST_SYS} --prefix=${prefix} --libdir=${libdir} --includedir=${includedir} \
+		${EXTRA_OECONF}
+}
+
+# ssl and sound are the only features enabled by default - everything video-
+# related cascades off of --disable-video (aconfigure.ac turns off sdl,
+# ffmpeg, v4l2, openh264 and vpx together whenever video itself is off).
+PACKAGECONFIG ?= "ssl ${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)}"
+
+# --with-X=DIR options (ssl, sdl, openh264, vpx) fall back to disabled when
+# cross-compiling unless a prefix is explicitly given, so their "on" arg
+# always needs an explicit STAGING_DIR_HOST path, not just a bare
+# --enable-X/--with-X.
+PACKAGECONFIG[alsa] = "--enable-sound,--disable-sound,alsa-lib"
+PACKAGECONFIG[ffmpeg] = "--enable-ffmpeg,--disable-ffmpeg,ffmpeg"
+PACKAGECONFIG[libwebrtc] = "--enable-libwebrtc,--disable-libwebrtc"
+PACKAGECONFIG[openh264] = "--with-openh264=${STAGING_DIR_HOST}${prefix},--disable-openh264,openh264"
+PACKAGECONFIG[sdl] = "--with-sdl=${STAGING_DIR_HOST}${prefix},--disable-sdl,libsdl2"
+PACKAGECONFIG[ssl] = "--with-ssl=${STAGING_DIR_HOST}${prefix},--without-ssl,openssl"
+PACKAGECONFIG[v4l2] = "--enable-v4l2,--disable-v4l2,v4l-utils"
+PACKAGECONFIG[video] = "--enable-video,--disable-video"
+PACKAGECONFIG[vpx] = "--with-vpx=${STAGING_DIR_HOST}${prefix},--disable-vpx,libvpx"
+
+# pjproject's per-module rules.mak links some binaries and shared libs
+# (pjlib-test, libpj.so, etc.) directly via $(LD), not $(CC)/$(CXX).
+EXTRA_OEMAKE = "LD='${CXX}'"
+
+# Conservative: pjproject's per-module Makefiles don't always express
+# inter-file build ordering correctly for -j. Revisit if a parallel build
+# turns out to be reliable.
+PARALLEL_MAKE = ""
+
+do_compile:prepend() {
+	oe_runmake dep
+}
+
+PYSWIG_DIR = "${S}/pjsip-apps/src/swig/python"
+
+do_compile:append() {
+	# Reuse pjproject's own SWIG python Makefile (handles the swig
+	# codegen step with the right -I flags) rather than reimplementing
+	# it, just pointing PYTHON_EXE at the correctly cross-configured
+	# native python3 (python3native/python3targetconfig, above) instead
+	# of its own default bare "python3" off PATH.
+	cd ${PYSWIG_DIR}
+	oe_runmake PYTHON_EXE=${STAGING_BINDIR_NATIVE}/python3-native/python3
+	cd -
+}
+
+do_install() {
+	# pjproject's own "install:" target does DESTDIR-aware "cp -af
+	# $(APP_LIBXX_FILES) $(DESTDIR)$(libdir)/" etc for the C/C++ libraries,
+	# headers and libpjproject.pc - this is what autotools_do_install used
+	# to provide for free; now explicit since this isn't an autotools
+	# recipe.
+	oe_runmake 'DESTDIR=${D}' install
+
+	# -a preserves the *source* files' ownership (real host-user, since
+	# do_compile doesn't run under pseudo) instead of a fresh pseudo-
+	# tracked "create as root" event, which later trips up sstate
+	# signature computation ("uid not found", host contamination). Force
+	# every installed file through a real chown so pseudo re-registers
+	# correct ownership.
+	chown -R root:root ${D}
+
+	# Not "make install" (upstream's own install target here does
+	# "setup.py install --user", not DESTDIR-aware) - invoke setup.py
+	# directly, same pattern as setuptools3_legacy_do_install.
+	install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+	cd ${PYSWIG_DIR}
+	STAGING_INCDIR=${STAGING_INCDIR} \
+	STAGING_LIBDIR=${STAGING_LIBDIR} \
+	PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR}:$PYTHONPATH \
+	${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py \
+	install --skip-build --root=${D} --prefix=${prefix} --install-lib=${PYTHON_SITEPACKAGES_DIR}
+}
+
+PACKAGES =+ "python3-pjsua2"
+FILES:python3-pjsua2 = "\
+    ${PYTHON_SITEPACKAGES_DIR}/pjsua2* \
+    ${PYTHON_SITEPACKAGES_DIR}/_pjsua2* \
+    ${PYTHON_SITEPACKAGES_DIR}/__pycache__ \
+"
+RDEPENDS:python3-pjsua2 = "python3-core"
+
+# Static libs only: everything lands in ${PN}-dev (headers, libpjproject.pc)
+# and ${PN}-staticdev (the .a files) by bitbake's own default FILES
+# patterns - ${PN} itself ships nothing.
+ALLOW_EMPTY:${PN} = "1"

