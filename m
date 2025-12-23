Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43A0E6F088
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 12:17:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.99722.1766492260796341095
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 04:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iYrmVKpC;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so22124015e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 04:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766492259; x=1767097059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJB6IC9CIWsFI27+L0xDAh2edGzuyhGMfBR7BscAtnI=;
        b=iYrmVKpCM2I82DBv9naZ1uZ1NYWu5VOmWCDrk+DjKyXgAA9L5a1usXnRZeWM+KjTMf
         wBnq0gM/6WhofGorl3P3ArAKmz3JFNdwHF5QxIIanBx73TRuMBi8yn9vhffXn0V9EvtB
         oUEzyw9QNbEC75H2ur4/fc0XXRo1FwCE60lfx7C13fgHqpM1pD9U3KtBw/lZ4sPAS72a
         tY0qiGr9P4JfqVkrbAYSoM5AqSqNwWX7GxdXwgKHIbIPOfI4bmNS1TpPufeEwikF364A
         BxEJxnpk3hb5N0Zff2kbkt44+HZjWMoSs9R1wWyGklgIq5BYx0NfS0zpvcnr3dNs65bY
         9Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766492259; x=1767097059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJB6IC9CIWsFI27+L0xDAh2edGzuyhGMfBR7BscAtnI=;
        b=P8BT5MGB/F+pQgHMd4MYxWAChqom7bR0lDpJkZYtHVL3lVySP3YlS+xXDHoYfrs0aU
         jQBuLBGyG59GqSHVio/JOPrt+i94IU5FKD4GZ+UMGf35fwNOEygRH6LJY5+cDeq2mSgm
         YHGAUyOiYKeoithhjR0n0I5bGrFA/t9nIk+hZOHL4EKMajpmdgMUFvXRfAMuAxx0ATHP
         ftn0HAlh4ghModnmvPoeGS1b6MhT37hgOGmxUJx2+D2Vbag4h763GeUHYSP4LzA9LwvI
         DB4Jlk+GxydF3WQE1ZJx4/eRnjObG1ShIwJcGQXdDOFfo3ALikacCI6Nr29MazRiw0HQ
         H5Zw==
X-Gm-Message-State: AOJu0Ywkd4Fbk/ugMTXap71zF1itaapp9aEHqM0vY2MNwtGFZkWVPiB2
	wjpfCc6urlmml7e9OURp6TU5m5vVhghrq2WnnWE/SucVW9165Gi24yKBzOklww==
X-Gm-Gg: AY/fxX78WcZ+WXTKMyI6lUx/OWOZtYl57LnX4ZNTP+oHxQuaFRY4/KYLvbSXFfTg99B
	1KQafd4/n8uvap2oCb4tezGK7aI0YPGmQabF03XgCiOxep04AQwK7zo/LLIjnF9VjYcJqOJfn8y
	tJHa1Ihl5N1x5eDfhJ93tErzpZlxVFBh30SGpoAUm2y737gUgYOU33o4h+tq6VQksihG9a5bcX8
	3p123Bjek7JVqOGY5G+Aw6wycugl3JF7mpMftvpJOSuQMo/jkRfIiXU8uizet3hToxDme3QNfFP
	IYmNkygeV7KVBLxChVBuO2b1aepmk7jfEgG9ItJxZknhTa4UfSlaf0wKnEoIUysy4YZhuprfgIO
	b+zfTvMNhb+B7lE1Juogq39tIgGV1b/d9/buFt2Zgh4RfCjCBCefQd2xnLioedfzSxyjLVdSVcc
	C8gQaDil6k
X-Google-Smtp-Source: AGHT+IG4CzAnPQjX3g2LTDPCspESlHn0Jer6EumSO/+Obpv/gdjlltiROvHB/2Uh3A+aRcZjEYi1tA==
X-Received: by 2002:a05:600c:8b13:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-47d2d2a68f3mr67298875e9.35.1766492258851;
        Tue, 23 Dec 2025 04:17:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3aa9971sm113509395e9.13.2025.12.23.04.17.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:17:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] freerdb3: add ptest support
Date: Tue, 23 Dec 2025 13:17:37 +0100
Message-ID: <20251223121737.619747-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 12:17:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122836

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

 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../freerdp/freerdp3/run-ptest                |  2 +
 .../freerdp/freerdp3_3.20.0.bb                | 53 ++++++++++++++++++-
 3 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 1f21db7ae1..556fa8a148 100644
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
index 07e6db69b7..08bea845f0 100644
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
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'test openh264', '', d)} \
 "
 
 EXTRA_OECMAKE = " \
@@ -54,12 +57,58 @@ PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,virtual/libopencl1"
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
+    rm ${D}${PTEST_PATH}/resources/conv_to_ewm_prop.py
+}
+
 PACKAGES =+ "${PN}-proxy-plugins"
 
 FILES:${PN}-proxy-plugins += "${libdir}/${BPN}/proxy/*.so*"

