Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398F5C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 21:24:44 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.59448.1744061082811167992
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 14:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tn/7Gesv;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72c7336ed99so1476920a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 14:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744061082; x=1744665882; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McWLQ6Iqat2ejdwnrGoaf5jO2UmD1JUjtjEQC2GmOj0=;
        b=Tn/7GesvvzDdnqbsBuW7pNa9BYettb/D5kaxN8YIFAyXpOYDeJLLKzD++obphqcTt+
         40D1U9dcB4HXDc5p66b0XJVswFvaAaa873/YX+6evWQ99+Xm5S9Ltw4339weqDtwUTNG
         5Xt/23vVqxRrUf7j6HwlBbo8B10V4p4XeE1HHsRmyxsoNMzQoJc/BXcEktYcNa78Cl2F
         PPw4/G2HImPUqHVWvn4ucg4RsLWcDXlFUgDQIwfJmXFgUO/s62nvZWoctzmDhDtwVxfU
         sA+dbcD54bB2SIDVDrvpxKYZK9FByk21xwjEXysxaYCe6IDaSray2+Y1lTDM2RTUZ6Nx
         kscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744061082; x=1744665882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McWLQ6Iqat2ejdwnrGoaf5jO2UmD1JUjtjEQC2GmOj0=;
        b=UcIQwor9sG766XGp6cawdRFJ+rzINVsj2+QDH9AfeXgpy0YFs8GuALU44GzgJUeZuI
         viO4OuB+cqnVJLmQP6YThCXu4yVhh1Ntn7VsXInyIQICMAbVt/Do/qfoJTT5g6PCyGQQ
         XX/jGXUJIuJmCAy++Wh75kNRR83L090XZmOnWPMcTqy9CcVr+A3M04ihSkvcl5si1XgN
         koYAKJ+bDYIqypemEvbSOdBsNjjPIBP/729ZuT2MVj+mWX2rz2FqEJDtgqqtyaCQg7qk
         Fugt7fKivVsb0YVnu8dEKyDLuSyVHZik0C/VzfR1bzUdrjMWjhDh2NeU2ofmwz8xZKKa
         z1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPsMKI3Hry4SCY0Rto6ZGG0DOnuEWW7ZNA7K95OADvCBiOZOqBMJ77ev+Frc86bFYyl1M7dmwrp7KIieN795RLEAI=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz7Ch2InA7pr/ULIH6CPkzBpt7D0OiYZVq8Mca2yxsx2frBPnVn
	bMa1ibkzMM5IJ/V8TIybtefTK5Khm0KF/ZuNXyqdTdnVMyxEneX2XkvwqOg6NunMwU9YfaCmPVq
	AQNC/Y4kAnA+GRSpGCay1jnOZjuM=
X-Gm-Gg: ASbGnct0iIOEbXwqZ6XqgDHFWFIYFhTLPmEE4D1eDC5QRC3lH8vNCmjvQjTUUpgTSr8
	NzeEN/sq6dEkcu0j9HMEFlIYz6SoRJFQVq7OuxEoC+Mwnh04PYyL4zVUtR4Z/86jFm26aVfQaqD
	o1utZGsyi5WBMKCyuQ/HgYpGInr0zDRMdGPCIH4TffqSJVZGHEhCSTObZ6
X-Google-Smtp-Source: AGHT+IFp1N3laUxY/lfBFOkBO3XbUjMi4ACTdLfbC99FvP/Kh6Buey1nOqnW0pE7mi4K+Uh2zlb9pCf8hb6hC+PdRKE=
X-Received: by 2002:a05:6830:280e:b0:72b:8974:e3e6 with SMTP id
 46e09a7af769-72e369764c6mr9840087a34.28.1744061081965; Mon, 07 Apr 2025
 14:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250407121547.2516285-1-changqing.li@windriver.com>
 <20250407121547.2516285-3-changqing.li@windriver.com> <d8e529cd-7e25-4f93-bdbb-466877ba08ca@windriver.com>
 <CAMKF1soCb36sJntEEm35wEUq2KYQn729A21+UA_qdBmsfQvnKA@mail.gmail.com>
In-Reply-To: <CAMKF1soCb36sJntEEm35wEUq2KYQn729A21+UA_qdBmsfQvnKA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Apr 2025 14:24:16 -0700
X-Gm-Features: ATxdqUHO80yjk108eHDOr24gXee6hdbaiaR_mratdCK1DNRaaWBNYiffGY5ADc4
Message-ID: <CAMKF1srPnbjPRjQCLtvcyL-0WPo65rL-xNr52Q0z=PVs-oKb5w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: upgrade 11.4.4 -> 11.4.5
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: changqing.li@windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 21:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116681

and we are no alone see
https://jira.mariadb.org/browse/MDEV-36217

We need to bring
https://github.com/MariaDB/server/pull/3871

along

On Mon, Apr 7, 2025 at 2:21=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Apr 7, 2025 at 1:56=E2=80=AFPM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
> >
> > On 2025-04-07 8:15 a.m., Changqing Li via lists.openembedded.org wrote:
> >
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  .../{mariadb-native_11.4.4.bb =3D> mariadb-native_11.4.5.bb}      | 0
> >  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
> >  .../recipes-dbs/mysql/{mariadb_11.4.4.bb =3D> mariadb_11.4.5.bb}  | 0
> >  3 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.4.bb =3D> mariad=
b-native_11.4.5.bb} (100%)
> >  rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.4.bb =3D> mariadb_11.4.=
5.bb} (100%)
> >
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb b/meta-=
oe/recipes-dbs/mysql/mariadb-native_11.4.5.bb
> > similarity index 100%
> > rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb
> > rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.5.bb
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-db=
s/mysql/mariadb.inc
> > index 66b46d2afd..f704ff6dec 100644
> > --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> > +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> > @@ -25,7 +25,7 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source=
/${BP}.tar.gz \
> >             file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
> >             file://0001-Ensure-compatibility-with-ARMv9-by-updating-.ar=
ch-di.patch \
> >            "
> > -SRC_URI[sha256sum] =3D "96fbd2e6e93fb7e8b373eea75d85b6fea57c0e111a0209=
0cbbefed52599dc77b"
> > +SRC_URI[sha256sum] =3D "ff6595f8c482f9921e39b97fa1122377a69f0dcbd92553=
c6b9032cbf0e9b5354"
> >
> >  UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/tags"
> >
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb b/meta-oe/reci=
pes-dbs/mysql/mariadb_11.4.5.bb
> > similarity index 100%
> > rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb
> > rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.5.bb
> >
> >
> > Sandy, there's a mariadb build failure. See below.
> >
> >
> > Khem said on IRC:
> >
> > ... Changqing Li and report this build failure -
> >    https://errors.yoctoproject.org/Errors/Details/851668/ with mariadb =
11.4.5 upgrade
> >
>
> I think this is the change causing the build failure
>
> https://github.com/MariaDB/server/commit/d5a417b9d55ac2744b600463a1abaf06=
5772d678
>
> My guess is that it does not happen on gcc but does happen with clang
>
> > I see the patch on lore.kernel.org but not in my inbox, mysterious worl=
d of emails
> >
> > ../Randy
> >
> > --
> > 2.34.1
> >
> > pLK@tY:ATbOf1"dW
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#116666): https://lists.openembedded.org/g/openembed=
ded-devel/message/116666
> > Mute This Topic: https://lists.openembedded.org/mt/112131137/3616765
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[randy.macleod@windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
> > --
> > # Randy MacLeod
> > # Wind River Linux

