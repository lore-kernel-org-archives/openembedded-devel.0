Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.811.1586895065756216096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 13:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pMws+fnU;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 37so557533qvc.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 13:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JU4JDINrti7u7Q4gHJ9ZezjzJ2y+gCvsKu1CdcSHZR8=;
        b=pMws+fnUUfhFpZ1DY8lG1LQCLUi/+5mqcoTo0UD3DAIEzjwp4mbxlO9X0iClHd9aO5
         DzrqPK+81SvIVUcKm6lFXgtC0dU6UffZpLm5HMI8KslbldTvh2mMtuasJm2snpW7vwK1
         pQgkPp/q+KLdcT5PRVryF5yuz4Uhf6uJSMcJgB5pZsAbbS1fw6NoI5b7+CIQLIxJHuLY
         L0vfbLMcM6vtoqWhfXNoxuC4PgI1iqG+xyd3dR9ekCyOZO17aifpj1+e+78G9og+oisS
         X1/J7cwln5zzRYWi8Q9DZztjj4wbSVRslLC/7sVKmhuXZtoOMx4B7R0FGsaA+kCgUwY9
         xwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JU4JDINrti7u7Q4gHJ9ZezjzJ2y+gCvsKu1CdcSHZR8=;
        b=qJCpTRgK+LfmE0EZ8tfr8QI636lnswPJGgtc1SRxeKJouchI+aYcmMsxUGX13Zw71g
         uoeW7dTHcsZ8fGKl3yCrKBOd7RBw+LuAVfekwoKgt52ifpexaLOGSZZ2aQt92zF4uCzm
         MJuyhr3y4gBrC6sFwcOeyDXj5yw8pTnqbnqVrqZbI0zeq3J+zT5vYJ0T4AqQHTkJUEuf
         ka8K++OYmhPlcHeCdYxQUxP+yPJ7PrtmF1eiPRMsd49y2dafPr7aBZgH7leXso0JbhPI
         Wxp0ljGxi45q6+4OA+aB+7WRPXWGVbN/YHE3lXVG+cxXCb4hqlnBZ7AI0jaicXPiwgbU
         iwCQ==
X-Gm-Message-State: AGi0PubLOT4iuS3foRj6yo/CHQ57w7ZPTQnhSwTjc2cOLnF58zoDjZLH
	wrHw2AsGbQDgqNikFj9j1DmbLqft8zDWsGTYm40=
X-Google-Smtp-Source: APiQypL+7BmBArjWw0jTP7jjxKD+RO+45JJFncek5DzM9k/v1MaVWcB1KYMy80KTs7+BonZ9SPzGUFvwqwEjTS2Ntng=
X-Received: by 2002:ad4:4182:: with SMTP id e2mr1784019qvp.61.1586895064683;
 Tue, 14 Apr 2020 13:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200414171527.29279-1-abhishek.shah@broadcom.com>
In-Reply-To: <20200414171527.29279-1-abhishek.shah@broadcom.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 14 Apr 2020 13:10:38 -0700
Message-ID: <CAMKF1spvWKVq1EaVjOKtg5WnK2Mjg3Okg0mgs=f9bSgY1B4tvg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] python-dateutil: Add six package as runtime dependency
To: abhishek.shah@broadcom.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 14, 2020 at 10:15 AM Abhishek Shah via
lists.openembedded.org
<abhishek.shah=broadcom.com@lists.openembedded.org> wrote:
>
> dateutil package has runtime dependency on "six" package for native version
> as well, as shown in error log below, fix the same:
>
> |     File "poky/build/tmp/work/*/recipe-sysroot-native/usr/lib/python3.8/
>                 site-packages/pykwalify/core.py", line 25, in <module>
> |       from dateutil.parser import parse
> |     File "poky/build/tmp/work/*/recipe-sysroot-native/usr/lib/python3.8/
>                 site-packages/dateutil/parser/__init__.py", line 2, in <module>
> |       from ._parser import parse, parser, parserinfo, ParserError
> |     File "poky/build/tmp/work/*/recipe-sysroot-native/usr/lib/python3.8/
>                 site-packages/dateutil/parser/_parser.py", line 42, in <module>
> |       import six
> |
> |   ModuleNotFoundError: No module named 'six'
>
> Signed-off-by: Abhishek Shah <abhishek.shah@broadcom.com>
>
> diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
> index 3c89cd62c..40f406f50 100644
> --- a/meta-python/recipes-devtools/python/python-dateutil.inc
> +++ b/meta-python/recipes-devtools/python/python-dateutil.inc
> @@ -15,10 +15,13 @@ FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
>
>  DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>
> +RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-six \
> +"
> +
>  RDEPENDS_${PN}_class-target = "\

This should perhaps be turned into RDEPENDS_${PN}_append_class-target
with this change because we will still need it on target

>      ${PYTHON_PN}-datetime \
>      ${PYTHON_PN}-numbers \
> -    ${PYTHON_PN}-six \
>      ${PYTHON_PN}-stringold \
>  "
>
> --
> 2.17.1
>
> 
