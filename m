Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.8217.1617315623843333014
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 15:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MSLHfz0P;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id v70so3804796qkb.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Apr 2021 15:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DJdwNvctsikJxMQzygTty3foGZYTA/5C1zsOyDRKxVI=;
        b=MSLHfz0P+H8I+HXFqNkzynVa7kV0l5qHMQfp3dzIsHMFYdCmqTBmTR9KRbJpowiB/h
         m2VGuMuX4tH0maKZKVlvOuJN7VLKOmzIP2qOSseXDNDGUPJw6yNSfWSfzaLGmCtGz91y
         PP6MvQr5njPKR1+hDX7kdYzxcDvJgV6w7Cb+Ngi5ksyTicjJhiPAY6inRxwL/o46WNT3
         FssiZUfcm3NHwci19JFsRnV+7+u2C9VaOKhFb7abcx54zm8sP/YjNIwc9x1aAYF7+VD2
         /W7/1pk30DWX7WupkxZ451htC52PvH8CwWjj2UMVIlknMWaIfNosHSX0lS+yFYnX/raW
         mzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DJdwNvctsikJxMQzygTty3foGZYTA/5C1zsOyDRKxVI=;
        b=lxRR3FzfbVtaMIpBFpbZz5h0K/ySEaMtN883WBtbSPAZCJSkhK3C3dpzOto4/T1DV0
         Uxnb7kp/socQU/9lqfsrYcf/QC/NV5mu1E6ZECxdxvUxHJpc569mhViHxVAUSxqBIZU3
         2C1HYFrfXLNJgVF0UXTJAuR94OdBtlsSqpIN049bIzs88dC/oWikvBJ+hS7Fm10thZXZ
         UAV0uOI2xcYRqn06CwGOaMZJlDREuOwJ4rs+4GE2wenSCLfIcL3sIcIOOzuzcvg/lztd
         hkVGPLbuaY1o9pCUAZt0onm7Mim4dv/cgjvUb+CmtTePLf+ONY0LN6PMBfHVwiwHmVGM
         1c7A==
X-Gm-Message-State: AOAM532OJBbDBvLWqXghVscqRtZWh63RIw/wBcd09zxai1bMoVswYbkG
	ousYudPUqpN+NEVFLSwGdwHKjh/FhpaanrhpTRA=
X-Google-Smtp-Source: ABdhPJyJh4neMGcA92aea3e7q2G/XXMF/qSewY8lYlqJUkUesEP5ltGfCzPH0Qky+e27CZAG8qlj/RjkAyj2t2kI5So=
X-Received: by 2002:a05:620a:12ae:: with SMTP id x14mr10712637qki.25.1617315622770;
 Thu, 01 Apr 2021 15:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210401123310.566-1-leon.anavi@konsulko.com>
In-Reply-To: <20210401123310.566-1-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 1 Apr 2021 15:19:56 -0700
Message-ID: <CAMKF1sp8N4stvPNnMKOBcZh94uaGsurKekZLCd4FVWAj=RAiXw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-cryptography: Upgrade 3.3.1 -> 3.4.6
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

it seems to be causing

00:02:15.567 ERROR: Nothing PROVIDES 'python3-setuptools-rust-native'
(but /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-cryptography_3.4.6.bb
DEPENDS on or otherwise requires it). Close matches:
00:02:15.567   python3-setuptools-native
00:02:15.567   python3-setuptools-scm
00:02:15.567   python3-setuptools-scm-native
00:02:16.009 ERROR: Nothing RPROVIDES 'python3-pyopenssl' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-autobahn_21.3.1.bb,
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb,
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-pyopenssl_20.0.1.bb,
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb,
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
RDEPENDS on or otherwise requires it)

On Thu, Apr 1, 2021 at 5:33 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Upgrade to release 3.4.6:
>
> - Updated Windows, macOS, and manylinux wheels to be compiled
>   with OpenSSL 1.1.1j.
>
> New versions of python3-cryptography depend on Rust. Temporary,
> the environment variable CRYPTOGRAPHY_DONT_BUILD_RUST has been set
> to disable Rust and to avoid dependency on addional layers such
> as meta-rust. Hopefully, in long-term with the introduction of
> Rust recipes in newer Yocto releases this will be fixed.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../python/python3-cryptography/h-test.patch  | 23 ++++++++++++++++---
>  ...3.3.1.bb => python3-cryptography_3.4.6.bb} |  7 +++++-
>  2 files changed, 26 insertions(+), 4 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-cryptography_3.3.1.bb => python3-cryptography_3.4.6.bb} (84%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch b/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
> index 9f07c7380..0f257a5ed 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
> +++ b/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
> @@ -1,10 +1,27 @@
> +From 0707dc0701ea265cbf979d4a10457b29721bcaf7 Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Fri, 26 Feb 2021 12:58:22 +0200
> +Subject: [PATCH] tests/hypothesis/__init__.py: Import pytest
> +
> +Import pytest.
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + tests/hypothesis/__init__.py | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/tests/hypothesis/__init__.py b/tests/hypothesis/__init__.py
> +index b5093362..d4c9b80b 100644
>  --- a/tests/hypothesis/__init__.py
>  +++ b/tests/hypothesis/__init__.py
> -@@ -3,3 +3,7 @@
> +@@ -1,3 +1,7 @@
> + # This file is dual licensed under the terms of the Apache License, Version
> + # 2.0, and the BSD License. See the LICENSE file in the root of this repository
>   # for complete details.
> -
> - from __future__ import absolute_import, division, print_function
>  +
>  +import pytest
>  +hypothesis = pytest.importorskip("hypothesis")
>  +
> +--
> +2.17.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.4.6.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography_3.4.6.bb
> index 79a7ac1bf..3978952ed 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography_3.4.6.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba"
>
>  LDSHARED += "-pthread"
>
> -SRC_URI[sha256sum] = "7e177e4bea2de937a584b13645cab32f25e3d96fc0bc4a4cf99c27dc77682be6"
> +SRC_URI[sha256sum] = "2d32223e5b0ee02943f32b19245b61a62db83a882f0e76cc564e1cec60d48f87"
>
>  SRC_URI += " \
>      file://run-ptest \
> @@ -15,11 +15,16 @@ SRC_URI += " \
>
>  inherit pypi setuptools3
>
> +# Set the environment variable to disable Rust
> +export CRYPTOGRAPHY_DONT_BUILD_RUST="1"
> +
>  DEPENDS += " \
>      ${PYTHON_PN}-cffi \
>      ${PYTHON_PN}-cffi-native \
>      ${PYTHON_PN}-asn1crypto \
>      ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-semantic-version-native \
> +    ${PYTHON_PN}-setuptools-rust-native \
>  "
>
>  RDEPENDS_${PN} += " \
> --
> 2.17.1
>
>
> 
>
