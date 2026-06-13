Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CE5CD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 07:33:43 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87062.1781336012874484648
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 00:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Imjn4hA5;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3965adfd75fso16414891fa.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 00:33:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781336010; cv=none;
        d=google.com; s=arc-20240605;
        b=aIv+pc9/FZI7A6boy5lNV1dnbT3xjrfRe0jTA60/1868iuP4+qDEV9n1qToIsP6kTv
         rW+wfBuz18hgS5O3wYWhyFDSEhGsIi93nNAgwlDqFjtL+1kjv0DJmGNhSE71SUTXXHBP
         ytHBWjiZaX2LE2EnO4CjnBfKgkV5GQ8NSEPQv7NbzB+Ckrie4mnhS1RXGGqHdvgvYVsb
         TYTdRC1UjCv4IA0UDipilYCnS3nsoy5/w+pp4MdpMzennFDuUwtJ9XVk+j+b7OjjlGzM
         55nOC+ZZZJr6TLuV13/0di1IiQyBG150EcEeMPjvyd8N1UTWYBJC0OUB//OAd6XSXg0R
         DVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BpNDe3ylw4uVeZ95M/sMBgbA43gCN9p0h5YQO/Ti0uQ=;
        fh=wUZtZ+7L0E56jv3vjzJm8fD01QxbZDJ6i4Fyg4Put5k=;
        b=FDwJouSAc/fawKQfUkinDL1cTUFyfLPxxIEYznrIggkv7GnZXE3jRMiISrzFRw1vLN
         3L79sfygxX2I3tKEVGmg1Us+pZ4mFLQHTL06u05sdEHrM7wRSHfv75+6+hvG/lS4LzsZ
         ik4PKQVa0bEjbAaKXEO813STcPCY4QAau4b9o2uq5XKra/PL5SBzXblpBvzTVkkYwYFk
         49CGDReN1v+ntvMPrSVqzah9uOLguauO9KwdQnygOZyvB1cpLFzS9W+nrmf8EyBqPOrt
         w1dERJOnywESaFqqIDOgVe6T3kAsGpxEpp7hO3MooXxAmIXJJP8Zw7fT3pSIrPq6ouWz
         0b7w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781336010; x=1781940810; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpNDe3ylw4uVeZ95M/sMBgbA43gCN9p0h5YQO/Ti0uQ=;
        b=Imjn4hA5nDol1hN+d45vIoN5X1zczNchGgrLnQHMf91ndE9/uS9D7ThLymphSaLjWa
         NVrhs46+TEbrtLFgfjNNCilqVY6wfBsvDq2JusJPQ7W3fW8e1ujsUifLIHLO4lK+BM61
         PfK2EoyxLsFnNi3unSLM5rzYqc9PHj7Or7gxs4hJ+jL2qRPH0xtF9+LeslIwxzON02TN
         t7yrA8Iji0Ph2f4mtZQOCOmEXrV26PSubEQYAiQXTvDYj1cmxcXuVrIHEDchsUOGAXVN
         vvbMJR49NjseYF52VvTgdiik7qrOK1gCeC6/YW2QqsmPHBbMUx+lMdyiB4MPU+QjRfKK
         qcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781336010; x=1781940810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BpNDe3ylw4uVeZ95M/sMBgbA43gCN9p0h5YQO/Ti0uQ=;
        b=iz9PbLd9ROHi++bfmrjPjqkz9vM/SwLygImeL3XnwN0xkFZgTDhUPnJ3IlBY1brv0o
         h/MOF+kaYHDmrrtxMEdOjmW0ujAKStxrnKBuwMpbK6xH5+sNraYjLrrUCGbKsGdai+n3
         XLhoiVLTIH6s5Q6QUd60dIKoNVrkkch3nRckRUOlJjHXeVoU/IE5C91o9vsN5BqSBZ6V
         cACC4DUy+lFk+1BgYFGNOWhEmELBbUayHF7gibWFvnhQQKkkFG2e3jomtwQdsI4OUyLd
         wn2ath6W8BhV6drdatgqc3mSG60zBoM5w4OIbYDd7b1kFBKDJ0Rf5brglteT4tL3Y7li
         EnUg==
X-Gm-Message-State: AOJu0YyZruzn5IrTshcQj8FquTf3XZdnN2c55NucvSq9dIigzw74qTw2
	6fXpWmnydy0SWI+WpzTNQ/pV5lnq2PAE/mhL9rPrCPIh5pEd4Fm55WwYkP3TwuH/F4KzMUs/oIz
	CwVhan/X7NpfqVeXwn4a/oH+DmMHCX7g=
X-Gm-Gg: Acq92OEUD1VTGacGEc3Pm+ZfHcXY0koA+I+84rtTyCH5mHUjUOdF1QhO/QydyZH6NUM
	dcdxex6Nhf+c2J0VKnb+UMTXn68v+y/gN8sM1OmdAzmzV8YNNXWSjiLGf9jNB1hQMiWItbmXME+
	3Q7IOnwBuK8G1E0mnIc6+Pf223LDfVrXvyR8tH8MwPq3+8hGRmhxRXWzJZg6GxPs76XbyuvNr1M
	TkmNeDEd49aUPd7bl7l3xhNzZ1+wM2efJ4D5yCoLCKNBL7Ra7js0O70UuYUp1EZuR5Bu2VxwEB8
	INWvng==
X-Received: by 2002:a05:6512:1596:b0:5aa:61ef:2bd8 with SMTP id
 2adb3069b0e04-5ad2db144e9mr1871928e87.4.1781336010046; Sat, 13 Jun 2026
 00:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260612153339.2514304-1-ecordonnier@snap.com>
In-Reply-To: <20260612153339.2514304-1-ecordonnier@snap.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 13 Jun 2026 08:33:18 +0100
X-Gm-Features: AVVi8CcXL5V3qTC61GSq2EZX8ON6m2v0YRvPc8P9EJ3kEM8tRFNxdKQQN2yRi_Q
Message-ID: <CAO5Uq5QtOeKcjLOnyEjr=A3AjTG+vzHOgaw6reNsoh-=v2fyBw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] android-libboringssl: add new recipe
 for BoringSSL shared libraries
To: ecordonnier@snap.com
Cc: openembedded-devel@lists.openembedded.org, 
	Mihajlo Marinkovic <mmarinkovic@snap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 07:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127552

On Fri, Jun 12, 2026 at 4:33=E2=80=AFPM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
wrote:
>
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Add a recipe shipping the BoringSSL shared libraries required by
> android-tools-adbd. BoringSSL is the TLS/crypto library used by adbd
> for ADB authentication.
>
> The libraries are installed under ${libdir}/android/ to avoid conflicting
> with the system libcrypto/libssl in the sysroot. A SOVERSION=3D0 patch is
> applied so Yocto's standard .so / .so.0 packaging split works correctly.
> An ld.so.conf.d drop-in registers ${libdir}/android so binaries can find
> the libraries at runtime.
>
> This recipe is tightly coupled to android-tools: update it together when
> upgrading android-tools to a new version.
>
> AI-Generated: Uses GitHub Copilot (Claude Sonnet 4.6)
>
> Signed-off-by: Mihajlo Marinkovic <mmarinkovic@snap.com>
> Co-authored-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---

Just sent this:

https://patchwork.yoctoproject.org/project/oe/patch/20260613073026.529355-2=
-alex.kiernan@gmail.com/

Which I needed to get it to build against current master OE-Core (at
least I think that's what was the important dimension).

>  ...ION-0-to-crypto-and-ssl-shared-libra.patch | 62 ++++++++++++++++
>  .../android-libboringssl/boringssl-go-stub    | 22 ++++++
>  .../boringssl-gtest-stub.cc                   |  1 +
>  .../android-libboringssl_14.0.0+r45.bb        | 70 +++++++++++++++++++
>  4 files changed, 155 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/android-libboringssl/android=
-libboringssl/0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.pat=
ch
>  create mode 100644 meta-oe/recipes-devtools/android-libboringssl/android=
-libboringssl/boringssl-go-stub
>  create mode 100644 meta-oe/recipes-devtools/android-libboringssl/android=
-libboringssl/boringssl-gtest-stub.cc
>  create mode 100644 meta-oe/recipes-devtools/android-libboringssl/android=
-libboringssl_14.0.0+r45.bb
>
> diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-libbor=
ingssl/0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch b/me=
ta-oe/recipes-devtools/android-libboringssl/android-libboringssl/0001-cmake=
-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch
> new file mode 100644
> index 0000000000..74ad93aa8d
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/=
0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch
> @@ -0,0 +1,62 @@
> +From 03a13ef3ea786286d9317562647e9856c1b71736 Mon Sep 17 00:00:00 2001
> +From: Etienne Cordonnier <ecordonnier@snap.com>
> +Date: Thu, 11 Jun 2026 00:00:00 +0000
> +Subject: [PATCH] cmake: add SOVERSION 0 to crypto and ssl shared librari=
es
> +
> +BoringSSL's CMakeLists.txt does not set SOVERSION, so the built shared
> +libraries have no SONAME embedded and cmake names them libcrypto.so /
> +libssl.so without any version suffix.  This causes two problems in a
> +Yocto build:
> +
> +1. The Yocto QA check "dev-so" rejects unversioned .so symlinks in
> +   non-dev packages, but those symlinks are required at runtime because
> +   the DT_NEEDED entry in binaries that link against BoringSSL refers to
> +   the bare libcrypto.so name.
> +
> +2. Standard Yocto FILES patterns split libraries by suffix: .so.* goes
> +   into the runtime package and .so symlinks go into -dev.  Without a
> +   SOVERSION these patterns do not apply correctly.
> +
> +Setting SOVERSION to 0 causes cmake to:
> +  - build libcrypto.so.0 as the real ELF with SONAME=3Dlibcrypto.so.0
> +  - create libcrypto.so as a development symlink
> +
> +Binaries linked with -l:libcrypto.so.0 (as android-tools does) will
> +record DT_NEEDED=3Dlibcrypto.so.0 and resolve correctly at runtime.
> +
> +Upstream-Status: Inappropriate [OE-specific packaging requirement]
> +Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> +---
> + crypto/CMakeLists.txt | 2 ++
> + ssl/CMakeLists.txt    | 2 ++
> + 2 files changed, 4 insertions(+)
> +
> +diff --git a/crypto/CMakeLists.txt b/crypto/CMakeLists.txt
> +index cdb5ddc..fca86cc 100644
> +--- a/crypto/CMakeLists.txt
> ++++ b/crypto/CMakeLists.txt
> +@@ -327,6 +327,8 @@ endif()
> +
> + set_target_properties(crypto PROPERTIES LINKER_LANGUAGE C)
> +
> ++set_target_properties(crypto PROPERTIES SOVERSION 0)
> ++
> + if(WIN32)
> +   target_link_libraries(crypto ws2_32)
> + endif()
> +diff --git a/ssl/CMakeLists.txt b/ssl/CMakeLists.txt
> +index d8d997e..e49b350 100644
> +--- a/ssl/CMakeLists.txt
> ++++ b/ssl/CMakeLists.txt
> +@@ -46,6 +46,8 @@ install_if_enabled(TARGETS ssl EXPORT OpenSSLTargets $=
{INSTALL_DESTINATION_DEFAU
> + set_property(TARGET ssl PROPERTY EXPORT_NAME SSL)
> + target_link_libraries(ssl crypto)
> +
> ++set_target_properties(ssl PROPERTIES SOVERSION 0)
> ++
> + add_executable(
> +   ssl_test
> +
> +--
> +2.43.0
> +
> diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-libbor=
ingssl/boringssl-go-stub b/meta-oe/recipes-devtools/android-libboringssl/an=
droid-libboringssl/boringssl-go-stub
> new file mode 100644
> index 0000000000..de63f38c9c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/=
boringssl-go-stub
> @@ -0,0 +1,22 @@
> +#!/bin/sh
> +if [ "$1" =3D "run" ] && [ "$2" =3D "util/embed_test_data.go" ]; then
> +    echo 'extern const int boringssl_dummy_crypto_test_data =3D 0;'
> +    exit 0
> +fi
> +if [ "$1" =3D "run" ] && [ "$2" =3D "err_data_generate.go" ]; then
> +    cat <<'EOF'
> +#include <stddef.h>
> +#include <stdint.h>
> +
> +const uint32_t kOpenSSLReasonValues[] =3D {0};
> +const size_t kOpenSSLReasonValuesLen =3D 0;
> +const char kOpenSSLReasonStringData[] =3D "";
> +EOF
> +    exit 0
> +fi
> +if [ "$1" =3D "version" ]; then
> +    echo 'go version go0.0.0 yocto/stub'
> +    exit 0
> +fi
> +echo "Unexpected Go invocation: $*" >&2
> +exit 1
> diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-libbor=
ingssl/boringssl-gtest-stub.cc b/meta-oe/recipes-devtools/android-libboring=
ssl/android-libboringssl/boringssl-gtest-stub.cc
> new file mode 100644
> index 0000000000..7477536281
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/=
boringssl-gtest-stub.cc
> @@ -0,0 +1 @@
> +int boringssl_dummy_gtest_translation_unit =3D 0;
> diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-libbor=
ingssl_14.0.0+r45.bb b/meta-oe/recipes-devtools/android-libboringssl/androi=
d-libboringssl_14.0.0+r45.bb
> new file mode 100644
> index 0000000000..fccf6e0dff
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_=
14.0.0+r45.bb
> @@ -0,0 +1,70 @@
> +DESCRIPTION =3D "BoringSSL shared libraries for android-tools"
> +SECTION =3D "libs"
> +# This recipe is tightly coupled to android-tools: when upgrading androi=
d-tools,
> +# update this recipe to the BoringSSL version shipped in the correspondi=
ng Debian
> +# android-platform-tools source package.
> +# BoringSSL is a fork of OpenSSL; new files carry ISC license, OpenSSL l=
icense
> +# covers the forked parts.
> +LICENSE =3D "OpenSSL & ISC"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ca501bc96ce9ed0814e2c592c3f9=
593"
> +
> +SRC_URI =3D " \
> +    https://deb.debian.org/debian/pool/main/a/android-platform-external-=
boringssl/android-platform-external-boringssl_${PV}.orig.tar.xz \
> +    file://boringssl-go-stub \
> +    file://boringssl-gtest-stub.cc \
> +    file://0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.pat=
ch \
> +"
> +SRC_URI[md5sum] =3D "83d24d2f3136ba6a486b5464369b91b4"
> +SRC_URI[sha256sum] =3D "f9223e8c15ad5d9e3f1cd50861f4c272658864661e2332be=
a5d60952aa0930cd"
> +
> +# The Debian orig tarball unpacks to android-platform-external-boringssl=
-${PV}/
> +# with the actual source under a src/ subdirectory.
> +S =3D "${UNPACKDIR}/android-platform-external-boringssl-${PV}/src"
> +
> +inherit cmake
> +
> +CFLAGS:append =3D " -Wno-discarded-qualifiers"
> +
> +OECMAKE_TARGET_COMPILE =3D "crypto ssl"
> +
> +EXTRA_OECMAKE =3D " \
> +    -DBUILD_SHARED_LIBS=3DON \
> +    -DBUILD_TESTING=3DOFF \
> +    -DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
> +    -DGO_EXECUTABLE=3D${WORKDIR}/hosttools/go \
> +"
> +
> +do_configure:prepend() {
> +    install -d ${WORKDIR}/hosttools
> +    install -m 0755 ${UNPACKDIR}/boringssl-go-stub ${WORKDIR}/hosttools/=
go
> +
> +    # BoringSSL builds its own minimal gtest from third_party/googletest=
; provide
> +    # an empty stub .cc. We only build the crypto and ssl targets so the=
 test
> +    # source files are never compiled, but cmake still needs gtest-all.c=
c to
> +    # exist to create the boringssl_gtest target.
> +    if [ ! -f ${S}/third_party/googletest/src/gtest-all.cc ]; then
> +        install -d ${S}/third_party/googletest/src
> +        install -m 0644 ${UNPACKDIR}/boringssl-gtest-stub.cc \
> +            ${S}/third_party/googletest/src/gtest-all.cc
> +    fi
> +}
> +do_install() {
> +    # Install headers under a boringssl/ subdirectory to avoid shadowing=
 the
> +    # system OpenSSL headers in the sysroot.
> +    install -d ${D}${includedir}/boringssl
> +    cp -a ${S}/include/openssl ${D}${includedir}/boringssl/
> +
> +    # Install shared libraries under ${libdir}/android/ to avoid conflic=
ting
> +    # with the system libssl/libcrypto in the sysroot.
> +    install -d ${D}${libdir}/android
> +    install -m 0755 ${B}/crypto/libcrypto.so.0 ${D}${libdir}/android/lib=
crypto.so.0
> +    ln -sf libcrypto.so.0 ${D}${libdir}/android/libcrypto.so
> +    install -m 0755 ${B}/ssl/libssl.so.0 ${D}${libdir}/android/libssl.so=
.0
> +    ln -sf libssl.so.0 ${D}${libdir}/android/libssl.so
> +
> +}
> +
> +FILES:${PN}-dev =3D "${includedir}/boringssl ${libdir}/android/libcrypto=
.so ${libdir}/android/libssl.so"
> +FILES:${PN} =3D "${libdir}/android/libcrypto.so.0 ${libdir}/android/libs=
sl.so.0"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127541): https://lists.openembedded.org/g/openembedde=
d-devel/message/127541
> Mute This Topic: https://lists.openembedded.org/mt/119775569/3618097
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

