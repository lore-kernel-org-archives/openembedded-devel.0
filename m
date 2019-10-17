Return-Path: <tom.rini@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id D671F7F57D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 13:53:13 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id l64so867903ywe.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 06:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BTBI6FGA9GFcXEbBZCje3y+w7W1HYxQy3s1pibQfxVU=;
	b=nZ8JXurF5gTrNkyTiNn6pe3hXvHCGHbPyAPmX6LvQN7ThUxzoeBzb3AU/cLaLUalJY
	Ykp5Ws0ShjIVmxjSeJBmsp5EoI+NruacT+cqxTzuC4ZZ7Hs4yQpOQG7549PR65eSzDah
	X5nZnzsJ08wzjr/UU7T8d1gR3Jr3vScdcteXTAUQyc6CuPAXlTjq8c9o/MkkS6n4zl0M
	MjUn1hVo0bo3GRpOQFn1wykGEg58qV697C5iP7ax6RRYMP6ORollXgUteKtWWYY9BCKn
	rB3DVuLBTqw4HFMNVpxAZdhw5C1/G4iNM4T2CcvCY/Qi/I229OLDuPcxJS/ARIGAZFs4
	bNfw==
X-Gm-Message-State: APjAAAUHFqFibY5KqOLmyBxyhs8+xHmgzvG3rVl0GWKxtmpExRbtmcg6
	F2JB6xIGVIhqtPhveRCBMGKpS0RhcQ==
X-Google-Smtp-Source: APXvYqxMWYmSvfsgKp2QzA3Rxh0gLLvHjD80ENZXeSSoy6dvvlPkGnzLragFlR40CUISeqF0Mgkm/A==
X-Received: by 2002:a81:498c:: with SMTP id w134mr2969369ywa.416.1571320394196;
	Thu, 17 Oct 2019 06:53:14 -0700 (PDT)
Received: from bill-the-cat.local (cpe-65-184-142-8.ec.res.rr.com.
	[65.184.142.8])
	by smtp.gmail.com with ESMTPSA id y205sm524568ywc.6.2019.10.17.06.53.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Oct 2019 06:53:13 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2019 09:53:09 -0400
Message-Id: <20191017135309.32441-1-trini@konsulko.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: George Kiagiadakis <george.kiagiadakis@collabora.com>,
	=?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <jsmoeller@linuxfoundation.org>
Subject: [meta-oe][PATCHv2] pipewire: Initial add of 0.2.7
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
X-List-Received-Date: Thu, 17 Oct 2019 13:53:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: George Kiagiadakis <george.kiagiadakis@collabora.com>

Add PACKAGECONFIG options for the currently available features.

[Based on pipewire.inc / pipewire_git.bb from meta-agl-devel/meta-pipewire]

Cc: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Jan-Simon Möller <jsmoeller@linuxfoundation.org>
Signed-off-by: George Kiagiadakis <george.kiagiadakis@collabora.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 .../pipewire/pipewire_git.bb                  | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/pipewire/pipewire_git.bb

diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
new file mode 100644
index 000000000000..bcb3015f8bdc
--- /dev/null
+++ b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
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
-- 
2.17.1


