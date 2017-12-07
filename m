Return-Path: <dmitri.vorobiev@movial.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id A0042784E2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Dec 2017 13:13:02 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id f13so8058829lff.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 05:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=movial-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=f7VRTmDNG2IYDKvc9LdpEP79ejGpuR9G3+XCms1Q++w=;
	b=mAv5bSV0wAQMtSyKfkngrgCw461dfral6/9yAD4ESYc40IaMBMrbCISOBdIcTXOocM
	os8Oa/rlnY2cbaM6ZExq2M2wZAsk3YJhzzrraYLq49/NBC4JRugETOlBTGq0ALDkolAl
	NXSlZF8mPsN5qTA+/2ZgLPuEisTWlmYBxlapGB84T1zyTCyfsJJif8cF28rcpHcVgZnt
	qPyQZfGaJuB5xBJPFf0ChNoiiq02mw8erKT+axZcSIvC/botFoDtdpPRZfDBNFxRaLnM
	k0Pi5x4AdsMegVXmJaFUi5fPVzreBIbJXfIjQnPspKSIRno+Zi5l7tTRs0W6LBSQB510
	CIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=f7VRTmDNG2IYDKvc9LdpEP79ejGpuR9G3+XCms1Q++w=;
	b=U7M8gOfZ6DP9tIxK8WZdMscP2M9WjLxHDQ2R9YJ98u5k+ezrLz+04Ouy/zActkakiN
	r4dqNlUc/oZM/arq32TV9Pif+Sal+qc9QMJFgPSyVj/PYcwdLlW73V3lpCfgdQdxgcXL
	WaePnAc+P/aGO5xwJ9jZItul8z8XemyDmbl3Pg9vszZCfEYJLK+z/PNfUE9HHNpyEofd
	B1ZME3rSt2ESmhjiAlR8rYu+MuuiUX7CQ6yKDQXNvSxENghlV8OmGK/dFxl1T4Ha5hqF
	DeUjSnBN7RSWyv0vgheR7/fpKSOV6HaIY1fu/NY0ZNG0sCljvsWtkLnQSNnpu63nP0mq
	9Ypw==
X-Gm-Message-State: AJaThX6yZLD/wDbCP5+moFciHk1V007k7QLVD+KZs1UJtvGbnzsFW/61
	RyVJegcHvWpawdfBa7iVvHAjogmuiaE/5A==
X-Google-Smtp-Source: AGs4zMb8X0ed0uI1JFmC6tk0ZrH3D640NhjjQO2gdoxmNMYX2g7xt8i5FzFoaXv4dIlTNLcjH0vlzg==
X-Received: by 10.25.125.195 with SMTP id y186mr12016268lfc.137.1512652383778; 
	Thu, 07 Dec 2017 05:13:03 -0800 (PST)
Received: from slo54.localdomain ([194.100.75.94])
	by smtp.gmail.com with ESMTPSA id z81sm977199lff.80.2017.12.07.05.13.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Dec 2017 05:13:02 -0800 (PST)
From: Dmitri Vorobiev <dmitri.vorobiev@movial.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 15:19:05 +0200
Message-Id: <1512652745-22945-1-git-send-email-dmitri.vorobiev@movial.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] usb-modeswitch: Upgrade to latest version
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
X-List-Received-Date: Thu, 07 Dec 2017 13:13:04 -0000

Use the latest version of usb-modeswitch (2.5.1) and
usb-modeswitch-data (20170806).

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.com>
---
 ...-modeswitch-data_20140529.bb => usb-modeswitch-data_20170806.bb} | 6 +++---
 .../{usb-modeswitch_2.2.0.bb => usb-modeswitch_2.5.1.bb}            | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20140529.bb => usb-modeswitch-data_20170806.bb} (66%)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.2.0.bb => usb-modeswitch_2.5.1.bb} (79%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
similarity index 66%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
index a265411..3926feb 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 inherit allarch
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "dff94177781298aaf0b3c2a3c3dea6b2"
-SRC_URI[sha256sum] = "53889157937109e04dafe897c098ec94f3f44f9c0c83fc6ec8417aa9a587e536"
+SRC_URI[md5sum] = "fb50d15b52e909d742dd16f0a9882316"
+SRC_URI[sha256sum] = "ce413ef2a50e648e9c81bc3ea6110e7324a8bf981034fc9ec4467d3562563c2c"
 
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
 
-RDEPENDS_${PN} = "usb-modeswitch (>= 2.2.0)"
+RDEPENDS_${PN} = "usb-modeswitch (>= 2.4.0)"
 FILES_${PN} += "${base_libdir}/udev/rules.d/ \
                 ${datadir}/usb_modeswitch"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb
similarity index 79%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb
index 425f66b..e2d211b 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libusb1"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "f323fe700edd6ea404c40934ddf32b22"
-SRC_URI[sha256sum] = "2752103de171ed5f6c8d6a6e3e73e16c9ee3e8e394dd39c5991f7680eb908a3a"
+SRC_URI[md5sum] = "7e6435a2afe7aed8574fe59cf09a3503"
+SRC_URI[sha256sum] = "f6e44bfc6e8d531ac6759791cf79ee9c618e7894fcf37170c8a5559718f9abd2"
 
 EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
 
-- 
2.1.4


