Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A53926C42C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2019 23:16:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Vlh01kh9z3J
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Dec 2019 00:16:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575760576;
	bh=TwMOq6I3JmURB369QC3puH0FG94jrpPzppa6Klg7ZCA=;
	h=From:To:Subject:Date:From;
	b=WdxCMVNJuWZIysnSdpKxbx7RBgUTvAavDumlKKQEAHMcFAKxqkfQLn++RFu+2WUkX
	iVG+RYr6r5ZAstraxadA3lT5zCu1RjsQMukrY/fJpa6S3irXI0OjSiZ2Mu4YBb5HQI
	eWu0kTu3pVZbt1/4DJZwYyTxESXOMTFRX4StdLvk/JdnAgb6JmpdDhTBKQD/1E+P+m
	Q+vox1/ejyUcXVoVkY2yY230RH6F7DOIw+K0fq0at9XbfiLz8NcxV2xLec3X4t25M0
	i3BLwQpnPwG+gDQu475ONu3nZWpnBQlHg+DaS7qaKQs3bmV7sPbPo30rg2bCABq/fy
	aK8OveCkVQSXeLBmkkXXDLhZonLLkWjAdW5F4paaq6q//0cZY7b4d/s2+sBKAhw/I4
	3QmtBp8irkzBKdoNK90gKS+YkSN6mVqphumrT+I5h/bKiY/l/sgMHfvLUcrDkCnrQA
	C7VFKVGsC8vNDFJMaBVcx04gjWbBDASO7tYa9YCsKzMVZNio6kCDdWBI/VipDDKBOv
	LZje14G4GRqtoUvQFKaLKXNvZcV1jzBVO1xd2NO1JKCDMHt1GxJDyY54rxE96IgVZY
	UxHN0xxsdrxNb4MFYUHmngiSaVDBXOeoZJv21YraqD8UoAVCVgOEHXhy62e/VXoeNv
	TRIV//gO77gqqnd+7pRdR+ow=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Dec 2019 01:16:15 +0200
Message-Id: <20191207231615.18722-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] gpsd: Add a PACKAGECONFIG for disabling usb support
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
X-List-Received-Date: Sat, 07 Dec 2019 23:16:15 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
index 6834bd45a..9fdbbf254 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
@@ -2,7 +2,7 @@ SUMMARY = "A TCP/IP Daemon simplifying the communication with GPS devices"
 SECTION = "console/network"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=01764c35ae34d9521944bb6ab312af53"
-DEPENDS = "dbus ncurses python python3 libusb1 pps-tools"
+DEPENDS = "dbus ncurses python python3 pps-tools"
 PROVIDES = "virtual/gpsd"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
@@ -23,9 +23,10 @@ SYSTEMD_OESCONS = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'f
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} usb"
 PACKAGECONFIG[bluez] = "bluez='true',bluez='false',bluez5"
 PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
+PACKAGECONFIG[usb] = "usb='true',usb='false',libusb1"
 EXTRA_OESCONS = " \
     sysroot=${STAGING_DIR_TARGET} \
     libQgpsmm='false' \
-- 
2.17.1


