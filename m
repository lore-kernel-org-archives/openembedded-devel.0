Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC0ED18126
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 15:19:27 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.57588.1728919165117202964
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 08:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nne/WZiB;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5111747cso10463161fa.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728919163; x=1729523963; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwraArGYBQPVzTPPqLO6QvqG+egmbG/DK3bjf/AvgZk=;
        b=Nne/WZiBiDU9g1PRfIRDWnwbJK/07WIsG36JXEAprMR8da2Bx+TI90dpltgmRooOiq
         rGKemUw/LINrqjayyu+8c9eC+Z9Gb0Jyr+cHwSP965McGfLEzDj/r6qhJzQuBsT10j5j
         DXNahhWFfo3Gg46fuums+EobHGXKtiCB66i6uQOoa+ZiNAePhKx4m6NPNBKewgnvuHyE
         KTxcm73diMSMZHZQG7IugsCFZtcA4xwFnPsOMr81GIx6iY/6qV+IFoS9+r6QZHDyBv1B
         zQI11QuUWJJgeQaWonXCrjBH+uGjiTCGuvGOyXvQpdKbOH8Cl++DzZuD4k8z2LDcJ/4z
         onmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728919163; x=1729523963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwraArGYBQPVzTPPqLO6QvqG+egmbG/DK3bjf/AvgZk=;
        b=VVygD1tFiaS5Rfrt6Dd08HZAb7HZT5GniLqjxEUJrvhPqEoa1R+Km26BikqbJPQWpS
         fuhrpNRLS9zZ/qw2HON4OQ0XOwQyrXHkVAfxWZbwFEBM5OxM1qCCCpjLaZ2Pvis3soSd
         5R1NFC3Ms5rtPeiDqBaJMB9sgSReRkOhAFF/fkRkPS9pGe6wh0eEL8QG1Fm7pmrRft9t
         NQL07KbP0GFQUY6uWVENFur0gKXJh0kyy6di47/N+FNZFxKKFCzkwWW9caIVkt+9kKk+
         Qb0Z99r1KROmxRvWSPheodzPhEFYYLTVs+vsL2dRz3lG83QzbEZaLGAmAXUepE43S1Rn
         NVQA==
X-Forwarded-Encrypted: i=1; AJvYcCX2qNdAjogQNwjLpdWwN5HDetubXQHMGfbH6bUqGCnr//LRTJ85bjzcKegcexzueh3gIzqZG7KvP03T4t9EXFpaeBE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyokCrNmQ5+cooAjQBKSKpsnEurcNHXzyoVXcTxrfRRtK932aPH
	H5R8+XUXiGV2xumdYSkF4p1WtrAx7Her4vnIsNWo5cCHiHG6HQ5jo0XIPUF+NtExYrP13ZnPbmL
	O7Vh53xgXup8Rh061X6oap09zoYc=
X-Google-Smtp-Source: AGHT+IEHry/omeuVIZq6TERM+ZjThYQAEnlE4clL8Nt+u/buXXUFbEh9RGVQJ+/xkkhK4QNpA02CibyMigB6ofF8x6c=
X-Received: by 2002:a2e:e11:0:b0:2fa:c0df:3d91 with SMTP id
 38308e7fff4ca-2fb32789cf9mr36871591fa.19.1728919162762; Mon, 14 Oct 2024
 08:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20241009065729.4114713-1-guocai.he.cn@windriver.com>
 <CA+chaQfP+wSdV4=dptAsUxvdC-rVR-qTPDGPquShMaGTETKbCA@mail.gmail.com> <17FE58DB5E2175EA.4702@lists.openembedded.org>
In-Reply-To: <17FE58DB5E2175EA.4702@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Oct 2024 17:19:11 +0200
Message-ID: <CA+chaQfbO2YoAD+sok_ZfwQGCAgTq-a7LZz7=cwQpFVPujShrQ@mail.gmail.com>
Subject: Re: [oe] [meta][kirkstone][PATCH] xmlrpc-c: fix do_fetch error
To: martin.jansa@gmail.com
Cc: guocai.he.cn@windriver.com, kai.kang@windriver.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 15:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112907

It's needed in all branches.

kirkstone and langdale use 1.54.02
with SRCREV 86405c7e1bd4f70287204a28d242a1054daab520 ->
36b142d6179514989a44c1087f6c46182dafd21f
$ git branch -a --contains 86405c7e1bd4f70287204a28d242a1054daab520
$

mickledore uses 1.54.06
with SRCREV 00870af80021aa0a66cc72c9aeb00587cbfde560 ->
eff6cb488a644c1378318ff301392fb757fad2aa
$ git branch -a --contains 00870af80021aa0a66cc72c9aeb00587cbfde560
$

nanbield, scarthgap, styhead use 1.59.01
with SRCREV 352aeaa9ae49e90e55187cbda839f2113df06278 ->
08b052692b70171a6fcb437d4f52a46977eda62e
$ git branch -a --contains 352aeaa9ae49e90e55187cbda839f2113df06278
$

master has 1.60.03 since:
https://git.openembedded.org/meta-openembedded/commit/?id=3Dca7ea3ed024a2cf=
697aa336eeddbb69bda99a196
with SRCREV a823b0bb5cf0a4dbd34f929cbfdfb0439c5d9b0e which is fine:

$ git branch -a --contains a823b0bb5cf0a4dbd34f929cbfdfb0439c5d9b0e
* master
  remotes/git-svn
  remotes/origin/master

Will send patches for other branches.

On Mon, Oct 14, 2024 at 4:43=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> With old SRCREV from:
> https://downloads.yoctoproject.org/mirror/sources/git2_github.com.mirror.=
xmlrpc-c.git.tar.gz
>
> $ git diff 86405c7e1bd4f70287204a28d242a1054daab520
> 36b142d6179514989a44c1087f6c46182dafd21f
> $
>
> so at least the 1.54.02 content is the same, git history was rewritten
> since the commit from 2018:
> 69ee98df Release 1.43.07
>
> On Mon, Oct 14, 2024 at 8:43=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > I can confirm that the github repo was force pushed:
> >
> > From https://github.com/mirror/xmlrpc-c
> >  + 46ac9180...f5b52c01 master     -> master  (forced update)
> >
> > but it should be double checked to see what changed between old and
> > new SRCREV (you should be able to find old SRCREV still on some OE
> > MIRROR).
> >
> > On Wed, Oct 9, 2024 at 8:57=E2=80=AFAM guocai he via lists.openembedded=
.org
> > <guocai.he.cn=3Dwindriver.com@lists.openembedded.org> wrote:
> > >
> > > From: Guocai He <guocai.he.cn@windriver.com>
> > >
> > > Fetcher failure:
> > > Unable to find revision 86405c7e1bd4f70287204a28d242a1054daab520
> > > in branch master
> > >
> > > Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> > > ---
> > >  meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/=
meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> > > index 36205009a..991c4544b 100644
> > > --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> > > +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> > > @@ -12,7 +12,7 @@ SRC_URI =3D "git://github.com/mirror/xmlrpc-c.git;b=
ranch=3Dmaster;protocol=3Dhttps \
> > >             "
> > >
> > >  #Release 1.54.02
> > > -SRCREV =3D "86405c7e1bd4f70287204a28d242a1054daab520"
> > > +SRCREV =3D "36b142d6179514989a44c1087f6c46182dafd21f"
> > >
> > >  S =3D "${WORKDIR}/git/stable"
> > >
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112906): https://lists.openembedded.org/g/openembedde=
d-devel/message/112906
> Mute This Topic: https://lists.openembedded.org/mt/108904710/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

