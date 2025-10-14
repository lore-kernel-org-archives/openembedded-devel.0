Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E1ECCD193
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 17:17:58 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.web10.1857.1760462276894195331
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 10:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eM2TIBnp;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-633b45fad1aso5415290d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760462276; x=1761067076; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4oD4q6eW1hvLoMsOV2BSfWcRBIz5mXH2+WS3rGZbdo=;
        b=eM2TIBnpSyFjSDo9Z6Qaj++kGYjQ/t3RulsMun0uzkFyoBzA0bgOTlJD8pM177fPIh
         vBPe2J+aA2ZlzF6GdcWbymvYkN9aK/iNyjg7wBDg5fnB2yiSvl2TUUO8nYgvxJIap1Jz
         EQEX6ZdXdQ7cdR7n47zMCDKnUAwidV5zzshYhoaBC+vQp5RJi2u72aHj4B5GM1An91eX
         TKrlsX8FvGF5OZmEGZnTugxjvmxmfePus+0UglsgeP8fTw12/XUDAxLFJ90ybtlqmtSh
         dxkhWU4KsKF/9cwuMLVcJdn4/4qwMZk6VncTyBb4dSNy0DYZvatLErduZwMF0rT+4GQF
         5N9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760462276; x=1761067076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4oD4q6eW1hvLoMsOV2BSfWcRBIz5mXH2+WS3rGZbdo=;
        b=hsnP2Ft329MeDAOE0vsIcRnsv6GNOHK1vu68PkU84OWMQ4oWUI1qE2HbUx3vzGwffY
         LIJEva/QUXJrx78nTR1bihyhjPpiQmzOBBCZ0SX+Qs8e3VmC4qzBiFjSMnsWIJl5/y6a
         jmapDKp/lF/ag51ImpXailSAFc6hTxmbDuQQo8gTePo/nAB7XlS9sknEOokTNEZRE6al
         pSguYxzYBm9033aZSsFKZPKhH6Yc7KHvrGFIBaI/jvYC7sfgKYzvyG5pj/Hu/pfhJC9V
         PX5oqZUdgbXGiyBu6F0Q36jEYg2e9bkRxRl5Sw4DYoIfoZsAltOQYzb1LiPrJPeITmJD
         3iRA==
X-Forwarded-Encrypted: i=1; AJvYcCWO0fGLflXYUB9Wv3aCMAMIOfuouoXCpF1BSwk62UjdTE70O9NfLnQ+gdsNL3+V1rLmUcgYUMF1326E71CZdywEjuE=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxs2kENrrY1hEy1tX4qyTUn6wsHEtqltwRqN3ib4UiTSVS89WQN
	sOPBB3HDp0nx7x66OfZAM7w2cOj7GmVKPBQdeEPqezDMuy1dbO1soj8Vh19Tb9kXhvo3dB3duzB
	Fi9zth+AgqHg48sbryto16wc/lm1J6I4=
X-Gm-Gg: ASbGnct0vyHeS9dY3HQY9K7ttuupqigt59icsgpN6lZY6mb4b3Q2suvxFe65yC0v/Q2
	Nm467NLmNPkbRR5y+P2GpzQGprFUI5m8gLufhQ6Lbnx1oLFJCQiIRSlGzjzgYpkCEWGeOrtnf9k
	5VzUpbNxU/LWhEDEp+g0QaHONtuIxkvyC6UWtuj5+wM0fP9rTP+BprtVizZ4E5xwexsNoP47Sll
	blbfD2TqZpWdpVPXadcV86gPrjL09WeBYnp42eukV04DVH0l9KIWomOYg==
X-Google-Smtp-Source: AGHT+IGB763tpbI1QjKiNpnQXSR1jmTOqo8qX5Wt4GNW1D0eguT5KUlYa+rL3hvG9m5rSIgj3/rYdrRGuBGvPUpwx0Y=
X-Received: by 2002:a05:690e:4344:b0:636:d4ac:7324 with SMTP id
 956f58d0204a3-63ccb9674a1mr18408842d50.48.1760462275939; Tue, 14 Oct 2025
 10:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20251014091927.493-1-wangmy@fujitsu.com> <20251014091927.493-40-wangmy@fujitsu.com>
 <CAO5Uq5T+nfCGFeO+G4-QdJbbkONf6Y6vvrc6UpwfTYAxusbDog@mail.gmail.com>
In-Reply-To: <CAO5Uq5T+nfCGFeO+G4-QdJbbkONf6Y6vvrc6UpwfTYAxusbDog@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Oct 2025 10:17:29 -0700
X-Gm-Features: AS18NWAYXPEmvGNC6tANrjgQxQiT8F4sfH2efznjBQCNewYIczJ7OI8-RTpXumY
Message-ID: <CAMKF1sqHtKJLZpKJQ6AeMf0AcONSnM=Qkh2mYOLJ3T3oDDE4qw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 40/44] python3-zeroconf: upgrade
 0.147.2 -> 1.0.0
To: alex.kiernan@gmail.com
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 17:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120620

On Tue, Oct 14, 2025 at 2:33=E2=80=AFAM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Tue, Oct 14, 2025 at 10:21=E2=80=AFAM wangmy via lists.openembedded.or=
g
> <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
>
> I believe this major version bump was unintentional:
>
> https://pypi.org/project/zeroconf/#history
>
> "This release was YANKED as the major version bump was not intended."
>
yeah good catch, I wonder if the upgrade helper gets tripped with such yank=
s.

> >  .../{python3-zeroconf_0.147.2.bb =3D> python3-zeroconf_1.0.0.bb}  | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-python/recipes-devtools/python/{python3-zeroconf_0.147.2.b=
b =3D> python3-zeroconf_1.0.0.bb} (81%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.147=
.2.bb b/meta-python/recipes-devtools/python/python3-zeroconf_1.0.0.bb
> > similarity index 81%
> > rename from meta-python/recipes-devtools/python/python3-zeroconf_0.147.=
2.bb
> > rename to meta-python/recipes-devtools/python/python3-zeroconf_1.0.0.bb
> > index 31d671ceca..9d23e8a8fb 100644
> > --- a/meta-python/recipes-devtools/python/python3-zeroconf_0.147.2.bb
> > +++ b/meta-python/recipes-devtools/python/python3-zeroconf_1.0.0.bb
> > @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/jstasiak/python-zeroco=
nf"
> >  LICENSE =3D "LGPL-2.1-or-later"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9fe712b1bc27c5c4e9ecd7f31d2=
08900"
> >
> > -SRC_URI[sha256sum] =3D "2f91e2544433acfa928c8dbaea7af8bf0644e069046107=
99d6b762fd599d81bd"
> > +SRC_URI[sha256sum] =3D "3834ccf45c1e12cae78707ce691b20969e78aead28ae93=
9b158b7d08c4195ac9"
> >
> >  inherit pypi python_poetry_core cython
> >
> > --
> > 2.43.0
> >
> >
> >
> >
>
>
> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120602): https://lists.openembedded.org/g/openembedde=
d-devel/message/120602
> Mute This Topic: https://lists.openembedded.org/mt/115749717/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

