Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2DC7ECDB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 16:56:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45p6422shhz63
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 18:56:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563296178;
	bh=cMzEJAABWKUgkgm/+S83MHNQcWNYJ3nArSm5clNN4as=;
	h=From:To:Subject:Date:From;
	b=cDcx/cMVoVoR41DyuHB5mUBb9llAxsXF9rkDFWtiXqLqbDJ5RZOP0+YNcOjI1STW7
	ckGD9xBCICbvAk/p1L9U9SUierjg6Vt0Z++Mp5AtQlo6HCzYAOdDApx0oQiUa5rNWi
	tc9+U2yWjs8gZiJDZMlcZAU+yZkpuhp8KLT1rddmWUUmJ+6OaukEyiCqEm2+z44s2I
	vYUKASu2RlOBblOk4UFtTy6RdjQfkDhzG04kmzai1VyfhfuziAyzJ7If+ty++OVExj
	v2yNEH8ZHu80UJnb9faxEql1pjLBqo7TYaIvemaAdbE8HbvdDPZYp2U/ZvN/o4btIH
	25/tf37ReQ9EfSf9C2Esx9QaUJ/5GEJwlPhC6QRor6GYELICx59qtaY1y9U++U3Bt5
	w5728r+mKzdm4jax6Q/3mf1YIVFxC0TdtiWKh/7zYoMnsyptlOHVg4pgDBwCVqiuLD
	JrbzBO1qeZmMlsknSGUgjuWw0KN9qhpiiict4N7bJMJbOR3jUMmHEQUz+BjL1/VLqb
	XL3BiIlrv9Q+odx94tK79FBqG8oGU8avx3b+Q1CtA2+w7gvavChLVQo40sncpYb7O9
	p0UyQR6sfIV953k5zwYd4b+00LU/ALliCsm0OgO3ELsJzty+vAH3OqIg6VgId+DE76
	wrvOTj8SIE6hLRYurgVlNdbU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Jul 2019 19:56:16 +0300
Message-Id: <20190716165616.31970-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] gpsd: Upgrade 3.18.1 -> 3.19
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
X-List-Received-Date: Tue, 16 Jul 2019 16:56:18 -0000

Licencing changed from 3-clause BSD to 2-clause BSD.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...struct-prefix-includepy-with-sysroot-and-drop-sy.patch | 0
 .../gpsd/{gpsd_3.18.1.bb => gpsd_3.19.bb}                 | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.18.1 => gpsd}/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.18.1.bb => gpsd_3.19.bb} (95%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
similarity index 95%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
index ebbc7f3b3..558b7c1d5 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A TCP/IP Daemon simplifying the communication with GPS devices"
 SECTION = "console/network"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=01764c35ae34d9521944bb6ab312af53"
 DEPENDS = "dbus ncurses python libusb1 chrpath-replacement-native pps-tools"
 PROVIDES = "virtual/gpsd"
 
@@ -14,8 +14,8 @@ EXTRANATIVEPATH += "chrpath-native"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
 "
-SRC_URI[md5sum] = "3b11f26b295010666b1767b308f90bc5"
-SRC_URI[sha256sum] = "5cb1e6d880ec9a52c62492dd0e3d77451b7c7ad625895bd652f6354215aec23e"
+SRC_URI[md5sum] = "b3bf88706794eb8e5f2c2543bf7ba87b"
+SRC_URI[sha256sum] = "27dd24d45b2ac69baab7933da2bf6ae5fb0be90130f67e753c110a3477155f39"
 
 inherit scons update-rc.d python-dir pythonnative systemd update-alternatives
 
-- 
2.17.1


