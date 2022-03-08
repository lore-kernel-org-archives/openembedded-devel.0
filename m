Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC60C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 16:03:51 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.9855.1646755415845041215
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p7A78+UJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id o22so6860185qta.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MzgBNme+uuUN1BsjXaYa1+B9UNYlrw6HUYgNxVobDD4=;
        b=p7A78+UJA6bi9KMz7W6ww/UpJ5ZFoSn/bSm41dlOIoPrk9NhhWT5r06MDA6KuZXOKX
         DQ0irEev6SDMuzg4Mu+uqzslSISDvpvlLBscZOg8seHfmH8h32izFjfEKrk5lyL2+xft
         YKs+dtnIhh9zXdrHnZ9yq6s0rpSV7RyDmpt+MuJG9kQW9Zj2y3yWlb9Deqxm19EXdKIc
         VeNOc3EtcujGEAWcSUhpHfS/q/0nhCcpuWj30sOxAqXM/UOM7FqwL2K0CZNA2d7qKlhZ
         bDN2AR3oWCvM7y3o1Qyxtx+gD9AQvwjpnihtXP+l8VsGLhFfStPka2k+wJD/a3DFx8Z/
         r+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MzgBNme+uuUN1BsjXaYa1+B9UNYlrw6HUYgNxVobDD4=;
        b=BWB4nx1bqytR2hPhuXmtzCnRNo4FpwzbAQ4LLX4FDX0AN6S/Jz1K8qiVonuThj6+eq
         BWACTV5AmrBXFPg5q0vNvvmrNuWAj8lsnKLK7vqJRnXYpfBXmG4Qxm4joaiJBk1XDF6j
         m4bm9JvLCtZRZLos7HR9NsYXDkcbXhXdEYgqXWUr53nm6Z2PgGvc1JBVDQ/ZZJ2tjGli
         FzvQor4gbifJcynm1GXup51NeW2KN7bjU1nlGZu6VlE15ZRzx76fZUl+RROeWFaQ+3SW
         1Y0BJKmEZQeDmgaxmXTbbbhspeP844y1DlFFp/VDdMMuYaDxHXSPK0OiisprG8wx6x69
         uHDA==
X-Gm-Message-State: AOAM532/r+ZUemfGmXT8KDEdJuNPr9zzsh7//4nAfI0WD6aBLnpVRvn2
	AkEsVIhFHbdAaNTXkt+8vvFPNV2fUbplRJw7qVs=
X-Google-Smtp-Source: 
 ABdhPJw91gdYTamHsyx9MAp4DGVpzo8kRNhjASAuVBtXJOkI1CcZ5IR0dCEb34AqJ4U7fZ5jLF2HjicR7RL5noinpys=
X-Received: by 2002:ac8:5a84:0:b0:2e1:4f1d:36fb with SMTP id
 c4-20020ac85a84000000b002e14f1d36fbmr411252qtc.54.1646755414762; Tue, 08 Mar
 2022 08:03:34 -0800 (PST)
MIME-Version: 1.0
References: <20220306063116.710-1-sam.van.den.berge@gmail.com>
 <CAMKF1sriSNk8FQJhUSHumG5eoA+5d_w4EzeidDwzm_0oZrNTFQ@mail.gmail.com>
 <20220308113800.GA36@OP01518NB.oip.local>
In-Reply-To: <20220308113800.GA36@OP01518NB.oip.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Mar 2022 08:03:08 -0800
Message-ID: 
 <CAMKF1sp9xZuSjBdjjXk+uHF2heuxzvorHmByWA5G9=sVsHbm_Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libiio: point PYPA_WHEEL to custom location
To: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Mar 2022 16:03:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95886

Ok, thanks.

On Tue, Mar 8, 2022 at 3:38 AM Sam Van Den Berge
<sam.van.den.berge@gmail.com> wrote:
>
> On Sat, Mar 05, 2022 at 11:29:42PM -0800, Khem Raj wrote:
> > Thanks for fixing this
> >
> > On Sat, Mar 5, 2022 at 10:31 PM Sam Van Den Berge
> > <sam.van.den.berge@gmail.com> wrote:
> > >
> > > From: Sam Van Den Berge <sam.van.den.berge@gmail.com>
> > >
> > > This fixes the installation of the python bindings of libiio.
> > >
> > > Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
> > > ---
> > >  meta-oe/recipes-support/libiio/libiio_git.bb | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
> > > index f33fc0c1c..19753a13b 100644
> > > --- a/meta-oe/recipes-support/libiio/libiio_git.bb
> > > +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> > > @@ -15,6 +15,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> > >  S = "${WORKDIR}/git"
> > >
> > >  SETUPTOOLS_SETUP_PATH ?= "${B}/bindings/python/"
> > > +PIP_INSTALL_PACKAGE = "libiio"
> > > +PIP_INSTALL_DIST_PATH = "${B}/bindings/python/dist/"
> > > +PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.21-*.whl"
> >
> > perhaps we do not need to set PYPA_WHEEL perhaps. I am also wondering
> > why its not failing in
> > oe world builds. Can you check it again with latest master-next of
> > both core and meta-oe
> >
>
> Thanks for the hint.
>
> Tried today with latest master and it worked without my patch. I guess commit
> 6f2d85a7b7d9 in oe-core fixes some things so this patch can be dropped.
>
> > >
> > >  DEPENDS = " \
> > >      flex-native bison-native libaio \
> > > --
> > > 2.25.1
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#95810): https://lists.openembedded.org/g/openembedded-devel/message/95810
> > > Mute This Topic: https://lists.openembedded.org/mt/89585637/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

