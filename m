Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E6D5B7EB12
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 13:38:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45dQKz03Vhz3t
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 15:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562074695;
	bh=mpxHYsRn8yLX6lfQgAjuwmLSWea0koEEvjDGacP8deQ=;
	h=From:To:Subject:Date:From;
	b=Uh583qerbT+eba5VpgHjFJavUbSpWCHNfw1+3Fai3Ldw9Vvr+8YqIikFcDRvcWX1e
	56KVcGsqPrNYa2vnIIAhbeP0WDfg00qwLWdfpY20O7z1PAR53hnssZGqrbZP6rpibT
	q2zKGdYJvrJ8Q6imFgT8eU/C/bHbpOaSDZpF4XArYIjqrWKTc/h/FljWD0a5cT59bi
	fWyxtbnIxmy9+x/KK9Sn+i/LHyZv9Zirzz76JoqOxNl2xc8rujah6Vput0Vwy0JzXW
	Qpp0U4oh6ecTRNcWNtIHGdqPIdaPoLOd6F4irdHPdQkkH4yJXiWxErQ3HNXPDGk1+R
	0GpMCs03WBHrAdmGgPgW6ZWFuF5q5Kmv9LPlwtqDBelyQ/wQqj6XjN2qwj9jsRuCQX
	eBhg7F8QCM30WRgFtZf0TP9kkICTohnH2c2oh/h2p6Gdx7SWGj1alEt5dkvcDtoeKT
	iWDXeU1xxZA7rZO2o9kH8FSlduZtpIdPrmtoj9naBgyhikGbKItpC0RnLySLax/rkK
	GDd1KtjbFBkfy7+ShuIBx7vL0OhdFEKsTOCAbu4Kq1Kk5VXc+x/vhx6WCK2yQoCXt1
	hK8TvWTVLypgYV3BjTHe5BbPSfRFdnGHwasOTS8Biy3JbLIyEFBqdjVJNk4M1HvPVY
	ld0yHZBqML0DJwXhVu83Gvxk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2019 16:38:14 +0300
Message-Id: <20190702133814.26787-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] packagegroup-tools-bluetooth: Remove bluez4 support
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
X-List-Received-Date: Tue, 02 Jul 2019 13:38:15 -0000

bluez4 was removed 2 years ago.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../packagegroups/packagegroup-tools-bluetooth.bb     | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
index 913e31111..2b4448a22 100644
--- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -6,17 +6,10 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SUMMARY = "Set of Bluetooth related tools for inclusion in images"
-DESCRIPTION = "Includes bluetooth specific tools for this version of BlueZ.\
-These tools are used at runtime. \
-Supports BlueZ4 and BlueZ5."
+DESCRIPTION = "Includes bluetooth specific tools for BlueZ.\
+These tools are used at runtime."
 
 inherit packagegroup
-inherit bluetooth
-
-RDEPENDS_bluez4 = " \
-    obexftp \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'libasound-module-bluez', '', d)} \
-"
 
 RDEPENDS_bluez5 = " \
     bluez5-noinst-tools \
-- 
2.17.1


