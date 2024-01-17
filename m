Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CFFC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 16:31:40 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.7461.1705509100008985509
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 08:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jfXj2qFq;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2107f19e331so928417fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 08:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705509099; x=1706113899; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xKX1PUJ1AxVYUzxPm7B1xtUJUJMBTp0FWeFGYmDhr5o=;
        b=jfXj2qFqHwxoBYy9FZGYH2NImN98SZ2ftcB3TgNHIL8p38s+YYOWSgkPttJBBIGwX9
         zVViTtt2BGQvhpKILBRbgxw/CCTOO6jVqE6uC8kMhFjs60quj6rA/lHwDiPZVSCbGSD7
         UUk0m5DJrtI6Tx76ankEJMf6WLJ5EDCNpB6Tg/h5hYGfzozTy3nTXq/mA9eSKir10/A5
         XSmcM6danOFX5rSKUHe7foiiRn0+thMOVd5svnBvJr2vitD8AepFl9B43VqAbVJF7ylV
         VtGM2n82Km9SCJtTJzOXs2nFFHBM1RB100Z61KWIPjfBNXtYL/zdmaxBbucCIrxBuO1h
         rvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705509099; x=1706113899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKX1PUJ1AxVYUzxPm7B1xtUJUJMBTp0FWeFGYmDhr5o=;
        b=OKHYZI1Jloc8KxZa88FxBVEG41mpkCjMxlqCblgxPSUBrQluDb3c0OldXYekPaCk1k
         Wx8a1/gk4GnMacV5txZALGLNEL3cB8gJ6Nh0Bvjr1adjHcMmxF0EC/Oo3IVehsa5Drbu
         PgTBXEtPZR+bT7073f2r3b8eIjLisG9fHCGC8g4aWoqjJQXoP1DMAG8d8eKLMXVmhCX9
         91D2EjNYGGkgKk612UlppTxDPbRfH9CU/dch6gppyhVC9qCT73HvDx6EgNzoEvAPBiu/
         ev2z+kNwh/ov1khkpQ6AU5OWHvVon7uo+mnXxr80ArK8gaE/QbF0vxGdEMSTCs/Tb33q
         mIxQ==
X-Gm-Message-State: AOJu0Yw4iQT2DjznhMmNR+0xsyMpc5GCpECTRBMqChfmmqBIWyL636a2
	5ouBeozCs99hPvX0qltBDADN3pn07cmvZ0gkuM4=
X-Google-Smtp-Source: AGHT+IFrXXeY7bv8EkJ85ZC6QFOn4HNBu01eTcp04XG3Ml+pJVGwt/jK835XYrsP1sG5Nr7OqjH7fm+hyF6dDuzufCw=
X-Received: by 2002:a05:6871:aa15:b0:206:b32f:2432 with SMTP id
 wq21-20020a056871aa1500b00206b32f2432mr9713781oab.90.1705509099148; Wed, 17
 Jan 2024 08:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20240117082519.3037503-1-yoann.congal@smile.fr>
 <CAMKF1sqNjnpWcV8HTwnQiytkN5QJAufAgOv+zA1vvvh-+mF5MA@mail.gmail.com> <CAMSfU+5_3qkFXTAEMNvX3ewEKXcSto+xZcjqVMzHyuKwgD679Q@mail.gmail.com>
In-Reply-To: <CAMSfU+5_3qkFXTAEMNvX3ewEKXcSto+xZcjqVMzHyuKwgD679Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Jan 2024 08:31:28 -0800
Message-ID: <CAMKF1sog9N5XQyZoD3eEaDLyK8F20DbQkrBP82Eks3XtdZo55w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pytest-cov: Remove unbuildable BBCLASSEXTENDs
To: Yoann CONGAL <yoann.congal@smile.fr>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Richard Leitner <dev@g0hl1n.net>
Content-Type: multipart/alternative; boundary="0000000000000417f9060f26c8d8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 16:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108335

--0000000000000417f9060f26c8d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 8:20=E2=80=AFAM Yoann CONGAL <yoann.congal@smile.fr=
> wrote:

> Le mer. 17 janv. 2024 =C3=A0 16:26, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
>
>> how about we add
>>
>> BBCLASSEXTEND =3D "native nativesdk"
>>
>> to meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb
>
>
> Sure! ... But I have no idea how to test it.
> Do we really care about pytest-cov in native environments? If yes, I'll
> look into it.
>

Since the native extends existed before it gained the extra dependency on
coverage package it=E2=80=99s possible that there is a use of it already in=
 place

>
>
> On Wed, Jan 17, 2024 at 12:26=E2=80=AFAM Yoann Congal <yoann.congal@smile=
.fr>
>> wrote:
>> >
>> > Since the python3-coverage dependency has neither native nor nativesdk
>> > BBCLASSEXTEND, remove these to avoid triggering warnings on universe
>> > builds.
>> >
>> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> > ---
>> > CC: Richard Leitner <dev@g0hl1n.net>
>> > This is related to this ML thread:
>> https://lists.openembedded.org/g/openembedded-devel/topic/103499188#1083=
05
>> > ---
>> >  meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb | 2 -=
-
>> >  1 file changed, 2 deletions(-)
>> >
>> > diff --git a/meta-python/recipes-devtools/python/
>> python3-pytest-cov_4.1.0.bb b/meta-python/recipes-devtools/python/
>> python3-pytest-cov_4.1.0.bb
>> > index 3a68011f4..2591539ec 100644
>> > --- a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
>> > +++ b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
>> > @@ -11,5 +11,3 @@ inherit pypi setuptools3
>> >
>> >  DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
>> >  RDEPENDS:${PN} +=3D "python3-coverage"
>> > -
>> > -BBCLASSEXTEND =3D "native nativesdk"
>> > --
>> > 2.39.2
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#108324):
>> https://lists.openembedded.org/g/openembedded-devel/message/108324
>> > Mute This Topic: https://lists.openembedded.org/mt/103782092/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
>> [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>
>
> --
> Yoann Congal - Smile ECS
>
>>

--0000000000000417f9060f26c8d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jan 17, 2024 at 8:20=E2=80=AFAM Yoann CONGAL &lt;<a=
 href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto=
">Le mer. 17 janv. 2024 =C3=A0 16:26, Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">how about we add<br>
<br>
BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
to meta-python/recipes-devtools/python/<a href=3D"http://python3-coverage_7=
.4.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-coverage_7=
.4.0.bb</a></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Sure! ... But I have no idea how to test it.=C2=A0</div><div dir=3D"auto">=
Do we really care about pytest-cov in native environments? If yes, I&#39;ll=
 look into it.<br></div></div><div dir=3D"auto"><div dir=3D"auto"></div></d=
iv></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Since the nat=
ive extends existed before it gained the extra dependency on coverage packa=
ge it=E2=80=99s possible that there is a use of it already in place=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><br></div><div class=3D"gmail_quote" dir=3D"auto"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
On Wed, Jan 17, 2024 at 12:26=E2=80=AFAM Yoann Congal &lt;<a href=3D"mailto=
:yoann.congal@smile.fr" rel=3D"noreferrer" target=3D"_blank">yoann.congal@s=
mile.fr</a>&gt; wrote:<br>
&gt;<br>
&gt; Since the python3-coverage dependency has neither native nor nativesdk=
<br>
&gt; BBCLASSEXTEND, remove these to avoid triggering warnings on universe<b=
r>
&gt; builds.<br>
&gt;<br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" rel=3D"noreferrer" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt; CC: Richard Leitner &lt;<a href=3D"mailto:dev@g0hl1n.net" rel=3D"noref=
errer" target=3D"_blank">dev@g0hl1n.net</a>&gt;<br>
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
bedded.org" rel=3D"noreferrer" target=3D"_blank">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem=
@gmail.com" rel=3D"noreferrer" target=3D"_blank">raj.khem@gmail.com</a>]<br=
>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;</blockquote></div><div dir=3D"auto"><br></div></div><div dir=3D"auto">=
<div dir=3D"auto">--</div><div dir=3D"auto">Yoann Congal - Smile ECS</div><=
div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div>
</blockquote></div></div>

--0000000000000417f9060f26c8d8--

