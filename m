Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3805C25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 18:46:16 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.2576.1716403574006635093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 May 2024 11:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZkjHt2Xe;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-241572c02efso2935185fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 11:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716403573; x=1717008373; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQ1bfig/7XYqqDTtRXgDNAUS40CNpyERlQIqgPffISs=;
        b=ZkjHt2Xe5d98a9HpCQszfMpcs+sMtnkwvrpatjjVpC5yjPorLMUEKJFuykCiWFOa5+
         5MT04F7qhL5gpRHQ5kgRGAx74vmO8oTRMxFrKIZgLhPv/b83clfaMpxThB09S516NbKg
         V4s80cl1tx7FpeJ7TPRNa06kjbMHNZSXDqqnI53EUCzyBySGr/I5YdWqXiF/vjlCxUXB
         HS6Bo0tN0+YX5LXm09GAgtDf9+zbszpF3LqTAb0oWtCBiMwg4Dg2yicIKuJoCjAbAl0W
         fUdq46ca/eiaPNmUo3vZ+uZNEr4H1BGqKTRjw36MmcOjh6p5lm4fH88TEp7EfO4xy6jp
         xaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716403573; x=1717008373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ1bfig/7XYqqDTtRXgDNAUS40CNpyERlQIqgPffISs=;
        b=cLh4C1+4Fs2AelwyciH77j0pSZo9yBJOc/r5cdtj8zwDgM43gg5jgFRXus1mSrM3yN
         u1MyMoN6oZ1HDLfs486TCfEwACVbOHbio5Fa8fYRqFlwwuVushP2zlBLxajxU52D5yW6
         DVItCgaj9/Xm4hcgNpWs67tBzFTyls6wATSMWRFkZDndYHjxKSZ9UMoAdAVfb+0RTMtI
         4VZNP/R2ScLh4MOa/ZJZLDHKoUn8yFTF3gUmxNnKyDxphjV4q/QeEyQj9lnL4DelbhV4
         ZBKpHFteoiXNuRSbIj06yMGaFWcUeMT8uOPM4kDC3xrrEc2a8CCc5bUMc4NRJesKyEvd
         A65g==
X-Gm-Message-State: AOJu0Yxm+eBYQAv7hXOWWd/G484DZpmxgPnCMYDch9LYmwXp+CHCHnUO
	g3vjoxZvMucqdAF6tvp2HsS+g0KWd95x20LwXnP2UsPFIyR++HrjuAH9bJ5AqZ7wSkLAnMP5pMu
	TZaL/EgoQM92FsNVCxpryEs2xRhU=
X-Google-Smtp-Source: AGHT+IGs8dFmguh5lq9/iiFBNc+ZnqaeWOQCrlFjphMR5wyTwAhFdc2LlJaRD+GbF0yOT2p+37RX9zqBX0iFOexvxtk=
X-Received: by 2002:a05:6870:780b:b0:24c:4f95:cd93 with SMTP id
 586e51a60fabf-24c68cd0806mr2821594fac.31.1716403572902; Wed, 22 May 2024
 11:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240417063502.6985-1-peter.marko@siemens.com> <AS1PR10MB5697AC61E6595506A658B336FDEA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697AC61E6595506A658B336FDEA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2024 11:45:45 -0700
Message-ID: <CAMKF1sq8qBXNmYV8GxFxkibbvwBi5WDA=RBUewVTs5qHSt9itQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][scarthgap][PATCH] jemalloc: add +git to version
To: peter.marko@siemens.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 18:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110488

I am seeing configure errors

| checking for x86_64-yoe-linux-nm... x86_64-yoe-linux-gcc-nm
| checking for gawk... gawk
| configure: error:
5.3.0+git-0-g630434bb0ac619f7beec927569782d924c459385 does not match
<major>.<minor>.<bugfix>-<nrev>-g<gid> or VERSION
| NOTE: The following config.log files may provide further information.
| NOTE: /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/jemalloc/5.3.0+=
git/build/config.log


On Tue, May 21, 2024 at 2:19=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> Gentle ping
>
> -----Original Message-----
> From: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Wednesday, April 17, 2024 8:35
> To: openembedded-devel@lists.openembedded.org
> Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [meta-oe][master][scarthgap][PATCH] jemalloc: add +git to versio=
n
>
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > jemalloc was switched from tag to development branch
> > 171 commits ahead.
> > Adapt PV accordingly.
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta=
-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> > index 7e0272f89..dca8de461 100644
> > --- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> > +++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> > @@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/jemalloc/jemalloc.git;b=
ranch=3Ddev;protocol=3Dhttps \
> >             file://run-ptest \
> >             "
> >  SRCREV =3D "630434bb0ac619f7beec927569782d924c459385"
> > +PV .=3D "+git"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > --
> > 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110477): https://lists.openembedded.org/g/openembedde=
d-devel/message/110477
> Mute This Topic: https://lists.openembedded.org/mt/105572435/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

