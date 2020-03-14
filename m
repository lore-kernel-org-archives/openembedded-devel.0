Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 07E48600B0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2020 22:04:52 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w16so169603wrv.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2020 15:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sg8pOAIPxGR8u4s37RPY4Zq2d5ohuZQ4WDEQGFE27eU=;
	b=Tz3CAehVFXRiet/5AFllaCQEKWVwiROEq7WKY286ORf8KajooYw0vanSp2ibdVYYvP
	INX8feCdhpsOH7P5SR5zpqF1EAWHsOmb4PEVFVDEyW8zgrPajfBIWoEVFYS0lO1iKosX
	Uk/T4wVp0PQEF2EKiTzuXRw+FQk3DyLq/shl8XMd5uyGUsHO2In0srKXuRTViJqa5Kbi
	AP6FJMTOqmv9C1qB/1BLO52cSlJM4tP8OfJyNLJ7bhrU1A5doS7BGyQOMURc/Nf/epU+
	EL+G+3ggp0EmaL2FNsZm8NRbIYn1Eyvu6nybvawBeovO1Okdvm6xanNiro4cShMJ4qSS
	Xc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sg8pOAIPxGR8u4s37RPY4Zq2d5ohuZQ4WDEQGFE27eU=;
	b=DM9MOMB1WTQZY1/slM2fpv8qz9YmNmEcJosQnwxHT+5H7U69ceRhw1f8P8YlMNX8VH
	Yee6BE1syDL10luDm5gmYSpwXgtp/yuw/5LOja4YJNNXuKOlZL+4kyPKFN+oNNPTTkQU
	SBje8a18qcd4ftTpJDsc5BbqxlYW5innJlG/s7UVezS1NNP+H9IU531zuLrdia0D5JCH
	c4HF8qlmWLo3LrwjngcWP6WROflAen8BHhBRNqlbSwHB2qhD67gif2vm/sbX4cE4OPss
	q5/cKtjxXs+3TAhcKNsPsntAxGIl5rTCC35sj1omE3asxd27vdQXXoZd+6e6YowCS2lK
	gIDg==
X-Gm-Message-State: ANhLgQ1Bo4Vpxa/xOdx5GKDXhp/AZiMCgCYjR9hHw8PsDjCKQ0FQRP3T
	kfaN7y8wTFcKF82axYHy2hd+kftNH2A=
X-Google-Smtp-Source: ADFU+vvA8CIp3OANGSMVUpZJPu6lnVvpzw5d0+nboI2Kwri36jgZ5+s+uj8XqQeONScn27RSZWpMfQ==
X-Received: by 2002:a5d:448f:: with SMTP id j15mr24828275wrq.425.1584223493090;
	Sat, 14 Mar 2020 15:04:53 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0BEB41AD3B47880472491F.dip0.t-ipconnect.de.
	[2003:f0:7f0b:eb41:ad3b:4788:472:491f])
	by smtp.gmail.com with ESMTPSA id
	v10sm15287835wml.44.2020.03.14.15.04.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Mar 2020 15:04:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Mar 2020 23:04:39 +0100
Message-Id: <20200314220440.5983-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH 1/2] pipewire: upgrade 0.2.7 -> 0.3.1
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
X-List-Received-Date: Sat, 14 Mar 2020 22:04:53 -0000
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
 .../pipewire/pipewire-0.2_git.bb              | 65 +++++++++++++++++++
 .../pipewire/pipewire_git.bb                  | 32 +++++----
 2 files changed, 86 insertions(+), 11 deletions(-)
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
index bcb3015f8..95da2df09 100644
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
 
@@ -18,13 +18,20 @@ S = "${WORKDIR}/git"
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
+# disable vulkan fo now
+EXTRA_OEMESON = "-Dvulkan=false"
+
+PACKAGECONFIG[bluez] = "-Dbluez5=true,-Dbluez5=false,bluez5 sbc"
+PACKAGECONFIG[jack] = "-Djack=true,-Djack=false,jack"
+PACKAGECONFIG[gstreamer] = "-Dgstreamer=true,-Dgstreamer=false,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxml-parser-perl-native"
+PACKAGECONFIG[pulseaudio] = "-Dpipewire-pulseaudio=true,-Dpipewire-pulseaudio=false,pulseaudio"
+PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
 
 PACKAGES =+ "\
     ${PN}-spa-plugins \
@@ -33,28 +40,31 @@ PACKAGES =+ "\
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


