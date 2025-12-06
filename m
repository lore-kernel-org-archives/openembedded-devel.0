Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CBFD3B7DC
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 17:59:22 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11943.1765043953983090427
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Dec 2025 09:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OeMxPI06;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so39856315e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Dec 2025 09:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765043952; x=1765648752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWD+qW9WCaUc2RSZGBWXPRtAOBuglU1VWDICS49AL2k=;
        b=OeMxPI06ACil4REfKowghlU4ZyYVN7CFD0tcRflgFSzpytBj/eupzDyuABDU3QPvto
         +LJQSw9KY0gC5Atm4h+Qk5bcUuy51+p5J1/8AiyTVzmdJjPce/gg2l5ElCPkZZUKVQfV
         rmPKlu79up15TI2yvro8VwV2wmxVfcSJbajU6jpIne6cUGYE3+1f9oeY7ssfaeywTl7I
         3UYkAU0WE8F9MgxJgPqk7OXY711D9+10l1nc5hL5v58sigqcAQPJEd6rWpUgOMx79PzW
         T3EDYjgnDKj8WCy478ZQe3+dqxIw6hKz+DiJKifQSLBiTATjsNu6H3xdH8CcQWTM+QTe
         wyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765043952; x=1765648752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWD+qW9WCaUc2RSZGBWXPRtAOBuglU1VWDICS49AL2k=;
        b=f4wRILIEGZCkJDdf93VemF0dY4qFNFUlxS9mSETwSlR1h46cQTHxKZFAYmPH8sNxV+
         jWkVMjqIZ5Gj1cL+QSQWLePfa5VbMpS1g8ORr+8vwH7PEZWm+89oKo6VRTv6t9rMES0U
         Tn5B6h8Xr2cCWaFKafPP2Nb8PYTlFijW3R3/RpQO5sXBpdmzo5hn9fIx/GaGr5ASJ8Ws
         lGX03fp7k0wsPcCeiHOWiSn+QgcoiPd/kOyoEHe3YN2oyeytXBtHTPn/7ozqDE3kiWft
         Sga52TSz+noxmLyjGEsACymIpSjNbCk8nArkHWkx2Dx/jLpQmjT2dVReBPjihAf20ldt
         L8QQ==
X-Gm-Message-State: AOJu0Yzfkbza12HodsOjPUnCUBrmYatysOdbYDiG8Nz4eS9AvHq3T3tm
	dboORpSpupDELaoVouW9S9n6OqNBPghtK6g4Rft4XoOQ30lTOrtoeqDc/Td0rQ==
X-Gm-Gg: ASbGncubZwC6+QohO4CQX/aqvbw69e5sQd8vmAbQIhi0DzKVkdFTPii6ROuv2Kmcq0q
	2uEljhJsVf6KpzBafsIpEt8D5m19oAvSgVQhf5suhM85t+flR+LV8lLmEh+LA3UGQcrVgAN7U+1
	iyw6z8TcWPNtADGTk7IaJ8ekKXpdq/8NnhnxeUQswOwM9F4cTwYPGecdsnfIXeoLr6XfvsOVFd2
	OPh2qT5Lq4SJOxJGPaQv2vaAf4a0mVsGcnSnsaGF63b2z9bwKzreRXd7zx3gLV+tugl/sfQKlyS
	GNaLnyrJ+MucRj2JWWzbLdkBLa+9rT3pGuYjZoUmp44hgXKlJPucb6EiuNyVDSuvLbpaTX0j1J7
	eD0y3hZDlp7MtOj+VPrMv7ctbJ91p1Y8sKfTdMuoi3oOCJxn1BJH2uitwe8Ac39aKDyVJ5GybuJ
	QTqk8da9cg8Lxru2VSJxE=
X-Google-Smtp-Source: AGHT+IEqjkwuKnee9y/eVCzeNpCG/Nv3awW5iYKc3rrafgn8VAWLamgmTGfHD6qFwx462Tssixz0kA==
X-Received: by 2002:a05:600c:1ca5:b0:475:e007:bae0 with SMTP id 5b1f17b1804b1-47939e20b01mr40947175e9.16.1765043951818;
        Sat, 06 Dec 2025 09:59:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6dc7sm144953095e9.3.2025.12.06.09.59.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 09:59:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] xrdp: add ptest support
Date: Sat,  6 Dec 2025 18:59:10 +0100
Message-ID: <20251206175910.3426096-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Dec 2025 17:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122362

It takes under 10 seconds to run the suite.
Executed succesfully on x86-64, with musl and glibc.

The recipe requires pam DISTRO_FEATURE to be present.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 54ca51b6c6c90ad464a488e1ee271d3fff708955)

Adapted to Kirkstone
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/xrdp/xrdp/run-ptest   | 13 +++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb | 35 +++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/run-ptest

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
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
index 5526027712..48d451ea8c 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
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
            file://0001-Fix-the-compile-error.patch \
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
@@ -31,8 +32,9 @@ SRC_URI[sha256sum] = "f76aa16034689bb8997e56fd554db29ba57caa1bab228a6eda28be4389
 
 CFLAGS += " -Wno-deprecated-declarations"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'test', '', d)}"
 PACKAGECONFIG[fuse] = " --enable-fuse, --disable-fuse, fuse"
+PACKAGECONFIG[test] = " --enable-tests, , libcheck cmocka"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM:${PN} = "--system xrdp"
@@ -79,6 +81,35 @@ do_install:append() {
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
+	install -d ${D}${PTEST_PATH}/tests/data/xrdp
+	for testbin in $(find ./tests -type f -executable -mindepth 3); do
+		install $testbin ${D}${PTEST_PATH}/tests/
+	done
+	install -m 666 ${S}/xrdp/xrdp256.bmp ${D}${PTEST_PATH}/tests/data/xrdp/
+	install -m 666 ${S}/xrdp/ad256.bmp ${D}${PTEST_PATH}/tests/data/xrdp/
+	install -m 666 ${S}/tests/xrdp/*.bmp ${D}${PTEST_PATH}/tests/data/
+	install -m 666 ${S}/tests/xrdp/test1.jpg ${D}${PTEST_PATH}/tests/data/
+	install -m 666 ${S}/tests/xrdp/test_alpha_blend.png ${D}${PTEST_PATH}/tests/data/
+}
+
+RDEPENDS:${PN}-ptest += "imlib2-loaders"
+
 SYSTEMD_SERVICE:${PN} = "xrdp.service xrdp-sesman.service"
 
 pkg_postinst:${PN}() {

