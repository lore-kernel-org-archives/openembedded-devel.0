Return-Path: <tom@harbortronics.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1ACE7719BD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 22:26:42 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id 25so19646299pgy.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=harbortronics.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=OXUiQgqPuJ700iPpn/AChkHcPc7yqAg/iWWuTN5W5pw=;
	b=Oiu2RFV6vQpd3OitRC8fFfVR0CHU/IinqxXUlOZQwYIjXu5qL8vxvzEPLYVBYjBjMS
	vNhEWvD1jgVrpx7FeOGYv1HZ4jQCpD7tmKJHCSTfxpWoeFPGM1N1SwqX7pyQp9sy0dOL
	2LtT96WAuxrdfw+h+dqhxSVJz9+ekBx4LKK3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OXUiQgqPuJ700iPpn/AChkHcPc7yqAg/iWWuTN5W5pw=;
	b=OJWVh0UvCdAhzIi1l9+duzpCDohl/yER6kQDFdfpsJHAvm7wSkg7k54T9NEpNXbQts
	BGIqR4NE7Ar6Syx8J5GJGuRy0lW/zoq5L/beKS++1eQnXr7MN83A2LBP0xztVmqdJZ5X
	LfsnFpTN6kJmU69H3tJ0oaq08Tt/CHtSXxTQYz9Y5Vmy2uJ8eoydfGM+tc6VwC1QCRJ3
	8I6hy6urgcklZJnAnULkhOamRwlaMPvvaZHiyLQk930auXFQPlafQtLiIKEsknwQu8Q7
	2fSG2gwL4YVFn3H8NDHPTqpA/sP1T1V+AZM9Nn6vQVbhTt0iu3EkMwXlutBJPeMIL0yB
	7BhA==
X-Gm-Message-State: AMke39mtkTd6O4ByH6S/+N2jv9FtN93JD6nc/iQAUszA01ZhzX/a1IlnjACOUfT8OGjBpA==
X-Received: by 10.98.214.156 with SMTP id a28mr23262476pfl.40.1488234403748;
	Mon, 27 Feb 2017 14:26:43 -0800 (PST)
Received: from yocto-dev.harbortronics.com (174-21-50-42.tukw.qwest.net.
	[174.21.50.42]) by smtp.gmail.com with ESMTPSA id
	i70sm5994986pfi.67.2017.02.27.14.26.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Feb 2017 14:26:42 -0800 (PST)
From: Tom Hayward <tom@harbortronics.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Feb 2017 14:26:33 -0800
Message-Id: <1488234393-129769-1-git-send-email-tom@harbortronics.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] usb-modeswitch and usb-modeswitch-data: update to 2.5.0 and 20170205 respectively.
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
X-List-Received-Date: Mon, 27 Feb 2017 22:26:45 -0000

---
 ...itch-data_20140529.bb => usb-modeswitch-data_20170205.bb} |   10 +++-------
 .../{usb-modeswitch_2.2.0.bb => usb-modeswitch_2.5.0.bb}     |    6 ++----
 2 files changed, 5 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20140529.bb => usb-modeswitch-data_20170205.bb} (50%)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.2.0.bb => usb-modeswitch_2.5.0.bb} (68%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
similarity index 50%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
index 434f68a..042cd38 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
@@ -5,17 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
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
-
-PNBLACKLIST[usb-modeswitch-data] ?= "Runtime depends on blacklisted usb-modeswitch"
-
-PNBLACKLIST[usb-modeswitch-data] ?= "Runtime depends on blacklisted usb-modeswitch-data"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
similarity index 68%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
index 5211d7b..503b595 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libusb1"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "f323fe700edd6ea404c40934ddf32b22"
-SRC_URI[sha256sum] = "2752103de171ed5f6c8d6a6e3e73e16c9ee3e8e394dd39c5991f7680eb908a3a"
+SRC_URI[md5sum] = "38ad5c9d70e06227a00361bdc2b1e568"
+SRC_URI[sha256sum] = "31c0be280d49a99ec3dc0be3325bef320d9c04b50714ef0ce1e36a614d687633"
 
 EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
 
@@ -17,5 +17,3 @@ RRECOMMENDS_${PN} = "usb-modeswitch-data"
 do_install() {
     oe_runmake DESTDIR=${D} install
 }
-
-PNBLACKLIST[usb-modeswitch] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130620/"
-- 
1.7.10.4


