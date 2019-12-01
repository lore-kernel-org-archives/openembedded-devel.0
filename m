Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id DEC487C85D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 16:51:34 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t14so2831548wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 08:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=rgbLRQeb+xM38G0Ll5A9MKjp3HcIW8wvFqg7pWOJFGI=;
	b=I1a9VeglevJSRyRo7wYT6N8xoHTDvvuOE4H67E6e7KzuX5a6//KqbHqv/iT2EE24sC
	LRo3x2SVTf8ilpB1fxeKzXwPPpXMOZIPf0uwj7C2qfNdWb7qTbMSMxagKjzo7nMv8XpW
	Aoz3YMcwEeQBjn7pl192gi+6dBz6rn8PQU8mkkzVQs/Jz4o8zsF6ekiGHibXsmWE9JZJ
	lXYWRKL1tUp1vl1mS2vH8p2WpX95SWU++3UrsCVFu/837tMmYfk1fQYl82DAfAOv/OPO
	Vr6EiQ1C51ejhUMZi2cCGBL0gWm7MbLQkrhK7IXo+eB6czCYOy+XIdlLgWX9cAUWSWfN
	WE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rgbLRQeb+xM38G0Ll5A9MKjp3HcIW8wvFqg7pWOJFGI=;
	b=W8Ed2cIFs3u62ZM7n9lYKX0Esho6iqvKD4T5k8D+uU9EXgWxe6/o7SyxXYM7OU5hq5
	Rd+PUvvxDJZDRcDUxQ5zVtdHf2J/h/tykVip6dBdUnCAyiHFU+bzW58ibPSShoB9/816
	M1WSPKgCH6sH3RK2L4OTt9mOwvvV8gtq99xGWplQOMkewAOpa0mXoPs12m0Ia/7gN2Z4
	LE9gq1fr0Pc7Q0II7Lkjbq28y5qX4UvTBI46fFK6Be+CFTZNPBW0z4Q+u/ZzF1gykl6r
	ikW1+jUgwL7nhXL0VQexhVcxiQvkiEhWQ1bwS2pl5PTmn4yRHcH52msEhk84w6rPE7HR
	Carw==
X-Gm-Message-State: APjAAAWt4oRmRC6WVjWuMmkC5c8MDfwJTM21PEUL5RmAyG+ik2T/ATR9
	6cUnb9cy/aWw8lYmxTH7BiAf0Qzk
X-Google-Smtp-Source: APXvYqzr9dFUck8I+3qibxHnPSSTFPV2mEDaxxkqwSPOAEsyLQVV0mFD5qi3geqFpvm3+Wf/Zd9yGA==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr25002426wmh.81.1575219095345; 
	Sun, 01 Dec 2019 08:51:35 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CDB845ACDC091B17366D2.dip0.t-ipconnect.de.
	[2003:f0:7f3c:db84:5acd:c091:b173:66d2])
	by smtp.gmail.com with ESMTPSA id g7sm6228088wrq.21.2019.12.01.08.51.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 08:51:34 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 17:51:19 +0100
Message-Id: <20191201165123.12699-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191201165123.12699-1-schnitzeltony@gmail.com>
References: <20191201165123.12699-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] tracker-miners: initial add 2.3.1
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
X-List-Received-Date: Sun, 01 Dec 2019 16:51:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tracker-miners is a mandatory runtime-dependency for nautilus

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-warn-if-we-build-without-libseccomp.patch | 37 ++++++++++
 .../tracker/tracker-miners_2.3.1.bb           | 68 +++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/tracker/tracker-miners/0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch
 create mode 100644 meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch
new file mode 100644
index 000000000..c9eb7994e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch
@@ -0,0 +1,37 @@
+From 54ea2cabf85ad1bd5695cdbd1935115c9495e80c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sun, 1 Dec 2019 17:06:59 +0100
+Subject: [PATCH] meson.build: Just warn if we build without libseccomp
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+libseccomp lives in meta-security currently and we cannot make it a mandatory
+dependency. Once somebody moves libseccomp to meta-oe and adjusts all the
+target specific knobs this patch can go. For discussion see [1].
+
+[1] http://lists.openembedded.org/pipermail/openembedded-devel/2019-November/203234.html
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 71a9df4..1eaa1a0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -279,7 +279,7 @@ cpu_supports_seccomp = not unsupported_cpus.contains(host_cpu)
+ seccomp_required = system_supports_seccomp and cpu_supports_seccomp
+ 
+ if not libseccomp.found() and seccomp_required
+-  error('Libseccomp is mandatory for sandboxed metadata extraction')
++  warning('Building without Libseccomp might cause security issues!')
+ endif
+ 
+ ####################################################################
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb
new file mode 100644
index 000000000..3dbbcafbd
--- /dev/null
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb
@@ -0,0 +1,68 @@
+SUMMARY = "Tracker miners and metadata extractors"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+    file://COPYING.GPL;md5=ee31012bf90e7b8c108c69f197f3e3a4 \
+    file://COPYING.LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+"
+
+DEPENDS = " \
+    intltool-native \
+    tracker \
+    zlib \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check
+
+SRC_URI[archive.md5sum] = "0321d8f4ad27e3fccdbc8384e5b3cb83"
+SRC_URI[archive.sha256sum] = "7b1de06a7a79ea1c7813c8a21f8cd1c55f2b95f799cf9f47f0204f3be8a590e0"
+SRC_URI += "file://0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
+
+PACKAGECONFIG ??= " \
+    ffmpeg \
+    flac \
+    gexiv2 \
+    gstreamer \
+    icu \
+    libexif \
+    libgsf \
+    jpeg \
+    png \
+    tiff \
+    xml \
+    pdf \
+"
+
+PACKAGECONFIG[ffmpeg]     = ",,ffmpeg"
+PACKAGECONFIG[flac]       = "-Dflac=enabled,-Dflac=disabled,flac"
+PACKAGECONFIG[gexiv2]     = ",,gexiv2"
+PACKAGECONFIG[gstreamer]  = ",,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[gupnp]      = ",,gupnp-dlna"
+PACKAGECONFIG[icu]        = ",,icu"
+PACKAGECONFIG[libexif]    = "-Dexif=enabled,-Dexif=disabled,libexif"
+PACKAGECONFIG[libgsf]     = "-Dgsf=enabled,-Dgsf=disabled,libgsf"
+PACKAGECONFIG[jpeg]       = "-Djpeg=enabled,-Djpeg=disabled,jpeg"
+PACKAGECONFIG[png]        = "-Dpng=enabled,-Dpng=disabled,libpng"
+PACKAGECONFIG[tiff]       = "-Dtiff=enabled,-Dtiff=disabled,tiff"
+PACKAGECONFIG[xml]        = "-Dxml=enabled,-Dxml=disabled,libxml2"
+PACKAGECONFIG[vorbis]     = "-Dvorbis=enabled,-Dvorbis=disabled,libvorbis"
+PACKAGECONFIG[pdf]        = "-Dpdf=enabled,-Dpdf=disabled,poppler"
+PACKAGECONFIG[upower]     = ",,upower"
+
+# For security reasons it is strongly recommended to set add meta-security in
+# your layers and 'libseccomp' to PACKAGECONFIG".
+PACKAGECONFIG[libseccomp] = ",,libseccomp"
+# not yet in meta-gnome
+PACKAGECONFIG[rss]        = "-Dminer_rss=true,-Dminer_rss=false,libgrss"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/tracker \
+    ${libdir}/tracker-miners-2.0 \
+    ${systemd_user_unitdir} \
+"
-- 
2.21.0


