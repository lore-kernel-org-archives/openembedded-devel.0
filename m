Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 006907E400
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:29 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t5so4513181wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Rh0FdASfOWQi+fXkNMus2Yo8bhw6BuK0yM7EoydV1vs=;
	b=CPLWhSjrtQUVBWtk3owH+kmpkXaqRA1C+fbWLPpQiDKPE278xyPRGYwGfJV7Eu696m
	5rPLVekRslXsoW4CTbo/mX35ViRjAREdxnwf0+7aCihx6VoE9fd21xNGcAhDb5KlXySZ
	JTK9ZIwn5DqEkjH6KAOakBVyViIcnR0mzTJ850qK7dTBEcuSMmT+yBxfvlkvz2k49Kct
	j6U2uVs/LsXiGDo7ZrpOQNbA6PMOrsK30cjMF6sF6ObReIQrJzT9YwSPkI21KJFVCSCx
	ffo+vNXoSAL9fIxqOEE8w9iwEbAbK/s8T0ywJx4UTOqDHtfp9+xACzWC+MZTPgK9g1hc
	TPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Rh0FdASfOWQi+fXkNMus2Yo8bhw6BuK0yM7EoydV1vs=;
	b=rbPOaPJxymvy8F1njW4Ow7yAO0g2LAceduhajzpGCKhRk/tiw2CXPZsWpET65BF+OX
	pQW/fOe8AX+aTvB3/fkyRlicDv1LwsumMQFDLfUO0H3fdU/A2OiArbOnCJNnc/jGCxs7
	zh78CETuBPg0nv7cpir0CynUqpMXrscJQ8c5AAXsv/xBIe7OrTJuQ8xMGRnWsuC2pICw
	aPstRhrKlGiErO4i15e+RfQjikxS5sgaJGQIUjV7sUruTCgWUrnohu7BTXKhh+p6Dvnj
	if0YwOmHePCyREjI9IajYZHIGBexw6Gh/YskTeGCRDjSVGs3UgvnQ9ChY0yJ9lu+N1FQ
	/NYg==
X-Gm-Message-State: APjAAAW+yeAJKvD1r7TKqici2kAZ7wVVOj3YzhkBpyWfJjPaHhQVW6SH
	eYDKAh0mDQUp0U2Aqc1BYPxYt/VrpZM=
X-Google-Smtp-Source: APXvYqxTXjVVhtJx9q00EjR4kaK+1bjpyHPUJSSeNFWR83DuHYGq83EWMpz/x/4Z/oLDsYvaYF+Qsw==
X-Received: by 2002:a1c:3d87:: with SMTP id k129mr10810350wma.21.1558594170603;
	Wed, 22 May 2019 23:49:30 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:44 +0200
Message-Id: <20190523064859.24336-27-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 26/41] gnome-desktop3: upgrade 3.32.0 -> 3.32.2
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
X-List-Received-Date: Thu, 23 May 2019 06:49:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While at it:

* inherit gnomebase instead of gnome because gnome adds unnecessary inherits
* remove itstool-native from DEPENDS
* make REQUIRED_DISTRO_FEATURES "x11" work

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ome-desktop3_3.32.0.bb => gnome-desktop3_3.32.2.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.32.0.bb => gnome-desktop3_3.32.2.bb} (69%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.2.bb
similarity index 69%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.2.bb
index 0acbb2117..03b415547 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.2.bb
@@ -8,24 +8,24 @@ BPN = "gnome-desktop"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnome pkgconfig upstream-version-is-even gobject-introspection distro_features_check
+inherit gnomebase pkgconfig upstream-version-is-even gobject-introspection distro_features_check
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "e423ed6d648c6c4f9798fa9cd9ea8d99"
-SRC_URI[archive.sha256sum] = "a6393dc5fc29fc0652ac84c73b3da205d0b0168128c4cf6d27797a08f3d07b54"
+SRC_URI[archive.md5sum] = "e9a32b755c20f1462f7c4321e32b30cb"
+SRC_URI[archive.sha256sum] = "099f71b29310c999c28f2bf272c846bbd7efc8c6c438b37d15f374230ce92d2e"
 
 SRC_URI += " \
     file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
     file://0001-meson.build-Disable-libseccomp-for-all-archs.patch \
 "
 
-DEPENDS += "itstool-native gsettings-desktop-schemas virtual/libx11 gtk+3 startup-notification xkeyboard-config iso-codes udev"
+DEPENDS += "gsettings-desktop-schemas virtual/libx11 gtk+3 startup-notification xkeyboard-config iso-codes udev"
 
 inherit distro_features_check gtk-doc
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES += "x11"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 EXTRA_OEMESON = "-Ddesktop_docs=false"
-- 
2.20.1


