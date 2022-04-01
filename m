Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5418C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 05:59:47 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.7319.1648792787132026477
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 22:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cSuWZgty;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id p25so1326640qkj.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 22:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CZctSnA2Wt52SCvyby8c2KHiIWZnRIhvDp0SXb2pOWk=;
        b=cSuWZgtyyXzAMUPj2CpOWDmmyXHiiH8RmCXc96WuqZb24QwFpWGZD22QT9ODowIU11
         V+jekPbexQzK3VHCGismb+oivJvIva7BmcjY31VLS14dJZMAp90TJRfq8jxcBWXBVn/a
         dmEDpU4rWhqw4NeanPh09PxFi4ZEcXGsg7ablV8ACHNh1tnXP+4XTiaVKSb2p/1cc26y
         AeDnOPzioBg9AV1XT1JlZvSArlubc8Xjak+A2kLJ5PYi3mWGATkRhwiyuBL7e4i6FHyL
         t4F+XviQRoE9WUFJ2rdX/8t9ct/UsQFJa/WOymz6itYmXO7SjMQCLoMsAJq8QOsMHXq9
         eAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CZctSnA2Wt52SCvyby8c2KHiIWZnRIhvDp0SXb2pOWk=;
        b=023xUA06+Kdf+6r/B+nY7ups/92AjD5QuKXwidzYxwGJbcZHdRCSXj1xPQKKeUHl4h
         WuliIbVf7LqJdFCGf30jppnCUlHywF2GTH8RpGGumMbDCrjv0jcqdFtUC5Cq/T6QDLOT
         RCg1fqqDP+W7cxTElKG8ljD62G5DoAQjwK4g801eRYdeVA7Zy3LMl1PRS3eIiyguaoRc
         iBN+P2a56n3VLIjXn25yGgqj6v7Idm+pkLKj1Ih9QzVA1f0Bnzl8MDx/b0YumKkyMCrM
         kt9ftb9mArfnPmnMpUmD1uGBpX0nuVTDF04RbO/+/clvK8KFra5amq/PGjA8pFeEDyeF
         28TA==
X-Gm-Message-State: AOAM531hijDKa46v4mU0WbSumJ9yaSp5ATvTljmZ3+OtbYcEUCBGCOOO
	TDmOTSdsCdKHypsmuzaXZheUWp3MXZGYBNO3Dfo=
X-Google-Smtp-Source: 
 ABdhPJwuwX5oDC+aBlBC8wco6a8Btgwsj5Whytky+VYZLmOrW3Zh5VkQtD7maI7qhgUOEw1CABJ231rBBQIDDt/afIY=
X-Received: by 2002:a05:620a:460e:b0:680:9d1c:2493 with SMTP id
 br14-20020a05620a460e00b006809d1c2493mr5603142qkb.227.1648792786087; Thu, 31
 Mar 2022 22:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220401042203.1491670-1-raj.khem@gmail.com>
 <CALbNGRSU2DQOkEc9-H=Q2Kgo4JYxoAdoHqQT216oR9d6JX5oew@mail.gmail.com>
In-Reply-To: 
 <CALbNGRSU2DQOkEc9-H=Q2Kgo4JYxoAdoHqQT216oR9d6JX5oew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2022 22:59:35 -0700
Message-ID: 
 <CAMKF1squxgUVG9n0QAzB+OA7BcqiLzJENU=05jUiKJS=LVfDYg@mail.gmail.com>
Subject: Re: [meta-gnome][PATCH] gnome-commander: Fix build with clang
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000052b2fb05db917c8f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Apr 2022 05:59:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96322

--00000000000052b2fb05db917c8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, it does.

On Thu, Mar 31, 2022 at 10:36 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
wrote:

> On Fri, Apr 1, 2022 at 6:22 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Add a patch to fix it while glib-2.0 is resolving the issue
> Thanks for this. Does this build for clang/gnu? I had thought that the
> glib2/atomic issue was not the only one...
>
> Andreas
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>

--00000000000052b2fb05db917c8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Yes, it does.</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, Mar 31, 2022 at 10:36 PM Andreas M=C3=BCller=
 &lt;<a href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1e=
x;border-left-color:rgb(204,204,204)">On Fri, Apr 1, 2022 at 6:22 AM Khem R=
aj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gma=
il.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add a patch to fix it while glib-2.0 is resolving the issue<br>
Thanks for this. Does this build for clang/gnu? I had thought that the<br>
glib2/atomic issue was not the only one...<br>
<br>
Andreas<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Cc: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmail.com"=
 target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
</blockquote></div></div>

--00000000000052b2fb05db917c8f--

