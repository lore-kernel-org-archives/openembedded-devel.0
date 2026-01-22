Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA458C44500
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 05:44:06 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31036.1769060641214990337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 21:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JDAlsQ1W;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso5785115e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 21:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769060639; x=1769665439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dua3Ilc3uDGCusC+cMRsCxZedGCkKjb3NOW1wOmbEi0=;
        b=JDAlsQ1Wx7qKEV1zEvu/RODdsq9kuXc22wVDml7GdEVrvHhwKyj7HUOKQhBA0pa+wy
         KvOcY+XoNTP0jD+q5Ej5OzpLKgC5yQoPLah638qu5UOWtfT9Nt7Aelw7MbEB9w575BQu
         Hz4he4saeQhHrBqzkXSl4AnYpoGfa0ekH1rlgLZog9fsx7291kVOUumVWVivysinMcgb
         2cL48XfQ8O76q7XsQhhIIUF+E+5xnlek3IPqcfyJyZZNAhD2vSKptWvAM6Qe2FGtj2UP
         NAKXqQMH1OavtbB0Ka0H6arBk9mL+hyBdb2SnYYcaP06i2E4tAkEiDJYhfvBZkm0daNz
         rN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769060639; x=1769665439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dua3Ilc3uDGCusC+cMRsCxZedGCkKjb3NOW1wOmbEi0=;
        b=gDV3NIUgvy7bq170tYNq2teneQ9JMrfJsUDrmpD8IRzJ6kQD5TP/9XFgvhzLhiKGna
         lI7ngi+RK9/7uF+HU9XSRGOy+h8L6xitH06afTIUd/hJriu8P74Zj9RQ103S+10TJY7n
         S3Y6DrR8PxIf1hx6KEgP9KhZNsH3t1ZkrakkwAv5/S2GM5+jJkMagEd5zvAMkddX6AjY
         njKUfIbP77RAh7e/rreFFD/PFIab6OvRDaWGEwR+X0xktDCheZQZqYzOr3cqeXbDnaEb
         Y7Yu33Hp8/mDgWpIurTS6izQsA1uY64tL9rrMW9/6A6QIb5qCyXSkTEISN9+veMk+pW3
         FteQ==
X-Gm-Message-State: AOJu0YzBFI/hrKymKFZO42Yow/+DmtbQiAyutwwhYwkbKPP2BPQ6fPPN
	OGCx9UYdjtWuK2Z5WSwjcHn+aOirGAacnvrfmeTGmJ0GbcV9ZLMH9dGgaB+OPQ==
X-Gm-Gg: AZuq6aIYi+7jAVwLp9t6mTc7m4wcrkp01RQH6fjS6Et70EkKhNwm/+Zxk4JDceO1ntz
	Pc1s2CXQiR5Xo9jLyK1UXMYzfSwDOT+ZeUZpl3XakdaKLP5AKG3Nex+85TTuwo/t4AkNHt4bm7K
	cT1eoR4wZnQg64fRXcHVg1bQPapkNdUQuNs1rIiiAos+5aNv379UIjfWgjayMq8crp0Y2FRoZZ2
	y4rcAOFcFf/CVqwsOncAvOki23y0zdm6x2ils/crA2r+Md6SWthsYR/nnpMQ+RwVIy43Q44jvBl
	j6PjAYuUjF9PNEEM9Oo7jEi9n8uGICMXM5OD0wiiJs7OA0zVVGBSKGltKgv6SJz21bkK12PBQvi
	YgiQT2zACEXPsyWDz7iIeWVstAVOyj3unNkJ4lxfmPAcH5YKKch3LnYv3ukIMtZjs2ZmvfNGJju
	qGDboHe9eWMTz0qZ0h2dg=
X-Received: by 2002:a05:600c:8b0c:b0:47e:e2ec:9960 with SMTP id 5b1f17b1804b1-4803e804534mr107941475e9.35.1769060639023;
        Wed, 21 Jan 2026 21:43:59 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480424aa344sm43912035e9.3.2026.01.21.21.43.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 21:43:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/5] freerdp: add ptest support
Date: Thu, 22 Jan 2026 06:43:52 +0100
Message-ID: <20260122054356.3570391-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 05:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123725

The tests take about 50s to execute on my machine.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/freerdp/freerdp/run-ptest | 66 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  | 24 ++++++-
 2 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/run-ptest

diff --git a/meta-oe/recipes-support/freerdp/freerdp/run-ptest b/meta-oe/recipes-support/freerdp/freerdp/run-ptest
new file mode 100644
index 0000000000..5a765cadf0
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/run-ptest
@@ -0,0 +1,66 @@
+#!/bin/sh
+#These test cases were determined by running the actual test binary
+#which lists all available test cases. Couldn't find a way to just simply
+#run all. Also, BusyBox seems to have no associative array support, so
+#plain variables are used with eval.
+TestAsn="TestAsn1Module TestAsn1Encoder TestAsn1Decoder TestAsn1Encode TestAsn1Decode TestAsn1String TestAsn1Integer TestAsn1Compare TestAsn1BerEnc TestAsn1BerDec TestAsn1DerEnc TestAsn1DerDec"
+TestClient="TestClientRdpFile TestClientChannels TestClientCmdLine"
+TestClipboard="TestClipboardFormats"
+TestCommon="TestCommonAssistance"
+TestCore="TestVersion TestSettings"
+TestCredUI="TestCredUIParseUserName TestCredUIConfirmCredentials TestCredUIPromptForCredentials TestCredUICmdLinePromptForCredentials"
+TestCrt="TestTypes TestFormatSpecifiers TestAlignment TestString TestUnicodeConversion"
+TestCrypto="TestCryptoHash TestCryptoRand TestCryptoCipher TestCryptoProtectData TestCryptoProtectMemory TestCryptoCertEnumCertificatesInStore"
+TestDsParse="TestDsMakeSpn TestDsCrackNames"
+TestEnvironment="TestEnvironmentGetEnvironmentStrings TestEnvironmentSetEnvironmentVariable TestEnvironmentMergeEnvironmentStrings TestEnvironmentGetSetEB"
+TestError="TestErrorSetLastError"
+TestFile="TestFileCreateFile TestFileDeleteFile TestFileReadFile TestSetFileAttributes TestFileWriteFile TestFilePatternMatch TestFileFindFirstFile TestFileFindFirstFileEx TestFileFindNextFile TestFileGetStdHandle"
+TestFreeRDPCodec="TestFreeRDPRegion TestFreeRDPCodecMppc TestFreeRDPCodecNCrush TestFreeRDPCodecXCrush TestFreeRDPCodecZGfx TestFreeRDPCodecPlanar TestFreeRDPCodecClear TestFreeRDPCodecInterleaved TestFreeRDPCodecProgressive TestFreeRDPCodecRemoteFX"
+TestFreeRDPCrypto="TestKnownHosts TestBase64 Test_x509_cert_info"
+TestFreeRDPUtils="TestRingBuffer"
+TestGdi="TestGdiRop3 TestGdiLine TestGdiRegion TestGdiRect TestGdiBitBlt TestGdiCreate TestGdiEllipse TestGdiClip"
+TestInterlocked="TestInterlockedAccess TestInterlockedSList TestInterlockedDList"
+TestIo="TestIoDevice TestIoGetOverlappedResult"
+TestLibrary="TestLibraryLoadLibrary TestLibraryGetProcAddress TestLibraryGetModuleFileName"
+TestLocale="TestLocaleFormatMessage"
+TestMemory="TestMemoryCreateFileMapping"
+TestNt="TestNtCreateFile TestNtCurrentTeb"
+TestPath="TestPathCchAddBackslash TestPathCchRemoveBackslash TestPathCchAddBackslashEx TestPathCchRemoveBackslashEx TestPathCchAddExtension TestPathCchAppend TestPathCchAppendEx TestPathCchCanonicalize TestPathCchCanonicalizeEx TestPathAllocCanonicalize TestPathCchCombine TestPathCchCombineEx TestPathAllocCombine TestPathCchFindExtension TestPathCchRenameExtension TestPathCchRemoveExtension TestPathCchIsRoot TestPathIsUNCEx TestPathCchSkipRoot TestPathCchStripToRoot TestPathCchStripPrefix TestPathCchRemoveFileSpec TestPathShell TestPathMakePath"
+TestPipe="TestPipeCreatePipe TestPipeCreateNamedPipe TestPipeCreateNamedPipeOverlapped"
+TestPool="TestPoolIO TestPoolSynch TestPoolThread TestPoolTimer TestPoolWork"
+TestPrimitives="TestPrimitivesAdd TestPrimitivesAlphaComp TestPrimitivesAndOr TestPrimitivesColors TestPrimitivesCopy TestPrimitivesSet TestPrimitivesShift TestPrimitivesSign TestPrimitivesYUV TestPrimitivesYCbCr TestPrimitivesYCoCg"
+TestRdTk="TestRdTkNinePatch"
+TestSecurity="TestSecurityToken"
+TestSmartCard="TestSmartCardListReaders"
+TestSspi="TestQuerySecurityPackageInfo TestEnumerateSecurityPackages TestInitializeSecurityContext TestAcquireCredentialsHandle TestCredSSP TestNTLM"
+TestSynch="TestSynchInit TestSynchEvent TestSynchMutex TestSynchBarrier TestSynchCritical TestSynchSemaphore TestSynchThread TestSynchMultipleThreads TestSynchTimerQueue TestSynchWaitableTimer TestSynchWaitableTimerAPC TestSynchAPC"
+TestSysInfo="TestGetNativeSystemInfo TestCPUFeatures TestGetComputerName TestSystemTime TestLocalTime"
+TestThread="TestThreadCommandLineToArgv TestThreadCreateProcess TestThreadExitThread"
+TestWinPR="TestIntrinsics TestTypes"
+TestWinPRUtils="TestIni TestVersion TestImage TestBipBuffer TestBacktrace TestQueue TestPrint TestPubSub TestStream TestBitStream TestArrayList TestLinkedList TestListDictionary TestCmdLine TestWLog TestWLogCallback TestHashTable TestBufferPool TestStreamPool TestMessageQueue TestMessagePipe"
+TestWnd="TestWndCreateWindowEx TestWndWmCopyData"
+TestWtsApi="TestWtsApiEnumerateProcesses TestWtsApiEnumerateSessions TestWtsApiQuerySessionInformation TestWtsApiSessionNotification TestWtsApiShutdownSystem TestWtsApiWaitSystemEvent"
+
+run_test(){
+  tc=$(eval "echo \$${1}")
+  if [ -z "$tc" -o "$tc" = ".so" ]; then
+     return
+  fi
+  
+  EXTRA_ARG=""
+  if [ "$1" = "TestFile" ]; then
+    # this testcase needs an extra argument
+    EXTRA_ARG="TestFileArea"
+  fi
+  
+  for t in $tc; do
+    ./$1 $t $EXTRA_ARG > ../${1}_${t}.out && echo PASS: $1 $t || echo FAIL: $1 $t
+  done
+}
+
+
+cd Testing
+
+for testbin in *; do
+  run_test $testbin
+done
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index 205f7b0cd7..5122a2d057 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -8,13 +8,16 @@ SECTION = "net"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-inherit pkgconfig cmake gitpkgv
+inherit pkgconfig cmake gitpkgv ptest
+
+RDEPENDS:${PN}-ptest += "coreutils pcsc-lite-lib" 
 
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
 SRCREV = "658a72980f6e93241d927c46cfa664bf2547b8b1"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
+           file://run-ptest \
            file://winpr-makecert-Build-with-install-RPATH.patch \
            file://CVE-2022-39316.patch \
            file://CVE-2022-39318-39319.patch \
@@ -43,6 +46,7 @@ EXTRA_OECMAKE += " \
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'directfb pam pulseaudio wayland x11', d)}\
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'test', '', d)} \
     gstreamer cups pcsc \
 "
 
@@ -55,6 +59,7 @@ PACKAGECONFIG[pcsc] = "-DWITH_PCSC=ON,-DWITH_PCSC=OFF,pcsc-lite"
 PACKAGECONFIG[pulseaudio] = "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaudio"
 PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER_1_0=ON,-DWITH_GSTREAMER_1_0=OFF,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[cups] = "-DWITH_CUPS=ON,-DWITH_CUPS=OFF,cups"
+PACKAGECONFIG[test] = "-DBUILD_TESTING=ON,-DBUILD_TESTING=OFF"
 
 PACKAGES =+ "libfreerdp"
 
@@ -63,6 +68,14 @@ FILES:libfreerdp = "${libdir}/lib*${SOLIBS}"
 
 PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
 
+do_configure:prepend() {
+    if ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; then
+        sed -i 's,CMAKE_CURRENT_SOURCE_DIR,"${PTEST_PATH}/test_data",' ${S}/libfreerdp/codec/test/TestFreeRDPCodecProgressive.c
+        sed -i 's,\${CMAKE_CURRENT_SOURCE_DIR},"${PTEST_PATH}/test_data",' ${S}/libfreerdp/crypto/test/CMakeLists.txt
+        sed -i 's,\${CMAKE_CURRENT_SOURCE_DIR},${PTEST_PATH}/test_data,' ${S}/winpr/libwinpr/utils/test/CMakeLists.txt
+    fi
+}
+
 # we will need winpr-makecert to generate TLS certificates
 do_install:append () {
     install -d ${D}${bindir}
@@ -71,6 +84,15 @@ do_install:append () {
     rm -rf ${D}${libdir}/freerdp
 }
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test_data
+    cp -r ${B}/Testing ${D}${PTEST_PATH}
+    install -m 0644 ${S}/libfreerdp/codec/test/progressive.bmp ${D}${PTEST_PATH}/test_data/
+    install -m 0644 ${S}/libfreerdp/crypto/test/Test_x509_cert_info.pem ${D}${PTEST_PATH}/test_data/
+    install -m 0644 ${S}/winpr/libwinpr/utils/test/lodepng_32bit.png ${D}${PTEST_PATH}/test_data/
+    install -m 0644 ${S}/winpr/libwinpr/utils/test/lodepng_32bit.bmp ${D}${PTEST_PATH}/test_data/
+}
+
 python populate_packages:prepend () {
     freerdp_root = d.expand('${libdir}/freerdp')
 

