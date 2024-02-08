Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1CEC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 11:18:56 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.15496.1707391136264611884
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 03:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=F0tn/269;
 spf=pass (domain: smile.fr, ip: 209.85.218.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a34c5ca2537so227770666b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 03:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707391135; x=1707995935; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6qmV1MZ7XM8dv+20cEzx4ChIEoNUtyoCGQUfMx6hyhI=;
        b=F0tn/269A0R6XOhCcOcvOfwDyZIQE9+8mI5Jw0QnnZ4mKXNHpcqI1vRt7heHWrtBuV
         aua0swd/Z3GnddNMEAHNfDlPpmeWW5rJG7wZTCFj+Q063s5F1Z0KgwW2/jHDPCulabyM
         KgdCs/qNigwPsJInFiFgsAPYk3sAxWTaCHjVLOrDNb9hsIfYjRScJxAg0BIjbswL7lj+
         JhKqf0vr1b6FrUqH43w6mJqGtj6qhMGuUCEmepYVLIuHvDUXEheTZ2WyJcV4vRytnbk9
         0BxhF5E26aB5n005UEtdDeAR8ZkT8L4UOInoTeGirQi7UK0Lm0CuOA9Ojr4vY9L41zIU
         DZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707391135; x=1707995935;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6qmV1MZ7XM8dv+20cEzx4ChIEoNUtyoCGQUfMx6hyhI=;
        b=aaNxPLW0gfrPcW2I0W8svx9KgTxv1owqhYAOed9eqo2NV4lxTFK1SiSWgC1o/qeuYN
         P17LpIpts9v4MRVdytikCePr3yxMzXW/3B/KIXPMc0TnaBtEiwWNkAAZF5t7aIbGxaso
         9WtS2o/3bhOZMbpoPrUjhpeECE7H4IZpvDdFHYSPtEj32/aQgXpPQ9avvn00D0+N1EYX
         LbnimR4s/aqdEwgUu04xnOSYTsX6FgMazOA6101NWQMosYAT4Io2j0AdcJGBxuRX+feL
         duNuEA9002nU6xO0qfBY8ZqnXrqHp8Dj1fe3qYND18ArCc9csmX4wIVc4gxQw6oXhT9D
         2M2w==
X-Forwarded-Encrypted: i=1; AJvYcCU3OaC45CI5VHhgGk6LDXHhvptRXT07EWuGA7lcJTYTJohdwv53HQYtLzJfNlK3LQsbZtcNTFH2ih0XjtmpZbwo8i3VcPH7b+RDevCx3915TeKviGWchZS4zQ==
X-Gm-Message-State: AOJu0Yxcp6Y65QzYEb5QQzOa6y0M+l59bt+1icTY/w7KtPuIFFGdPk4p
	QjNc5med34DUPHlqPckZIAVLOdrs/w7RfYr8q51WGeaVz9sQVtHkwE4I7/hL+HPWdDUy4plt4Dd
	9dDbJfiVxxB2oY7FvYVZd3HGPvx4B9Zlu3Ej59D3fEgzG2ITLXwYuFA==
X-Google-Smtp-Source: AGHT+IEgSDgcfguV0wYe2s1851JtxyUnuYprK/i7I+sp5FJRPLZmDeLM9uXx9uVLRg3TQOSTc/u7mTTrvBu2Ea7Cuus=
X-Received: by 2002:a17:907:75e1:b0:a27:6570:adbc with SMTP id
 jz1-20020a17090775e100b00a276570adbcmr6486641ejc.33.1707391134704; Thu, 08
 Feb 2024 03:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20240129062328.1689458-1-li.wang@windriver.com> <7d95b6d4-12bc-4f00-a391-b9c31d19e818@smile.fr>
In-Reply-To: <7d95b6d4-12bc-4f00-a391-b9c31d19e818@smile.fr>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Thu, 8 Feb 2024 12:18:28 +0100
Message-ID: <CAMSfU+6_ek0pc2yRmSw4Ny3B=7gANf_MT8VRkGODf+-Yp3JzYA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] radvd: add '--shell
 /sbin/nologin' to /etc/passwd
To: li.wang@windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000013b8510610dcfa96"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 11:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108663

--00000000000013b8510610dcfa96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 29 janv. 2024 =C3=A0 09:07, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

> Hi,
>
> Le 29/01/2024 =C3=A0 07:23, Li Wang via lists.openembedded.org a =C3=A9cr=
it :
> > the default setting USERADD_PARAM of yocto:
> > -s /bin/sh
> >
> > follow redhat policy:
> > radvd/redhat/systemd/radvd.spec
> >   useradd ... -s /sbin/nologin ...
> >
> > Signed-off-by: Li Wang <li.wang@windriver.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Can this fix this error from autobuilder by any chance?
>   stdio: ERROR: radvd-2.19-r0 do_prepare_recipe_sysroot: radvd: useradd
> command did not succeed.
>   stdio: ERROR: radvd-2.19-r0 do_prepare_recipe_sysroot:
> ExecutionError('/home/pokybuild/yocto-worker/reproducible-meta-oe/build/b=
uild/build-st-meta-networking/build-st/reproducibleA/tmp/work/core2-64-poky=
-linux/radvd/2.19/temp/run.useradd_sysroot.818430',
> 1, None, None)
>
> Link :
> https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/9/step=
s/29/logs/errors


FWIW, this was an unrelated problem for which I've sent a patch:
[meta-networking][PATCH] radvd: Fix build in reproducible test
https://lists.openembedded.org/g/openembedded-devel/message/108662

Regards,


>
> Thanks!
>
> > ---
> >  meta-networking/recipes-daemons/radvd/radvd.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc
> b/meta-networking/recipes-daemons/radvd/radvd.inc
> > index 219d88f49..5da31b3f0 100644
> > --- a/meta-networking/recipes-daemons/radvd/radvd.inc
> > +++ b/meta-networking/recipes-daemons/radvd/radvd.inc
> > @@ -59,7 +59,7 @@ do_install:append () {
> >
> >  USERADD_PACKAGES =3D "${PN}"
> >  GROUPADD_PARAM:${PN} =3D "--system nogroup"
> > -USERADD_PARAM:${PN} =3D "--system --home ${localstatedir}/run/radvd/ -=
M
> -g nogroup radvd"
> > +USERADD_PARAM:${PN} =3D "--system --home ${localstatedir}/run/radvd/ -=
M
> -g nogroup --shell /sbin/nologin radvd"
> >
> >  pkg_postinst:${PN} () {
> >      if [ -z "$D" -a -x /etc/init.d/populate-volatile.sh ]; then
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#108480):
> https://lists.openembedded.org/g/openembedded-devel/message/108480
> > Mute This Topic: https://lists.openembedded.org/mt/104026959/4316185
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> yoann.congal@smile.fr]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Yoann Congal
> Smile ECS - Tech Expert
>


--=20
Yoann Congal
Smile ECS - Tech expert

--00000000000013b8510610dcfa96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 29 janv. 2024 =C3=A0=C2=
=A009:07, Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.c=
ongal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hi,<br>
<br>
Le 29/01/2024 =C3=A0 07:23, Li Wang via <a href=3D"http://lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> a =
=C3=A9crit=C2=A0:<br>
&gt; the default setting USERADD_PARAM of yocto:<br>
&gt; -s /bin/sh<br>
&gt; <br>
&gt; follow redhat policy:<br>
&gt; radvd/redhat/systemd/radvd.spec<br>
&gt;=C2=A0 =C2=A0useradd ... -s /sbin/nologin ...<br>
&gt; <br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:li.wang@windriver.com" ta=
rget=3D"_blank">li.wang@windriver.com</a>&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<br>
Can this fix this error from autobuilder by any chance?<br>
=C2=A0 stdio: ERROR: radvd-2.19-r0 do_prepare_recipe_sysroot: radvd: userad=
d command did not succeed.<br>
=C2=A0 stdio: ERROR: radvd-2.19-r0 do_prepare_recipe_sysroot: ExecutionErro=
r(&#39;/home/pokybuild/yocto-worker/reproducible-meta-oe/build/build/build-=
st-meta-networking/build-st/reproducibleA/tmp/work/core2-64-poky-linux/radv=
d/2.19/temp/run.useradd_sysroot.818430&#39;, 1, None, None)<br>
<br>
Link : <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/1=
55/builds/9/steps/29/logs/errors" rel=3D"noreferrer" target=3D"_blank">http=
s://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/9/steps/29/l=
ogs/errors</a></blockquote><div><br></div><div>FWIW, this was an unrelated =
problem for which I&#39;ve sent a patch:</div><div>[meta-networking][PATCH]=
 radvd: Fix build in reproducible test<br><a href=3D"https://lists.openembe=
dded.org/g/openembedded-devel/message/108662">https://lists.openembedded.or=
g/g/openembedded-devel/message/108662</a></div><div><br></div><div>Regards,=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
Thanks!<br>
<br>
&gt; ---<br>
&gt;=C2=A0 meta-networking/recipes-daemons/radvd/radvd.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-ne=
tworking/recipes-daemons/radvd/radvd.inc<br>
&gt; index 219d88f49..5da31b3f0 100644<br>
&gt; --- a/meta-networking/recipes-daemons/radvd/radvd.inc<br>
&gt; +++ b/meta-networking/recipes-daemons/radvd/radvd.inc<br>
&gt; @@ -59,7 +59,7 @@ do_install:append () {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
&gt;=C2=A0 GROUPADD_PARAM:${PN} =3D &quot;--system nogroup&quot;<br>
&gt; -USERADD_PARAM:${PN} =3D &quot;--system --home ${localstatedir}/run/ra=
dvd/ -M -g nogroup radvd&quot;<br>
&gt; +USERADD_PARAM:${PN} =3D &quot;--system --home ${localstatedir}/run/ra=
dvd/ -M -g nogroup --shell /sbin/nologin radvd&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 pkg_postinst:${PN} () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$D&quot; -a -x /etc/init.d/populate-=
volatile.sh ]; then<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#108480): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/108480" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/108480</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10402695=
9/4316185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/104026959/4316185</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.=
fr" target=3D"_blank">yoann.congal@smile.fr</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS - Tech Expert<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--00000000000013b8510610dcfa96--

