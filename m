Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id E9F4D774EA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 May 2017 19:18:48 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id o3so17116823pgn.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 May 2017 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CCfNDFM/APHvwf76o5q58GyE+lseShkp9STBETqvCFM=;
	b=YP5885Bf3pcA/cvUX2UjOGvxuYBN09L30QxWL/sv/f1hB5mXgGXhmTWbrKw50XqElW
	mdGT9F3ydCD4I2gu2ZxcyqT+FrOYR+vHqMHXOPe0bdL1xxZLrRhBBKI4nBrLqJvRORsS
	nYI7oX25/n9S5jbaYCHMbEjy2k4B/wNt0VCdgFfHtEfXj8tc1rsX2ENjKO3auAwcfaZt
	nUU2zL1Apo1GkqoYi4ckJstlbBydvncttdIDeShffK26oPNJGtzTa0t2g3Rha9SyvbVI
	rqAQI3Wk/NayM1zqT8rVqyXaJEEJur605odB33wnAVOxNfdM1zu4oK8AZLKk6pU+Wq6L
	MSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CCfNDFM/APHvwf76o5q58GyE+lseShkp9STBETqvCFM=;
	b=HgFGiiuYsEEVgZuw44Up3MUgJjgK3Ga1OR8pYYNQBVLv9Sfek332G01HhP6KHjUaHO
	0OWw2KkyFgNrBRI8bC4npxDzOGbF90OU+9/aW5GCM+xByF59wcX4Z4O7gW4Z0YDcsAwb
	EpYL9c9smcWuApqeRsZhd1CCST4+Wkq+kbXTqTmsK24MX9S1wDByN77+XU56GxKUMkyW
	o4AbTUftZQQuT9KkGsoRiktjPGRZ1cer92FL/+sxgTfPucoIGS0K86NNHQTT2wGJTQQu
	0bW0eBUq5GEozSkanym4CHPwlBM13MCFHtJH0kIeF8Q9WRzdvvgwsfL74WPofL4KtybU
	6ftg==
X-Gm-Message-State: AN3rC/4RiFqI1CCzYHM1ayGE7JCgxilT2n8YD3BClbMEffi2A32UmXjY
	w+uReNBZLYHICWrZ
X-Received: by 10.84.241.206 with SMTP id t14mr16847514plm.48.1494098329562;
	Sat, 06 May 2017 12:18:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8882:b8c::d586])
	by smtp.gmail.com with ESMTPSA id
	p62sm14237888pfp.48.2017.05.06.12.18.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 May 2017 12:18:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 May 2017 12:18:38 -0700
Message-Id: <20170506191840.26070-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170506191840.26070-1-raj.khem@gmail.com>
References: <20170506191840.26070-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/4] rygel: Update to 0.34.0
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
X-List-Received-Date: Sat, 06 May 2017 19:18:49 -0000

Fix build without X
Licence is more consistent now see

https://github.com/GNOME/rygel/commit/cdcb6bd55efd0c3b7a2fd4ae5c3d8556f69f8402

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rygel/{rygel_0.28.2.bb => rygel_0.34.0.bb}          | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.28.2.bb => rygel_0.34.0.bb} (80%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
similarity index 80%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
index 38fac65d5..798ecea9d 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
@@ -5,26 +5,27 @@ Additionally, media player software may use Rygel to become a MediaRenderer \
 that may be controlled remotely by a UPnP or DLNA Controller."
 HOMEPAGE = "http://live.gnome.org/Rygel"
 
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
-                    file://src/rygel/rygel-main.vala;endline=27;md5=99324118da4c012d25edae2f779ae9b3"
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0 libunistring sqlite3 intltool-native"
 RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
 RRECOMMENDS_${PN} = "rygel-plugin-media-export"
 
 GNOME_COMPRESS_TYPE = "xz"
-SRC_URI[archive.md5sum] = "9fbe4fb53b6cfa2f3f3723b7649a2215"
-SRC_URI[archive.sha256sum] = "9ea23df7186caac5f1aad3137edf6d507d339b9a469fc3133df4043fa66b61f5"
+SRC_URI[archive.md5sum] = "7d8923324b280cd5452803d61176a34a"
+SRC_URI[archive.sha256sum] = "fbb2d46cbe4e750df6610b4c66b2278f06d1f71a257c7903e676ccb394dad418"
 
-inherit gnomebase vala gobject-introspection
+inherit gnomebase vala gobject-introspection gettext
 
 EXTRA_OECONF = "--disable-tracker-plugin --with-media-engine=gstreamer"
 
-PACKAGECONFIG ?= "external mpris mediathek ruih media-export gst-launch gtk+3"
+PACKAGECONFIG ?= "external mpris ruih media-export gst-launch"
+
+PACKAGECONFIG_append = "${@bb.utils.contains("DISTRO_FEATURES", "x11", " gtk+3", "", d)}"
+
 PACKAGECONFIG[external] = "--enable-external-plugin,--disable-external-plugin"
 PACKAGECONFIG[mpris] = "--enable-mpris-plugin,--disable-mpris-plugin"
-PACKAGECONFIG[mediathek] = "--enable-mediathek-plugin,--disable-mediathek-plugin"
 PACKAGECONFIG[ruih] = "--enable-ruih-plugin,--disable-ruih-plugin"
 PACKAGECONFIG[media-export] = "--enable-media-export-plugin,--disable-media-export-plugin"
 PACKAGECONFIG[gst-launch] = "--enable-gst-launch-plugin,--disable-gst-launch-plugin"
-- 
2.12.2


