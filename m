Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C396BC4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 04:07:43 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.10910.1707365261268052404
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Feb 2024 20:07:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LFdNWsXn;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d5267cceso1366914276.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 20:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707365260; x=1707970060; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xv58VHplmsYXy9w6Y4CS5KyCVQOiu8IPPuGQMCxEI94=;
        b=LFdNWsXn8RdcI4cu/Fh807LLJGbPoin9WOs1XcF6tyj/iZZv0xZSW5lC7SfkAmQ3/1
         +7VEkzRI/acnRGaptZXeVB9rsHeOkDxWwwSyXdPm6x1KBFwFLZ7xQjHJVTkTAagmfZDK
         81NOKsQ36pBd7z92cp/+j+siAL+tJZLiH6QBs8I/zpC9CBbbOw+dmrka60JVeRDk/Rxo
         MmfAIEhmTaM/9jVyRpWIHFTea/sm4P+JT1LGsA7gLAjg+6J2Xm1bcRUtCrjX/UyP2fBc
         55RFP2J0or8sQ7iZs+MaqIavmoT+NXVHZBL0lRTrjKVfU8Vgnk0fGkuIrlEOhAhfsBc2
         kMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707365260; x=1707970060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xv58VHplmsYXy9w6Y4CS5KyCVQOiu8IPPuGQMCxEI94=;
        b=uEULFUoJzcHgaoZAE6z/QQAoQ7FtvbW/EEB9igviKOmnKtmZ9dIK3MDXaWHVQoUJou
         LfcLuwtTQQRKT9JiAYNwM7kzM7ZNoJFqDr6NYEw36F/QJxbtxVf8bEnYgW2x3eYhH5nQ
         aO3o7++FTeySTuYK5JJnYSv+Gh+QBPvBUS00PcI6sFDsQTCIT/ix7ry2/bA+rRytArvZ
         ZeK4OeFXRGmkIz1HDkKBHFEUkCuh2wjUGUEkWDvRB8O9P+xGPZ6sWbKDcoT6SdQqmDYb
         MJEFK80mYIlWR6o5IOUxc6PY2KvSotRhwUmv13jO81qP1mlR1fgsdEAkDN9x2YvHwxbJ
         X1cA==
X-Gm-Message-State: AOJu0Yz7gVwOCG7sABgr8mgF9iph45Hc6I4IJ6wtSSkXhAy1nA6jDu3Y
	YrUFjezxuUxlY4m0Kl0ahIas9tPN50viOaURQoSrrSXAhL2erdJ5ZJ3ZVG5ylPc5hzaBzIIauWz
	dB2NULuQg7xiL1PZVGJnWD9hnl1fJC0Gk
X-Google-Smtp-Source: AGHT+IEW8J9sBua1/ATiwHXYnENCYhlgGuRImLXZ9DGLfLRJRx7aozE3Jt9cIFARg5ZkmEb5cUqa+RvznScSG4z6gnA=
X-Received: by 2002:a05:6902:566:b0:dc6:421a:3024 with SMTP id
 a6-20020a056902056600b00dc6421a3024mr6729635ybt.43.1707365260254; Wed, 07 Feb
 2024 20:07:40 -0800 (PST)
MIME-Version: 1.0
References: <1707209256-6015-1-git-send-email-wangmy@fujitsu.com> <CAMKF1spwhAnY3Hyw-Zs=uHNu+F6okQvP+yGOeDP4wv8j_w_cvw@mail.gmail.com>
In-Reply-To: <CAMKF1spwhAnY3Hyw-Zs=uHNu+F6okQvP+yGOeDP4wv8j_w_cvw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 7 Feb 2024 20:07:29 -0800
Message-ID: <CANx9H-BHo0SeatQjqrhbN2Otc=jWROcQ+twE9+Dd37z5RLE53g@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 2.5.3 -> 2.6.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
Content-Type: multipart/alternative; boundary="000000000000d6e45f0610d6f378"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 04:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108654

--000000000000d6e45f0610d6f378
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 10:53=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> this fails ptests on qemux86-64
>
> Failed ptests:
> {'python3-pydantic': 'START: ptest-runner\n'
>                      '2024-02-07T18:01\n'
>
>
> '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n'
>                      'Testsuite summary\n'
>                      '# TOTAL: 0\n'
>                      '# PASS: 0\n'
>                      '# SKIP: 0\n'
>                      '# XFAIL: 0\n'
>                      '# FAIL: 0\n'
>                      '# XPASS: 0\n'
>
>               '# ERROR: 0\n'
>                      '\n'
>
>               'ERROR: Exit status is 2\n'
>                      'DURATION: 7\n'}
>
> ptests which had no test results:
> ['python3-pydantic']
>

Thus might be because it also needs an upgrade of python3-pydantic-core
(and others)
https://docs.pydantic.dev/latest/changelog/#packaging_1


> On Tue, Feb 6, 2024 at 12:48=E2=80=AFAM wangmy via lists.openembedded.org
> <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Changelog:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -Drop Python3.7 support
> > -Drop Python 3.7, and PyPy 3.7 and 3.8
> > -Use positional-only self in BaseModel constructor, so no field name ca=
n
> ever
> >  conflict with it
> > -Make @validate_call return a function instead of a custom descriptor -
> fixes
> >  binding issue with inheritance and adds self/cls argument to validatio=
n
> errors
> > -Exclude BaseModel docstring from JSON schema description
> > -Introducing classproperty decorator for model_computed_fields
> > -Explicitly raise an error if field names clashes with types
> > -Use stricter serializer for unions of simple types
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../{python3-pydantic_2.5.3.bb =3D> python3-pydantic_2.6.0.bb}    | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-python/recipes-devtools/python/{python3-pydantic_2.5.3.bb
> =3D> python3-pydantic_2.6.0.bb} (94%)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-pydantic_2.5.3.bb b/meta-python/recipes-devtools/python/
> python3-pydantic_2.6.0.bb
> > similarity index 94%
> > rename from meta-python/recipes-devtools/python/
> python3-pydantic_2.5.3.bb
> > rename to meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
> > index 21341d26c..af465f423 100644
> > --- a/meta-python/recipes-devtools/python/python3-pydantic_2.5.3.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
> > @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D09280955509d1c4ca14bae02f21d49a6"
> >
> >  inherit pypi python_hatchling
> >
> > -SRC_URI[sha256sum] =3D
> "b3ef57c62535b0941697cce638c08900d87fcb67e29cfa99e8a68f747f393f7a"
> > +SRC_URI[sha256sum] =3D
> "ae887bd94eb404b09d86e4d12f93893bdca79d766e738528c6fa1c849f3c6bcf"
> >
> >  DEPENDS +=3D "python3-hatch-fancy-pypi-readme-native"
> >
> > --
> > 2.34.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108653):
> https://lists.openembedded.org/g/openembedded-devel/message/108653
> Mute This Topic: https://lists.openembedded.org/mt/104194508/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d6e45f0610d6f378
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Feb 7, 2024 at 10:53=E2=80=AFAM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:r=
gb(204,204,204)">this fails ptests on qemux86-64<br>
<br>
Failed ptests:<br>
{&#39;python3-pydantic&#39;: &#39;START: ptest-runner\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;2024-02-07T18:01\n&#39;<br>
<br>
&#39;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;Testsuite summary\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;# TOTAL: 0\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;# PASS: 0\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;# SKIP: 0\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;# XFAIL: 0\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;# FAIL: 0\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;# XPASS: 0\n&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;# ERROR: 0\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;\n&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;ERROR: Exit status is=
 2\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;DURATION: 7\n&#39;}<br>
<br>
ptests which had no test results:<br>
[&#39;python3-pydantic&#39;]<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thus might be be=
cause it also needs an upgrade of python3-pydantic-core (and others)</div><=
div dir=3D"auto"><div><a href=3D"https://docs.pydantic.dev/latest/changelog=
/#packaging_1">https://docs.pydantic.dev/latest/changelog/#packaging_1</a><=
/div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)"><br>
On Tue, Feb 6, 2024 at 12:48=E2=80=AFAM wangmy via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.o=
rg</a><br>
&lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org" target=
=3D"_blank">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"=
_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt;<br>
&gt; Changelog:<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; -Drop Python3.7 support<br>
&gt; -Drop Python 3.7, and PyPy 3.7 and 3.8<br>
&gt; -Use positional-only self in BaseModel constructor, so no field name c=
an ever<br>
&gt;=C2=A0 conflict with it<br>
&gt; -Make @validate_call return a function instead of a custom descriptor =
- fixes<br>
&gt;=C2=A0 binding issue with inheritance and adds self/cls argument to val=
idation errors<br>
&gt; -Exclude BaseModel docstring from JSON schema description<br>
&gt; -Introducing classproperty decorator for model_computed_fields<br>
&gt; -Explicitly raise an error if field names clashes with types<br>
&gt; -Use stricter serializer for unions of simple types<br>
&gt;<br>
&gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" t=
arget=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../{<a href=3D"http://python3-pydantic_2.5.3.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-pydantic_2.5.3.bb</a> =3D&gt; <a href=3D"htt=
p://python3-pydantic_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pydantic_2.6.0.bb</a>}=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://py=
thon3-pydantic_2.5.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydan=
tic_2.5.3.bb</a> =3D&gt; <a href=3D"http://python3-pydantic_2.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-pydantic_2.6.0.bb</a>} (94%)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pydantic_2.5.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydant=
ic_2.5.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pydantic_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydant=
ic_2.6.0.bb</a><br>
&gt; similarity index 94%<br>
&gt; rename from meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-pydantic_2.5.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydanti=
c_2.5.3.bb</a><br>
&gt; rename to meta-python/recipes-devtools/python/<a href=3D"http://python=
3-pydantic_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_=
2.6.0.bb</a><br>
&gt; index 21341d26c..af465f423 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
dantic_2.5.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.5.=
3.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
dantic_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.6.=
0.bb</a><br>
&gt; @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D0928=
0955509d1c4ca14bae02f21d49a6&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit pypi python_hatchling<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;b3ef57c62535b0941697cce638c08900d87fcb67=
e29cfa99e8a68f747f393f7a&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;ae887bd94eb404b09d86e4d12f93893bdca79d76=
6e738528c6fa1c849f3c6bcf&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;python3-hatch-fancy-pypi-readme-native&quot;<=
br>
&gt;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108653): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108653" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108653</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104194508/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104194508/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d6e45f0610d6f378--

