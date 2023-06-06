Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7C3C77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 09:05:40 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web11.4386.1686042329900369066
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 02:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=ZNjeA5hx;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.181, mailfrom: brgl@bgdev.pl)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-45d59140bbdso2028053e0c.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 02:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686042329; x=1688634329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbmpqVeOGved98SHRD/hX6Fx3HD71my4a6J5de0m1Mw=;
        b=ZNjeA5hxwOffeLQ6XnQjVkpsZw1WEL7PMPREel3ptdpBVH1nG5rOoDOzUO7e4v6aQS
         LjoScTjbdrCXpivsmKadGg5+GWoIpDfERWq9m382TAb/ERu92xAVDshuatyrgXc0FSqk
         MgHEajf/32/JQZQfysaRdFDoi6Q4miVSqg8JR3xNMetH4cp5BpSFUizDSHXrIODYb4iQ
         Zpa71RSVvc2BEkbvNe4SIztPSUdDOReNCm2+AT107WMxeGRTTSLf0sh+JzJltPOkIteB
         fjtXPx2Zp8YIakZ1Xu803k1dcga0Zd0JKJAr9XuOkT/q4gkkAGR4l5EAGdqr2oW6vgAj
         tmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686042329; x=1688634329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbmpqVeOGved98SHRD/hX6Fx3HD71my4a6J5de0m1Mw=;
        b=BLazF1OfFKxbSr/CccWOxCEO+b1XRNqxMxj+LSuDlH9qYXAMRvkpjLYUXm6diHsv6E
         e1IazdvYKj07CFw393yXBs40n9QcKRjAzPizAHMWwSn7AKA/7jtmPWcQOzGpDNtTU0uH
         KFXl+vJ0lDH/1LjHhqJF8+IK8SdGQCnfi+NaWEi1fXdlAXY7dfviz7L/NroG2LDO8TV+
         +N0DREB2/H/QCmaCiuiXpOUY5GsjHAemV/KrJTBJ6vkL868x6jzaEMZsvCgnKu/6+crr
         BIW0htQJQvXeFQPhm0tm/fEiLkxZ2cZyntccUfastR9Lb54YkAgDsCGUB3Of8jEBJO3V
         FROA==
X-Gm-Message-State: AC+VfDzYhX519k3CRT2H9f/K77yO363ejbsLdBHF7rrsl4MhwfKWTJc0
	2JfVOy5ySJAqJCXBA/fwAyXbQQQSBI+/B3kB2AZKEg==
X-Google-Smtp-Source: ACHHUZ5u6+YzgUXrSyzgFTa3YcG22C54VqQan8hpzKtzxnSr1hhwULZGzgSGId8VLXctigtOSmWUeOGCmW+1VHnowik=
X-Received: by 2002:a1f:e0c3:0:b0:456:edb8:ab9 with SMTP id
 x186-20020a1fe0c3000000b00456edb80ab9mr606435vkg.5.1686042328642; Tue, 06 Jun
 2023 02:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230531082437.10646-1-brgl@bgdev.pl> <20230531082437.10646-64-brgl@bgdev.pl>
 <CAMKF1squM9TKU8g1G2-AEEt7sQHeTYZM=g+zfLSvHx8=EMsttQ@mail.gmail.com>
In-Reply-To: <CAMKF1squM9TKU8g1G2-AEEt7sQHeTYZM=g+zfLSvHx8=EMsttQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 6 Jun 2023 11:05:17 +0200
Message-ID: <CAMRc=Md49MHXQxxY3w_=Uhn1BpyScu1196BWM7OR_4KMp_kCnw@mail.gmail.com>
Subject: Re: [meta-python][PATCH 063/149] python3-pytest-mock: add missing
 run-time dependencies
To: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 09:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103137

On Mon, Jun 5, 2023 at 8:09=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> on qemux86-64/glibc I am seeing
>
> AssertionError:
> Failed ptests:
> {'python3-pytest-mock':
> ['tests/test_pytest_mock.py::test_assert_called_args_with_introspection',
>
> 'tests/test_pytest_mock.py::test_assert_called_kwargs_with_introspection'=
,
>
> 'tests/test_pytest_mock.py::test_detailed_introspection_async',
>                          'tests/test_pytest_mock.py::test_plain_stopall',
>
> 'tests/test_pytest_mock.py::test_used_with_class_scope',
>
> 'tests/test_pytest_mock.py::test_used_with_module_scope',
>
> 'tests/test_pytest_mock.py::test_used_with_package_scope',
>
> 'tests/test_pytest_mock.py::test_used_with_session_scope']}
>
>
> Cannot run ptests without @expectedFailure as ptests are expected to fail
>

I'm not sure I follow. Without this patch the ptests can't even be
started as pytest is not available for import, so it's not really a
regression.

Bart

> On Wed, May 31, 2023 at 1:26=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add missing RDEPENDS for this package.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  .../recipes-devtools/python/python3-pytest-mock_3.10.0.bb   | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.=
10.0.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb
> > index c4e672f33..bf5bc250a 100644
> > --- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb
> > @@ -18,6 +18,12 @@ inherit setuptools3 ptest
> >
> >  DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
> >
> > +RDEPENDS:${PN} +=3D " \
> > +    python3-asyncio \
> > +    python3-pytest \
> > +    python3-unittest \
> > +"
> > +
> >  S =3D "${WORKDIR}/git"
> >
> >  do_install_ptest() {
> > --
> > 2.39.2
> >

