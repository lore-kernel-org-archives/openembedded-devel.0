Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94812D116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:48:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3680.1764362925405966651
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QF7DLjTm;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso15421955e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764362924; x=1764967724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VmXXnqdu1bcUry5P5t9Bohc9NhMZRx1x9pxEQzrPM9M=;
        b=QF7DLjTmOs43p+WppXm/N5hyFpgxzUKcos2yyD3JKabhiflU5iY0I+8QVIhcUapTI8
         e7Lbq2uC4RZsUARVy96nkYjcpeYSQ8bujo3ZZkhhGn+JN5vgTvsis873YnpGDXQYRERn
         stqcijYmZRmSJxCiXUfjxzDZ8ZIPr6wkXd8ZL6Gy6n66e+/aGvwKzOehxqJX30o9aQ90
         ZaORM8LvJ1g5upouSac+pi/xkbXQ66OStXRpQFdwcGxpwbyidyvSHWb6BBLvBZAI/CJ5
         zfobnn6wvCUK0xHq38x9wlHgeidRBA1eRwODSka55QmhxV4R84JuQVEKAunzum6d9FbK
         xTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764362924; x=1764967724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmXXnqdu1bcUry5P5t9Bohc9NhMZRx1x9pxEQzrPM9M=;
        b=olXl4xDd4HoBV2e7Y67N1G0DF93yM/1DjBqtlY+e+S5yfmEQtB2IqNkvXEo/r0BGf9
         KNE7f/d1yYl1fmvDvTmze8xwqQslqP7bi2pUe2u+wQqldV59wuZsEs4DIRFYRDYv+LTR
         yuyRMXym10cqRuVshBEbQm+WvSSQhOs+Uo7t8jPSp3MbR+SEhPw4Tp/91YEF0HoYBasj
         2xsL2w0Kk0tRLEXjlB12VCjdjRyvbK5crlnAcSTG3HXOFiQyIWmAVXpOZeqPYJr5qL0W
         kMzkB9PoTofjlyYcfCWs6clwkY70stfJhwiIT1r0GGjitH0eJjRftp9MPCFOmXSobqS/
         787g==
X-Gm-Message-State: AOJu0YwgD1arAwQETpZMoHjBe0aCODzfb+98K31wk7svRGh0WXUKj+7O
	YNDVltVyZNsD2Xtv/QvYi4J52ul1I63qbo9N8sI0cRI5466jPdLMxUv535zPhQ==
X-Gm-Gg: ASbGncvD9+LJhts3UQaVD2/oQEvVpS/xdPRGpTkhBtar0wnZTTXN7bl16paDLBt8wHd
	TVM9/bIUynRuvFFlwMIVIwiVgUlSYvtOeRxoEleIN7c0QORh7RkVyQbMzmfLXamfJE7TSsJTkHy
	m6vkCzDWq138hwh/IkMY5SHuTS/xXbVq/DapUg3e52HqDHyeyTcxqLnM9fUMxDuWpv3H+L8yHy8
	Qv4dj9EW81rA7M4wbMhTfSXK6bqy8VcnCmesD4ktrx9amQ+dIh8UaGb/8ZrDsVQGdsEtWVHjW/V
	k5pSirVLV4Kp6JiTb4vKCUqUOFKA6pYCGodb9ozGYq0R7zwxYxFtyMZN7UhV4U0cw73Z8Hr0+mo
	yscGZxpugtivsZL5cKzpnuTF5QvxINiY3iQFbCndsXGjKPxWmGo/75IEOQ/jhNeqs0pnxWb/vbY
	C6jCCy4sJc
X-Google-Smtp-Source: AGHT+IEAAZ3HskuJ2f8OYezs0RacOHCnBOabm5ez/wsiwJGWDvUgNX84p73/h1WkePdBIR9weBCx/g==
X-Received: by 2002:a05:600c:3541:b0:477:9650:3184 with SMTP id 5b1f17b1804b1-477c0165bc3mr304344815e9.2.1764362923469;
        Fri, 28 Nov 2025 12:48:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm166399485e9.8.2025.11.28.12.48.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:48:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] xrdp: add ptest support
Date: Fri, 28 Nov 2025 21:48:42 +0100
Message-ID: <20251128204842.186288-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122151

It takes under 10 seconds to run the suite.
Executed succesfully on x86-64, with musl and glibc.

The recipe requires pam DISTRO_FEATURE to be present.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: add xrdp to the PTESTS_FAST_META_OE list conditionally,
only if pam is enabled in the DISTRO_FEATURES

 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 meta-oe/recipes-support/xrdp/xrdp/run-ptest   | 13 +++++++
 meta-oe/recipes-support/xrdp/xrdp_0.10.4.1.bb | 37 ++++++++++++++++++-
 3 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 0473b60504..860c09119b 100644
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

