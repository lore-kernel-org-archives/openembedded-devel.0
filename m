Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.670.1616549356892776012
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 18:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uDMbBrz6;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id q3so16562491qkq.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Mar 2021 18:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TSKfYJvJxpjLpNighcHW/eQDOkSctJmz1zoU7OWzKKY=;
        b=uDMbBrz6H4xG/nBRtNzlPPt63m31LQ4Qq87IFJIXYu2t35f5vq//wr1tAk1nSbiKm9
         jme+hQO0V2gyHovaoY8NweIrmLnMAKMmmMHjhODKAPPxnOCDfg3Gz4VkkdmgbjG77HL7
         3ogxINy3oM0ylRqTB+Dj3FhS7sEZNS3jQcyblHO8I8Tbz6xQA5AZIsr6y047oPB0Sx0y
         HLhc/VpnXYgOAENVopaBj58cLRZWxlv4uItKmlYOU7DczUCIb54kdluxY5pZPXX5mLgX
         0JVV6XI3Unhd78wBt2NUcAjscvrbnAQ/c5OQAZ1Ni6JfBj6iF6dKt5lFUdFSnTmwjZ2F
         UE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TSKfYJvJxpjLpNighcHW/eQDOkSctJmz1zoU7OWzKKY=;
        b=C8KExCax2D7X85Q1Yjx5tOrT2cR78NoBYkOnPhZJbX2n54pHWSfMeBf2SM+L+Y9uii
         SrUJYgw2yS0EtgYor2ilZA32qr4Y+5MZgHGyrPd5tIs6I1kGdudgNWKzCm01SrBA7eDt
         AxyvcK/nhCERChDuUasqo5I5fgnGdE0SzttbBIsdobE7PM5XfHxMupRuIvPeND7lBGaL
         0UGJgP8UjDVnRhvDO6iLqraHTFLbUGXus2YlfKuS00vTmtsYvOZntGYTITE4bc/OcQeU
         pQAEHeIYzq3Z8idWr/y7OUOL3XcGGSQbI60GcCEO59Q5vkrh/gqbux6diR+u38hyeZUE
         SjfQ==
X-Gm-Message-State: AOAM530aM7ooIB8ldfFsMp6RYGSUrvltKeIZQJOKIr17SK+Ye0FOcRPs
	sksisrr49VHfoE8jS9olHo35gkVxMsSqvw5zS7Y=
X-Google-Smtp-Source: ABdhPJzBb6X49x2jKFI7YDCvo0U2jWQ/jOMOHWEO4kXKt4Z2bZ0V33Pgl9t65vWcQQl75aE7aPCgAA3hRSOfNOIFdMU=
X-Received: by 2002:a05:620a:a12:: with SMTP id i18mr934888qka.119.1616549355857;
 Tue, 23 Mar 2021 18:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210323163317.26664-1-leon.anavi@konsulko.com> <20210323163317.26664-5-leon.anavi@konsulko.com>
In-Reply-To: <20210323163317.26664-5-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 23 Mar 2021 18:28:49 -0700
Message-ID: <CAMKF1sr0BLmPLHOL7FLcOwza+6gm+qjbrK5vZ5KxAHAaQq3Utg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-scrypt: Upgrade 0.8.6 -> 0.8.17
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Fails to patch


https://errors.yoctoproject.org/Errors/Details/574380/

On Tue, Mar 23, 2021 at 9:33 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Upgrade to release 0.8.17:
>
> - Add_dll_directory for python 3.8 on windows, as
>   importlib.util.find_spec does not search all paths anymore
> - Add additional test vector from RFC
> - Fix missing import
> - Fix imp deprecation warning
> - Improve build for conda forge
> - Add SCRYPT_WINDOWS_LINK_LEGACY_OPENSSL environment variable,
>   when set, openssl 1.0.2 is linked
> - Fix build for conda feedstock
> - Fix typo
> - Use the static libcrypto_static for windows and openssl 1.1.1
> - Setup.py for windows improved, works with openssl 1.0.2 and 1.1.1
> - Setup.py for windows fixed
>
> License-Update: Update years
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...-remove-the-hard-coded-include-paths.patch | 36 ++++++-------------
>  ...rypt_0.8.6.bb => python3-scrypt_0.8.17.bb} |  9 +++--
>  2 files changed, 14 insertions(+), 31 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-scrypt_0.8.6.bb => python3-scrypt_0.8.17.bb} (53%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch b/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
> index d535e4326..42d20855d 100644
> --- a/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
> +++ b/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
> @@ -1,26 +1,10 @@
> -From d8db473ce9346cd6254c90e13ac45b3bbde494c4 Mon Sep 17 00:00:00 2001
> -From: Derek Straka <derek@asterius.io>
> -Date: Sun, 11 Mar 2018 19:55:38 -0400
> -Subject: [PATCH] py-scrypt: remove the hard coded include paths
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Derek Straka <derek@asterius.io>
> ----
> - setup.py | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/setup.py b/setup.py
> -index e36adc4..2ebfbf1 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -24,7 +24,6 @@ if sys.platform.startswith('linux'):
> -                      ('HAVE_SYS_SYSINFO_H', '1'),
> -                      ('_FILE_OFFSET_BITS', '64')]
> -     libraries = ['crypto', 'rt']
> --    includes = ['/usr/local/include', '/usr/include']
> -     CFLAGS.append('-O2')
> - elif sys.platform.startswith('win32'):
> -     define_macros = [('inline', '__inline')]
> ---
> -2.7.4
> +--- a/setup.py 2020-09-09 16:39:47.000000000 +0000
> ++++ b/setup.py 2021-03-22 11:35:31.171587290 +0000
> +@@ -25,7 +25,6 @@
> +                      ('HAVE_SYS_SYSINFO_H', '1'),
> +                      ('_FILE_OFFSET_BITS', '64')]
> +     libraries = ['crypto', 'rt']
> +-    includes = ['/usr/local/include', '/usr/include']
> +     CFLAGS.append('-O2')
> + elif sys.platform.startswith('win32'):
> +     define_macros = [('inline', '__inline')]
> diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.17.bb
> similarity index 53%
> rename from meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb
> rename to meta-python/recipes-devtools/python/python3-scrypt_0.8.17.bb
> index 7588fc54b..122aa84d0 100644
> --- a/meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-scrypt_0.8.17.bb
> @@ -1,12 +1,11 @@
>  DESCRIPTION = "Bindings for the scrypt key derivation function library"
>  LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=168ff75417f75a83e63c8875292d44dc"
> -HOMEPAGE="https://bitbucket.org/mhallin/py-scrypt/overview"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=adb100454edec31fac41b1331cc76540"
> +HOMEPAGE="https://github.com/holgern/py-scrypt"
>
>  SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
>
> -SRC_URI[md5sum] = "ae8e3263aa31b040c1f9c7f1e1843a56"
> -SRC_URI[sha256sum] = "f8239b2d47fa1d40bc27efd231dc7083695d10c1c2ac51a99380360741e0362d"
> +SRC_URI[sha256sum] = "25b5075f2238be93af1cd574540a5ea01b8547f9b678aa72d22fce22577475ec"
>
>  inherit pypi ptest setuptools3
>
> @@ -20,5 +19,5 @@ RDEPENDS_${PN}-ptest += " \
>
>  do_install_ptest() {
>      install -d ${D}${PTEST_PATH}/tests
> -    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +    cp -rf ${S}/scrypt/tests/* ${D}${PTEST_PATH}/tests/
>  }
> --
> 2.17.1
>
>
> 
>
