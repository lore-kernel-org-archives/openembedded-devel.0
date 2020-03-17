Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id EBFC6600AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 23:34:37 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id f11so11220978wrp.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 16:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2MvMlxaYS7SuYKMAb6uqgSG92zwOSvjIvrYZiBLU90k=;
	b=NirfTh1IimvrhKjp4JpXSjjcgagDfaEx9d/uunHcVaB2DWFm2J0GR07iOLbBHVCj5B
	r0yn2s1xNQW3SfBin2znBlT0xCPXFAxLMvQIIHc1sBtMgFCV5UugyaNv9y3SNiJdOZUK
	iIDCdlvM0sfgxzsk7g4I1oggLP04CSHCzSaEBiIfG0/kh+c4HSAyhjIa7GVpyZacOQr1
	EfVNEoXBo2JeoJnJu20GRu+enmn86IFcEgA4PzFNk63XNC4hZtm7El+AzxDQ3FUqjboI
	VzipzipxIsXGOvBXkIcxXHt5lPkd/PBhIYoCbIuhdLPtjPt/TsEUMKnDWzlfrMz7oMbS
	+wNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2MvMlxaYS7SuYKMAb6uqgSG92zwOSvjIvrYZiBLU90k=;
	b=PMHhIod+48z8YSprSm7P1PWSUGk52NWqBhvANoguN/kqopRxZoPrGvSr32zH+zExnb
	X/wPBKqx6LxHIJTVcjiUkMgpI6SZ2qlLjFjn/cr+kO+Frp3f7VeY/CH3AtCRD7Y4N+q9
	NzOduXDXTCXdJBfLQKIkg5WW7IUteYosaVkh63g8WQnegefwFX/YtYCCclT7qYHjgj9Y
	CVolQHPBJS69+QeMGiwdwRgEWnjqnO3uY1nqNdPUG0y6uIRFmVN0Ug7YE4v+JL3lRkHA
	DRlemoypAH8NYMbB/XU2COSb33hQOeEKwo3uiceb7hSqbbJ7oDJUHpaNkwgRn5WpqgoD
	kwrA==
X-Gm-Message-State: ANhLgQ1ZPWTiBD5wBIGMu2Wk25FXO+YmAY7smeNCZkp4wWMaaL4pZY0X
	FkuHKJbSMUpkNRt4us6v5v22x8SJ6No=
X-Google-Smtp-Source: ADFU+vtZD+r6+Bcc9t4lRtW/ycmhstN7BfNSA+nZ0bM7F99EmcWPNFwR+f86h8jaGkq1+j5yEukiFg==
X-Received: by 2002:a05:6000:10c6:: with SMTP id
	b6mr1434095wrx.130.1584488077823; 
	Tue, 17 Mar 2020 16:34:37 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0E8C3838FF9D0BB177A6DE.dip0.t-ipconnect.de.
	[2003:f0:7f0e:8c38:38ff:9d0b:b177:a6de])
	by smtp.gmail.com with ESMTPSA id
	h13sm6620365wrv.39.2020.03.17.16.34.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 16:34:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2020 00:34:27 +0100
Message-Id: <20200317233429.11356-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH][v2 1/2] pipewire: upgrade 0.2.7 -> 0.3.1
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
X-List-Received-Date: Tue, 17 Mar 2020 23:34:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* as long as we have not upgradeed mutter to 3.36 we have to keep pipewire
  0.2.7 as pipewire-0.2 - mutter 3.34 asks for pipewire 0.2
* license was changed to MIT
* additional PACKAGECONFIGs added. The defaults were chosen by DISTRO_FEATURES
  or if not available by pipewire's defaults
* vulkan was disabled for now

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
V1 -> V2: Add vulkan PACKAGECONFIG
 .../pipewire/pipewire-0.2_git.bb              | 65 +++++++++++++++++++
 .../pipewire/pipewire_git.bb                  | 30 +++++----
 2 files changed, 84 insertions(+), 11 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb

diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb b/meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb
new file mode 100644
index 000000000..bcb3015f8
--- /dev/null
+++ b/meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb
@@ -0,0 +1,65 @@
+SUMMARY = "Multimedia processing server for Linux"
+AUTHOR = "Wim Taymans <wtaymans@redhat.com>"
+HOMEPAGE = "https://pipewire.org"
+SECTION = "multimedia"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=d8153c6e65986f862a0550ca74a3ed73 \
+    file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+"
+DEPENDS = "alsa-lib dbus udev"
+SRCREV = "14c11c0fe4d366bad4cfecdee97b6652ff9ed63d"
+PV = "0.2.7"
+
+SRC_URI = "git://github.com/PipeWire/pipewire"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig systemd manpages
+
+PACKAGECONFIG ??= "\
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+    gstreamer \
+"
+
+PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
+PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxml-parser-perl-native"
+
+PACKAGES =+ "\
+    ${PN}-spa-plugins \
+    ${PN}-alsa \
+    ${PN}-config \
+    gstreamer1.0-${PN} \
+    lib${PN} \
+    lib${PN}-modules \
+"
+
+RDEPENDS_lib${PN} += "lib${PN}-modules ${PN}-spa-plugins"
+
+FILES_${PN} = "\
+    ${sysconfdir}/pipewire/pipewire.conf \
+    ${bindir}/pipewire* \
+    ${systemd_user_unitdir}/* \
+"
+FILES_lib${PN} = "\
+    ${libdir}/libpipewire-*.so.* \
+"
+FILES_lib${PN}-modules = "\
+    ${libdir}/pipewire-*/* \
+"
+FILES_${PN}-spa-plugins = "\
+    ${bindir}/spa-* \
+    ${libdir}/spa/* \
+"
+FILES_${PN}-alsa = "\
+    ${libdir}/alsa-lib/* \
+    ${datadir}/alsa/alsa.conf.d/50-pipewire.conf \
+"
+FILES_gstreamer1.0-${PN} = "\
+    ${libdir}/gstreamer-1.0/* \
+"
+
+CONFFILES_${PN} = "\
+    ${sysconfdir}/pipewire/pipewire.conf \
+"
diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
index bcb3015f8..64ef8e3c9 100644
--- a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
+++ b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
@@ -2,14 +2,14 @@ SUMMARY = "Multimedia processing server for Linux"
 AUTHOR = "Wim Taymans <wtaymans@redhat.com>"
 HOMEPAGE = "https://pipewire.org"
 SECTION = "multimedia"
-LICENSE = "LGPL-2.1"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE;md5=d8153c6e65986f862a0550ca74a3ed73 \
-    file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+    file://LICENSE;md5=e2c0b7d86d04e716a3c4c9ab34260e69 \
+    file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a \
 "
 DEPENDS = "alsa-lib dbus udev"
-SRCREV = "14c11c0fe4d366bad4cfecdee97b6652ff9ed63d"
-PV = "0.2.7"
+SRCREV = "74a1632f0720886d5b3b6c23ee8fcd6c03ca7aac"
+PV = "0.3.1"
 
 SRC_URI = "git://github.com/PipeWire/pipewire"
 
@@ -18,13 +18,18 @@ S = "${WORKDIR}/git"
 inherit meson pkgconfig systemd manpages
 
 PACKAGECONFIG ??= "\
-    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-    gstreamer \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio systemd vulkan', d)} \
+    jack gstreamer \
 "
 
-PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
-PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[bluez] = "-Dbluez5=true,-Dbluez5=false,bluez5 sbc"
+PACKAGECONFIG[jack] = "-Djack=true,-Djack=false,jack"
+PACKAGECONFIG[gstreamer] = "-Dgstreamer=true,-Dgstreamer=false,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxml-parser-perl-native"
+PACKAGECONFIG[pulseaudio] = "-Dpipewire-pulseaudio=true,-Dpipewire-pulseaudio=false,pulseaudio"
+PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
+PACKAGECONFIG[vulkan] = "-Dvulkan=true,-Dvulkan=false,vulkan-loader"
 
 PACKAGES =+ "\
     ${PN}-spa-plugins \
@@ -33,28 +38,31 @@ PACKAGES =+ "\
     gstreamer1.0-${PN} \
     lib${PN} \
     lib${PN}-modules \
+    lib${PN}-jack \
 "
 
 RDEPENDS_lib${PN} += "lib${PN}-modules ${PN}-spa-plugins"
 
 FILES_${PN} = "\
     ${sysconfdir}/pipewire/pipewire.conf \
+    ${bindir}/pw-* \
     ${bindir}/pipewire* \
     ${systemd_user_unitdir}/* \
 "
 FILES_lib${PN} = "\
     ${libdir}/libpipewire-*.so.* \
+    ${libdir}/libjack-*.so.* \
+    ${libdir}/libpulse-*.so.* \
 "
 FILES_lib${PN}-modules = "\
     ${libdir}/pipewire-*/* \
 "
 FILES_${PN}-spa-plugins = "\
     ${bindir}/spa-* \
-    ${libdir}/spa/* \
+    ${libdir}/spa-*/* \
 "
 FILES_${PN}-alsa = "\
     ${libdir}/alsa-lib/* \
-    ${datadir}/alsa/alsa.conf.d/50-pipewire.conf \
 "
 FILES_gstreamer1.0-${PN} = "\
     ${libdir}/gstreamer-1.0/* \
-- 
2.21.1


