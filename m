Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCC6C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 13:28:45 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.51814.1699018123489548270
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 06:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g0RuZ+eD;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7a94de8c70cso69363339f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 06:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699018123; x=1699622923; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZJAxcz/a4iWitfCIk2EGrhMl1pxiS/3frK38aVkdNU=;
        b=g0RuZ+eDY5MwOBAQw3OvCbhVlvk3owuAPXXbgWZ9ooC3ILeBQe22SZ7Stmae6DSmP9
         dJK7JptTa9V2TEGSYt8j2VINYE4CoHe9ohi4Lcf4N0Ir+l2czHqV8K6jg6coF4hj7tpo
         KJFmj3Hq4UsHQf832M3K1hLCxQsDYSWq4V/dYRg9akKK4LAHeOVlmTVtlHEQ3pbvapLh
         gTcETSzn8NGzMRYTxJQeTmkASddVBd5+Zncos/as3t4YIeqnuidn87bmhXszc0XTV4lr
         IwlEoTZIlxu1p5y0zoUhoOXMOX/M9C407+lhy1WexinjKXNVqv70xMctXFBuytnWGQy5
         dhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699018123; x=1699622923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZJAxcz/a4iWitfCIk2EGrhMl1pxiS/3frK38aVkdNU=;
        b=YyKyf9HnQ40zIxWHAcrFckuB+4EVYKzV1tBiqGhoq3P+1uwbXccASCEZ0xmtIAiIbg
         SfO6vTSXUCRI62Wh/7vz5sLz6rv4Q6TLM8xeXwEevsj67VAwI+3HKLxoaTY8IRR0OZzv
         LsjVuYKBCvQHZRtiGS9/VU9Q842Z0rLF5BbZyQD7qHLJIQGvuGTDqMs3CtFhKx8vspGo
         uWyPnPWlR2mz8/hKGKwHbTwowxJYWjidXAmruq2WzREgCWJEqn5V8sxeIq/oN8cESsPd
         xJCtxbTEPMf3PAiAz/g/HDkat5H7s0cckLlVLVL3CH2n2NoOWUWw9dk+J7vBDqudkzgR
         461g==
X-Gm-Message-State: AOJu0Yw/aVdovgNX2Y/PvCzfkfoqyG5IDwWY5m9KlC0OXTFvdIQ++HwB
	5A9hVD5pFwfcNbviDHzKw6sMFxKXnD/PuHx+nsw=
X-Google-Smtp-Source: AGHT+IG+pzUqaSLUBk2mxVvZ2cWpUJ7/FZwV96KddvgMH8lfTAuatsJGV7f8XNZ919Sst5WT5fz70jn9PRTQwKPkpoQ=
X-Received: by 2002:a05:6602:1491:b0:7a9:5e03:a785 with SMTP id
 a17-20020a056602149100b007a95e03a785mr25775233iow.15.1699018121169; Fri, 03
 Nov 2023 06:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <d9ff922b-383a-4cec-b206-84d86987f4f8@navimatix.de>
 <CANPvuRkMCLPXo9FWwU+gDn4=O51=7OGWMj=Z47NGEv6F-8uZTw@mail.gmail.com>
 <CADkTA4N-aH1jf3SAVykTQ+G+t-baWNEOBjH5O56u25QJmmqw5w@mail.gmail.com>
 <CAMKF1srD7oyOwy8-ycm=wqqnpC8fGT858pManMLS6QCWL9tXXA@mail.gmail.com>
 <CANPvuRmrKmZC65RqFkHV2-wTZnMmLwH0f_cQprmB3Boc5w7sNg@mail.gmail.com>
 <c89d8ff8-d3b1-40b7-bf07-3d8928c0fa48@navimatix.de> <CADkTA4NK8=9su8PUSiLETUpe725fezrHqacneiKkjDz4iDP6Lw@mail.gmail.com>
 <034542e5-9942-42b1-b57a-49c007d7e058@navimatix.de> <CADkTA4MKV9h6ttdFEtKdiQ7jP8LfPbbWk8agqK9g0goExWZNmw@mail.gmail.com>
 <1792E56CCC9D9F4D.20486@lists.openembedded.org> <ad3674f6-60e7-4b35-9c3c-4814c42cac4d@navimatix.de>
In-Reply-To: <ad3674f6-60e7-4b35-9c3c-4814c42cac4d@navimatix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 3 Nov 2023 09:28:29 -0400
Message-ID: <CADkTA4Nb=59ceks1WsbUG5g-zqsJtb1RVG-geUDqA0XzGCcShw@mail.gmail.com>
Subject: Re: [oe] openssl-native.rm_work runs before kernel-module.install ->
 no signature
To: =?UTF-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105863

On Fri, Nov 3, 2023 at 3:49=E2=80=AFAM J=C3=B6rg Sommer <joerg.sommer@navim=
atix.de> wrote:
>
> On 30.10.23 14:24, J=C3=B6rg Sommer via lists.openembedded.org wrote:
> > On 30.10.23 13:29, Bruce Ashfield wrote:
> >> On Mon, Oct 30, 2023 at 4:40=E2=80=AFAM J=C3=B6rg Sommer <joerg.sommer=
@navimatix.de> wrote:
> >>> On 26.10.23 17:25, Bruce Ashfield wrote:
> >
> >>>> I ran into issues with some kernel versions, but we may have moved o=
n
> >>>> far enough that it is no longer an issue.
> >>>
> >>> Do you remember what kind of issues these were? Possibly I can check =
if
> >>> they still exist.
> >>
> >> It was kernels older than 5.10 failing to take the r-path changes and
> >> hence failing when doing the signing step.
> >
> > This could be solved by setting LD_LIBRARY_PATH. Would this be okay?
> >
> > ```
> > diff --git i/meta/classes/module.bbclass w/meta/classes/module.bbclass
> > index a09ec3ed1e..38e1c95216 100644
> > --- i/meta/classes/module.bbclass
> > +++ w/meta/classes/module.bbclass
> > @@ -51,6 +51,7 @@ module_do_install() {
> >                    INSTALL_FW_PATH=3D"${D}${nonarch_base_libdir}/firmwa=
re" \
> >                    CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
> >                    O=3D${STAGING_KERNEL_BUILDDIR} \
> > +                  LD_LIBRARY_PATH=3D"/build/tmp/sysroots-components/x8=
6_64/openssl-native/usr/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" \
> >                    ${MODULES_INSTALL_TARGET}
> >
> >         if [ ! -e "${B}/${MODULES_MODULE_SYMVERS_LOCATION}/Module.symve=
rs" ] ; then
> > ```
>
> Hi Bruce,
>
> I would like to here your opinion to this issue, because you've provided
> the most to the discussion. I would like to submit a patch to fix
> problem; either the BUILD_LDFLAGS one or the LD_LIBRARY_PATH.
>

Thanks for the ping! gmail annoyingly doesn't show me anything
different when I'm
actually on the to: of an email .. I need to enhance my filters to at
least star the
email, so I'll notice them faster.

But I digress.

The proposal is going in the right direction.

The problem is that we really don't want any references into the
recipe sysroots,
whether they survive rm_work or not. Since we are installing the output of =
the
mods to the shared location, that is where all their references and require=
ments
are supposed to be contained.

The idea with something using library paths, etc, was that we should arrang=
e
for the dependencies to also be installed into the STAGING_KERNEL_BUILDDIR
structure and adjust the make_mod_scripts appropriately to find them there
(either at build or dynamically at runtime).

There's also an existing libelf (and zlib) dependency that popped out when =
I
was working through the static linking issues. But that is because I
had to statically
link everything built by the scripts, not just the sign-tool (and so
far, those other
utilities have escaped causing us problems, but are probably just waiting t=
o
appear :).

If we were to adjust the LD_LIBRARY_PATH, the values should be programmatic=
ally
pulled out via pkg-config versus something quite as explicit as in your wor=
k in
progress patch (alternatively IIRC there are utilities that adjust rpath an=
d
dynamic linking in use in other parts of the build, we could possibly lever=
age
them).

Bruce

> Kind regards
>
> J=C3=B6rg Sommer
> --
> Navimatix GmbH
> Tatzendpromenade 2
> D-07745 Jena
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

