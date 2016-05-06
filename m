Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 33E85731C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 10:59:26 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id a17so71737082wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 03:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=V3s+6Fe+hrG+1t6GRN4ZwQa+5JoMwzFtErt1H9ieTJg=;
	b=zgw+NiypHtQ6T2BeqbIConYSVIspWQIRnCNUhhevyzRmUqi1CrCItIB9mINp36FKeL
	fvbPXpaWUPtmMoJygNdQRxWWHIVf4QIliDUw4F6Dq+flItQBjB2u4vRH9kqGEinB1f9L
	AXKKWogj+LUVJMbTbl4gxzY1ZiiatRPyvTWwZzolxWEzX6L9qkyjurSrJRx66pJm7l39
	he+EiUlEfU8CPP7CtI5gtO1WfpYx9COwD0s60Vs1hFy09UjF+AYpdrID4SBcoM7mkkQV
	YWcPr7Nt96L8MTcjQbRNIlHu8fmWw4UL/xGiTkm/4EbMoFT6p4/677+KtV4lios5kENL
	YhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=V3s+6Fe+hrG+1t6GRN4ZwQa+5JoMwzFtErt1H9ieTJg=;
	b=Q3YmxwsXjC6un4nL+YkC0m4eW96B1AtVJLVWK3yVfA88x/3IKhmsEOJJrFWft5G8Nb
	aQreJPZZqW6E62W7sby9C8932ns2bVFAGJImuM6c+BTn8E2zxdri96YDH+a0UqWrUdNe
	2jNCDvd8T9MZJQZaRw/CYafNyj0JM1W4BSIq+FqCBNijDbYKRbF+3NghHeUmIm4SyELu
	FN3hh+0j5ZuGwJdq/5mmF92jtXYDKI4GHchTb4oCPtl52ulr+UaoaqhneUNfysdAgcyq
	BUsRX95DNUCckFPLlLeA/23Ww7EbWGaYx4+VNVh3lDDCBDngdYcoLu3u4wR8Ex8waWoB
	zyJA==
X-Gm-Message-State: AOPr4FUARY7wGC3MSWeztluOe+ILVyjcnIzex6eWtC59wpM61vEPk06THrerS0QhjEVvDw==
X-Received: by 10.28.130.133 with SMTP id e127mr9207899wmd.48.1462532367168;
	Fri, 06 May 2016 03:59:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	xt9sm14356371wjb.17.2016.05.06.03.59.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 03:59:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2016 13:00:54 +0200
Message-Id: <1462532454-10125-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.2
Subject: [PATCH][meta-oe] packagegroup-tools-bluetooth: Selects the tools appropriate for the version of bluez being used.
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
X-List-Received-Date: Fri, 06 May 2016 10:59:28 -0000

From: Ann Thornton <ann.thornton@nxp.com>

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-tools-bluetooth.bb  | 43 ++++++++++------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
index bdab389..dde4599 100644
--- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -5,36 +5,33 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-SUMMARY = "Set of Bluetooh related tools for inclusion on images"
-DESCRIPTION = "Add bluetooth tools based on the version of BlueZ in use.\
-The tools that have been tested and work the best are pulled in \
-automatically.  The same packagegroup can be used in a recipe without \
-the need to know which version of BlueZ is in use. \
+SUMMARY = "Set of Bluetooth related tools for inclusion in images"
+DESCRIPTION = "Includes bluetooth specific tools for this version of BlueZ.\
+These tools are used at runtime. \
 Supports BlueZ4 and BlueZ5."
 
 inherit packagegroup
+inherit bluetooth
 
-BLUEZ4_INSTALL = " \
+RDEPENDS_bluez4 = " \
     obexftp \
 "
 
-BLUEZ5_INSTALL = " \
-     bluez5-noinst-tools \
-     bluez5-obex \
-     bluez5-testtools  \
-     libasound-module-bluez \
-     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', "pulseaudio-module-bluetooth-discover \
-                                                            pulseaudio-module-bluetooth-policy \
-                                                            pulseaudio-module-bluez5-discover \
-                                                            pulseaudio-module-bluez5-device \
-                                                            pulseaudio-module-switch-on-connect \
-                                                            pulseaudio-module-loopback", \
-                                             '', d)} \
+RDEPENDS_bluez5 = " \
+    bluez5-noinst-tools \
+    bluez5-obex \
+    bluez5-testtools  \
+    libasound-module-bluez \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', \
+        'pulseaudio-module-bluetooth-discover \
+         pulseaudio-module-bluetooth-policy \
+         pulseaudio-module-bluez5-discover \
+         pulseaudio-module-bluez5-device \
+         pulseaudio-module-switch-on-connect \
+         pulseaudio-module-loopback', \
+        '', d)} \
 "
 
-# Install either bluez4 or bluez5 if they are in distro.  
+# Install bluez4 tools or bluez5 tools depending on what is specified in the distro.
 # Otherwise install nothing.
-RDEPENDS_${PN} = " \
-     ${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', '${BLUEZ5_INSTALL}', "", d)} \
-     ${@bb.utils.contains('DISTRO_FEATURES', 'bluez4', '${BLUEZ4_INSTALL}', "", d)} \
-"
+RDEPENDS_${PN} = "${RDEPENDS_${BLUEZ}}"
-- 
2.8.2


