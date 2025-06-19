Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF52EC7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 15:34:21 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.2742.1750347261437029988
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 08:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jPnoAuGD;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e733a6ff491so904844276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750347260; x=1750952060; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8idllhZwAGyKrbI0Gmesf7v5mS7Bjy7X3W4vmTjd4A=;
        b=jPnoAuGDEEzFZX8Hk6R05ZXhBss2t08FZzclOnXc7f7bTEzNTyMvUNCWPbtJTYzsZf
         Bd/G8aDlG0aM+hsn7xdvXQVmGZIBac6Y0y/iOXqhdYiS14kE0Fql8+69XOquo/KWZhqk
         mg2HsLNvaJ+XtxhKNQH27lDb5A3OJDrccw1QtQqdm9gEtH9NslsS1l6t7gyHPKeQY81W
         nDtOC8dQ3IH45P+DQCOoE35mMC1M3iwaBQwNxaPr52aWSda+glfEnnD0rJgC86P2z2v7
         SpB1b++8NXUSNXGAOWOHBb0EQtflVkQb2RywA5Fak37juNw9K0vpbfi/XyKBtnsr+iV5
         BXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750347260; x=1750952060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8idllhZwAGyKrbI0Gmesf7v5mS7Bjy7X3W4vmTjd4A=;
        b=pAfAz4uT2QM56b/1+Ms9olLi6UBvxldwKKgkG28L2cB5BhDKVQAqY45C6SsadoCnps
         +ikozd9cRR2wN7BR5z4wgjqDyYUoBAT/W4uL7qRFKPuUO+LDNvt/yBoNhHc096xt3FCQ
         vu/b0sDCxRQnVwgpHE3zkkALZ2fG/rfRJc7i+XJhH1QZ10yPJmvsL+q3oPXmfOHlCwmY
         5QIasGGT03EQ9u/K/0twe1pJdjr/09hhscP3oPZAzbEmR/WToIHbkJl3wx0cdDlrODW/
         D5em0Ol0qZJ25UxC0GNLQbAlOFqIGVXAg6knktK9js84n58sjh3vLRT0GITsb3bXdEK+
         s1gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUYLllG3qDveClbTraNnIrOREhXN41ZW+A9kUtVHTQ15eFJlgyE7mpX4SSedmolWn4VEQ/3VTqSdq5G9VtJ1ZI4eI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxWReHEBmb7MdHbOc9ubTrkWOvc4S+QDQXkKwq1n44ODJ58fMbG
	709JzmRp9/B1ZxfkfJMFfw1Dp1n4TPxNuhe3eQGPIIzKXHLOvYxpOqQaNl7zhocGXhB8rRz0j9p
	cBFk2f71Ae4BVRpC3hqkzVhMVOHoIXSo=
X-Gm-Gg: ASbGncsgksnK0AMRYztJMUJb5/IKzjaZmfRnfRs5K8uIeQu7u+s6Rq8yWjMxK931PqM
	MMw2qeEKVTcIvtRsUolInzbDgQcRSYjPOo8rvaVM7MtYqmIfdKleQu0WTxsABc93SmqcGgpWwTD
	f0pUjGU14jxLSGNEscNoSBNNVaNtACNpULrDIfExxSzA==
X-Google-Smtp-Source: AGHT+IFjM8DLKC6n0REYcf5KeefVFqTPD9oCw8nQlmJaVCCm0ttZmYUAMfp/BAwfwfR7YeOCA7iu/OUlQrGYXiUEDAE=
X-Received: by 2002:a05:690c:6483:b0:70e:73ae:766d with SMTP id
 00721157ae682-71175463154mr328930807b3.3.1750347260282; Thu, 19 Jun 2025
 08:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
 <20250531113252.3889951-2-johannes.schneider@leica-geosystems.com>
 <acd9f5dac0d1fd5b700d1a0a5b634ba509b2d3b0.camel@pengutronix.de>
 <AM8PR06MB752161D5026A4CE68CC049DDBC70A@AM8PR06MB7521.eurprd06.prod.outlook.com>
 <8feb1a1dba066088852d16824daba9fb4fd29568.camel@pengutronix.de> <feb8d668f6bd9e29ec89d1abe0063fd2281fa4e2.camel@pengutronix.de>
In-Reply-To: <feb8d668f6bd9e29ec89d1abe0063fd2281fa4e2.camel@pengutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jun 2025 08:33:54 -0700
X-Gm-Features: AX0GCFsXtGh41Hk6RSjahg4XbE08iM6NzMnMRXcyZ1cCj1iiwa6LpNkEqyh-aPg
Message-ID: <CAMKF1soiQqTXepj3W8h3296fhb8+JuAUfVS6_j-YgzwQfpVSmg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/6] signing.bbclass: refactor signing_import_cert_from_*
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	johannes.schneider@leica-geosystems.com, 
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 15:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117949

On Thu, Jun 19, 2025 at 5:44=E2=80=AFAM Enrico J=C3=B6rns <ejo@pengutronix.=
de> wrote:
>
> Am Dienstag, dem 17.06.2025 um 16:45 +0200 schrieb Jan L=C3=BCbbe:
> > Hi Johannes,
> >
> > On Mon, 2025-06-16 at 05:54 +0000, Johannes Schneider via lists.openemb=
edded.org wrote:
> > > > > -# signing_import_cert_from_pem <role> <pem>
> > > > > +# signing_import_cert_from_pem <cert_name> <pem>
> > > > >  #
> > > > > -# Import a certificate from PEM file to a role. To be used
> > > > > -# with SoftHSM.
> > > > > +# Import a certificate from PEM file to a cert_name.
> > > > > +# Where the <cert_name> can either be a previously setup
> > > > > +# signing_import_define_role linking the certificate to a signin=
g key,
> > > > > +# or a new identifier when dealing with a standalone certificate=
.
> > > > > +#
> > > > > +# To be used with SoftHSM.
> > > > >  signing_import_cert_from_pem() {
> > > > > -    local role=3D"${1}"
> > > > > +    local cert_name=3D"${1}"
> > > > >      local pem=3D"${2}"
> > > > >
> > > > > +    # check wether the cert_name/role needs to be defined first,
> > > > > +    # or do so otherwise
> > > > > +    local uri=3D$(siging_get_uri $cert_name)
> > > > > +    if [ -z "$uri" ]; then
> > > > > +        signing_import_define_role "$cert_name"
> > > > > +    fi
> > > > > +
> > > > >      openssl x509 \
> > > > >          -in "${pem}" -inform pem -outform der |
> > > > > -    signing_pkcs11_tool --type cert --write-object /proc/self/fd=
/0 --label "${role}"
> > > > > +    signing_pkcs11_tool --type cert --write-object /proc/self/fd=
/0 --label "${cert_name}"
> > > >
> > > > In the meantime, we found that we can also load PEMs with recent pk=
cs11-tool, so
> > > > Enrico will send a patch to simplify this.
> > > >
> > >
> > > is there already a subject to search for? or a link?
> >
> > I don't think Enrico has sent it yet. CCed.
>
> Haven't sent it yet since I assumed it'll conflict with this series that =
made it to the list a day
> before mine =F0=9F=98=89 Will send a version now if a v3 is required anyw=
ay.
> So you can decide in which order to it makes more sense to merge it.

I will pick v3.

>
> Regards, Enrico
>
> > > since this whole feature is motivated by the HSM limitation of one-ce=
rt-per-slot
> > > (der), which could be sidestepped if multiple certificates in one pem=
 file could
> > > be handled... should we wait for the "patch to simplify this" and the=
n drop this
> > > series?
> >
> > HSMs can still only store certificate individually (one per label), as =
this is
> > just how PKCS#11 works. Enrico's patch only lets us avoid the call to O=
penSSL
> > for PEM-to-DER conversion.
> >
> > So this series is still needed. :)
> >
> > > >
> > > > Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
> > > >
> > >
> > > saw you placed a 'Reviewed-by' on the other patches too; should i alr=
eady send
> > > out a v3 that pick up your suggested comment- and documentation chang=
es, or wait
> > > (for whom/what)?
> >
> > You can pick up my Reviewed-bys for any unchanged patch when you send a=
 v3.
> >
> > I'd say go ahead a send a v3, as I wouldn't expect new comments on the =
v2 by
> > now.
> >
> > > sidequestions: what tooling do you usually use to juggle patches?
> > > and how should the Reviewed-by tags be handled?
> >
> > As Alex, I'd also suggest b4.
> >
> > Regards,
> > Jan
> >
> > > gru=C3=9F
> > > Johannes
> > >
> > > > >  }
> > > > >
> > > > >  # signing_import_pubkey_from_der <role> <der>
> > > > >
> > > > >
> > > >
> > > > --
> > > > Pengutronix e.K.                           |                       =
      |
> > > > Steuerwalder Str. 21                       | http://www.pengutronix=
.de/  |
> > > > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917=
-0    |
> > > > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917=
-5555 |
> > > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#117913): https://lists.openembedded.org/g/openemb=
edded-devel/message/117913
> > > Mute This Topic: https://lists.openembedded.org/mt/113394167/2167243
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [jlu@pengutronix.de]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
>
> --
> Pengutronix e.K.                           | Enrico J=C3=B6rns           =
     |
> Embedded Linux Consulting & Support        | https://www.pengutronix.de/ =
|
> Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  =
|
> 31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    =
|

