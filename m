Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 849157FA98
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:09 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id r141so7252286wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VgT7ys6VhUsqitZCt8Uo4oqlfsrHeQZGf4wsLm9Xxp4=;
	b=kbeGi7VUm5ApnEIR/bceSKGbZbo+ui9VgFwEEjohQVArLru8OjeQ02V6pOZH4mGI/B
	RNWpoJo2T/6GM83qIlhCIlt67BOahk+sxcpbUuPmIb4Lh5dcNqXfedmxO4o1OmdAZ/Ce
	A8Y9Uj85lR1S8AWyPCstoGYrmkGfqv2b3CU3reIbd4tCvaUgeKqVxn5VUOCZWHNXV8Hm
	uTJyc6sWcelRyeA0BbCwwFy0o+sYfcB9GAbpVIAupOs8UWN+/zBAkkd1Mb/ZzW8ldEyK
	NQCmts0OrH6/8LSm5qcAh4r7zmcs0IccA4IY3YMWOSe2z7rI6dHk+PjrT/xYTDn7m/E8
	Ec7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VgT7ys6VhUsqitZCt8Uo4oqlfsrHeQZGf4wsLm9Xxp4=;
	b=IauSlzYjbSDZQwkhp0qOx33efaa2m871PuE2zy45cU34Ycs/IU83A43oY8Donmc7lZ
	axTJaglSvvEADw6U7mFcl5FXNQsUNxYkp8QL8CktxtQkDxZNZ12/gVeTjlW3YQBhF990
	h/Bx/BXIKbOa5d/U1FdzB8Z/EzX8rbCLP4o18W2Cxz28CPYiUjMYKSuXHIX8Ka0Gz9lr
	QEUUcu2EPF420SuXaC/7VS2my8wFFvpOBHatBBu3W4bPI4yR8h3hLEQ9hM1Sj0r6aWZk
	2iPMKrPtnqGVaHCVZg6kMRCtcqlOcuusY7E2HYqJnyUOkvSPocbB5U+Juyv+ObX92Cst
	ohdw==
X-Gm-Message-State: APjAAAW+f/aJLV1s3uradchHm3BnMQs5p39dkRnWFP+H/oTjifhKam+4
	aVhg8kR7he2E8jzoA/gBQjSSSgZB
X-Google-Smtp-Source: APXvYqxiNuQpoj4OIaRzlctUGuoc7as2pZD0Qv+tYQJ6ve4Mum2F5I0AecOWOF3FCai9wyTyrMeZTw==
X-Received: by 2002:a7b:cb43:: with SMTP id v3mr3508801wmj.137.1572219370033; 
	Sun, 27 Oct 2019 16:36:10 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:38 +0100
Message-Id: <20191027233545.4146-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/19] gnome-menus3: upgrade 3.10.1 -> 3.32.0
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* No Changelog avalailable - they suggest to clone the repo :(
* they use gettext instead of intltool
* gconf is not required in DEPENDS - modern gnome does not use gconf anymore
* add upstream-version-is-even to inherit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-menus/gnome-menus3_3.10.1.bb        | 21 -------------------
 .../gnome-menus/gnome-menus3_3.32.0.bb        | 18 ++++++++++++++++
 2 files changed, 18 insertions(+), 21 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
deleted file mode 100644
index 647ae914f..000000000
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "GNOME menus"
-SECTION = "x11/gnome"
-LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-DEPENDS = "python libxml2 gconf popt gtk+3 intltool-native gnome-common-native"
-
-inherit distro_features_check gnomebase pkgconfig python-dir pythonnative gobject-introspection
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-BPN = "gnome-menus"
-
-SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BPN}-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "6db025e79e2b69f39fc7aa0753f43081"
-SRC_URI[sha256sum] = "46950aba274c1ad58234374fa9b235258650737307f3bc396af48eb983668a71"
-
-FILES_${PN} += "${datadir}/desktop-directories/"
diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb
new file mode 100644
index 000000000..b6d212a27
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "GNOME menus"
+SECTION = "x11/gnome"
+LICENSE = "GPLv2 & LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+
+DEPENDS = "python libxml2 popt gtk+3 gnome-common-native"
+
+inherit distro_features_check gnomebase gettext pkgconfig gobject-introspection upstream-version-is-even
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+BPN = "gnome-menus"
+
+SRC_URI[archive.md5sum] = "4262208c13f266d9ada7d356aada9e1b"
+SRC_URI[archive.sha256sum] = "c850c64b2074265fe59e099a340b8689cf3dd4658dc9feddd2ab5e95f1a74b74"
+
+FILES_${PN} += "${datadir}/desktop-directories/"
-- 
2.21.0


