Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 318D078305
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 15:35:14 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id k69so27737458wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vlk9A2cr0K5Fp4yMBe/0IBADVZGCdirpTJk1hb2jo8s=;
	b=vNXtl0Qq/mXDqUX9W52j69T3wgAd9KXmdXUKnSQsfhF5beRVJc7D9m3a5tzx/2sFku
	xFTp1aBNi3kb9bqb7wcf2GnELNj4dx5WKqFqiXAvWOSj+ZvfYc8tSprmpLv1MUqgtmrd
	sKajl4y71hg7DWtYsl5OKt9XqfoFs2vZWZN2TGNrzJMpQNhypdfqv8Tccfy8nabkW2KI
	pJ1XRZ/1hxznP6VNHiiCaPp1XV5QLgZXxqEgQgP3rhdtcQu1IdtQ3dhzxLDD/ylTigcL
	j/hhHTODSRyjEGLALAR7SS/rtElfwKTxpPO8AKmog6PeVBOJPCn6tAtHyPHAfCCDHgBD
	I1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vlk9A2cr0K5Fp4yMBe/0IBADVZGCdirpTJk1hb2jo8s=;
	b=q1yi3/Y3jevSoqZIijzSC9GpMAumkGecfhb0n6Dgc44WT0GsSmiQilMl9tzevjHSlR
	ao1QdKtzXffbzLZlmomnehqf+4cRuSBrKvhRdnxDdlTjJLVaYYlP9o6DO0VmZM5m0DRP
	NWALU/bsvaFpPA/E31V1B7r8OBU603TVpMx08KxqF1GXLccgBJfOTuoxxqEu7Zw1sdNg
	da0n4G10IIhRaCyDoXZ/Wk9nccO9IGDXJ0pizgpFBmqH2hf87KW+3r84hYfm5LTRMfwP
	ILPkMJheazkpWdTiDN27hf5QDkrZ+HiInI1R/OLYPVyNeSe9PNIAtGzBU4vRmxLU4Dbc
	ZFog==
X-Gm-Message-State: AIVw110y2xt9qZQIXrSnQo+nQ2YvuPf84n+Iyqin9WLi8h+GHxoUTzo+
	23XxbuLecn/EViWdAnc=
X-Received: by 10.28.226.137 with SMTP id z131mr2743359wmg.151.1500564915509; 
	Thu, 20 Jul 2017 08:35:15 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	190sm2853628wmh.36.2017.07.20.08.35.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 08:35:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:35:00 +0100
Message-Id: <20170720153508.23113-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][meta-gnome 1/9] cheese: remove (previously blacklisted)
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
X-List-Received-Date: Thu, 20 Jul 2017 15:35:15 -0000

Cheese 2.30.1 is very old (2010) and has been blacklisted for some time, so
remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb | 26 -------------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb

diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
deleted file mode 100644
index 3f5a5b124..000000000
--- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Take photos and videos with your webcam, with fun graphical effects"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
-
-DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg gnome-desktop evolution-data-server intltool-native"
-
-PR = "r2"
-
-inherit gnome
-
-SRC_URI[archive.md5sum] = "1599fded8a1797ea51fb010af4e6c45b"
-SRC_URI[archive.sha256sum] = "48f03470c6f527caa0e3b269d3afcff86ae0939a74f66ce030d4eed3bc3cbd9a"
-GNOME_COMPRESS_TYPE="bz2"
-
-FILES_${PN} += "${datadir}/dbus-1"
-RRECOMMENDS_${PN} = "gst-plugins-good-meta gst-plugins-base-meta"
-
-EXTRA_OECONF += "--disable-scrollkeeper"
-
-do_configure_prepend() {
-    sed -i -e "s: help : :g" ${S}/Makefile.am
-}
-
-PNBLACKLIST[cheese] ?= "Depends on blacklisted gstreamer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[cheese] ?= "Depends on blacklisted gnome-desktop - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.11.0


