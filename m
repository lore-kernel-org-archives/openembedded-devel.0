Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4595C02183
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 08:39:16 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.92248.1726303151010783444
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Sep 2024 01:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=krQX3k6C;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-535694d67eeso2878213e87.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726303149; x=1726907949; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kusYarSzYBLdcivEA1OiOyzsJVvtJq+JBkWmZlGdipk=;
        b=krQX3k6CmFHeTj8pAAIBQsvduA+DaRlXDIVvwtpIWayXKZBPVs/W+oDXynsC63rMwI
         lF2XhLlZg0QUxgKv9qZ1ZNBKwSgPiEScc/jZoT/Gzb3nAl2kypqZZ9nGWVx9H1L3KArV
         CLki1H2CYNYgD8jZI49ETH6bKucVXoumJKwm7W3wEssu0TLSfg2E5d3fES0j20QjjZj9
         r0Tv0BGg0ignxl7WFOLt/KkN9qHIt+n1BwcomP+WkECYCIfvPA3bUS9tRaqUNc6nF469
         0clFXnbd1qicqcgqrSveJyNut1vq2NbOWPg30WmLr6m8IaKHmq/Az4Q3xba0rmmzIJIo
         XALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726303149; x=1726907949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kusYarSzYBLdcivEA1OiOyzsJVvtJq+JBkWmZlGdipk=;
        b=trMXxNkJwzIGwKnqKPgCkffRQQWQCnCgCuP4RjfoGUJwa2BTp2G9MXNErPvZv4WqXv
         4nArqDMG7wkM+87BnKDnZLVKvwX/+HlxwcP7NQZjVtG+mQePC6nrhcrzVatleixjW9bm
         tgeqBc26JCeKleM+remlv88axzXcuXqrQS51Tzo0ZjEitW2XAfnt6/PUbIfzquUI+NNz
         w1jrM5MLMJ9BsAndzkaEFdDNQNOaPcx7ZnOYUfqKtxZ760rOjHi2c80MILdCPYdp+fgp
         WN4rY5UA//SgR7Q4+Ywe6RyU1yemtBCl9KsJtNREyannsyahq0Qxj4Bz3A/T14wYiZfG
         UO7w==
X-Forwarded-Encrypted: i=1; AJvYcCWH6m3MykMeUMKOS3CkPEa+WpuxnTy5Gr7wqw+0frjPnC5L0olnGInZLIPoLzt++tkoX1KT4A/9y7+Jvv5ug1XoRbM=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy6T5sxon3/Ye2RKoH02Zh3veJOX09DBtXi2ib9xZe+0H8pgwVS
	u+O87JeA0BXVRl2jClaZyu0+/Jrj5ULbPueW/gudscw3x8nWTtaKrBiy3iVxsXDgCg5SSJOabdx
	lzP4p2kuT7nLE1Dw8oFFsU4FmaoI=
X-Google-Smtp-Source: AGHT+IEXHOxpcTFMc5Ve8ZRdvTv4vtvGvSt+CLzPb11bSvJ2t0uwfbJh2TFX/c8UhQvYGhAacJERZRm6qqlnCGe6oAY=
X-Received: by 2002:a05:6512:3c91:b0:535:639d:e3e0 with SMTP id
 2adb3069b0e04-5367909dd09mr2922784e87.24.1726303147958; Sat, 14 Sep 2024
 01:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240910124936.21220-1-tolvupostur@gmail.com> <c501aa82-8069-48ce-abb2-6c6ab7a86bb1@ti.com>
 <CABhNV210+OW4qpTzP9N0fhStTEAOthxgjk4Mqq+MqikV3iYJ3A@mail.gmail.com>
 <CAMKF1sqWjSpC2dHmjibDy=hnkJk7-WUD5U0czpVDtp0gvr2rzw@mail.gmail.com> <4bc2eb52-493b-40b8-bf74-617840fcb40c@ti.com>
In-Reply-To: <4bc2eb52-493b-40b8-bf74-617840fcb40c@ti.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 14 Sep 2024 10:38:56 +0200
Message-ID: <CA+chaQfa7wYpoRoqfjGkGYVveuuf_nFMJQopjoY-+haMaZuKjg@mail.gmail.com>
Subject: Re: [oe] [PATCH] yavta: Update to kernel 6.8
To: reatmon@ti.com
Cc: Khem Raj <raj.khem@gmail.com>, tolvupostur@gmail.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 08:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112282

Not sure which errors you were seeing, but I can confirm it fails to
build for 32-bit in my world builds with:

../git/yavta.c:2195:51: error: format '%ld' expects argument of type
'long int', but argument 8 has type '__time64_t' {aka 'long long int'}
[-Werror=3Dformat=3D]
 2195 |                 printf("%u (%u) [%c] %s %u %u B %ld.%06ld
%ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
      |                                                 ~~^
      |                                                   |
      |                                                   long int
      |                                                 %lld
......
 2199 |                         buf.timestamp.tv_sec, buf.timestamp.tv_usec=
,
      |                         ~~~~~~~~~~~~~~~~~~~~
      |                                      |
      |                                      __time64_t {aka long long int}

../git/yavta.c:2257:41: error: format '%lu' expects argument of type
'long unsigned int', but argument 3 has type '__time64_t' {aka 'long
long int'} [-Werror=3Dformat=3D]
 2257 |         printf("Captured %u frames in %lu.%06lu seconds (%f
fps, %f B/s).\n",
      |                                       ~~^
      |                                         |
      |                                         long unsigned int
      |                                       %llu
 2258 |                 i, ts.tv_sec, ts.tv_nsec/1000, fps, bps);
      |                    ~~~~~~~~~
      |                      |
      |                      __time64_t {aka long long int}

This one isn't hard to fix, but maybe you were seeing some other issues.

Regards,

On Fri, Sep 13, 2024 at 8:38=E2=80=AFPM Ryan Eatmon via lists.openembedded.=
org
<reatmon=3Dti.com@lists.openembedded.org> wrote:
>
>
>
> On 9/13/2024 1:28 PM, Khem Raj wrote:
> > On Fri, Sep 13, 2024 at 11:17=E2=80=AFAM Einar Gunnarsson via
> > lists.openembedded.org <tolvupostur=3Dgmail.com@lists.openembedded.org>
> > wrote:
> >>
> >> Ooops
> >>
> >> On Fri, 13 Sept 2024 at 15:25, Ryan Eatmon <reatmon@ti.com> wrote:
> >>>
> >>>
> >>> I'm seeing build failures on 32bit platforms with this new version.  =
Can
> >>> anyone verify?
> >>
> >>
> >> I can confirm that this does not build on 32-bit.
> >> The problem seems to be switching to meson build - both the current SR=
CREV
> >> and the updated one fail on time_t size with meson, but build with the=
 old mess of a code.
> >>
> >
> > My builds test 64 bit on AB, locally I test 32bit arm/x86 and its
> > using clang compiler and it works fine there too.
> > I do not have 32bit builds+musl combination, too many combos, not
> > enough compute power.
>
> I have a patch that I'm testing.  I've spoken to the upstream maintainer
> and will send the patch in to them once it's complete.  Then we can bump
> the SRCREV again once they accept it.
>
>
>
> >> Sorry about that
> >> Einar Jon
> >>
> >>>
> >>>
> >>> On 9/10/2024 7:49 AM, Einar Gunnarsson wrote:
> >>>> Additional changes:
> >>>> Use https protocol for git fetch
> >>>> Build with meson
> >>>>
> >>>> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> >>>> ---
> >>>>    .../recipes-multimedia/v4l2apps/yavta_git.bb   | 18 +++----------=
-----
> >>>>    1 file changed, 3 insertions(+), 15 deletions(-)
> >>>>
> >>>> diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta=
-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> >>>> index c4f31c033..db00c67b1 100644
> >>>> --- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> >>>> +++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> >>>> @@ -2,9 +2,9 @@ SUMMARY =3D "Yet Another V4L2 Test Application"
> >>>>    LICENSE =3D "GPL-2.0-only"
> >>>>    LIC_FILES_CHKSUM =3D "file://COPYING.GPL;md5=3D751419260aa954499f=
7abaabaa882bbe"
> >>>>
> >>>> -SRC_URI =3D "git://git.ideasonboard.org/yavta.git;branch=3Dmaster \
> >>>> +SRC_URI =3D "git://git.ideasonboard.org/yavta.git;branch=3Dmaster;p=
rotocol=3Dhttps \
> >>>>              "
> >>>> -SRCREV =3D "65f740aa1758531fd810339bc1b7d1d33666e28a"
> >>>> +SRCREV =3D "323facd1d5bd6251eec70dd5c1484a12ce01202a"
> >>>>
> >>>>    PV =3D "0.0"
> >>>>    S =3D "${WORKDIR}/git"
> >>>> @@ -12,16 +12,4 @@ S =3D "${WORKDIR}/git"
> >>>>    # Upstream repo does not tag
> >>>>    UPSTREAM_CHECK_COMMITS =3D "1"
> >>>>
> >>>> -EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> >>>> -
> >>>> -# The yavta sources include copies of the headers required to build=
 in the
> >>>> -# include directory.  The Makefile uses CFLAGS to include these, bu=
t since
> >>>> -# we override the CFLAGS then we need to add this include path back=
 in.
> >>>> -CFLAGS +=3D "-I${S}/include"
> >>>> -
> >>>> -do_install() {
> >>>> -    install -d ${D}${bindir}
> >>>> -    install -m 0755 yavta ${D}${bindir}
> >>>> -}
> >>>> -
> >>>> -
> >>>> +inherit meson
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>
> >>> --
> >>> Ryan Eatmon                reatmon@ti.com
> >>> -----------------------------------------
> >>> Texas Instruments, Inc.  -  LCPD  -  MGTS
> >>
> >>
> >>
> >> --
> >> Regards
> >> Einar J=C3=B3n
> >>
> >>
> >>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112280): https://lists.openembedded.org/g/openembedde=
d-devel/message/112280
> Mute This Topic: https://lists.openembedded.org/mt/108374819/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

