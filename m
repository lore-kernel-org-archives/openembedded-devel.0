Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B772CC6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 16:39:40 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.40835.1679935179810542731
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 09:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fTMxrzSv;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5419d4c340aso180713147b3.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 09:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679935179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BlivXFNdO10fhBY7B97K87pddPUiGie94H3OPv76d5I=;
        b=fTMxrzSvwojYC9cE6/KlPA5n6zC+Ok6h85RuMw5z6Ok/YLzJPksxHcnK8PphHcSIwR
         3ERDwe/AMDjaLD1FLhny9GJ2AYTHLujnn4IduTWXPflteJOLb2X/6h9tKOSR4uiklU05
         QZuJR5heX2E4KHg+rIjLThFYnoTSTxi/hWH9GPe1Znz8HR+995fWVtBC7wTU50P9aLC0
         7KbCdX3sWzvtXidI1TG5QIszVi8ehihNyAxeZ4Hdn7o0fiXXTs0FpeKbkeCFggFcHD/J
         ZAqnK0ZjGPVdkLZMNCOQFUNul3R1i3wIIVRbfmt3cgqt6F5Zd0S/caLDSSQwfhr6u/bS
         pYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BlivXFNdO10fhBY7B97K87pddPUiGie94H3OPv76d5I=;
        b=bhIILYF6X8ZLe8YiQ1nQnordd46fVb40sHJbBVD4EVbs7cHLle/QoinfplbDuXP8s8
         iLxEnD4wdMnXGNwEIlaF3pRXsL/ZoVeJkeFi20jDUseedRxlMsOJu8X+nw6E/7jVOAQq
         C/EyPq/IzpDStz9nhXYdScXLYhBYhYO7nhhhJNaUyCVioLLXD3nf1qbpt0zZrT0m0R0Q
         42ciHrpH5iTV7eJF6UCcPJ9EjfOGegKRocrDiLH1cAxsYmnl+UTQ68TwMmSsTIJtTLAV
         Hk5FwET6znya23XzrxlE1AuL4hIHHi0QRySAbYqnABCk8bHQ2j2my6hQ9M5KfAb3o8jG
         b1lg==
X-Gm-Message-State: AAQBX9evPTxF6j9uVrWXFkp1lCZsqoXxcKDNYPAkLtXS3OkwccRi5s6/
	ITCLoAzmvtu+G9zhTHAUunkuKFaNn7i3AkTLC8U=
X-Google-Smtp-Source: AKy350aMRhmQf0PAQzDDYePCBS/bCWgakjWhbm5qgYMBYHEG/qO1+yklkE86v8/dWsaB+6YosHv8r5VLkh0BI48flWc=
X-Received: by 2002:a81:4428:0:b0:52f:184a:da09 with SMTP id
 r40-20020a814428000000b0052f184ada09mr5706908ywa.2.1679935178724; Mon, 27 Mar
 2023 09:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230327125002.90472-1-zboszor@gmail.com> <20230327125002.90472-4-zboszor@gmail.com>
In-Reply-To: <20230327125002.90472-4-zboszor@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 27 Mar 2023 09:39:27 -0700
Message-ID: <CANx9H-AJ59GB+NY4KBigGHBGKAzMry2YUCcifdEe44KjA3iJJA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-ipython: Add missing dependency
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000092d9dc05f7e4639c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 16:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101789

--00000000000092d9dc05f7e4639c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2023 at 5:50=E2=80=AFAM Zoltan Boszormenyi <zboszor@gmail.c=
om>
wrote:

> This fixes the error:
>
> Python 3.11.2 (main, Feb  7 2023, 13:52:42) [GCC 12.2.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import IPython
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "/usr/lib/python3.11/site-packages/IPython/__init__.py", line 52,
> in <module>
>     from .core.application import Application
>   File "/usr/lib/python3.11/site-packages/IPython/core/application.py",
> line 26, in <module>
>     from IPython.core import release, crashhandler
>   File "/usr/lib/python3.11/site-packages/IPython/core/crashhandler.py",
> line 27, in <module>
>     from IPython.core import ultratb
>   File "/usr/lib/python3.11/site-packages/IPython/core/ultratb.py", line
> 101, in <module>
>     import stack_data
> ModuleNotFoundError: No module named 'stack_data'
>
> It appears `stack_data` was added in 8.0.0
https://github.com/ipython/ipython/commit/77651b7a7331b1b030f1c2c03310bf7eb=
b242488

So we've been missing it for quite some time. This highlights the need for
runtime testing vs. just "it builds".

Thank you for the contribution.


> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.11.0.b=
b
> b/meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb
> index 4d21afd6f..875e89abe 100644
> --- a/meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ipython_8.11.0.bb
> @@ -23,6 +23,7 @@ RDEPENDS:${PN} =3D "\
>      ${PYTHON_PN}-unixadmin \
>      ${PYTHON_PN}-misc \
>      ${PYTHON_PN}-sqlite3 \
> +    ${PYTHON_PN}-stack-data \
>  "
>
>  inherit setuptools3 pypi
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101782):
> https://lists.openembedded.org/g/openembedded-devel/message/101782
> Mute This Topic: https://lists.openembedded.org/mt/97881025/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000092d9dc05f7e4639c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 27, 2023 at 5:50=E2=80=AF=
AM Zoltan Boszormenyi &lt;<a href=3D"mailto:zboszor@gmail.com">zboszor@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">This fixes the error:<br>
<br>
Python 3.11.2 (main, Feb=C2=A0 7 2023, 13:52:42) [GCC 12.2.0] on linux<br>
Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;=
license&quot; for more information.<br>
&gt;&gt;&gt; import IPython<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;&lt;stdin&gt;&quot;, line 1, in &lt;module&gt;<br>
=C2=A0 File &quot;/usr/lib/python3.11/site-packages/IPython/__init__.py&quo=
t;, line 52, in &lt;module&gt;<br>
=C2=A0 =C2=A0 from .core.application import Application<br>
=C2=A0 File &quot;/usr/lib/python3.11/site-packages/IPython/core/applicatio=
n.py&quot;, line 26, in &lt;module&gt;<br>
=C2=A0 =C2=A0 from IPython.core import release, crashhandler<br>
=C2=A0 File &quot;/usr/lib/python3.11/site-packages/IPython/core/crashhandl=
er.py&quot;, line 27, in &lt;module&gt;<br>
=C2=A0 =C2=A0 from IPython.core import ultratb<br>
=C2=A0 File &quot;/usr/lib/python3.11/site-packages/IPython/core/ultratb.py=
&quot;, line 101, in &lt;module&gt;<br>
=C2=A0 =C2=A0 import stack_data<br>
ModuleNotFoundError: No module named &#39;stack_data&#39;<br>
<br></blockquote><div>It appears `stack_data` was added in 8.0.0</div><div>=
<a href=3D"https://github.com/ipython/ipython/commit/77651b7a7331b1b030f1c2=
c03310bf7ebb242488">https://github.com/ipython/ipython/commit/77651b7a7331b=
1b030f1c2c03310bf7ebb242488</a></div><div><br></div><div>So we&#39;ve been =
missing it for quite some time. This highlights the need for runtime testin=
g vs. just &quot;it builds&quot;.</div><div><br></div><div>Thank you for th=
e contribution.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto=
:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-ipython=
_8.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipython_8.11.0.bb<=
/a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
ipython_8.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipython_8.1=
1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
ipython_8.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipython_8.1=
1.0.bb</a><br>
index 4d21afd6f..875e89abe 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-ipython=
_8.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipython_8.11.0.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-ipython=
_8.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipython_8.11.0.bb<=
/a><br>
@@ -23,6 +23,7 @@ RDEPENDS:${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-unixadmin \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-misc \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-sqlite3 \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-stack-data \<br>
=C2=A0&quot;<br>
<br>
=C2=A0inherit setuptools3 pypi<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101782): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101782" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101782</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97881025/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
97881025/924729</a><br>
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

--00000000000092d9dc05f7e4639c--

