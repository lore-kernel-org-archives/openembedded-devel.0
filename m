Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1409C54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 15:32:32 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.16610.1711121545013865701
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 08:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BWpayScH;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-609408d4b31so23088947b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 08:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711121544; x=1711726344; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TuKvXR3I5QPb6OhO45HO0/hOZR/rcdhJYiR/1qLSTtM=;
        b=BWpayScHMcrGj+D2/JAQiS7yB8WittdBqe+wvkPNgBL+A+JsEohI9wjQhKJlXuP5k0
         BkKzoOzEfRuYp8e2uEWT5OzITQNpv/7IOMrPBNpOsvZTrKeR3IX2HL6c2uz78rA+F4y4
         elWpcN9LtiCiFEPi7cXZyWUEfBhDhuxPBifKjeccfpRyB05ptmv0O/UKHOkU5KUBkN5R
         MsfKZnhKI+BXc8PFRQTWUXvV8nAT9ZDIOPYPXx2i9nw6H2PQhaux3n9ciJX0xG+VF3HP
         mDDTyV1lwl+9S1Oup4EkHedODSZA+NPjbg0X7iOvgZoc0iu8pawZ0JnHYb+41xS7/9dH
         d+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711121544; x=1711726344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TuKvXR3I5QPb6OhO45HO0/hOZR/rcdhJYiR/1qLSTtM=;
        b=r6GUstREmNMSr875wrQ3RuOLor5s8dU8+hadH+eFcRmAqz5MFedbblO8HLYMS+Z9pm
         U45DcWWqwSr74suVrNKtq5DkIpLcThwc1LSdJHTpei0sGL3fdQHVkXdkfyXCfO4qvlMb
         C2d1pPCzwJWlgadGsUbpUHp50StfE0aD4wGoo+o1No49+pR23sk3VAg3UHjUdke4L+sH
         OzTxJF24mdhf500san3Cu6UROQGVcFi6RlhH81DNOk3Hi2TMHCNrvwB88j2Tkb5guvoV
         38jtUK042byC+n5NAZ0NwI1CWpeWLYxkFO4V2MCLt2aytAYDyWtR0DN9h5Y808KtG06u
         EQaA==
X-Gm-Message-State: AOJu0Yx/J06Dr3x/VtIQotR0yc1/0pFy1CYANO9xgU5PSoVisKKi/nzG
	7yj3Gu4oi0xQUXPOF2eRefDU1R5nf367oHII/OsdiDjtKU2u5EbClNJrcC2A9UCz6mzb5FZIczT
	Y+LKqKt5QIR9R/jpZjE6Kd9lXLuI=
X-Google-Smtp-Source: AGHT+IGGLsjvmNB09NcuPwKhXIngUzPVOqEV0WIUEHXUS8b0XKBUUK70JDvpb85v8hsZlAV51BPK4RPhNXvcf9t1rBg=
X-Received: by 2002:a81:80c3:0:b0:610:ce52:8c3e with SMTP id
 q186-20020a8180c3000000b00610ce528c3emr2670340ywf.30.1711121543985; Fri, 22
 Mar 2024 08:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240318200925.1197695-1-geoffrey.parker@arthrex.com>
In-Reply-To: <20240318200925.1197695-1-geoffrey.parker@arthrex.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 22 Mar 2024 08:32:12 -0700
Message-ID: <CANx9H-AHrLYowAVPeFG1mzKb_D=oAEB820XPQ-6tCj4CNCE6hA@mail.gmail.com>
Subject: Re: [oe] [meta-java][PATCH] layer.conf: Mark as compatible with scarthgap
To: Geoff Parker <geoffhp@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, heinold@inf.fu-berlin.de, 
	mario@ossystems.com.br, maxin.john@intel.com, otavio@ossystems.com.br, 
	Geoff Parker <geoffrey.parker@arthrex.com>
Content-Type: multipart/alternative; boundary="000000000000cbfff206144187b7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 15:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109521

--000000000000cbfff206144187b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged.
https://git.yoctoproject.org/meta-java/commit/?id=3D4799a6291223467311d24ed=
3e1af367aadea122e
Scarthgap branch created (it will parallel track with master until after
the release when Styhead begins development).

Thank you for your contribution. It is very much appreciated.

On Mon, Mar 18, 2024 at 1:17=E2=80=AFPM Geoff Parker <geoffhp@gmail.com> wr=
ote:

> From: Geoff Parker <geoffrey.parker@arthrex.com>
>
> LAYERSERIES_COMPAT: replace nanbield with scarthgap for Yocto 5.0
>
> Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index b6bf909..71d6a10 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS +=3D "meta-java"
>  BBFILE_PATTERN_meta-java :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-java =3D "10"
> -LAYERSERIES_COMPAT_meta-java =3D "nanbield"
> +LAYERSERIES_COMPAT_meta-java =3D "scarthgap"
>  LAYERDEPENDS_meta-java +=3D "openembedded-layer"
>
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109413):
> https://lists.openembedded.org/g/openembedded-devel/message/109413
> Mute This Topic: https://lists.openembedded.org/mt/105011412/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cbfff206144187b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Merged.=C2=A0<a href=3D"https://git.yoctoproject.org/meta-=
java/commit/?id=3D4799a6291223467311d24ed3e1af367aadea122e">https://git.yoc=
toproject.org/meta-java/commit/?id=3D4799a6291223467311d24ed3e1af367aadea12=
2e</a><div>Scarthgap branch created (it will parallel track with master unt=
il after the release when Styhead begins development).</div><div><br></div>=
<div>Thank you for your contribution. It is very=C2=A0much appreciated.</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, Mar 18, 2024 at 1:17=E2=80=AFPM Geoff Parker &lt;<a href=3D"mailt=
o:geoffhp@gmail.com">geoffhp@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">From: Geoff Parker &lt;<a href=3D"mai=
lto:geoffrey.parker@arthrex.com" target=3D"_blank">geoffrey.parker@arthrex.=
com</a>&gt;<br>
<br>
LAYERSERIES_COMPAT: replace nanbield with scarthgap for Yocto 5.0<br>
<br>
Signed-off-by: Geoff Parker &lt;<a href=3D"mailto:geoffrey.parker@arthrex.c=
om" target=3D"_blank">geoffrey.parker@arthrex.com</a>&gt;<br>
---<br>
=C2=A0conf/layer.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/conf/layer.conf b/conf/layer.conf<br>
index b6bf909..71d6a10 100644<br>
--- a/conf/layer.conf<br>
+++ b/conf/layer.conf<br>
@@ -7,7 +7,7 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.bbappend&quot;<br>
=C2=A0BBFILE_COLLECTIONS +=3D &quot;meta-java&quot;<br>
=C2=A0BBFILE_PATTERN_meta-java :=3D &quot;^${LAYERDIR}/&quot;<br>
=C2=A0BBFILE_PRIORITY_meta-java =3D &quot;10&quot;<br>
-LAYERSERIES_COMPAT_meta-java =3D &quot;nanbield&quot;<br>
+LAYERSERIES_COMPAT_meta-java =3D &quot;scarthgap&quot;<br>
=C2=A0LAYERDEPENDS_meta-java +=3D &quot;openembedded-layer&quot;<br>
<br>
=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109413): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109413" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109413</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105011412/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105011412/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cbfff206144187b7--

