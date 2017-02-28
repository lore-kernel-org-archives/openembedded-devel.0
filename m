Return-Path: <tom@harbortronics.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0A62D72FA1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 15:15:59 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id s67so6272235pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 07:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=harbortronics.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=3g7SJFFHK0Hox4xVzaBuHJZOCE5IBEf70Rr9EdMEaiU=;
	b=bu7XJqBt1600vG7GnD0W0pX1J9rccAr6b6xZ9s0ZVymeCaABCMaZHKoI3AN3gasr9K
	WVlYZbVYDGqOjBPX7pzRy20ZMo5E1n/bLnfG7x4oxiFi5XjadU8pdEIAOBeybiTGDmMH
	FdzN8eqNTwctVxftZ3Ca5FEJp5IBiGAI3rt9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3g7SJFFHK0Hox4xVzaBuHJZOCE5IBEf70Rr9EdMEaiU=;
	b=oBkdEb9MPiIfMDu+ZSPJhgYAo6vqyvIi99agz/WUEWcHS6SaBvejBR+Qud/24UbOFj
	ORJURVQW6SVZsXdF3Y5eWnZFYHwZLklMVPcELOhh8I1hscTEITEW2c6Q+CeHLpZakrbz
	W45AjBvBguqrn/cR573lQ1RksDq2czXqIWhaze5IYepL8r6veeALwCJ/iyx470kX5rnh
	C8FvbGWc3os+vbbtNvgOq7oeemmKE88wOwOrN7s6ZJ3FdCHldjWmpUe0QaKGD6Fco+DT
	LYg/drO6a4f4n90Zte678Fo42N6q0EQnewjQkxWxXfzRX0d4YrIJ8dou1a7hEvQvjhMD
	5YJg==
X-Gm-Message-State: AMke39ngYzliKyKyLDjixQcNLanW+p8x0WhAKwgv5rXEOLWQreDl5s17aVau2JFkLI4G9Q==
X-Received: by 10.84.137.106 with SMTP id 97mr3124860plm.68.1488294961286;
	Tue, 28 Feb 2017 07:16:01 -0800 (PST)
Received: from yocto-dev.harbortronics.com (174-21-50-42.tukw.qwest.net.
	[174.21.50.42]) by smtp.gmail.com with ESMTPSA id
	c28sm4959561pfj.77.2017.02.28.07.15.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Feb 2017 07:16:00 -0800 (PST)
From: Tom Hayward <tom@harbortronics.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2017 07:15:53 -0800
Message-Id: <1488294953-44431-1-git-send-email-tom@harbortronics.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCHv2] usb-modeswitch and usb-modeswitch-data: update to 2.5.0 and 20170205 respectively.
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
X-List-Received-Date: Tue, 28 Feb 2017 15:16:01 -0000

---
 ...deswitch-data_20140529.bb => usb-modeswitch-data_20170205.bb} |    6 +++---
 .../{usb-modeswitch_2.2.0.bb => usb-modeswitch_2.5.0.bb}         |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20140529.bb => usb-modeswitch-data_20170205.bb} (66%)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.2.0.bb => usb-modeswitch_2.5.0.bb} (80%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
similarity index 66%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
index a265411..042cd38 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 inherit allarch
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "dff94177781298aaf0b3c2a3c3dea6b2"
-SRC_URI[sha256sum] = "53889157937109e04dafe897c098ec94f3f44f9c0c83fc6ec8417aa9a587e536"
+SRC_URI[md5sum] = "0cc107cd0c4c83df0d9400c999e21dfd"
+SRC_URI[sha256sum] = "e2dcfd9d28928d8d8f03381571a23442b3c50d48d343bc40a1a07d01662738d1"
 
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
 
-RDEPENDS_${PN} = "usb-modeswitch (>= 2.2.0)"
+RDEPENDS_${PN} = "usb-modeswitch (>= 2.4.0)"
 FILES_${PN} += "${base_libdir}/udev/rules.d/ \
                 ${datadir}/usb_modeswitch"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
similarity index 80%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
index 0c548d8..ff439f3 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libusb1"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "f323fe700edd6ea404c40934ddf32b22"
-SRC_URI[sha256sum] = "2752103de171ed5f6c8d6a6e3e73e16c9ee3e8e394dd39c5991f7680eb908a3a"
+SRC_URI[md5sum] = "38ad5c9d70e06227a00361bdc2b1e568"
+SRC_URI[sha256sum] = "31c0be280d49a99ec3dc0be3325bef320d9c04b50714ef0ce1e36a614d687633"
 
 inherit pkgconfig
 
-- 
1.7.10.4


