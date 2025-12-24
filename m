Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95FEE78490
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 20:12:55 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127155.1766607173990673784
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 12:12:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VwNxo3jA;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-787df0d729dso52679757b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 12:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766607173; x=1767211973; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lgFafpjeEqJV+/mTJcWXWpoWkHEOhDTb1xOF8vZWnrs=;
        b=VwNxo3jAD7QJP94cb4D4Tv898IE35lMTomZBWEwev4nk0Yl8J+huivTfsZukW9e5QG
         kQYZzN6GkuQmc5BTOB4iQ3xfFlC1440iQm7AoHsUXSBNnwax6IBLn4AYcyRmmnDuJOOl
         eFx/6+ycRRO6tbx54DMejQDYxOR7KPCcVk601s2Ehkv2uo4DVvyakwh/lnA6SsyftLY9
         /5EiNRD77GCede5inCHMbmLSovPwdgocINJ9+q43kc3b3mFWC5mlpNbcAoyKV4NIpQZA
         fXZBQyQdD6iLRg51U6hk29bmuNIVThs+WO459r9ZwgnF9w4mCAqGzSe1BkvpfygiNC0r
         C/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766607173; x=1767211973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgFafpjeEqJV+/mTJcWXWpoWkHEOhDTb1xOF8vZWnrs=;
        b=PrC7FVYqAU0EjH+kbP5boNfL65IIgQ53l0rJcJ2BwqE1p8BPoAxR8ATyuwoEP01ME2
         5I2nsiJ1UJvfVOUQ9gNAwGcN/7TnJtO/aENmIOZFcfYHaLNTSBmtNlLVk1AJwVcgiW3K
         /B9t9fOc+D5YeuUtozCasIud6RoZkq33trnXhKUmDxNm0MKyL+1MweyTtzC2TGTrw+ED
         IT5fMd391YLAy4sSDhB4y/pUEBXj0GLjKGowKPHCGRFQmT28Dcb+OSh8XNnA7tNiYzFI
         aS9fFuNsMcCmr+DPkBSzgd7f23AfPJV0rJKqH5jl0KwZM9qI+Nv2IXBlb9xGWPTEsFFW
         1DXQ==
X-Gm-Message-State: AOJu0YxDLf6Z/Xy4YFCDR9CiBBYLIrO3kM3wMrJOexsIPKfr4C+9pMyI
	oiDvf+myXyYwmLd1Hg+H0fgn9Dct4nKNd2j2I1fC2ETsULmlfwoBV6zTL7KDoISh2ymORJo863G
	5fU1KB4eQWmCWw1FZYHORbptzOvMAxFI=
X-Gm-Gg: AY/fxX4ZTdYTuEjiCyYDz3DhCOGgsV18DZjmQJ65A1AZXdQXVAkJNVhK9wY32bFqEQ4
	w9qceXWR5hPTTJEt19pUge5/nIFK+QLfjdrh9nyIwEpCsC2F7TCMFrMXHh+H/lSyNBrK4p5rkBp
	LsvoltcvrMXTot2I1EIe3aVMs3zO4gRpJYvVjXfFKxlcyO/PAmVgan0EolyIKvLDuxXJNNCYEuO
	AwejSrUk0ADXFzkf+0bKw2XpKYjf0VAcyCuGrIr1hJHK4wgfDaptw4bexmdsoDtGfK/lePSjj/4
	odVpXGJSUrMTPrnysYI44TukyjeiYn5T+/LMHFx1MrGmLfFQCjOG/qGYyUvv5nz/k7cLy/LnvOh
	NRh39t8yzZfE=
X-Google-Smtp-Source: AGHT+IEdQAZT0YW9tCifi/Z/kKssVihThSss+l6u6LTCQ5Bm/YO8bcJd0jSgAreDsTKLn/SYYSCJ6lW8s2zqHaYWxSA=
X-Received: by 2002:a05:690c:4442:b0:788:1cde:cad0 with SMTP id
 00721157ae682-78fb400fa8cmr152143987b3.2.1766607172949; Wed, 24 Dec 2025
 12:12:52 -0800 (PST)
MIME-Version: 1.0
References: <20251223121737.619747-1-skandigraun@gmail.com>
 <CAMKF1sq3yq_akmeoUUQOTQuo63ipwhHQJ3WVW8-LJ1eeLaqpMw@mail.gmail.com> <f352b063-6e82-4896-b404-9400b3e48bdf@gmail.com>
In-Reply-To: <f352b063-6e82-4896-b404-9400b3e48bdf@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Dec 2025 12:12:26 -0800
X-Gm-Features: AQt7F2paby2EHuDbz_IZILbk6JNOo-o_1sIha2YtejiJJwGHJ2Zx597MFDK9_AE
Message-ID: <CAMKF1spLKt1UxZtDkddk-1TNzRfLbm1D6USg4c7yELEEbE860A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] freerdb3: add ptest support
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000005bf40646b84938"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 20:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122899

--000000000000005bf40646b84938
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 24, 2025 at 12:10=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com>
wrote:

> On 12/24/25 21:05, Khem Raj wrote:
> >
> >
> > On Tue, Dec 23, 2025 at 4:17=E2=80=AFAM Gyorgy Sarvari via
> > lists.openembedded.org <http://lists.openembedded.org>
> > <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
> >
> >     The execution takes under 10s.
> >
> >     Sample output:
> >
> >     root@qemux86-64:~# ptest-runner
> >     START: ptest-runner
> >     2025-12-23T11:36
> >     BEGIN: /usr/lib/freerdp3/ptest
> >     PASS: TestSynchInit
> >     PASS: TestSynchEvent
> >     PASS: TestSynchMutex
> >     [...many lines...]
> >     PASS: TestClientRdpFile
> >     PASS: TestClientChannels
> >     PASS: TestClientCmdLine
> >     DURATION: 7
> >     END: /usr/lib/freerdp3/ptest
> >     2025-12-23T11:37
> >     STOP: ptest-runner
> >     TOTAL: 1 FAIL: 0
> >
> >     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >     ---
> >
> >     v2: when I finished v1, I reordered the test data copying part, to
> >     make it nice.
> >         But this reordering made destination of testdata copying to be
> >     non-existent.
> >         v2 created the test folder explicitly in do_install_ptest
> >
> >      .../include/ptest-packagelists-meta-oe.inc    |  1 +
> >      .../freerdp/freerdp3/run-ptest                |  2 +
> >      .../freerdp/freerdp3_3.20.0.bb <http://freerdp3_3.20.0.bb>
> >             | 53 ++++++++++++++++++-
> >      3 files changed, 54 insertions(+), 2 deletions(-)
> >      create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/run-ptest
> >
> >     diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> >     b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> >     index 1f21db7ae1..556fa8a148 100644
> >     --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> >     +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> >     @@ -16,6 +16,7 @@ PTESTS_FAST_META_OE =3D "\
> >          ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> >     'dbus-broker', '', d)} \
> >          duktape \
> >          exiv2 \
> >     +    freerdp3 \
> >          fuse3 \
> >          function2 \
> >          fwupd \
> >     diff --git a/meta-oe/recipes-support/freerdp/freerdp3/run-ptest
> >     b/meta-oe/recipes-support/freerdp/freerdp3/run-ptest
> >     new file mode 100644
> >     index 0000000000..1a9b69c27e
> >     --- /dev/null
> >     +++ b/meta-oe/recipes-support/freerdp/freerdp3/run-ptest
> >     @@ -0,0 +1,2 @@
> >     +#!/bin/sh
> >     +ctest | sed 's/\*\*\*/   /g' | awk '/Test
> >     +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL");
> >     gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
> >     diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
> >     <http://freerdp3_3.20.0.bb>
> >     b/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
> >     <http://freerdp3_3.20.0.bb>
> >     index 07e6db69b7..08bea845f0 100644
> >     --- a/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
> >     <http://freerdp3_3.20.0.bb>
> >     +++ b/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
> >     <http://freerdp3_3.20.0.bb>
> >     @@ -4,11 +4,13 @@ LICENSE =3D "Apache-2.0"
> >      LIC_FILES_CHKSUM =3D
> >     "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
> >
> >      DEPENDS =3D "openssl libusb1 uriparser cairo icu pkcs11-helper zli=
b
> >     jpeg json-c"
> >     +RDEPENDS:${PN}-ptest +=3D "cmake coreutils"
> >
> >     -inherit pkgconfig cmake
> >     +inherit pkgconfig cmake ptest
> >
> >      SRCREV =3D "b8e790a02ede8dd64ff7177fb9027d1844e66bb6"
> >     -SRC_URI =3D
> >     "git://
> github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dhttps;tag=3D${P=
V}
> <http://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dhttps;t=
ag=3D$%7BPV%7D>
> >     <
> http://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dhttps;ta=
g=3D$%7BPV%7D
> >"
> >     +SRC_URI =3D
> >     "git://
> github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dhttps;tag=3D${P=
V}
> <http://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dhttps;t=
ag=3D$%7BPV%7D>
> >     <
> http://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dhttps;ta=
g=3D$%7BPV%7D
> >
> >     \
> >     +           file://run-ptest"
> >
> >
> >      CVE_PRODUCT =3D "freerdp"
> >     @@ -17,6 +19,7 @@ PACKAGECONFIG ??=3D " \
> >          ${@bb.utils.filter('DISTRO_FEATURES', 'pam pulseaudio wayland
> >     x11', d)} \
> >          ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial',
> >     'ffmpeg', '', d)} \
> >          gstreamer cups pcsc \
> >     +    ${@bb.utils.contains('PTEST_ENABLED', '1', 'test openh264',
> >     '', d)} \
> >
> >
> > openh264 is neither in core nor in meta-oe, its in meta-multimedia and
> > meta-oe does not depend upon it rather its other way around
> > I think this needs to added via a dynamic-layer
>
> If I remember well, it's only one testcase that requires it. Maybe it
> would be cleaner if I would just to bin that?
>

That is a good compromise. Add a comment in the recipe so we remember the
context in future.


>
>
> >
> >
> >      "
> >
> >      EXTRA_OECMAKE =3D " \
> >     @@ -54,12 +57,58 @@ PACKAGECONFIG[opencl] =3D
> >     "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,virtual/libopencl1"
> >      PACKAGECONFIG[lame] =3D "-DWITH_LAME=3DON,-DWITH_LAME=3DOFF,lame"
> >      PACKAGECONFIG[faad] =3D "-DWITH_FAAD=3DON,-DWITH_FAAD=3DOFF,faad2"
> >      PACKAGECONFIG[faac] =3D "-DWITH_FAAC=3DON,-DWITH_FAAC=3DOFF,faac"
> >     +PACKAGECONFIG[test] =3D "-DBUILD_TESTING=3DON,-DBUILD_TESTING=3DOF=
F"
> >     +
> >     +do_configure:prepend() {
> >     +    sed -i
> >
>  's|TEST_SOURCE_DIR=3D"\${CMAKE_CURRENT_SOURCE_DIR}"|TEST_SOURCE_DIR=3D"$=
{PTEST_PATH}/test"|'
> >     ${S}/client/common/test/CMakeLists.txt
> >     +    sed -i 's|\${CMAKE_SOURCE_DIR}|${PTEST_PATH}|'
> >     ${S}/winpr/libwinpr/clipboard/test/CMakeLists.txt
> >     +    sed -i
> >     's|=3D"\${CMAKE_CURRENT_SOURCE_DIR}|=3D"${PTEST_PATH}/test|'
> >     ${S}/winpr/libwinpr/utils/test/CMakeLists.txt
> >     +    sed -i
> >     's|=3D"\${CMAKE_CURRENT_BINARY_DIR}|=3D"${PTEST_PATH}/test|'
> >     ${S}/winpr/libwinpr/utils/test/CMakeLists.txt
> >     +    sed -i
> >     's|=3D"\${CMAKE_CURRENT_SOURCE_DIR}|=3D"${PTEST_PATH}/test|'
> >     ${S}/libfreerdp/codec/test/CMakeLists.txt
> >     +    sed -i
> >     's|=3D"\${CMAKE_CURRENT_BINARY_DIR}|=3D"${PTEST_PATH}/test|'
> >     ${S}/libfreerdp/codec/test/CMakeLists.txt
> >     +
> >     +}
> >
> >      do_configure:append() {
> >          sed -i -e 's|${WORKDIR}||g' ${B}/include/freerdp/buildflags.h
> >          sed -i -e 's|${WORKDIR}||g'
> ${B}/winpr/include/winpr/buildflags.h
> >      }
> >
> >     +do_install_ptest() {
> >     +    install -d ${D}${PTEST_PATH}/test
> >     +    # main CTestTestfile.cmake file
> >     +    cp ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
> >     +    # the actual test executables
> >     +    cp -r ${B}/Testing ${D}${PTEST_PATH}
> >     +    # test data
> >     +    cp ${S}/winpr/libwinpr/utils/test/*bmp ${D}${PTEST_PATH}/test/
> >     +    cp ${S}/libfreerdp/codec/test/*bmp ${D}${PTEST_PATH}/test/
> >     +    cp -r ${S}/client/common/test/* ${D}${PTEST_PATH}/test/
> >     +    cp -r ${S}/resources ${D}${PTEST_PATH}
> >     +    cp -r ${S}/libfreerdp/codec/test/planar ${D}${PTEST_PATH}/test=
/
> >     +    cp -r ${S}/libfreerdp/codec/test/interleaved
> >     ${D}${PTEST_PATH}/test/
> >     +
> >     +    cd ${B}
> >     +    # the test definitions, how to execute the tests
> >     +    find . -name CTestTestfile.cmake -exec install -Dm 0644 {}
> >     ${D}${PTEST_PATH}/{} \;
> >     +
> >     +    for testfile in $(find ${D}${PTEST_PATH} -name
> >     CTestTestfile.cmake); do
> >     +        # these are comments only, containing ${S} and ${B}, at
> >     the top of each file
> >     +        sed -i "s,Source directory: ${S},<source_dir>," $testfile
> >     +        sed -i "s,Build directory: ${B},<build_dir>," $testfile
> >     +
> >     +        # change the ${B} to ${PTEST_PATH}, so the files will be
> >     searches at the correct place
> >     +        sed -i "s,${B}/Testing,${PTEST_PATH}/Testing,g" $testfile
> >     +
> >     +        # These add some extra traceability info to the tests, to
> >     pair them with CMakeLists.txt files,
> >     +        # containing ${B}.
> >     +        # They are not needed for test execution, just remove the
> >     whole line.
> >     +        sed -i "s,set_tests_properties.*_BACKTRACE_TRIPLES.*,,"
> >     $testfile
> >     +    done
> >     +
> >     +    rm ${D}${PTEST_PATH}/resources/conv_to_ewm_prop.py
> >     +}
> >     +
> >      PACKAGES =3D+ "${PN}-proxy-plugins"
> >
> >      FILES:${PN}-proxy-plugins +=3D "${libdir}/${BPN}/proxy/*.so*"
> >
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#122836):
> >     https://lists.openembedded.org/g/openembedded-devel/message/122836
> >     Mute This Topic: https://lists.openembedded.org/mt/116914811/199791=
4
> >     Group Owner: openembedded-devel+owner@lists.openembedded.org
> >     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
> >     Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-devel/unsub
> >     [raj.khem@gmail.com]
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000005bf40646b84938
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 24,=
 2025 at 12:10=E2=80=AFPM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@=
gmail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 12/24/25 21:05, Khem Raj wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Dec 23, 2025 at 4:17=E2=80=AFAM Gyorgy Sarvari via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;<a href=3D"http://lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org</=
a>&gt;<br>
&gt; &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" =
target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The execution takes under 10s.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Sample output:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0root@qemux86-64:~# ptest-runner<br>
&gt;=C2=A0 =C2=A0 =C2=A0START: ptest-runner<br>
&gt;=C2=A0 =C2=A0 =C2=A02025-12-23T11:36<br>
&gt;=C2=A0 =C2=A0 =C2=A0BEGIN: /usr/lib/freerdp3/ptest<br>
&gt;=C2=A0 =C2=A0 =C2=A0PASS: TestSynchInit<br>
&gt;=C2=A0 =C2=A0 =C2=A0PASS: TestSynchEvent<br>
&gt;=C2=A0 =C2=A0 =C2=A0PASS: TestSynchMutex<br>
&gt;=C2=A0 =C2=A0 =C2=A0[...many lines...]<br>
&gt;=C2=A0 =C2=A0 =C2=A0PASS: TestClientRdpFile<br>
&gt;=C2=A0 =C2=A0 =C2=A0PASS: TestClientChannels<br>
&gt;=C2=A0 =C2=A0 =C2=A0PASS: TestClientCmdLine<br>
&gt;=C2=A0 =C2=A0 =C2=A0DURATION: 7<br>
&gt;=C2=A0 =C2=A0 =C2=A0END: /usr/lib/freerdp3/ptest<br>
&gt;=C2=A0 =C2=A0 =C2=A02025-12-23T11:37<br>
&gt;=C2=A0 =C2=A0 =C2=A0STOP: ptest-runner<br>
&gt;=C2=A0 =C2=A0 =C2=A0TOTAL: 1 FAIL: 0<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto=
:skandigraun@gmail.com" target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0v2: when I finished v1, I reordered the test data c=
opying part, to<br>
&gt;=C2=A0 =C2=A0 =C2=A0make it nice.<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 But this reordering made destination =
of testdata copying to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0non-existent.<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 v2 created the test folder explicitly=
 in do_install_ptest<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../include/ptest-packagelists-meta-oe.inc=C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../freerdp/freerdp3/run-ptest=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../freerdp/<a href=3D"http://freerdp3_3.20.0=
.bb" rel=3D"noreferrer" target=3D"_blank">freerdp3_3.20.0.bb</a> &lt;<a hre=
f=3D"http://freerdp3_3.20.0.bb" rel=3D"noreferrer" target=3D"_blank">http:/=
/freerdp3_3.20.0.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 53 ++++++++++++++++++=
-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A03 files changed, 54 insertions(+), 2 deletion=
s(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-oe/recipes-support/fr=
eerdp/freerdp3/run-ptest<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-oe/conf/include/ptest-packagelist=
s-meta-oe.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta-oe/conf/include/ptest-packagelists-meta-oe.i=
nc<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 1f21db7ae1..556fa8a148 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta-oe/conf/include/ptest-packagelists-meta-=
oe.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-oe/conf/include/ptest-packagelists-meta-=
oe.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -16,6 +16,7 @@ PTESTS_FAST_META_OE =3D &quot;\<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTR=
O_FEATURES&#39;, &#39;systemd&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;dbus-broker&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0duktape \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0exiv2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 freerdp3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0fuse3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0function2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0fwupd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-oe/recipes-support/freerdp/freerd=
p3/run-ptest<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta-oe/recipes-support/freerdp/freerdp3/run-ptes=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000000..1a9b69c27e<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-oe/recipes-support/freerdp/freerdp3/run-=
ptest<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,2 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#!/bin/sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ctest | sed &#39;s/\*\*\*/=C2=A0 =C2=A0/g&#39; | a=
wk &#39;/Test<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#/{gsub(/Passed/,&quot;PASS&quot;); gsub(/Failed/,=
&quot;FAIL&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0gsub(/Skipped/,&quot;SKIP&quot;); print $6&quot;: &=
quot;$4; fflush();}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-oe/recipes-support/freerdp/<a hre=
f=3D"http://freerdp3_3.20.0.bb" rel=3D"noreferrer" target=3D"_blank">freerd=
p3_3.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://freerdp3_3.20.0.bb" rel=3D"no=
referrer" target=3D"_blank">http://freerdp3_3.20.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta-oe/recipes-support/freerdp/<a href=3D"http:/=
/freerdp3_3.20.0.bb" rel=3D"noreferrer" target=3D"_blank">freerdp3_3.20.0.b=
b</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://freerdp3_3.20.0.bb" rel=3D"no=
referrer" target=3D"_blank">http://freerdp3_3.20.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 07e6db69b7..08bea845f0 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta-oe/recipes-support/freerdp/<a href=3D"ht=
tp://freerdp3_3.20.0.bb" rel=3D"noreferrer" target=3D"_blank">freerdp3_3.20=
.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://freerdp3_3.20.0.bb" rel=3D"no=
referrer" target=3D"_blank">http://freerdp3_3.20.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-oe/recipes-support/freerdp/<a href=3D"ht=
tp://freerdp3_3.20.0.bb" rel=3D"noreferrer" target=3D"_blank">freerdp3_3.20=
.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://freerdp3_3.20.0.bb" rel=3D"no=
referrer" target=3D"_blank">http://freerdp3_3.20.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -4,11 +4,13 @@ LICENSE =3D &quot;Apache-2.0&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0LIC_FILES_CHKSUM =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;file://LICENSE;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0DEPENDS =3D &quot;openssl libusb1 uriparser c=
airo icu pkcs11-helper zlib<br>
&gt;=C2=A0 =C2=A0 =C2=A0jpeg json-c&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+RDEPENDS:${PN}-ptest +=3D &quot;cmake coreutils&qu=
ot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-inherit pkgconfig cmake<br>
&gt;=C2=A0 =C2=A0 =C2=A0+inherit pkgconfig cmake ptest<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0SRCREV =3D &quot;b8e790a02ede8dd64ff7177fb902=
7d1844e66bb6&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;git://<a href=3D"http://github.com/FreeRDP/Fr=
eeRDP.git;branch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferr=
er" target=3D"_blank">github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protoc=
ol=3Dhttps;tag=3D${PV}</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://github.com/FreeRDP/FreeRDP.gi=
t;branch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" targ=
et=3D"_blank">http://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protoco=
l=3Dhttps;tag=3D$%7BPV%7D</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;git://<a href=3D"http://github.com/FreeRDP/Fr=
eeRDP.git;branch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferr=
er" target=3D"_blank">github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protoc=
ol=3Dhttps;tag=3D${PV}</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://github.com/FreeRDP/FreeRDP.gi=
t;branch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" targ=
et=3D"_blank">http://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protoco=
l=3Dhttps;tag=3D$%7BPV%7D</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ru=
n-ptest&quot;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0CVE_PRODUCT =3D &quot;freerdp&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -17,6 +19,7 @@ PACKAGECONFIG ??=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_=
FEATURES&#39;, &#39;pam pulseaudio wayland<br>
&gt;=C2=A0 =C2=A0 =C2=A0x11&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;LICEN=
SE_FLAGS_ACCEPTED&#39;, &#39;commercial&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;ffmpeg&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0gstreamer cups pcsc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PTEST_ENAB=
LED&#39;, &#39;1&#39;, &#39;test openh264&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;&#39;, d)} \<br>
&gt;<br>
&gt;<br>
&gt; openh264 is neither in core nor in meta-oe, its in meta-multimedia and=
<br>
&gt; meta-oe does not depend upon it rather its other way around<br>
&gt; I think this needs to added via a dynamic-layer=C2=A0<br>
<br>
If I remember well, it&#39;s only one testcase that requires it. Maybe it<b=
r>
would be cleaner if I would just to bin that?<br></blockquote><div><br></di=
v><div>That is a good compromise. Add a comment in the recipe so we remembe=
r the</div><div>context in future.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
<br>
&gt; =C2=A0<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0EXTRA_OECMAKE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -54,12 +57,58 @@ PACKAGECONFIG[opencl] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,virtua=
l/libopencl1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0PACKAGECONFIG[lame] =3D &quot;-DWITH_LAME=3DO=
N,-DWITH_LAME=3DOFF,lame&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0PACKAGECONFIG[faad] =3D &quot;-DWITH_FAAD=3DO=
N,-DWITH_FAAD=3DOFF,faad2&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0PACKAGECONFIG[faac] =3D &quot;-DWITH_FAAC=3DO=
N,-DWITH_FAAC=3DOFF,faac&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[test] =3D &quot;-DBUILD_TESTING=3DON=
,-DBUILD_TESTING=3DOFF&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+do_configure:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 sed -i<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;s|TEST_SOURCE_DIR=3D&quot;\${CMAKE_CURRENT_SOU=
RCE_DIR}&quot;|TEST_SOURCE_DIR=3D&quot;${PTEST_PATH}/test&quot;|&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0${S}/client/common/test/CMakeLists.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 sed -i &#39;s|\${CMAKE_SOURCE_DIR}|$=
{PTEST_PATH}|&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0${S}/winpr/libwinpr/clipboard/test/CMakeLists.txt<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 sed -i<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;s|=3D&quot;\${CMAKE_CURRENT_SOURCE_DIR}|=3D&qu=
ot;${PTEST_PATH}/test|&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0${S}/winpr/libwinpr/utils/test/CMakeLists.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 sed -i<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;s|=3D&quot;\${CMAKE_CURRENT_BINARY_DIR}|=3D&qu=
ot;${PTEST_PATH}/test|&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0${S}/winpr/libwinpr/utils/test/CMakeLists.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 sed -i<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;s|=3D&quot;\${CMAKE_CURRENT_SOURCE_DIR}|=3D&qu=
ot;${PTEST_PATH}/test|&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0${S}/libfreerdp/codec/test/CMakeLists.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 sed -i<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;s|=3D&quot;\${CMAKE_CURRENT_BINARY_DIR}|=3D&qu=
ot;${PTEST_PATH}/test|&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0${S}/libfreerdp/codec/test/CMakeLists.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0do_configure:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s|${WORKDIR}||g&=
#39; ${B}/include/freerdp/buildflags.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s|${WORKDIR}||g&=
#39; ${B}/winpr/include/winpr/buildflags.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+do_install_ptest() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/test<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 # main CTestTestfile.cmake file<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 cp ${B}/CTestTestfile.cmake ${D}${PT=
EST_PATH}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 # the actual test executables<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 cp -r ${B}/Testing ${D}${PTEST_PATH}=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 # test data<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 cp ${S}/winpr/libwinpr/utils/test/*b=
mp ${D}${PTEST_PATH}/test/<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 cp ${S}/libfreerdp/codec/test/*bmp $=
{D}${PTEST_PATH}/test/<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 cp -r ${S}/client/common/test/* ${D}=
${PTEST_PATH}/test/<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 cp -r ${S}/resources ${D}${PTEST_PAT=
H}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 cp -r ${S}/libfreerdp/codec/test/pla=
nar ${D}${PTEST_PATH}/test/<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 cp -r ${S}/libfreerdp/codec/test/int=
erleaved<br>
&gt;=C2=A0 =C2=A0 =C2=A0${D}${PTEST_PATH}/test/<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 cd ${B}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 # the test definitions, how to execu=
te the tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 find . -name CTestTestfile.cmake -ex=
ec install -Dm 0644 {}<br>
&gt;=C2=A0 =C2=A0 =C2=A0${D}${PTEST_PATH}/{} \;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 for testfile in $(find ${D}${PTEST_P=
ATH} -name<br>
&gt;=C2=A0 =C2=A0 =C2=A0CTestTestfile.cmake); do<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # these are comments o=
nly, containing ${S} and ${B}, at<br>
&gt;=C2=A0 =C2=A0 =C2=A0the top of each file<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s,Source =
directory: ${S},&lt;source_dir&gt;,&quot; $testfile<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s,Build d=
irectory: ${B},&lt;build_dir&gt;,&quot; $testfile<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # change the ${B} to $=
{PTEST_PATH}, so the files will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0searches at the correct place<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s,${B}/Te=
sting,${PTEST_PATH}/Testing,g&quot; $testfile<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # These add some extra=
 traceability info to the tests, to<br>
&gt;=C2=A0 =C2=A0 =C2=A0pair them with CMakeLists.txt files,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # containing ${B}.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # They are not needed =
for test execution, just remove the<br>
&gt;=C2=A0 =C2=A0 =C2=A0whole line.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s,set_tes=
ts_properties.*_BACKTRACE_TRIPLES.*,,&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0$testfile<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 done<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 rm ${D}${PTEST_PATH}/resources/conv_=
to_ewm_prop.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0PACKAGES =3D+ &quot;${PN}-proxy-plugins&quot;=
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0FILES:${PN}-proxy-plugins +=3D &quot;${libdir=
}/${BPN}/proxy/*.so*&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent to this group.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#122836):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-devel/message/122836" rel=3D"noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/g/openembedded-devel/message/122836</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=3D"https://lists.openembed=
ded.org/mt/116914811/1997914" rel=3D"noreferrer" target=3D"_blank">https://=
lists.openembedded.org/mt/116914811/1997914</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mailto:openembedded-devel%2=
Bowner@lists.openembedded.org" target=3D"_blank">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-devel%252=
Bowner@lists.openembedded.org" target=3D"_blank">openembedded-devel%2Bowner=
@lists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000005bf40646b84938--

