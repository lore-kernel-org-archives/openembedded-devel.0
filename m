Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB22EB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 05:03:47 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.1017.1690434224106861598
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 22:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LWLvlkqF;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1bba7717d3bso454312fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 22:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690434223; x=1691039023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gk8mxHp0dt02cFrqtmsooMbjODD7Bnpygmbv5+Ue6XA=;
        b=LWLvlkqFJVCIGIKjWjitx8FsP2QP8xFBzfbuxW0nsdpIJh9WCxLMxvZUps5usvnG4n
         2rBSD8rh26K6wvtKAdp43S9ZonAttix9RFAiSpPOxXesss6I56C2DosonqIQ7X+bSffc
         QMxlVe8z4USOslw/di7vpQKYylo3ki5cPtI39AOA8B5pxy0JceSfM4Gvd7mjlPCBESUE
         rWSqgBjLTGZ/f41PejnpsuGiouopxRScOxRNF0faCJl19UAGjkf8KVJpP7WEHDcc6RzM
         pIP1aefcKb6sMi5IVVhEVn5c2RYk24lYGTNUhmtezGuCDbgqWEa8S2QzSegon0SLmAwH
         6Lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690434223; x=1691039023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk8mxHp0dt02cFrqtmsooMbjODD7Bnpygmbv5+Ue6XA=;
        b=L1d93j3GkBDiCs40Vyd8zAXSWAZJ/NAOqgpUG72o7MHoIsEo3OCZAaLT+rPV9wx9U7
         Dwb/vOlDxEJ43a9+/CbHqQi9Dg9TkvCkAkpjzCLtguPo7AJvggdcxSletfX3Ipsm66oW
         8/IVRaHGO1+lYn40BvTpOUF10v4zUvwFWUrcrp+nBuVpP+oiykqLis/osqr1cW3rabmV
         /bhEpJSQ2S9b0A4lcI7y6P+t3R5+uhEojarKR0zZeABtBkNVnqw+pKp0MXDo9b/lRM2W
         AgJNeMl8y6O+2CURgWNVHB13VEaAbCvCRIlssk4vQfX6xHwwwyRJJys9t6Ddmw3lD6yc
         T6gg==
X-Gm-Message-State: ABy/qLadSZhMRPNT1X6DyDrHhduqY2LxrB+RJrFA8cpjINcJ2N2FRDh/
	g8/eURMIWfUoWs57uEYtaRAfawm6HKt6Vo95CVk=
X-Google-Smtp-Source: APBJJlGqooI2WKZ4x9MZ9Twkav8gwtPayxCRvWGCU1szHZuFjtwFF82HryUsSz/cE1da6IINnJ0pZVLAypktoQvqiBQ=
X-Received: by 2002:a05:6870:eca3:b0:1bb:8a0e:be4 with SMTP id
 eo35-20020a056870eca300b001bb8a0e0be4mr1725266oab.14.1690434223184; Wed, 26
 Jul 2023 22:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230727023924.1121571-1-yi.zhao@windriver.com>
 <5325926049a47cf61b6fe57040b9f98189f0e968.camel@intel.com> <efe84917-0da4-face-5d3a-3cf5ab38db4d@windriver.com>
In-Reply-To: <efe84917-0da4-face-5d3a-3cf5ab38db4d@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Jul 2023 22:03:17 -0700
Message-ID: <CAMKF1sragyPm_iKUj7ufhBLhk_Frmh8Z+kuc5CU6kjNP8FurYw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH V2] vsomeip: add recipe
To: Yi Zhao <yi.zhao@eng.windriver.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 05:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104048

On Wed, Jul 26, 2023 at 9:36=E2=80=AFPM Yi Zhao <yi.zhao@eng.windriver.com>=
 wrote:
>
>
> On 7/27/23 10:55, Mittal, Anuj wrote:
> > On Thu, 2023-07-27 at 10:39 +0800, Yi Zhao wrote:
> >> The vsomeip stack implements the http://some-ip.com/ (Scalable
> >> service-Oriented MiddlewarE over IP (SOME/IP)) protocol.
> >> The stack consists out of:
> >>    a shared library for SOME/IP (libvsomeip3.so)
> >>    a shared library for SOME/IP's configuration module
> >>    (libvsomeip3-cfg.so)
> >>    a shared library for SOME/IP's service discovery
> >>    (libvsomeip3-sd.so)
> >>    a shared library for SOME/IP's E2E protection module
> >>    (libvsomeip3-e2e.so)
> >>
> >> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >> ---
> >> V2 Change: fix build with nodistro
> >>   .../0001-Fix-pkgconfig-dir-for-multilib.patch |    28 +
> >>   ...e-configuration-files-to-etc-vsomeip.patch |    28 +
> >>   .../0003-Do-not-build-external-gtest.patch    |    68 +
> >>   .../vsomeip/0004-Support-boost-1.76.patch     | 14220
> >> ++++++++++++++++
> >>   ...upport-so-that-vsomeip3-will-compile.patch | 14216
> >> +++++++++++++++
> >>   .../vsomeip/0006-Support-boost-1.82.patch     |    32 +
> >>   ...up-of-warnings-that-gcc-12.1.1-fired.patch |   298 +
> >>   ...8-Do-not-specify-PIE-flag-explicitly.patch |    41 +
> >>   .../vsomeip/vsomeip_3.1.20.3.bb               |    72 +
> > Is there some reason why you are adding this recipe for an older
> > version and then adding big backport patches instead of just taking a
> > newer version?
>
>
> We found some regressions in the new release. So we decided to add this
> old stable version and plan to upgrade it after the upstream fix.

What is tentative timeline. I am inclined to wait for upstream fix and
then get latest version

>
>
> Thanks,
>
> Yi
>
>
> >
> > Thanks,
> >
> > Anuj
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104047): https://lists.openembedded.org/g/openembedde=
d-devel/message/104047
> Mute This Topic: https://lists.openembedded.org/mt/100384151/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

