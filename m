Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4AFC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 19:00:46 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.1795.1699729243573945429
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 11:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ninpj0IV;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1ef9f1640a5so1823705fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 11:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699729243; x=1700334043; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PENVGqQjJu7H1gkViS17BozdqneEsCuDnWYk5XrDCFU=;
        b=Ninpj0IVUwyqrV54g8DBB2zZaCXYUiG0H/68U1c3zga0s9Hx3SaYxekl10/LnP9a7N
         M2wI8aLw6bi9plGsdSmwsRK6HjdQch5opD4RqA2izz8GjwELHHQ6wNOyKkOs85IUPnSh
         gtpHUrNc3NPfTejqtGxQq655Sg7TWSMKcitvT5S605h632Xp/p/wHZBXaYvjWdDkpJWe
         MkMWO7zpd4DGlXAv5lY01Y4gcl8b75+bt1KXNyo5j1n/1WXyDqO6rrIi3W6Zbyb9vKqA
         sDycISQWGqusrMTVO2sFJHS6arLt9LrPqT1loQ/D/ugTRqCBadKJxjGI52u/I1rJtAbE
         52OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699729243; x=1700334043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PENVGqQjJu7H1gkViS17BozdqneEsCuDnWYk5XrDCFU=;
        b=WxeW5jE/ehtzZuGPELYo17iNCFFfuQcGcJXSOmW0ZxbMTeiygKRBpjbdo5kvSGyIcw
         enzxNtH3b4nrQv+YpfJQyRg+0nN80e5jETEdlJaYe8PCqhf3mPtLNzF0uTZT6zKpzH2c
         dzlvAuxvuyBFSBXWBjXh+FQ6ZnQmj4tOK6PGPKdgyf36K1Uciyu08sPKS7mdzZthUD4j
         pgVqut4HLJZ1EydYKXFehag8Ki05KDCqw5R/QDEgeh5tlr818gRiSY3zz8qNd8q7NI60
         S2KCormw9u07+b5ZcktZpwEYBt5ROgacbtGrJTMj9/P10i82NTQ9NO7aWEcJgpRgZq73
         SZaQ==
X-Gm-Message-State: AOJu0YwZupg9lbBMrIAPx/+REMVlqMDxFxlyMexPRBLgmdplZaSU7arX
	lojelTcfrGPtWcvsyyhbNcRl93ZNdgzMJvTLU14=
X-Google-Smtp-Source: AGHT+IHwX9IOXv172GX/TVmyj/KYGIKeAjpR7IsFTa3bRwkC3fuZKOvmI6WcgM06RUnYmcpA1vO/abs0g1b3OZ9PqiI=
X-Received: by 2002:a05:6871:53ca:b0:1f0:597d:fe30 with SMTP id
 hz10-20020a05687153ca00b001f0597dfe30mr3518100oac.44.1699729242720; Sat, 11
 Nov 2023 11:00:42 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1spgAw3VRxGECeyk3hbNM3yx1CZVGz4VNZOb+iiOWw9=2A@mail.gmail.com>
 <73831758-7C17-4540-AD08-572959D92E0E@getmailspring.com>
In-Reply-To: <73831758-7C17-4540-AD08-572959D92E0E@getmailspring.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Nov 2023 11:00:16 -0800
Message-ID: <CAMKF1spi0yRaSTzB3Y8Wm_ecR_HdgSTq3bvwLf13O5Qj6a6WWQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
To: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 19:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106565

On Sat, Nov 11, 2023 at 10:35=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10@w=
eb.de> wrote:
>
> Glad that it arrived now! This is a really great resource monitor. It is =
building from the git repository. Do you think it is better to use the rele=
ase instead?
>

Building from release is always better since we can build upon the
release testing the package might have done, but there are exceptions
to rule if
there are no release e.g. or if the release contains serious problems
we cant afford to have or features we need.


> On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem@gmail.com> wrote:
>
> Thanks for your contribution Jan
>
> On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10=
@web.de> wrote:
> >
> > ---
> > meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 +++++++++++++++++++++
> > 1 file changed, 23 insertions(+)
> > create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.bb
> >
> > diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/reci=
pes-support/btop/btop_1.2.13.bb
> > new file mode 100644
> > index 000000000..f780a993a
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> > @@ -0,0 +1,23 @@
> > +SUMMARY =3D "Resource monitor that shows usage and stats for processor=
, memory, disks, network and processes."
> > +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
> > +SECTION =3D "console/utils"
> > +
> > +SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps;b=
ranch=3Dmain"
> > +SRCREV =3D "2a864f6f2ea60df16b3f015885eb3c18a48b9b78"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit cmake
> > +
> > +FILES:${PN} +=3D " \
> > + /usr/share/icons \
>
> Lets use ${datadir} instead of hardcoded /usr/share
>
> > + /usr/share/icons/hicolor \
> > + /usr/share/icons/hicolor/48x48 \
> > + /usr/share/icons/hicolor/scalable \
> > + /usr/share/icons/hicolor/48x48/apps \
> > + /usr/share/icons/hicolor/48x48/apps/btop.png \
> > + /usr/share/icons/hicolor/scalable/apps \
> > + /usr/share/icons/hicolor/scalable/apps/btop.svg \
> > +"
> > --
> > 2.42.0
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#106559): https://lists.openembedded.org/g/openembed=
ded-devel/message/106559
> > Mute This Topic: https://lists.openembedded.org/mt/102530478/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

