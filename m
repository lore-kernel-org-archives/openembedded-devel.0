Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED1AC02184
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 08:40:26 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.92258.1726303216813142810
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Sep 2024 01:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WbXWtB4x;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f75b13c2a8so34019811fa.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 01:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726303215; x=1726908015; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIcyNYiZZVEWvTRcOk9srGNKd232sfbguu6rA05buYk=;
        b=WbXWtB4xG8M8VcpXq7lqCiWbHJROV0tjsQM8kN6ma8uNZPcgMnF7ZXNTLx0fB3AUPN
         HqQ7YevVRcO484qnN+1RdZ8D2nNcSjpf9HMA7FXHfjpe6MyUd0Tb82q+iWEp4HmzZ6JR
         8gEL7Vcqa7eONYvKpVycvhy/6wF6/n60ph8g8dBIHf1lsVsvpRPHFSZqQ+cuGple7qn+
         vY6N98jKPng+4HP2HiOkH0/k735YYPDh1kwZXPs9ht6Q5ycmGQ78eWKxnblVGSYJvydL
         HRVwjqIvKR2jSZYJ+ye9Hpthy6tNzBH2omtlJGsQbZKnKwvxSXwtF2a91t2Hu4hYyR+k
         4xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726303215; x=1726908015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIcyNYiZZVEWvTRcOk9srGNKd232sfbguu6rA05buYk=;
        b=BraRc0yKS/pBbzYDMWRc/jo/D2wSkrFlo0+4uJDW2Jw2nm1jraIgFC6N+8myALqX+O
         XNMmawH8Xcg7IgZFb1PG4Yf45KBX6uUfXl/KUWqGrcFrydxuQO6hGP78p3sbcZAuY0Ah
         x6WYfulf4nfZbX49dx7eJ94l9XsOBK1EKC1go7FO+mI2e0g1dP0lgoC8TTK6gs2zUDNJ
         nQswIkddsxRDiev/6S6OQ9kLs+0fusd8yQpy99r8+kUZiBXxmYkwqcme0jzpDa/+1wyv
         FOGGLk3Xh+tiwAyA4V4IaLfEQV9HnoSFqZD1ytMZCdPnuEGbpp6MrzYvNSBk+1EAbp7k
         oFag==
X-Forwarded-Encrypted: i=1; AJvYcCWgj/+GaQrSwUVvWhkCt7YgHIXcgJYoOJuqIijBdqzvtEqFdLFmdt/PRpvpSQGLr7Scmzj4dZScG2u4oE0kj2i+G7Y=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz1CyDOfPbVdquurtyq9ezLlWwB1IuMwB/l+qPIuyNo9XGYVEsc
	U3m/KdhsdF++ldcyzODSUG7np6tp/lulRf/6AibYpfzegPWybkIKRTX2MdQUtF3tZjxZklRbrg5
	wvaEHgs1ixVZVPGlMx7otNh1tYTUETO0Y
X-Google-Smtp-Source: AGHT+IGCG4lI0xvgWrmgdbh4681KuB/9QlVIicj6qr9uxK3Nk6Uf7ay8UAmBeFWZC1QrxK70rGN6LUVItR+YFtSVN4I=
X-Received: by 2002:a05:6512:3b2a:b0:533:45dc:d2f0 with SMTP id
 2adb3069b0e04-53678feb0cbmr5051072e87.46.1726303214323; Sat, 14 Sep 2024
 01:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240910124936.21220-1-tolvupostur@gmail.com> <c501aa82-8069-48ce-abb2-6c6ab7a86bb1@ti.com>
 <CABhNV210+OW4qpTzP9N0fhStTEAOthxgjk4Mqq+MqikV3iYJ3A@mail.gmail.com>
 <CAMKF1sqWjSpC2dHmjibDy=hnkJk7-WUD5U0czpVDtp0gvr2rzw@mail.gmail.com>
 <4bc2eb52-493b-40b8-bf74-617840fcb40c@ti.com> <CA+chaQfa7wYpoRoqfjGkGYVveuuf_nFMJQopjoY-+haMaZuKjg@mail.gmail.com>
In-Reply-To: <CA+chaQfa7wYpoRoqfjGkGYVveuuf_nFMJQopjoY-+haMaZuKjg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 14 Sep 2024 10:40:03 +0200
Message-ID: <CA+chaQdwbRAH8P6H9_oRpRFUQ3yF5NRsn3CiQtmuHUOmA38RKA@mail.gmail.com>
Subject: Re: [oe] [PATCH] yavta: Update to kernel 6.8
To: reatmon@ti.com
Cc: Khem Raj <raj.khem@gmail.com>, tolvupostur@gmail.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 08:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112283

https://git.ideasonboard.org/yavta.git/commit/?id=3D52c975e5542504ac10bed8b=
1d68df5c75951d202

On Sat, Sep 14, 2024 at 10:38=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> Not sure which errors you were seeing, but I can confirm it fails to
> build for 32-bit in my world builds with:
>
> ../git/yavta.c:2195:51: error: format '%ld' expects argument of type
> 'long int', but argument 8 has type '__time64_t' {aka 'long long int'}
> [-Werror=3Dformat=3D]
>  2195 |                 printf("%u (%u) [%c] %s %u %u B %ld.%06ld
> %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
>       |                                                 ~~^
>       |                                                   |
>       |                                                   long int
>       |                                                 %lld
> ......
>  2199 |                         buf.timestamp.tv_sec, buf.timestamp.tv_us=
ec,
>       |                         ~~~~~~~~~~~~~~~~~~~~
>       |                                      |
>       |                                      __time64_t {aka long long in=
t}
>
> ../git/yavta.c:2257:41: error: format '%lu' expects argument of type
> 'long unsigned int', but argument 3 has type '__time64_t' {aka 'long
> long int'} [-Werror=3Dformat=3D]
>  2257 |         printf("Captured %u frames in %lu.%06lu seconds (%f
> fps, %f B/s).\n",
>       |                                       ~~^
>       |                                         |
>       |                                         long unsigned int
>       |                                       %llu
>  2258 |                 i, ts.tv_sec, ts.tv_nsec/1000, fps, bps);
>       |                    ~~~~~~~~~
>       |                      |
>       |                      __time64_t {aka long long int}
>
> This one isn't hard to fix, but maybe you were seeing some other issues.
>
> Regards,
>
> On Fri, Sep 13, 2024 at 8:38=E2=80=AFPM Ryan Eatmon via lists.openembedde=
d.org
> <reatmon=3Dti.com@lists.openembedded.org> wrote:
> >
> >
> >
> > On 9/13/2024 1:28 PM, Khem Raj wrote:
> > > On Fri, Sep 13, 2024 at 11:17=E2=80=AFAM Einar Gunnarsson via
> > > lists.openembedded.org <tolvupostur=3Dgmail.com@lists.openembedded.or=
g>
> > > wrote:
> > >>
> > >> Ooops
> > >>
> > >> On Fri, 13 Sept 2024 at 15:25, Ryan Eatmon <reatmon@ti.com> wrote:
> > >>>
> > >>>
> > >>> I'm seeing build failures on 32bit platforms with this new version.=
  Can
> > >>> anyone verify?
> > >>
> > >>
> > >> I can confirm that this does not build on 32-bit.
> > >> The problem seems to be switching to meson build - both the current =
SRCREV
> > >> and the updated one fail on time_t size with meson, but build with t=
he old mess of a code.
> > >>
> > >
> > > My builds test 64 bit on AB, locally I test 32bit arm/x86 and its
> > > using clang compiler and it works fine there too.
> > > I do not have 32bit builds+musl combination, too many combos, not
> > > enough compute power.
> >
> > I have a patch that I'm testing.  I've spoken to the upstream maintaine=
r
> > and will send the patch in to them once it's complete.  Then we can bum=
p
> > the SRCREV again once they accept it.
> >
> >
> >
> > >> Sorry about that
> > >> Einar Jon
> > >>
> > >>>
> > >>>
> > >>> On 9/10/2024 7:49 AM, Einar Gunnarsson wrote:
> > >>>> Additional changes:
> > >>>> Use https protocol for git fetch
> > >>>> Build with meson
> > >>>>
> > >>>> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> > >>>> ---
> > >>>>    .../recipes-multimedia/v4l2apps/yavta_git.bb   | 18 +++--------=
-------
> > >>>>    1 file changed, 3 insertions(+), 15 deletions(-)
> > >>>>
> > >>>> diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/me=
ta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> > >>>> index c4f31c033..db00c67b1 100644
> > >>>> --- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> > >>>> +++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> > >>>> @@ -2,9 +2,9 @@ SUMMARY =3D "Yet Another V4L2 Test Application"
> > >>>>    LICENSE =3D "GPL-2.0-only"
> > >>>>    LIC_FILES_CHKSUM =3D "file://COPYING.GPL;md5=3D751419260aa95449=
9f7abaabaa882bbe"
> > >>>>
> > >>>> -SRC_URI =3D "git://git.ideasonboard.org/yavta.git;branch=3Dmaster=
 \
> > >>>> +SRC_URI =3D "git://git.ideasonboard.org/yavta.git;branch=3Dmaster=
;protocol=3Dhttps \
> > >>>>              "
> > >>>> -SRCREV =3D "65f740aa1758531fd810339bc1b7d1d33666e28a"
> > >>>> +SRCREV =3D "323facd1d5bd6251eec70dd5c1484a12ce01202a"
> > >>>>
> > >>>>    PV =3D "0.0"
> > >>>>    S =3D "${WORKDIR}/git"
> > >>>> @@ -12,16 +12,4 @@ S =3D "${WORKDIR}/git"
> > >>>>    # Upstream repo does not tag
> > >>>>    UPSTREAM_CHECK_COMMITS =3D "1"
> > >>>>
> > >>>> -EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> > >>>> -
> > >>>> -# The yavta sources include copies of the headers required to bui=
ld in the
> > >>>> -# include directory.  The Makefile uses CFLAGS to include these, =
but since
> > >>>> -# we override the CFLAGS then we need to add this include path ba=
ck in.
> > >>>> -CFLAGS +=3D "-I${S}/include"
> > >>>> -
> > >>>> -do_install() {
> > >>>> -    install -d ${D}${bindir}
> > >>>> -    install -m 0755 yavta ${D}${bindir}
> > >>>> -}
> > >>>> -
> > >>>> -
> > >>>> +inherit meson
> > >>>>
> > >>>>
> > >>>>
> > >>>>
> > >>>>
> > >>>
> > >>> --
> > >>> Ryan Eatmon                reatmon@ti.com
> > >>> -----------------------------------------
> > >>> Texas Instruments, Inc.  -  LCPD  -  MGTS
> > >>
> > >>
> > >>
> > >> --
> > >> Regards
> > >> Einar J=C3=B3n
> > >>
> > >>
> > >>
> >
> > --
> > Ryan Eatmon                reatmon@ti.com
> > -----------------------------------------
> > Texas Instruments, Inc.  -  LCPD  -  MGTS
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#112280): https://lists.openembedded.org/g/openembed=
ded-devel/message/112280
> > Mute This Topic: https://lists.openembedded.org/mt/108374819/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

