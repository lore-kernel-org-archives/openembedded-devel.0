Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 533977E413
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u16so994786wrn.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PZTN/LpPeu0ckVJ5XlfM1m40Ha7W5294ZIIjQvDZWU0=;
	b=rhyVhyN8APW1+ecmHpVUgTmFKRRkeU9fNP97V9MJGUUcOtLx351dj848FsduLZNBnB
	Mdv/LLh/fPpeiZ3BJvuHvwHQNwDeEWTifUsC5Zx6cJYwynXRP/QAHsQCe2NlrNuHUmcz
	BbkHuJa6/9B3IEtqHabvH4XUZRdWz87s/r1YbzofMnJI8JvTVhy5jKmUuiuGfowroOmC
	DSq/RaRThJH/ltt7mSSThSbRq1gpSh23MwucMw19R5BeEqSW/13UenKmONm0YUeWczSm
	5RpfXeKRlnH2b1ojvf8XyPEfygtEtjhUnmP9on+LPxzU20/F3iVCYpsyCzJ+SpKixl/q
	Rzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PZTN/LpPeu0ckVJ5XlfM1m40Ha7W5294ZIIjQvDZWU0=;
	b=qW2IXvvTTeRf67Z4Q8WCzWC9uUxremNuXJjEzwm2FLbTjAA/KpEaOj4hysm4jxv/1D
	pWjXHSs73lUKhstqknE7PfaJwORq1yTI4r1vog98ZmDjQmQYhMdtS0oWtUZHkTH8+yO0
	j1tZs8XX9tAiMrixx/YFEFP74mPRTk/kH9gMXcecgyhjOWyYa2e1AEcm+BhD9FMh6T6J
	tLq+Z49EUhr+FS++1IVQfeUzqH4sn2SyqyT19VpYS4DXvN/hdm3pN/KCAfHCDAn8rsef
	hQRW4b3dF5SpFugE+VmCIDDUwI8nfPbzpyvTK8yzObk+wCeq36egt6AfYinsz+Hd2neZ
	SOPw==
X-Gm-Message-State: APjAAAVt86Pgjxwdz64HH2t3dSymDP1TJM2sVI3RZooKEjpKtL3HI4CR
	KAV9rj8h4MJEcED2+GCFNcD/rlVYIMY=
X-Google-Smtp-Source: APXvYqye+1tOCmqCvG9nZqIYWeVT2Vhxld/9a2eGILoH0QNPg745UveLNq7UcKDllNrv+5/VFDTE9Q==
X-Received: by 2002:a5d:61c4:: with SMTP id q4mr46195304wrv.295.1558594155838; 
	Wed, 22 May 2019 23:49:15 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:27 +0200
Message-Id: <20190523064859.24336-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/41] gnome-menus3: upgrade 3.10.1 -> 3.32.0
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
X-List-Received-Date: Thu, 23 May 2019 06:49:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* No Changelog avalailable - they suggest to clone the repo :(
* they use gettext instead of intltool
* gconf is not required in DEPENDS - modern gnome does not use gconf anymore
* add upstream-version-is-even to inherit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{gnome-menus3_3.10.1.bb => gnome-menus3_3.32.0.bb} | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-menus/{gnome-menus3_3.10.1.bb => gnome-menus3_3.32.0.bb} (41%)

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb
similarity index 41%
rename from meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
rename to meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb
index 647ae914f..b6d212a27 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb
@@ -4,18 +4,15 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-DEPENDS = "python libxml2 gconf popt gtk+3 intltool-native gnome-common-native"
+DEPENDS = "python libxml2 popt gtk+3 gnome-common-native"
 
-inherit distro_features_check gnomebase pkgconfig python-dir pythonnative gobject-introspection
+inherit distro_features_check gnomebase gettext pkgconfig gobject-introspection upstream-version-is-even
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 BPN = "gnome-menus"
 
-SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BPN}-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "6db025e79e2b69f39fc7aa0753f43081"
-SRC_URI[sha256sum] = "46950aba274c1ad58234374fa9b235258650737307f3bc396af48eb983668a71"
+SRC_URI[archive.md5sum] = "4262208c13f266d9ada7d356aada9e1b"
+SRC_URI[archive.sha256sum] = "c850c64b2074265fe59e099a340b8689cf3dd4658dc9feddd2ab5e95f1a74b74"
 
 FILES_${PN} += "${datadir}/desktop-directories/"
-- 
2.20.1


