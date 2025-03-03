Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2312C282C6
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 18:29:38 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.2413.1741026572576310528
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Mar 2025 10:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fbB9s0Kq;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2bcbfad2f8cso2390018fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 10:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741026572; x=1741631372; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JSmzXhfDSgbHfmfyVYmGEkzPr32LYbmNZEBf9clJYl4=;
        b=fbB9s0KqYOn1V80skRBTsZrrLZT/rNC9ZNZWFEvnf9lty5fdC0FgFh2D9Qctjh3K8w
         9xbUyJ1ypDj3q6ANANvOxXhi68sL3LOm1K5v27lLb06geo/QAT9HZQP3X/20gsPJVjlY
         U/muUQYm1ig1jgw1qhkABby7cG3e6KpffKzt4roHzbre+obD6YVlLCHa7wwnfceIJUOc
         FklxmYMhzS84Wt72VLY/NVVxUi5ynVW33Fy551mKuN0KJJKg+0/hrG4NALoGHTxZz4wQ
         4ZGdJOKWfixAVLCQIg1Tmq24Z4AvUYzCnIDdU4ThlxY6Yk7EQ7L/SgmNA8KoDJ4W4Gar
         ssKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741026572; x=1741631372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSmzXhfDSgbHfmfyVYmGEkzPr32LYbmNZEBf9clJYl4=;
        b=N43wrgGJrzofGfefQ7HJt92wMCd62oDTrMpjAQrnGoKruvETWrw8uQHhURrNVv8inr
         RuNmpbru+lb8t5ewVFfIlnRnnEVnGSK+RxlsZpRxv/Q5jDiMezM+5L/4TOQKPhnjYGzM
         ZVO8BUN7vBczNMOFdSq2gJsGkZu0//vYKT+NycH/y0ktu/7XM9N9rmDxFmkbJMA7pH9M
         bon0gyDqQHw3mtgaeIAU/d/mYcs7U52+xCArdCAaf8lUcVO9DTMiaXXMoR31d9vZ7p2C
         27nlGXRgQ1gDXGJT0Kw8fRYUmWSm86j4pk6t8kw3hMKNgKcTm6X7RlQnzaZSZeOdc6kL
         +PzQ==
X-Gm-Message-State: AOJu0Yzq4gcrflzyeLM1yvE5+g3vexLBv1zSjwf2IOZuhTagf23JA5co
	N8w7z0SD1BZXCg2n6eWrs3LUtKGR6ktgsC6GDCCSp2LXk4NKdgnTnlVNdh8YTbC50YcLdPXJR79
	bSD39x2k34A8SOienPDpLggDeYW8=
X-Gm-Gg: ASbGncutmd0CEGJBSuBLKuQydRF2f/cPv5UGMwTOB/QmWd6f8MQtZLl8GbJh5mHUakG
	G85IWTbc7hs3eFo2jBdDhwSVXIsVhFLsnzNrMR6B1+eXBgm8WqM1dvalSzQf/hFlHCv1V5q+is+
	gCboDtxMmJ5RUa7NZlc4Y0Ra/JEhjIvuvv9VrfsZd/KZQrNYYN/S3hTVwM8c4=
X-Google-Smtp-Source: AGHT+IG4vhS3lCht+EvAwRu/TqvwKehkYNBYA8I8IfRdsfFgUzA36B9YbfX+hLWMqQLL540sQGaLe93oXX7zxW4axA0=
X-Received: by 2002:a05:6870:b909:b0:29f:8a1b:f76b with SMTP id
 586e51a60fabf-2c17836b07dmr9605241fac.9.1741026571764; Mon, 03 Mar 2025
 10:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20250303104252.3045713-1-f_l_k@t-online.de>
In-Reply-To: <20250303104252.3045713-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Mar 2025 10:29:08 -0800
X-Gm-Features: AQ5f1JoMM6-_-Ywp022caGCSeqk6fK6hqfCatxV2RfNKGwkMykD3wusN7F6SADo
Message-ID: <CAMKF1sqZx1C2=kUT_VYb3CpScnP2eAwDdx3OLexGWEHv-oUwwQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] mypaint: add m4 dir to autoconf macro
 search paths
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005accbd062f745658"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 18:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115727

--0000000000005accbd062f745658
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have already sent a fix for this couple of days back

On Mon, Mar 3, 2025 at 2:42=E2=80=AFAM Markus Volk via lists.openembedded.o=
rg
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
> b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
> index d509aa3dd0..ca6a115dd3 100644
> --- a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
> +++ b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
> @@ -19,6 +19,9 @@ SRCREV =3D "2768251dacce3939136c839aeca413f4aa4241d0"
>  PV =3D "1.6.1"
>  S =3D "${WORKDIR}/git"
>
> +# Needed for introspection.m4
> +EXTRA_AUTORECONF +=3D "-I m4"
> +
>  do_configure:append() {
>      # autogen uses python2 so generate headers ourselves
>      cd ${S}
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115724):
> https://lists.openembedded.org/g/openembedded-devel/message/115724
> Mute This Topic: https://lists.openembedded.org/mt/111485620/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005accbd062f745658
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I have already sent a fix for this couple of days back=C2=
=A0</div><div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Mar 3, 2025 at 2:42=E2=80=AFAM Markus=
 Volk via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-onl=
ine.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.d=
e" target=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta-gnome/recipes-gimp/mypaint/<a href=3D"http://libmypaint_git.bb" =
rel=3D"noreferrer" target=3D"_blank">libmypaint_git.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-gnome/recipes-gimp/mypaint/<a href=3D"http://libmypaint_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">libmypaint_git.bb</a> b/meta-gn=
ome/recipes-gimp/mypaint/<a href=3D"http://libmypaint_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">libmypaint_git.bb</a><br>
index d509aa3dd0..ca6a115dd3 100644<br>
--- a/meta-gnome/recipes-gimp/mypaint/<a href=3D"http://libmypaint_git.bb" =
rel=3D"noreferrer" target=3D"_blank">libmypaint_git.bb</a><br>
+++ b/meta-gnome/recipes-gimp/mypaint/<a href=3D"http://libmypaint_git.bb" =
rel=3D"noreferrer" target=3D"_blank">libmypaint_git.bb</a><br>
@@ -19,6 +19,9 @@ SRCREV =3D &quot;2768251dacce3939136c839aeca413f4aa4241d0=
&quot;<br>
=C2=A0PV =3D &quot;1.6.1&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
+# Needed for introspection.m4<br>
+EXTRA_AUTORECONF +=3D &quot;-I m4&quot;<br>
+<br>
=C2=A0do_configure:append() {<br>
=C2=A0 =C2=A0 =C2=A0# autogen uses python2 so generate headers ourselves<br=
>
=C2=A0 =C2=A0 =C2=A0cd ${S}<br>
-- <br>
2.48.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115724): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/115724" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/115724</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111485620/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111485620/1997914</a><br>
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

--0000000000005accbd062f745658--

