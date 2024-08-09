Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CECC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 21:42:39 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.94860.1723239751402980955
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 14:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FT6jrgIq;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-709340f1cb1so933285a34.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 14:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723239750; x=1723844550; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybblDT0CsAUJo2Iq0nIivdIEekj9uswOxnHMKaxvGzo=;
        b=FT6jrgIqAQmYDcBbBjXYXNQ0JkKXB62CcnP8AaMkZC9U+0mMIpBOv4TRyyz/GHVcP8
         GOdKP2XpwEQ9LNSX6KC85KpixMFkVV71E9qPjqkZtPQGKDm/vj3D2LLpz3H6+8CCKaVl
         Tz8BnqNtFqMeF171RJdELUBTX8p0FT2QkCiB7SmbYi6kjJ7hbDjuioqVIxM0sJBBR8JU
         o1JddmTkrwfQPUyr4eg50PUCTSGVGFJS/xi9BXQp+mFTQ3d8zEInRpHAf8aXYw8G/9z7
         yIHpchXMNIdLwe4nV3U5+y93WKzNnZiNNr0p3U1x1wH6LhdeE8KSBdYwdf/E5xql0117
         lHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723239750; x=1723844550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybblDT0CsAUJo2Iq0nIivdIEekj9uswOxnHMKaxvGzo=;
        b=SGlgAvEMBF2psyo70hAWy9tOydfu4v6v/Kd8HFp1+QqHKY5zNSBVoMf6sdk3tP3JQ2
         Q17vsfXqEB+GxJycRdYhuhTHQ7RzkopjXKt8HNqHfZ7zrh9C2/ONCby3YvCiwqwAezWC
         BGNsRboGIoBjkkit76yjsk47NBve9JtXsYsjhERY5Xt+ElDlPJz0HPlIyfoVnbI2nUAv
         ckk04zusHp/D1YCsXjvUi7vHfkt0l1GkwdcYS3UU6U8GxuB+I2oq2JJJ6cWKDaEA+T+X
         s9P01tSS/KO3Vd2jJIkCljvWi+j6CKRfs+PYN6ir0bkwL6IkBoM6T0hjMzrPx+mdlJtf
         A4FA==
X-Gm-Message-State: AOJu0YyWHXtG/0dg0pZzGsKk3H4ThepOuLP4t2qs9GhL+cAo0+P/b4JS
	09GIlG0/D5cLu83ruFG2tqUde1zLC9HGbBjAbbDWAWKY6zHiC2s8RgKWP18aWLMhBx0aa74vZfo
	8h3nVFyz12FTsu+fkn6oEMEgQBi4=
X-Google-Smtp-Source: AGHT+IETvxzBQr04TsAMve2htsbY8Z8f6VQNiDeufYgva8F/2ZcmkYwF163PN9yxzk6jpc4HGmsm5KDNFW2HoIjMDFM=
X-Received: by 2002:a05:6830:4989:b0:708:e969:e0d9 with SMTP id
 46e09a7af769-70b7482c454mr3477423a34.17.1723239750544; Fri, 09 Aug 2024
 14:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240807124748.126211-1-alperyasinak1@gmail.com> <CAMKF1srJ1+TVbifjSi7_WRadAkTdanAqWqXXN_NvUtPRVgzG1Q@mail.gmail.com>
In-Reply-To: <CAMKF1srJ1+TVbifjSi7_WRadAkTdanAqWqXXN_NvUtPRVgzG1Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Aug 2024 14:42:04 -0700
Message-ID: <CAMKF1sq9v+vFzcHz58Tv--CFTcs+ubODfPQENwwm9E2BZ6Ve3g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-daemon: switch to PEP-517 build backend
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 21:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111730

here is link to error for just this recipe -
https://errors.yoctoproject.org/Errors/Details/797752/

On Fri, Aug 9, 2024 at 9:08=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> it fails to compile see
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/4025/st=
eps/15/logs/stdio
>
> On Wed, Aug 7, 2024 at 5:47=E2=80=AFAM Alper Ak via lists.openembedded.or=
g
> <alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > The project has a proper pyproject.toml which declares the setuptools.b=
uild.meta PEP-517 backend.
> >
> > Fix:
> >
> > WARNING: python3-daemon-3.0.1-r0 do_check_backend: QA Issue: inherits s=
etuptools3 but has pyproject.toml with setuptools.build_meta, use the corre=
ct class [pep517-backend]
> >
> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > ---
> >  .../python/python3-daemon_3.0.1.bb             | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.b=
b b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
> > index 715d3bf12..4cdbff0ee 100644
> > --- a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
> > +++ b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
> > @@ -1,18 +1,18 @@
> >  DESCRIPTION =3D "Library to implement a well-behaved Unix daemon proce=
ss"
> >  HOMEPAGE =3D "https://pagure.io/python-daemon/"
> >  SECTION =3D "devel/python"
> > -
> > -DEPENDS +=3D "python3-docutils-native"
> > -RDEPENDS:${PN} =3D "python3-docutils \
> > -                  python3-lockfile (>=3D 0.10) \
> > -                  python3-resource \
> > -"
> > -
> >  LICENSE =3D "Apache-2.0 & GPL-3.0-only"
> >  LIC_FILES_CHKSUM =3D "file://README;md5=3Da3a94c615dc969a70525f1eebbac=
f235"
> >
> > -inherit pypi setuptools3
> > +PYPI_PACKAGE =3D "python-daemon"
> > +
> > +inherit pypi python_setuptools_build_meta
> >
> >  SRC_URI[sha256sum] =3D "6c57452372f7eaff40934a1c03ad1826bf5e793558e87f=
ef49131e6464b4dae5"
> >
> > -PYPI_PACKAGE =3D "python-daemon"
> > +DEPENDS +=3D "python3-docutils-native"
> > +
> > +RDEPENDS:${PN} =3D "python3-docutils \
> > +                  python3-lockfile (>=3D 0.10) \
> > +                  python3-resource \
> > +"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#111629): https://lists.openembedded.org/g/openembed=
ded-devel/message/111629
> > Mute This Topic: https://lists.openembedded.org/mt/107768088/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

