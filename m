Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33044D3EE64
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 13:12:29 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36759.1769087548565262174
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 05:12:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OpNI6iWw;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so7303865e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 05:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769087547; x=1769692347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ugz76H0Y8CJTR4s/Z11KV9bKKzb1uz2H/9gN+P20/2g=;
        b=OpNI6iWwBhbUABt4WuhiO1FfdUNJLytBez5TloXG2SHYicqEVkGT/w5YPrFwmn0C5V
         TinkEDSwQhZD0EoKKKOEPjJhqOTEILlC57lpQwAkrhadqBpD89Te8bBNzxtRz2Ky0lpd
         XYYAIqR1ooUvUVzh1QdPsp3MeskZU92/DhlYCCYFSQLSRk06F7mSfPdYYj9v0JYVWN7U
         dByCAHc+rQrvV3V58MhMv5r2JJDvqpa8twR82sosh6l4DxQ4+SZsUK1uB0Y441ZFy3d9
         YKWdyq3d6nkrrQdB5wXmlGHrbJKy7iXws2efjI4cUMV7mTH48HEy7AJlQHa6EkfWwDEy
         v82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769087547; x=1769692347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugz76H0Y8CJTR4s/Z11KV9bKKzb1uz2H/9gN+P20/2g=;
        b=nNebnpXW9TWtZzEjvACyVakysyJ7itubE9RBrgtQZDjL4uuNb8cRRUE25XXy3y/aey
         FjYA/eXcMqqTiBUadL6mHXCSB+wVA+K6W7R8tqBGhFGR1Gij77S1F9NwG/ehUksdRlCn
         JLkPRYy60mbgFetNexodolAE2GDwL4GvxSorDvLFknKhZRRdemx63uoHtpEYQ/a5k48w
         cNWu9Fbwar1i6AQKTH+JVRuRtZQwNAo8LqsYxU0yWVtbpu3BN2QdnJSdEz+6/9Pewrnt
         mtNjmLsSyvtL2yYD7lFUN/qo2pjwxXOb4NWxqzQR3Nt6m1df1vPjRZ2HuhD0BorPYMl9
         AD4Q==
X-Gm-Message-State: AOJu0YyN36mdSFce8gLLLgp+PCFYBcZLm646aCh/tTfid1iQHnmn/z6R
	lfYcBwiuYH2R7KDcsOOv3pW4+vxluY+sHdxgYHbynN729xgal+MWmsxGeQbs6Q==
X-Gm-Gg: AZuq6aJw5W8p+CYbhKUhximqJfUKO6ComDMkZzkHGLm3sin7VqpvJtQlHQcjWXJqy1Q
	5oID9Sv1kVxltN5pjw/BN7Mr3OssUpvoT41O/wq3I0VTHKY77uhj3kU3OXKybKBuByP4P5BPQGv
	wqukcBhZ9fs6tEOQxW9dixnP/Bar0BUCLH+mH63D6vZWpPjF30+bDqcwN21rIYNwBu2ZTFOOitS
	vkDlW4iSR5XNNCWjWGig2GD1unrnXfIQwzZ2TUAeZVrDgB7dlKtsoHtyMIlRSotaLmm08xypgZo
	UMEsIvCbXA57M4KYIyFoNrhlAyWdcHLchLK+9Ct6ahwHxoGzs9EVRINSAwTbwyCXG5CY1qatdG3
	AWgIoWyj7gFhbwTjcGXl9uFI8B1ArZwvP1cRaJyQmlQ2vbThfj9FmGLd6Qb8IUz8CIW8swSHvwB
	zWN+m2aG06E28deUiLLnw=
X-Received: by 2002:a05:600c:138c:b0:47e:e949:37e8 with SMTP id 5b1f17b1804b1-48039d19076mr175221755e9.30.1769087546577;
        Thu, 22 Jan 2026 05:12:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf1acsm65517035e9.14.2026.01.22.05.12.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 05:12:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] freerdp: add ptest support
Date: Thu, 22 Jan 2026 14:12:25 +0100
Message-ID: <20260122131225.3827576-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 13:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123736

The test suite takes about 50s to execute.

Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2026-01-22T12:58
BEGIN: /usr/lib/freerdp/ptest
PASS: TestClient TestClientRdpFile
PASS: TestClient TestClientChannels
PASS: TestClient TestClientCmdLine
[...many lines...]
PASS: TestWtsApi TestWtsApiSessionNotification
PASS: TestWtsApi TestWtsApiShutdownSystem
PASS: TestWtsApi TestWtsApiWaitSystemEvent
DURATION: 48
END: /usr/lib/freerdp/ptest
2026-01-22T12:59
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../recipes-support/freerdp/freerdp/run-ptest | 85 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.11.7.bb | 22 ++++-
 3 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index f8d9ee6f9b..4de602ac1c 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -72,6 +72,7 @@ PTESTS_FAST_META_OE:remove:riscv32 = "botan nodejs oprofile"
 
 PTESTS_SLOW_META_OE = "\
     c-ares \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'freerdp', '', d)} \
     fftw \
     libusb-compat \
     mariadb \
diff --git a/meta-oe/recipes-support/freerdp/freerdp/run-ptest b/meta-oe/recipes-support/freerdp/freerdp/run-ptest
new file mode 100644
index 0000000000..423a780eb1
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/run-ptest
@@ -0,0 +1,85 @@
+#!/bin/sh
+
+#The key is the test binary name, and the value is the list of arguments to
+#use with the given binary. Each argument is a testcase to execute.
+
+#These test cases were determined by running the actual test binary
+#which lists all available test cases. Couldn't find a way to just simply
+#run all. Also, BusyBox seems to have no associative array support, so
+#plain variables are used with eval.
+
+TestAsn="TestAsn1Module TestAsn1Encoder TestAsn1Decoder TestAsn1Encode TestAsn1Decode TestAsn1String \
+    TestAsn1Integer TestAsn1Compare TestAsn1BerEnc TestAsn1BerDec TestAsn1DerEnc TestAsn1DerDec"
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
+TestFile="TestFileCreateFile TestFileDeleteFile TestFileReadFile TestSetFileAttributes TestFileWriteFile \
+    TestFilePatternMatch TestFileFindFirstFile TestFileFindFirstFileEx TestFileFindNextFile TestFileGetStdHandle"
+TestFreeRDPCodec="TestFreeRDPRegion TestFreeRDPCodecMppc TestFreeRDPCodecNCrush TestFreeRDPCodecXCrush \
+    TestFreeRDPCodecZGfx TestFreeRDPCodecPlanar TestFreeRDPCodecClear TestFreeRDPCodecInterleaved \
+    TestFreeRDPCodecProgressive TestFreeRDPCodecRemoteFX"
+TestFreeRDPCrypto="TestKnownHosts TestBase64 Test_x509_cert_info"
+TestFreeRDPUtils="TestRingBuffer"
+TestGdi="TestGdiRop3 TestGdiLine TestGdiRegion TestGdiRect TestGdiBitBlt TestGdiCreate TestGdiEllipse TestGdiClip"
+TestInterlocked="TestInterlockedAccess TestInterlockedSList TestInterlockedDList"
+TestIo="TestIoDevice TestIoGetOverlappedResult"
+TestLibrary="TestLibraryLoadLibrary TestLibraryGetProcAddress TestLibraryGetModuleFileName"
+TestLocale="TestLocaleFormatMessage"
+TestMemory="TestMemoryCreateFileMapping"
+TestNt="TestNtCreateFile TestNtCurrentTeb"
+TestPath="TestPathCchAddBackslash TestPathCchRemoveBackslash TestPathCchAddBackslashEx TestPathCchRemoveBackslashEx \
+    TestPathCchAddExtension TestPathCchAppend TestPathCchAppendEx TestPathCchCanonicalize TestPathCchCanonicalizeEx \
+    TestPathAllocCanonicalize TestPathCchCombine TestPathCchCombineEx TestPathAllocCombine TestPathCchFindExtension \
+    TestPathCchRenameExtension TestPathCchRemoveExtension TestPathCchIsRoot TestPathIsUNCEx TestPathCchSkipRoot \
+    TestPathCchStripToRoot TestPathCchStripPrefix TestPathCchRemoveFileSpec TestPathShell TestPathMakePath"
+TestPipe="TestPipeCreatePipe TestPipeCreateNamedPipe TestPipeCreateNamedPipeOverlapped"
+TestPool="TestPoolIO TestPoolSynch TestPoolThread TestPoolTimer TestPoolWork"
+TestPrimitives="TestPrimitivesAdd TestPrimitivesAlphaComp TestPrimitivesAndOr TestPrimitivesColors TestPrimitivesCopy \
+    TestPrimitivesSet TestPrimitivesShift TestPrimitivesSign TestPrimitivesYUV TestPrimitivesYCbCr TestPrimitivesYCoCg"
+TestRdTk="TestRdTkNinePatch"
+TestSecurity="TestSecurityToken"
+TestSmartCard="TestSmartCardListReaders"
+TestSspi="TestQuerySecurityPackageInfo TestEnumerateSecurityPackages TestInitializeSecurityContext TestAcquireCredentialsHandle TestCredSSP TestNTLM"
+TestSynch="TestSynchInit TestSynchEvent TestSynchMutex TestSynchBarrier TestSynchCritical TestSynchSemaphore \
+    TestSynchThread TestSynchMultipleThreads TestSynchTimerQueue TestSynchWaitableTimer TestSynchWaitableTimerAPC TestSynchAPC"
+TestSysInfo="TestGetNativeSystemInfo TestCPUFeatures TestGetComputerName TestSystemTime TestLocalTime"
+TestThread="TestThreadCommandLineToArgv TestThreadCreateProcess TestThreadExitThread"
+TestWinPR="TestIntrinsics TestTypes"
+TestWinPRUtils="TestIni TestVersion TestImage TestBipBuffer TestBacktrace TestQueue TestPrint TestPubSub TestStream \
+    TestBitStream TestArrayList TestLinkedList TestListDictionary TestCmdLine TestWLog TestWLogCallback TestHashTable \
+    TestBufferPool TestStreamPool TestMessageQueue TestMessagePipe"
+TestWnd="TestWndCreateWindowEx TestWndWmCopyData"
+TestWtsApi="TestWtsApiEnumerateProcesses TestWtsApiEnumerateSessions TestWtsApiQuerySessionInformation \
+    TestWtsApiSessionNotification TestWtsApiShutdownSystem TestWtsApiWaitSystemEvent"
+
+run_test(){
+  binary=$1
+  tcs=$(eval "echo \$${binary}")
+  if [ -z "$tcs" -o "$tcs" = ".so" ]; then
+     return
+  fi
+  
+  EXTRA_ARG=""
+  if [ "$binary" = "TestFile" ]; then
+    # This testcase needs an extra argument. TestFileArea is a folder
+    # where some test files are used by this test.
+    EXTRA_ARG="TestFileArea"
+  fi
+  
+  for tc in $tcs; do
+    ./$binary $tc $EXTRA_ARG > ../${binary}_${tc}.out 2>&1 && echo PASS: $binary $tc || echo FAIL: $binary $tc
+  done
+}
+
+cd Testing
+
+for testbin in *; do
+  run_test $testbin
+done
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 9b07c94169..225f49a94b 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -8,13 +8,16 @@ SECTION = "net"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-inherit pkgconfig cmake gitpkgv
+inherit pkgconfig cmake gitpkgv ptest
+
+RDEPENDS:${PN}-ptest += "coreutils pcsc-lite-lib"
 
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
 SRCREV = "efa899d3deb8595a29fabb2a2251722f9d7e0d7f"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
+           file://run-ptest \
            file://winpr-makecert-Build-with-install-RPATH.patch \
            file://0001-Fixed-compilation-warnings.patch \
            file://0001-Fix-const-qualifier-error.patch \
@@ -37,6 +40,7 @@ EXTRA_OECMAKE += " \
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'directfb pam pulseaudio wayland x11', d)}\
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'test', '', d)} \
     alsa gstreamer cups pcsc server \
 "
 
@@ -51,6 +55,7 @@ PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER_1_0=ON,-DWITH_GSTREAMER_1_0=OFF,gst
 PACKAGECONFIG[cups] = "-DWITH_CUPS=ON,-DWITH_CUPS=OFF,cups"
 PACKAGECONFIG[server] = "-DWITH_SERVER=ON,-DWITH_SERVER=OFF"
 PACKAGECONFIG[alsa] = "-DWITH_ALSA=ON,-DWITH_ALSA=OFF,alsa-lib"
+PACKAGECONFIG[test] = "-DBUILD_TESTING=ON,-DBUILD_TESTING=OFF"
 
 PACKAGES =+ "libfreerdp"
 
@@ -59,6 +64,12 @@ FILES:libfreerdp = "${libdir}/lib*${SOLIBS}"
 
 PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
 
+do_configure:prepend() {
+    sed -i 's,CMAKE_CURRENT_SOURCE_DIR,"${PTEST_PATH}/test_data",' ${S}/libfreerdp/codec/test/TestFreeRDPCodecProgressive.c
+    sed -i 's,\${CMAKE_CURRENT_SOURCE_DIR},"${PTEST_PATH}/test_data",' ${S}/libfreerdp/crypto/test/CMakeLists.txt
+    sed -i 's,\${CMAKE_CURRENT_SOURCE_DIR},${PTEST_PATH}/test_data,' ${S}/winpr/libwinpr/utils/test/CMakeLists.txt
+}
+
 do_configure:append() {
     sed -i -e 's|${WORKDIR}||g' ${B}/buildflags.h
 }
@@ -70,6 +81,15 @@ do_install:append () {
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
 

