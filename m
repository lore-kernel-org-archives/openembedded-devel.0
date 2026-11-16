Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.469.1794852903812351783
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 10:15:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qG3WGh3F;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-380b40319bdso904004eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 10:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852903; x=1795457703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3NIJVn7yM9YBTCS8fNdz6xzS5Ovq7ZMdFKEDP6H8+j8=;
        b=qG3WGh3F/vRaqYlLKERDq2wDPQz9Xrd4BLaen+rpRrIni08qVr0DjIIgrdwqfFh5IL
         Ayy5jfxOSVIz2j47gZRXTxNTSQTHzCKnLq3t85zzXr1h8+KJoiF20ZMim7hgdGg9DWxH
         bJOeSxu/nURfzBurYa3MtcrqVuVx/+yRyqY8PmOnTJVTw4IOSUsbUT+KhkfNe2I8BWzd
         cGGrwMoxd0XeMPKlXIoHxj8Zb8EQ8shElmuHEzl2lbRKCp98X6BJITVaSo/wFrPOoV64
         DMcuKx+71GG60daPJnF5ahD9nWzMrZIqINFbKt5gsU0D/AqP+RD1uXj39RbKze+Nwl6W
         HAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852903; x=1795457703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3NIJVn7yM9YBTCS8fNdz6xzS5Ovq7ZMdFKEDP6H8+j8=;
        b=MGj3DxvNXbxKxCK2ZeA2W2De7GOHS8o0IiXy2fHHltJ3waQh8cYWWmsD7FfxjBNmYE
         mH5drs2fezbKxP4TXuv8WYoY+9kfYd01TZiQvoZAos3CIY+kYuQVbkjOfHsdFgVPDKbS
         oUw/NXkQsEmWMVtdIrbZtKvR9CDh+nFeVUHs/s5P0YZxoRuDw6XJmYqrVQUtJxhmHdCV
         5KrkdHCayp2RPPkXidR2aH5bgD5sOwM3Ntt974gG3X5HuVZTgo/8QGbI5VM7oLSriB4w
         80Bl3qzKKj0Q05ZAyucDjjxL9SVVOJTV5jig2Or1cKAvjPEPhPhOvKHE7T+yy8InrM1y
         uCvw==
X-Gm-Message-State: APuU4Z9glYfGzIZ+r9VYzjt00PMiqyNR9DkU+LLWjcv1nrw/9kJk6PUN
	XbMfcsp6yB1JQs1IpnwcjH4ywA9EYNcLsoGHMmw+BffJsSuogWkrEI9GrIot4jc1
X-Gm-Gg: AYBFou3rd7tUJQfJqW0xbEw0tNgSdxj5bYUA7/gKHLPLCOJwdkthxXgLKOELI6tSwBU
	32Dr14zwQNEvMA5owffZ+icfojAL6dnY6tntiKanfoLe4jtORkJqCfEu1C6qs4V9BdI2TvLKxec
	e6F2z2lrm4xiCNmrBMvRsFHbkx0mq567haTs1LXlOa64wU4mbBbvl6In6EpTvZBDqhE/hiDZreD
	2rvPwNGPyZWiauDfvW9mvwE2NipCdiwzXXIIb8PyIY2NMNHp05SyFQrecBN4NB5tOOt7m0ZVwnI
	uNILfdFZ9EYYRQ5bYYidjIe7s3n1BrBdIp+65GypU+IyGgMNv0d739P+/u5d1Zzjb0YII5wXu3F
	AE05t9jlqwq9oXvy2A+oIipMormGNZzoYPjH3bQcckSqbOt/RZtZnSDosVbzdrz1aKlW8CMeO1Q
	7xBhJeSGYhcgCpdQQKhO1ECPixrHOyXTMFqOLaa00Ihg+BUGTJTzHqJbpNCa66ywa1gxSp2+nVV
	dnaN7du4ytnjrjP2W9nz9rNqDhCRupPL1cwFVbdkT8M8+mnEBbLWAwdRPPy6NZOhmMZ5rATCKrJ
	Xz44xqCYFSlJ44+AS8eTcyEnsm5ksTYktkE1vmrHAgKl4mysBOuHVo5i5OgK5GPzoJFLaEUug3G
	y+EMzHLF01VMKAp/mITZsVDWwEJtdzshT4x1zmdOaCujlBWRWA2u/fuiYKVAeTjDZ7bCAlPwAjm
	NfNXYOyj9SQk3ovw5ehAWp4ZS3BBGXxocGsgeWzoCtlHKQc/jvfJihlcDUk2TX5j1mXZJyjBVXB
	2TmwpVQ3RQuZmTdE3csxU33Tt4SQq5bws/PUqYK/yEoKl3Ft1plODFQMkUou4Hj91oRiOZJkIMi
	vi4r
X-Received: by 2002:a05:7301:182a:b0:377:d6e5:e64a with SMTP id 5a478bee46e88-37965f9bfdamr11240029eec.7.1794852902734;
        Mon, 16 Nov 2026 10:15:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm35841020eec.10.2026.11.16.10.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:15:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 2/2] libupnp: Add ptest
Date: Mon, 16 Nov 2026 10:14:58 -0800
Message-ID: <20261116181458.351824-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116181458.351824-1-khem.raj@oss.qualcomm.com>
References: <20261116181458.351824-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 18:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132563
Content-Type: text/plain; charset="utf-8"

Run upstream's test suite (ixml and upnp unit tests, googletest
regression tests and the Python ctypes tests) with ctest on the
target and turn its results into ptest PASS/FAIL/SKIP lines.

Most of the regression tests use internal symbols and link only
against the static libraries. Upstream puts the static and shared
targets in one CMake export set, so building static libraries would
make the -dev CMake config require the .a files from -staticdev.
Instead, configure and build a second tree with static libraries and
tests enabled in do_configure_ptest/do_compile_ptest, and install the
tests from there. The shipped packages are the same with or without
ptest.

The Python tests and the symbol visibility check look for the
library in the build tree, so point them at the installed one.
The visibility check needs nm and is skipped on images without
binutils.

On qemux86-64: 198 pass, 1 skipped (visibility check), ~50s, so
list it with the slow ptests.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../ptest-packagelists-meta-multimedia.inc    |  1 +
 .../libupnp/libupnp/run-ptest                 | 18 +++++++
 .../libupnp/libupnp_22.2.2.bb                 | 50 ++++++++++++++++++-
 3 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100755 meta-multimedia/recipes-connectivity/libupnp/libupnp/run-ptest

diff --git a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
index 0b1b4afba8..483786e617 100644
--- a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
+++ b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
@@ -18,6 +18,7 @@ PTESTS_FAST_META_MULTIMEDIA = "\
 
 PTESTS_SLOW_META_MULTIMEDIA = "\
     gupnp \
+    libupnp \
 "
 
 PTESTS_PROBLEMS_META_MULTIMEDIA = "\
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/run-ptest b/meta-multimedia/recipes-connectivity/libupnp/libupnp/run-ptest
new file mode 100755
index 0000000000..6735fff5be
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp/run-ptest
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+cd "$(dirname "$0")"
+
+ctest --timeout 300 --output-on-failure 2>&1 | awk '
+/Test +#[0-9]+: / {
+    name = $0
+    sub(/.*Test +#[0-9]+: /, "", name)
+    sub(/ .*/, "", name)
+    if ($0 ~ /Passed/)
+        print "PASS: " name
+    else if ($0 ~ /Skipped/)
+        print "SKIP: " name
+    else
+        print "FAIL: " name
+    next
+}
+{ print }'
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_22.2.2.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_22.2.2.bb
index 252f5cf478..9d81805d90 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_22.2.2.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_22.2.2.bb
@@ -10,9 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
 
 SRCREV = "fac0494691434c35243131f66a0b27ea0c29f700"
 SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=main;tag=release-${PV} \
+           file://run-ptest \
           "
 
-inherit cmake pkgconfig
+inherit cmake pkgconfig ptest python3native
 
 EXTRA_OECMAKE = "\
     -DCMAKE_BUILD_TYPE=Release \
@@ -26,3 +27,50 @@ EXTRA_OECMAKE = "\
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[openssl] = "-DUPNP_ENABLE_OPEN_SSL=ON,-DUPNP_ENABLE_OPEN_SSL=OFF,openssl"
+
+DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'googletest python3-pytest-native', '', d)}"
+
+# Most tests use internal symbols and only link against the static
+# libraries, which share a CMake export set with the shared ones, so the
+# tests get a separate build tree and the installed library stays
+# shared-only.
+PTEST_B = "${B}/ptest"
+
+do_configure_ptest() {
+    mkdir -p ${PTEST_B}
+    cd ${PTEST_B}
+    cmake ${OECMAKE_GENERATOR_ARGS} ${OECMAKE_SOURCEPATH} ${OECMAKE_ARGS} \
+        ${EXTRA_OECMAKE} -Wno-dev \
+        -DUPNP_BUILD_STATIC=ON \
+        -DUPNP_ENABLE_TESTING=ON \
+        -DPython3_EXECUTABLE=${PYTHON}
+}
+
+do_compile_ptest() {
+    cmake --build ${PTEST_B} -- ${EXTRA_OECMAKE_BUILD}
+}
+
+do_install_ptest() {
+    cd ${PTEST_B}
+    find . -name CTestTestfile.cmake | while read f; do
+        install -D -m 0644 $f ${D}${PTEST_PATH}/$f
+        sed -i -e 's# _BACKTRACE_TRIPLES "[^"]*"##' \
+            -e 's#${PTEST_B}#${PTEST_PATH}#g' -e 's#${S}#${PTEST_PATH}#g' \
+            -e 's#${PYTHON}#${bindir}/python3#g' ${D}${PTEST_PATH}/$f
+    done
+    find . -path '*/CMakeFiles' -prune -o -type f -perm -u+x ! -name '*.so*' -print | while read f; do
+        install -D -m 0755 $f ${D}${PTEST_PATH}/$f
+    done
+
+    install -d ${D}${PTEST_PATH}/ixml/test ${D}${PTEST_PATH}/tests ${D}${PTEST_PATH}/upnp/inc
+    cp -r ${S}/ixml/test/testdata ${D}${PTEST_PATH}/ixml/test/
+    install -m 0644 ${S}/tests/*.py ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${S}/upnp/test/check_symbol_visibility.sh ${D}${PTEST_PATH}/upnp/test/
+    # The Python and symbol visibility tests look for the library in the
+    # build tree; point them at the installed one.
+    install -m 0644 ${PTEST_B}/upnp/inc/upnpconfig.h ${D}${PTEST_PATH}/upnp/inc/
+    ln -sf ${libdir}/libupnp.so.${PV} ${D}${PTEST_PATH}/upnp/libupnp.so
+    ln -sf ${libdir}/libupnp.so.${PV} ${D}${PTEST_PATH}/upnp/libupnp.so.${PV}
+}
+
+RDEPENDS:${PN}-ptest += "cmake python3-core python3-ctypes python3-fcntl python3-io python3-pytest"
