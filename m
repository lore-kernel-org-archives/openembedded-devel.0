Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5031D5C0D6
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:13:33 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17344.1765872811384539546
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XuAxCzfJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-597c83bb5c2so3764788e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 00:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765872809; x=1766477609; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O9y9BSV3MTQ5iwUSJPSYsIxJ4256SoQxj20BdEZ31KQ=;
        b=XuAxCzfJDVnDYIzUqou9fZzG9yr08gnsXtGg70zm+Oxla/kwFbFF9nJOgZLicnMEJv
         vOAFDmwxioOKFUu1XXlRTJvahIEKOyQEcjfh/oO+UrDOhEJLEyRcROkJyjPHqsQ3rE7x
         HsX/1/ybAqdoJKLGJmrReuNofF14fUKq1y0qICWB0aEONm/RI1xi5sXOhmVil7EM2VrW
         pchu6LWFAioaN2z7HLbeI6LNuliLKpwXNCfJR5AVpb1UJ5a7S4R+AAxKEXhK1yYgFqmr
         IzuL3Ij0l8d+pSb+l7Az2NE/FYVCDf8+pzaE3DuXGrpS8KmClCrvIc2lTVLcm+53ylW6
         ZSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765872809; x=1766477609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9y9BSV3MTQ5iwUSJPSYsIxJ4256SoQxj20BdEZ31KQ=;
        b=U/8O6XhkW3sfwTmzP+ZFDI6Wc36dXmbgZ0hwv2L+gDfTuQsxB08OVnne5m/C5ns6Pp
         K+1iGDxjA00T4hEqAlTkWm4duDZuwp3gereTyAsLjYiqHSINxWY8T+0kJCirw45DreGQ
         nkCAigpQmA1e9Jjp3A8ws6Ma2T+OoO2IDC9UTkJspQ+mZdZjEjP9Ds5V/T480/+d4EMl
         wzONTHM2v4fI/majZZP2jm7vvaa4cDoJRcCP0Sq+XMolykV04HnZ8GyJfBJ/fqay+9/b
         abmJjdwVqsc97eiszy2tAubjalwx6ZQtLxJvCOdhiyloRMKQ3AuroNyyU6r01xAHJa7m
         556A==
X-Gm-Message-State: AOJu0YxwsQyDENvatblMD9+NjdQjB/v170CeZ2k+1R0XREx/CHRGAswT
	Ywvn494mcMqfpJa4MH/mhmn5IYbYiSdez1EeVrco58AZci4EuBCb+Om2dNSmJdTxEe0TqR0u2fB
	hGzSDwXqVct9RSUYwmeNtvGf0M77GZ6U=
X-Gm-Gg: AY/fxX49UX74sOtCztu55gz43RpoG0zlzDnQlVQL6qdVqQXSn9GamAUrV3lUnJ2VUG/
	hbMUeQ//HwQjCMqsT1nEElr2lPQToQ3sKelPMC8qB1R1fb/OoNfyFEnsCUSROwZbWJn+FjvDveg
	oZRun3ahQZKwpHttQSufu8ek3QOwXgUNF/ri7fpDQzi5qr7+jXEPQrXWRKkK3BRFpPCGBjMKhHD
	8fEFeriq9Hg7nwc6zGgUdEJXQnoaN6uHFY1fVVR3ITzHheTHSusQAS9VwMHiNO67eMtDKUNA7Ly
	N0X4i8MhRxHVE8PmyeTD9ieOLBkF
X-Google-Smtp-Source: AGHT+IEwvPpYAtLagEIf4dg3FbEPsiyd5CEB5l1Zdk9Q/mafFRH4I4HHmAKTkUFvyXUV0NtaZ0hS1Er2x36OBfm07KE=
X-Received: by 2002:a05:6512:3b11:b0:598:eacd:ceb5 with SMTP id
 2adb3069b0e04-598faa147b7mr4374491e87.17.1765872808853; Tue, 16 Dec 2025
 00:13:28 -0800 (PST)
MIME-Version: 1.0
References: <20251215225122.2243816-2-t.f.g.geelen@gmail.com>
 <20251215225122.2243816-3-t.f.g.geelen@gmail.com> <CAMSfU+7t_qYE5eWc+740kGZ=-XqG-08HN+vPL6foWncJZ9jjhw@mail.gmail.com>
In-Reply-To: <CAMSfU+7t_qYE5eWc+740kGZ=-XqG-08HN+vPL6foWncJZ9jjhw@mail.gmail.com>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Tue, 16 Dec 2025 09:13:16 +0100
X-Gm-Features: AQt7F2rX_92zult8PeJ9K0rmJHRDOvwgGt8jL077HBAiOlIiqJuV4uyNIS-gBB8
Message-ID: <CAJo0Az6Af7pearOg-U7bXd4Ga5NaQ248JEP2LcLqTa5K1_7zvw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-aiohttp: add BBCLASSEXTEND:
 native and nativesdk to the recipe
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007d849506460d4d34"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 08:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122688

--0000000000007d849506460d4d34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

No I must have missed this in sending it. I'll update this as well.

Regards

On Tue, Dec 16, 2025, 8:57=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr> =
wrote:

> Le lun. 15 d=C3=A9c. 2025 =C3=A0 23:51, Tom Geelen via lists.openembedded=
.org
> <t.f.g.geelen=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
> >
> > Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> > ---
> >  meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-aiohttp_3.13.2.bb b/meta-python/recipes-devtools/python/
> python3-aiohttp_3.13.2.bb
> > index ca188911c9..5419db3535 100644
> > --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
> > +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
> > @@ -23,3 +23,5 @@ RDEPENDS:${PN} =3D "\
> >  "
> >
> >  CFLAGS:append:toolchain-gcc:arm =3D " -flax-vector-conversions"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
>
> With this, I get
>  $ bitbake --dry-run python3-aiohttp-native nativesdk-python3-aiohttp -k
> Loading cache: 100%
>
> |########################################################################=
###########################################################################=
#######|
> Time: 0:00:00
> Loaded 5226 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'python3-async-timeout-native' (but
> virtual:native:.../meta-openembedded/meta-python/recipes-devtools/python/
> python3-aiohttp_3.13.2.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python3-async-timeout-native' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['python3-async-timeout-native']
> NOTE: Runtime target 'python3-aiohttp-native' is unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['python3-aiohttp-native', 'python3-async-timeout-native']
> NOTE: Runtime target 'python3-aiohttp-dev-native' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['python3-aiohttp-dev-native', 'python3-async-timeout-native']
> ERROR: Nothing RPROVIDES 'nativesdk-python3-async-timeout' (but
>
> virtual:nativesdk:.../meta-openembedded/meta-python/recipes-devtools/pyth=
on/
> python3-aiohttp_3.13.2.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'nativesdk-python3-async-timeout' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['nativesdk-python3-async-timeout']
> NOTE: Runtime target 'nativesdk-python3-aiohttp' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['nativesdk-python3-aiohttp', 'nativesdk-python3-async-timeout']
> ERROR: Nothing RPROVIDES 'nativesdk-python3-aiohttp-dev' (but
>
> virtual:nativesdk:.../meta-openembedded/meta-python/recipes-devtools/pyth=
on/
> python3-aiohttp_3.13.2.bb
> RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'nativesdk-python3-aiohttp-dev'
> NOTE: Runtime target 'nativesdk-python3-aiohttp-dev' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['nativesdk-python3-aiohttp-dev']
>
> Did I miss a python3-async-timeout update?
>
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#122671):
> https://lists.openembedded.org/g/openembedded-devel/message/122671
> > Mute This Topic: https://lists.openembedded.org/mt/116801466/4316185
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> yoann.congal@smile.fr]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Yoann Congal
> Smile ECS
>

--0000000000007d849506460d4d34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Yoann,<div dir=3D"auto"><br></div><div dir=3D"auto">No=
 I must have missed this in sending it. I&#39;ll update this as well.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Regards</div></div><br><div c=
lass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, Dec 16, 2025, 8:57=E2=80=AFAM Yoann Congal &lt;<a href=3D"mai=
lto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Le lun. 15 d=C3=A9c. 2025 =C3=A0 23:51, Tom Ge=
elen via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;t.f.g.geelen=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" targ=
et=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt; a=
 =C3=A9crit :<br>
&gt;<br>
&gt; Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">t.f.g.geelen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-python/recipes-devtools/python/<a href=3D"http://python3-ai=
ohttp_3.13.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-ai=
ohttp_3.13.2.bb</a> | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-aiohttp_3.13.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">pyt=
hon3-aiohttp_3.13.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D=
"http://python3-aiohttp_3.13.2.bb" rel=3D"noreferrer noreferrer" target=3D"=
_blank">python3-aiohttp_3.13.2.bb</a><br>
&gt; index ca188911c9..5419db3535 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-ai=
ohttp_3.13.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-ai=
ohttp_3.13.2.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-ai=
ohttp_3.13.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-ai=
ohttp_3.13.2.bb</a><br>
&gt; @@ -23,3 +23,5 @@ RDEPENDS:${PN} =3D &quot;\<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 CFLAGS:append:toolchain-gcc:arm =3D &quot; -flax-vector-conversi=
ons&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
With this, I get<br>
=C2=A0$ bitbake --dry-run python3-aiohttp-native nativesdk-python3-aiohttp =
-k<br>
Loading cache: 100%<br>
|##########################################################################=
###########################################################################=
#####|<br>
Time: 0:00:00<br>
Loaded 5226 entries from dependency cache.<br>
NOTE: Resolving any missing task queue dependencies<br>
ERROR: Nothing RPROVIDES &#39;python3-async-timeout-native&#39; (but<br>
virtual:native:.../meta-openembedded/meta-python/recipes-devtools/python/<a=
 href=3D"http://python3-aiohttp_3.13.2.bb" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">python3-aiohttp_3.13.2.bb</a><br>
RDEPENDS on or otherwise requires it)<br>
NOTE: Runtime target &#39;python3-async-timeout-native&#39; is unbuildable,=
 removing...<br>
Missing or unbuildable dependency chain was: [&#39;python3-async-timeout-na=
tive&#39;]<br>
NOTE: Runtime target &#39;python3-aiohttp-native&#39; is unbuildable, remov=
ing...<br>
Missing or unbuildable dependency chain was:<br>
[&#39;python3-aiohttp-native&#39;, &#39;python3-async-timeout-native&#39;]<=
br>
NOTE: Runtime target &#39;python3-aiohttp-dev-native&#39; is unbuildable, r=
emoving...<br>
Missing or unbuildable dependency chain was:<br>
[&#39;python3-aiohttp-dev-native&#39;, &#39;python3-async-timeout-native&#3=
9;]<br>
ERROR: Nothing RPROVIDES &#39;nativesdk-python3-async-timeout&#39; (but<br>
virtual:nativesdk:.../meta-openembedded/meta-python/recipes-devtools/python=
/<a href=3D"http://python3-aiohttp_3.13.2.bb" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">python3-aiohttp_3.13.2.bb</a><br>
RDEPENDS on or otherwise requires it)<br>
NOTE: Runtime target &#39;nativesdk-python3-async-timeout&#39; is unbuildab=
le,<br>
removing...<br>
Missing or unbuildable dependency chain was: [&#39;nativesdk-python3-async-=
timeout&#39;]<br>
NOTE: Runtime target &#39;nativesdk-python3-aiohttp&#39; is unbuildable, re=
moving...<br>
Missing or unbuildable dependency chain was:<br>
[&#39;nativesdk-python3-aiohttp&#39;, &#39;nativesdk-python3-async-timeout&=
#39;]<br>
ERROR: Nothing RPROVIDES &#39;nativesdk-python3-aiohttp-dev&#39; (but<br>
virtual:nativesdk:.../meta-openembedded/meta-python/recipes-devtools/python=
/<a href=3D"http://python3-aiohttp_3.13.2.bb" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">python3-aiohttp_3.13.2.bb</a><br>
RDEPENDS on or otherwise requires it)<br>
No eligible RPROVIDERs exist for &#39;nativesdk-python3-aiohttp-dev&#39;<br=
>
NOTE: Runtime target &#39;nativesdk-python3-aiohttp-dev&#39; is unbuildable=
, removing...<br>
Missing or unbuildable dependency chain was: [&#39;nativesdk-python3-aiohtt=
p-dev&#39;]<br>
<br>
Did I miss a python3-async-timeout update?<br>
<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#122671): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/122671" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/122=
671</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11680146=
6/4316185" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/116801466/4316185</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.co=
ngal@smile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</=
a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
</blockquote></div>

--0000000000007d849506460d4d34--

