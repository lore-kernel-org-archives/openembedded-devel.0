Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD72CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 08:07:23 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.149329.1781597233571891860
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 01:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=OrTBNEwG;
 spf=pass (domain: snapchat.com, ip: 209.85.218.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bebde89cfd3so518082466b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 01:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781597232; cv=none;
        d=google.com; s=arc-20240605;
        b=KSqKDrfmFbUztuV8gjfBUlnX0pvh7tTyyE1Dolo133jbRnkKow3jMpFBd2IX0qhFGz
         fqP+U+m8uG7w8nC1MVaufnwz6rLBeg5K/HrOVlpIBs043bKDVcTbcDAprPw2SQ4/Ijw7
         +Ny1lbwSNuSR8R3GdKNx+Zr7Gwkt6+ObVgx+H+uK6IomY9MyYHjYrAVY2LFvMlO2e8Dd
         rfxktu4KtX9U0xvoKyxyKIzNjc+o8HL6uz1swTSscG6fSX6D6UN2WyRMkHQYGZL2HtLe
         sygipb+41jJ16WTfYbfvX6+lMhadA9D5lKDm3ckGMCXOiQ9sftBQscSRNviS9yPmmYW8
         N74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uQXmihtDtGiP34bYrC4IgaH5pM3IVDw1Pj2/zE/EVmI=;
        fh=qjNAY/wqgvbUjoroyk91POHOrTQ3fhRPJP+lgrurSIc=;
        b=PlNFMfDEDAjtuXK7ZOgJKkDzDqeRlETzw91B1qN2TkEJ0MH3RP2PdJtAQdzCYpC+iP
         umdLZaJLQZRAPJ20+ZFhxXE3FtykU+WcmktcFmbG70i4CqeypfhOc7BYkJKE0l55jPCL
         1h7/X/8WzJisRrq46iNkbnAvsYzSAOkj+EP9unLn3B3PiViRu5fYpGJK3TDyC6516ecw
         PQ9n6ZUXkgz5PEAcQZCirBTmefYrfxLcuYTySv2OPUqi++APt53q7/W+dsonDe9sjU7V
         fkv2GpwTVrwLmyH8R+CmIFqQdKfZmDzhcqFx/QrJ7UuiN4mUpqx4i2VJk0YYm6wKHeHG
         8yVw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1781597232; x=1782202032; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uQXmihtDtGiP34bYrC4IgaH5pM3IVDw1Pj2/zE/EVmI=;
        b=OrTBNEwGJikGppQazz/kjGczR7jvILrjD7KPqmYi8VuevmIOSBnzJI0WtVJoHqucHC
         TZT1mHcWnHVMTjrtTQr4d40YRsccPfMtx5i/vYXSdgRz+e0HNKKnWZPz+bpfnuPWtuZw
         XNwY4SMe4tLdqCmSpikAex8JdQeNEUufrSihA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781597232; x=1782202032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQXmihtDtGiP34bYrC4IgaH5pM3IVDw1Pj2/zE/EVmI=;
        b=a9qNrtDeFJki0rjtyqO8q9YgS2zUS6JkOmbt5KolfEc0iGz/QhjKH2ao5V43zilFdV
         j/8rCFJfItub43XmYzPqJREKaEpn8UM7wpvLeTuRd8kayskQcJIZ4czw5yMBVxM1NGuu
         fzE41XhnDuTjkjXle+Q4gq7RZuIJn2NHUeJ7Se4GCls/3InzztAtkhEX7gtEVTg0tR7t
         3OMBHf7vOrS4bgf6tHwxxp0OJJbV0RV7vl0WmYWA/iSVrDjqV4j28ua0+VDCh6pxg9mf
         EKIodm+yPGtVpcZ0Oxgv0AJeoucM/HA6DKImSlQfzTHeYBrKGWPLYBIra1qL5o8XOdeD
         K1Sg==
X-Forwarded-Encrypted: i=1; AFNElJ/2Ujq+TBUWN9n6/vAWPnzMmukc9kRSDAKc8o6r+oRz4bbN1rbORRTFhSgo+gDrOJBqysGR3hSxX4DUrjP0IhzgXXw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVb2vclC69GTXGNPsKQjLWohibooHHyjUfx6GaaqqqrVF8eZ1g
	ElEuwJhBCA6AN8R1n44lCeNQHRTTdCU9nknZPw0yDB+iLdvfFd1VQO8ycFHNNMOCRdNAhGSrIP8
	TB8s2SfKfL0ucp2Hi5z5eMFwqBhJN3rNNS3SEt4O9+w==
X-Gm-Gg: Acq92OELpsnQmzAkLwTX1YZH8HQU4oicjWbUTd99Mfmol3Wbj3rnowqTXZrn0Ud7qUS
	m4gzmiDFAzxN4rAdZY+QQ6wHekvdWtryXGV4yI/Uh36AKU+hKqyGTsRf/eqFuZPRoGMjXjPfJ9i
	+/ds+eF4d50RVUCGooznPz3HxJSfp7d5tpZ+ADocTPeVFrHxkldXz+/qHNJKUTldX2xUAffBTvA
	cf0lr3oSqyylTm4dyB3o/+b2Jj+pOFIjqz7jK4FvninHSqf4Xe6u53qMa8XTGXxeLyHS1DGBOAf
	HVuCX9IBii7S08YSVL4eXPQvB0W1cNYUzZwZHOgu
X-Received: by 2002:a17:907:7385:b0:bfe:ed35:e858 with SMTP id
 a640c23a62f3a-c043e66aac5mr87717966b.52.1781597231399; Tue, 16 Jun 2026
 01:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260612153339.2514304-1-ecordonnier@snap.com>
 <CAO5Uq5QtOeKcjLOnyEjr=A3AjTG+vzHOgaw6reNsoh-=v2fyBw@mail.gmail.com> <18B93282C70C82BF.267903@lists.openembedded.org>
In-Reply-To: <18B93282C70C82BF.267903@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Tue, 16 Jun 2026 10:06:59 +0200
X-Gm-Features: AVVi8CcfHhoR1xA9pv1HiM6JgioocYMsz4bYHxJDMJ79MT17U3hEixg0i_Imdp0
Message-ID: <CAHUKmYaLpNafy0Hp5j3-7p+LC7NFzWWFt0xKvXgum-pQwFrmzg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] android-libboringssl: add new recipe
 for BoringSSL shared libraries
To: ecordonnier@snap.com
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Mihajlo Marinkovic <mmarinkovic@snap.com>
Content-Type: multipart/alternative; boundary="0000000000001c876806545a6efc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 08:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127614

--0000000000001c876806545a6efc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I've noticed a small error in the commit message:

"    An ld.so.conf.d drop-in registers ${libdir}/android so binaries can
find
    the libraries at runtime."

This is no longer true. This was true in an earlier version of the commit,
but it now works using RUNPATH. Thus this sentence could be removed.

=C3=89tienne



On Mon, Jun 15, 2026 at 10:04=E2=80=AFAM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> Thanks for the fix Alex. My local build and testing is with
> openembedded-core commit
> https://git.openembedded.org/openembedded-core/commit/?id=3Db5c24e1491dcb=
9ab0f782df6be6582fbd2151724
> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.openembedded.=
org_openembedded-2Dcore_commit_-3Fid-3Db5c24e1491dcb9ab0f782df6be6582fbd215=
1724&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNon=
VuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu988c=
xbRKIBcEphOgnCn3BaS-KW6x9pTx0g&s=3DCWeprpi7dtgNeP1I8HHF-ui7HJrmG-6bcrqLeuYc=
Rhw&e=3D>
>
>
> On Sat, Jun 13, 2026 at 9:33=E2=80=AFAM Alex Kiernan <alex.kiernan@gmail.=
com>
> wrote:
>
>> On Fri, Jun 12, 2026 at 4:33=E2=80=AFPM Etienne Cordonnier via
>> lists.openembedded.org
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedde=
d.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu988=
cxbRKIBcEphOgnCn3BaS-KW6x9pTx0g&s=3DPNr5HkvRX6VlmZPDFgBLr4yrLqs_0bfmi-6jkK2=
p0NY&e=3D>
>> <ecordonnier=3Dsnap.com@lists.openembedded.org>
>> wrote:
>> >
>> > From: Etienne Cordonnier <ecordonnier@snap.com>
>> >
>> > Add a recipe shipping the BoringSSL shared libraries required by
>> > android-tools-adbd. BoringSSL is the TLS/crypto library used by adbd
>> > for ADB authentication.
>> >
>> > The libraries are installed under ${libdir}/android/ to avoid
>> conflicting
>> > with the system libcrypto/libssl in the sysroot. A SOVERSION=3D0 patch=
 is
>> > applied so Yocto's standard .so / .so.0 packaging split works correctl=
y.
>> > An ld.so.conf.d drop-in registers ${libdir}/android so binaries can fi=
nd
>> > the libraries at runtime.
>> >
>> > This recipe is tightly coupled to android-tools: update it together wh=
en
>> > upgrading android-tools to a new version.
>> >
>> > AI-Generated: Uses GitHub Copilot (Claude Sonnet 4.6)
>> >
>> > Signed-off-by: Mihajlo Marinkovic <mmarinkovic@snap.com>
>> > Co-authored-by: Etienne Cordonnier <ecordonnier@snap.com>
>> > ---
>>
>> Just sent this:
>>
>>
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__patchwork.yoctopr=
oject.org_project_oe_patch_20260613073026.529355-2D2-2Dalex.kiernan-40gmail=
.com_&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D0I9kcs3yTZeLi7TbI-G0bkjbrmVNpkpDZ=
TF0qEOxbR6rOj9We36bB3auvx3yHUu8&s=3DSQmJGIsA5X3gdlStxI-8A4kfaK5CEr-sSH5aEWa=
LMDQ&e=3D
>>
>> Which I needed to get it to build against current master OE-Core (at
>> least I think that's what was the important dimension).
>>
>> >  ...ION-0-to-crypto-and-ssl-shared-libra.patch | 62 ++++++++++++++++
>> >  .../android-libboringssl/boringssl-go-stub    | 22 ++++++
>> >  .../boringssl-gtest-stub.cc                   |  1 +
>> >  .../android-libboringssl_14.0.0+r45.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__r45.bb&d=3DDwMFaQ=
&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9Ts=
Rih1DULJTKUkSGa66m67E&m=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn=
3BaS-KW6x9pTx0g&s=3DclgsP3vNtvsca98l4igtjmm_-BhUhn4lDk3FL3rl37c&e=3D>
>>       | 70 +++++++++++++++++++
>> >  4 files changed, 155 insertions(+)
>> >  create mode 100644
>> meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/0001-=
cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch
>> >  create mode 100644
>> meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/borin=
gssl-go-stub
>> >  create mode 100644
>> meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/borin=
gssl-gtest-stub.cc
>> >  create mode 100644
>> meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.=
0+
>> r45.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__r45.bb&d=3DDwMFaQ=
&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9Ts=
Rih1DULJTKUkSGa66m67E&m=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn=
3BaS-KW6x9pTx0g&s=3DclgsP3vNtvsca98l4igtjmm_-BhUhn4lDk3FL3rl37c&e=3D>
>> >
>> > diff --git
>> a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/000=
1-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch
>> b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/000=
1-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch
>> > new file mode 100644
>> > index 0000000000..74ad93aa8d
>> > --- /dev/null
>> > +++
>> b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/000=
1-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch
>> > @@ -0,0 +1,62 @@
>> > +From 03a13ef3ea786286d9317562647e9856c1b71736 Mon Sep 17 00:00:00 200=
1
>> > +From: Etienne Cordonnier <ecordonnier@snap.com>
>> > +Date: Thu, 11 Jun 2026 00:00:00 +0000
>> > +Subject: [PATCH] cmake: add SOVERSION 0 to crypto and ssl shared
>> libraries
>> > +
>> > +BoringSSL's CMakeLists.txt does not set SOVERSION, so the built share=
d
>> > +libraries have no SONAME embedded and cmake names them libcrypto.so /
>> > +libssl.so without any version suffix.  This causes two problems in a
>> > +Yocto build:
>> > +
>> > +1. The Yocto QA check "dev-so" rejects unversioned .so symlinks in
>> > +   non-dev packages, but those symlinks are required at runtime becau=
se
>> > +   the DT_NEEDED entry in binaries that link against BoringSSL refers
>> to
>> > +   the bare libcrypto.so name.
>> > +
>> > +2. Standard Yocto FILES patterns split libraries by suffix: .so.* goe=
s
>> > +   into the runtime package and .so symlinks go into -dev.  Without a
>> > +   SOVERSION these patterns do not apply correctly.
>> > +
>> > +Setting SOVERSION to 0 causes cmake to:
>> > +  - build libcrypto.so.0 as the real ELF with SONAME=3Dlibcrypto.so.0
>> > +  - create libcrypto.so as a development symlink
>> > +
>> > +Binaries linked with -l:libcrypto.so.0 (as android-tools does) will
>> > +record DT_NEEDED=3Dlibcrypto.so.0 and resolve correctly at runtime.
>> > +
>> > +Upstream-Status: Inappropriate [OE-specific packaging requirement]
>> > +Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> > +---
>> > + crypto/CMakeLists.txt | 2 ++
>> > + ssl/CMakeLists.txt    | 2 ++
>> > + 2 files changed, 4 insertions(+)
>> > +
>> > +diff --git a/crypto/CMakeLists.txt b/crypto/CMakeLists.txt
>> > +index cdb5ddc..fca86cc 100644
>> > +--- a/crypto/CMakeLists.txt
>> > ++++ b/crypto/CMakeLists.txt
>> > +@@ -327,6 +327,8 @@ endif()
>> > +
>> > + set_target_properties(crypto PROPERTIES LINKER_LANGUAGE C)
>> > +
>> > ++set_target_properties(crypto PROPERTIES SOVERSION 0)
>> > ++
>> > + if(WIN32)
>> > +   target_link_libraries(crypto ws2_32)
>> > + endif()
>> > +diff --git a/ssl/CMakeLists.txt b/ssl/CMakeLists.txt
>> > +index d8d997e..e49b350 100644
>> > +--- a/ssl/CMakeLists.txt
>> > ++++ b/ssl/CMakeLists.txt
>> > +@@ -46,6 +46,8 @@ install_if_enabled(TARGETS ssl EXPORT OpenSSLTarget=
s
>> ${INSTALL_DESTINATION_DEFAU
>> > + set_property(TARGET ssl PROPERTY EXPORT_NAME SSL)
>> > + target_link_libraries(ssl crypto)
>> > +
>> > ++set_target_properties(ssl PROPERTIES SOVERSION 0)
>> > ++
>> > + add_executable(
>> > +   ssl_test
>> > +
>> > +--
>> > +2.43.0
>> > +
>> > diff --git
>> a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/bor=
ingssl-go-stub
>> b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/bor=
ingssl-go-stub
>> > new file mode 100644
>> > index 0000000000..de63f38c9c
>> > --- /dev/null
>> > +++
>> b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/bor=
ingssl-go-stub
>> > @@ -0,0 +1,22 @@
>> > +#!/bin/sh
>> > +if [ "$1" =3D "run" ] && [ "$2" =3D "util/embed_test_data.go" ]; then
>> > +    echo 'extern const int boringssl_dummy_crypto_test_data =3D 0;'
>> > +    exit 0
>> > +fi
>> > +if [ "$1" =3D "run" ] && [ "$2" =3D "err_data_generate.go" ]; then
>> > +    cat <<'EOF'
>> > +#include <stddef.h>
>> > +#include <stdint.h>
>> > +
>> > +const uint32_t kOpenSSLReasonValues[] =3D {0};
>> > +const size_t kOpenSSLReasonValuesLen =3D 0;
>> > +const char kOpenSSLReasonStringData[] =3D "";
>> > +EOF
>> > +    exit 0
>> > +fi
>> > +if [ "$1" =3D "version" ]; then
>> > +    echo 'go version go0.0.0 yocto/stub'
>> > +    exit 0
>> > +fi
>> > +echo "Unexpected Go invocation: $*" >&2
>> > +exit 1
>> > diff --git
>> a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/bor=
ingssl-gtest-stub.cc
>> b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/bor=
ingssl-gtest-stub.cc
>> > new file mode 100644
>> > index 0000000000..7477536281
>> > --- /dev/null
>> > +++
>> b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/bor=
ingssl-gtest-stub.cc
>> > @@ -0,0 +1 @@
>> > +int boringssl_dummy_gtest_translation_unit =3D 0;
>> > diff --git
>> a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.=
0.0+
>> r45.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__r45.bb&d=3DDwMFaQ=
&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9Ts=
Rih1DULJTKUkSGa66m67E&m=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn=
3BaS-KW6x9pTx0g&s=3DclgsP3vNtvsca98l4igtjmm_-BhUhn4lDk3FL3rl37c&e=3D>
>> b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.=
0.0+
>> r45.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__r45.bb&d=3DDwMFaQ=
&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9Ts=
Rih1DULJTKUkSGa66m67E&m=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn=
3BaS-KW6x9pTx0g&s=3DclgsP3vNtvsca98l4igtjmm_-BhUhn4lDk3FL3rl37c&e=3D>
>> > new file mode 100644
>> > index 0000000000..fccf6e0dff
>> > --- /dev/null
>> > +++
>> b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.=
0.0+
>> r45.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__r45.bb&d=3DDwMFaQ=
&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9Ts=
Rih1DULJTKUkSGa66m67E&m=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn=
3BaS-KW6x9pTx0g&s=3DclgsP3vNtvsca98l4igtjmm_-BhUhn4lDk3FL3rl37c&e=3D>
>> > @@ -0,0 +1,70 @@
>> > +DESCRIPTION =3D "BoringSSL shared libraries for android-tools"
>> > +SECTION =3D "libs"
>> > +# This recipe is tightly coupled to android-tools: when upgrading
>> android-tools,
>> > +# update this recipe to the BoringSSL version shipped in the
>> corresponding Debian
>> > +# android-platform-tools source package.
>> > +# BoringSSL is a fork of OpenSSL; new files carry ISC license, OpenSS=
L
>> license
>> > +# covers the forked parts.
>> > +LICENSE =3D "OpenSSL & ISC"
>> > +LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3D2ca501bc96ce9ed0814e2c592c3f9593"
>> > +
>> > +SRC_URI =3D " \
>> > +
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__deb.debian.org_de=
bian_pool_main_a_android-2Dplatform-2Dexternal-2Dboringssl_android-2Dplatfo=
rm-2Dexternal-2Dboringssl-5F-24-257BPV-257D.orig.tar.xz&d=3DDwIFaQ&c=3DncDT=
mphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJT=
KUkSGa66m67E&m=3D0I9kcs3yTZeLi7TbI-G0bkjbrmVNpkpDZTF0qEOxbR6rOj9We36bB3auvx=
3yHUu8&s=3Dh9UIfZ9dc3gsp4QbhsGF_Rgdtn0WP9593DrpZPubTfQ&e=3D
>> \
>> > +    file://boringssl-go-stub \
>> > +    file://boringssl-gtest-stub.cc \
>> > +
>> file://0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch \
>> > +"
>> > +SRC_URI[md5sum] =3D "83d24d2f3136ba6a486b5464369b91b4"
>> > +SRC_URI[sha256sum] =3D
>> "f9223e8c15ad5d9e3f1cd50861f4c272658864661e2332bea5d60952aa0930cd"
>> > +
>> > +# The Debian orig tarball unpacks to
>> android-platform-external-boringssl-${PV}/
>> > +# with the actual source under a src/ subdirectory.
>> > +S =3D "${UNPACKDIR}/android-platform-external-boringssl-${PV}/src"
>> > +
>> > +inherit cmake
>> > +
>> > +CFLAGS:append =3D " -Wno-discarded-qualifiers"
>> > +
>> > +OECMAKE_TARGET_COMPILE =3D "crypto ssl"
>> > +
>> > +EXTRA_OECMAKE =3D " \
>> > +    -DBUILD_SHARED_LIBS=3DON \
>> > +    -DBUILD_TESTING=3DOFF \
>> > +    -DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
>> > +    -DGO_EXECUTABLE=3D${WORKDIR}/hosttools/go \
>> > +"
>> > +
>> > +do_configure:prepend() {
>> > +    install -d ${WORKDIR}/hosttools
>> > +    install -m 0755 ${UNPACKDIR}/boringssl-go-stub
>> ${WORKDIR}/hosttools/go
>> > +
>> > +    # BoringSSL builds its own minimal gtest from
>> third_party/googletest; provide
>> > +    # an empty stub .cc. We only build the crypto and ssl targets so
>> the test
>> > +    # source files are never compiled, but cmake still needs
>> gtest-all.cc to
>> > +    # exist to create the boringssl_gtest target.
>> > +    if [ ! -f ${S}/third_party/googletest/src/gtest-all.cc ]; then
>> > +        install -d ${S}/third_party/googletest/src
>> > +        install -m 0644 ${UNPACKDIR}/boringssl-gtest-stub.cc \
>> > +            ${S}/third_party/googletest/src/gtest-all.cc
>> > +    fi
>> > +}
>> > +do_install() {
>> > +    # Install headers under a boringssl/ subdirectory to avoid
>> shadowing the
>> > +    # system OpenSSL headers in the sysroot.
>> > +    install -d ${D}${includedir}/boringssl
>> > +    cp -a ${S}/include/openssl ${D}${includedir}/boringssl/
>> > +
>> > +    # Install shared libraries under ${libdir}/android/ to avoid
>> conflicting
>> > +    # with the system libssl/libcrypto in the sysroot.
>> > +    install -d ${D}${libdir}/android
>> > +    install -m 0755 ${B}/crypto/libcrypto.so.0
>> ${D}${libdir}/android/libcrypto.so.0
>> > +    ln -sf libcrypto.so.0 ${D}${libdir}/android/libcrypto.so
>> > +    install -m 0755 ${B}/ssl/libssl.so.0
>> ${D}${libdir}/android/libssl.so.0
>> > +    ln -sf libssl.so.0 ${D}${libdir}/android/libssl.so
>> > +
>> > +}
>> > +
>> > +FILES:${PN}-dev =3D "${includedir}/boringssl
>> ${libdir}/android/libcrypto.so ${libdir}/android/libssl.so"
>> > +FILES:${PN} =3D "${libdir}/android/libcrypto.so.0
>> ${libdir}/android/libssl.so.0"
>> > +
>> > +BBCLASSEXTEND =3D "native"
>> > --
>> > 2.43.0
>> >
>> >
>> >
>> >
>>
>>
>> --
>> Alex Kiernan
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127582):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_127582&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
m=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn3BaS-KW6x9pTx0g&s=3DIk=
a6LPC5Ewu7W4dcCp7zUHIFxID7vEvnSINx0aSq_Nc&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_119775569_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Du2Cwo2K-ydtt9=
_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn3BaS-KW6x9pTx0g&s=3Dx3dzROXs9l3ivtVjITt=
ccKhEeGHQMmqW_AeWCJRbW0s&e=3D
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Du2Cwo=
2K-ydtt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn3BaS-KW6x9pTx0g&s=3DOi6YeDRHLzP=
c9yzQAk-ymFYP9zlP-Fx9wCxk9kFlnVg&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001c876806545a6efc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>I&#39;ve noticed a small error in the commit messag=
e:<br><br>&quot;=C2=A0 =C2=A0 An ld.so.conf.d drop-in registers ${libdir}/a=
ndroid so binaries can find<br>=C2=A0 =C2=A0 the libraries at runtime.&quot=
;<br><br>This is no longer true. This was true in an earlier version of the=
 commit, but it now works using RUNPATH. Thus this sentence could be remove=
d.<br><br>=C3=89tienne<br><br><br></div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 15, 202=
6 at 10:04=E2=80=AFAM Etienne Cordonnier via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:=
snap.com@lists.openembedded.org">snap.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr">Thanks for the fix Alex. My local build and testing is with openembed=
ded-core=C2=A0commit=C2=A0<a href=3D"https://urldefense.proofpoint.com/v2/u=
rl?u=3Dhttps-3A__git.openembedded.org_openembedded-2Dcore_commit_-3Fid-3Db5=
c24e1491dcb9ab0f782df6be6582fbd2151724&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjI=
DPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&amp;m=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn3BaS-KW6x9=
pTx0g&amp;s=3DCWeprpi7dtgNeP1I8HHF-ui7HJrmG-6bcrqLeuYcRhw&amp;e=3D" target=
=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3Db5c=
24e1491dcb9ab0f782df6be6582fbd2151724</a>=C2=A0</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 13, 2026 at 9:33=
=E2=80=AFAM Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" targ=
et=3D"_blank">alex.kiernan@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Fri, Jun 12, 2026 at 4:33=E2=80=AFPM=
 Etienne Cordonnier via<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.open=
embedded.org&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epck=
fdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Du2Cwo2K-yd=
tt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn3BaS-KW6x9pTx0g&amp;s=3DPNr5HkvRX6Vl=
mZPDFgBLr4yrLqs_0bfmi-6jkK2p0NY&amp;e=3D" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com=
@lists.openembedded.org" target=3D"_blank">snap.com@lists.openembedded.org<=
/a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt;<br>
&gt; Add a recipe shipping the BoringSSL shared libraries required by<br>
&gt; android-tools-adbd. BoringSSL is the TLS/crypto library used by adbd<b=
r>
&gt; for ADB authentication.<br>
&gt;<br>
&gt; The libraries are installed under ${libdir}/android/ to avoid conflict=
ing<br>
&gt; with the system libcrypto/libssl in the sysroot. A SOVERSION=3D0 patch=
 is<br>
&gt; applied so Yocto&#39;s standard .so / .so.0 packaging split works corr=
ectly.<br>
&gt; An ld.so.conf.d drop-in registers ${libdir}/android so binaries can fi=
nd<br>
&gt; the libraries at runtime.<br>
&gt;<br>
&gt; This recipe is tightly coupled to android-tools: update it together wh=
en<br>
&gt; upgrading android-tools to a new version.<br>
&gt;<br>
&gt; AI-Generated: Uses GitHub Copilot (Claude Sonnet 4.6)<br>
&gt;<br>
&gt; Signed-off-by: Mihajlo Marinkovic &lt;<a href=3D"mailto:mmarinkovic@sn=
ap.com" target=3D"_blank">mmarinkovic@snap.com</a>&gt;<br>
&gt; Co-authored-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@s=
nap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
<br>
Just sent this:<br>
<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__patchwork=
.yoctoproject.org_project_oe_patch_20260613073026.529355-2D2-2Dalex.kiernan=
-40gmail.com_&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epc=
kfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D0I9kcs3yT=
ZeLi7TbI-G0bkjbrmVNpkpDZTF0qEOxbR6rOj9We36bB3auvx3yHUu8&amp;s=3DSQmJGIsA5X3=
gdlStxI-8A4kfaK5CEr-sSH5aEWaLMDQ&amp;e=3D" rel=3D"noreferrer" target=3D"_bl=
ank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__patchwork.yocto=
project.org_project_oe_patch_20260613073026.529355-2D2-2Dalex.kiernan-40gma=
il.com_&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&=
amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D0I9kcs3yTZeLi7T=
bI-G0bkjbrmVNpkpDZTF0qEOxbR6rOj9We36bB3auvx3yHUu8&amp;s=3DSQmJGIsA5X3gdlStx=
I-8A4kfaK5CEr-sSH5aEWaLMDQ&amp;e=3D</a> <br>
<br>
Which I needed to get it to build against current master OE-Core (at<br>
least I think that&#39;s what was the important dimension).<br>
<br>
&gt;=C2=A0 ...ION-0-to-crypto-and-ssl-shared-libra.patch | 62 +++++++++++++=
+++<br>
&gt;=C2=A0 .../android-libboringssl/boringssl-go-stub=C2=A0 =C2=A0 | 22 +++=
+++<br>
&gt;=C2=A0 .../boringssl-gtest-stub.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 .../android-libboringssl_14.0.0+<a href=3D"https://urldefense.pr=
oofpoint.com/v2/url?u=3Dhttp-3A__r45.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvj=
IDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkS=
Ga66m67E&amp;m=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn3BaS-KW6x=
9pTx0g&amp;s=3DclgsP3vNtvsca98l4igtjmm_-BhUhn4lDk3FL3rl37c&amp;e=3D" rel=3D=
"noreferrer" target=3D"_blank">r45.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 70 +=
++++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 155 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-libboringssl=
/android-libboringssl/0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-l=
ibra.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-libboringssl=
/android-libboringssl/boringssl-go-stub<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-libboringssl=
/android-libboringssl/boringssl-gtest-stub.cc<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-libboringssl=
/android-libboringssl_14.0.0+<a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttp-3A__r45.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=
=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn3BaS-KW6x9pTx0g&amp;s=
=3DclgsP3vNtvsca98l4igtjmm_-BhUhn4lDk3FL3rl37c&amp;e=3D" rel=3D"noreferrer"=
 target=3D"_blank">r45.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-lib=
boringssl/0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch b=
/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl/0001-cm=
ake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..74ad93aa8d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-libboringssl/android-libborings=
sl/0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-shared-libra.patch<br>
&gt; @@ -0,0 +1,62 @@<br>
&gt; +From 03a13ef3ea786286d9317562647e9856c1b71736 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" =
target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; +Date: Thu, 11 Jun 2026 00:00:00 +0000<br>
&gt; +Subject: [PATCH] cmake: add SOVERSION 0 to crypto and ssl shared libr=
aries<br>
&gt; +<br>
&gt; +BoringSSL&#39;s CMakeLists.txt does not set SOVERSION, so the built s=
hared<br>
&gt; +libraries have no SONAME embedded and cmake names them libcrypto.so /=
<br>
&gt; +libssl.so without any version suffix.=C2=A0 This causes two problems =
in a<br>
&gt; +Yocto build:<br>
&gt; +<br>
&gt; +1. The Yocto QA check &quot;dev-so&quot; rejects unversioned .so syml=
inks in<br>
&gt; +=C2=A0 =C2=A0non-dev packages, but those symlinks are required at run=
time because<br>
&gt; +=C2=A0 =C2=A0the DT_NEEDED entry in binaries that link against Boring=
SSL refers to<br>
&gt; +=C2=A0 =C2=A0the bare libcrypto.so name.<br>
&gt; +<br>
&gt; +2. Standard Yocto FILES patterns split libraries by suffix: .so.* goe=
s<br>
&gt; +=C2=A0 =C2=A0into the runtime package and .so symlinks go into -dev.=
=C2=A0 Without a<br>
&gt; +=C2=A0 =C2=A0SOVERSION these patterns do not apply correctly.<br>
&gt; +<br>
&gt; +Setting SOVERSION to 0 causes cmake to:<br>
&gt; +=C2=A0 - build libcrypto.so.0 as the real ELF with SONAME=3Dlibcrypto=
.so.0<br>
&gt; +=C2=A0 - create libcrypto.so as a development symlink<br>
&gt; +<br>
&gt; +Binaries linked with -l:libcrypto.so.0 (as android-tools does) will<b=
r>
&gt; +record DT_NEEDED=3Dlibcrypto.so.0 and resolve correctly at runtime.<b=
r>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [OE-specific packaging requirement]<br=
>
&gt; +Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@s=
nap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; +---<br>
&gt; + crypto/CMakeLists.txt | 2 ++<br>
&gt; + ssl/CMakeLists.txt=C2=A0 =C2=A0 | 2 ++<br>
&gt; + 2 files changed, 4 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/crypto/CMakeLists.txt b/crypto/CMakeLists.txt<br>
&gt; +index cdb5ddc..fca86cc 100644<br>
&gt; +--- a/crypto/CMakeLists.txt<br>
&gt; ++++ b/crypto/CMakeLists.txt<br>
&gt; +@@ -327,6 +327,8 @@ endif()<br>
&gt; +<br>
&gt; + set_target_properties(crypto PROPERTIES LINKER_LANGUAGE C)<br>
&gt; +<br>
&gt; ++set_target_properties(crypto PROPERTIES SOVERSION 0)<br>
&gt; ++<br>
&gt; + if(WIN32)<br>
&gt; +=C2=A0 =C2=A0target_link_libraries(crypto ws2_32)<br>
&gt; + endif()<br>
&gt; +diff --git a/ssl/CMakeLists.txt b/ssl/CMakeLists.txt<br>
&gt; +index d8d997e..e49b350 100644<br>
&gt; +--- a/ssl/CMakeLists.txt<br>
&gt; ++++ b/ssl/CMakeLists.txt<br>
&gt; +@@ -46,6 +46,8 @@ install_if_enabled(TARGETS ssl EXPORT OpenSSLTarget=
s ${INSTALL_DESTINATION_DEFAU<br>
&gt; + set_property(TARGET ssl PROPERTY EXPORT_NAME SSL)<br>
&gt; + target_link_libraries(ssl crypto)<br>
&gt; +<br>
&gt; ++set_target_properties(ssl PROPERTIES SOVERSION 0)<br>
&gt; ++<br>
&gt; + add_executable(<br>
&gt; +=C2=A0 =C2=A0ssl_test<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-lib=
boringssl/boringssl-go-stub b/meta-oe/recipes-devtools/android-libboringssl=
/android-libboringssl/boringssl-go-stub<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..de63f38c9c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-libboringssl/android-libborings=
sl/boringssl-go-stub<br>
&gt; @@ -0,0 +1,22 @@<br>
&gt; +#!/bin/sh<br>
&gt; +if [ &quot;$1&quot; =3D &quot;run&quot; ] &amp;&amp; [ &quot;$2&quot;=
 =3D &quot;util/embed_test_data.go&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 echo &#39;extern const int boringssl_dummy_crypto_test_=
data =3D 0;&#39;<br>
&gt; +=C2=A0 =C2=A0 exit 0<br>
&gt; +fi<br>
&gt; +if [ &quot;$1&quot; =3D &quot;run&quot; ] &amp;&amp; [ &quot;$2&quot;=
 =3D &quot;err_data_generate.go&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 cat &lt;&lt;&#39;EOF&#39;<br>
&gt; +#include &lt;stddef.h&gt;<br>
&gt; +#include &lt;stdint.h&gt;<br>
&gt; +<br>
&gt; +const uint32_t kOpenSSLReasonValues[] =3D {0};<br>
&gt; +const size_t kOpenSSLReasonValuesLen =3D 0;<br>
&gt; +const char kOpenSSLReasonStringData[] =3D &quot;&quot;;<br>
&gt; +EOF<br>
&gt; +=C2=A0 =C2=A0 exit 0<br>
&gt; +fi<br>
&gt; +if [ &quot;$1&quot; =3D &quot;version&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 echo &#39;go version go0.0.0 yocto/stub&#39;<br>
&gt; +=C2=A0 =C2=A0 exit 0<br>
&gt; +fi<br>
&gt; +echo &quot;Unexpected Go invocation: $*&quot; &gt;&amp;2<br>
&gt; +exit 1<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-lib=
boringssl/boringssl-gtest-stub.cc b/meta-oe/recipes-devtools/android-libbor=
ingssl/android-libboringssl/boringssl-gtest-stub.cc<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7477536281<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-libboringssl/android-libborings=
sl/boringssl-gtest-stub.cc<br>
&gt; @@ -0,0 +1 @@<br>
&gt; +int boringssl_dummy_gtest_translation_unit =3D 0;<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-lib=
boringssl_14.0.0+<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tp-3A__r45.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epc=
kfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Du2Cwo2K-y=
dtt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn3BaS-KW6x9pTx0g&amp;s=3DclgsP3vNtvs=
ca98l4igtjmm_-BhUhn4lDk3FL3rl37c&amp;e=3D" rel=3D"noreferrer" target=3D"_bl=
ank">r45.bb</a> b/meta-oe/recipes-devtools/android-libboringssl/android-lib=
boringssl_14.0.0+<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tp-3A__r45.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epc=
kfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Du2Cwo2K-y=
dtt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn3BaS-KW6x9pTx0g&amp;s=3DclgsP3vNtvs=
ca98l4igtjmm_-BhUhn4lDk3FL3rl37c&amp;e=3D" rel=3D"noreferrer" target=3D"_bl=
ank">r45.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..fccf6e0dff<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-libboringssl/android-libborings=
sl_14.0.0+<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__=
r45.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&a=
mp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Du2Cwo2K-ydtt9_Sh=
hkiUH91O8cYqbu988cxbRKIBcEphOgnCn3BaS-KW6x9pTx0g&amp;s=3DclgsP3vNtvsca98l4i=
gtjmm_-BhUhn4lDk3FL3rl37c&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">r4=
5.bb</a><br>
&gt; @@ -0,0 +1,70 @@<br>
&gt; +DESCRIPTION =3D &quot;BoringSSL shared libraries for android-tools&qu=
ot;<br>
&gt; +SECTION =3D &quot;libs&quot;<br>
&gt; +# This recipe is tightly coupled to android-tools: when upgrading and=
roid-tools,<br>
&gt; +# update this recipe to the BoringSSL version shipped in the correspo=
nding Debian<br>
&gt; +# android-platform-tools source package.<br>
&gt; +# BoringSSL is a fork of OpenSSL; new files carry ISC license, OpenSS=
L license<br>
&gt; +# covers the forked parts.<br>
&gt; +LICENSE =3D &quot;OpenSSL &amp; ISC&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2ca501bc96ce9ed0814e2=
c592c3f9593&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__deb.debian.org_debian_pool_main_a_android-2Dplatform-2Dexterna=
l-2Dboringssl_android-2Dplatform-2Dexternal-2Dboringssl-5F-24-257BPV-257D.o=
rig.tar.xz&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfd=
iw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D0I9kcs3yTZeL=
i7TbI-G0bkjbrmVNpkpDZTF0qEOxbR6rOj9We36bB3auvx3yHUu8&amp;s=3Dh9UIfZ9dc3gsp4=
QbhsGF_Rgdtn0WP9593DrpZPubTfQ&amp;e=3D" rel=3D"noreferrer" target=3D"_blank=
">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__deb.debian.org_deb=
ian_pool_main_a_android-2Dplatform-2Dexternal-2Dboringssl_android-2Dplatfor=
m-2Dexternal-2Dboringssl-5F-24-257BPV-257D.orig.tar.xz&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3D0I9kcs3yTZeLi7TbI-G0bkjbrmVNpkpDZTF0qEOxbR6=
rOj9We36bB3auvx3yHUu8&amp;s=3Dh9UIfZ9dc3gsp4QbhsGF_Rgdtn0WP9593DrpZPubTfQ&a=
mp;e=3D</a>=C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 file://boringssl-go-stub \<br>
&gt; +=C2=A0 =C2=A0 file://boringssl-gtest-stub.cc \<br>
&gt; +=C2=A0 =C2=A0 file://0001-cmake-add-SOVERSION-0-to-crypto-and-ssl-sha=
red-libra.patch \<br>
&gt; +&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;83d24d2f3136ba6a486b5464369b91b4&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;f9223e8c15ad5d9e3f1cd50861f4c27265886466=
1e2332bea5d60952aa0930cd&quot;<br>
&gt; +<br>
&gt; +# The Debian orig tarball unpacks to android-platform-external-boring=
ssl-${PV}/<br>
&gt; +# with the actual source under a src/ subdirectory.<br>
&gt; +S =3D &quot;${UNPACKDIR}/android-platform-external-boringssl-${PV}/sr=
c&quot;<br>
&gt; +<br>
&gt; +inherit cmake<br>
&gt; +<br>
&gt; +CFLAGS:append =3D &quot; -Wno-discarded-qualifiers&quot;<br>
&gt; +<br>
&gt; +OECMAKE_TARGET_COMPILE =3D &quot;crypto ssl&quot;<br>
&gt; +<br>
&gt; +EXTRA_OECMAKE =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 -DBUILD_SHARED_LIBS=3DON \<br>
&gt; +=C2=A0 =C2=A0 -DBUILD_TESTING=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 -DCMAKE_BUILD_TYPE=3DRelWithDebInfo \<br>
&gt; +=C2=A0 =C2=A0 -DGO_EXECUTABLE=3D${WORKDIR}/hosttools/go \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +do_configure:prepend() {<br>
&gt; +=C2=A0 =C2=A0 install -d ${WORKDIR}/hosttools<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 ${UNPACKDIR}/boringssl-go-stub ${WORKDI=
R}/hosttools/go<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # BoringSSL builds its own minimal gtest from third_par=
ty/googletest; provide<br>
&gt; +=C2=A0 =C2=A0 # an empty stub .cc. We only build the crypto and ssl t=
argets so the test<br>
&gt; +=C2=A0 =C2=A0 # source files are never compiled, but cmake still need=
s gtest-all.cc to<br>
&gt; +=C2=A0 =C2=A0 # exist to create the boringssl_gtest target.<br>
&gt; +=C2=A0 =C2=A0 if [ ! -f ${S}/third_party/googletest/src/gtest-all.cc =
]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${S}/third_party/googletest/sr=
c<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${UNPACKDIR}/boringssl-gt=
est-stub.cc \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${S}/third_party/googletest=
/src/gtest-all.cc<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +}<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 # Install headers under a boringssl/ subdirectory to av=
oid shadowing the<br>
&gt; +=C2=A0 =C2=A0 # system OpenSSL headers in the sysroot.<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${includedir}/boringssl<br>
&gt; +=C2=A0 =C2=A0 cp -a ${S}/include/openssl ${D}${includedir}/boringssl/=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Install shared libraries under ${libdir}/android/ to =
avoid conflicting<br>
&gt; +=C2=A0 =C2=A0 # with the system libssl/libcrypto in the sysroot.<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${libdir}/android<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 ${B}/crypto/libcrypto.so.0 ${D}${libdir=
}/android/libcrypto.so.0<br>
&gt; +=C2=A0 =C2=A0 ln -sf libcrypto.so.0 ${D}${libdir}/android/libcrypto.s=
o<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 ${B}/ssl/libssl.so.0 ${D}${libdir}/andr=
oid/libssl.so.0<br>
&gt; +=C2=A0 =C2=A0 ln -sf libssl.so.0 ${D}${libdir}/android/libssl.so<br>
&gt; +<br>
&gt; +}<br>
&gt; +<br>
&gt; +FILES:${PN}-dev =3D &quot;${includedir}/boringssl ${libdir}/android/l=
ibcrypto.so ${libdir}/android/libssl.so&quot;<br>
&gt; +FILES:${PN} =3D &quot;${libdir}/android/libcrypto.so.0 ${libdir}/andr=
oid/libssl.so.0&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127582): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_message_1=
27582&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&am=
p;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Du2Cwo2K-ydtt9_Shh=
kiUH91O8cYqbu988cxbRKIBcEphOgnCn3BaS-KW6x9pTx0g&amp;s=3DIka6LPC5Ewu7W4dcCp7=
zUHIFxID7vEvnSINx0aSq_Nc&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_=
g_openembedded-2Ddevel_message_127582&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa=
66m67E&amp;m=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOgnCn3BaS-KW6x9p=
Tx0g&amp;s=3DIka6LPC5Ewu7W4dcCp7zUHIFxID7vEvnSINx0aSq_Nc&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_119775569_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu988cxbRKIBcEphOg=
nCn3BaS-KW6x9pTx0g&amp;s=3Dx3dzROXs9l3ivtVjITtccKhEeGHQMmqW_AeWCJRbW0s&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_119775569_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu9=
88cxbRKIBcEphOgnCn3BaS-KW6x9pTx0g&amp;s=3Dx3dzROXs9l3ivtVjITtccKhEeGHQMmqW_=
AeWCJRbW0s&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&amp;d=3DDwIFaQ&amp;=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&amp;m=3Du2Cwo2K-ydtt9_ShhkiUH91O8cYqbu988cxbRKIBcE=
phOgnCn3BaS-KW6x9pTx0g&amp;s=3DOi6YeDRHLzPc9yzQAk-ymFYP9zlP-Fx9wCxk9kFlnVg&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_un=
sub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;=
r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Du2Cwo2K-ydtt9_Shhki=
UH91O8cYqbu988cxbRKIBcEphOgnCn3BaS-KW6x9pTx0g&amp;s=3DOi6YeDRHLzPc9yzQAk-ym=
FYP9zlP-Fx9wCxk9kFlnVg&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001c876806545a6efc--

