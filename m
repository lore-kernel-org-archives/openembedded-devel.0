Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0460FC7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 15:50:32 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.3208.1750348222329159660
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 08:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U4Ed7szN;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e5e6ab7b8so9544467b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 08:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750348221; x=1750953021; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Nprf/i4GGHezDqvyr8i1EBJN3C+WqWUPRYQkBhoavk=;
        b=U4Ed7szNg3hHV64kJgAtnhPRugX5w+a5m5ebUURzygrUtQ61XoqqR8JvSWlBgfz3JI
         9juoZU9JSfhE51A9zlzSNFUwN3qRA95mbPUeohtVmM/N7+Ml/bkLMbbC6Ot7kNEkUu3V
         bPijVaXXJH0eglAdH4zEW2iXAhTVRsWqU7Pbod9TC+cPVfvW0OqcIgsgDirIyb99TuKO
         z6Et7dLOYyNM2XtJQZGqPxraC68U56yeP29UUFydvEYOla+FiK7uUE+xd2zAy2LnjyJT
         8s5Qod+xDy0hBg1fVgasWQ5OrEm3bddyxaYUjExSZe5VKAIE55VJiKHlTAKs0ckIJKhF
         K/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750348221; x=1750953021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Nprf/i4GGHezDqvyr8i1EBJN3C+WqWUPRYQkBhoavk=;
        b=wLOe5vFoXr3znwUQChd9jbwFzihZOPMS/cfrn1fyKK2B9EZmMn1Gqm8FrtuY6l5fip
         gqEQjr4/n0gWtagWkGUDHhnmqiaZNni6Fk2V6ghLbDVwcSXKtB11mzKhO7+NbZG+Nomr
         ShlBpxKnDkbFtiDxhrHB1ffpM1FpMhZx7zIefa5f4Xb8Xg0uhBEpM8BlMJRpJzDrtN7w
         986a1HcBlAUwO3sIjQWPNfRie9NF+5GdNUcJqxDgfW8F0bYYTvEjF9oNnjpVfvrJkQzN
         yexFEvht+LFHAyx3dYKXyLOCfCRYhDIgnbYxvbMOq+ektGC6Hf+fgE+YDySFk5b862o7
         Uzjg==
X-Forwarded-Encrypted: i=1; AJvYcCU2zccqK1LEY7c4TD9Tjo3dMW/iEu5Hiz/94/gJaINSZCOixr1QsD8GDiG5fzY/7wtBbWkX9/LcGHefZQepIxoJn98=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzPyqfAT05r1HDXtOKRYovPIneq6Qql5m/fPvSna5/NOMEV4vXU
	P0oAFErwpBu/OGf0PgjJFOgDeOrrcCKbDdjkJgjZwC9fToqDuomIBxJdkt7TmEvaMiqlfltWWr6
	ClT+U6wc1S93OKZg9Y+KfEWQQEbeEQIw=
X-Gm-Gg: ASbGncsCU6sXDxpejBntgmGkOgpmxdZ86XJHZLPijWkFWKFF7BByhyi3WxVtNdHQ9bM
	k1Ay3+Ojqevj2+VY/w5YeU+O3/r5HhregFBq9dTlcd4HPESqeFN0jaDOE4qiZPt5V3zcjZ9/pRo
	l/nc0KH4TXLj0UKiu6ETRCfUHt4oas1jvE3fzurpM8ltFP4lO+K5yD
X-Google-Smtp-Source: AGHT+IFUAvut9GtWF67EmRjhIsvhU10hae+nax8EOo6uSrnWDfKz/ejcD5cAheCfHIVJrnSlE13Zd8yr1LIqkMgSfVc=
X-Received: by 2002:a05:690c:fca:b0:6fe:d759:b187 with SMTP id
 00721157ae682-7117542b3bfmr306174277b3.24.1750348221369; Thu, 19 Jun 2025
 08:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250321084632.1889809-1-omri.sarig13@gmail.com>
 <CAMKF1sqhQ=SuV2Je2T3NsZV-YZjGtmr3eAqKWC8=ttXUxfQieQ@mail.gmail.com>
 <e198791b-f3fc-4865-b038-1e4b8c874db0@gmail.com> <eb4d021dd4d3594a2d12decceb6b743071e5ff42.camel@prevas.dk>
In-Reply-To: <eb4d021dd4d3594a2d12decceb6b743071e5ff42.camel@prevas.dk>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jun 2025 08:49:54 -0700
X-Gm-Features: AX0GCFuJRjAYyEXWZLTLFRph6zEAWgElR0RiqaYzdFGOTSa55hQI5B1xjr9I8bk
Message-ID: <CAMKF1sq+Vq_8+zLTJkUY-HUstDjE=eruOm5q540xvgaPWvoNLw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v3] python3-varlink: Add recipe
To: Claus Stovgaard <claus.stovgaard@prevas.dk>
Cc: "omri.sarig13@gmail.com" <omri.sarig13@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"Marko, Peter" <Peter.Marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 15:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117951

On Tue, Jun 17, 2025 at 2:25=E2=80=AFAM Claus Stovgaard
<claus.stovgaard@prevas.dk> wrote:
>
> On Fri, 2025-03-21 at 10:52 +0100, Omri Sarig via
> lists.openembedded.org wrote:
> >
> > On 3/21/25 10:40, Khem Raj wrote:
> > > On Fri, Mar 21, 2025 at 1:47=E2=80=AFAM Omri Sarig via
> > > lists.openembedded.org
> > > <omri.sarig13=3Dgmail.com@lists.openembedded.org> wrote:
> > > > Add a python recipe to install the python implementation for the
> > > > varlink
> > > > interface.
> > > >
> > > >
> > > > Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
> > > > ---
>
> > > > +RDEPENDS:${PN} +=3D " \
> > > > +    python3-core \
> > > > +    python3-datetime \
> > > > +    python3-io \
> > > > +    python3-json \
> > > > +    python3-netclient \
> > > > +    python3-netserver \
> > > > +    python3-shell \
> > > > +    python3-stringold \
> > > > +    python3-unittest \
> > > > +"
> > > I think some of the rdeps here are only needed to run ptests, they
> > > should be moved to RDEPENDS:${PN}-ptest rdeps
> >
> > Thanks for the fast reply.
> >
> > The problem is that the python-varlink repository installs the test
> > files as part of the package (so it'll be available in
> > `/usr/lib/python3.12/site-packages/varlink/tests/` on the target),
> > and
> > these files also contains the example code for the repository.
> >
> > I've discussed exactly that issue with @peter marko on the second
> > version of the patch here:
> > https://lists.openembedded.org/g/openembedded-devel/message/116172
> >
> > If you still think that we should split that, and have some solution
> > for
> > the installed tests directory (either leave it there, without
> > allowing
> > the user to run-it, or manually remove them from the installation), I
> > can do that. Please let me know.
> >
> > >
> > >
> > > > +
> > > > +PTEST_PYTEST_DIR =3D "varlink/tests"
> > > >
>
> Hi Khem
>
> I am working on a project where I also need the python3-varlink
> package, so was wondering what the state was regarding being part of
> meta-openembedded.

It will be good to address the ptest packaging issue.

>
> A small notice. Omri has moved from working for Prevas to Oticon, so I
> will try to follow up on his behave.
>

OK. good to know.

> Have a nice day.
>
> Regards
> Claus

