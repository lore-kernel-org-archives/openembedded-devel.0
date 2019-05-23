Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 196077E416
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:18 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id d9so4903945wrx.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=huT0NmXuqb6qjlq9aSx2dTRuDZfm6rxbfkt+rW+OimA=;
	b=dLiX3TKmPHFhsbrIWIzdTJBox9oyc3Z47NSC1Mb0xQ5u0hpmRv8/x8KsNFg37av0HK
	QL1gHF0VCAhvvQHVrSaPikrVPi74A30QFZxL2637XP4dPzotYJOb4U385F3QTieCsdIw
	enjOYAvh4OG92PfwXPyLJkyA9xYg9mjJLrcaM3T9ivx09xt1avO0xzcl6zmygNH3o17d
	IVx4egEud9/Arx0WrbWu58yrwVMDugfYBuLo8n7nBw3cQDj0UVIZjqZoNDFtQTAe9Fia
	o+zUlXezGJganhoL37frBR3DIhZzAxGCbZI8j7i+zJPVLD4bdN2Pe1KNhCi8am4SWVRY
	NZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=huT0NmXuqb6qjlq9aSx2dTRuDZfm6rxbfkt+rW+OimA=;
	b=DER7eD0qz19QxFSb3r4mCCS1gr/p4mptEXBajEfl49W6UKatRDELFi/x8Cht6ZHdSi
	kAiaKDQpygya5P/9JCKF5WFSsi3yxlGdVV7pFhp/IpXaD0xIr4eRm6loU44i/svpPt5E
	uUEgD/crbZ4w1uqTCSl/UVcroy0wzpfT5L5kv2Ej+EnUhxvMAXlBAyX3s/qSvG60cayh
	c/VT8S41GYVodG8B0gTq9kzVbl7cewMU/w1psdSXQB5caxA/Zj+T8FY+FGMVXysz01Mg
	WPrciE1Sl4dWCMwjE3a2IuQMfthMtw/cKiSjgELvEts5zbwIQ/JxZcOtvtJpZArn7HYk
	b65w==
X-Gm-Message-State: APjAAAXB6/uV12opGqumBcQKMCuxqsOFKIkpcKITU8GPy37o3/GonYkb
	N06DRAzGoBV20Q77yxqlgbLAFNaB3Cw=
X-Google-Smtp-Source: APXvYqxZRUE1LuBnddvWw3Z+WOn1yVgh4lMjyeKjGOkuTLQZW/VoHd6sRW+6qw7VrV5ikchmpmSj5Q==
X-Received: by 2002:a5d:638a:: with SMTP id p10mr1653315wru.273.1558594159654; 
	Wed, 22 May 2019 23:49:19 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:31 +0200
Message-Id: <20190523064859.24336-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/41] gtksourceview4: upgrade 4.2.0 -> 4.3.1
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
X-List-Received-Date: Thu, 23 May 2019 06:49:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is an enhancement release [1].

* they moved to meson build
* translation is done by gettext only

[1] http://ftp.gnome.org/pub/gnome/sources/gtksourceview/4.3/gtksourceview-4.3.1.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...sourceview4_4.2.0.bb => gtksourceview4_4.3.1.bb} | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview4_4.2.0.bb => gtksourceview4_4.3.1.bb} (65%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.2.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.3.1.bb
similarity index 65%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.2.0.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.3.1.bb
index 10deaffb8..a81bfeeef 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.2.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.3.1.bb
@@ -10,12 +10,17 @@ PNAME = "gtksourceview"
 
 S = "${WORKDIR}/${PNAME}-${PV}"
 
-inherit gnomebase lib_package gettext distro_features_check gtk-doc gobject-introspection
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase lib_package gettext distro_features_check gtk-doc gobject-introspection vala
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/4.2/${PNAME}-${PV}.tar.xz"
-SRC_URI[md5sum] = "c9e6913c2fd30ca2fcdd71482faf8b99"
-SRC_URI[sha256sum] = "c431eb234dc83c7819e58f77dd2af973252c7750da1c9d125ddc94268f94f675"
+SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/4.3/${PNAME}-${PV}.tar.xz"
+SRC_URI[md5sum] = "53ecc9719807e5c95934e9a593565ef0"
+SRC_URI[sha256sum] = "b8ef118786f4e5c1ee20b986ac3914c60064a11acdee73645be3adb3543a2a5d"
+
+GIR_MESON_OPTION = 'gir'
+GTKDOC_MESON_OPTION = "gtk_doc"
 
 FILES_${PN} += "${datadir}/gtksourceview-4"
-- 
2.20.1


