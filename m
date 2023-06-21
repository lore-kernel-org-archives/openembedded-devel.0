Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F276EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 09:51:06 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web11.7087.1687341060748964910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jun 2023 02:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=A4Uf6N9p;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.171, mailfrom: brgl@bgdev.pl)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4714e9f070bso1787963e0c.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 02:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687341059; x=1689933059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPf2/QNAExyafyV5DYZXUFFh6/Ul3p2DHmpi+4QpSbk=;
        b=A4Uf6N9pB65sZYAb4zASQYhg2NxY1v4sBUUVEw6emeeajkvkz4VViOrCDqXn4tV9Rk
         CXa7hMOjes4dt3av6cNPd1Y0vs5ydtU/Rgck5OaxYU+JX13Ljh6sjDcCJkNPmkhEIpiw
         +U7m1k0em0WfS8MKFBo1t7xr2iypfYOm8T/1zZtH7cHkw4KLEqv8Vv137R4/c1Z6Ct7Z
         gH9JYfDaSYSOfm9vDdTzYSQ3zoUOw2i3P2zDahK2ooBR25XTZh9iZXLpP+yhoV9v1a/i
         l0c3Be2fM3d/H7Dq2bCMOvuk7GCYQ+gj4vxaW0fmhWvCxJGhumpz4HbPUvSqHHnNmsZS
         H6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687341059; x=1689933059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPf2/QNAExyafyV5DYZXUFFh6/Ul3p2DHmpi+4QpSbk=;
        b=BmeQPUYjSY6PKOfVlqLdmYgXenMAGpms48/yp2YRmOSxvrUkdJp9a5SKWA3BL+codd
         4oniByZDMNHkFoNsJ/6EEcd/a4Tft3I9zL/tnO19uFuoQp0WbBtrB2hVJD/ZNdZKStz/
         DYdPkMJalgXWA+aW5J55VYKn2Pa6DK3kiaLw/c+Wck8rcZ31Nin4i3yFqbKJhkuCO01V
         C5u3FfITmlOI+AnSa78BuKyQnqNH8nGoToVyxk2r/ao2bmvq93VOma4c/dROxMsK9QAe
         w/399+5Btuf5Sv4VtlqyB1JL0u4r7ZLxH5TCwNtkBz1d1j5GQX94JXgu835kFo+vyRUd
         6K6w==
X-Gm-Message-State: AC+VfDwjOpU3h6JXRhRNb2ZF6ga7kWZL8Xpj/HFF4QaylqwyZFHhF1i4
	YUwTfkOw04Jy9KPnZF7+fd//ndsyBX+RQWgii7j2Dw==
X-Google-Smtp-Source: ACHHUZ7INzwuUp30B0qvT7aapklStrfhH6CPfP4smw1RChUT1QNscs9NPS9eCEIjhCudkpE2KHwjA8e4/PWYDVWj8O0=
X-Received: by 2002:a1f:bf92:0:b0:471:2aa6:41f6 with SMTP id
 p140-20020a1fbf92000000b004712aa641f6mr4886651vkf.2.1687341059576; Wed, 21
 Jun 2023 02:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230619132214.213417-1-brgl@bgdev.pl> <20230619132214.213417-2-brgl@bgdev.pl>
 <5a677745-c6a2-bd0a-5507-98bc3b185877@gmail.com> <CAMKF1sq=L-GyguojmkSd4KD9Aq5mAEaM9O-pUnECZqhzdrfetQ@mail.gmail.com>
 <CAMKF1sp403GSqm3iA99qrw-14zLbbViwQ68AOK6XhUKN4kBK3w@mail.gmail.com>
In-Reply-To: <CAMKF1sp403GSqm3iA99qrw-14zLbbViwQ68AOK6XhUKN4kBK3w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 Jun 2023 11:50:48 +0200
Message-ID: <CAMRc=MdvdXOQgTooZCeRD01VG+TwhiO6qtZNO25SCF1DN1qxpw@mail.gmail.com>
Subject: Re: [meta-python][RESEND PATCH 01/54] python3-pywbem: drop unneeded
 class from RDEPENDS
To: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 09:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103470

On Tue, Jun 20, 2023 at 8:15=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Some more dep failures on parse
>
> 23:11:18 ERROR: Nothing RPROVIDES 'python3-nocasedict-native' (but
> virtual:native:/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-opene=
mbedded/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> RDEPENDS on or otherwise requires it)
> 23:11:18 NOTE: Runtime target 'python3-nocasedict-native' is
> unbuildable, removing...
> 23:11:18 Missing or unbuildable dependency chain was:
> ['python3-nocasedict-native']
> 23:11:18 NOTE: Runtime target 'python3-pywbemtools-dev' is
> unbuildable, removing...
> 23:11:18 Missing or unbuildable dependency chain was:
> ['python3-pywbemtools-dev', 'python3-pywbem-native',
> 'python3-nocasedict-native']
> 23:11:19 NOTE: Runtime target 'python3-pywbemtools' is unbuildable, remov=
ing...
> 23:11:19 Missing or unbuildable dependency chain was:
> ['python3-pywbemtools', 'python3-pywbem-native',
> 'python3-nocasedict-native']
> 23:11:23 ERROR: Nothing RPROVIDES 'python3-nocaselist-native' (but
> virtual:native:/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-opene=
mbedded/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> RDEPENDS on or otherwise requires it)
> 23:11:23 NOTE: Runtime target 'python3-nocaselist-native' is
> unbuildable, removing...
> 23:11:23 Missing or unbuildable dependency chain was:
> ['python3-nocaselist-native']
> 23:11:28 ERROR: Nothing RPROVIDES 'python3-yamlloader-native' (but
> virtual:native:/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-opene=
mbedded/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> RDEPENDS on or otherwise requires it)
> 23:11:28 NOTE: Runtime target 'python3-yamlloader-native' is
> unbuildable, removing...
> 23:11:28 Missing or unbuildable dependency chain was:
> ['python3-yamlloader-native']
>

Feel free to drop this and whichever other patches cause failures, I
will look at whatever remains after this round.

Bart

> On Tue, Jun 20, 2023 at 11:03=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
> >
> > here are some failures
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2841
> >
> > On Mon, Jun 19, 2023 at 6:16=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > On 6/19/23 6:21 AM, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > The native package has the same dependencies. Even if normally they=
 are
> > > > satisfied by python3-native, we should still use a global RDEPENDS.
> > > >
> > >
> > > This will deepen the dependency list for native packages. Why should =
we
> > > do this ?
> > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > ---
> > > >   meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb | 2 +=
-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6=
.1.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> > > > index 71af06881..8b0383cf6 100644
> > > > --- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> > > > +++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> > > > @@ -27,7 +27,7 @@ DEPENDS +=3D " \
> > > >       ${PYTHON_PN}-wheel-native \
> > > >   "
> > > >
> > > > -RDEPENDS:${PN}:class-target +=3D "\
> > > > +RDEPENDS:${PN} +=3D "\
> > > >       ${PYTHON_PN}-datetime \
> > > >       ${PYTHON_PN}-io \
> > > >       ${PYTHON_PN}-netclient \

