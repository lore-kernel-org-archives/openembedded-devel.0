Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 78BA17D485
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 08:30:02 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id h11so14037440wmb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jM6Hdl31/1OUhKbPx/9ZtzeB7/cNpLDfSzQXGhPOWIw=;
	b=HPlXm9N7znTjCmhzn+kHnuQL73ZIirhljGWkaUC1WAyThex9t7kbj7kAO6UVIU5oqL
	3kS+dbD1chzkR/3E9VTdQO5sokzFIos0O7aBUAGBEO1REEDZ8VCQhTMTUzivHaIMRaI5
	Pfe/XEVRcJZ+e9puNFRn36EJTexBosrKYPjisNNyHR7PHmGkXfIn7uoml2MlkIqHmMKX
	G737f8DAZw48Qp/s/Vcfiv3eXFXEaKyu6rIg+bgjoGpUX8SqpoVLzHUIGQ6svf/mPoVH
	drFLmkQ331bhBcUL5vZ0kjgONeOjjs/2PzSiePqdvjtdncs2RE+nAFZFxo7PpFrj/ept
	T03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jM6Hdl31/1OUhKbPx/9ZtzeB7/cNpLDfSzQXGhPOWIw=;
	b=AG0AX/rwf8nACtinqWwDfuRk20F0oklR+VCeBj17DIu9Ws1G8mhETwXv+7A56TrORc
	mSzNGw7HaACZojRjDbmKuBmcqikIlgt7nHH44QaxhtOJxHYCpWQngLvXFqSMylm8Px3U
	vxtv7QnEiTPnXiHkpDskZ5o6vc9vqVzOskns6lz23WUcEGp7iDnbiNPAv3seWSZ4C4UL
	YuArXQCqoWgSRFymYJSMzc4vVvyqq48d3AhNuiBB4V0dRVm+mYaWK+/lrOSOa6AMBpWD
	OeBfDFDs2OwVljiRpuXOISJJzvHMi9dSwnCqqRll2lsHCjRK+2vhq8BxuwtJ61l8TEUA
	owmA==
X-Gm-Message-State: APjAAAXu53qFbji4IB2yuvvCp6OdvZ+ushHzm29xxuEB6Ygx70YNew44
	K47S81GZfCoQBlvBtYxt2v9yS0gM
X-Google-Smtp-Source: APXvYqyhfsQXtEdY4c0HEQtS/ir8AuEOlunEioTbesCfd209OvpJO5seo3x6aKmnbOewZP33eYN8mg==
X-Received: by 2002:a1c:b3d7:: with SMTP id c206mr5040888wmf.77.1557131402932; 
	Mon, 06 May 2019 01:30:02 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	a22sm7526235wmb.47.2019.05.06.01.30.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 01:30:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 10:29:41 +0200
Message-Id: <20190506082948.22276-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/8] gtksourceview4: initial add 4.2.0
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
X-List-Received-Date: Mon, 06 May 2019 08:30:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gedit 3.x will depend on it

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gtksourceview/gtksourceview4_4.2.0.bb     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.2.0.bb

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.2.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.2.0.bb
new file mode 100644
index 000000000..10deaffb8
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.2.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Portable C library for multiline text editing"
+HOMEPAGE = "http://projects.gnome.org/gtksourceview/"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+DEPENDS = "gtk+3 libxml2 intltool-native gnome-common-native glib-2.0-native"
+
+PNAME = "gtksourceview"
+
+S = "${WORKDIR}/${PNAME}-${PV}"
+
+inherit gnomebase lib_package gettext distro_features_check gtk-doc gobject-introspection
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/4.2/${PNAME}-${PV}.tar.xz"
+SRC_URI[md5sum] = "c9e6913c2fd30ca2fcdd71482faf8b99"
+SRC_URI[sha256sum] = "c431eb234dc83c7819e58f77dd2af973252c7750da1c9d125ddc94268f94f675"
+
+FILES_${PN} += "${datadir}/gtksourceview-4"
-- 
2.20.1


