Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FD5CD8CBE
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 18:15:19 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.663.1763057709585723689
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 10:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=emXgvGLI;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63bc1aeb427so1004242d50.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 10:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763057709; x=1763662509; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JWTFHfx/DiJXyn64uWJ3+snK0tLvmOFswE1JnWkvO6w=;
        b=emXgvGLIaRY+gaPozlbj4tXAmz2e1zvuogD3RcfyZXWnunHbg8vZZQ8eUqJsgtiAAo
         1td0UoIA6r+PPuRza9KNUo7lrVwb/DsknsO+UUfCoxuuKHV66SVe5ee0bEt5Hex7wu2s
         wdAocGJXyuko5xGvqbOLQvMJwBkTfsrgcqcbTTKaRzg5V2k14ptOWEu+Cfjxc040T+6B
         vZFZQuz+gECxcs5WT+ertdrRMyKUCQH33QWodBYYH6XpnVt3a3Tp+InQbgftRq8lwdXU
         /G2dTrKYSERjcLFBwnFbDXupEGFJjwt/6/bPmio3A7QCDXRuyFbvP/BvmNCHZRmfyVnW
         xugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763057709; x=1763662509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWTFHfx/DiJXyn64uWJ3+snK0tLvmOFswE1JnWkvO6w=;
        b=BIpQHorLk2/FoSeeZYzIdJXa7oy8pCLd6+AWjMa2+uBciwbuuPdi+/9kahwl8sGyeS
         N8L4nzcXCqxcvk5UUk5ssZ/vxNuMTb8sn6b6Fpo7HBvRo9b6xKhXOK4Ti5FbsT4hy2JG
         JD8qYPAZHTRTlCGE1BuRvnq7vMXSY3TkzJZNMshXkBViFz4UBu5BmRW7KCHqFQGoNlKv
         XE3QUzVFYPyVKtG/sLi5SQgkxr625wKPz6jwdxpQeb4m8hS+ZHNauXYKi9JaVc9IBzwg
         Rz67OV6rZYVaz4b2VZg8YnlPA2uLMX9hFO7dQ3reS4ftlrK8cFuis+sXSnTLzpZmVP20
         kHAQ==
X-Gm-Message-State: AOJu0YwYfQEBe3Xa+JYFpCWSwkkKAcEqaP2QufjX4K0FkDBdmboYZEpx
	gn1pRUmOqfrBxkS4GMSBUOkZlR5VQkUC4cA28k//6cHdqSqrqr59HUdzTYqMjK1yK4DFniw0J6h
	epGNJLQVVO3Wc63Ym9I2yZf40s9W+gxs=
X-Gm-Gg: ASbGncus3pHGLIGb79AXQtcpL4Ao8xpmx8mvW1SFSk0+hNSXPihuZw17NH8bGnv0bDY
	zfEJGddvvzZNVgbDVnEfvRPOfxLk3YcvVCAoMd1Cxyf3y0YRnhiJWgTlHOy5nzz2cNd5VqJC2mL
	1Km7+Q6UP4/HrkFASl/PAWPEE4LFkhpQ+iIHHNWwokEzfccEB5uLc13ioyp/cjLuFixWsWx3e78
	6y2eIGreIl6Fy9ahH7if/B5KcrCC348E1srQSE+fknmdp2m1JDrg1XoyVdxwHN704P1dAuGBb6i
	zakvSbnDfPRnz+o0ZZAagU1Xodan8P2X7zjfSiTUbAM9SoHcYgHhACG9iPUYwz9uR7W6fYHDw/C
	0Owapwvojz79dJT51a4iX7uY7YJ7vRcw=
X-Google-Smtp-Source: AGHT+IFHMRe+ATozmdSbmDJDIHIj9szg9z/HZYl1yT0Y1HIhGXvqvQbecIWsCHw//9ZEf8BoTTMqPcV63FUU8SRT6BI=
X-Received: by 2002:a05:690e:2597:b0:63f:9fcb:2050 with SMTP id
 956f58d0204a3-641e76472cdmr207504d50.50.1763057708648; Thu, 13 Nov 2025
 10:15:08 -0800 (PST)
MIME-Version: 1.0
References: <20251113053608.809770-1-nikhil.r@bmwtechworks.in>
In-Reply-To: <20251113053608.809770-1-nikhil.r@bmwtechworks.in>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2025 10:14:42 -0800
X-Gm-Features: AWmQ_bnjQMa1MoJ3PgFZjonT1K-RAqRx-FyUSn13_JeYeQUi_RdIIbz-WYeMD2s
Message-ID: <CAMKF1sqLz1aNvBYF1bHj6OFtGyUi+hcfJuEHPnZ0AnKpj6VBVw@mail.gmail.com>
Subject: Re: [oe][master][PATCH] protobuf: Remove embedded runpath
To: nikhil.r@bmwtechworks.in
Cc: openembedded-devel@lists.openembedded.org, 
	Sana Kazi <Sana.Kazi@bmwtechworks.in>
Content-Type: multipart/alternative; boundary="000000000000714d5706437ddc39"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 18:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121654

--000000000000714d5706437ddc39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 9:36=E2=80=AFPM Nikhil R via lists.openembedded.org
<nikhil.r=3Dbmwtechworks.in@lists.openembedded.org> wrote:

> Remove the runpath embedded in libprotobuf.so.31.1.0 by setting
> CMAKE_SKIP_INSTALL_RPATH=3DON
> CMAKE_SKIP_BUILD_RPATH=3DON
>
> The embedded runpath can easily enable an attacker
> to get malicious code executed if there is some issue
> with the file permissions at the specified location.
>
> Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
> Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
> index 90be1179aa..7479574d93 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
> @@ -42,6 +42,8 @@ EXTRA_OECMAKE +=3D "\
>      -Dprotobuf_BUILD_EXAMPLES=3DOFF \
>      -Dprotobuf_ABSL_PROVIDER=3D"package" \
>      -Dprotobuf_JSONCPP_PROVIDER=3D"package" \
> +    -DCMAKE_SKIP_INSTALL_RPATH=3DON  \
> +    -DCMAKE_SKIP_BUILD_RPATH=3DON \
>  "
>

This breaks ptest build. see

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4142742/raw_inlin=
e

You have to add 'ptest' to DISTRO_FEATURES to reproduce it.


>
>  TEST_SRC_DIR =3D "examples"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121597):
> https://lists.openembedded.org/g/openembedded-devel/message/121597
> Mute This Topic: https://lists.openembedded.org/mt/116270151/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000714d5706437ddc39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 12,=
 2025 at 9:36=E2=80=AFPM Nikhil R via <a href=3D"http://lists.openembedded.=
org">lists.openembedded.org</a> &lt;nikhil.r=3D<a href=3D"mailto:bmwtechwor=
ks.in@lists.openembedded.org">bmwtechworks.in@lists.openembedded.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Remove =
the runpath embedded in libprotobuf.so.31.1.0 by setting<br>
CMAKE_SKIP_INSTALL_RPATH=3DON<br>
CMAKE_SKIP_BUILD_RPATH=3DON<br>
<br>
The embedded runpath can easily enable an attacker<br>
to get malicious code executed if there is some issue<br>
with the file permissions at the specified location.<br>
<br>
Signed-off-by: Nikhil R &lt;<a href=3D"mailto:nikhil.r@bmwtechworks.in" tar=
get=3D"_blank">nikhil.r@bmwtechworks.in</a>&gt;<br>
Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@bmwtechworks.in" t=
arget=3D"_blank">Sana.Kazi@bmwtechworks.in</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_6.31.1.b=
b" rel=3D"noreferrer" target=3D"_blank">protobuf_6.31.1.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_6=
.31.1.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_6.31.1.bb</a> b/met=
a-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_6.31.1.bb" rel=3D=
"noreferrer" target=3D"_blank">protobuf_6.31.1.bb</a><br>
index 90be1179aa..7479574d93 100644<br>
--- a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_6.31.1.b=
b" rel=3D"noreferrer" target=3D"_blank">protobuf_6.31.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_6.31.1.b=
b" rel=3D"noreferrer" target=3D"_blank">protobuf_6.31.1.bb</a><br>
@@ -42,6 +42,8 @@ EXTRA_OECMAKE +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0-Dprotobuf_BUILD_EXAMPLES=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0-Dprotobuf_ABSL_PROVIDER=3D&quot;package&quot; \<br>
=C2=A0 =C2=A0 =C2=A0-Dprotobuf_JSONCPP_PROVIDER=3D&quot;package&quot; \<br>
+=C2=A0 =C2=A0 -DCMAKE_SKIP_INSTALL_RPATH=3DON=C2=A0 \<br>
+=C2=A0 =C2=A0 -DCMAKE_SKIP_BUILD_RPATH=3DON \<br>
=C2=A0&quot;<br></blockquote><div><br></div><div>This breaks ptest build. s=
ee</div><div><br></div><div><a href=3D"https://autobuilder.yoctoproject.org=
/valkyrie/api/v2/logs/4142742/raw_inline">https://autobuilder.yoctoproject.=
org/valkyrie/api/v2/logs/4142742/raw_inline</a></div><div><br></div><div>Yo=
u have to add &#39;ptest&#39; to DISTRO_FEATURES to reproduce it.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0TEST_SRC_DIR =3D &quot;examples&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121597): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121597" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121597</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116270151/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116270151/1997914</a><br>
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

--000000000000714d5706437ddc39--

