Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66C1E7848E
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 20:05:35 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127568.1766606729262850667
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 12:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JJ5j8Der;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64472c71fc0so5270015d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 12:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766606728; x=1767211528; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx5uQf8lgaymg34Kbo6TDQktE025W9XgSr6ct/wZuCk=;
        b=JJ5j8Der4icYnfF6TQDnuH5ZwLHOEESnKK7jNcW4QkHRW0DlClG9Vlgh+OzrSkwWwJ
         RXLH2cQmpBtpwwAY56RMIS7yIPKFtLGndjlPRZVGnKrbcsNd8kBy9ezdvtMyq7Q8l/MO
         N9HDa54XztNMKbSfHf8cgKZHpGV3acNlSXPgkJU/6ZZwd0GwSjPfn+5qlY6o/s4KiFBm
         2UFG5yfFf0gAeX/4u6W54F/o7FG33gHSeASUWkgRUgxEgIYxKFRiM3cvLbMb1ak10Wbz
         gqkTTxiz+J0YKXBQsSPKCE6ZdvSpdUH0ErnRP2H6jhwtPNUFVnsSD9qvfjkhgTXarFgm
         oUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766606728; x=1767211528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yx5uQf8lgaymg34Kbo6TDQktE025W9XgSr6ct/wZuCk=;
        b=I82jrcgUi/9c9hs5UnSYQcAzp/AejT7VvM00Or0g9pYLYlUlU1BcXt7VtfaJoBitHR
         X8M900FBJ21N/mM0EKzu6n9igh45v9v/fgGlusWbjrc/YkQcGIreMhA2u2nwSNFAGEYL
         IzQja2oMKUzGLtMnwP7SYbGzrDGM9Y9NndFRjW9+xgLKD72CxdfpGeyTgG3ZO5IRcgIa
         4eA4eN4JnOnKC2c1QoVrrb3vuM6Dz/eHrv7+aqkX0eZG+csIhWVC34VhZGnVNuzAk8uc
         dA8rXCO4CDiKSVGpr7PcZAndeqZpvvJQ8nOaXx8L70TQIMrrRoEqbjeTRDtgx4VVe9Uo
         BIkA==
X-Gm-Message-State: AOJu0YwMIaEV0SUZnkWim4hFwmm84YNCR9tuIPt79/N+bcsJ0b9+L8ls
	/79cB2yuruxnZSIjcUlppn4TngrHs0bQ9Zc6qcd9d1WFEFXK9vGYuBAKO7iRUO+m62r6k5yDsHv
	bucVAGc+U4cjig0xkZjg0WjI7eM9DPTA=
X-Gm-Gg: AY/fxX73GkPpKLNT6G18ZLgGo/ucsohuabwUhGufE6Dc3ObTfLzNF9Otworg/dQauGc
	NYP0ioAaxw0EU7fs+sdngselJRrYyCDswRIn/I7EP6wb2HTNAI31XgNgxlISp8NTcm7o7GQFqTZ
	29iiV25YhKbEyyyMn4UGkH/RdPek4of4xQNHDiRJ5wjO4CZqqI3M39dvsQVmfhSZuDIZpZ9VYtM
	kQ7MXnBNrJWLJU4PxUZbHV/9X28w1zHBo56GW9mRqU6JUasJhW7hTSA/YLT2W8LawSb9MwRChiL
	SQ+zYOSm8nvgiCtsvWmbdHfWtb6HGDLgsKaNnQmjP1m9f69JOxkDWQ5OurJo5SrQGtJJHD9uMQ6
	sAPaC57EnHbk=
X-Google-Smtp-Source: AGHT+IE+6My7mkUlCOG6jsB8jO7GJ91eoPYNmni0IOEZDhnDFiXZKPh6kQrWBvK5PXSY+yAQ0AFheRYGP/l72/d5IeY=
X-Received: by 2002:a53:d019:0:b0:63f:ab8d:a572 with SMTP id
 956f58d0204a3-6466a834c3bmr10011609d50.4.1766606728093; Wed, 24 Dec 2025
 12:05:28 -0800 (PST)
MIME-Version: 1.0
References: <20251223121737.619747-1-skandigraun@gmail.com>
In-Reply-To: <20251223121737.619747-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Dec 2025 12:05:02 -0800
X-Gm-Features: AQt7F2qtzXBdSZTIZeGw5lLMueIze9rRvMa-r-iheQxlGb5J1W0yhNlav4o5WS8
Message-ID: <CAMKF1sq3yq_akmeoUUQOTQuo63ipwhHQJ3WVW8-LJ1eeLaqpMw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] freerdb3: add ptest support
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007c663b0646b82e8e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 20:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122897

--0000000000007c663b0646b82e8e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 4:17=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> The execution takes under 10s.
>
> Sample output:
>
> root@qemux86-64:~# ptest-runner
> START: ptest-runner
> 2025-12-23T11:36
> BEGIN: /usr/lib/freerdp3/ptest
> PASS: TestSynchInit
> PASS: TestSynchEvent
> PASS: TestSynchMutex
> [...many lines...]
> PASS: TestClientRdpFile
> PASS: TestClientChannels
> PASS: TestClientCmdLine
> DURATION: 7
> END: /usr/lib/freerdp3/ptest
> 2025-12-23T11:37
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>
> v2: when I finished v1, I reordered the test data copying part, to make i=
t
> nice.
>     But this reordering made destination of testdata copying to be
> non-existent.
>     v2 created the test folder explicitly in do_install_ptest
>
>  .../include/ptest-packagelists-meta-oe.inc    |  1 +
>  .../freerdp/freerdp3/run-ptest                |  2 +
>  .../freerdp/freerdp3_3.20.0.bb                | 53 ++++++++++++++++++-
>  3 files changed, 54 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/run-ptest
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> index 1f21db7ae1..556fa8a148 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -16,6 +16,7 @@ PTESTS_FAST_META_OE =3D "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'dbus-broker', ''=
,
> d)} \
>      duktape \
>      exiv2 \
> +    freerdp3 \
>      fuse3 \
>      function2 \
>      fwupd \
> diff --git a/meta-oe/recipes-support/freerdp/freerdp3/run-ptest
> b/meta-oe/recipes-support/freerdp/freerdp3/run-ptest
> new file mode 100644
> index 0000000000..1a9b69c27e
> --- /dev/null
> +++ b/meta-oe/recipes-support/freerdp/freerdp3/run-ptest
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +ctest | sed 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS");
> gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}=
'
> diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
> b/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
> index 07e6db69b7..08bea845f0 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp3_3.20.0.bb
> @@ -4,11 +4,13 @@ LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
>
>  DEPENDS =3D "openssl libusb1 uriparser cairo icu pkcs11-helper zlib jpeg
> json-c"
> +RDEPENDS:${PN}-ptest +=3D "cmake coreutils"
>
> -inherit pkgconfig cmake
> +inherit pkgconfig cmake ptest
>
>  SRCREV =3D "b8e790a02ede8dd64ff7177fb9027d1844e66bb6"
> -SRC_URI =3D "git://
> github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dhttps;tag=3D${P=
V}
> <http://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dhttps;t=
ag=3D$%7BPV%7D>
> "
> +SRC_URI =3D "git://
> github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dhttps;tag=3D${P=
V}
> <http://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dhttps;t=
ag=3D$%7BPV%7D>
> \
> +           file://run-ptest"
>
>
>  CVE_PRODUCT =3D "freerdp"
> @@ -17,6 +19,7 @@ PACKAGECONFIG ??=3D " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'pam pulseaudio wayland x11',
> d)} \
>      ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial',
> 'ffmpeg', '', d)} \
>      gstreamer cups pcsc \
> +    ${@bb.utils.contains('PTEST_ENABLED', '1', 'test openh264', '', d)} =
\
>

openh264 is neither in core nor in meta-oe, its in meta-multimedia and
meta-oe does not depend upon it rather its other way around
I think this needs to added via a dynamic-layer


>  "
>
>  EXTRA_OECMAKE =3D " \
> @@ -54,12 +57,58 @@ PACKAGECONFIG[opencl] =3D
> "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,virtual/libopencl1"
>  PACKAGECONFIG[lame] =3D "-DWITH_LAME=3DON,-DWITH_LAME=3DOFF,lame"
>  PACKAGECONFIG[faad] =3D "-DWITH_FAAD=3DON,-DWITH_FAAD=3DOFF,faad2"
>  PACKAGECONFIG[faac] =3D "-DWITH_FAAC=3DON,-DWITH_FAAC=3DOFF,faac"
> +PACKAGECONFIG[test] =3D "-DBUILD_TESTING=3DON,-DBUILD_TESTING=3DOFF"
> +
> +do_configure:prepend() {
> +    sed -i
> 's|TEST_SOURCE_DIR=3D"\${CMAKE_CURRENT_SOURCE_DIR}"|TEST_SOURCE_DIR=3D"${=
PTEST_PATH}/test"|'
> ${S}/client/common/test/CMakeLists.txt
> +    sed -i 's|\${CMAKE_SOURCE_DIR}|${PTEST_PATH}|'
> ${S}/winpr/libwinpr/clipboard/test/CMakeLists.txt
> +    sed -i 's|=3D"\${CMAKE_CURRENT_SOURCE_DIR}|=3D"${PTEST_PATH}/test|'
> ${S}/winpr/libwinpr/utils/test/CMakeLists.txt
> +    sed -i 's|=3D"\${CMAKE_CURRENT_BINARY_DIR}|=3D"${PTEST_PATH}/test|'
> ${S}/winpr/libwinpr/utils/test/CMakeLists.txt
> +    sed -i 's|=3D"\${CMAKE_CURRENT_SOURCE_DIR}|=3D"${PTEST_PATH}/test|'
> ${S}/libfreerdp/codec/test/CMakeLists.txt
> +    sed -i 's|=3D"\${CMAKE_CURRENT_BINARY_DIR}|=3D"${PTEST_PATH}/test|'
> ${S}/libfreerdp/codec/test/CMakeLists.txt
> +
> +}
>
>  do_configure:append() {
>      sed -i -e 's|${WORKDIR}||g' ${B}/include/freerdp/buildflags.h
>      sed -i -e 's|${WORKDIR}||g' ${B}/winpr/include/winpr/buildflags.h
>  }
>
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/test
> +    # main CTestTestfile.cmake file
> +    cp ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
> +    # the actual test executables
> +    cp -r ${B}/Testing ${D}${PTEST_PATH}
> +    # test data
> +    cp ${S}/winpr/libwinpr/utils/test/*bmp ${D}${PTEST_PATH}/test/
> +    cp ${S}/libfreerdp/codec/test/*bmp ${D}${PTEST_PATH}/test/
> +    cp -r ${S}/client/common/test/* ${D}${PTEST_PATH}/test/
> +    cp -r ${S}/resources ${D}${PTEST_PATH}
> +    cp -r ${S}/libfreerdp/codec/test/planar ${D}${PTEST_PATH}/test/
> +    cp -r ${S}/libfreerdp/codec/test/interleaved ${D}${PTEST_PATH}/test/
> +
> +    cd ${B}
> +    # the test definitions, how to execute the tests
> +    find . -name CTestTestfile.cmake -exec install -Dm 0644 {}
> ${D}${PTEST_PATH}/{} \;
> +
> +    for testfile in $(find ${D}${PTEST_PATH} -name CTestTestfile.cmake);
> do
> +        # these are comments only, containing ${S} and ${B}, at the top
> of each file
> +        sed -i "s,Source directory: ${S},<source_dir>," $testfile
> +        sed -i "s,Build directory: ${B},<build_dir>," $testfile
> +
> +        # change the ${B} to ${PTEST_PATH}, so the files will be searche=
s
> at the correct place
> +        sed -i "s,${B}/Testing,${PTEST_PATH}/Testing,g" $testfile
> +
> +        # These add some extra traceability info to the tests, to pair
> them with CMakeLists.txt files,
> +        # containing ${B}.
> +        # They are not needed for test execution, just remove the whole
> line.
> +        sed -i "s,set_tests_properties.*_BACKTRACE_TRIPLES.*,," $testfil=
e
> +    done
> +
> +    rm ${D}${PTEST_PATH}/resources/conv_to_ewm_prop.py
> +}
> +
>  PACKAGES =3D+ "${PN}-proxy-plugins"
>
>  FILES:${PN}-proxy-plugins +=3D "${libdir}/${BPN}/proxy/*.so*"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122836):
> https://lists.openembedded.org/g/openembedded-devel/message/122836
> Mute This Topic: https://lists.openembedded.org/mt/116914811/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007c663b0646b82e8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 23,=
 2025 at 4:17=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The execut=
ion takes under 10s.<br>
<br>
Sample output:<br>
<br>
root@qemux86-64:~# ptest-runner<br>
START: ptest-runner<br>
2025-12-23T11:36<br>
BEGIN: /usr/lib/freerdp3/ptest<br>
PASS: TestSynchInit<br>
PASS: TestSynchEvent<br>
PASS: TestSynchMutex<br>
[...many lines...]<br>
PASS: TestClientRdpFile<br>
PASS: TestClientChannels<br>
PASS: TestClientCmdLine<br>
DURATION: 7<br>
END: /usr/lib/freerdp3/ptest<br>
2025-12-23T11:37<br>
STOP: ptest-runner<br>
TOTAL: 1 FAIL: 0<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
<br>
v2: when I finished v1, I reordered the test data copying part, to make it =
nice.<br>
=C2=A0 =C2=A0 But this reordering made destination of testdata copying to b=
e non-existent.<br>
=C2=A0 =C2=A0 v2 created the test folder explicitly in do_install_ptest<br>
<br>
=C2=A0.../include/ptest-packagelists-meta-oe.inc=C2=A0 =C2=A0 |=C2=A0 1 +<b=
r>
=C2=A0.../freerdp/freerdp3/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
=C2=A0.../freerdp/<a href=3D"http://freerdp3_3.20.0.bb" rel=3D"noreferrer" =
target=3D"_blank">freerdp3_3.20.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 53 ++++++++++++++++++-<br>
=C2=A03 files changed, 54 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/run-ptest=
<br>
<br>
diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/=
conf/include/ptest-packagelists-meta-oe.inc<br>
index 1f21db7ae1..556fa8a148 100644<br>
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
@@ -16,6 +16,7 @@ PTESTS_FAST_META_OE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
stemd&#39;, &#39;dbus-broker&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0duktape \<br>
=C2=A0 =C2=A0 =C2=A0exiv2 \<br>
+=C2=A0 =C2=A0 freerdp3 \<br>
=C2=A0 =C2=A0 =C2=A0fuse3 \<br>
=C2=A0 =C2=A0 =C2=A0function2 \<br>
=C2=A0 =C2=A0 =C2=A0fwupd \<br>
diff --git a/meta-oe/recipes-support/freerdp/freerdp3/run-ptest b/meta-oe/r=
ecipes-support/freerdp/freerdp3/run-ptest<br>
new file mode 100644<br>
index 0000000000..1a9b69c27e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/freerdp/freerdp3/run-ptest<br>
@@ -0,0 +1,2 @@<br>
+#!/bin/sh<br>
+ctest | sed &#39;s/\*\*\*/=C2=A0 =C2=A0/g&#39; | awk &#39;/Test +#/{gsub(/=
Passed/,&quot;PASS&quot;); gsub(/Failed/,&quot;FAIL&quot;); gsub(/Skipped/,=
&quot;SKIP&quot;); print $6&quot;: &quot;$4; fflush();}&#39;<br>
diff --git a/meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp3_3.2=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">freerdp3_3.20.0.bb</a> b/meta-=
oe/recipes-support/freerdp/<a href=3D"http://freerdp3_3.20.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">freerdp3_3.20.0.bb</a><br>
index 07e6db69b7..08bea845f0 100644<br>
--- a/meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp3_3.20.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">freerdp3_3.20.0.bb</a><br>
+++ b/meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp3_3.20.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">freerdp3_3.20.0.bb</a><br>
@@ -4,11 +4,13 @@ LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;openssl libusb1 uriparser cairo icu pkcs11-helper z=
lib jpeg json-c&quot;<br>
+RDEPENDS:${PN}-ptest +=3D &quot;cmake coreutils&quot;<br>
<br>
-inherit pkgconfig cmake<br>
+inherit pkgconfig cmake ptest<br>
<br>
=C2=A0SRCREV =3D &quot;b8e790a02ede8dd64ff7177fb9027d1844e66bb6&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/FreeRDP/FreeRDP.git;b=
ranch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=
=3D"_blank">github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dhttps=
;tag=3D${PV}</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/FreeRDP/FreeRDP.git;b=
ranch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=
=3D"_blank">github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dhttps=
;tag=3D${PV}</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest&quot;<br>
<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;freerdp&quot;<br>
@@ -17,6 +19,7 @@ PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;pam =
pulseaudio wayland x11&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;LICENSE_FLAGS_ACCEPTED&#39;, =
&#39;commercial&#39;, &#39;ffmpeg&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0gstreamer cups pcsc \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PTEST_ENABLED&#39;, &#39;1&#39;, &=
#39;test openh264&#39;, &#39;&#39;, d)} \<br></blockquote><div><br></div><d=
iv>openh264 is neither in core nor in meta-oe, its in meta-multimedia and m=
eta-oe does not depend upon it rather its other way around</div><div>I thin=
k this needs to added via a dynamic-layer=C2=A0</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE =3D &quot; \<br>
@@ -54,12 +57,58 @@ PACKAGECONFIG[opencl] =3D &quot;-DWITH_OPENCL=3DON,-DWI=
TH_OPENCL=3DOFF,virtual/libopencl1&quot;<br>
=C2=A0PACKAGECONFIG[lame] =3D &quot;-DWITH_LAME=3DON,-DWITH_LAME=3DOFF,lame=
&quot;<br>
=C2=A0PACKAGECONFIG[faad] =3D &quot;-DWITH_FAAD=3DON,-DWITH_FAAD=3DOFF,faad=
2&quot;<br>
=C2=A0PACKAGECONFIG[faac] =3D &quot;-DWITH_FAAC=3DON,-DWITH_FAAC=3DOFF,faac=
&quot;<br>
+PACKAGECONFIG[test] =3D &quot;-DBUILD_TESTING=3DON,-DBUILD_TESTING=3DOFF&q=
uot;<br>
+<br>
+do_configure:prepend() {<br>
+=C2=A0 =C2=A0 sed -i &#39;s|TEST_SOURCE_DIR=3D&quot;\${CMAKE_CURRENT_SOURC=
E_DIR}&quot;|TEST_SOURCE_DIR=3D&quot;${PTEST_PATH}/test&quot;|&#39; ${S}/cl=
ient/common/test/CMakeLists.txt<br>
+=C2=A0 =C2=A0 sed -i &#39;s|\${CMAKE_SOURCE_DIR}|${PTEST_PATH}|&#39; ${S}/=
winpr/libwinpr/clipboard/test/CMakeLists.txt<br>
+=C2=A0 =C2=A0 sed -i &#39;s|=3D&quot;\${CMAKE_CURRENT_SOURCE_DIR}|=3D&quot=
;${PTEST_PATH}/test|&#39; ${S}/winpr/libwinpr/utils/test/CMakeLists.txt<br>
+=C2=A0 =C2=A0 sed -i &#39;s|=3D&quot;\${CMAKE_CURRENT_BINARY_DIR}|=3D&quot=
;${PTEST_PATH}/test|&#39; ${S}/winpr/libwinpr/utils/test/CMakeLists.txt<br>
+=C2=A0 =C2=A0 sed -i &#39;s|=3D&quot;\${CMAKE_CURRENT_SOURCE_DIR}|=3D&quot=
;${PTEST_PATH}/test|&#39; ${S}/libfreerdp/codec/test/CMakeLists.txt<br>
+=C2=A0 =C2=A0 sed -i &#39;s|=3D&quot;\${CMAKE_CURRENT_BINARY_DIR}|=3D&quot=
;${PTEST_PATH}/test|&#39; ${S}/libfreerdp/codec/test/CMakeLists.txt<br>
+<br>
+}<br>
<br>
=C2=A0do_configure:append() {<br>
=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s|${WORKDIR}||g&#39; ${B}/include/freerd=
p/buildflags.h<br>
=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s|${WORKDIR}||g&#39; ${B}/winpr/include/=
winpr/buildflags.h<br>
=C2=A0}<br>
<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/test<br>
+=C2=A0 =C2=A0 # main CTestTestfile.cmake file<br>
+=C2=A0 =C2=A0 cp ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 # the actual test executables<br>
+=C2=A0 =C2=A0 cp -r ${B}/Testing ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 # test data<br>
+=C2=A0 =C2=A0 cp ${S}/winpr/libwinpr/utils/test/*bmp ${D}${PTEST_PATH}/tes=
t/<br>
+=C2=A0 =C2=A0 cp ${S}/libfreerdp/codec/test/*bmp ${D}${PTEST_PATH}/test/<b=
r>
+=C2=A0 =C2=A0 cp -r ${S}/client/common/test/* ${D}${PTEST_PATH}/test/<br>
+=C2=A0 =C2=A0 cp -r ${S}/resources ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 cp -r ${S}/libfreerdp/codec/test/planar ${D}${PTEST_PATH}/te=
st/<br>
+=C2=A0 =C2=A0 cp -r ${S}/libfreerdp/codec/test/interleaved ${D}${PTEST_PAT=
H}/test/<br>
+<br>
+=C2=A0 =C2=A0 cd ${B}<br>
+=C2=A0 =C2=A0 # the test definitions, how to execute the tests<br>
+=C2=A0 =C2=A0 find . -name CTestTestfile.cmake -exec install -Dm 0644 {} $=
{D}${PTEST_PATH}/{} \;<br>
+<br>
+=C2=A0 =C2=A0 for testfile in $(find ${D}${PTEST_PATH} -name CTestTestfile=
.cmake); do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # these are comments only, containing ${S} and=
 ${B}, at the top of each file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s,Source directory: ${S},&lt;sour=
ce_dir&gt;,&quot; $testfile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s,Build directory: ${B},&lt;build=
_dir&gt;,&quot; $testfile<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # change the ${B} to ${PTEST_PATH}, so the fil=
es will be searches at the correct place<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s,${B}/Testing,${PTEST_PATH}/Test=
ing,g&quot; $testfile<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # These add some extra traceability info to th=
e tests, to pair them with CMakeLists.txt files,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # containing ${B}.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # They are not needed for test execution, just=
 remove the whole line.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s,set_tests_properties.*_BACKTRAC=
E_TRIPLES.*,,&quot; $testfile<br>
+=C2=A0 =C2=A0 done<br>
+<br>
+=C2=A0 =C2=A0 rm ${D}${PTEST_PATH}/resources/conv_to_ewm_prop.py<br>
+}<br>
+<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-proxy-plugins&quot;<br>
<br>
=C2=A0FILES:${PN}-proxy-plugins +=3D &quot;${libdir}/${BPN}/proxy/*.so*&quo=
t;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122836): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122836" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122836</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116914811/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116914811/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007c663b0646b82e8e--

