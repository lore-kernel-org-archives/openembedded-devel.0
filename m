Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34481CF64B0
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 03:29:43 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25885.1763609378515955549
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 19:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BrgUNjfO;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so357623b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 19:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763609378; x=1764214178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4puY2BiJiPJ0/X8wDXEg7Tooqqwxbczh5Yo+YaVR+Hk=;
        b=BrgUNjfOYWbZAE/FbrNR1szWL7Srpu4jde5cqlv7uE3Kx/B7BhcA9l7ebyfDp17Jxr
         nZRIU/woPvdYyy+E8KWrYrlPsS99dYNEYA0ycZkKO1lbejTVv3bd72rJkz4xABT4lqv+
         Td58I4jROpDS5Kp5UpneFbCy8wL3kT3ROzM00x5p+ZC/+Gst4IlEWJqxA31Wa2J1kPEt
         8Mf12XOJm/NQlfz8xgGVTXzmRA9FcbcCmWIcS3PziMXYqzqOaz+mYFs1bM1+oUAvw7rn
         17pZo/X7dWNPJjqPAo65pRwAFqPbNHnErNSijzpcPqPdOYRrj93GbNycnsGHYdgeodWs
         1Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763609378; x=1764214178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4puY2BiJiPJ0/X8wDXEg7Tooqqwxbczh5Yo+YaVR+Hk=;
        b=PPJ61ooZwyGC6ORMscrzLry5u34EOcOAP12a2s67KIAYrAdDYi8cMOwYzMvr2sJ/zc
         mMgqwpk2jsJA7+1GK9z46I7+6JO0QWh+L8TQ3E4Z1YwqW3qJzJGhm44X2eKQEyCWZCIX
         NMxDIzLMCYQ+T88maQupyH1jDcOVdZYRW1EF0cDu2TAYK91Y1CR2YsET2mxJZVs6RWpK
         iHiVni7EvyE7TX1KQj2Bydlgy8ktb1LDw0IuiVm9UMdWqryQtjTQF3jap4qTJ+2n/ZQ+
         +iGYGfBbA2wVL+Y8AF1NhNU/g1uyFOspQwMtU91g8ACg6L5gaRWHK7uMGELuauIt1SdF
         4r4g==
X-Gm-Message-State: AOJu0YxDsIJK05kSrR2bvhZYSr2YaR5A3nlIeEd2vnVzM7St3ChWNdWJ
	6fL9Q+bPyLYC1ZbqV5mrfUtVKTrb7pYSbcmg64UuzJf7xZ/3LkRZdwS7sgDA4A==
X-Gm-Gg: ASbGncseamr771OGDDXzy7HE2/FbytkC0KjFaNShicXc3sWts3VmeQhggJ6dqWBiUl2
	W+LKa7ftu3GnmaLjihQ+QuIiecCetDhSjQaUkZafIz4fkVm6HPzTpcNfewm/dlmsMKdkU58SBLk
	YR/s//Y/IUm/JHTAg38n0Aon3UwpYRaCpSqW1yGEjZP5sQdxWHvwJ88qhS4Gr+TJyGr1cv720v7
	vcp5ysxcn8f1SMAWX9yCtEuKh/L6iiQjPKsQL5gj4Hwoo6at+T/h019WOl7m42d3jkeweYLe/8x
	hDtHFKbruV+q1VXxD+w3bR2WuW427otA5aYg2uvJ3ng3RiX5eEJGTmFVdE2i0krLMWppZMJr68l
	KuTMG3EX/UWjIiuZ09Jc1wXbUpbpdndBfI+Wlo/nbqwSHNzk81+6wAd+Mk9R+1QDfRV8KxX6XA4
	jNMAmUowj1h3I10yQD1KaE9nNp
X-Google-Smtp-Source: AGHT+IHX2/1MauqX0NptRKKiyLs2NiufK3iFNgRwYAR6afa9xs1u8nl7EWlpCTlo2krN9Xvq7vd8Tg==
X-Received: by 2002:a05:6a00:a20:b0:7a2:8308:3c8b with SMTP id d2e1a72fcca58-7c3eee833c1mr1758625b3a.10.1763609377650;
        Wed, 19 Nov 2025 19:29:37 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0243633sm865111b3a.35.2025.11.19.19.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 19:29:37 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH v2 1/2] libplist: add ptest support
Date: Thu, 20 Nov 2025 16:29:30 +1300
Message-ID: <20251120032931.3639995-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 03:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121921

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
changes in v2:
- added patch to fix ptest error
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../0001-test-fix-operator-error.patch        | 68 +++++++++++++++++++
 .../libimobiledevice/libplist/run-ptest       |  6 ++
 .../libimobiledevice/libplist_2.6.0.bb        | 31 ++++++++-
 4 files changed, 104 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operator-error.patch
 create mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 09b1dbb3e1..25db9fe5cc 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -54,6 +54,7 @@ PTESTS_FAST_META_OE = "\
     xmlsec1 \
     zeromq \
     cjson \
+    libplist \
 "
 PTESTS_FAST_META_OE:append:x86 = " mcelog"
 PTESTS_FAST_META_OE:append:x86-64 = " mcelog"
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operator-error.patch b/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operator-error.patch
new file mode 100644
index 0000000000..0866851537
--- /dev/null
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operator-error.patch
@@ -0,0 +1,68 @@
+From 18e5b22a71f85091127cc063db79c8df687c582c Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Date: Thu, 20 Nov 2025 16:01:58 +1300
+Subject: [PATCH] test: fix operator error
+
+Otherwise test fail with error [: -neq: binary operator expected
+
+Upstream-Status: Submitted [https://github.com/libimobiledevice/libplist/pull/284]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ test/json-invalid-types.test  | 6 +++---
+ test/ostep-invalid-types.test | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/test/json-invalid-types.test b/test/json-invalid-types.test
+index c532316..a21fcd9 100755
+--- a/test/json-invalid-types.test
++++ b/test/json-invalid-types.test
+@@ -14,19 +14,19 @@ export PLIST_JSON_DEBUG=1
+ 
+ echo "Converting (failure expected)"
+ $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE0 -o /dev/null
+-if [ $? -neq 2 ]; then
++if [ $? -ne 2 ]; then
+   exit 1
+ fi
+ 
+ echo "Converting (failure expected)"
+ $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE1 -o /dev/null
+-if [ $? -neq 2 ]; then
++if [ $? -ne 2 ]; then
+   exit 2
+ fi
+ 
+ echo "Converting (failure expected)"
+ $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE2 -o /dev/null
+-if [ $? -neq 2 ]; then
++if [ $? -ne 2 ]; then
+   exit 3
+ fi
+ 
+diff --git a/test/ostep-invalid-types.test b/test/ostep-invalid-types.test
+index 9222394..240505c 100755
+--- a/test/ostep-invalid-types.test
++++ b/test/ostep-invalid-types.test
+@@ -14,19 +14,19 @@ export PLIST_OSTEP_DEBUG=1
+ 
+ echo "Converting (failure expected)"
+ $top_builddir/tools/plistutil -f openstep -i $DATASRC/$TESTFILE0 -o /dev/null
+-if [ $? -neq 2 ]; then
++if [ $? -ne 2 ]; then
+   exit 1
+ fi
+ 
+ echo "Converting (failure expected)"
+ $top_builddir/tools/plistutil -f openstepn -i $DATASRC/$TESTFILE1 -o /dev/null
+-if [ $? -neq 2 ]; then
++if [ $? -ne 2 ]; then
+   exit 2
+ fi
+ 
+ echo "Converting (failure expected)"
+ $top_builddir/tools/plistutil -f openstep -i $DATASRC/$TESTFILE2 -o /dev/null
+-if [ $? -neq 2 ]; then
++if [ $? -ne 2 ]; then
+   exit 3
+ fi
+ 
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest b/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
new file mode 100644
index 0000000000..ed940af5f6
--- /dev/null
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+for t in `ls test/*.test`; do
+	top_srcdir=$(pwd)/input top_builddir=$(pwd)/test ./$t && echo PASS: $t || echo FAIL: $t
+	rm $(pwd)/test/test/data/* 2>/dev/null
+done
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
index 7f01962a97..831b74cd1f 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
@@ -6,10 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
 
 DEPENDS = "libxml2 glib-2.0 swig python3"
 
-inherit autotools pkgconfig python3native python3targetconfig
+inherit autotools pkgconfig python3native python3targetconfig ptest
 
 SRCREV = "2117b8fdb6b4096455bd2041a63e59a028120136"
-SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
+SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master \
+           file://run-ptest \
+           file://0001-test-fix-operator-error.patch \
+"
 
 
 CVE_STATUS_GROUPS += "CVE_STATUS_LIBLIST"
@@ -30,6 +33,28 @@ do_install:append () {
     fi
 }
 
+do_install_ptest(){
+    # tests expect a particular directory structure for input and output
+    install -d ${D}${PTEST_PATH}/input/test/data
+    install -d ${D}${PTEST_PATH}/test/tools
+    install -d ${D}${PTEST_PATH}/test/test/.libs
+    install -d ${D}${PTEST_PATH}/test/test/data
+    install ${S}/test/data/* ${D}${PTEST_PATH}/input/test/data/
+    install ${S}/test/*.test ${D}${PTEST_PATH}/test/
+    install -m 0755 ${B}/test/.libs/plist* ${D}${PTEST_PATH}/test/test/.libs/
+    install -m 0755 ${B}/test/.libs/integer_set_test ${D}${PTEST_PATH}/test/test/
+    for t in $(find ${B}/test -type f -name 'plist*' \! -name '*.o'); do
+        install -m 0755 $t ${D}${PTEST_PATH}/test/test/
+    done
+    for t in $(find ${B}/tools -type f -name 'plist*' \! -name '*.o'); do
+        install -m 0755 $t ${D}${PTEST_PATH}/test/tools/
+    done
+    sed -i 's@LD_LIBRARY_PATH="[^"]*:@LD_LIBRARY_PATH="@g' \
+        ${D}${PTEST_PATH}/test/test/plist_cmp
+    sed -i 's@LD_LIBRARY_PATH="[^"]*:@LD_LIBRARY_PATH="@g' \
+        ${D}${PTEST_PATH}/test/test/plist_test
+}
+
 PACKAGES =+ "${PN}-utils \
              ${PN}++ \
              ${PN}-python"
@@ -38,3 +63,5 @@ FILES:${PN} = "${libdir}/libplist-2.0${SOLIBS}"
 FILES:${PN}++ = "${libdir}/libplist++-2.0${SOLIBS}"
 FILES:${PN}-utils = "${bindir}/*"
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
+
+RDEPENDS:${PN}-ptest += "bash"

