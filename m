Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE3CC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 04:33:10 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.11922.1671597183169889664
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 20:33:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pe9Gn3mf;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-12c8312131fso17898888fac.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 20:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3VoQkUBPoaXsMk23JadiWzlkId8i7xAHROBYsxssdI=;
        b=Pe9Gn3mfIWAa1rE7WRXqsPIalgpJPu7XcJ/a4JQZlLUBrxQOh+DMi/Y1RcFY5fcsme
         jE3p2KPJRQAvFPmqy9Yszi1WFIUmmgFOlaCoi/9I2qjca2NRJEKQ8jEQY5gg0/XKpD0d
         AHSWYvHNvvjxtE6m6zMizE3lAqLKjQr7hMykDYwWbjtGLOJlzfUoaiiAW8qO52XaJqn2
         3FdiWiSdBfRnkVNjGYP55KqzpQImyK/tLiK3ZaXdjvw0nGTcFwnIwvU/hV1zu3Etqgns
         l40Dt7/ET4bm0ZjkEqy/8DTO17ZggZa+HAnYL77WlVNbA58GxkHs6hrvUT+VYBNWSTwt
         mpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3VoQkUBPoaXsMk23JadiWzlkId8i7xAHROBYsxssdI=;
        b=bDWHoKjFz0hYC7o4nGi7sJnTM8Zp9+6B8CAt9Ucc7ncqVQizhf5yj8AdLQJ87wHxm+
         qcKKwlOdFJynTxgfBpAX2Adv8oq8mGh0ADU77xvGXY4f2oAhpR131PL49vBZR+JnU9Jv
         t/UMnJF4SwEWcFN6K4oruir9oJTomxjv+OL4W0ZmeYsn6tEx2tnaxAVBAix8KUsU5tty
         8fzhCjwJ5Mmyf6ahBdGYrYLhzr63kcIIBhDjwOZ0flNK4tCypUDPpQdopAEbN24i/UKu
         3/VO0A3llhSSrGPkyuNIQpMWSvO8rzrOHotoReCvo8orE2GUH9n1DVGDs/uRnbwTvzjF
         waLQ==
X-Gm-Message-State: AFqh2kqmH4jGQvnscU1iQD5GNga8lKso6z1dVDBDYXaHZU88VJTKxpSZ
	eSI0bDR61xeNoYhJEOtxkxpXv55B/8NX6XoSHXg=
X-Google-Smtp-Source: AMrXdXv09+NVf0sTXCewYA38CvC3W9DadUcYHYlPbL+txiLTHGacOJ2o/jV+VYLPcLiTKEjTqySiwO0g+u8DfmZsYI8=
X-Received: by 2002:a05:6870:b01d:b0:144:e1eb:419 with SMTP id
 y29-20020a056870b01d00b00144e1eb0419mr15488oae.262.1671597182339; Tue, 20 Dec
 2022 20:33:02 -0800 (PST)
MIME-Version: 1.0
References: <1671538789-7206-1-git-send-email-wangmy@fujitsu.com>
 <1671538789-7206-3-git-send-email-wangmy@fujitsu.com> <CAMKF1sqsU1hJ8mP3KmvvZ4KXag6f=vrQRdtaDWGydY2n+ojbyw@mail.gmail.com>
 <OSBPR01MB1845AEF2C68AA153AE1992DFDCEB9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB1845AEF2C68AA153AE1992DFDCEB9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Dec 2022 20:32:36 -0800
Message-ID: <CAMKF1sri9gXaegd6F9LmxXX2Azaiv09dG+_N6JaaWYVgRFbKgA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-isort: upgrade 5.10.1 -> 5.11.3
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 04:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100169

yeah it looks like an AB error.

On Tue, Dec 20, 2022 at 7:20 PM wangmy@fujitsu.com <wangmy@fujitsu.com> wro=
te:
>
> stdio: ERROR: python3-isort-5.11.3-r0 do_fetch: Fetcher failure for URL: =
'https://files.pythonhosted.org/packages/source/i/isort/isort-5.11.3.tar.gz=
'. Checksum mismatch!
>
> I downloaded the package from the download address in the error message a=
nd checked the sum, which is the same as the sum value in the patch.
> The log is as follows:
>
> $ wget https://files.pythonhosted.org/packages/source/i/isort/isort-5.11.=
3.tar.gz
> --2022-12-21 12:13:08--  https://files.pythonhosted.org/packages/source/i=
/isort/isort-5.11.3.tar.gz
> Resolving rep.proxy.nic.fujitsu.com (rep.proxy.nic.fujitsu.com)... 10.128=
.145.88
> Connecting to rep.proxy.nic.fujitsu.com (rep.proxy.nic.fujitsu.com)|10.12=
8.145.88|:8080... connected.
> Proxy request sent, awaiting response... 302 Found
> Location: https://files.pythonhosted.org/packages/e2/43/d99899bfa24a3914f=
0318536918ab8c91c09350b5482e4e9bb7291840ae3/isort-5.11.3.tar.gz [following]
> --2022-12-21 12:13:08--  https://files.pythonhosted.org/packages/e2/43/d9=
9899bfa24a3914f0318536918ab8c91c09350b5482e4e9bb7291840ae3/isort-5.11.3.tar=
.gz
> Reusing existing connection to files.pythonhosted.org:443.
> Proxy request sent, awaiting response... 200 OK
> Length: 187083 (183K) [application/x-tar]
> Saving to: =E2=80=98isort-5.11.3.tar.gz=E2=80=99
>
> isort-5.11.3.tar.gz                                 100%[=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D>] 182.70K  --.-KB/s    in 0.04s
>
> 2022-12-21 12:13:08 (4.72 MB/s) - =E2=80=98isort-5.11.3.tar.gz=E2=80=99 s=
aved [187083/187083]
>
> $ sha256sum isort-5.11.3.tar.gz
> a8ca25fbfad0f7d5d8447a4314837298d9f6b23aed8618584c894574f626b64b  isort-5=
.11.3.tar.gz
>
> This is also the result of using devtool upgrade. And there's no problem =
in the local environment when using bitbake.
>
> I don't know what the problem is.
>
>
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Wednesday, December 21, 2022 2:00 AM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-python] [PATCH] python3-isort: upgrade 5.10.1 -=
> 5.11.3
> >
> > This ends with checksum mismatch
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2253/=
steps/1
> > 4/logs/errors
> >
> > On Tue, Dec 20, 2022 at 4:20 AM wangmy <wangmy@fujitsu.com> wrote:
> > >
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Changelog:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >  Fixed #2007: settings for py3.11 (#2040)  Fixed #2038: packaging
> > > pypoetry (#2042)
> > >  Docs: renable portray (#2043)
> > >  Ci: add minimum GitHub token permissions for workflows (#1969)
> > >  Ci: general CI improvements (#2041)
> > >  Ci: add release workflow (#2026)
> > >  Hotfix #2034: isort --version is not accurate on 5.11.x releases
> > > (#2034)  Hotfix #2031: only call colorama.init if colorama is
> > > available (#2032)  Added official support for Python 3.11 (#1996,
> > > #2008, #2011)  Dropped support for Python 3.6 (#2019)  Fixed
> > > problematic tests (#2021, #2022)  Fixed #1960: Rich compatibility
> > > (#1961)  Fixed #1945, #1986: Python 4.0 upper bound dependency
> > > resolving issues  Fixed Pyodide CDN URL (#1991)
> > >  Docs: clarify description of use_parentheses (#1941)  Fixed #1976:
> > > black compatibility for .pyi files  Implemented #1683: magic trailing
> > > comma option (#1876)  Add missing space in unrecoverable exception
> > > message (#1933)  Fixed #1895: skip-gitignore: use allow list, not den=
y
> > > list  Fixed #1917: infinite loop for unmatched parenthesis (#1919)
> > >  Docs: shared profiles (#1896)
> > >  Fixed build-backend values in the example plugins (#1892)  Remove
> > > reference to jamescurtin/isort-action (#1885)  Split long cython
> > > import lines (#1931)  Update plone profile: copy of black, plus three
> > > settings. (#1926)  Fixed #1815, #1862: Add a command-line flag to sor=
t
> > > all re-exports (#1863)  Fixed #1854: lines_before_imports appending
> > > lines after comments (#1861)  Remove redundant multi_line_output =3D =
3
> > > from "Compatibility with black" (#1858)  Add tox config example
> > > (#1856)
> > >  Docs: add examples for frozenset and tuple settings (#1822)
> > >  Docs: add multiple config documentation (#1850)
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  .../python/{python3-isort_5.10.1.bb =3D> python3-isort_5.11.3.bb} | =
2
> > > +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)  rename
> > > meta-python/recipes-devtools/python/{python3-isort_5.10.1.bb =3D>
> > > python3-isort_5.11.3.bb} (85%)
> > >
> > > diff --git
> > > a/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
> > > b/meta-python/recipes-devtools/python/python3-isort_5.11.3.bb
> > > similarity index 85%
> > > rename from
> > > meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
> > > rename to meta-python/recipes-devtools/python/python3-isort_5.11.3.bb
> > > index 27977821c..4b99c1755 100644
> > > --- a/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
> > > +++ b/meta-python/recipes-devtools/python/python3-isort_5.11.3.bb
> > > @@ -4,7 +4,7
> > >  SECTION =3D "devel/python"
> > >  LIC_FILES_CHKSUM =3D
> > "file://PKG-INFO;beginline=3D6;endline=3D6;md5=3D8227180126797a0148f94f=
483f3e
> > 1489"
> > >
> > > -SRC_URI[sha256sum] =3D
> > "e8443a5e7a020e9d7f97f1d7d9cd17c88bcb3bc7e218bf9cf5095fe550be2951"
> > > +SRC_URI[sha256sum] =3D
> > "a8ca25fbfad0f7d5d8447a4314837298d9f6b23aed8618584c894574f626b64b"
> > >
> > >  inherit pypi python_poetry_core
> > >
> > > --
> > > 2.25.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#100142):
> > > https://lists.openembedded.org/g/openembedded-devel/message/100142
> > > Mute This Topic: https://lists.openembedded.org/mt/95784531/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> > > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

