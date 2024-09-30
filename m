Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D796CE8374
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:53:03 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.60334.1727715179014262695
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 09:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ARtHaWKv;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-27d045a73easo2286224fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 09:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727715178; x=1728319978; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiMSA8QsQVyDIcF+4WEsKjMsRYu3/pvBPZoM7K90Gnc=;
        b=ARtHaWKvDC1YboCT89Tfm9zF+doXAZ2NBzz27hpzP/Z0sbaQ2LZz2dAt0TEQcQLt2X
         jbM8r1phF3O8t/SD6zPDDKDrmGco98kcmLB4Z1I1FCiI9l0N2f2Nj8+3exWmf1QEN+xA
         br+vHwZ1rLL/WOPfZeNYUPARA3wRGFPuNvx1Bh5wIjhYdKXKikXFX48mVkQZvGLLfoqs
         6Z/2TMc3E7sGEPp3CU+0WwsJF24/L5iI2MLZPyz9MZFoFyMNN2kAkKdWWLBy/UfXQvoh
         SSPDgIvRXiByRoLa8c66oj8C+zs2z2dGt0ySBZEt/38h9xf1Gb4zvi1eV6+7e6qfQS8x
         gloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727715178; x=1728319978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiMSA8QsQVyDIcF+4WEsKjMsRYu3/pvBPZoM7K90Gnc=;
        b=DPJAZgQLuMS7pQ3J2/nnrKKO84HKmIRL5sTKyAcWTTwBNRKigkQQLOfpJ64iphngT1
         oAABCOm8Og1JpcNny6bpki2NluHZYUBrf9w48ewupbVOFnh0iWXE7+LNQv0/sp4JfAw0
         5bT4aii/8i9btG7X5xurdGs90IV3EnpVL89CRAyW0MuYzItLEnL4bBiZnS0p6DMUbiNR
         gMDqnhiDNUrk5OC8gBdO3U15ywunZ0Va+od3kE5SVh4FsQKeGUpvbyIGC9enBagzmijg
         M57ZXuhq/LiB6fAJxRCqlKnssrT65eUuwJ7Q8CwUsFgv6xJ357eScdwP9ukIfM3X+Otr
         OG3g==
X-Gm-Message-State: AOJu0YzMInacQMniGVBklajJjZWN2svril+gpaq1P0wLNdkNWCloZk1Z
	PyLxQwL+Dxv9+TjJH4OGu1GJA8coPulFLFdKGKbNVn658ySaRMaDkrojjMyePzdcLPPFBVJ4zJ0
	3R9HkKJeRIz7hceyHsx93gYjFYpqUug==
X-Google-Smtp-Source: AGHT+IGU2YX0LKSWlemElffjnDh16Qsnx3SwLHVjcyZbijhzoAKYUil3rkaSpXh6qUqWaDbOWonRVPf71E3cgaab4gQ=
X-Received: by 2002:a05:6871:3a22:b0:260:ffaf:8126 with SMTP id
 586e51a60fabf-287109c8ee5mr7302407fac.9.1727715178288; Mon, 30 Sep 2024
 09:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240930120524.2051403-1-niko.mauno@vaisala.com>
 <CAMKF1sp_0-6Ep9av_PMS37EfDxKz4vA7UswcY4nPbgPzTjLd+Q@mail.gmail.com>
 <5853cef6-3edf-4614-9b0e-fd572b6286d4@vaisala.com> <CAMKF1soMOpdvsV7gf7c82YdFaV6UvGHX1hznRifPiu0qnf_vhQ@mail.gmail.com>
 <1cd00a33-a0db-41af-bd9c-1a567626265d@vaisala.com>
In-Reply-To: <1cd00a33-a0db-41af-bd9c-1a567626265d@vaisala.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Sep 2024 09:52:31 -0700
Message-ID: <CAMKF1sra9GyLMOsspa3=UEwtVdMvrZUTEz1BhjjBrVSjv9wvrg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/4] mysql-python: Remove obsolete recipe
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112614

Thanks, please check master-next again since I fixed it as per your
comments as well.

On Mon, Sep 30, 2024 at 9:28=E2=80=AFAM Niko Mauno <niko.mauno@vaisala.com>=
 wrote:
>
> Thanks, submitted v2 of the four patch series to meta-oe.
> -Niko
>
> On 30.9.2024 19.14, Khem Raj wrote:
> > Rebase your series then on master next and resend
> >
> > On Mon, Sep 30, 2024 at 8:34=E2=80=AFAM Niko Mauno <niko.mauno@vaisala.=
com
> > <mailto:niko.mauno@vaisala.com>> wrote:
> >
> >     On 30.9.2024 17.56, Khem Raj wrote:
> >      > Thanks for the cleanup, it would be cool to shed some more perha=
ps. I
> >      > had to resolve merge conflicts to get this staged into master-ne=
xt,
> >      > please check if all is ok on master-next
> >
> >     Hi Khem, glad if I can help.
> >
> >     To me the following three commits currently seem to be in good shap=
e in
> >     master-next:
> >        - "lio-utils: Remove obsolete recipe"
> >        - "telepathy-idle: Remove obsolete recipe"
> >        - "cherokee: Remove obsolete recipe"
> >
> >     Unfortunately with two commits I noticed some issues, which I will =
try
> >     to detail below:
> >
> >        - "openlmi-tools: Remove obsolete recipe" commit in master-next
> >     currently removes only the RDEPENDS line in
> >     meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> >     <http://packagegroup-meta-oe.bb/
> >     remove also two more lines in that file which reference
> >     'packagegroup-meta-oe-extended-python2'. Furthermore, it doesn't re=
move
> >     meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
> >     <http://openlmi-tools_0.10.5.bb/
> >
> >     Please see
> >     https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-n=
ext&id=3D7b178cf9ea8fe2683741f75ebc220f0f70cb45f8 <https://git.openembedded=
.org/meta-openembedded/commit/?h=3Dmaster-next&id=3D7b178cf9ea8fe2683741f75=
ebc220f0f70cb45f8
> >     vs.
> >     https://patchwork.yoctoproject.org/project/oe/patch/20240930120524.=
2051403-4-niko.mauno@vaisala.com/ <https://patchwork.yoctoproject.org/proje=
ct/oe/patch/20240930120524.2051403-4-niko.mauno@vaisala.com/
> >
> >        - "mysql-python: Remove obsolete recipe" commit in master-next
> >     currently removes only the recipe files
> >     meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilatio=
n-with-MariaDB-with-10.3.13.patch
> >     and meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
> >     <http://mysql-python_1.2.5.bb/
> >     it doesn't remove the two lines referencing
> >     'packagegroup-meta-oe-dbs-python2', nor the
> >     RDEPENDS:packagegroup-meta-oe-dbs-python2 declaration in
> >     meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> >     <http://packagegroup-meta-oe.bb/
> >
> >     Please see
> >     https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-n=
ext&id=3D1a5d5087f66ad3cea99473223971aab9391ffc94 <https://git.openembedded=
.org/meta-openembedded/commit/?h=3Dmaster-next&id=3D1a5d5087f66ad3cea994732=
23971aab9391ffc94
> >     vs.
> >     https://patchwork.yoctoproject.org/project/oe/patch/20240930120524.=
2051403-1-niko.mauno@vaisala.com/ <https://patchwork.yoctoproject.org/proje=
ct/oe/patch/20240930120524.2051403-1-niko.mauno@vaisala.com/
> >
> >     Kind regards, Niko
> >

