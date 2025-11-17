Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30A3CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 08:28:41 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5162.1763368111948438903
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 00:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kORtDQ8s;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-63fc72db706so3533454d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 00:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763368111; x=1763972911; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aeu0ASM4pz0oWIoVQ3qj8xoYoe6d2DVGxY1DUUR/SWY=;
        b=kORtDQ8sC9V9L8r9+/xsIkwpIVITX6NdpDqwB0S2nUVoChc6V+Ow03o1O7IznDRfg9
         KeKqQ14aIReRYaUcyiLlmJzNksUbMbc84pa1aclqHKmWCrW8/6TgOX66374zTikw5DBR
         4Yq/TQG3WytslSijvm9RE90Qp/Tqq5jXndeGf4KvdkUVzCufWA1fOuFoKE4x9U3Z3u0s
         7pBmv7Umtfemj7xM1OzzdBmELtsepX+9FKC/b4wW+1+namct0qLC2Jn3G2HBwrBFfPpM
         bInILMaOyGMPbSU4nKDHVTBeYjlDHnpmzkF7ZzQJ7VnIobd3uMuuIrJCqFX53nAheGrl
         oo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763368111; x=1763972911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aeu0ASM4pz0oWIoVQ3qj8xoYoe6d2DVGxY1DUUR/SWY=;
        b=eXLz0GRmB2Z1KUg6d4lLpSy5+lqSNDB6ZiY3kjfplHMhOMa9ACchjjTGBddblKkfOn
         6ifGFpeUDn+LOh7BTO/ReUsp0A9yNBed626dhH6MYTYG8kocf5Iq1HriAdZJk9zNIHwZ
         wy8ej7rD+nRp+kPz8LsNH+d8SvfnVJCF/tXCRaMe6P4LUPADQSiwlJK+C6SrxO1jrmGI
         JHS2aRlF8Ii+iDtfIOzoLpm4y3XNtUMuhFjjeLN2tJQujPoAN3E0orV8LKlzZRmt6+lN
         yyBZMESj34DLmKkqQc2aFjgoOqDBALCD7A8k8f+KZUETh/ZJKzMBIVtJM+dUcOhZFI8z
         3U+g==
X-Gm-Message-State: AOJu0YxEFs/88XiIj6uwSz0XtgG643WrCtaj9FcYuK7pBCGVL0MPi5fx
	aI3uU9oAECnahcokvVWGoaXv532DlcCujL/ipfCRRzw6753v110Qa5laYjcQG2zUh7Pza1p+0Py
	w61/9q7n8TCKQxQXPO6/7DcboxjTiexo=
X-Gm-Gg: ASbGncv2yEuj9r0gO4PI8qHpESIfaHccIkjPEhd64LoKEvibTR5qau1vQmM7if2WtK9
	S9SNqHGVY+ux/gOdZRfqcLfsYV7VsunLpaQCEg+zrP+YTtnNu27kry+7n4HJi8aIer5w0/oLsP5
	wWcuxfkuxNzLg3jkkDeQpL0ok8I+B47vUijnoCZd5InnandJ9ZUZwaFoW30urai3GSsM0YFwNwm
	nilB00qXtKP9BdCavegJ3+sykhvLTF0M/qj2Tt4wX43NBRN4eXRpBchOP7g0mat1FIxtX0s/eoY
	TUohQNBRbJXri8fPSVMT3MOHf+IjcqleHwjrZisxfcRZYt6+V8t8mILOM5ttISIlSyq6mUWY5UI
	W9DMm6w3rnmdM8AiDHKlMCQak9NU=
X-Google-Smtp-Source: AGHT+IGtxZsVnaSICWLPUqBRjN8pPlpHoeoau7wKIaepD9BVAxLIrMjaXBkXwbY+061/x7d2+YF+Yh8lgpob9zoNXF0=
X-Received: by 2002:a53:c042:0:20b0:640:ce83:c29d with SMTP id
 956f58d0204a3-641e74b04e9mr8406723d50.14.1763368110907; Mon, 17 Nov 2025
 00:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20251117075131.2751-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20251117075131.2751-1-liuyd.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Nov 2025 00:28:04 -0800
X-Gm-Features: AWmQ_bmjltmWeXuoeouHTmI0oQgkOXYzRndtMvP0sGU4o6P2Q3xdWPUtUDQ1_eI
Message-ID: <CAMKF1soY203r5wKKteDzEgumPZQHr8bBpzJvWHjYmNFaNrVJYA@mail.gmail.com>
Subject: Re: [oe][meta-python][PATCH] python3-imageio: upgrade 2.37.0 -> 2.37.2
To: liuyd.fnst@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dbe5e50643c62178"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 08:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121764

--000000000000dbe5e50643c62178
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 16, 2025 at 11:52=E2=80=AFPM Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
wrote:

> Changelog:
>  https://github.com/imageio/imageio/releases/tag/v2.37.2
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  ...{python3-imageio_2.37.0.bb =3D> python3-imageio_2.37.2.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-imageio_2.37.0.bb =
=3D>
> python3-imageio_2.37.2.bb} (58%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.37.0.b=
b
> b/meta-python/recipes-devtools/python/python3-imageio_2.37.2.bb
> similarity index 58%
> rename from meta-python/recipes-devtools/python/python3-imageio_2.37.0.bb
> rename to meta-python/recipes-devtools/python/python3-imageio_2.37.2.bb
> index 5de9ee466c..582cd348f9 100644
> --- a/meta-python/recipes-devtools/python/python3-imageio_2.37.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-imageio_2.37.2.bb
> @@ -3,10 +3,10 @@ write a wide range of image data, including animated
> images, video, \
>  volumetric data, and scientific formats."
>  SECTION =3D "devel/python"
>  LICENSE =3D "BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D24cb9a367a9e641b459a01c4d1525=
6ba"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9da78aa88ef5e9acd41f7bb288286=
273"
>
>
what changed here ?


> -SRC_URI[sha256sum] =3D
> "71b57b3669666272c818497aebba2b4c5f20d5b37c81720e5e1a56d59c492996"
> +SRC_URI[sha256sum] =3D
> "0212ef2727ac9caa5ca4b2c75ae89454312f440a756fcfc8ef1993e718f50f8a"
>
> -inherit pypi setuptools3
> +inherit pypi python_setuptools_build_meta
>
>  RDEPENDS:${PN} =3D "python3-numpy python3-pillow"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121760):
> https://lists.openembedded.org/g/openembedded-devel/message/121760
> Mute This Topic: https://lists.openembedded.org/mt/116334258/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000dbe5e50643c62178
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 16,=
 2025 at 11:52=E2=80=AFPM Yiding Liu (Fujitsu) via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;liuyd.fnst=3D<a href=3D"ma=
ilto:fujitsu.com@lists.openembedded.org">fujitsu.com@lists.openembedded.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Changelog:<br>
=C2=A0<a href=3D"https://github.com/imageio/imageio/releases/tag/v2.37.2" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/imageio/imageio/rele=
ases/tag/v2.37.2</a><br>
<br>
Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" tar=
get=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...{<a href=3D"http://python3-imageio_2.37.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python3-imageio_2.37.0.bb</a> =3D&gt; <a href=3D"http://py=
thon3-imageio_2.37.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-image=
io_2.37.2.bb</a>} | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-imageio_2.37.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-imageio_2.=
37.0.bb</a> =3D&gt; <a href=3D"http://python3-imageio_2.37.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-imageio_2.37.2.bb</a>} (58%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
imageio_2.37.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-imageio_2.3=
7.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
imageio_2.37.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-imageio_2.3=
7.2.bb</a><br>
similarity index 58%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-i=
mageio_2.37.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-imageio_2.37=
.0.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-ima=
geio_2.37.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-imageio_2.37.2=
.bb</a><br>
index 5de9ee466c..582cd348f9 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-imageio=
_2.37.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-imageio_2.37.0.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-imageio=
_2.37.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-imageio_2.37.2.bb<=
/a><br>
@@ -3,10 +3,10 @@ write a wide range of image data, including animated imag=
es, video, \<br>
=C2=A0volumetric data, and scientific formats.&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-2-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D24cb9a367a9e641b459a01c4d1=
5256ba&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D9da78aa88ef5e9acd41f7bb288=
286273&quot;<br>
<br></blockquote><div><br></div><div>what changed here ?</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
-SRC_URI[sha256sum] =3D &quot;71b57b3669666272c818497aebba2b4c5f20d5b37c817=
20e5e1a56d59c492996&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0212ef2727ac9caa5ca4b2c75ae89454312f440a756fc=
fc8ef1993e718f50f8a&quot;<br>
<br>
-inherit pypi setuptools3<br>
+inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;python3-numpy python3-pillow&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121760): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121760" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121760</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116334258/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116334258/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000dbe5e50643c62178--

