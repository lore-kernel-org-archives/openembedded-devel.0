Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8B6C27C53
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 23:58:46 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.3360.1718236722052379377
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jun 2024 16:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V/6+ou5M;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-627ebbefd85so5255287b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 16:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718236721; x=1718841521; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jimN3ClEzA8j7XugTQm2wB5lOzlhGYuXQNZZctvZ6U8=;
        b=V/6+ou5MCCKrQinVSbIguWAKi8CNIDd/dauvkR3LS4VXYta9hjDyq8z/i8OvR4TWzA
         HDJpPzSficirSmNUdshefBB8qjieLMswknnBG5N4i4nwsl7bJzO5n8RQuBagspUjKcdq
         57S3Nyqf+bsgyTWEdA3cL9Fc6o2fKI4C1o6lIljKyt2JbQORicKY25WcOyf9TTF8IW8m
         ZpHahC5JoxzNIXtilx9oAMWTCkjZ9YWTPrS5W+HBz3DmJZRRf0PuSaTzFx1truUL7r0x
         Bb5+VfV7zbfu4CRZ0KlfLkIz0w+NxbyaPTA8sNiLpzrWFWuanXmLT3c1vDpJq5qSP7xX
         /Zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718236721; x=1718841521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jimN3ClEzA8j7XugTQm2wB5lOzlhGYuXQNZZctvZ6U8=;
        b=vydvuT6vCWuCbXBlUddWKAbu45lrxqAvNzFCOBsNGIUjjjdUDHlj//cuy6zs2WrY0/
         RZkQqaq/ayIi8LpAKwUFjg25M1oi6OJU+kHcH/kg+6yyWZ9d/GH6gK/SmgsO/hrfeGVr
         VPNzBOYJM2e7chy4PEeWfbwGnX05qBYZReqeXKwzmXu56CluhNkMvMcoX8ppwdvUSMC/
         pgm8RosAAnPFCBNrRvy0IMMirSBX1q6hVBH0ADYabOatnHEH5+iAx83SmZ482WlqmcI6
         8p31T7hQCXd7SGmDjVSUm65eWUKa2pQmAhd1JQWX/Iwu5KfmvmSkYFsBGLpJCIXCPVPG
         FNpQ==
X-Gm-Message-State: AOJu0YyHP2pkawTKsJU3TAiymMPyJJyv0jGm3q8Mov/SNo9my2qdojpC
	ZRpphUH0vuDEYB06tWos2AzuEir8tBWudIo8gsjt07ogtmVLJtV3MQIrojF05p5SoSx6ZbGHVrJ
	RY2OhfHEJH3bvRVsjlUvP3kU6bas=
X-Google-Smtp-Source: AGHT+IEWn0e4hWxaGH2WKXMf2dg7bL/2XG4G29GBOApnblWl+xoSY6DXH6YDdu605kBcTczSxNgliCtraq0Rpl5aXi0=
X-Received: by 2002:a81:9e48:0:b0:62c:e939:2ffe with SMTP id
 00721157ae682-62fbb8ed812mr34915197b3.7.1718236720842; Wed, 12 Jun 2024
 16:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240612195026.3806547-1-raj.khem@gmail.com>
In-Reply-To: <20240612195026.3806547-1-raj.khem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 12 Jun 2024 16:58:29 -0700
Message-ID: <CANx9H-B8LqhKrfswjqoNQ2ShZKB-9A_uYn4Q9TJX_BmKHboESg@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-pydantic-core: Fix build with python 3.12.4
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000062d054061aba29e0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 23:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110884

--00000000000062d054061aba29e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 12:50=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:

> This needs to be upgraded to 2.19+ but until then
> backport a fix to keep it building.


Thank you for the heads up. I=E2=80=99ll take a look tomorrow at the upgrad=
e.


>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Tim Orling <ticotimo@gmail.com>
> ---
>  ...ate_self_schema-for-Python-3.12-1299.patch | 29 +++++++++++++++++++
>  .../python/python3-pydantic-core_2.16.3.bb    |  3 +-
>  2 files changed, 31 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-genera=
te_self_schema-for-Python-3.12-1299.patch
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-gene=
rate_self_schema-for-Python-3.12-1299.patch
> b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-gene=
rate_self_schema-for-Python-3.12-1299.patch
> new file mode 100644
> index 0000000000..f6aa18e303
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-gene=
rate_self_schema-for-Python-3.12-1299.patch
> @@ -0,0 +1,29 @@
> +From 0dcca2ed6a83ebbc944ec8cbd2f67ffec8043461 Mon Sep 17 00:00:00 2001
> +From: Jelle Zijlstra <jelle.zijlstra@gmail.com>
> +Date: Wed, 22 May 2024 07:44:10 -0700
> +Subject: [PATCH] Fix generate_self_schema for Python 3.12+ (#1299)
> +
> +Upstream-Status: Backport [
> https://github.com/pydantic/pydantic-core/commit/a7620419383a69bd2b28ab95=
3c9a17f6ed35bb9a
> ]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + generate_self_schema.py | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/generate_self_schema.py b/generate_self_schema.py
> +index 8d27247..109fca0 100644
> +--- a/generate_self_schema.py
> ++++ b/generate_self_schema.py
> +@@ -189,7 +189,12 @@ def all_literal_values(type_:
> type[core_schema.Literal]) -> list[any]:
> +
> + def eval_forward_ref(type_: Any) -> Any:
> +     try:
> +-        return type_._evaluate(core_schema.__dict__, None, set())
> ++        try:
> ++            # Python 3.12+
> ++            return type_._evaluate(core_schema.__dict__, None,
> type_params=3Dset(), recursive_guard=3Dset())
> ++        except TypeError:
> ++            # Python 3.9+
> ++            return type_._evaluate(core_schema.__dict__, None, set())
> +     except TypeError:
> +         # for Python 3.8
> +         return type_._evaluate(core_schema.__dict__, None)
> diff --git a/meta-python/recipes-devtools/python/
> python3-pydantic-core_2.16.3.bb b/meta-python/recipes-devtools/python/
> python3-pydantic-core_2.16.3.bb
> index f510645222..c5ce1ff110 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
> @@ -8,7 +8,8 @@ HOMEPAGE =3D "https://github.com/pydantic/pydantic-core"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dab599c188b4a314d2856b3a55030c=
75c"
>
> -SRC_URI +=3D
> "file://0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch"
> +SRC_URI +=3D
> "file://0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch \
> +
> file://0001-Fix-generate_self_schema-for-Python-3.12-1299.patch"
>  SRC_URI[sha256sum] =3D
> "1cac689f80a3abab2d3c0048b29eea5751114054f032a941a32de4c852c59cad"
>
>  DEPENDS =3D "python3-maturin-native python3-typing-extensions"
>

--00000000000062d054061aba29e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Jun 12, 2024 at 12:50=E2=80=AFPM Khem Ra=
j &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)">This needs to be upgraded to 2.19+ but until t=
hen<br>
backport a fix to keep it building.</blockquote><div dir=3D"auto"><br></div=
><div dir=3D"auto">Thank you for the heads up. I=E2=80=99ll take a look tom=
orrow at the upgrade.</div><div dir=3D"auto"><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=
=3D"auto"><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">=
ticotimo@gmail.com</a>&gt;<br>
---<br>
=C2=A0...ate_self_schema-for-Python-3.12-1299.patch | 29 ++++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-pydantic-core_2.16.3.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-pydantic-core_2.16.3.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 3 +-<br>
=C2=A02 files changed, 31 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pydant=
ic-core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001=
-Fix-generate_self_schema-for-Python-3.12-1299.patch b/meta-python/recipes-=
devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-for-Pyt=
hon-3.12-1299.patch<br>
new file mode 100644<br>
index 0000000000..f6aa18e303<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-ge=
nerate_self_schema-for-Python-3.12-1299.patch<br>
@@ -0,0 +1,29 @@<br>
+From 0dcca2ed6a83ebbc944ec8cbd2f67ffec8043461 Mon Sep 17 00:00:00 2001<br>
+From: Jelle Zijlstra &lt;<a href=3D"mailto:jelle.zijlstra@gmail.com" targe=
t=3D"_blank">jelle.zijlstra@gmail.com</a>&gt;<br>
+Date: Wed, 22 May 2024 07:44:10 -0700<br>
+Subject: [PATCH] Fix generate_self_schema for Python 3.12+ (#1299)<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/pydantic/pydantic=
-core/commit/a7620419383a69bd2b28ab953c9a17f6ed35bb9a" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/pydantic/pydantic-core/commit/a76204193=
83a69bd2b28ab953c9a17f6ed35bb9a</a>]<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ generate_self_schema.py | 7 ++++++-<br>
+ 1 file changed, 6 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/generate_self_schema.py b/generate_self_schema.py<br>
+index 8d27247..109fca0 100644<br>
+--- a/generate_self_schema.py<br>
++++ b/generate_self_schema.py<br>
+@@ -189,7 +189,12 @@ def all_literal_values(type_: type[core_schema.Litera=
l]) -&gt; list[any]:<br>
+ <br>
+ def eval_forward_ref(type_: Any) -&gt; Any:<br>
+=C2=A0 =C2=A0 =C2=A0try:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return type_._evaluate(core_schema.__dict__, =
None, set())<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Python 3.12+<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return type_._evaluate(core_sch=
ema.__dict__, None, type_params=3Dset(), recursive_guard=3Dset())<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 except TypeError:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Python 3.9+<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return type_._evaluate(core_sch=
ema.__dict__, None, set())<br>
+=C2=A0 =C2=A0 =C2=A0except TypeError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# for Python 3.8<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return type_._evaluate(core_schema.__dic=
t__, None)<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pydantic-core_2.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydan=
tic-core_2.16.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pydantic-core_2.16.3.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pydantic-core_2.16.3.bb</a><br>
index f510645222..c5ce1ff110 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c-core_2.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-cor=
e_2.16.3.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c-core_2.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-cor=
e_2.16.3.bb</a><br>
@@ -8,7 +8,8 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/pydantic/p=
ydantic-core" rel=3D"noreferrer" target=3D"_blank">https://github.com/pydan=
tic/pydantic-core</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dab599c188b4a314d2856b=
3a55030c75c&quot;<br>
<br>
-SRC_URI +=3D &quot;file://0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-=
0.20.2-to.patch&quot;<br>
+SRC_URI +=3D &quot;file://0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-=
0.20.2-to.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-generate_self_sc=
hema-for-Python-3.12-1299.patch&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;1cac689f80a3abab2d3c0048b29eea5751114054=
f032a941a32de4c852c59cad&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;python3-maturin-native python3-typing-extensions&qu=
ot;<br>
</blockquote></div></div>

--00000000000062d054061aba29e0--

