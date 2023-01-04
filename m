Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFF2C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 18:09:44 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.20337.1672855774959660184
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 10:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gcmpgAVc;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id p2so20699480ljn.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 10:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eDF0eQqv82H2KekpkZH9O4riC3E5uOUNndpieEru5Oc=;
        b=gcmpgAVcoIsOldSrKBbFEsQx9V5iAWIgY1GHtpDU81/K8qkeIOOg7NxUgUZZHGDwLm
         RpI/YIhfFy6Q6G1PIsRRKa+Sy5LF4WJ9c4LL54nht2WHqezJ6mGDSQLuLPxaOVTp81g7
         swLtKDG7RypWPwBNFPQcRhqPihHc4rc6cbhwYu9zLwuXm/JOomn6ZABfi5AVbFMedTEE
         8xB1JMOKj4F4J3bgMpFPkkX/quzTAajtFw+zoKUcjitHlJbl4FfkabqaGe8RsCvHtuZC
         Ah7zm4wEHQ2cG55c/gW0qxGAveX3kQpXz7V0p810u6QOVWeL+XZjPU+ZXwZKccWtHC/o
         72HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDF0eQqv82H2KekpkZH9O4riC3E5uOUNndpieEru5Oc=;
        b=LbSmyQIm9gn7ZaJE/WBOb73TDxr1/YWR3Ljwd/ifNu76aBeMMEQdC4SMNKOOhcpS98
         eAMjdFSkwBXfl4A6RxgeJSp/k93RfGqd1IlgBriB7BSwr2tOs6PWpuEfhwmNU3L2eWKZ
         YUnW3oqf4r0OA+UqymR5bhcfVHgx5Zq525EE+OagZ0PjK/ZUuTWmKhimamQgAU7a12xq
         jLdH1cS3Y7XGC8bYyjqgrYYojPSJedWL6xh6V3b0VNwW4Cx0/NfVmgzOf5CPw8A+/GVb
         m5OhwPaGffbWjWzFwAXnfB46TTFWAG0k6E5RwInZI3QztVsfNcXfBjk7nTi6T4CiZzhf
         ml9g==
X-Gm-Message-State: AFqh2kqiNzHqkI0oBnM8fJL2HlaydnF5+QCjIFOCjRRgKZYBIJFa3r1V
	Y0uYvvU2Mjf1iXurBI6RldzdIrG+vM6Q3yFxvpM=
X-Google-Smtp-Source: AMrXdXuTWmWVzyiZjH3SReF2XSWsCi8CqZY048nnKCMaqjv/wD5MjuUMVEPHSoRsdv4q5GCm1tbOEGAg3BhDa9m6M8M=
X-Received: by 2002:a2e:a4b3:0:b0:27f:ed42:72c5 with SMTP id
 g19-20020a2ea4b3000000b0027fed4272c5mr1035411ljm.217.1672855772764; Wed, 04
 Jan 2023 10:09:32 -0800 (PST)
MIME-Version: 1.0
References: <20230104112157.2537461-1-alex@linutronix.de> <CAMKF1sr8vfyye2mNQMeZ-F3zymftt1zsM7tn-Dt=eT8sweRZOA@mail.gmail.com>
In-Reply-To: <CAMKF1sr8vfyye2mNQMeZ-F3zymftt1zsM7tn-Dt=eT8sweRZOA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Jan 2023 19:09:21 +0100
Message-ID: <CANNYZj92uX2WYu=BqbYZqAZETPb+nToWFBvxNiaQWyYCdMZAEA@mail.gmail.com>
Subject: Re: [oe] [PATCH] packagegroup-meta-python: drop python3-strict-rfc3339
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000018a15905f17416f9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 18:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100400

--00000000000018a15905f17416f9
Content-Type: text/plain; charset="UTF-8"

No, jsonschema is fixed to not use the removed recipe. I sent a gigantic
patchset to core a few hours ago with all that.

Alex

On Wed 4. Jan 2023 at 18.00, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Jan 4, 2023 at 3:22 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > This has been unmaintained, not needed by anything and is now
> > removed from oe-core.
>
> There is also python3-jsonschema in this packagegroup which depends on
> python3-strict-rfc3339
> perhaps that needs to go as well ?
>
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> > index 4e318967d..2275ccd6c 100644
> > --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> > +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> > @@ -414,7 +414,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
> >      python3-sqlparse \
> >      python3-sqlsoup \
> >      python3-stevedore \
> > -    python3-strict-rfc3339 \
> >      python3-supervisor \
> >      python3-sympy \
> >      python3-tabulate \
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#100397):
> https://lists.openembedded.org/g/openembedded-devel/message/100397
> > Mute This Topic: https://lists.openembedded.org/mt/96048124/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000018a15905f17416f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">No, jsonschema is fixed to not use the removed recipe. I =
sent a gigantic patchset to core a few hours ago with all that.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 4. Jan 2023 at 18.0=
0, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)">On Wed, Jan 4, 2023 at 3:22 AM Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank=
">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This has been unmaintained, not needed by anything and is now<br>
&gt; removed from oe-core.<br>
<br>
There is also python3-jsonschema in this packagegroup which depends on<br>
python3-strict-rfc3339<br>
perhaps that needs to go as well ?<br>
<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-core/packagegroups/<a href=3D"http://packagegroup-me=
ta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-python=
.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 1 file changed, 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"http://=
packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegr=
oup-meta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a href=3D"=
http://packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">pa=
ckagegroup-meta-python.bb</a><br>
&gt; index 4e318967d..2275ccd6c 100644<br>
&gt; --- a/meta-python/recipes-core/packagegroups/<a href=3D"http://package=
group-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-met=
a-python.bb</a><br>
&gt; +++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://package=
group-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-met=
a-python.bb</a><br>
&gt; @@ -414,7 +414,6 @@ RDEPENDS:packagegroup-meta-python3 =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-sqlparse \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-sqlsoup \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-stevedore \<br>
&gt; -=C2=A0 =C2=A0 python3-strict-rfc3339 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-supervisor \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-sympy \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-tabulate \<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#100397): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/100397" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/100397</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96048124=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/96048124/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--00000000000018a15905f17416f9--

