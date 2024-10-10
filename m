Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0A9CEDDAA
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 01:24:55 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.33596.1728523487993456687
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 18:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TKotZrAq;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-288501b061fso213142fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 18:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728523487; x=1729128287; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gy/WZTuO8108UNsmy2MhHB4VYQvsRCHQ7oWTCBuzWko=;
        b=TKotZrAqzqsAMvQnYEYMlcnt8z3kUmXZvHuyeCpMeVYFUd5wCIVhRL1f8ANGxfVa5v
         4gR4BIJSaCnHXPci6XcXo8GAfhVljvDr4HuTfU92LCv8csJRdIUBQLtuiHAtnq3bmOcj
         SOb6Kj8gp2YhL7C8LfQtGDu/9H9SaAUOBJoKhepq8Qp/HtmlNeEWSGpV4iRw381EDfbQ
         hewPLSREvSHfBDNqBbm3kOLOUVPJWxkmWHEQdi8yAg67cMa90dDK6Zd8izrJcDaU1N7J
         JIiv08W1a1fkQ0aVjnNzSba4vthP26ZArlDTQdvzGgupW8R9Gb9p8eAsBaBRSvQWhdmd
         9TjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728523487; x=1729128287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gy/WZTuO8108UNsmy2MhHB4VYQvsRCHQ7oWTCBuzWko=;
        b=X0FgobEmls2Fj+jnWhKOwBM1RxDniqFF78GDKNeBAolqfXqktRZYKyQAJuxxhpzR+E
         o7Hq6BK1s0M8OqkqyCY/VR3EfDmpwitadAx/6/JgDiulz9I7WAzpepnabUmOiyed8OQa
         eu3Q7m3xvtUzO45GfmB8S4ExNWjhYGk5yA8Aq5D6MuaZp+BTjXc3Na1zLEukCqTBX8fi
         bFZXGOWi055klTGGHdJufbwry3wC+CcXrAl1RPxtr9wO1SMB0sNFosOgZvYbuTM8UAW8
         52bFEBQn3MqHEwMujDxjUjDT11i2ggrw9RFEsfkVAF+fdeKlRTnPMpbTiYjy2ehqSutV
         4kHQ==
X-Gm-Message-State: AOJu0YyZenB9rCauw31x4di+eQphFXkcXysL79MXxREAmmLiGgfZNxiR
	G97K6izW7cdz4EGJvrpsgXhs1YoJ3Qv5c0tGy5X68QVyO+7TROuTcf039Cw/kvnAmWK+pbkyRWP
	N94y+wdtWwNpSHuJiAh8kT3bUilM=
X-Google-Smtp-Source: AGHT+IHEanztCtTCRyZXhnPdaoF+LB3cLUPfCHenXMvX8hKT1NKycTp+rYnaXVUUWBdDq6KgSSYUgeJM1Y4MLnN04o8=
X-Received: by 2002:a05:6870:46ab:b0:287:31fe:de95 with SMTP id
 586e51a60fabf-2883438cde1mr3298599fac.28.1728523487142; Wed, 09 Oct 2024
 18:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241009182031.242045-1-alperyasinak1@gmail.com>
In-Reply-To: <20241009182031.242045-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Oct 2024 18:24:20 -0700
Message-ID: <CAMKF1spJ13729z=UbA5djWi-ucRBuRfyb0gEMc5zbXS3mp8Ssw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-sqlalchemy: Upgrade 2.0.32
 -> 2.0.35 and switch to PEP-517 build backend
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112749

I cant pull this series from lore, Please rebase on top of master-next
and resend.

On Wed, Oct 9, 2024 at 11:21=E2=80=AFAM Alper Ak via lists.openembedded.org
<alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
>
> - The project has a proper pyproject.toml which declares the setuptools.b=
uild.meta PEP-517 backend.
>
> - PYPI_PACKAGE name changed SQLAlchemy to sqlalchemy.
>
> - Added missing Cython dependency.
>
> Fix:
>
> WARNING: python3-sqlalchemy-2.0.32-r0 do_check_backend: QA Issue: inherit=
s setuptools3 but has pyproject.toml with setuptools.build_meta, use the co=
rrect class [pep517-backend]
>
> Changelog:
>
> https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.=
33
> https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.=
34
> https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.=
35
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  ...3-sqlalchemy_2.0.32.bb =3D> python3-sqlalchemy_2.0.35.bb} | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.32.bb=
 =3D> python3-sqlalchemy_2.0.35.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.3=
2.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.32=
.bb
> rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.b=
b
> index bb319d566..202350dcd 100644
> --- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.32.bb
> +++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
> @@ -4,10 +4,11 @@ HOMEPAGE =3D "http://www.sqlalchemy.org/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc78b979ae6c20775a28a287d32092=
cbb"
>
> -SRC_URI[sha256sum] =3D "c1b88cc8b02b6a5f0efb0345a03672d4c897dc7d92585176=
f88c67346f565ea8"
> +SRC_URI[sha256sum] =3D "e11d7ea4d24f0a262bccf9a7cd6284c976c5369dac21db23=
7cff59586045ab9f"
>
> -PYPI_PACKAGE =3D "SQLAlchemy"
> -inherit pypi setuptools3
> +inherit pypi python_setuptools_build_meta
> +
> +DEPENDS +=3D "python3-cython-native"
>
>  RDEPENDS:${PN} +=3D " \
>      python3-asyncio \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112737): https://lists.openembedded.org/g/openembedde=
d-devel/message/112737
> Mute This Topic: https://lists.openembedded.org/mt/108914710/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

