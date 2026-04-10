Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF79E98FDF
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 06:53:23 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.150376.1775803295223432512
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 23:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bGZ/Vpg4;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: jackson.james9803@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b24fede2acso9824915ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 23:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775803294; x=1776408094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up53CPgqbAF5TVuh5n+wiMyfDrUQO1Czns/QS2i8AN8=;
        b=bGZ/Vpg4RG8YsMI3XqEhJCr0TqPdU9g8BhMYivc9sfy2sUVzWQQ+rLC8JdnW77OHNP
         P4Ckg5VxQl5IPt5QsmbFZ4h3NDh1mLbQSEuGlKPifn6PqcY9PY0+DAWy7Cia7mIkI0As
         p0y9aR8a5ZEXiHW/1nsgjj9mTd/1HFjCtOqO1faqNfQsdBERtxkx1NsQ7vWyhQqYo+o8
         iAZaCw0+VpLOv4E2lxvPeTG0Zb+g1DMOENWNZca++1OM8ssev0/61saihIRry1c/C6Si
         lTEKqGT934PEYIMt3m2WP9eDPzrnwHw/TQL82zEBKdhA5Q5GdgbupOA+IYfcke2kUGnI
         khHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775803294; x=1776408094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Up53CPgqbAF5TVuh5n+wiMyfDrUQO1Czns/QS2i8AN8=;
        b=L6jbmorrKlpCFLVkrct/+JCEuij2lNKwG2sCKOY/j1nRWQJjOyQWD9Tl2EVQyvhcQC
         tHqqdT6V0falt35JMvqjLPfEDG7Rv3sCDesiH3eNm9LH8oLAblThQ0uLxwwkG4tBuzCv
         TNqyh1+7iMEVluF8HNPWjaUejK9cjvlB2NITIKbHd/JgehT8jVH/T6AVY1WmZUuWOzRf
         lcLLVumYH1tImL9Gntk8gqvUQlZ8U8PzjAlVeQmO9/ngGhmngjX/APTrHf/ukQtjGk6E
         oDTCrz5OqTWWPwUhkilu9peq8XIzIH8gDHQ55J2WGrk77KZ13XhESJa7ECuF/jkDkV+X
         Elgw==
X-Gm-Message-State: AOJu0Yxiimk5tlo/4PfNfSyFSTzkpGM9oaMcf7ee2alUpXkIVdv626Uh
	iJ1zxrsx7/1P9pCv8L0DOxDD/csZJPRPnis7fME7nMUcCfoy2hGvm88swavzHA==
X-Gm-Gg: AeBDiesgKG19HUQNJTclX3Z1l/My6LlMJqZT5rhsz3CFMTUXl2ArmTjiAsR4zDlnMo+
	DpnwuswshKEnb69fWEudvI1Q5mfIKK64HAZQCZPnP48c36kX08gJMCdOeU1hNcMdgORJ0t7Der/
	Dr1CZFilv67I06GCpmzwqBjcRJor3mKI3yIx96p7gvQ4PvWbLY9++KmB+jDrYJPJh3wNEb2rqvN
	Co9wOV3ii3mepiqvxHWlW5JuBIrnI0tK24oyswVwY/a+RahPzweGbGhPXtcGl18A2bOq3xsmwYI
	07ALH/or4ob+vnA1XT59bYoWa01uYqtHeM8d1RLlfg4ffueh9o1E3wmrp7NV/sPZmWzi0swEjg/
	SvH0i97CIR+OyQKER94lsElqjsOGAaKAnP7ZjL5tRv5blyUUMv/gRLHrIqVKB1QRgAXIwVJ9IVc
	AbMs+92t2AX5wgCp0UcBiyMOSRC5w=
X-Received: by 2002:a17:903:acf:b0:2b2:497e:3f6d with SMTP id d9443c01a7336-2b2d5940e59mr21787055ad.8.1775803294239;
        Thu, 09 Apr 2026 23:41:34 -0700 (PDT)
Received: from LL-868L.kpit.com ([103.155.223.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f25d83sm16954005ad.58.2026.04.09.23.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:41:33 -0700 (PDT)
From: Jackson James <jackson.james9803@gmail.com>
X-Google-Original-From: Jackson James <jacksonj2@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: jacksonj2@kpit.com
Subject: [meta-networking][scarthgap][PATCH 2/2] unbound: Add ptest for unbound
Date: Fri, 10 Apr 2026 12:11:13 +0530
Message-Id: <20260410064113.1498301-2-jacksonj2@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410064113.1498301-1-jacksonj2@kpit.com>
References: <20260410064113.1498301-1-jacksonj2@kpit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 06:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126219

Adapt the compile 'test' phony target from Makefile and deploy as
ptest for unbound.

All test are successful on a trial and took around >9min and <10min.
Duration of ptest execution was 587 seconds on an average.

The previously used minimal CVE-2025-11411.patch caused ptest failures.
This update switches to the complete upstream patch
for CVE-2025-11411, which resolves the ptest issues and applies the
complete security fix.

Reference to master ptest:
https://git.openembedded.org/meta-openembedded/commit/meta-networking/recipes-support/unbound?id=d8f21b1dc87408aa86336970e4cb9a9a36a0950b

Signed-off-by: Jackson James <jacksonj2@kpit.com>
---
 .../recipes-support/unbound/unbound/run-ptest | 29 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.19.3.bb | 22 +++++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/run-ptest

diff --git a/meta-networking/recipes-support/unbound/unbound/run-ptest b/meta-networking/recipes-support/unbound/unbound/run-ptest
new file mode 100644
index 0000000000..3801233eeb
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/run-ptest
@@ -0,0 +1,29 @@
+#!/bin/sh
+
+cd tests || exit 1
+retVal=0
+if ./unittest; then
+    echo PASS: unittest
+else
+    echo FAIL: unittest
+    retVal=1
+fi
+
+if ./testbound -s; then
+    echo PASS: testbound selftest
+else
+    echo FAIL: testbound selftest
+    retVal=1
+fi
+
+for x in ./testdata/*.rpl; do
+	output="$(./testbound -p $x -o -vvvvv 2>&1)"
+        if test $? -eq 0; then
+                echo "PASS: $x"
+        else
+                echo "$output"
+                echo "FAIL: $x"
+                retVal=1
+        fi
+done
+exit $retVal
diff --git a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
index 6841049ac5..2489e3c235 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
@@ -10,6 +10,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;nobranch=1 \
+           file://run-ptest \
            file://CVE-2024-8508.patch \
            file://CVE-2024-33655.patch \
            file://0001-CVE-2025-11411-1.patch \
@@ -21,7 +22,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;nobranch=1 \
            "
 SRCREV = "48b6c60a24e9a5d6d369a7a37c9fe2a767f26abd"
 
-inherit autotools pkgconfig systemd update-rc.d
+inherit autotools pkgconfig systemd update-rc.d ptest
 
 DEPENDS = "openssl libtool-native bison-native expat"
 RDEPENDS:${PN} = "bash openssl-bin daemonize"
@@ -41,6 +42,10 @@ do_configure:append() {
 	sed -i -e 's#${RECIPE_SYSROOT}##g' ${B}/config.h
 }
 
+do_compile_ptest() {
+        oe_runmake tests CFLAGS="${CFLAGS} -USRCDIR -DSRCDIR=${PTEST_PATH}/tests"
+}
+
 do_install:append() {
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unitdir}/system
@@ -49,6 +54,21 @@ do_install:append() {
 	install -m 0755 ${S}/contrib/unbound.init_yocto ${D}${sysconfdir}/init.d/unbound
 }
 
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        install -d ${D}${PTEST_PATH}/tests/testdata
+
+        install -m 0544 ${B}/unittest ${D}${PTEST_PATH}/tests/
+        install -m 0544 ${B}/testbound ${D}${PTEST_PATH}/tests/
+        install -m 0644 ${S}/testdata/test_signatures* ${D}${PTEST_PATH}/tests/testdata
+        install -m 0644 ${S}/testdata/test_sigs* ${D}${PTEST_PATH}/tests/testdata
+        install -m 0644 ${S}/testdata/test_ds* ${D}${PTEST_PATH}/tests/testdata
+        install -m 0644 ${S}/testdata/test_nsec3_hash* ${D}${PTEST_PATH}/tests/testdata
+        install -m 0664 ${S}/testdata/test_ldnsrr* ${D}${PTEST_PATH}/tests/testdata
+        install -m 0664 ${S}/testdata/zonemd.example* ${D}${PTEST_PATH}/tests/testdata
+        install -m 0644 ${S}/testdata/*.rpl ${D}/${PTEST_PATH}/tests/testdata/
+}
+
 SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 
 INITSCRIPT_NAME = "unbound"
-- 
2.34.1


