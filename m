Return-Path: <david.pierret@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E629CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 12:37:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.123028.1697459839159368065
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Oct 2023 05:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=lm4j2hzN;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: david.pierret@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-405361bb9f7so45079785e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Oct 2023 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1697459837; x=1698064637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zql/sZC/Nk8HfwzQ48NUmyJEz3pdlA2YdQW3+PzdSE0=;
        b=lm4j2hzNTb6xlnpwfKGxsvkvpCO4lnj+ZTEmb8Yti8W0BE/TX28fTA43EgiVPpxY26
         3kdhj6QZGLnEn7oyswOACPnbPBqkPaZx10BFPc33KRc7+KdeRMQ6nuCN6J4ddp0/NuHf
         zfuXUJ3c/a+jdwLqOd/sWJUKAGoTkSJl1BWBStSDF7uLdmzVANC1CRBIcPcPCCFYo1uD
         pscVKs322jsX/xCHs2YbWViwQu/b+Cxw88A/md0ysL0Y/FfacAZHEatN9WnMegpUmu0G
         9SNWcpVj4n1UFlibLgH6ZyHNNBcsQSZhGXzMb1dGSItRABCKFxk4n2Qr+X9aYBi+8kkG
         j4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697459837; x=1698064637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zql/sZC/Nk8HfwzQ48NUmyJEz3pdlA2YdQW3+PzdSE0=;
        b=K6HHRBbv5kWDFtJ6l5Jpo/rwtxA7FHN+9jny/uaeF3kx2gQLwP40VsWzxLgdcvcp6v
         z4GNJHxnF6Y7navMhmyHBjOeduQq8RQL9WFk8uYyov3/T7hk7OGkwIPELAF3oiN5kjcu
         jQVwgrTJ9S6Pc3lWMHH74ArCl0sn+uOwROfAWKH6C0VMUw+t7gBa/EUZN1gmGAvXOrik
         7AeyhBpj9GlHzTd2qHG1da+NS3yh1C5sqbeeYWVDnNFJQC0LI66fjHCs+hdOMP/+wy0A
         E/7LGgwRRLeHKVB6pnYvUSTMK4uskV5unPixkHRPCckCNJVFkFTCH1HNR+jQA0+M7bhx
         iP5w==
X-Gm-Message-State: AOJu0Yy/vTPj0Qt6V/8fVx+nEwpTwcEJQ3zaFSJUJN9o+8UyK7xYTkfZ
	ovvqNDuV8AQXHAhIFsEzs8gHGlpCGNv34LCVoRE=
X-Google-Smtp-Source: AGHT+IH7R/uZDXAoNxVKhsGs/uC0D9dMcntCBqDX74YRk1WfBVu7AjJ1WCkM/7yUU1NQNlUjd/8fFw==
X-Received: by 2002:adf:fc09:0:b0:31c:7ada:5e05 with SMTP id i9-20020adffc09000000b0031c7ada5e05mr26142442wrr.51.1697459836930;
        Mon, 16 Oct 2023 05:37:16 -0700 (PDT)
Received: from P-TOU-PARSEC.tailace47.ts.net ([2a01:cb19:9313:2700:7490:fa4a:1f26:167f])
        by smtp.gmail.com with ESMTPSA id n6-20020adffe06000000b003140f47224csm27019446wrr.15.2023.10.16.05.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:37:16 -0700 (PDT)
From: David Pierret <david.pierret@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	David Pierret <david.pierret@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] cjson: Add ptest
Date: Mon, 16 Oct 2023 14:37:25 +0200
Message-Id: <20231016123725.10725-1-david.pierret@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Oct 2023 12:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105543

cjson use pure CMake test framework named CTest.
CMake generate CTestTestfile.cmake containing fully defined path.
This path need to be altered on install step to match the ptest directory.

The json_patch_tests doesn't works because of file access and is skip.

Signed-off-by: David Pierret <david.pierret@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../recipes-devtools/cjson/cjson/run-ptest    |  8 +++++++
 .../recipes-devtools/cjson/cjson_1.7.15.bb    | 24 +++++++++++++++++--
 3 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index a2b2ce4bc..212b90c86 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -36,6 +36,7 @@ PTESTS_FAST_META_OE = "\
     uthash \
     xmlsec1 \
     zeromq \
+    cjson \
 "
 PTESTS_FAST_META_OE:append:x86 = " mcelog"
 PTESTS_FAST_META_OE:append:x86-64 = " mcelog"
diff --git a/meta-oe/recipes-devtools/cjson/cjson/run-ptest b/meta-oe/recipes-devtools/cjson/cjson/run-ptest
new file mode 100644
index 000000000..f061e9466
--- /dev/null
+++ b/meta-oe/recipes-devtools/cjson/cjson/run-ptest
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+# exclude json_patch_tests
+if ctest -E 'json_patch_tests' ; then
+    echo "PASS: cjson"
+else
+    echo "FAIL: cjson"
+fi
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
index 8bf7981ab..1841aeffc 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
@@ -4,12 +4,32 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
-SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
+           file://run-ptest \
+         "
 SRCREV = "d348621ca93571343a56862df7de4ff3bc9b5667"
 
 S = "${WORKDIR}/git"
 
-inherit cmake pkgconfig
+inherit cmake pkgconfig ptest
+
+RDEPENDS:${PN}-ptest += "cmake"
+
+do_install_ptest() {
+        # create directories
+        install -d ${D}${PTEST_PATH} ${D}${PTEST_PATH}/tests ${D}${PTEST_PATH}/fuzzing
+        install -d ${D}${PTEST_PATH}/tests/inputs ${D}${PTEST_PATH}/tests/json-patch-tests
+        # CTestTestfiles.cmake contain fully defined path generated by cmake.
+        # Change the fully defined path to ptest path on the target
+        sed s#${B}#${PTEST_PATH}# ${B}/CTestTestfile.cmake > ${D}${PTEST_PATH}/CTestTestfile.cmake
+        sed s#${B}#${PTEST_PATH}# ${B}/tests/CTestTestfile.cmake > ${D}${PTEST_PATH}/tests/CTestTestfile.cmake
+        sed s#${B}#${PTEST_PATH}# ${B}/fuzzing/CTestTestfile.cmake > ${D}${PTEST_PATH}/fuzzing/CTestTestfile.cmake
+        # install test artifacts
+        install ${B}/cJSON_test ${D}${PTEST_PATH}
+        install ${B}/tests/cjson_add ${B}/tests/*_tests ${B}/tests/parse_*  ${B}/tests/print_*  ${B}/tests/readme_examples ${D}${PTEST_PATH}/tests/
+        install ${B}/tests/inputs/* ${D}${PTEST_PATH}/tests/inputs
+        install ${B}/fuzzing/fuzz_main ${D}${PTEST_PATH}/fuzzing
+}
 
 EXTRA_OECMAKE += "\
     -DENABLE_CJSON_UTILS=On \
-- 
2.39.2


