Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id C05DB7FA02
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:53 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id l17so7044582wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6yR2NsDIzLBtq5GYcCgjjQusU9QvC/g9MkPw4IeeFz4=;
	b=h/rnYS4tm/HVTVD9+HRf8KMp6TPQgtBLEwcKxk1oA3mByXdSAHLluATSkrjsuWg2WD
	Ah6IoWxpHLLWm0MHHb1EJa1vghoCwmVQtGPuI0g7alrsVGvAXJ/t1nuC1edB/Xycupag
	dLraaX/dpyKkLy918AnSaCtB57PHFijSs/iPTHF8E0mEdGiEUxIl2ZbZv07AT6S25QSU
	KvqOLuIZbbA9ZHuVTyr+a4tqwzeFqGKrHdoBbYf5RoxGtLcnkBT0MK2oCTcQTVFFEhNO
	wRiKDk/+Q32lPGjR2ecmg1XqUE/yA8G70gVPpKlQ2y4UtOwYmR2WUJS1x326RnNRLf0Y
	J5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6yR2NsDIzLBtq5GYcCgjjQusU9QvC/g9MkPw4IeeFz4=;
	b=t9feH9E7uhnrnTbmygZOU33r4HProR1piWZVkb2rcEipJh28wzlnq7+DhJPpQVwUA5
	/BczXELALn6pSCAm0tQziM/IuuLdZfHBIvh48SyYAzBTf9pt2FTVkStWDvX44OlUay1C
	2m/xwcxIGLizfNGzcXVqvbDNmJgvkZceYOFgAJPO/B45hwWwTXdDDgVhJq1zB8/9y1gq
	TUlqBsvXh5P98pXWMOSgMCARsQMvb9fRCJ9QqvI6lZwy/Htk+6IEjUIx22ZyasNTiNbq
	UgOkNcKQf3PnhpoYs2izbdinbhNsCBuGnPcWYRE1WnvfuM3z+jbkLbsyrAFyyyEiHIkl
	bL4w==
X-Gm-Message-State: APjAAAVhPkhEwBl96oZADKah8H/fU+85yGCvm0OrHg9GgqCWP7gVq1oX
	gCfnA6VzC12OHO/V+TRYEpA00Uco
X-Google-Smtp-Source: APXvYqx6CV/yuxEL1iTDVEir+bm/zOXo+kRU0/TOEUWcQjoI9pWp1wNP9Q+nMUnEPw/4Fork5qXizw==
X-Received: by 2002:a1c:e40b:: with SMTP id b11mr9764068wmh.152.1573760994354; 
	Thu, 14 Nov 2019 11:49:54 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:30 +0100
Message-Id: <20191114194930.2786-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/16] gnome-settings-daemon: initial add 3.34.1
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a dependency for upcoming mutter

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-settings-daemon_3.34.1.bb           | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.1.bb
new file mode 100644
index 000000000..d6af7a72e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.1.bb
@@ -0,0 +1,59 @@
+SUMMARY = "Window navigation construction toolkit"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gobject-introspection gettext distro_features_check upstream-version-is-even
+
+SRC_URI[archive.md5sum] = "528b0b7cc2dd22c6026a9c8739c71fa7"
+SRC_URI[archive.sha256sum] = "7ce4979817866911a94ecb75b36db56797e038c0c524c5c1a81aefccafc17337"
+
+DEPENDS = " \
+    colord \
+    geocode-glib \
+    gcr \
+    gnome-desktop3 \
+    libgweather \
+    lcms \
+    libcanberra \
+    geoclue \
+    libnotify \
+    upower \
+    libwacom \
+    virtual/libx11 \
+"
+
+# all these are mandatory
+REQUIRED_DISTRO_FEATURES = "x11 polkit pulseaudio systemd gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
+
+SRC_URI[archive.md5sum] = "cdd0d0c8664056deb78aa40c88ec24d1"
+SRC_URI[archive.sha256sum] = "9981a20babf8da7744b7fbe175b9e36078bf08f3bf65fe5aedeb82cfe27ac11f"
+
+# allow cross build mixed with build of native tools
+do_write_config_append() {
+    cat >${WORKDIR}/meson.native <<EOF
+[binaries]
+pkgconfig = 'pkg-config-native'
+EOF
+}
+EXTRA_OEMESON = "--native-file ${WORKDIR}/meson.native"
+
+PACKAGECONFIG ??= " \
+    cups nm \
+    alsa gudev \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
+"
+PACKAGECONFIG[alsa] = "-Dalsa=true,-Dalsa=false,alsa-lib"
+PACKAGECONFIG[cups] = "-Dcups=true,-Dcups=false,cups"
+PACKAGECONFIG[gudev] = "-Dgudev=true,-Dgudev=false,libgudev"
+PACKAGECONFIG[nm] = "-Dnetwork_manager=true,-Dnetwork_manager=false,networkmanager"
+PACKAGECONFIG[wayland] = "-Dwayland=true,-Dwayland=false,wayland"
+
+FILES_${PN} += " \
+    ${systemd_user_unitdir} \
+    ${libdir}/gnome-settings-daemon-3.0/libgsd.so \
+"
+
+RDEPEND_${PN} += "gdbus"
-- 
2.21.0


