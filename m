Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F30D6B6BD
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 18:47:20 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.23254.1730314033304664167
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Oct 2024 11:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m1s6gbNA;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5ec6bdd9923so140417eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 11:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730314032; x=1730918832; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGfdsP2hu/5TZRVu4keq0+rkwfEj8q7wgx5f4wppjwY=;
        b=m1s6gbNABN2d6bUvFbjNqxTxPoMsq2VZIgxFJ6p1V/4F7NJE/SFQsd3hxDxMVXpdPz
         rmpHVpoLVZXhhKkbc2mhlQkfw0EcKyG2cWMkPcvi8UJAxsTwZI/nYPV1HceqxZ5hoUVo
         wbH4LqQEuMAMFwjMxGhraLlhr1K9r8HDQ/VDaYmGnG0ACvTumEO3nl4mn5uztftJEwdk
         dcOLewsKt+DthxKYN39/3UkWS8MvX2SHRZ4b2lcCCS/8xb4Xisrtn7GnRw3m5GnB7uGX
         aaGh4BbQsUMVQbxn1PnsYkmYJR8+A7yj65k5GhpbNr/BKOtm3S+CT42Dz2jDqXuQpYXu
         DDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730314032; x=1730918832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGfdsP2hu/5TZRVu4keq0+rkwfEj8q7wgx5f4wppjwY=;
        b=U+SoX1nDlFPoK5zsMDWm05H3E/6Kq/SSiw2dZE63ZjzudWQwASs5BBXZIHEpTLA913
         kdA96jaEEhev0ekChtr6I3PJZ4PQZuAmRzACaYLRhu+L8Ev28Xo86V4aCX4LFxgI8WUj
         Ce2EvF5nBe6DZNzVXOnr4h89ZAkQ3gZl8U2ACFDCCbdEbAAJaTGL46/p2LGz+dfcmHTV
         cG90RAlYJpv7ZAboH4ZuO5YlK3ovfmhsheJ8lZdf1PoY7MLutRONgxgKBqBukqwvHNmD
         Ptuy4nQHtZLPjaB6a79FiutJ2FZ68mhLB2FwCzjOBBAc0n3/MHuvt7R6xL8upGZH638s
         wNqA==
X-Gm-Message-State: AOJu0YzBHmBcIIt9a2Uwf69/Ux4/xqyKOEt9lSk4vbs9GZI31VPjXL9t
	CgLa/cc3PZZyyRBcyTwJeMvRpImu3BCQXI7yEnmnyrRCccI/KU363adIcgeTLhfnSGbF6jx48pk
	PIpe+jczAm0xS+Gu+B7SkJ0P4vdY=
X-Google-Smtp-Source: AGHT+IHSE9QumPAZfvg7EgRpT3uU8uiSvJE2PSEsSWWRjpeeIH7W6MeDB+l99ICuJnl/P4nYZYeaCzx9MvYXw3X2If4=
X-Received: by 2002:a05:6820:1686:b0:5eb:8488:c80b with SMTP id
 006d021491bc7-5ec2399758cmr11632304eaf.6.1730314032451; Wed, 30 Oct 2024
 11:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240915210222.2237434-1-yoann.congal@smile.fr> <e4beb6ff-ecbc-48f7-89a3-4f250ddef8a4@smile.fr>
In-Reply-To: <e4beb6ff-ecbc-48f7-89a3-4f250ddef8a4@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2024 11:46:46 -0700
Message-ID: <CAMKF1sobWbAB6iGuZ=HY5YL7X0Tch3PD0HkZk0BsPE8ByPgZdw@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] non-repro-meta-filesystems: update
 known reproducible packages
To: yoann.congal@smile.fr
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 18:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113350

On Wed, Oct 30, 2024 at 11:28=E2=80=AFAM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
>
>
> Le 15/09/2024 =C3=A0 23:02, Yoann Congal a =C3=A9crit :
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > Re-include packages that are seen reproducible in the last 3 AB runs:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/41/s=
teps/12/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/42/s=
teps/12/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/43/s=
teps/12/logs/stdio
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  meta-filesystems/conf/include/non-repro-meta-filesystems.inc | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/meta-filesystems/conf/include/non-repro-meta-filesystems.i=
nc b/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
> > index 4975593277..509907d889 100644
> > --- a/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
> > +++ b/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
> > @@ -3,7 +3,4 @@
> >  KNOWN_NON_REPRO_META_FILESYSTEMS =3D " \
> >      e2tools-ptest \
> >      xfsprogs-doc \
> > -    zfs \
> > -    zfs-dbg \
> > -    zfs-dev \
>
> zfs is not reproducible: it changes depending on host distro. We just
> had (bad) luck with the AB worker.
>
> See:
> * https://valkyrie.yoctoproject.org/#/builders/87/builds/16
> *
> https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-filesystems/oe=
-reproducible-20241027-tsrqdzze/packages/diff-html/
>
> I'll send a reproducibility fix forcing the "debian" target distro which
> does match OpenEmbedded configuration.

This would be ok, we alias debian in other places too

>
> >  "
>
> --
> Yoann Congal
> Smile ECS - Tech Expert
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113349): https://lists.openembedded.org/g/openembedde=
d-devel/message/113349
> Mute This Topic: https://lists.openembedded.org/mt/108469988/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

