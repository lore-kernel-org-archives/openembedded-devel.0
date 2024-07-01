Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CB4C3065A
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 18:20:03 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.266.1719848997874850941
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 08:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m5jw2b+y;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: semc.2042@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f70c457823so13044955ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719848997; x=1720453797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cpWmiFcg3VxliOueAFWs5FmrWbX0B1TCbMIUUqj0eNU=;
        b=m5jw2b+yxMsk3UvM9mAXp+gy6OfnNn1qkV3vku+F7057z3vd25RPN6QFpeahLHmwMh
         pb0wUYm8w0oaW8v1ISD4mw/4AebiTh6WGMbID3aUGaIPLEI7IujVHzk0sawyHhZTkE2N
         8iSoPkTssU4iAnD7rZ4yvLuv6FbeqGJPyHnHMQ7vSmo59Sci+dB94KvGjN2rTF0z3AHd
         WPkdpxCD9fL5VpNojC7S7w9lQUgYLRkpDWxFNIisAp7J1YMK8k8xi+nWLwW5Z23xx3ci
         Me51IgaXr41/k0aARSzyHfXE1mzGHJwatlLMrKhZ1jTVPVD2OLISqJ/3LdbFJEWpg4TT
         uh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719848997; x=1720453797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpWmiFcg3VxliOueAFWs5FmrWbX0B1TCbMIUUqj0eNU=;
        b=bRi6nd+5QEeaH8R2DlK7PV1lSF2ok1bE2fQ/Vi4cn2tq0S4Cn4sZtXITpQ7oujEWGk
         Ak9/Ncnw0uAU0AoOALHEHfBMntgy15DEfPkq1kwV+uwnm3xSucR/9SYIVNEP88DyD7nP
         daVajFzt7FNxgGvO3kS5IQwYIRP0vxZGLmnEvsrop2SFAhrFz8BB6HICrFX6Bel0ftYd
         QejDlV4dRbOpLU3bNraxKi63p/guYdhbAD4QDbLufCFPhV9qDXJwTNDREY6r9XwoRQDs
         VyNB+tqzUkig9IvFA37TRZVKvA6HlqeHdNIYhy92AtTAO2nfUAc/FHcdzu5FBBB/P3FI
         7hxg==
X-Gm-Message-State: AOJu0Yz9ap7eBuhROeAwt0PtRv8CbyytT9OOaDyT+xYkfndjTVwlfpCO
	9BLop8iUUAyPH8o87g+QpLX9MOaL7LL6TE61pAsrHSnjzyWlnkrLFhj+9A==
X-Google-Smtp-Source: AGHT+IEcZUgBVEuITWTQcT2TqG2nxbyq5XTNFlWMWLCrBEZZFmQ5Tw1+Kjagq0CFhFBwkepy3xeHzw==
X-Received: by 2002:a17:902:f54e:b0:1f9:c701:1cbe with SMTP id d9443c01a7336-1fadbd08db9mr38039425ad.57.1719848996996;
        Mon, 01 Jul 2024 08:49:56 -0700 (PDT)
Received: from L-16522.kpit.com ([49.207.233.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fad0662e77sm57881465ad.229.2024.07.01.08.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 08:49:56 -0700 (PDT)
From: semc.2042@gmail.com
To: openembedded-devel@lists.openembedded.org,
	semc.2042@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-networking][scarthgap][PATCH] unbound: Add ptest for unbound
Date: Mon,  1 Jul 2024 21:19:49 +0530
Message-Id: <20240701154949.594159-1-semc.2042@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 18:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111205

Adapt the compile 'test' phony target from Makefile and deploy as
ptest for unbound.
All test are successful on a trial and took around >10min and <12min.
Duration of ptest execution was 626 seconds on an average.

Signed-off-by: rajmohan r <semc.2042@gmail.com>
---
 .../recipes-support/unbound/unbound/run-ptest | 17 +++++++++++++
 .../recipes-support/unbound/unbound_1.19.3.bb | 24 +++++++++++++++++--
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/run-ptest

diff --git a/meta-networking/recipes-support/unbound/unbound/run-ptest b/meta-networking/recipes-support/unbound/unbound/run-ptest
new file mode 100644
index 000000000..38a3ee792
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+cd tests || exit 1
+retVal=0
+./unittest
+./testbound -s
+for x in ./testdata/*.rpl; do
+        output=$(./testbound -p $x -o -vvvvv 2>&1)
+        if test $? -eq 0; then
+                echo "$x : Pass"
+        else
+                echo "$output"
+                echo "$x :Fail"
+                retVal=1
+        fi
+done
+exit $retVal
diff --git a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
index ffdc78e9d..87fe15335 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
@@ -9,10 +9,13 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
-SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.19.3"
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.19.3
+           file://run-ptest \
+          "
+
 SRCREV = "48b6c60a24e9a5d6d369a7a37c9fe2a767f26abd"
 
-inherit autotools pkgconfig systemd update-rc.d
+inherit autotools pkgconfig systemd update-rc.d ptest
 
 DEPENDS = "openssl libtool-native bison-native expat"
 RDEPENDS:${PN} = "bash openssl-bin daemonize"
@@ -32,6 +35,10 @@ do_configure:append() {
 	sed -i -e 's#${RECIPE_SYSROOT}##g' ${B}/config.h
 }
 
+do_compile:append() {
+        oe_runmake tests
+}
+
 do_install:append() {
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unitdir}/system
@@ -40,6 +47,19 @@ do_install:append() {
 	install -m 0755 ${S}/contrib/unbound.init_yocto ${D}${sysconfdir}/init.d/unbound
 }
 
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        install -d ${D}${PTEST_PATH}/tests/testdata
+
+        install -m 0544 ${B}/unittest ${D}${PTEST_PATH}/tests/
+        install -m 0644 ${S}/testdata/test_signatures* ${D}${PTEST_PATH}/tests/
+        install -m 0644 ${S}/testdata/test_sigs* ${D}${PTEST_PATH}/tests/
+        install -m 0644 ${S}/testdata/test_ds* ${D}${PTEST_PATH}/tests/
+        install -m 0644 ${S}/testdata/test_nsec3_hash* ${D}${PTEST_PATH}/tests/
+        install -m 0544 ${B}/testbound ${D}${PTEST_PATH}/tests/
+        install -m 0644 ${S}/testdata/*.rpl ${D}/${PTEST_PATH}/tests/testdata/
+}
+
 SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 
 INITSCRIPT_NAME = "unbound"
-- 
2.34.1


