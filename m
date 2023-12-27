Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90C2C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 15:47:31 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.104111.1703692045629326134
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 07:47:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZdcrO+Qp;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6dc075cbb90so285097a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 07:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703692045; x=1704296845; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0g+sIFgTj8nhCVrCKJjP7GLtAJLqhgC9Lv1PliEPEWY=;
        b=ZdcrO+QpRI+J6ZubheSNCkVunrqJ+mKec2nZgla1HWWr/nenPTci8EpHMqV6TbW0lG
         WPLjocnb4TmaT4G8xQkwT+hc1uju1yzM5yB3XkFt3yEJIrd/0tSntKV67Tq2sXd4gQci
         jEaEIbJdlw+efVYQ9Qok6Yy8WomQZhwARfpjRY0MAe/Mc2IL1t6BnY8H8bF8hnRrmwfO
         gFCHrKMnoEmpnd4O9hwhKMOjeCjk8HMR2ZSqnuAgIYTU4sc2XDf2A0iubmOKsWGtp09t
         fo4qku0xvafwYQcocmSpoPJZbPeIULgCcvglgRDKvKGfryMFzdAd0T/usJWAye+71I7S
         QiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703692045; x=1704296845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g+sIFgTj8nhCVrCKJjP7GLtAJLqhgC9Lv1PliEPEWY=;
        b=NCZPDWffbADxkLV+jkuZjUI4d717XTuu259ZxwV8VEC/x+bu8E1tj2cmJtGf+ZshNP
         tNUVg5Q3okPukyfnKpmoNW0Xvut23O49uMC608MhQMadSL1fVGaakYvoXawGVSZoRlTE
         iXMqSl/Un95hL7Cn1w0XeoXhw9q0CSCj59u5BNJ/jALjDEUDfe+7AgebiUnvC0nbiK3j
         Tt5PfsoHbgM83t2cjePOxjo/WKDXYebu2ZCyXxW+IDKU4PTcWSiTcz8243/maZESKBJI
         R+4hL2ZsKIvMW5TO4SCSSQStgGnEWp5sFPb2U89bhcmY7Ig9G8/ED4eV4wy8Rn7Y/ZDn
         6npw==
X-Gm-Message-State: AOJu0YwknbpWix6DWRwgfIWVTK8f96hznTWZtolraDhX/cTGdqM07R3N
	5uwVGZCReKSbK9j6xMfuj0OT5La9TRxR0X2QxIdRA04e/4k=
X-Google-Smtp-Source: AGHT+IHANapwZpjVim4cvXxQqEGWBNj5VJIrSnBw42EttEFgTvIux5zPR6thJnbbQieSyVduEJHXEMLo93FmAPTOcQM=
X-Received: by 2002:a05:6870:a686:b0:1fb:75c:3fee with SMTP id
 i6-20020a056870a68600b001fb075c3feemr12487298oam.78.1703692044661; Wed, 27
 Dec 2023 07:47:24 -0800 (PST)
MIME-Version: 1.0
References: <1702599513-1613-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1702599513-1613-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Dec 2023 07:46:58 -0800
Message-ID: <CAMKF1sp43mV0FF72imXtTMW-ctvqUNZRMUMOwLSDbUG4hYfRTA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pylint: upgrade 3.0.2 -> 3.0.3
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 15:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107868

btw, there is a ptest failure

    Failed ptests:
    {'python3-pylint':
['tests/test_functional.py::test_functional[deprecated_module_py310]',

'tests/test_functional.py::test_functional[regression_distutil_import_error=
_73]']}

Csn you look into it ?

bitbake meta-python3-ptest-python3-pylint
should be able to show these failures with ptest in distro features.

On Thu, Dec 14, 2023 at 4:19=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Fixed false positive for unnecessary-lambda when the call has keyword
>  arguments but not the lambda.
> -Fixed incorrect suggestion for shallow copy in unnecessary-comprehension
> -Fix false positives for undefined-variable and unused-argument for
>  classes and functions using Python 3.12 generic type syntax.
> -Fixed pointless-string-statement false positive for docstrings
>  on Python 3.12 type aliases.
> -Fix false positive for invalid-exception-operation when concatenating tu=
ples
>  of exception types.
> -Fix a bug where pylint was unable to walk recursively through a director=
y if
>  the directory has an __init__.py file.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-pylint_3.0.2.bb =3D> python3-pylint_3.0.3.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pylint_3.0.2.bb =3D>=
 python3-pylint_3.0.3.bb} (97%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.0.2.bb =
b/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
> similarity index 97%
> rename from meta-python/recipes-devtools/python/python3-pylint_3.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
> index 8af74b7cb..09ab1f26f 100644
> --- a/meta-python/recipes-devtools/python/python3-pylint_3.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf754550e6=
5755c42985a5d4e9c9"
>  SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmaintenance/3.=
0.x;protocol=3Dhttps \
>             file://run-ptest \
>             "
> -SRCREV =3D "efee9618894795cc8847727108522aa79431ee25"
> +SRCREV =3D "1a5ffc1f447b77071ffe18a9c6836c09147ee2ed"
>
>  inherit python_setuptools_build_meta ptest
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107471): https://lists.openembedded.org/g/openembedde=
d-devel/message/107471
> Mute This Topic: https://lists.openembedded.org/mt/103181847/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

