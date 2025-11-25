Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85B9D0EE25
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:43:49 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4011.1764103423291037315
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g7Vzes7t;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b387483bbso4529859f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 12:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764103421; x=1764708221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4S+enCR8+7yuFP52bvcWHYr5DAODABT+WM941qM2zEM=;
        b=g7Vzes7tKMck7tdA0i+G0ImqJNPRoaydVvN5qw0PaVFXik1+Ya1HF/4avVs41bSxoe
         UKhx8vGp2rizDD6p3/FSMQ7gHVjLigYpW6CtpXq4Mb+7GOLGbpFSiDVdJBj8n5LTIEmi
         3jXfFz1ps3dAb7kBYDv4rcJdnUrfTYjkwmyhn6G42JfOLdgHvckD+uUQZkAl8rpqI/fV
         zmXIm6Z/ntKUT1dcV2mVcMkLEjzvz+BOzRpIB4qtFsLNTF/CrtcGaoJlLhxtKF+SgN9l
         BZ3Tzf+KL/F8vLpndY7+iQxK7wq6CPhz0lzQIGnfMxwMhTFtzGI2Zmzu3C0nF2ICkHiA
         DZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764103421; x=1764708221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4S+enCR8+7yuFP52bvcWHYr5DAODABT+WM941qM2zEM=;
        b=bSTm2ThPkCbQEufqgwqQXf13WYVwM8gU9+4cBIZ4SXZayxbiYT8B7wdUffgGDlt0Rp
         7KldfeEGpN6192G8+Gu0bdZL7YXP1gEGTDRCbVPyWDxQALHizqXYRaRFVK8RS2HZgpDN
         hGoGWno+4YmsQtt7cTJke63Z7OEpAMnhS+L2Fc4cdQ9cheTRHo5ttVs/4CKUdTz9gvzu
         UmHdfRXjCQgCNIXD73jB4iyjtsXNFOq9vS7MRYgszv2R/qhAXm/OyXB/b2xwzy1jNMpk
         jL/73eKZ0hfvpXXENoYTk3cVfVKt6YK+TSfOXeyMiqANQDNB7K4m70cuHXDkziCy71S7
         pQgg==
X-Gm-Message-State: AOJu0Yy3gexprkIB+eL84F1uIo6c8oAnSr4oGZwmO5GAPYhU3x5HJ7h0
	8P0eEgsppRaKRrUYh/Zwdv3Y40UJG+mw49wpRLi0VGfC962qrVfg7bHCMbSGOQ==
X-Gm-Gg: ASbGnctO2ET32s6odQXbmF4AzSgFNrUGSd4FWKidLUAFRNzBJDPUhXzIA8Vag3QPBE3
	uwHRbnlUfO8uDUlJOEJMpOnLCONDEBvGRuCXbnTjrhZ8HZ+C6Ee2nF+pAqK+yYgdhuAr6s5atR1
	eo1F+0mYAiAiv/2XVdzosvGoGuZSSm95uHf5+GcK3L6UlWyCffGdNDv3euvHD59D+YZMAruVwjR
	fu0QrZ+2iYP7goJ7107dOPeKGD1Kj/UjXCYXdQT+xw6V0QRMwmf1LeMWu2RCcDTUOGFQUSEsrKt
	WeeayvGgoSPXb1m1rgMVwFS8pn9YLno8pXrldEqFk8ApI6FF+6AkiPmzSSC2KbOTbN9y0lY/w9y
	ayX6nKrUNmwiiGYozPLnATh//PuCVYZidEtITqX/mQnLOZ4zBmM5YRnx+R+DCtuyXiSu48S4HyY
	Vg1WEOiOD+c2imPQ8DV10=
X-Google-Smtp-Source: AGHT+IHhaLBw9iTIHDfg4wc7rmy8ARsgdX10t3tyvCFFb3fwnX/0gAYjI28GqgjPtz9f5WP10If2Zw==
X-Received: by 2002:a05:6000:2504:b0:42b:5448:7ae8 with SMTP id ffacd0b85a97d-42cc1d2d6fcmr17482209f8f.29.1764103421243;
        Tue, 25 Nov 2025 12:43:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a76sm36424934f8f.24.2025.11.25.12.43.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:43:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] xrdp: add ptest support
Date: Tue, 25 Nov 2025 21:43:40 +0100
Message-ID: <20251125204340.4163857-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 20:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122063

It takes under 10 seconds to run the suite.
Executed succesfully on x86-64, with musl and glibc.

The recipe requires pam DISTRO_FEATURE to be present.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 meta-oe/recipes-support/xrdp/xrdp/run-ptest   | 13 +++++++
 meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb | 37 ++++++++++++++++++-
 3 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index bf3f92057f..52ca06ae43 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -53,6 +53,7 @@ PTESTS_FAST_META_OE = "\
     utf8proc \
     uthash \
     xmlsec1 \
+    xrdp \
     zeromq \
     cjson \
     libplist \
diff --git a/meta-oe/recipes-support/xrdp/xrdp/run-ptest b/meta-oe/recipes-support/xrdp/xrdp/run-ptest
new file mode 100644
index 0000000000..4db66da65e
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/run-ptest
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+RESULT=0
+cd tests
+for t in $(find . -type f -executable); do
+    ./$t > $t.out
+    ret=$?
+    if [ $ret -ne 0 ]; then
+        RESULT=$ret
+    fi
+    sed -e "s/^ok/PASS: /g" -e "s/^not ok/FAIL: /g" ./$t.out
+done
+exit $RESULT
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb b/meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb
index cd45d27fe4..8203ada8e5 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=72cfbe4e7bd33a0a1de9630c91195c21 \
 "
 
-inherit features_check autotools pkgconfig useradd systemd
+inherit features_check autotools pkgconfig useradd systemd ptest
 
 DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native imlib2 pixman libsm"
 
@@ -12,6 +12,7 @@ REQUIRED_DISTRO_FEATURES = "x11 pam"
 
 SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://xrdp.sysconfig \
+           file://run-ptest \
            file://0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch \
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            file://0001-mark-count-with-unused-attribute.patch \
@@ -25,8 +26,9 @@ UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 
 CFLAGS += " -Wno-deprecated-declarations"
 
-PACKAGECONFIG ??= "fuse"
+PACKAGECONFIG ??= "fuse ${@bb.utils.contains('PTEST_ENABLED', '1', 'test', '', d)}"
 PACKAGECONFIG[fuse] = " --enable-fuse, --disable-fuse, fuse3"
+PACKAGECONFIG[test] = " --enable-tests, , libcheck cmocka"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM:${PN} = "--system xrdp"
@@ -77,6 +79,37 @@ do_install:append() {
 	chown xrdp:xrdp ${D}${sysconfdir}/xrdp
 }
 
+do_compile_ptest() {
+	for testdir in $(find ./tests -type d -mindepth 1); do
+		cd $testdir
+		echo 'buildtest-TESTS: $(check_PROGRAMS)' >> Makefile
+		# change the test-data folder to ./data instead of ${S}
+		sed -i 's|-D TOP_SRCDIR=[^ ]*|-D TOP_SRCDIR=\\"./data\\"|' Makefile
+		# another test data folder redirection
+		sed -i 's|-D IMAGEDIR=[^ ]*|-D IMAGEDIR=\\"./data\\"|' Makefile
+		# and another
+		sed -i 's|-DXRDP_TOP_SRCDIR=[^ ]*|-DXRDP_TOP_SRCDIR=\\"..\\"|' Makefile
+		oe_runmake buildtest-TESTS
+		cd -
+	done
+}
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests/xrdp/gfx
+	install -d ${D}${PTEST_PATH}/tests/data/xrdp
+	for testbin in $(find ./tests -type f -executable -mindepth 3); do
+		install $testbin ${D}${PTEST_PATH}/tests/
+	done
+	install -m 666 ${S}/xrdp/xrdp256.bmp ${D}${PTEST_PATH}/tests/data/xrdp/
+	install -m 666 ${S}/xrdp/ad256.bmp ${D}${PTEST_PATH}/tests/data/xrdp/
+	install -m 666 ${S}/tests/xrdp/*.bmp ${D}${PTEST_PATH}/tests/data/
+	install -m 666 ${S}/tests/xrdp/test1.jpg ${D}${PTEST_PATH}/tests/data/
+	install -m 666 ${S}/tests/xrdp/test_alpha_blend.png ${D}${PTEST_PATH}/tests/data/
+	install -m 666 ${S}/tests/xrdp/gfx/* ${D}${PTEST_PATH}/tests/xrdp/gfx/
+}
+
+RDEPENDS:${PN}-ptest += "imlib2-loaders"
+
 SYSTEMD_SERVICE:${PN} = "xrdp.service xrdp-sesman.service"
 
 pkg_postinst:${PN}() {

