Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091FAEA3C5C
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 06:53:43 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150651.1775803417739455933
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 23:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R6uiT3dm;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: jackson.james9803@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-60579b9c0ccso1322229137.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 23:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775803416; x=1776408216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up53CPgqbAF5TVuh5n+wiMyfDrUQO1Czns/QS2i8AN8=;
        b=R6uiT3dmCBUr4Y43Uf9ERQhklLqA/4d+sB94jP/ViR0kv1+2K2jJ5dN+U5KpqjSRyf
         1f3HFm8uqX4Cc3YRFYH6pF4hyjkH1xh9IMlf+oObRqBnLnob+P0jdUucettg0nHdlaS1
         MlakpoAYuHrOMbwvslAcAzGqGneaWG98WL3qDsQltBPt0ldHzTujRmNrjeWgIazo9+JF
         KMPxYdlVtE87kp4+tRkLOmJ5s6bHROyx5Tq3TsyjH/J/y8XSjjKRMj6hsWMO2/N8v67T
         NvYbU8Coy7GDhGt0nQTsspYqcmhOj59sAqn0fF1tGyK21RZhCd6dQbQ8oaeK7CAlutax
         2eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775803416; x=1776408216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Up53CPgqbAF5TVuh5n+wiMyfDrUQO1Czns/QS2i8AN8=;
        b=nCT0IAEkaLdZBOmLIESHAVzcFaGtzPlDA1gJxdvFptMBdigPkn8H35nJQWF1eMgXAR
         gu9Bhsf2eTMWG4Avr2kxPaO60EDIbYIGG+x/PKVWy2ih5XNQhnq4MY42MPID9RwnZNag
         50vndryytJ4YbKiCxc0ATpIKMrf+OhcI2WlbrjgjaCbNuofh2O7yuoxLbU5wu+auDoeX
         sjhkN0g0CEumZxLlbunO0SWnW2cgBYA7K2R4Pe3hbusSxMHQXVi/vy+DjTQegPG1ev0Z
         bVYgUpiCe5N+u5R2JhvVV75t8LVEkpz0CACM14hb7YWYb5U8IvjS9t9vG4Dod7QlhkUt
         RyMw==
X-Gm-Message-State: AOJu0Yxmc//IT7o2grgHQeYHAqKpQbdG+4uEJpI+DxSGmjY2JFq7MBDD
	8kSmPvCYBtlR6YpyUR+uO+LH3ksnj1oE9HDHqSL/XECyQIvNcX8bZUDBV+bGWw==
X-Gm-Gg: AeBDiesNrMsQJ5iESFLs9guY756siOGTi9tNxWHEMyJpCXnROJKcILh6iFbSkJHrapA
	r30Zq0j/e6gHr33DYKspja6pT5rkvya+L0ZU4h3O39UAwYG+vl1vB94yZ7rS52GVjcDNSIdNnBd
	o/YSHzbTnvAIh4keO5biMNuAoTiGFoaagrCfx2lFI5EuYcIa6ex9etKdFi43neNQB3l5iFMa6aL
	/VIaA1SOXOMS2bZdLxBuhNs2DL3w49yY+fPlEQx6L0J2XEH3FxMrX4PMrdJCMVDAGCk0R8zch51
	W8tKeKWa+4I2D4C3sE4t01ONp5M1rQZT6Hrz03Lwcay2vPvtJa/aDGYg39hRR1N0pGu5FNXOWZO
	FLu2N8d7U+l6Dd1y0xVGu9Is/IdD/hPNqbBd+8i/a5yCOIHyroqtPRzscnjQqqHwzdUFle/hHTw
	BVxZCLJnqGGIyk9MmVqOj+VVVzdvY=
X-Received: by 2002:a17:90b:33c6:b0:359:15c8:e8e1 with SMTP id 98e67ed59e1d1-35e42847a4dmr2061780a91.25.1775802998816;
        Thu, 09 Apr 2026 23:36:38 -0700 (PDT)
Received: from LL-868L.kpit.com ([103.155.223.83])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e34fdc4bcsm5424213a91.7.2026.04.09.23.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:36:38 -0700 (PDT)
From: Jackson James <jackson.james9803@gmail.com>
X-Google-Original-From: Jackson James <jacksonj2@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: jacksonj2@kpit.com
Subject: [meta-networking][PATCH 2/2] unbound: Add ptest for unbound
Date: Fri, 10 Apr 2026 12:06:13 +0530
Message-Id: <20260410063613.1489769-2-jacksonj2@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410063613.1489769-1-jacksonj2@kpit.com>
References: <20260410063613.1489769-1-jacksonj2@kpit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 06:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126221

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


