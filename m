Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1A1C6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 19:46:11 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.29486.1678477569598613308
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 11:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hqyk1lON;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id bi17so5107689oib.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 11:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678477569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQnsweNVodLMRtlM8+DF4zBbO6JNE4B3hRycAGtzpuM=;
        b=Hqyk1lONq9OB1JV3DC7IEAtVKL/VvwCTHqRExB1njP58vixbkK9T53A0P7y4tNuOQm
         Ex/WRMNu2kRdoODtEjZpehECpLzeUFk68Q3WIdU1nDOqHJ0PrB+IIHiZJDM6bIobZJYX
         deToFFSDQqctDOwhhkBHedlR5RZtASAWn0+ob+7FEvPzvNBXbXeiTqT9tkUEDpxMCoB3
         e12xvA1vGMhaaVdXgglLbX/EDXgHm6DuauwqyLf2T3CyPlXhnkXo74aAK796oijFLPZ3
         u+vnqs6f6WiMkMkbZz7OAJ77llDj8XfCvK7kiTvDgMJF+nKvBhJ2sNHr9q28l1rOkNWz
         YM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678477569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQnsweNVodLMRtlM8+DF4zBbO6JNE4B3hRycAGtzpuM=;
        b=wwfuqEc9oVDIMY3V1g4gaADSmtvDrxDmJXcfV/mvQsINLw+nXMld1dOEA2JNi6XCyY
         weUhBciBAgfdzFHSgEYuBEd+O92Es9iaI5X847WVIausAmQIstb6hz9N7FTnD1J7VbXK
         5EB2wLY10MhJsfOr+UhPJWZABEeqw4mYJSBdgLfW/LdbBSIEid2f3N4fQVz5Ch6b2pDw
         T1UEOfZatXU6KKD1geHoWJchSAxN/hLdARvFHwLsPDDvAlW1TWqDnrMZcURr658/P6Vm
         yAxfcYs96Cb49UuO+fzGiAikYadhQpWQ4IM8tGhPXjb0ZMbTKNRyes/X7PhPEIk2ormy
         ae/Q==
X-Gm-Message-State: AO0yUKWJIaRMuf98By21Vz/OO4lhekh8uWOh/U+a5SZhnht15oUTS+C9
	5fV0cSr9B5sIRhDn0H5Laa51piwTXCarjmD04II=
X-Google-Smtp-Source: AK7set8Fe7VTqfFjKE0uVUsUvIg81DkecmWmdl87gLGbyEdqabVRc75OnfkG2CeSczXkIvoMTzaRYgQwO1vXiyF1sOY=
X-Received: by 2002:a05:6808:195:b0:384:1832:233b with SMTP id
 w21-20020a056808019500b003841832233bmr9092570oic.2.1678477568667; Fri, 10 Mar
 2023 11:46:08 -0800 (PST)
MIME-Version: 1.0
References: <1678428812-7622-1-git-send-email-wangmy@fujitsu.com> <1678428812-7622-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1678428812-7622-4-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Mar 2023 11:45:42 -0800
Message-ID: <CAMKF1sr5fzQgCukjMJCrMWMotOHibPOwiPaytknoXzwZyc-qgA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 04/11] php: update 8.1.16 -> 8.2.3
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 19:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101496

xdebug needs to be fixed with php 8.2.0+ see
https://errors.yoctoproject.org/Errors/Details/697775/

On Thu, Mar 9, 2023 at 10:13=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update: Copyright year updated to 2022.
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Core:
>   . Fixed bug #81744 (Password_verify() always return true with some hash=
).
>     (CVE-2023-0567)
>   . Fixed bug #81746 (1-byte array overrun in common path resolve code).
>     (CVE-2023-0568)
>
> - FPM:
>   . Fixed bug GHSA-54hq-v5wp-fqgv (DOS vulnerability when parsing multipa=
rt
>     request body). (CVE-2023-0662)
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-devtools/php/{php_8.1.16.bb =3D> php_8.2.3.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/php/{php_8.1.16.bb =3D> php_8.2.3.bb} (9=
8%)
>
> diff --git a/meta-oe/recipes-devtools/php/php_8.1.16.bb b/meta-oe/recipes=
-devtools/php/php_8.2.3.bb
> similarity index 98%
> rename from meta-oe/recipes-devtools/php/php_8.1.16.bb
> rename to meta-oe/recipes-devtools/php/php_8.2.3.bb
> index 2f45ced95..f7639cd5f 100644
> --- a/meta-oe/recipes-devtools/php/php_8.1.16.bb
> +++ b/meta-oe/recipes-devtools/php/php_8.2.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.php.net"
>  SECTION =3D "console/network"
>
>  LICENSE =3D "PHP-3.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D99532e0f6620bc9bca34f12fadaee=
33c"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5ebd5be8e2a89f634486445bd164b=
ef0"
>
>  BBCLASSEXTEND =3D "native"
>  DEPENDS =3D "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native=
"
> @@ -33,7 +33,7 @@ SRC_URI:append:class-target =3D " \
>            "
>
>  S =3D "${WORKDIR}/php-${PV}"
> -SRC_URI[sha256sum] =3D "cd9f0ea14d82d9455587a49a0b6c802a7b8d8ff79703f9f4=
8b17db010fb633ce"
> +SRC_URI[sha256sum] =3D "87bb58865f38f5e2941813029152cea2102fe2961bb4d68b=
88f831ddd0548d0f"
>
>  CVE_CHECK_IGNORE +=3D "\
>      CVE-2007-2728 \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101476): https://lists.openembedded.org/g/openembedde=
d-devel/message/101476
> Mute This Topic: https://lists.openembedded.org/mt/97514448/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

