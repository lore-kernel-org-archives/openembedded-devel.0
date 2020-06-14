Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.22712.1592110790935824734
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2020 21:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TeJzJTtg;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id c185so12813879qke.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2020 21:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WGTwD9aPps2sUV4ULyynKKN8QOOgcJOkB+xM0Y0Rph0=;
        b=TeJzJTtghRdK4Jzp73rbEdQeJzHgaZRWGtxFawwIEcAHszYHIdo18aFNTa0SDL8bK9
         1XDDbyaZVA60MOQLxHuYLlYs1Y3srslKVyisk3j6iKzhDWstBbhbMhHt7H3ZTnSYCUxL
         5B03dXkK10mUs39SYPcEQea4jKNuixq/DKZSgiYipd6Pv7oIqWkN5w0MFvfmJIZWj6XL
         nodPXXmnSQmp/fGAZxVpfxYCJucmtPVLc+s4MSDc8UTmqT1ZCWI+htm2ea+BPN2GFJvA
         4XMVOFoh/wty/olq3xFz5mdqEF5++vOzi9hcSJb/pvRoROcNNtWsQPbrCfjhiybL5VUO
         +VLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WGTwD9aPps2sUV4ULyynKKN8QOOgcJOkB+xM0Y0Rph0=;
        b=KjxiZAuGDNqfovnOIIRM9ip9PMKFHtaOB6cP5wIxbT7CqAj3YjSdxv6MERvehW2aT4
         QK1Kay3ng8YHIWRjLxIF1VKkSlIuZRr1WbzTmfXV8ZB2+dCKWz3g3f9CBoJ72eqf6gpE
         FRhL6dwVaxqg5wCABO7fnvN7NMhHWwwt8KlM9roOtmwsFKXG4Le1/TDMptj66+iRdWLK
         EJE39KBBMBNbd1Rt3fVvitvrocG3bSqA5h/7CGihlkSxi0KztAxbbkz8iHAuAdsi16p1
         j3c7OXQ/+R+TAFuWWX7Mgp1PssxiqrivyWuG+pAeppa90r0C2pMfz3pHECeTj7rKrhGl
         RAdg==
X-Gm-Message-State: AOAM530R6k+RjZ0dr3k6EniaNJbvhHNV01h2B5vU9ORUA+J8TZByyAYm
	Mod6WYbw4ruUtNoL+IMIw8kpmkRnv8nq5ztdHMA=
X-Google-Smtp-Source: ABdhPJwgUpMy4B0Z+vU1JcNvPjl4ILG+WQq71EDtnoIwKYoPi0uZCijWgPg/QzNqsDNa/yK1pEyOyHyVuZjBddsKik0=
X-Received: by 2002:a37:4696:: with SMTP id t144mr9837160qka.431.1592110790046;
 Sat, 13 Jun 2020 21:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200613183729.22777-1-liu.ming50@gmail.com> <CALbNGRSQfyu15mNfv54QWWyBZ6Qih3MzbBq1-GKUfJmKR0dnNg@mail.gmail.com>
In-Reply-To: <CALbNGRSQfyu15mNfv54QWWyBZ6Qih3MzbBq1-GKUfJmKR0dnNg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 13 Jun 2020 21:59:22 -0700
Message-ID: <CAMKF1sqPmf-qCjTGb9iBwRqZevzAFB8Npdu-saJHAKv25t7hDw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] packagegroup-basic: drop recipe
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>, Ming Liu <ming.liu@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2020 at 2:17 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Sat, Jun 13, 2020 at 8:35 PM Ming Liu <liu.ming50@gmail.com> wrote:
> >
> > From: Ming Liu <ming.liu@toradex.com>
> >
> > It's duplicated to packagegroup-base in OE, let's drop it.
> Same packagegroup-base us a huge molloch and far from just the same as
> packagegroup-basic. Please keep it.
>
OK

> Andreas
>=20
