Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3B83674A45
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 22:03:19 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i3so19490027wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 15:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=cfRJ4BbZJxuxFRg32QmXnzQhMe4E/JnC9hlrdQrRIPc=;
	b=eGVEamlbyTnIOMWhtQlDFaLmcn9hec4ECy9eelkh3qyQiDA+ZW6IkNiQeEcj85ELu4
	i99d1NCD4Ey+L67Zz7jboDAFWTZh5s58fRw+FSRm4jzOAcONJ3dPruNKqQYVYGkeWXyG
	eklVgCF1KRWkDb9NgBwbvHlk0QABVq/1Z8aNijvillDa6lWL9ErLftrssMIIRPP65sIp
	z+/5fQiIdMYiRPW6g91cBX2UjVzjbRfHeoh69VlwOO5pShTvc3i6iiWEwOfJ6947IuxR
	1/Yr76WjtFca64zXYUTjJU9+HTTxwgjCWvYq8VToOAABQLPjGRbN9wbtUaRUlbVFuAWT
	s2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cfRJ4BbZJxuxFRg32QmXnzQhMe4E/JnC9hlrdQrRIPc=;
	b=PugIjfjrPlN5qbCt/GZbvlnpznii4hKjV7KXCMd6bNMOC553/ilxTVyEAxSE5CVWbv
	uKgYbK4Imu0py6NCeyP1eGxNK5OdD1npiE8je65Fkvmt/36YAbImmT1YMFdbg3KJwlhV
	1NOLhEQHB6X2S02DF0GchiMx68AWhQtS4xt5jEDCrLf1y6drZ4P1c5PJKR4cKGNfmH30
	QatXu2BrqXFZ0IT5jFzsU8NmsA9yuXKiTny4gwvn0mGXaQdeic6Z3bQINSeSifN+ul/m
	VMAnltiMF+R4KuRdO6uxdOAMpwpB8LT80RsmbGumOS2VQxNGw7aj0fFKZCD6aaDpr9aD
	vgZg==
X-Gm-Message-State: ALQs6tByDCvY8fy+0IKnIWWGwGtY3YS9UUfHz/yV1WHD4unqvVcptR5p
	jqw2XTtsz/BQEH2f+sijZmoZwA==
X-Google-Smtp-Source: AIpwx497BYSGPGI2LgMcf7KDY7ujIwX5nUMOGk9eAxi2llcvK/mFcPCgJsL7140XUYWbZen5qnhJpQ==
X-Received: by 10.28.236.76 with SMTP id k73mr974245wmh.122.1523311399771;
	Mon, 09 Apr 2018 15:03:19 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC14F231E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:4f23:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g185sm650954wmf.40.2018.04.09.15.03.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Apr 2018 15:03:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2018 00:02:46 +0200
Message-Id: <20180409220249.11796-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180409220249.11796-1-schnitzeltony@gmail.com>
References: <20180409220249.11796-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] polkit-gnome: remove
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
X-List-Received-Date: Mon, 09 Apr 2018 22:03:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* last release was 2011
* it fails on autobuilder
* nothing uses it

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../polkit/files/gtk-doc-check.patch               | 12 ----------
 .../recipes-extended/polkit/polkit-gnome_0.105.bb  | 28 ----------------------
 2 files changed, 40 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb

diff --git a/meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch b/meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
deleted file mode 100644
index 4b6ad75cc..000000000
--- a/meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- polkit-gnome-0.105/configure.ac.org	2015-05-04 22:33:03.925977953 -0700
-+++ polkit-gnome-0.105/configure.ac	2015-05-04 22:33:16.862288030 -0700
-@@ -120,6 +120,9 @@
- # Check for required packages
- # ***************************
- 
-+# check for gtk-doc
-+GTK_DOC_CHECK([1.14],[--flavour no-tmpl])
-+
- POLKIT_AGENT_REQUIRED=0.97
- POLKIT_GOBJECT_REQUIRED=0.97
- GTK_REQUIRED=3.0.0
diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
deleted file mode 100644
index 6e941e5d7..000000000
--- a/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "GNOME Authentication Agent for PolicyKit"
-DESCRIPTION = "PolicyKit-gnome provides an Authentication Agent for PolicyKit that integrates well with the GNOME desktop environment"
-HOMEPAGE = "http://www.packagekit.org/"
-BUGTRACKER = "http://bugzilla.gnome.org/"
-DEPENDS = "polkit dbus-glib gconf gtk+ intltool-native gnome-common"
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=74579fab173e4c5e12aac0cd83ee98ec \
-                    file://src/main.c;beginline=1;endline=20;md5=aba145d1802f2329ba561e3e48ecb795"
-
-SRC_URI = "https://download.gnome.org/sources/polkit-gnome/${PV}/polkit-gnome-${PV}.tar.xz \
-           file://gtk-doc-check.patch \
-"
-SRC_URI[md5sum] = "50ecad37c8342fb4a52f590db7530621"
-SRC_URI[sha256sum] = "1784494963b8bf9a00eedc6cd3a2868fb123b8a5e516e66c5eda48df17ab9369"
-
-EXTRA_OECONF = "\
-    --disable-static \
-"
-
-DEPENDS += "gtk+3"
-
-inherit distro_features_check autotools gtk-doc pkgconfig
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-FILES_${PN} += " ${datadir}/dbus-1 \
-                 ${datadir}/PolicyKit \
-"
-- 
2.14.3


