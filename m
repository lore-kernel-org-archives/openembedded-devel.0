Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B259C433EF
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 14:33:51 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.17037.1658673222451545770
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 07:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IM+u2FxR;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id z22so11035348edd.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jul 2022 07:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GoZauq/5y9xeD6JVAMBrAxcZ3NYYCV6UzDiGFgxVqXw=;
        b=IM+u2FxRwJMsGFkKjp17HQKZ9OBDa4cmcHWWhA0t+1EYJIsvFsBjgCHt0/epj2LFqO
         +UQxg+ruKjt2QScnbHu9qjVKzHAWQ0JTe5zejhEPF2BEe+on9T+jxOZc+LuCMxmDyF1t
         9OpH/5xwgufgVd8J2vTShrLJLI66oQWoWepunmcNLdeqeybqPBTVhGlatAw4M9c3mqny
         pumxhllYpobLE/jodoN2KZQAKCCs6vlWKgvugFu+4EwsSxr66dsec+E0Sc+uvNmMDUKM
         QBXYCKkTcGQ/SjXWRTQrAKNBUoiAzxv41+b30mVNu5AgpHLLcZIy74HXCf1weaSvkMq/
         TqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GoZauq/5y9xeD6JVAMBrAxcZ3NYYCV6UzDiGFgxVqXw=;
        b=m5RfIW0r7/J6bte9sqJ2Ovj0ZlCKOht4qoi5Dcw84+bboPUa2KzLCJH6qdbohELuT5
         BQest7ml6Ku0Ht6zvKHGGF3E7+SiKtOaLybZ0j6f82alxNgyLCzFjgie+BB9bZeblHSC
         sgrc5hpN1PKiofF68n+UOOmxAqqA0qThfHLBfDu0HFVRZAPSbMuN1dGITL/BD/UOc3r8
         COiAZIscexGuiyO6lmVHijvBEr8YmmoHzkTCmIQulp5a4/1RWJNHn0nwDQHztRxuNy+Y
         OufkFV/6GxFBCalKJw1Ni9umhPnfDDKvDWT7ajQJ4uDTUqjdEs93bOY1/0phBQUWiPgI
         JBSQ==
X-Gm-Message-State: AJIora8If8tqjZgFlFnTuX9o1Aj/pYB+ppqCEr5IMasIVysXkTLAtGos
	YEaiKbIKQbGKzvIHrWdlNczXEaQ51yEVEg==
X-Google-Smtp-Source: 
 AGRyM1tzVHwtqaWXzPak50/YIrEuAlW5O1WBnbXsvL76e4EErCV6EJVAh6i4Mwtoi2poBInkw/GWaQ==
X-Received: by 2002:a05:6402:5418:b0:435:5a48:daa9 with SMTP id
 ev24-20020a056402541800b004355a48daa9mr9030917edb.304.1658673220688;
        Sun, 24 Jul 2022 07:33:40 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-fij45r00gxfeifntv3v.18120a2.ip6.access.telenet.be.
 [2a02:1812:512:2c00:f099:b041:7b7b:f5bb])
        by smtp.gmail.com with ESMTPSA id
 b27-20020a17090630db00b0072af843c794sm4245870ejb.43.2022.07.24.07.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 07:33:40 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-pyzmq: added ptest
Date: Sun, 24 Jul 2022 16:33:26 +0200
Message-Id: <20220724143327.43832-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Jul 2022 14:33:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97958

And update the summary and description from the github website.

Two tests are failing because cython is not installed.
But this is the same when running pytest under a native Linux system.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-pyzmq/run-ptest            |  3 +++
 .../python/python3-pyzmq_23.2.0.bb            | 25 +++++++++++++++++--
 3 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyzmq/run-ptest

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 0721c6c0d..1d2a9952c 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -515,6 +515,7 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-pyserial-ptest \
     python3-pytest-lazy-fixture-ptest \
     python3-pytoml-ptest \
+    python3-pyzmq-ptest \
     python3-requests-file-ptest \
     python3-requests-toolbelt-ptest \
     python3-scrypt-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest b/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_23.2.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_23.2.0.bb
index 37ec9ec84..3471265e4 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_23.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_23.2.0.bb
@@ -1,4 +1,5 @@
-SUMMARY = "Pyzmq provides Zero message queue access for the Python language"
+SUMMARY = "PyZMQ: Python bindings for ZMQ"
+DESCRIPTION = "This package contains Python bindings for ZeroMQ. ZMQ is a lightweight and fast messaging implementation."
 HOMEPAGE = "http://zeromq.org/bindings:python"
 LICENSE = "BSD-3-Clause & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e \
@@ -8,7 +9,11 @@ DEPENDS = "zeromq python3-packaging-native"
 SRC_URI += "file://club-rpath-out.patch"
 SRC_URI[sha256sum] = "a51f12a8719aad9dcfb55d456022f16b90abc8dde7d3ca93ce3120b40e3fa169"
 
-inherit pypi pkgconfig python_setuptools_build_meta
+inherit pypi pkgconfig python_setuptools_build_meta ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
 
 DEPENDS += "python3-packaging-native"
 
@@ -25,3 +30,19 @@ do_compile:prepend() {
     echo libzmq_extension = False >> ${S}/setup.cfg
     echo no_libzmq_extension = True >> ${S}/setup.cfg
 }
+
+RDEPENDS:${PN}-ptest += " \
+	${PN}-test \
+"
+
+PACKAGES =+ "\
+    ${PN}-test \
+"
+
+FILES:${PN}-test = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/*/tests \
+"
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/zmq/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.1


