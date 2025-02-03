Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34230C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 09:29:58 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.84095.1738574988523931567
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 01:29:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJ3xf5ua;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54021daa6cbso4428957e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 01:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738574987; x=1739179787; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFcboqssn2Fa4gGaD+W3EsrvRp2GBan2WJwRfzVyf+k=;
        b=KJ3xf5uaW98jlMHqVuAdfJXa72gtIN1NssbgmhpDo7ajLUBBLOgECsZTObRL+2B+sZ
         FCnVGsfg308WPHHEcm4qUH46pnkPU0YcEOJg6RvpzV8t9UxRC31SMjeqyTqwpBxHtxHj
         G2n2rvQQoRQkU0pcqk0Zy3qNOj4qbTQhzLxGUeGC8NMub7DA/j/K4ABc3IaSbQ13sfl8
         JbQEIBwfI44aNIDMkuR2WtfBF6m5Jbn1X/sIuendnOthkHSpQ/E3gbxmJfaKjd07Nlrt
         wMoHty9YPObQhfMiZByKhjp0xQXLkv79UQO7/Tr3fAEiLh91CWhFTTU0N7+cblFEQiqs
         ZPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738574987; x=1739179787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFcboqssn2Fa4gGaD+W3EsrvRp2GBan2WJwRfzVyf+k=;
        b=q699WHIHZZNGUkrsPADH6Pg3Ab8GDB47lNePadXPQLyi8ITROBwJWubyGiGyUOqe7N
         bXGO1Vr8FSX8OatpBep1fOVCsijV4BRJgvqU2GTP3UD1wevprHcixNyWsai+AMCz9/cM
         WnI4jrjp1hjfVZRocdVgVSkt3pjUT2xf4Bsxy42GsNwgRTghcNfG2cLWxqbHYdkp/NmM
         bfuAtS/FHyW+HBPoCVz5NpZ02au6FBEOCg0gcFHAAK0f0mOqfefYuhh/TmSZW7Q8LMJY
         Cxj+kHHNpjFI2qORybVKhypdZcfbq0sFfVRHrOZCkj+k79CcjOc6slXge5ilpDIjy3o0
         1LYQ==
X-Gm-Message-State: AOJu0YyFNWA9UDXKOUes9ywWTG6+poQaNSRvRVInxL8zril30wMZkT88
	bVGIuKvAQH4sQACNcQD12p/XhaYWP2Kd3UxX85w59EfJhVPX86hKuK7J+VE0PJd2e0W92MSXJu+
	RYmTTNdUhN4jl9z+TMNoPTwrrfh4=
X-Gm-Gg: ASbGnct3SHl+XonRcXRpVz4ObsZrDiDD5Bt8kkvCIeTe+/XXrEaSbzMID50GtWyS3E/
	PAeJKDuFv0JG1XqOrRAhVf4ZLLr8fT1xAkleu17ARMdAv86E5VhQkvUlOk5v5TD3U69fPrGq0
X-Google-Smtp-Source: AGHT+IHCpL7HMKNkNo5LWJtvd9E/UHZ1fMrjgbaKymTMFXK3R/PvOinIXHqbyPblbLUp1aoiPIHYU9jEJCU93bl3Kqc=
X-Received: by 2002:a05:6512:2344:b0:540:2022:e3c8 with SMTP id
 2adb3069b0e04-543e4c31263mr6829134e87.41.1738574986329; Mon, 03 Feb 2025
 01:29:46 -0800 (PST)
MIME-Version: 1.0
References: <20250201170240.2880-1-alex.kiernan@gmail.com> <CAMKF1sqj9fCQr8rwXHDi0CSp-+tqGW+6GWPzuRu_hmgBsqVwOg@mail.gmail.com>
In-Reply-To: <CAMKF1sqj9fCQr8rwXHDi0CSp-+tqGW+6GWPzuRu_hmgBsqVwOg@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 3 Feb 2025 09:29:35 +0000
X-Gm-Features: AWEUYZmveD9nGEyxQbQXLpb9dqHgfMhVyYKtYbH0y7Q9EiylqDYbeYn25CtINps
Message-ID: <CAO5Uq5Q_iEqEOQ5PT3pU=Xmr2_RXVOkBOvZSKWujSmiD2O=Ryw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/3] mdns: Upgrade 2559.40.32 -> 2559.60.39.0.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 09:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115237

Yeah, it will - I'm not seeing it here. I spent some time thinking
about this exact problem, which isn't to say I've not got something
else wrong. In fact I think I've missed the last patch I have for
OE-Core, but that just makes the selection of Avahi/mDNSResponder by
packagegroup-base-zeroconf a configuration item and I don't think
should change this.

On Mon, Feb 3, 2025 at 7:05=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> I am seeing
>
> NOTE: Multiple providers are available for runtime libnss-mdns
> (libnss-mdns, mdns)
> Consider defining a PREFERRED_RPROVIDER entry to match libnss-mdns
>
> Does this need to apply along with relevant patches you sent to oe-core m=
l ?
>
> On Sat, Feb 1, 2025 at 9:03=E2=80=AFAM Alex Kiernan via lists.openembedde=
d.org
> <alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >  .../mdns/{mdns_2559.40.32.bb =3D> mdns_2559.60.39.0.1.bb}         | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-networking/recipes-protocols/mdns/{mdns_2559.40.32.bb =3D>=
 mdns_2559.60.39.0.1.bb} (99%)
> >
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns_2559.40.32.bb =
b/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
> > similarity index 99%
> > rename from meta-networking/recipes-protocols/mdns/mdns_2559.40.32.bb
> > rename to meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
> > index 9cc6708d18c5..6fea434de81a 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns_2559.40.32.bb
> > +++ b/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
> > @@ -28,7 +28,7 @@ SRC_URI =3D "git://github.com/apple-oss-distributions=
/mDNSResponder;protocol=3Dhttps
> >             file://0004-Add-definition-for-MAX.patch \
> >             "
> >  BRANCH =3D "rel/mDNSResponder-2559"
> > -SRCREV =3D "0b8a5dbcefd6cc72846385aebfe4f6111f2814cb"
> > +SRCREV =3D "e8a63bd04dda3f83a80f1dbc6db03e7806d87c11"
> >
> >  # We install a stub Makefile in the top directory so that the various =
checks
> >  # in base.bbclass pass their tests for a Makefile, this ensures (that =
amongst
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#115213): https://lists.openembedded.org/g/openembed=
ded-devel/message/115213
> > Mute This Topic: https://lists.openembedded.org/mt/110937760/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Alex Kiernan

