Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A83B07F00D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 20:57:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45kWjF2PjczJ2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 22:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562792257;
	bh=QXo5rCX2za+AFrRQu0uae0gnKde1pX7Rr6D17fqVCa8=;
	h=From:To:Subject:Date:From;
	b=pK3jKST4Wl8G0coiJXS2j6RoCbx3AprEWJVYuU7KkvLcrdajXAJjcIz51iiUO4hbw
	H1DcEhV0xY/vtj2O+wQzZZjJXQgKwFnYgHJA/w7SzaRmxDXRttwOgflISy5PYn29Re
	9LZwNVATba+SeUy2rurmfyqCgZx+qjGjlY2oBoVuGLTCjkcJ0AHh8sMHFQ9H0AVwuM
	bQE1psxHSJGMsMlAg3ewbNXNfMC1GnZu0fxWYTTdh10hb5F+v9HcRYr2WI2MZkW/r2
	ZjNx7D8JTedgvJ7AowIuojVhZdMDRTifP2C4BnRXogfLC33dFah/zA5Lbut1Km4zhD
	CUV8XSJyy2/Jad3vmCFltVEEOttvl/KJuFUG1xE4MtLKTXXlIfkkG/+EkJEnA6Infw
	HQd4agYSqtPp2inF0i495h/rdC4BkM0BHC5SPiHY4T+9m86D8ka1IQXBVjkWNnCAQf
	yOsHO+h0lFpON4O6vvF+NFJ0FrOnu16WMHA8Zq9c/GdwtiQidoQfZGeSwio+Ki42kb
	jmGa67jmPLwWKTb2l41D+0O/FMRurmxDLy2vpBSAFO44Jb8xBKW4xpUT2NUp8spOHJ
	KQhgq+WUoPDtRhkPa/tyuQgkr5+foHd+Bdzl2WHPlMc2PYQv176gkOQPd7aUBWQfJH
	+J1kicxFiSPLj07OsuIbCxOA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 23:57:34 +0300
Message-Id: <20190710205734.12377-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] gpsd: Drop bluez4 support
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
X-List-Received-Date: Wed, 10 Jul 2019 20:57:37 -0000

bluez4 was removed from meta-oe 2 years ago.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
index 583fde6ca..b0f946cee 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "3b11f26b295010666b1767b308f90bc5"
 SRC_URI[sha256sum] = "5cb1e6d880ec9a52c62492dd0e3d77451b7c7ad625895bd652f6354215aec23e"
 
-inherit scons update-rc.d python-dir pythonnative systemd bluetooth update-alternatives
+inherit scons update-rc.d python-dir pythonnative systemd update-alternatives
 
 INITSCRIPT_PACKAGES = "gpsd-conf"
 INITSCRIPT_NAME = "gpsd"
@@ -30,7 +30,7 @@ export STAGING_INCDIR
 export STAGING_LIBDIR
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
-PACKAGECONFIG[bluez] = "bluez='true',bluez='false',${BLUEZ}"
+PACKAGECONFIG[bluez] = "bluez='true',bluez='false',bluez5"
 PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
 EXTRA_OESCONS = " \
     sysroot=${STAGING_DIR_TARGET} \
-- 
2.17.1


