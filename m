Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id B6D0D7C127
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 21:31:36 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b85so8565375pfc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 13:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hBbFo4gTLdIQIV74jjJqTqunBBW2WbcK/zVGDjBymlQ=;
	b=mj64V6tqmHVQC2KPnAJS8hF+r6qmj7cL2ZAk/i5khY2WxdeyiA73/sEcMLaF7YGYBy
	i4DZO/idp8vsD1MJHR41hhKWcDUMpx7tJJpRB3VC6EFjQv5KlE6drJ8I0WixijQvE8ai
	MXwZ4YzrN/rQQRAw3vmQI1873RaI1b/07XvqeXTYvSQbuUZqgezpu526urGowegGo7BT
	lFklutB5d3CVtgKXyiHMXXTWEX61akiu6w+RfSksHPxTAvOUQ6IiPYTIUXD8x/p4GyrS
	7Fns9H4+ISF3TMGgpbb+EjsC4Zya4izKPg2ewsXMUXyMbTbfMnqwCOIFFhrT4KOGlYjv
	yFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hBbFo4gTLdIQIV74jjJqTqunBBW2WbcK/zVGDjBymlQ=;
	b=d6NnE63+dZnoFOIVWk0dZIvBU5+vO6n99K+uo3f+LYuwQiFns1WnrwGs5jvWGntJCC
	hPWJQM3IpKzrHmHq4Ixrhdn57VFJPz2p9VrGHVnmNwcC149Hm1qfsyPxKXPfVroV3UVt
	h3DQ/XiCclqv+lJ5PL36KJNRuEjCOu6Yhe/fI+Jw5Qv4s07OJ2vZCL5GI3VGSHMzvuBE
	0jQTSrDTc/aG4+IneCpjjYq0thGtMyVCoS0rGuaUmpt6P/XQ9eIahvKdc9qLnT7ZkeJP
	BFjClWIfSR70UzugY3oFZRpDQqGNh1FFQohLrW0wBWHX6bv1CiantCFoLcHnC1wu5MBB
	nbVQ==
X-Gm-Message-State: AJcUukdXkLrcLTSGHpja91pGmjcM6ZgC5aTKmfFNyOYw7KXTFGiy39L6
	LPbRCPWh3R1nyj7h66fCbyxi9l/c
X-Google-Smtp-Source: ALg8bN6BnV6gcuMtE8u8EOHlPkgdAvRcjMDp52rFkzi7UsHLJjk74cTJBoVFBP0106kcVx9Z9zvMCw==
X-Received: by 2002:a62:7792:: with SMTP id s140mr19666150pfc.26.1547328697870;
	Sat, 12 Jan 2019 13:31:37 -0800 (PST)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	4sm134935166pfq.10.2019.01.12.13.31.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 13:31:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 12 Jan 2019 13:31:28 -0800
Message-Id: <20190112213132.2501-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190112213132.2501-1-akuster808@gmail.com>
References: <20190112213132.2501-1-akuster808@gmail.com>
Subject: [PATCH 5/9] meta-multimedia: add pgk group and images
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
X-List-Received-Date: Sat, 12 Jan 2019 21:31:36 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../images/meta-multimedia-image-base.bb      |  7 +++
 .../images/meta-multimedia-image.bb           |  3 ++
 .../packagegroup-meta-multimedia.bb           | 53 +++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/images/meta-multimedia-image-base.bb
 create mode 100644 meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb
 create mode 100644 meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb

diff --git a/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-base.bb b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-base.bb
new file mode 100644
index 0000000000..249f989a4b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-base.bb
@@ -0,0 +1,7 @@
+SUMMARY = "meta-multimedia build test image"
+
+IMAGE_INSTALL = "packagegroup-core-boot"
+
+LICENSE = "MIT"
+
+inherit core-image
diff --git a/meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb
new file mode 100644
index 0000000000..9f2fda9fef
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb
@@ -0,0 +1,3 @@
+require  meta-multimedia-image-base.bb
+
+IMAGE_INSTALL += "packagegroup-meta-multimedia"
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
new file mode 100644
index 0000000000..1251ac0a09
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -0,0 +1,53 @@
+SUMMARY = "Meta-multimedia packagegroups"
+
+inherit packagegroup
+
+PROVIDES = "${PACKAGES}"
+PACKAGES = ' \
+    packagegroup-meta-multimedia \
+    packagegroup-meta-multimedia-connectivity \
+    packagegroup-meta-multimedia-dvb \
+    packagegroup-meta-multimedia-mkv \
+    packagegroup-meta-multimedia-support \
+'
+
+RDEPENDS_packagegroup-meta-multimedia = "\
+    packagegroup-meta-multimedia \
+    packagegroup-meta-multimedia-connectivity \
+    packagegroup-meta-multimedia-dvb \
+    packagegroup-meta-multimedia-mkv \
+    packagegroup-meta-multimedia-support \
+"
+
+RDEPENDS_packagegroup-meta-multimedia = "\
+    libdvbpsi libdc1394 gstd gst-shark \
+    bigbuckbunny-720p tearsofsteel-1080p bigbuckbunny-1080p bigbuckbunny-480p \
+    openal-soft dleyna-core dleyna-renderer dleyna-server dleyna-connector-dbus \
+    gst-meta-base gstreamer gst-plugins-base gst-plugins-good \
+    gst-rtsp gst-plugins-bad alsa-equal libdvdnav libmusicbrainz tinyalsa \
+    fluidsynth cdparanoia vorbis-tools tremor caps libao libavc1394 \
+    opusfile gerbera libdvdcss webrtc-audio-processing \
+    rtmpdump libopenmpt schroedinger mpd mpc libmpdclient \
+    ncmpc libmpd libsquish dcadec libiec61883 \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "minidlna gst-fluendo-mpegdemux vlc", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "vo-aacenc sox libde265 gst-openmax", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "streamripper gst-plugins-ugly gst-fluendo-mp3 gst-plugins-gl", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "openh264 opencore-amr faac vo-amrwbenc", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-multimedia-connectivity = "\
+    rygel gupnp gupnp-igd gssdp gupnp-dlna gupnp-av libupnp \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gupnp-tools", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-multimedia-dvb = "\
+    oscam "
+
+RDEPENDS_packagegroup-meta-multimedia-mkv = "\
+    libmatroska libebml \
+    "
+
+RDEPENDS_packagegroup-meta-multimedia-support = "\
+    liboil libmediaart libmediaart-2.0 gst-instruments libsrtp crossguid \
+    "
-- 
2.17.1


