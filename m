Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 886037FAB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:10 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id t14so12979243wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZBV0wl4egDu4jku/DVcHkm4vMVVcg3DZhjL5/2LqW6U=;
	b=CH2Mu2RM4/q6zIKyGxj29f3Bmh777e1AH9ptf17A+/dd+bgh3OLTVhnZYNIInkxCos
	D3GqElStoNSUdhybIySCta9V5NZ7URA7smlKdXE5pst7L5L2A686FfbQGfBYGRNYomMP
	cJ6JcYvB8H1Tlrl8NnMNI1Qir1MlQ3ZvPLEmZMfUUFkLqKDNpLodbh87/9QKZyb6Vsp4
	O3JJZt3oV/j1tenj0G8Sf2a/lfR6EA2Z0yOPtYixbETkjBzPAzutsYTbw0lMyDcez+Bz
	8h/ZmlKrrfmnXYdTviXLwEfhbAQijTOecIwgkndzTZbdP+eEwB8TvmDXAbUJRPlkqqRu
	lWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZBV0wl4egDu4jku/DVcHkm4vMVVcg3DZhjL5/2LqW6U=;
	b=Chs2fdAB5wCxqpOG8IxrgVSmWaCWXMZQwDG/48vT8/1I8YPFQICgyiV4CDl0xL90vu
	tj/UrsGGnwBK0A4dpZBn8qvrgSGqEQQ0g+v63BaACYtLcAco+I5mXHvqTvcR/G87f4/3
	TuDRrdkTeIBRtdGXKvWk6F6TD74eOc3fjpgAfjzYAVuxIaMcngnmxUxc6OhJ1QVplEVN
	DAs3kr8iWk/h2X0IP017pRMMaQB0710Pov+KoXUAKYk/Q9yr0wG0BFz6eSYY88VeL+nR
	ZsNT3kXL83Ge3FFPU9bK2tiTGPL924wqOgJ+etlFMU03E8AhW/bsGZBX3/hpq9axFdPL
	jh4g==
X-Gm-Message-State: APjAAAUggphc/5yaST/VJ2glP7YxgoLip+gk+8bepYdwuMAmF01OMmTe
	68XRABLbz3Ej3kCF0RbrjUA+l4tz
X-Google-Smtp-Source: APXvYqzipZ/tfA68SW5ikLRT6h8okI2EpQteEQ8VQCZIOuhOVlJv1OgWWYrhusYXYicKx/KxlSlzEA==
X-Received: by 2002:a1c:9c08:: with SMTP id f8mr10210827wme.171.1575851950973; 
	Sun, 08 Dec 2019 16:39:10 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:10 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:29 +0100
Message-Id: <20191209003840.3383-19-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 18/29] metacity: upgrade 3.32.0 -> 3.34.1
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is more or less a recipe-rewrite:

* get sources from GNOME
* cleanup DEPENDS
* give up tailored configure
* make xinerama a PACKAGECONFIG

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{metacity_3.32.0.bb => metacity_3.34.1.bb} | 41 +++++++++----------
 1 file changed, 19 insertions(+), 22 deletions(-)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.32.0.bb => metacity_3.34.1.bb} (44%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.34.1.bb
similarity index 44%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.34.1.bb
index 8f15c5774..d8c8b5389 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.34.1.bb
@@ -6,36 +6,33 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b4cce53560b8e619ffa7c830fb8761aa \
 
 PE = "1"
 
-DEPENDS = "gsettings-desktop-schemas startup-notification \
-           gnome-doc-utils gdk-pixbuf-native \
-           gtk+3 glib-2.0 libcanberra libgtop intltool-native"
+DEPENDS = " \
+    gdk-pixbuf-native \
+    gtk+3 \
+    gsettings-desktop-schemas \
+    startup-notification \
+    libcanberra \
+    libgtop \
+"
+
 
-inherit autotools gettext gnomebase features_check
 # depends on startup-notification which depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "git://github.com/GNOME/metacity.git;branch=master \
-           file://0001-drop-zenity-detection.patch \
-"
-
-S = "${WORKDIR}/git"
-SRCREV = "bf1bfbadf47eff97703df17e95b15168e2034222"
+inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
-EXTRA_OECONF += "--disable-xinerama"
-
-PACKAGECONFIG ?= ""
+SRC_URI[archive.md5sum] = "c0c10204e4d6d024cb413042c1de316b"
+SRC_URI[archive.sha256sum] = "31c7d1045c390afb3bf405735b0b26c459197cbf43af37c469eb8918ce3a453d"
+SRC_URI += "file://0001-drop-zenity-detection.patch"
 
+PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
 # enable as neccessary until new warnings are dealt with
 PACKAGECONFIG[werror] = "--enable-Werror,--disable-Werror,,"
 
-do_configure_prepend() {
-    cd ${S}
-    aclocal --install || exit 1
-    autoreconf --verbose --force --install -Wno-portability || exit 1
-    cd -
-
-}
+FILES_${PN} += " \
+    ${datadir}/themes \
+    ${datadir}/gnome-control-center \
+    ${datadir}/gnome\
+"
 
-FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center ${datadir}/gnome"
 RDEPENDS_${PN} += "gsettings-desktop-schemas"
-
-- 
2.21.0


