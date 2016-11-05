Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8F0A371A00
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Nov 2016 18:00:36 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y68so11383296pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Nov 2016 11:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=+ruG7JSMlAa/QmASqYdkKNAYJZhUaqXuzwvqFhnHlvQ=;
	b=Hxmc4PqA+diESA4pnpIwab1tz3SebOX7io8PM84CJd4CExNzi8K/cI8jt2YxpxAUbN
	dhj6hzpvxZO9DpVK7iJluK+9yMxe97vPy1b0F6k6OJE2BDKdQcwCde/fX1vKllzDwJMp
	gSq+QnlQNL57LBH4A/4dn2ZEj3qxuI4SYUEjI6xSb6kVipG+Ii0/Zq4b6SK5qM+xXRED
	E/QnikdbEgJehsLzVAfxf7SpUj8Btc+jJx3Vfd76G3+BoVhnOwaJdFmFKM+amMVvv+3x
	hE87bI5JXDFlOGRLVO56LWSzP0KjcgQXEoyM8EEhbPzwjlZcFUQY1DAHbk8/L34ziBJn
	rtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+ruG7JSMlAa/QmASqYdkKNAYJZhUaqXuzwvqFhnHlvQ=;
	b=RVAIL8kqd+RVWGv3EsA9PyzjbfdckZSzdks8nvNtA/9pWZYjB3bQSIG2dwjjWNZUnB
	SwaVlwHJMa7FHbGa6lR6lTGWo8rLaKujx5xUAr5lfBBprW4FXgXxSqnyMD5c7msrYE1m
	7h6L0J1jV18HdS7z6rHfuDbPGApv0fYA+kkUpkUTEP32o62kb9GaBEJmkEHy4UsnjSkE
	0k0u6W6n5yvGWa9BM+iGdyx+j6SsWTmmXRiZvv88Npp0+S66A9ab16AiB/stZYhYbREh
	7uV3tBnHEhczAKQeEUZsN62DemL9vx62WXYiUInttuP5/uKHFvXGhUOvzf7QWU97ZRFY
	7k6A==
X-Gm-Message-State: ABUngvf71JzkHK50BBb6XwP9hS1RNxU/z7KCW6oU97XQQsiANLV8L+BycMPFLrp599pRRQ==
X-Received: by 10.99.241.21 with SMTP id f21mr31624975pgi.110.1478368838086;
	Sat, 05 Nov 2016 11:00:38 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:a827:9dec:2e32:f14])
	by smtp.gmail.com with ESMTPSA id
	g78sm29016863pfe.19.2016.11.05.11.00.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Nov 2016 11:00:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sat,  5 Nov 2016 11:00:36 -0700
Message-Id: <1478368836-16477-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][V3][PATCH] wireshark: install missing header files
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
X-List-Received-Date: Sat, 05 Nov 2016 18:00:37 -0000

Wireshark does not install header files. add install_append
Remove ALLOW_EMPTY & INHIBIT_PACKAGE_DEBUG_SPLIT, they are no longer needed

V2]
add missing libssh and sbc config

V3]
restore removed FILES append and fixed missing sbc in PACKAGECONFIG

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/wireshark/wireshark_2.2.1.bb   | 31 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
index a5fb7f6..a8f61fe 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
 
-DEPENDS = "pcre expat glib-2.0 sbc"
+DEPENDS = "pcre expat glib-2.0"
 
 SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
@@ -16,8 +16,7 @@ inherit autotools pkgconfig perlnative
 
 ARM_INSTRUCTION_SET = "arm"
 
-
-PACKAGECONFIG ?= "libpcap gnutls libnl libcap"
+PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
 PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk2 graphics", "", d)}"
 #PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "gtk3", "", d)}"
 
@@ -37,13 +36,35 @@ PACKAGECONFIG[lua] = "--with-lua=yes, --with-lua=no, lua"
 PACKAGECONFIG[zlib] = "--with-zlib=yes, --with-zlib=no, zlib"
 PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
 PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
+PACKAGECONFIG[sbc] = "--with-sbc=yes, --with-sbc=no, sbc"
+
+PACKAGECONFIG[libssh] = "--with-ssh=yes, --with-ssh=no, libssh2"
+
 
 # these next two options require addional layers
 PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
 
 EXTRA_OECONF += "--with-qt=no --enable-tshark --enable-rawshark"
 
-ALLOW_EMPTY_${PN} = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+# Currently wireshark does not install header files
+do_install_append () {
+
+	install -d ${D}/${includedir}/${BPN}
+	install -d ${D}/${includedir}/${BPN}/epan
+	install -d ${D}/${includedir}/${BPN}/epan/crypt
+	install -d ${D}/${includedir}/${BPN}/epan/dfilter
+	install -d ${D}/${includedir}/${BPN}/epan/dissectors
+	install -d ${D}/${includedir}/${BPN}/epan/ftypes
+	install -d ${D}/${includedir}/${BPN}/epan/wmem
+
+	install config.h ${D}/${includedir}/${BPN}
+	install ${S}/register.h ${D}/${includedir}/${BPN}
+	install -D ${S}/epan/*.h ${D}/${includedir}/${BPN}/epan
+	install -D ${S}/epan/crypt/*.h ${D}/${includedir}/${BPN}/epan/crypt
+	install -D ${S}/epan/dfilter/*.h ${D}/${includedir}/${BPN}/epan/dfilter
+	install -D ${S}/epan/dissectors/*.h ${D}/${includedir}/${BPN}/epan/dissectors
+	install -D ${S}/epan/ftypes/*.h ${D}/${includedir}/${BPN}/epan/ftypes
+	install -D ${S}/epan/wmem/*.h ${D}/${includedir}/${BPN}/epan/wmem
+}
 
 FILES_${PN} += "${datadir}*"
-- 
2.7.4


