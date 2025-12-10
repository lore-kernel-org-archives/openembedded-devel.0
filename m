Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F705D3C557
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:26:53 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15646.1765373209031483775
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:26:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fwWoJ8ED;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29d7b019e0eso77566135ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373208; x=1765978008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fggTauIMoFTCfX5sl1oYjr96gkt73u7vWhgDAk6SsQk=;
        b=fwWoJ8EDYqvSQcn14yGmKmFXbKcjZ2yGHziQXWqgs1GGqzAc/byR2zjNH7Z+Vqp2yi
         B+xJxiefl/fWibImbMPBErXG/ypAtwy/dX99q6OQQf3JzTEbk7qC1HwjGtv+gi9MPFZn
         m1KTw9ft9GHd/pPR7wyKIBguh/dr0eRhBaOoabEi9wMnsS9Ld5v9maOPfaQ1OypQYzbl
         /pKf4wBbVuPQcS786QvU7BXsDbDObPD8WaUSrYyr7R6+s1vhBk9B1I/dTEPEPWM1gy2Y
         o+YiebVXqGZR7Kt8KF9WoMcpMrIcKrXwJFuPHv0dU2NqTLIGboyhUjmw+qBBL8o/KBOI
         6IKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373208; x=1765978008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fggTauIMoFTCfX5sl1oYjr96gkt73u7vWhgDAk6SsQk=;
        b=ulgLvL6O7lMQAsMVN1L7WpIlcJTo0YJSo5/E/pzclTFZnrs/mJIZ4RPMo/FY6x85cO
         HAXCVTpN18KMQ+icRY7RhkcBG5McIUbB+xeh1k3p8ZRu48WFUYGmZEhalgevrsqy0FFM
         MK8R+KAXxjzvvM99SdFfvOwLsTewm8oLZ5NLNGcpukr0o3HP1Klk9789dPYulSe1zS37
         R2YE03Rc1XWtsrP+SnHn2wal5+isLBZ7TpURKlFWmBUSisHCvFluB7kA6+6yccrjypdV
         dwL+GklPPHZnJu+uFFoSsaIEO5eC116HbEIRQZQUfPvvenFNi8nHq9cKcPrOZASR+D9d
         G2mg==
X-Gm-Message-State: AOJu0Yz95TqJYEWfDaWgf6DnbjQFlEnLFj11gVA9t9gbQRS0IGsEB5No
	uAhbnrXnd8Pv6RtuXITwf2kY6mOxPeebo1TBGGDQBUJ8Bo3eQRHeea4nxNE2MA==
X-Gm-Gg: AY/fxX6Mn2rcJ+h7eg3Bz+DSianVfMklSnbvfuO5vG0gpwTJtc/EqfQgCkgUdmi69wX
	psBikLigFcaeUQ3wUwqntTMXREVaLqA/PX+kQL/nEZ0EAkjfgCxOSbkvljO7UzEN6maSD7dbXzJ
	IMkjq+N65VLsFjjNp5AqHtGr/peXaP8EjkU8orP025FljQ+XyKijJY6HPvmETGKscpyZyHjn8q8
	1s7JeS7yGiPOQvcj31otWnmNSVKaYqvySj0dDh6qeNTZyTNJD6Bbin0gtfAovdJ42ZRHvks7jWn
	jZZOYwYIhCNwUZy+KLlEjoH04jOiry0V4GG8l9s+5/p1CEE+DEY/B+ZQm1vfEmMl4ZP0DB+lUC4
	h1qCS/fK8A91XHF7Kcj8+d82aEr8Hl1fTgIf92zC2lMlelC9sylUZ/lDbTMs1XNGVGeYmsqX+BB
	VPVkwjnLdGSHGdzogyNWbYgRE=
X-Google-Smtp-Source: AGHT+IHtk3TYXXmShekddHtiH3oPv5kBqJ04w/0Cplz+yVUbqpBO+xsjkPN7sXOP3ikCbqps46lQEA==
X-Received: by 2002:a17:903:2348:b0:290:9332:eebd with SMTP id d9443c01a7336-29ec22cabf3mr21403325ad.10.1765373208174;
        Wed, 10 Dec 2025 05:26:48 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f20bsm182972465ad.46.2025.12.10.05.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:26:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 26/43] xrdp: add ptest support
Date: Wed, 10 Dec 2025 18:56:32 +0530
Message-ID: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122530

From: Gyorgy Sarvari <skandigraun@gmail.com>

It takes under 10 seconds to run the suite.
Executed succesfully on x86-64, with musl and glibc.

The recipe requires pam DISTRO_FEATURE to be present.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 54ca51b6c6c90ad464a488e1ee271d3fff708955)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 meta-oe/recipes-support/xrdp/xrdp/run-ptest   | 13 +++++++
 meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb | 37 ++++++++++++++++++-
 3 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index c43e9b8c2a..a71d3de0ad 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -53,6 +53,7 @@ PTESTS_FAST_META_OE = "\
     utf8proc \
     uthash \
     xmlsec1 \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'xrdp', '', d)} \
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

