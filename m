Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF846E78494
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 20:39:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127563.1766608756408565437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 12:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BPDfGqEn;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477770019e4so52413065e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 12:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766608755; x=1767213555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvcTo5SlM1uzF58ntv+eSK7QRiks+1vUxcgy27W7XNk=;
        b=BPDfGqEnM3e65INyyUtiJiYDTNdOQ+Yr0tBppcwBu1+9UkEFf+m/z7ofXoUvSvzI4j
         vfcIhIB6LKjhKkeW9wSfgtSCMtnkr5R0lZpa/lMsWYX3VvqJPE2/AmO5XJhc3WmdlsFx
         wPI2k07ZfXJY8UXexxJfNXZ0VNBfqzSU3TteYZBOZylwLkPulG/Y8x0YnSJUlY6WKBP/
         eimYrffw4hfVMLb8FLQnuJyb+doZC5qFiqlmmy8z49Aaf5lCntTVVkj63fqZ5E9jR44e
         w4//aZWqY0ueE5nrM2+pPhTP0jH47ygDzpbvIi1XoNEFWZHnt9PvSj0sxOlF5TCjnnf2
         GXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766608755; x=1767213555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KvcTo5SlM1uzF58ntv+eSK7QRiks+1vUxcgy27W7XNk=;
        b=HO2Yszsb6f+399aJR0AhU7N6PnuzyMl1v/jsE2p7XHXNO4hPht9fw+bv+RxqvU6yYJ
         o4S5DWD/E1N/48BPOfvwcNlNibnShxQve1S6qJBD6zcT9gk3Gi3pIPfs+MQsTXKq30a6
         aVtq3wDrU4Qk2+eSLe8ji8qF9aOIMRPzeeSGhf9G8ddZOVZyhlwVfuUPhbgVIDLC4ItS
         gCMJvNJoVGdsMLni5+PE0+Xe+SYFEDatfV4LQ8NUFz6Qrmo8FNdqQzZXOOHXWWqGvSIl
         Unz6cuqQvn/fNFBMppMQv5kdUsHDBeRe0c5i8uscAJ7YGbCsQijLP2pFWgOi3M2z7Qun
         L8JQ==
X-Gm-Message-State: AOJu0YxMIzhmhUOoPwcIEhZIpj/4iXYH6ZLAa0KSijbmQqEh8HOrz38x
	bYoKLR/DU4LKHvaUbM37tEpweUlOigc6ru0jLtdyRlzdyiyJkycexACQmdVcZg==
X-Gm-Gg: AY/fxX47jDlq5swkhGSg5UZFsWC3SllbGHfWs9iJ9XCl2vcxTkUMmwO6tDiHitpZ5hc
	e8xTM7qa37KBfSM8x+QK0cmCYb5sj5bRi9B8S9zaUoHEuwXWjN2u2+4GURvfOCzO4lcZVsXQTb5
	gCmopmqrCQ7BF4+JFUvzN/u7AhS1Knk5TQ2b9Tqclkv6QJhwqGt3rZtMhpqB96RQwf7GxXi3mVj
	r76jBi2R6h3GFtVHDagGbeD1WQjwmFr8ernOihaEm/ujTOCJXjaVQFHjCQ+oXQngGo8Rty6LX19
	plfGDuxXS7qbROeY1w9LO9tWyxIvsziFgD8iKi9R7eC5jOYNvIns6PjHtHTDvpkIUkOJvuRv8wI
	lCGkYwdPlkhsGhzdeBVCixDPocekG9UmwX3Y9EW03Xuzprh+ExclLMci8ZLvMvi/Zr2nusz46+9
	tzM6YPoCi0
X-Google-Smtp-Source: AGHT+IFbwSni3pCcyPTWtIX75ll54EcczJshsZcXUn9wNa3pisoDrlEuKL1HcW7Y98gDgN3TCx7BNA==
X-Received: by 2002:a05:600c:8287:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-47d1955578bmr225607925e9.16.1766608754699;
        Wed, 24 Dec 2025 12:39:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be272eaf8sm361970155e9.5.2025.12.24.12.39.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 12:39:14 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 2/2] freerdp3: add ptest support
Date: Wed, 24 Dec 2025 21:39:13 +0100
Message-ID: <20251224203913.2794088-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224203913.2794088-1-skandigraun@gmail.com>
References: <20251224203913.2794088-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 20:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122902

The execution takes under 10s.

Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-23T11:36
BEGIN: /usr/lib/freerdp3/ptest
PASS: TestSynchInit
PASS: TestSynchEvent
PASS: TestSynchMutex
[...many lines...]
PASS: TestClientRdpFile
PASS: TestClientChannels
PASS: TestClientCmdLine
DURATION: 7
END: /usr/lib/freerdp3/ptest
2025-12-23T11:37
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: when I finished v1, I reordered the test data copying part, to make it nice.
    But this reordering made destination of testdata copying to be non-existent.
    v2 created the test folder explicitly in do_install_ptest

v3: remove openh264 as a test dependency, because it requires meta-multimedia layer.
    Also, add some comments to the recipe about it.

 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../freerdp/freerdp3/run-ptest                |  2 +
 .../freerdp/freerdp3_3.20.0.bb                | 59 ++++++++++++++++++-
 3 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index d475108cfc..87b7bb9f9c 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -16,6 +16,7 @@ PTESTS_FAST_META_OE = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'dbus-broker', '', d)} \
     duktape \
     exiv2 \
+    freerdp3 \
     fuse3 \
     function2 \
     fwupd \
diff --git a/meta-oe/recipes-support/freerdp/freerdp3/run-ptest b/meta-oe/recipes-support/freerdp/freerdp3/run-ptest
new file mode 100644
index 0000000000..1a9b69c27e
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+ctest | sed 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
index 07e6db69b7..ee3fd8d843 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
@@ -4,11 +4,13 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "openssl libusb1 uriparser cairo icu pkcs11-helper zlib jpeg json-c"
+RDEPENDS:${PN}-ptest += "cmake coreutils"
 
-inherit pkgconfig cmake
+inherit pkgconfig cmake ptest
 
 SRCREV = "b8e790a02ede8dd64ff7177fb9027d1844e66bb6"
-SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV}"
+SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV} \
+           file://run-ptest"
 
 
 CVE_PRODUCT = "freerdp"
@@ -17,6 +19,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pam pulseaudio wayland x11', d)} \
     ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'ffmpeg', '', d)} \
     gstreamer cups pcsc \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'test', '', d)} \
 "
 
 EXTRA_OECMAKE = " \
@@ -54,12 +57,64 @@ PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,virtual/libopencl1"
 PACKAGECONFIG[lame] = "-DWITH_LAME=ON,-DWITH_LAME=OFF,lame"
 PACKAGECONFIG[faad] = "-DWITH_FAAD=ON,-DWITH_FAAD=OFF,faad2"
 PACKAGECONFIG[faac] = "-DWITH_FAAC=ON,-DWITH_FAAC=OFF,faac"
+PACKAGECONFIG[test] = "-DBUILD_TESTING=ON,-DBUILD_TESTING=OFF"
+
+do_configure:prepend() {
+    sed -i 's|TEST_SOURCE_DIR="\${CMAKE_CURRENT_SOURCE_DIR}"|TEST_SOURCE_DIR="${PTEST_PATH}/test"|' ${S}/client/common/test/CMakeLists.txt
+    sed -i 's|\${CMAKE_SOURCE_DIR}|${PTEST_PATH}|' ${S}/winpr/libwinpr/clipboard/test/CMakeLists.txt
+    sed -i 's|="\${CMAKE_CURRENT_SOURCE_DIR}|="${PTEST_PATH}/test|' ${S}/winpr/libwinpr/utils/test/CMakeLists.txt
+    sed -i 's|="\${CMAKE_CURRENT_BINARY_DIR}|="${PTEST_PATH}/test|' ${S}/winpr/libwinpr/utils/test/CMakeLists.txt
+    sed -i 's|="\${CMAKE_CURRENT_SOURCE_DIR}|="${PTEST_PATH}/test|' ${S}/libfreerdp/codec/test/CMakeLists.txt
+    sed -i 's|="\${CMAKE_CURRENT_BINARY_DIR}|="${PTEST_PATH}/test|' ${S}/libfreerdp/codec/test/CMakeLists.txt
+
+}
 
 do_configure:append() {
     sed -i -e 's|${WORKDIR}||g' ${B}/include/freerdp/buildflags.h
     sed -i -e 's|${WORKDIR}||g' ${B}/winpr/include/winpr/buildflags.h
 }
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test
+    # main CTestTestfile.cmake file
+    cp ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
+    # the actual test executables
+    cp -r ${B}/Testing ${D}${PTEST_PATH}
+    # test data
+    cp ${S}/winpr/libwinpr/utils/test/*bmp ${D}${PTEST_PATH}/test/
+    cp ${S}/libfreerdp/codec/test/*bmp ${D}${PTEST_PATH}/test/
+    cp -r ${S}/client/common/test/* ${D}${PTEST_PATH}/test/
+    cp -r ${S}/resources ${D}${PTEST_PATH}
+    cp -r ${S}/libfreerdp/codec/test/planar ${D}${PTEST_PATH}/test/
+    cp -r ${S}/libfreerdp/codec/test/interleaved ${D}${PTEST_PATH}/test/
+
+    cd ${B}
+    # the test definitions, how to execute the tests
+    find . -name CTestTestfile.cmake -exec install -Dm 0644 {} ${D}${PTEST_PATH}/{} \;
+
+    for testfile in $(find ${D}${PTEST_PATH} -name CTestTestfile.cmake); do
+        # these are comments only, containing ${S} and ${B}, at the top of each file
+        sed -i "s,Source directory: ${S},<source_dir>," $testfile
+        sed -i "s,Build directory: ${B},<build_dir>," $testfile
+
+        # change the ${B} to ${PTEST_PATH}, so the files will be searches at the correct place
+        sed -i "s,${B}/Testing,${PTEST_PATH}/Testing,g" $testfile
+
+        # These add some extra traceability info to the tests, to pair them with CMakeLists.txt files,
+        # containing ${B}.
+        # They are not needed for test execution, just remove the whole line.
+        sed -i "s,set_tests_properties.*_BACKTRACE_TRIPLES.*,," $testfile
+    done
+
+    # This is not part of the tests it is just in the same folder, and requires Python to be installed.
+    # Just remove it.
+    rm ${D}${PTEST_PATH}/resources/conv_to_ewm_prop.py
+
+    # This particular test requires openh264, which is part of meta-multimedia layer.
+    # Since it is not a dependency of meta-oe, comment this test out.
+    sed -i 's/add_test(TestFreeRDPCodecH264/#add_test(TestFreeRDPCodecH264/' ${D}${PTEST_PATH}/libfreerdp/codec/test/CTestTestfile.cmake
+}
+
 PACKAGES =+ "${PN}-proxy-plugins"
 
 FILES:${PN}-proxy-plugins += "${libdir}/${BPN}/proxy/*.so*"

