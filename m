Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DC2C433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 00:10:28 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web09.2944.1653005423901699300
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 17:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fi7FRsR5;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id l1so5732806qvh.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 17:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u9KP0yHzfhc1V9hkoVtjUALnBnQcxTwFFhWvXtJfbac=;
        b=fi7FRsR5HKMdKyciRt0U5+gUdN5ad56zV7IKI+d0mN95kBFjV/187E6e3+kCqrQE01
         +f3fUwctFXr7bgMb46YrL1RiY6dAv1ZPM+ynvFmdUKH0DyBHUVmlIDyRfntVRKb544/f
         dC37kMbWqql1ADoXvZP+0dQkyO4yP6e6+e/m/f4WQqtHqnHT7TiC75RywACYXp5HQXcM
         Q9nKXazt5AsdUPQW5EWW+VoSt7W2MO31buFNJHUwZMPN0RXxB9zNY2O/d09/yxoIaxxT
         v/2dvEYhEqKqwQNRVSzNE2sj19WZCIXKxzq8ceqZwgvjqesoGIndNZLyPU3AlXQULIiJ
         svUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u9KP0yHzfhc1V9hkoVtjUALnBnQcxTwFFhWvXtJfbac=;
        b=8RkrD4IldS1xln0loCs7FIllkBfKGwmhwOLJymk3ZNFUYda+M+bBnsPTVVB2baPeOD
         gbr/yfWitFO5qXLFuYt/cqSwF/26Tl0dYLCGsqaJfv0omx9Jh7XTnardkdA2VszuTYuI
         uGZnJ3OG0a5WKGB8wqk6RkLMxuIwjon7OXKY0unhMSiZdmWiHXMYAth2U7IBjNntLsuT
         YU0NVpk5R1zMRzsC1YA8UURJ5peYqQMB1A0MFvagrMU6q7xGv0JTMHaKH6zGuIsggP1j
         gcZFnPk3H444h6fidhBBPHMUUtY58joR89Ht0H4fMU33s8H/7ZAVwTj4yy40OSVCaxwF
         kSbQ==
X-Gm-Message-State: AOAM5301PJ/BlJBRLGbSmJf5Kuc1fkHT9ZuZswz/KuivxFGMh//OqB3E
	h4E8FkrxFcm57H8w/WengP4+WZuJ0oEk4nGVqNYwCXkOvdE=
X-Google-Smtp-Source: 
 ABdhPJzcIMPkVeb3n3CWmLWTUWnVJdhsM8Ujy5cLqQDCd16tZAfeD1M09UzaZaunT/c0z/bXidzSCxp9UHq3ancp7fM=
X-Received: by 2002:a05:6214:e6b:b0:45b:1ee:86ec with SMTP id
 jz11-20020a0562140e6b00b0045b01ee86ecmr5982877qvb.36.1653005422946; Thu, 19
 May 2022 17:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <1651999221-25259-1-git-send-email-wangmy@fujitsu.com>
 <80acef64-15e8-2ba4-1944-bd5df9be1e00@gmail.com>
 <OSBPR01MB1845CC1AE3A837D0C582A102DCD09@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB1845CC1AE3A837D0C582A102DCD09@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 May 2022 17:09:57 -0700
Message-ID: 
 <CAMKF1spq_JWmvsvpQ1BpSQ=tXtNAoprf4162=PgCFjJt8B0eqg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-aiohue: upgrade 3.0.11 ->
 4.4.1
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 May 2022 00:10:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97207

No worries, thanks for the update.

On Thu, May 19, 2022 at 4:52 PM wangmy@fujitsu.com <wangmy@fujitsu.com> wro=
te:
>
> The time of my virtual machine has not been reset since it was last suspe=
nded, resulting in system time error.
> I have modified the settings to ensure that the time consistent with the =
host. I'm very sorry for the trouble.
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Wednesday, May 18, 2022 11:32 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
> > openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-python] [PATCH] python3-aiohue: upgrade 3.0.11 =
->
> > 4.4.1
> >
> > you emails are dated wrongly. Eg. below email appears to be received on
> > 8th may where I have received it on 17th may. This confuses the tools w=
e
> > use for grok patches from mailing list. Can you check on your mail setu=
p if
> > this can be fixed on your end ?
> >
> > On 5/8/22 1:40 AM, wangmy wrote:
> > > add dependence: python3-awesomeversion
> > >
> > > Changelog from 3.0.11 to 4.4.1
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > >      Switch to limit per host on tcp connector
> > >      Delay initializing workaround dict
> > >      Bump black from 21.12b0 to 22.1.0
> > >      Put back asyncio-throttle because still in use for v1 API
> > >      Mac address got lost in translation
> > >      Update to final models and fix parser errors
> > >      Fix python 3.9 compatibility
> > >      Fix typo in button events handler
> > >      Add diagnostics feature
> > >      Small follow up fix in event logic
> > >      Allow motion sensor state to be null/none when sensor is
> > disabled
> > >      Add basic tests
> > >      Fix float int conversion
> > >      Fix race condition(s) while adding/removing a light/device
> > >      Loosen up a bit on parser errors
> > >      Fix button workaround
> > >      Add setting effect feature on light
> > >      Add missing parameters to the grouped_light set_state
> > >      Fix typo in default enum member
> > >      Add timed effects feature to light
> > >      Add support for aggregated grouped_lights commands
> > >      Hide dependencies in release-drafter
> > >      Fix and cleanup of button workaround code
> > >      Fix typo in timed effects featur
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >   .../{python3-aiohue_3.0.11.bb =3D> python3-aiohue_4.4.1.bb}      | =
3
> > ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >   rename
> > meta-python/recipes-devtools/python/{python3-aiohue_3.0.11.bb
> > > =3D> python3-aiohue_4.4.1.bb} (74%)
> > >
> > > diff --git
> > > a/meta-python/recipes-devtools/python/python3-aiohue_3.0.11.bb
> > > b/meta-python/recipes-devtools/python/python3-aiohue_4.4.1.bb
> > > similarity index 74%
> > > rename from
> > > meta-python/recipes-devtools/python/python3-aiohue_3.0.11.bb
> > > rename to
> > meta-python/recipes-devtools/python/python3-aiohue_4.4.1.bb
> > > index 47d9964b0..b3a88fb67 100644
> > > --- a/meta-python/recipes-devtools/python/python3-aiohue_3.0.11.bb
> > > +++ b/meta-python/recipes-devtools/python/python3-aiohue_4.4.1.bb
> > > @@ -4,7 +4,7 @@ SECTION =3D "devel/python"
> > >   LICENSE =3D "Apache-2.0"
> > >   LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3Ddab31a1d28183826937f4b152143a33f"
> > >
> > > -SRC_URI[sha256sum] =3D
> > "31c0b90d7dc2b62f5e1a93e78b2c0d6360ef6c0a87485c217a4f394c937fce7d
> > "
> > > +SRC_URI[sha256sum] =3D
> > "fa3bb0cf68aefdd0710704443c896abda69ae227500ad9539ac6c3d1d6dad8
> > 04"
> > >
> > >   inherit pypi setuptools3
> > >
> > > @@ -12,4 +12,5 @@ RDEPENDS:${PN} +=3D " \
> > >     ${PYTHON_PN}-aiohttp \
> > >     ${PYTHON_PN}-asyncio-throttle \
> > >     ${PYTHON_PN}-profile \
> > > +        ${PYTHON_PN}-awesomeversion \
> > >   "
> > >
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#97157):
> > > https://lists.openembedded.org/g/openembedded-devel/message/97157
> > > Mute This Topic: https://lists.openembedded.org/mt/91182211/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-devel/unsub
> > > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

