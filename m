Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DC5C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 16:44:30 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.7854.1705509859565210315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 08:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=zOv8vC08;
 spf=pass (domain: smile.fr, ip: 209.85.218.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a27733ae1dfso1298409766b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 08:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705509858; x=1706114658; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xXAO/Z+7PBl9/dWgqkxFDJAvyHLM3I39tfD/yUL+C6k=;
        b=zOv8vC08mEL+0N+LVAHj5jCnlbi03escbiMvn8w8Oe5mxxvT+FqShWxZ5FavhgjqpW
         wsq36FmhfuK0LPPgYGy26ZpHSYEYGW9JBEEszvFkxVEgfIkDqG4G7fH9yxwbJovuC3gJ
         KWQVJzxVfihYq/ejOBbkK/TmA2u8U1HJlMrFFtqYulXJO+bHK32+NpsxTesL2XYOcKdw
         skgjl1w37iqQ0VbjcA8Dy4I+a7XKwqeN42hzucjhNkwniJmrjx4FNDFWrwX+AGVdBN3X
         Ns6BHs5J/f1WbUDJ2c4LL3UYLebeStlxI0AAUGU89tb+PKg++ouYk4RLv9HAdx5AVN1t
         bv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705509858; x=1706114658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXAO/Z+7PBl9/dWgqkxFDJAvyHLM3I39tfD/yUL+C6k=;
        b=SpNsZBd7P65Z1Lfe9hewP6gv+Q2lQb93TstSCt1P6CGsv60UFXTBgsaddGM3HsLwJy
         lwsNrNftxioX8hIulFMi8hZGPJUlmtjmzdpZ5vwPLQCvviiVe9SMX4l0NJAHaOdWjvUs
         RbJ4ypKBSc14RcfbE1RsgGZ5kVyJlWjdalOC0Q25u9NZnn7W3N9CImhG+fD1HRHPnFpk
         dNAuZ0wWe+k9OkNzg/rUjrMJ/0tO3YHoLtXZlL0febG+JbDfPXEsv2IU2hNh84IZ6ykL
         wPOzZ2Jjkqy4JfPJ5NlgP3jKnLM66TJrX5nq0fqoSDSU+TEtzeTK582WAPqhwb1k3gvM
         e9mg==
X-Gm-Message-State: AOJu0Yzx9cr8gbaFHNCwRfF96UIpvMC98AQ19a0YGggMTWpFLz6xQmtC
	EpHn16oL/hgcNrU5l+eCgWb3J7P1JlEaZFW3GQHIE94PZ6Qblw==
X-Google-Smtp-Source: AGHT+IEeiRG3Y4GbmOXlXtudw/2fNUPhledpIm7mYMZskuBkh7uJn7dbwJdaBYPXDTgAsI4jLx5USQRDulJJN4L0ZbU=
X-Received: by 2002:a17:906:9c93:b0:a2e:d327:61b2 with SMTP id
 fj19-20020a1709069c9300b00a2ed32761b2mr517301ejc.68.1705509858076; Wed, 17
 Jan 2024 08:44:18 -0800 (PST)
MIME-Version: 1.0
References: <20240117082519.3037503-1-yoann.congal@smile.fr>
 <CAMKF1sqNjnpWcV8HTwnQiytkN5QJAufAgOv+zA1vvvh-+mF5MA@mail.gmail.com>
 <CAMSfU+5_3qkFXTAEMNvX3ewEKXcSto+xZcjqVMzHyuKwgD679Q@mail.gmail.com> <CAMKF1sog9N5XQyZoD3eEaDLyK8F20DbQkrBP82Eks3XtdZo55w@mail.gmail.com>
In-Reply-To: <CAMKF1sog9N5XQyZoD3eEaDLyK8F20DbQkrBP82Eks3XtdZo55w@mail.gmail.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Wed, 17 Jan 2024 17:44:03 +0100
Message-ID: <CAMSfU+7RASoD=buv3O1W0QseMKxXu2CSXZCWoPw-WyERW124NQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pytest-cov: Remove unbuildable BBCLASSEXTENDs
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Richard Leitner <dev@g0hl1n.net>
Content-Type: multipart/alternative; boundary="000000000000407b2c060f26f5aa"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 16:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108336

--000000000000407b2c060f26f5aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 17 janv. 2024 =C3=A0 17:31, Khem Raj <raj.khem@gmail.com> a =C3=A9c=
rit :

>
>
> On Wed, Jan 17, 2024 at 8:20=E2=80=AFAM Yoann CONGAL <yoann.congal@smile.=
fr>
> wrote:
>
>> Le mer. 17 janv. 2024 =C3=A0 16:26, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
>>
>>> how about we add
>>>
>>> BBCLASSEXTEND =3D "native nativesdk"
>>>
>>> to meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb
>>
>>
>> Sure! ... But I have no idea how to test it.
>> Do we really care about pytest-cov in native environments? If yes, I'll
>> look into it.
>>
>
> Since the native extends existed before it gained the extra dependency on
> coverage package it=E2=80=99s possible that there is a use of it already =
in place
>

Good point. I'll try test it before sending a patch.


>> On Wed, Jan 17, 2024 at 12:26=E2=80=AFAM Yoann Congal <yoann.congal@smil=
e.fr>
>>> wrote:
>>> >
>>> > Since the python3-coverage dependency has neither native nor nativesd=
k
>>> > BBCLASSEXTEND, remove these to avoid triggering warnings on universe
>>> > builds.
>>> >
>>> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>> > ---
>>> > CC: Richard Leitner <dev@g0hl1n.net>
>>> > This is related to this ML thread:
>>> https://lists.openembedded.org/g/openembedded-devel/topic/103499188#108=
305
>>> > ---
>>> >  meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb | 2
>>> --
>>> >  1 file changed, 2 deletions(-)
>>> >
>>> > diff --git a/meta-python/recipes-devtools/python/
>>> python3-pytest-cov_4.1.0.bb b/meta-python/recipes-devtools/python/
>>> python3-pytest-cov_4.1.0.bb
>>> > index 3a68011f4..2591539ec 100644
>>> > --- a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
>>> > +++ b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
>>> > @@ -11,5 +11,3 @@ inherit pypi setuptools3
>>> >
>>> >  DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
>>> >  RDEPENDS:${PN} +=3D "python3-coverage"
>>> > -
>>> > -BBCLASSEXTEND =3D "native nativesdk"
>>> > --
>>> > 2.39.2
>>> >
>>> >
>>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> > Links: You receive all messages sent to this group.
>>> > View/Reply Online (#108324):
>>> https://lists.openembedded.org/g/openembedded-devel/message/108324
>>> > Mute This Topic: https://lists.openembedded.org/mt/103782092/1997914
>>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
>>> [raj.khem@gmail.com]
>>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> >
>>
>>
>> --
>> Yoann Congal - Smile ECS
>>
>>>

--000000000000407b2c060f26f5aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">Le mer. 17 janv. 2024 =C3=A0 17:31, Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; a =C3=A9cri=
t=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div><br></div><div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan =
17, 2024 at 8:20=E2=80=AFAM Yoann CONGAL &lt;<a href=3D"mailto:yoann.congal=
@smile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div di=
r=3D"auto">Le mer. 17 janv. 2024 =C3=A0 16:26, Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.=
com</a>&gt; a =C3=A9crit=C2=A0:<br></div><div class=3D"gmail_quote" dir=3D"=
auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">how about we add<br>
<br>
BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
to meta-python/recipes-devtools/python/<a href=3D"http://python3-coverage_7=
.4.0.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">python3=
-coverage_7.4.0.bb</a></blockquote></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Sure! ... But I have no idea how to test it.=C2=A0</div><div di=
r=3D"auto">Do we really care about pytest-cov in native environments? If ye=
s, I&#39;ll look into it.<br></div></div><div dir=3D"auto"><div dir=3D"auto=
"></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Si=
nce the native extends existed before it gained the extra dependency on cov=
erage package it=E2=80=99s possible that there is a use of it already in pl=
ace</div></div></div></blockquote></div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Good point. I&#39;ll try test it before sending a patch.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><br></div><div cla=
ss=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On Wed, Jan 17, 2024 at 12:26=E2=80=AFAM Yoann Congal &lt;<a href=3D"mailto=
:yoann.congal@smile.fr" rel=3D"noreferrer noreferrer" target=3D"_blank">yoa=
nn.congal@smile.fr</a>&gt; wrote:<br>
&gt;<br>
&gt; Since the python3-coverage dependency has neither native nor nativesdk=
<br>
&gt; BBCLASSEXTEND, remove these to avoid triggering warnings on universe<b=
r>
&gt; builds.<br>
&gt;<br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" rel=3D"noreferrer noreferrer" target=3D"_blank">yoann.congal@smile.fr</a=
>&gt;<br>
&gt; ---<br>
&gt; CC: Richard Leitner &lt;<a href=3D"mailto:dev@g0hl1n.net" rel=3D"noref=
errer noreferrer" target=3D"_blank">dev@g0hl1n.net</a>&gt;<br>
&gt; This is related to this ML thread: <a href=3D"https://lists.openembedd=
ed.org/g/openembedded-devel/topic/103499188#108305" rel=3D"noreferrer noref=
errer noreferrer" target=3D"_blank">https://lists.openembedded.org/g/openem=
bedded-devel/topic/103499188#108305</a><br>
&gt; ---<br>
&gt;=C2=A0 meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
test-cov_4.1.0.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blan=
k">python3-pytest-cov_4.1.0.bb</a> | 2 --<br>
&gt;=C2=A0 1 file changed, 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pytest-cov_4.1.0.bb" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">python3-pytest-cov_4.1.0.bb</a> b/meta-python/recipes-devtools/=
python/<a href=3D"http://python3-pytest-cov_4.1.0.bb" rel=3D"noreferrer nor=
eferrer noreferrer" target=3D"_blank">python3-pytest-cov_4.1.0.bb</a><br>
&gt; index 3a68011f4..2591539ec 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
test-cov_4.1.0.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blan=
k">python3-pytest-cov_4.1.0.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
test-cov_4.1.0.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blan=
k">python3-pytest-cov_4.1.0.bb</a><br>
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
/g/openembedded-devel/message/108324" rel=3D"noreferrer noreferrer noreferr=
er" target=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/m=
essage/108324</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10378209=
2/1997914" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https=
://lists.openembedded.org/mt/103782092/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-de=
vel+owner@lists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">htt=
ps://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mail=
to:raj.khem@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">raj.=
khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;</blockquote></div><div dir=3D"auto"><br></div></div><div dir=3D"auto">=
<div dir=3D"auto">--</div><div dir=3D"auto">Yoann Congal - Smile ECS</div><=
div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div>
</blockquote></div></div>
</blockquote></div></div></div>

--000000000000407b2c060f26f5aa--

