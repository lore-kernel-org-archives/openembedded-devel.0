Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75944C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 23:17:19 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.20749.1743290237032665052
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Mar 2025 16:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HUDB/d3T;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72bb9725de1so917988a34.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 16:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743290236; x=1743895036; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvF0anpeFTPjenPyjARBWh8eUJdeDZTUqIhgQeyAGeo=;
        b=HUDB/d3THDaihxvHkch6/v1qYJpAOi3Mk0IAkAJUspHqx3w+DF3f4hLN+N+vQRou0v
         lJ+4k6jljFKAIZWkeOdAsSe2UvOGObPdjMgGpZZvh8Jiazj2koYhIEyNIthuJZncVoNy
         VyqZjVJMTBCe8LNxpiwLl53lAtBQ0k3HazWPJfl4qIMwPRhPia42eda5aHF2+PL/8PwE
         LyzwLkaMT9beNbWTe+RDyrZkgOuJPbeIzfFbnXViNf0ROB58KKxleVyEHoqQpGR5qKJo
         TCx5BUDtTlqdMAQVe4L2LRSPxlwzG/ovrdY5zCRoMvDS6Gyy5n2gpwGOO3ALr/CtfUvf
         BZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743290236; x=1743895036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvF0anpeFTPjenPyjARBWh8eUJdeDZTUqIhgQeyAGeo=;
        b=WI+TP64TdNLHT/1AS4hokhL7XC9QXQoWmHr/Cq0mRARO2Z1NEXoc7lOfSG7QVhsDUL
         Ymcs9gCI2jtR9sOror8rCRYYgaJA8bWjWuEWkLzk1mGkT0v/eKcWlLU1B9ziWE0KWeU+
         5U5FgmpsF26ln3EKEEs2dk6lb7Hjak2/zuLejOjFLhaRA4xyIJkkC4/wVpPfncLWQUux
         wnMT9HOPx9+EvwvdiGtCETjYBnQ3zl4kRcr0a8DfZJ8My6DZd0WaZ1LNMMHtXjegSgqh
         QA4LymzkhVmcqFoHAGyaiTGeM4XAA5RIwgsWX6LDgNUZgVXubJ6cWf3fcU7AU1CX7VyU
         ArjA==
X-Forwarded-Encrypted: i=1; AJvYcCXDkFhHYyr4vH6vqZ8l0m/RCxDYQNKehhxNnzDyu2wWMEM6PXoXDLLOOws2QtRPiBBvqWhTyCopAe0wTYTXMHNLD/E=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwV/KUrGq1oDNRMlj8qFr7HrfsrVIH4QQFIedWjCSclEw1iHxBn
	atR6tHNvHabrohBJ0/WdgmS74m9Z3feE1wBXftxtWA+7jQ/m/jCHkuk95YwhdaF4HWCNAfkScB0
	0oUKaT+IPLjk05EPNC8lFcK5ZKuE=
X-Gm-Gg: ASbGncsvUo1J3TWyVgiDF1Kbteds/h/F8DnXe6AgDkZjjAU/2nU0Lb6mqo6Mx6DEgvU
	y7mNmZ1oQ3MaP0Hz06rbdYLCgVXfead3pON/UFkZDtRYwuwIQhwQptYeKgOBh9nQu4a/QEpNQPg
	Z/aQszRn1TDOs6czSltB8KAIAM
X-Google-Smtp-Source: AGHT+IHY/pn+HMpDB9iFT1sqPOxI8Wg9NcYY94IFHIO95uZ2yIc7JDEa0kQgVlvM+269MaMs2v3XtkFHeyp/XoxXAmI=
X-Received: by 2002:a05:6830:4903:b0:72b:9de0:891 with SMTP id
 46e09a7af769-72c637c49d1mr2967432a34.13.1743290236229; Sat, 29 Mar 2025
 16:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <952235ba-b7ee-4ba7-831f-3a679c900cf3@gmail.com>
 <CAMKF1spz4vz10bCmMjfdXmVexFahFCC_2yhrR+O5-FRv8pAHdQ@mail.gmail.com> <CAMSfU+7vHy-t3cFUPMw__SWEacku0uOkmF0JGb0CvLifJVNoDQ@mail.gmail.com>
In-Reply-To: <CAMSfU+7vHy-t3cFUPMw__SWEacku0uOkmF0JGb0CvLifJVNoDQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Mar 2025 16:16:50 -0700
X-Gm-Features: AQ5f1JpD2L8PEWAKbwGTjgfnvVX0GK3SNTnhCFIq0v1ASPnOlSSpPvlkAtNI9Oo
Message-ID: <CAMKF1srnnwP4_3M04MNZddus3UwG+vadbDf+c--XAtNb1ZLzrg@mail.gmail.com>
Subject: Re: [oe] scarthgap merge request: March 23rd
To: Yoann Congal <yoann.congal@smile.fr>
Cc: akuster808 <akuster808@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Sofiane HAMAM <sofiane.hamam@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 23:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116373

merged now thanks.

On Thu, Mar 27, 2025 at 3:57=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> Hello Armin,
>
> I feel like you lost those 2 patches for wolfssl on scarthgap:
> [meta-networking][scarthgap][PATCH 1/2] Wolfssl: add ptest
> https://lists.openembedded.org/g/openembedded-devel/message/115831
> [meta-networking][scarthgap][PATCH 2/2] wolfssl: Upgrade 5.7.0 -&gt; 5.7.=
2
> https://lists.openembedded.org/g/openembedded-devel/message/115832
>
> Alternatively, we could backport
> https://git.openembedded.org/meta-openembedded/commit/?id=3De23eaf27d8396=
3e8d82411d96f6817fc970fd89f
> only (just the upgrade)
>
> That would fix the CVE-2024-5991 from
> https://valkyrie.yocto.io/pub/non-release/patchmetrics-meta-oe/
>
> Thanks!
>
> Le dim. 23 mars 2025 =C3=A0 20:14, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
> >
> > merged thanks Armin
> >
> > On Sun, Mar 23, 2025 at 12:06=E2=80=AFPM akuster808 <akuster808@gmail.c=
om> wrote:
> > >
> > > The following changes since commit 6c9f1f8d4538119803bf793747b65e4d23=
c33544:
> > >
> > >    nginx: fix CVE-2025-23419 (2025-03-03 08:09:03 -0500)
> > >
> > > are available in the Git repository at:
> > >
> > >    https://git.openembedded.org/meta-openembedded scarthgap-next
> > >
> > > for you to fetch changes up to edd1a1e284fdcb80cd48d411f235d47f23bc27=
ae:
> > >
> > >    mongodb: fix build with python 3.12 (2025-03-07 19:40:51 -0500)
> > >
> > > ----------------------------------------------------------------
> > > Awais Belal (1):
> > >        mongodb: fix build with python 3.12
> > >
> > > Peter Marko (1):
> > >        libmodbus: patch CVE-2024-10918
> > >
> > > Virendra Thakur (1):
> > >        unbound: Fix CVE-2024-8508
> > >
> > >   .../recipes-support/unbound/unbound/CVE-2024-8508.patch         | 2=
47
> > > ++++++++++++++++++++++++++++
> > >   meta-networking/recipes-support/unbound/unbound_1.19.3.bb       | 4=
 +-
> > >   .../0001-moduleconfig.py-python-3.12-compatibility.patch        | 5=
7
> > > +++++++
> > >   .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 3=
 +-
> > >   .../libmodbus/libmodbus/CVE-2024-10918-01.patch                 | 1=
77
> > > ++++++++++++++++++++
> > >   .../libmodbus/libmodbus/CVE-2024-10918-02.patch                 | 1=
21
> > > ++++++++++++++
> > >   .../libmodbus/libmodbus/CVE-2024-10918-03.patch                 | 8=
4
> > > ++++++++++
> > >   .../libmodbus/libmodbus/CVE-2024-10918-04.patch                 | 2=
39
> > > +++++++++++++++++++++++++++
> > >   meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb          | 8=
 +-
> > >   9 files changed, 936 insertions(+), 4 deletions(-)
> > >   create mode 100644
> > > meta-networking/recipes-support/unbound/unbound/CVE-2024-8508.patch
> > >   create mode 100644
> > > meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-m=
oduleconfig.py-python-3.12-compatibility.patch
> > >   create mode 100644
> > > meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-01.patch
> > >   create mode 100644
> > > meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-02.patch
> > >   create mode 100644
> > > meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-03.patch
> > >   create mode 100644
> > > meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-04.patc
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#116204): https://lists.openembedded.org/g/openembed=
ded-devel/message/116204
> > Mute This Topic: https://lists.openembedded.org/mt/111864517/4316185
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[yoann.congal@smile.fr]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Yoann Congal
> Smile ECS

