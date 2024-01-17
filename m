Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61044C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 16:20:30 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.7261.1705508421088353377
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 08:20:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=RSMUiNfy;
 spf=pass (domain: smile.fr, ip: 209.85.208.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-553ba2f0c8fso12601574a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 08:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705508419; x=1706113219; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0WwZGyRYB9vqQatMT56Ub/wRInL0tvx1FMbvCMBE7Sc=;
        b=RSMUiNfylHRfAwoXAg50UqUfjPm3s1eR0qH80v+tETm5wdhOQpW9p/QZMSWXX608zH
         juIsx04VcfOYZkYjDMGmgTAqh0MvCxUbV99hl20+d1yUD+VU3kBCTAGOKVRKO1DJmI96
         YTX/4gNcmxaDu6dGjW00n9Z92OpcBf6HmPSx27+aSEyOLyGUT9S/bcZyeiiHNymUi5Q0
         ympXRfWSk3JipwP9vHoIAfTJGe6faDg7xi4iHdMO5bQcJHhIrG5PY1fcky6XFV3aDY7Y
         iC78hFgKqhlg0mf5h3UWnSXdB/eG65dC/41avnYO3Ku+jahBYoBbcSQfDHs9HQW8j3CF
         9wXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705508419; x=1706113219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WwZGyRYB9vqQatMT56Ub/wRInL0tvx1FMbvCMBE7Sc=;
        b=AVAsSMmH4n6QtBj0lRrx4iaqQyit2HuYWPcdF6g3lcd96G/Tn2Lb4/NPDbfeAd0exa
         nFH2RZ00VUkimkfCFI+QwlYNN9itVlfCxseBmRPFoOq75XMM2OgDv0LDGF9RXjFJCZZ3
         8VlbncUNFJeCw5lReti4oUP6AqPK5b5J37orgl0s7OC/9UlmIwv0qnCLtOSvZhZk7u3+
         QmWyvZPQtD4Vu/Ny1TpO6HX847uBncG/k2Z/5aVa3eV9xYDtV36R0w7p6lOnED05Y9dg
         14D27aCs4xHA8FIzIOpznUiIg5fh+mJ9w6Q4tugBakeCbz1pThTcyQkExxca8i1TwNu3
         Jy2g==
X-Gm-Message-State: AOJu0Yxu+5aDhYs1YqL4aJrxHIfRKvEyt41zq80qK8Q4NfMQhd2X89xO
	Fauqrbk1mcX/b/EdPofpXbP9eaxdSs1uQY8sftutlY25XJ64yA==
X-Google-Smtp-Source: AGHT+IFEt/M/6j67k15TMmx24OXTDpSHsJ/abqHIxdDimlnlb//Mejxf5pVK4LhRaSVQV0GR8/q5Y7GdCKjS3Ddgyvk=
X-Received: by 2002:a17:906:b758:b0:a2e:998b:775 with SMTP id
 fx24-20020a170906b75800b00a2e998b0775mr630526ejb.5.1705508419270; Wed, 17 Jan
 2024 08:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20240117082519.3037503-1-yoann.congal@smile.fr> <CAMKF1sqNjnpWcV8HTwnQiytkN5QJAufAgOv+zA1vvvh-+mF5MA@mail.gmail.com>
In-Reply-To: <CAMKF1sqNjnpWcV8HTwnQiytkN5QJAufAgOv+zA1vvvh-+mF5MA@mail.gmail.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Wed, 17 Jan 2024 17:20:06 +0100
Message-ID: <CAMSfU+5_3qkFXTAEMNvX3ewEKXcSto+xZcjqVMzHyuKwgD679Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pytest-cov: Remove unbuildable BBCLASSEXTENDs
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Richard Leitner <dev@g0hl1n.net>
Content-Type: multipart/alternative; boundary="0000000000007e0c4e060f269f46"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 16:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108334

--0000000000007e0c4e060f269f46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 17 janv. 2024 =C3=A0 16:26, Khem Raj <raj.khem@gmail.com> a =C3=A9c=
rit :

> how about we add
>
> BBCLASSEXTEND =3D "native nativesdk"
>
> to meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb


Sure! ... But I have no idea how to test it.
Do we really care about pytest-cov in native environments? If yes, I'll
look into it.


On Wed, Jan 17, 2024 at 12:26=E2=80=AFAM Yoann Congal <yoann.congal@smile.f=
r> wrote:
> >
> > Since the python3-coverage dependency has neither native nor nativesdk
> > BBCLASSEXTEND, remove these to avoid triggering warnings on universe
> > builds.
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> > CC: Richard Leitner <dev@g0hl1n.net>
> > This is related to this ML thread:
> https://lists.openembedded.org/g/openembedded-devel/topic/103499188#10830=
5
> > ---
> >  meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-cov_4.1.0.bb b/meta-python/recipes-devtools/python/
> python3-pytest-cov_4.1.0.bb
> > index 3a68011f4..2591539ec 100644
> > --- a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
> > @@ -11,5 +11,3 @@ inherit pypi setuptools3
> >
> >  DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
> >  RDEPENDS:${PN} +=3D "python3-coverage"
> > -
> > -BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#108324):
> https://lists.openembedded.org/g/openembedded-devel/message/108324
> > Mute This Topic: https://lists.openembedded.org/mt/103782092/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >


--
Yoann Congal - Smile ECS

>

--0000000000007e0c4e060f269f46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Le mer. 17 janv. 2024 =C3=A0 16:26, Khe=
m Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; =
a =C3=A9crit=C2=A0:<br></div><div class=3D"gmail_quote" dir=3D"auto"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">how about we add<br>
<br>
BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
to meta-python/recipes-devtools/python/<a href=3D"http://python3-coverage_7=
.4.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-coverage_7=
.4.0.bb</a></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Sure! ... But I have no idea how to test it.=C2=A0</div><div dir=3D"auto">=
Do we really care about pytest-cov in native environments? If yes, I&#39;ll=
 look into it.<br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br><=
/div><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
On Wed, Jan 17, 2024 at 12:26=E2=80=AFAM Yoann Congal &lt;<a href=3D"mailto=
:yoann.congal@smile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@s=
mile.fr</a>&gt; wrote:<br>
&gt;<br>
&gt; Since the python3-coverage dependency has neither native nor nativesdk=
<br>
&gt; BBCLASSEXTEND, remove these to avoid triggering warnings on universe<b=
r>
&gt; builds.<br>
&gt;<br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt; CC: Richard Leitner &lt;<a href=3D"mailto:dev@g0hl1n.net" target=3D"_b=
lank" rel=3D"noreferrer">dev@g0hl1n.net</a>&gt;<br>
&gt; This is related to this ML thread: <a href=3D"https://lists.openembedd=
ed.org/g/openembedded-devel/topic/103499188#108305" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://lists.openembedded.org/g/openembedded-deve=
l/topic/103499188#108305</a><br>
&gt; ---<br>
&gt;=C2=A0 meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
test-cov_4.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-=
pytest-cov_4.1.0.bb</a> | 2 --<br>
&gt;=C2=A0 1 file changed, 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pytest-cov_4.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">p=
ython3-pytest-cov_4.1.0.bb</a> b/meta-python/recipes-devtools/python/<a hre=
f=3D"http://python3-pytest-cov_4.1.0.bb" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">python3-pytest-cov_4.1.0.bb</a><br>
&gt; index 3a68011f4..2591539ec 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
test-cov_4.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-=
pytest-cov_4.1.0.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
test-cov_4.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-=
pytest-cov_4.1.0.bb</a><br>
&gt; @@ -11,5 +11,3 @@ inherit pypi setuptools3<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;${PYTHON_PN}-setuptools-scm-native&quot;<br>
&gt;=C2=A0 RDEPENDS:${PN} +=3D &quot;python3-coverage&quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.39.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#108324): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/108324" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/108=
324</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10378209=
2/1997914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/103782092/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br=
>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;</blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">--</di=
v><div dir=3D"auto">Yoann Congal - Smile ECS</div><div class=3D"gmail_quote=
" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div>

--0000000000007e0c4e060f269f46--

