Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD98DC5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 20:09:21 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.5007.1748462956579442253
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 May 2025 13:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J5Dzwj0X;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2e3dea42465so164764fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 13:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748462956; x=1749067756; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCknuiPm+9Z+plGOOw9Qwbny8UAz6NVJ+d6MDy41uVo=;
        b=J5Dzwj0XBpGmzfEwgUpb4zWua9L+BLn632mUVXLDql+eHhkW64GT4lBcJ+baSQqVMc
         GyzREB35g8gSvJWjXWccBlCGveBhI2irQWH1wjkWbjHa+LyPQB+W7i9kOZyXmnJUn7QS
         9hqhTBN3oO3QGbo3dY+3DlWbrOHRCqZbtkKF2rDrTaVWWQWV+Mk2ZIL2LmF3KPqI7tZ2
         NYZeeryJ+yrbJQkLkTlRtkrkCoedAcxcytdQI7Th+8M4tfy1uH3/625tlr0EKoR3ABcI
         RCtQQmCsBl+OI4lNPL0sY9OcoY5hWfpJrO5WLQaimY+ne2AnW8o4BL/CgPGx+dSScmDU
         8nAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462956; x=1749067756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCknuiPm+9Z+plGOOw9Qwbny8UAz6NVJ+d6MDy41uVo=;
        b=AlBkFLbZA6926P49PWYS7xkj3EW0lsgyI0xGcaLdRJKXqHIhUoFRk/PKZiAUyzUzg3
         Pdl6D7hUSGzGt5yDFjKCjy8SHP7RYdIb/IqTJcoFMiLIBrbDXChWCrYVo5aTFZu83NB1
         WNiDlIrG70Gf8zuBih9cs2PUX2ZS0azQrVZw4LYPtYJsNhMcNE9ZOEs9gCOe4ZH7NuZF
         pxedbxvxV+U3xBLmVjH6UwgCgvHJDaHtaAIzP0+XstdHyr2HKuC7Q+6MZQkqCYLWXEkI
         Oq71tbR/NTgG4vFytxrZOL2yu/tbz+F4LwXBtUvepjBV2JuUE5zr/tRFVB7BaA1UeRwR
         GuHg==
X-Gm-Message-State: AOJu0YzNIAbe/5ik2uxXSyLsQpUVxJXdbQaZZKaXUx72h/cJ/A0At2uX
	FKBghqsDooggQ9DWZToupRiIa/Pt5hvAWWyEMIHK8kcodDM/ItQqXT6RD8+OXv1Qb1ekaXEk1Ar
	nlLdJ1dSMFDAMhpEnXPF7DmaaocPWOBA=
X-Gm-Gg: ASbGncvsAcw+7kCNdmDYssmkUvNF/vaX9su6d97WHFdc+1mpqg2UETsEgUjwzloqdGa
	DMlOxRIOKTFdlkf8mCs6YFOXaXOG6y2YPmLPRBLFhayUCrSFMThUb+2dYEO3xGjYjYfRjVDwrQ/
	6K2EFyBn/AmQDnGTmH
X-Google-Smtp-Source: AGHT+IHFUgokZ4CQ2lIxCj4dQs6400XrfY1qLXbaIE8OQgYDa3QqhmMqLB9Rd97TiRKGYlS4acmXuKhtnvbnPwIhSI8=
X-Received: by 2002:a05:6871:bb22:b0:2d6:8eb:8918 with SMTP id
 586e51a60fabf-2e8fc906d0emr569265fac.7.1748462953729; Wed, 28 May 2025
 13:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-add-cryptopp-v3-1-6ad49cdb41bb@bootlin.com>
In-Reply-To: <20250528-add-cryptopp-v3-1-6ad49cdb41bb@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 May 2025 13:08:47 -0700
X-Gm-Features: AX0GCFtKYaMOJXxVlR26Xlk3pFNexh1AZMoWYmn81NXxCXn2bK50UwYQNpeVuAE
Message-ID: <CAMKF1spXgkHhn9fSVnx+7X513h-HnXSsY_+ts=TYUQZV5KQuuQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe PATCH v3] cryptopp: add a recipe for version 8.9.0
To: antonin.godard@bootlin.com
Cc: openembedded-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 20:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117650

Fails to patch

ERROR: cryptopp-8.9.0-r0 do_patch: Applying patch
'0001-Fix-arm-crypto-logic-issue-in-config_asm.h.patch' on target
directory '/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/cryptopp/8.9.=
0/git'
CmdError('quilt --quiltrc
/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/cryptopp/8.9.0/recipe-sy=
sroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch
0001-Fix-arm-crypto-logic-issue-in-config_asm.h.patch
patching file config_asm.h
Hunk #1 FAILED at 278 (different line endings).
Hunk #2 FAILED at 290 (different line endings).
Hunk #3 FAILED at 302 (different line endings).
3 out of 3 hunks FAILED -- rejects in file config_asm.h
Patch 0001-Fix-arm-crypto-logic-issue-in-config_asm.h.patch does not
apply (enforce with -f)

On Wed, May 28, 2025 at 6:22=E2=80=AFAM Antonin Godard via
lists.openembedded.org
<antonin.godard=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Cryptopp is a library of cryptographic schemes written in C++.
> Add a recipe for it in meta-oe/recipes-crypto.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Note: I had no issue building with MACHINE to "qemux86-64" and TCLIBC =3D
> "musl", as reported here:
> https://lore.kernel.org/r/CAMKF1sreBnjjX0GW-G9+15Y+EgFQUmKUPX_cqYE7J3WaZ9=
=3D94g@mail.gmail.com
> Any extra steps to reproduce the issue would be appreciated.
> ---
> Changes in v3:
> - Add 0001-Fix-arm-crypto-logic-issue-in-config_asm.h.patch to fix the
>   arm64 build issue.
> - Revert UNPACKDIR -> WORKDIR.
> - Use +=3D not append.
> - Link to v2: https://lore.kernel.org/r/20241122-add-cryptopp-v2-1-194560=
62f791@bootlin.com
>
> Changes in v2:
> - WORKDIR -> UNPACKDIR in S
> - remove bb.utils.contains in CXXFLAGS:append:aarch64 (forgot to remove
>   after adding aarch64 override)
> - Link to v1: https://lore.kernel.org/r/20241121-add-cryptopp-v1-1-36382a=
60cecb@bootlin.com
> ---
>  ...ix-arm-crypto-logic-issue-in-config_asm.h.patch | 57 ++++++++++++++++=
++++++
>  meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb  | 45 ++++++++++++++++=
+
>  2 files changed, 102 insertions(+)
>
> diff --git a/meta-oe/recipes-crypto/cryptopp/cryptopp-8.9.0/0001-Fix-arm-=
crypto-logic-issue-in-config_asm.h.patch b/meta-oe/recipes-crypto/cryptopp/=
cryptopp-8.9.0/0001-Fix-arm-crypto-logic-issue-in-config_asm.h.patch
> new file mode 100644
> index 0000000000..6200c575aa
> --- /dev/null
> +++ b/meta-oe/recipes-crypto/cryptopp/cryptopp-8.9.0/0001-Fix-arm-crypto-=
logic-issue-in-config_asm.h.patch
> @@ -0,0 +1,57 @@
> +From 553643dffef249ff70155ea4896d83649bc213a1 Mon Sep 17 00:00:00 2001
> +From: Antonin Godard <antonin.godard@bootlin.com>
> +Date: Tue, 27 May 2025 09:00:53 +0200
> +Subject: [PATCH] Fix arm crypto logic issue in config_asm.h
> +
> +The current logic for enabling or disabling the CRYPTOPP_ARM_*_AVAILABLE
> +macros seems wrong, because we do an OR between all of the conditions
> +following `defined(__ARM_FEATURE_CRYPTO)`. Fix the logic so that the
> +CRYPTOPP_ARM_*_AVAILABLE macros are set if __ARM_FEATURE_CRYPTO is set
> +_AND_ any of the following condition is true.
> +
> +Upstream-Status: Submitted [https://github.com/weidai11/cryptopp/pull/13=
24]
> +Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> +---
> + config_asm.h | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/config_asm.h b/config_asm.h
> +index 71ffb9f8..d388124f 100644
> +--- a/config_asm.h
> ++++ b/config_asm.h
> +@@ -278,9 +278,9 @@
> + // Requires GCC 4.8, Clang 3.3 or Visual Studio 2017
> + #if !defined(CRYPTOPP_ARM_AES_AVAILABLE) && !defined(CRYPTOPP_DISABLE_A=
RM_AES)
> + # if defined(__aarch32__) || defined(__aarch64__) || defined(_M_ARM64)
> +-#  if defined(__ARM_FEATURE_CRYPTO) || (CRYPTOPP_GCC_VERSION >=3D 40800=
) || \
> ++#  if defined(__ARM_FEATURE_CRYPTO) && ((CRYPTOPP_GCC_VERSION >=3D 4080=
0) || \
> +       (CRYPTOPP_LLVM_CLANG_VERSION >=3D 30300) || (CRYPTOPP_APPLE_CLANG=
_VERSION >=3D 40300) || \
> +-      (CRYPTOPP_MSC_VERSION >=3D 1916)
> ++      (CRYPTOPP_MSC_VERSION >=3D 1916))
> + #   define CRYPTOPP_ARM_AES_AVAILABLE 1
> + #  endif  // Compilers
> + # endif  // Platforms
> +@@ -290,9 +290,9 @@
> + // Requires GCC 4.8, Clang 3.3 or Visual Studio 2017
> + #if !defined(CRYPTOPP_ARM_PMULL_AVAILABLE) && !defined(CRYPTOPP_DISABLE=
_ARM_PMULL)
> + # if defined(__aarch32__) || defined(__aarch64__) || defined(_M_ARM64)
> +-#  if defined(__ARM_FEATURE_CRYPTO) || (CRYPTOPP_GCC_VERSION >=3D 40800=
) || \
> ++#  if defined(__ARM_FEATURE_CRYPTO) && ((CRYPTOPP_GCC_VERSION >=3D 4080=
0) || \
> +       (CRYPTOPP_LLVM_CLANG_VERSION >=3D 30300) || (CRYPTOPP_APPLE_CLANG=
_VERSION >=3D 40300) || \
> +-      (CRYPTOPP_MSC_VERSION >=3D 1916)
> ++      (CRYPTOPP_MSC_VERSION >=3D 1916))
> + #   define CRYPTOPP_ARM_PMULL_AVAILABLE 1
> + #  endif  // Compilers
> + # endif  // Platforms
> +@@ -302,9 +302,9 @@
> + // Requires GCC 4.8, Clang 3.3 or Visual Studio 2017
> + #if !defined(CRYPTOPP_ARM_SHA_AVAILABLE) && !defined(CRYPTOPP_DISABLE_A=
RM_SHA)
> + # if defined(__aarch32__) || defined(__aarch64__) || defined(_M_ARM64)
> +-#  if defined(__ARM_FEATURE_CRYPTO) || (CRYPTOPP_GCC_VERSION >=3D 40800=
) || \
> ++#  if defined(__ARM_FEATURE_CRYPTO) && ((CRYPTOPP_GCC_VERSION >=3D 4080=
0) || \
> +       (CRYPTOPP_LLVM_CLANG_VERSION >=3D 30300) || (CRYPTOPP_APPLE_CLANG=
_VERSION >=3D 40300) || \
> +-      (CRYPTOPP_MSC_VERSION >=3D 1916)
> ++      (CRYPTOPP_MSC_VERSION >=3D 1916))
> + #   define CRYPTOPP_ARM_SHA1_AVAILABLE 1
> + #   define CRYPTOPP_ARM_SHA2_AVAILABLE 1
> + #  endif  // Compilers
> diff --git a/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb b/meta-oe/=
recipes-crypto/cryptopp/cryptopp_8.9.0.bb
> new file mode 100644
> index 0000000000..b1235d6b2c
> --- /dev/null
> +++ b/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb
> @@ -0,0 +1,45 @@
> +SUMMARY =3D "A C++ class library of cryptographic schemes"
> +DESCRIPTION =3D "Crypto++ Library is a C++ class library of cryptographi=
c schemes"
> +CVE_PRODUCT =3D "cryptopp"
> +HOMEPAGE =3D "http://www.cryptopp.com/"
> +SECTION =3D "libs"
> +LICENSE =3D "BSL-1.0"
> +LIC_FILES_CHKSUM =3D "file://License.txt;md5=3Dca6dacb7ef68b1ab5dfa3bed2=
4c12003"
> +
> +SRC_URI =3D "git://github.com/weidai11/cryptopp.git;protocol=3Dhttps;bra=
nch=3Dmaster \
> +           file://0001-Fix-arm-crypto-logic-issue-in-config_asm.h.patch =
\
> +           "
> +SRCREV =3D "843d74c7c97f9e19a615b8ff3c0ca06599ca501b"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit pkgconfig
> +
> +CXXFLAGS +=3D "-fPIC"
> +EXTRA_OEMAKE +=3D "HAS_SOLIB_VERSION=3D1"
> +
> +do_compile () {
> +    oe_runmake -f GNUmakefile-cross libcryptopp.a libcryptopp.so cryptes=
t.exe
> +}
> +
> +do_install () {
> +    DESTDIR=3D"${D}" \
> +        BINDIR=3D"${bindir}" \
> +        DATADIR=3D"${datadir}" \
> +        INCLUDEDIR=3D"${includedir}" \
> +        LIBDIR=3D"${libdir}" \
> +        oe_runmake install
> +
> +    # Rename cryptest.exe to cryptest
> +    if [ -f "${D}${bindir}/cryptest.exe" ]; then
> +        mv "${D}${bindir}/cryptest.exe" "${D}${bindir}/cryptest"
> +    fi
> +}
> +
> +PACKAGE_BEFORE_PN +=3D "${PN}-cryptest ${PN}-testdata ${PN}-testvectors"
> +
> +FILES:${PN}-cryptest =3D "${bindir}/cryptest"
> +FILES:${PN}-testdata =3D "${datadir}/cryptopp/TestData"
> +FILES:${PN}-testvectors =3D "${datadir}/cryptopp/TestVectors"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
>
> ---
> base-commit: 5df267759c953b9615290ea6b8d9051b83863bf9
> change-id: 20241121-add-cryptopp-f78794be963c
>
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117647): https://lists.openembedded.org/g/openembedde=
d-devel/message/117647
> Mute This Topic: https://lists.openembedded.org/mt/113343502/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

