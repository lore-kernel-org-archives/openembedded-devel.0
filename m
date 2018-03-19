Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id EE5A8789D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:40 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id s18so19911348wrg.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PeHYZ952IpXRFaiNJ2MtEweYNX6xpGi2IAi/boRUUMM=;
	b=ndDWmZnluk3kp+uQt6mGVurLdCOOJIVfJeOSPOFPb7+NosWddROYruIAia+lS1Ejpv
	jbNluqxKKGS9/38K3T/0RAzQy5weTWiFMyDBWhWooGtxnKBg2+WYpGOnF7DpfRjgOGRu
	tZdPH5H2UBnTnuWjxOUd9pmOcJf5L00O2vi7ygu32b4clvNxDENJeTqS6G21RR4dA0/m
	K0Uj5GpLuFXjNwwpECXCXN6hyTXTrlgUPZ87r+Q66yHp0Ojc7L6ntZreDcfDotbi8+0H
	W0jBZgWbiXcFcEShMwc+uLTzi5NNo6WbMp6LUZ4vzIvqd24E46KipFHN66Gq0/vWkHEV
	YX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PeHYZ952IpXRFaiNJ2MtEweYNX6xpGi2IAi/boRUUMM=;
	b=DkTErt2UP18RbmQJoh8AZIWP7drXni21/3Na1g9cTOGdxTWGK6a2npaiF3lptfE713
	tiQJW3Ya3BnLsQOizLFDjTU4Df/iAFQ8ZNHVx39utueErC5T1x2JoRU7VxdmocojRmV5
	sQnwtkJ8HQzNgZtW062/aF0L3UWoIKPt+7886+OdWfmVsZ3cjWrBaBrAhJmk4NjuRfXo
	XtgnoJWzujKWb5jFJ70lWSq77PloHd0SapBe6dFXAy3MzZbgJh5RKwjrSaELvdC7nRCh
	YwuOK67wwn6W5cy/ba/QXIrNSzNEyPM/OrEzcdEr7Ktg3MwogXpcb6O365MO7bRFPDOL
	kMRg==
X-Gm-Message-State: AElRT7H+HMaTh1fl0Ycp8+vMteQ7Sf0K9uySUTaWXEzJx/9npcjnHZcz
	sp6KR1VqVzo+KJ/V2/iHjjK6nQ==
X-Google-Smtp-Source: AG47ELtXkNrdQbJJ0w7Gf3/TPYLE91boteJzGlRbb0ad9SMOLhHo6CBlb4N48GyT6a56rHItdMBbbQ==
X-Received: by 10.223.158.208 with SMTP id b16mr9929181wrf.274.1521491381608; 
	Mon, 19 Mar 2018 13:29:41 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:29:11 +0100
Message-Id: <20180319202911.30760-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 17/17] libidl: remove
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

project is dead - last release was in 2010

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb | 10 ----------
 meta-gnome/recipes-gnome/libidl/libidl.inc              | 13 -------------
 meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb        | 13 -------------
 3 files changed, 36 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb
 delete mode 100644 meta-gnome/recipes-gnome/libidl/libidl.inc
 delete mode 100644 meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb

diff --git a/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb b/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb
deleted file mode 100644
index 2252c44ee..000000000
--- a/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SECTION = "libs"
-require libidl_${PV}.bb
-inherit native
-
-PR = "r1"
-
-DEPENDS = "bison-native glib-2.0-native flex-native"
-
-SRC_URI[md5sum] = "bb8e10a218fac793a52d404d14adedcb"
-SRC_URI[sha256sum] = "c5d24d8c096546353fbc7cedf208392d5a02afe9d56ebcc1cccb258d7c4d2220"
diff --git a/meta-gnome/recipes-gnome/libidl/libidl.inc b/meta-gnome/recipes-gnome/libidl/libidl.inc
deleted file mode 100644
index 1a5c81582..000000000
--- a/meta-gnome/recipes-gnome/libidl/libidl.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Library for parsing CORBA IDL files"
-HOMEPAGE = "http://andrewtv.org/libIDL/"
-SECTION = "x11/gnome/libs"
-LICENSE = "LGPLv2+"
-
-inherit autotools pkgconfig
-
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libIDL/0.8/libIDL-${PV}.tar.bz2"
-
-S = "${WORKDIR}/libIDL-${PV}"
-
-FILES_${PN} = "${libdir}/*.so.*"
-FILES_${PN}-dev += " ${bindir}"
diff --git a/meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb b/meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb
deleted file mode 100644
index 86dfcf2f0..000000000
--- a/meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require libidl.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
-
-DEPENDS = "glib-2.0 flex-native libidl-native"
-
-PR = "r1"
-
-BINCONFIG_GLOB = "*-config-2"
-inherit autotools pkgconfig binconfig
-
-SRC_URI[md5sum] = "bb8e10a218fac793a52d404d14adedcb"
-SRC_URI[sha256sum] = "c5d24d8c096546353fbc7cedf208392d5a02afe9d56ebcc1cccb258d7c4d2220"
-- 
2.14.3


