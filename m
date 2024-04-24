Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366B0C07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 14:40:37 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.18114.1713969634829606831
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 07:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RLiU/tkd;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-617d25b2bc4so72417987b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 07:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713969634; x=1714574434; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bLJQU7/RF5PIcXSq4Gymk6YjfohtQgGdbkH//PGnTsY=;
        b=RLiU/tkdHo49qdryKb270nME9//o25XXcbUijqSNgXixGcQkheCtypsQjuRobwg4LE
         38pZRCbmMZ6P8Rsj6gwaP/7ILsS7H1n5kqtgndBOjBK9T9sGZjITV/3RmPKIz7gEl4vK
         DY2+R6rDiw84zuqCJzzqP1kNeonb9Rzt4K5+ukXDOpTos9iVwzHhGkMf120kFj6i4KGV
         D49ta2Epo2Ct9/Yi5uJ+1FYdwL6EhL7NI/BJtgPTUGQgcdxGIv1h0esWLWaMok0lMbtI
         lRIiFF5PlzTxv3mbSu50X+F1N/fjPfemxR/gA90+5/eb4GZ4EAl4Gt22Wwfxsw1tpTec
         GocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713969634; x=1714574434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLJQU7/RF5PIcXSq4Gymk6YjfohtQgGdbkH//PGnTsY=;
        b=CMGdznLY3Xbk1Y3I3In6euPtIRyKPTmet1DGsJr537On74ttgMIYsStU97x9FVGCf3
         kNnz5smqo4HBPUEBy6uJtjT9uo7MlKz+eMQvcxQypJu543t/YPEl/Ru7aqxXdS4bHtdl
         aIuvuHggY1A1+cETnTpwY+VdNQjt9a3Ng0YLC8lNluX/veKHjZVlfewTocmUacZ0dD+H
         Sr4AIFkqyxCoSay9MaXNujlydng45o89BW0pvnutnoi44j0bRCLhWcKcKY9Z9Nkl8hNc
         4r1sbFHE+jDVD6N7HR/EqQgJ/L1ayJvwt/qVMjZ8WMyjj7ORzvfBLwoyN7ermW+/GcrI
         7NKQ==
X-Gm-Message-State: AOJu0YyI+4t9yoVN0fYmHcN4KZqdqSPZjkERbcvLCWyj37I/w45fXNzs
	3l27um29bTVQW/OXh0yrlZhlnPsd/MBRFBw8f75neelZ8iivlhOnif11qDa2IhWw4dxyG0jqdDq
	FIUbIuU1hZEeb1aoIU5Gabll0mW4=
X-Google-Smtp-Source: AGHT+IGqPZQrYqZm9KwQyB7h3wrNLLMup2UdXlWI9G1Qr/WR/OlX4Zdr95/JCb3+ZDDrERxEoO8E3xUFb77NdJu0Cr0=
X-Received: by 2002:a05:690c:ecd:b0:61b:1c75:2077 with SMTP id
 cs13-20020a05690c0ecd00b0061b1c752077mr3293511ywb.7.1713969633853; Wed, 24
 Apr 2024 07:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240424132329.2706-1-f_l_k@t-online.de>
In-Reply-To: <20240424132329.2706-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Apr 2024 16:40:21 +0200
Message-ID: <CAMKF1so6r93QEzxrMV_j5EieO_vvbLkC0PgfBSmrh2K2SqqoQA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 1/3] gupnp: dont package source
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002e8af30616d8a7ab"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 14:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110130

--0000000000002e8af30616d8a7ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 3:23=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Source code contains reference to tmpdir. Dont package to avoid
> reproducibility issue


Can we root cause it instead ? Removing sources from debug info might fix
this issue but degrade debugging experience

>
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb | 1 +
>  meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
> b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
> index f2e27622c..c7fee78a8 100644
> --- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
> @@ -28,5 +28,6 @@ PACKAGECONFIG[sniffer] =3D
> "-Dsniffer=3Dtrue,-Dsniffer=3Dfalse,gtk4,"
>  REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG',
> 'sniffer', 'opengl', '', d)}"
>
>  PACKAGES =3D+ "gssdp-tools"
> +PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
>
>  FILES:gssdp-tools =3D "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
> b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
> index f1628d82e..80d0b3e2d 100644
> --- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
> @@ -18,4 +18,5 @@ gupnp_sysroot_preprocess () {
>
>  FILES:${PN}-dev +=3D "${bindir}/gupnp-binding-tool*"
>
> +PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
>  RDEPENDS:${PN}-dev +=3D "python3-core python3-xml"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110125):
> https://lists.openembedded.org/g/openembedded-devel/message/110125
> Mute This Topic: https://lists.openembedded.org/mt/105709729/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002e8af30616d8a7ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Apr 24, 2024 at 3:23=E2=80=AFPM Markus Volk via <a =
href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;f_l_k=
=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-online.de@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Sou=
rce code contains reference to tmpdir. Dont package to avoid<br>
reproducibility issue</blockquote><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Can we root cause it instead ? Removing sources from debug info might =
fix this issue but degrade debugging experience=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex" dir=3D"auto"><br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta-multimedia/recipes-connectivity/gupnp/<a href=3D"http://gssdp_1.=
6.3.bb" rel=3D"noreferrer" target=3D"_blank">gssdp_1.6.3.bb</a> | 1 +<br>
=C2=A0meta-multimedia/recipes-connectivity/gupnp/<a href=3D"http://gupnp_1.=
6.6.bb" rel=3D"noreferrer" target=3D"_blank">gupnp_1.6.6.bb</a> | 1 +<br>
=C2=A02 files changed, 2 insertions(+)<br>
<br>
diff --git a/meta-multimedia/recipes-connectivity/gupnp/<a href=3D"http://g=
ssdp_1.6.3.bb" rel=3D"noreferrer" target=3D"_blank">gssdp_1.6.3.bb</a> b/me=
ta-multimedia/recipes-connectivity/gupnp/<a href=3D"http://gssdp_1.6.3.bb" =
rel=3D"noreferrer" target=3D"_blank">gssdp_1.6.3.bb</a><br>
index f2e27622c..c7fee78a8 100644<br>
--- a/meta-multimedia/recipes-connectivity/gupnp/<a href=3D"http://gssdp_1.=
6.3.bb" rel=3D"noreferrer" target=3D"_blank">gssdp_1.6.3.bb</a><br>
+++ b/meta-multimedia/recipes-connectivity/gupnp/<a href=3D"http://gssdp_1.=
6.3.bb" rel=3D"noreferrer" target=3D"_blank">gssdp_1.6.3.bb</a><br>
@@ -28,5 +28,6 @@ PACKAGECONFIG[sniffer] =3D &quot;-Dsniffer=3Dtrue,-Dsniff=
er=3Dfalse,gtk4,&quot;<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;${@bb.utils.contains(&#39;PACKAGEC=
ONFIG&#39;, &#39;sniffer&#39;, &#39;opengl&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;gssdp-tools&quot;<br>
+PACKAGE_DEBUG_SPLIT_STYLE =3D &quot;debug-without-src&quot;<br>
<br>
=C2=A0FILES:gssdp-tools =3D &quot;${bindir}/gssdp* ${datadir}/gssdp/*.glade=
&quot;<br>
diff --git a/meta-multimedia/recipes-connectivity/gupnp/<a href=3D"http://g=
upnp_1.6.6.bb" rel=3D"noreferrer" target=3D"_blank">gupnp_1.6.6.bb</a> b/me=
ta-multimedia/recipes-connectivity/gupnp/<a href=3D"http://gupnp_1.6.6.bb" =
rel=3D"noreferrer" target=3D"_blank">gupnp_1.6.6.bb</a><br>
index f1628d82e..80d0b3e2d 100644<br>
--- a/meta-multimedia/recipes-connectivity/gupnp/<a href=3D"http://gupnp_1.=
6.6.bb" rel=3D"noreferrer" target=3D"_blank">gupnp_1.6.6.bb</a><br>
+++ b/meta-multimedia/recipes-connectivity/gupnp/<a href=3D"http://gupnp_1.=
6.6.bb" rel=3D"noreferrer" target=3D"_blank">gupnp_1.6.6.bb</a><br>
@@ -18,4 +18,5 @@ gupnp_sysroot_preprocess () {<br>
<br>
=C2=A0FILES:${PN}-dev +=3D &quot;${bindir}/gupnp-binding-tool*&quot;<br>
<br>
+PACKAGE_DEBUG_SPLIT_STYLE =3D &quot;debug-without-src&quot;<br>
=C2=A0RDEPENDS:${PN}-dev +=3D &quot;python3-core python3-xml&quot;<br>
-- <br>
2.44.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110125): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110125" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110125</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105709729/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105709729/1997914</a><br>
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

--0000000000002e8af30616d8a7ab--

