Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DE2E78490
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 20:10:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127642.1766607023515485467
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 12:10:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B3H3tIOZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so5091595e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 12:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766607022; x=1767211822; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJVX2vpN06fG85NbJ0yqhLeGnZluxv6aB9VB6dbL7XM=;
        b=B3H3tIOZif+dDL2yo92cv4E9y30kQ9h35nSoMKnit8f0sBJvHtr0ioH1kZJSK/Bt4V
         3PW9fcXOzDWJ/UN3lsERavRewPwIBXN/lYInzu0PBzqE/dXDXprBGaooLp/sfBqBhjOj
         ZPdutHVm7BE+ndyJGSOv9m28qm0MeakcSWldA1IfiU0ThvKBf61sNsdANSR7qaqDaqT9
         XLx96B0PYTz+d4vBAq1KfLFeDnA4/vA3M8RjDMyQK3ktpBN+u09IlqMEHn+en/qqhVw+
         LOkNKhmq5dHVm9/61BQQjPXjgxhq8qXcZzyqsy/v6cBvytHqNtEv0oGUPCABxst3DXTI
         X56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766607022; x=1767211822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJVX2vpN06fG85NbJ0yqhLeGnZluxv6aB9VB6dbL7XM=;
        b=vfqlVQWkRELW1QgV0XDv7eoRsVDL/IdPm+rXz+H8ozV3DQiJnShKiC6rU2X9s0+69L
         dfqFZJQrkGGTgOOlmfazqjPSIImvUmLzidFMCrvNY4E0NvJYLGBc4FhEiGMmjFgl4lp/
         vfvqwoeznNUpShWn8E7vo6KezffiR8xXzb9xBOt7SRuUuJf0Hr5nK56h2z7KX6xKXIvS
         DgX4JY5KY7vk35S4jBtj/Lh7DsMConu0lS/e+cSUQ0KYqNH1x1rsDf1f0UPx+iPrBQ83
         OK0XtKoZAVMqrziYi8rMoccqsSXAR7qUJNMNTC/mNex24gmJHGP4uzrbw241OsMgIIbc
         9Fig==
X-Gm-Message-State: AOJu0YxjENuPXVBKsXR56cQLbVGXmd0BHWnaNueiFnCdKc2Ihrl4rNLo
	tXgG1P1W/TaHTsSc+3vkRYpRcmXWCpoF4wdx34ksQIFcOSrNEmiCUlc7
X-Gm-Gg: AY/fxX6dyqDXBHT8/ZfiEyqpXLPzgwawmbWn9gm9bsEbAaeqzbyt/m2IgOkgnWE9pPZ
	Kfj/TOIIDsYlFtvRTHxJAvkax6rYDfoeLoZQ7SA6CQkBNKgheV/Bzvnn2ysSxsUjjdyJIQoC4jx
	QVfbKldg1wjuXE6BrJa8j0RTtugjCP3Ncf32KTC/C2AKM6fhfhclLekP6eQ7AY8fNUcBsUdp1U9
	QzqBRlsQRZP5w3lRw7WDc8N6cs8O73kM8r1WOWvdtlK1fZ1G8BZyAUrXyYDe0/kmujzvuGf0hqQ
	gkCNKnjdaZrh2OiPwicL4Cz7zESG1rQFZlbo+zZePyF6ldPC59dUAW+Cl7aqqMIhYlyy7VQundV
	fyi8Jsd8er3GRyRAEVTCUkQSbbwx3P4xBNX0Wg/SCKMagt3JF58Gv25rgnjY7h2J0tq0q0+40IQ
	RtysZ8kMF1DVeXLEtds3Ap2BWRjLA+3A==
X-Google-Smtp-Source: AGHT+IFd8Baeg5wVTzRFpsdCwgB7iTakm5SQd5idZvtDCFGwWtm7cYGO3UcJGKI4+42kpgW3ScdayA==
X-Received: by 2002:a05:600c:310e:b0:479:2a3c:f31a with SMTP id 5b1f17b1804b1-47d1956eb70mr198297545e9.1.1766607021610;
        Wed, 24 Dec 2025 12:10:21 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193e329asm311757595e9.15.2025.12.24.12.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 12:10:21 -0800 (PST)
Message-ID: <f352b063-6e82-4896-b404-9400b3e48bdf@gmail.com>
Date: Wed, 24 Dec 2025 21:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] freerdb3: add ptest support
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251223121737.619747-1-skandigraun@gmail.com>
 <CAMKF1sq3yq_akmeoUUQOTQuo63ipwhHQJ3WVW8-LJ1eeLaqpMw@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sq3yq_akmeoUUQOTQuo63ipwhHQJ3WVW8-LJ1eeLaqpMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 20:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122898

On 12/24/25 21:05, Khem Raj wrote:
>
>
> On Tue, Dec 23, 2025 at 4:17 AM Gyorgy Sarvari via
> lists.openembedded.org <http://lists.openembedded.org>
> <skandigraun=gmail.com@lists.openembedded.org> wrote:
>
>     The execution takes under 10s.
>
>     Sample output:
>
>     root@qemux86-64:~# ptest-runner
>     START: ptest-runner
>     2025-12-23T11:36
>     BEGIN: /usr/lib/freerdp3/ptest
>     PASS: TestSynchInit
>     PASS: TestSynchEvent
>     PASS: TestSynchMutex
>     [...many lines...]
>     PASS: TestClientRdpFile
>     PASS: TestClientChannels
>     PASS: TestClientCmdLine
>     DURATION: 7
>     END: /usr/lib/freerdp3/ptest
>     2025-12-23T11:37
>     STOP: ptest-runner
>     TOTAL: 1 FAIL: 0
>
>     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>     ---
>
>     v2: when I finished v1, I reordered the test data copying part, to
>     make it nice.
>         But this reordering made destination of testdata copying to be
>     non-existent.
>         v2 created the test folder explicitly in do_install_ptest
>
>      .../include/ptest-packagelists-meta-oe.inc    |  1 +
>      .../freerdp/freerdp3/run-ptest                |  2 +
>      .../freerdp/freerdp3_3.20.0.bb <http://freerdp3_3.20.0.bb>       
>             | 53 ++++++++++++++++++-
>      3 files changed, 54 insertions(+), 2 deletions(-)
>      create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/run-ptest
>
>     diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>     b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>     index 1f21db7ae1..556fa8a148 100644
>     --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>     +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>     @@ -16,6 +16,7 @@ PTESTS_FAST_META_OE = "\
>          ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
>     'dbus-broker', '', d)} \
>          duktape \
>          exiv2 \
>     +    freerdp3 \
>          fuse3 \
>          function2 \
>          fwupd \
>     diff --git a/meta-oe/recipes-support/freerdp/freerdp3/run-ptest
>     b/meta-oe/recipes-support/freerdp/freerdp3/run-ptest
>     new file mode 100644
>     index 0000000000..1a9b69c27e
>     --- /dev/null
>     +++ b/meta-oe/recipes-support/freerdp/freerdp3/run-ptest
>     @@ -0,0 +1,2 @@
>     +#!/bin/sh
>     +ctest | sed 's/\*\*\*/   /g' | awk '/Test
>     +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL");
>     gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
>     diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
>     <http://freerdp3_3.20.0.bb>
>     b/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
>     <http://freerdp3_3.20.0.bb>
>     index 07e6db69b7..08bea845f0 100644
>     --- a/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
>     <http://freerdp3_3.20.0.bb>
>     +++ b/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
>     <http://freerdp3_3.20.0.bb>
>     @@ -4,11 +4,13 @@ LICENSE = "Apache-2.0"
>      LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
>      DEPENDS = "openssl libusb1 uriparser cairo icu pkcs11-helper zlib
>     jpeg json-c"
>     +RDEPENDS:${PN}-ptest += "cmake coreutils"
>
>     -inherit pkgconfig cmake
>     +inherit pkgconfig cmake ptest
>
>      SRCREV = "b8e790a02ede8dd64ff7177fb9027d1844e66bb6"
>     -SRC_URI =
>     "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV}
>     <http://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=$%7BPV%7D>"
>     +SRC_URI =
>     "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV}
>     <http://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=$%7BPV%7D>
>     \
>     +           file://run-ptest"
>
>
>      CVE_PRODUCT = "freerdp"
>     @@ -17,6 +19,7 @@ PACKAGECONFIG ??= " \
>          ${@bb.utils.filter('DISTRO_FEATURES', 'pam pulseaudio wayland
>     x11', d)} \
>          ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial',
>     'ffmpeg', '', d)} \
>          gstreamer cups pcsc \
>     +    ${@bb.utils.contains('PTEST_ENABLED', '1', 'test openh264',
>     '', d)} \
>
>
> openh264 is neither in core nor in meta-oe, its in meta-multimedia and
> meta-oe does not depend upon it rather its other way around
> I think this needs to added via a dynamic-layer 

If I remember well, it's only one testcase that requires it. Maybe it
would be cleaner if I would just to bin that?


>  
>
>      "
>
>      EXTRA_OECMAKE = " \
>     @@ -54,12 +57,58 @@ PACKAGECONFIG[opencl] =
>     "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,virtual/libopencl1"
>      PACKAGECONFIG[lame] = "-DWITH_LAME=ON,-DWITH_LAME=OFF,lame"
>      PACKAGECONFIG[faad] = "-DWITH_FAAD=ON,-DWITH_FAAD=OFF,faad2"
>      PACKAGECONFIG[faac] = "-DWITH_FAAC=ON,-DWITH_FAAC=OFF,faac"
>     +PACKAGECONFIG[test] = "-DBUILD_TESTING=ON,-DBUILD_TESTING=OFF"
>     +
>     +do_configure:prepend() {
>     +    sed -i
>     's|TEST_SOURCE_DIR="\${CMAKE_CURRENT_SOURCE_DIR}"|TEST_SOURCE_DIR="${PTEST_PATH}/test"|'
>     ${S}/client/common/test/CMakeLists.txt
>     +    sed -i 's|\${CMAKE_SOURCE_DIR}|${PTEST_PATH}|'
>     ${S}/winpr/libwinpr/clipboard/test/CMakeLists.txt
>     +    sed -i
>     's|="\${CMAKE_CURRENT_SOURCE_DIR}|="${PTEST_PATH}/test|'
>     ${S}/winpr/libwinpr/utils/test/CMakeLists.txt
>     +    sed -i
>     's|="\${CMAKE_CURRENT_BINARY_DIR}|="${PTEST_PATH}/test|'
>     ${S}/winpr/libwinpr/utils/test/CMakeLists.txt
>     +    sed -i
>     's|="\${CMAKE_CURRENT_SOURCE_DIR}|="${PTEST_PATH}/test|'
>     ${S}/libfreerdp/codec/test/CMakeLists.txt
>     +    sed -i
>     's|="\${CMAKE_CURRENT_BINARY_DIR}|="${PTEST_PATH}/test|'
>     ${S}/libfreerdp/codec/test/CMakeLists.txt
>     +
>     +}
>
>      do_configure:append() {
>          sed -i -e 's|${WORKDIR}||g' ${B}/include/freerdp/buildflags.h
>          sed -i -e 's|${WORKDIR}||g' ${B}/winpr/include/winpr/buildflags.h
>      }
>
>     +do_install_ptest() {
>     +    install -d ${D}${PTEST_PATH}/test
>     +    # main CTestTestfile.cmake file
>     +    cp ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
>     +    # the actual test executables
>     +    cp -r ${B}/Testing ${D}${PTEST_PATH}
>     +    # test data
>     +    cp ${S}/winpr/libwinpr/utils/test/*bmp ${D}${PTEST_PATH}/test/
>     +    cp ${S}/libfreerdp/codec/test/*bmp ${D}${PTEST_PATH}/test/
>     +    cp -r ${S}/client/common/test/* ${D}${PTEST_PATH}/test/
>     +    cp -r ${S}/resources ${D}${PTEST_PATH}
>     +    cp -r ${S}/libfreerdp/codec/test/planar ${D}${PTEST_PATH}/test/
>     +    cp -r ${S}/libfreerdp/codec/test/interleaved
>     ${D}${PTEST_PATH}/test/
>     +
>     +    cd ${B}
>     +    # the test definitions, how to execute the tests
>     +    find . -name CTestTestfile.cmake -exec install -Dm 0644 {}
>     ${D}${PTEST_PATH}/{} \;
>     +
>     +    for testfile in $(find ${D}${PTEST_PATH} -name
>     CTestTestfile.cmake); do
>     +        # these are comments only, containing ${S} and ${B}, at
>     the top of each file
>     +        sed -i "s,Source directory: ${S},<source_dir>," $testfile
>     +        sed -i "s,Build directory: ${B},<build_dir>," $testfile
>     +
>     +        # change the ${B} to ${PTEST_PATH}, so the files will be
>     searches at the correct place
>     +        sed -i "s,${B}/Testing,${PTEST_PATH}/Testing,g" $testfile
>     +
>     +        # These add some extra traceability info to the tests, to
>     pair them with CMakeLists.txt files,
>     +        # containing ${B}.
>     +        # They are not needed for test execution, just remove the
>     whole line.
>     +        sed -i "s,set_tests_properties.*_BACKTRACE_TRIPLES.*,,"
>     $testfile
>     +    done
>     +
>     +    rm ${D}${PTEST_PATH}/resources/conv_to_ewm_prop.py
>     +}
>     +
>      PACKAGES =+ "${PN}-proxy-plugins"
>
>      FILES:${PN}-proxy-plugins += "${libdir}/${BPN}/proxy/*.so*"
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#122836):
>     https://lists.openembedded.org/g/openembedded-devel/message/122836
>     Mute This Topic: https://lists.openembedded.org/mt/116914811/1997914
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [raj.khem@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>


