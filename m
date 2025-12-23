Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97445E6F084
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 11:44:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.99600.1766490234878604426
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 03:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kOiDum7s;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso32458295e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 03:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766490233; x=1767095033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3W7P0s1yI2gy6rCxLnyuEB56HBystuGGOe6MeNmX2Y=;
        b=kOiDum7sxsjY2atdHFAng0cQEMLKlwClcK3Tq47oOrCocSK2z8SHni9vN0rsRbFlyB
         x/CjPqMmsfX1OVGih6Rqlxt7Eh36ByJm+XXMl7fXC1ALf/YBUgDjfNT1y++J0u+uOAAm
         wDUn7bohq0eaqJzAKcyr0KsvpAjUMdOvD/eR/OzsWpRmSyYnTPsKrrUi7Lpnt2hzZOgL
         ZyWY/supnAINjDQnlXn02XgNKQJdOJwDotJwntuTYlEV97B/xXpTwbIAUdqku0OKHISb
         XtKFtCSX2ogluFGcl53IqiO0Fyp4WG3YzZ8WX7oD+E5VRxEDUt3rwios957AQuxHMbM1
         XQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766490233; x=1767095033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h3W7P0s1yI2gy6rCxLnyuEB56HBystuGGOe6MeNmX2Y=;
        b=K2ghkTStwR1318KTmjgbB7rsd/ys4jaShxB6WwPGXi/Y4RvKH3qxwM4x4DDdBne8/N
         pfl88eNMJZfitYIgME4UC4xyJS1c5PNdsf+7s5cPeEIoiAamtx10+39uKlUH/jOX9HWd
         H+c0ETLjV0VpPyYS+HT3uVB52U3j47eud5nMECmtC9ILh3JJ798OnOgiqRcWrjVLMAf0
         eeIsyFHIUmRFZF8sgflJBJ1VI9Yaj/kGfZ0ANeojvgF5B3GW36+XX+I//ABwhro608gd
         OU7L8swwhDUfFmAV0O30wLOXWQfRVmFO0bhJ0A5I9o6rOBxzd/3qbEfNnASCkaQBySIx
         3QPA==
X-Gm-Message-State: AOJu0YyiEmyyF167LroW6bUfQu/uuvjIrXoMF+hVyRw8eByHcxxIOSzz
	r6Fx0fCLqaKttwejku2AyHfNNvUDHnysEz6cQ8aY+C7JK2O+W3HK/HwMLwXT1w==
X-Gm-Gg: AY/fxX6Rm0vFGW7GKI4Mwn0r4xResFlNgy55io5QuHQnO5BR6YuXvb4g14zs4XIwgmf
	Awr1NHzAuPmyIabxPfFe+uJd8b+3jQ0mepyFh/oUqJiUBPrw0YuFjG50b7ZPb075QEizYXYFucO
	G1rKZuxC3iHzDHHYpPW1XckqW5O/M4keMbMckgDcYlm/nsIy2gHdIpAtsIXgpg3TYRvXV40K3tD
	BuX95fwGpZSVvu+AXLizNQN905ZjXyigYaE0soDPmgtitMV+Uyc+yvf5Ux9s3+RSV6YXw9X8kuG
	GmoqMLcrvntJeFWkr8k1CrYz7EPY+zyz2HPihUtSlKXNmo/lKt763xDtgNoZ2fbEz408bqPvIgJ
	kDoks4VIZ7zHc6nPx1au0oUEbmL7XIZKA4szdH+5Kh6v3PNQvxjnDtYi7GIo5pQU/QIyGlao3fd
	h3KlLCojmr
X-Google-Smtp-Source: AGHT+IHDr0vPNQCGE5yLlViFCPNEepeG/lKaKKieW+H7MckhaL+YXStgLKIkcKj69FqpMJN4pVa7Cg==
X-Received: by 2002:a05:600c:4e01:b0:477:3e0b:c0e3 with SMTP id 5b1f17b1804b1-47d19582bcbmr147485975e9.32.1766490233166;
        Tue, 23 Dec 2025 03:43:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be26a81b6sm295778045e9.0.2025.12.23.03.43.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 03:43:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] freerdp3: add ptest support
Date: Tue, 23 Dec 2025 12:43:45 +0100
Message-ID: <20251223114345.591895-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223114345.591895-1-skandigraun@gmail.com>
References: <20251223114345.591895-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 11:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122835

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
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../freerdp/freerdp3/run-ptest                |  2 +
 .../freerdp/freerdp3_3.20.0.bb                | 52 ++++++++++++++++++-
 3 files changed, 53 insertions(+), 2 deletions(-)
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
index 07e6db69b7..daf3256912 100644
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
@@ -54,12 +57,57 @@ PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,virtual/libopencl1"
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
+    # main CTestTestfile.cmake file
+    cp ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
+    # the actual test executables
+    cp -r ${B}/Testing ${D}${PTEST_PATH}
+    # test data
+    cp ${S}/winpr/libwinpr/utils/test/*bmp ${D}${PTEST_PATH}/test/
+    cp ${S}/libfreerdp/codec/test/*bmp ${D}${PTEST_PATH}/test/
+    cp -r ${S}/client/common/test ${D}${PTEST_PATH}
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

