Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AD3C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 23:36:49 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.34910.1712878602853592603
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 16:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DyJNspyN;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso388258276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 16:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712878602; x=1713483402; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ylw02UjQP0b6DB9MSxgHOGK8TecmyY8ihmqXsBJZgoU=;
        b=DyJNspyNV7Ga0mv/YspEeyXCVgV6FJ+S+t+bsrPx24kUnRxVORdzsZFTMwbC68054W
         x5b3kUrmQ13Zx6RbGCq2glCBoocACh7w+urApaK23E70iO2LjxSDGl0W3mQ/2xY8oFAE
         /SBY50mhrgR3Gugd8QLUlFejZU23JpiA/U8gdr1kVdgXSjgKpYv1fPizyfg2K//OiXVq
         r+HgpX3iouvkCtMK7paIBEYW+8MgQcmrvVcchJzomt5h+2D3kwZtQRDCoCeHDXwcAiz2
         aVXR5RyETX0K9y4fxufsN7JHLartWx24hC+mg1r8NliVqlPQ3kn6gd5pw+HiG922Nzm/
         1/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712878602; x=1713483402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ylw02UjQP0b6DB9MSxgHOGK8TecmyY8ihmqXsBJZgoU=;
        b=FkRIJ0TFsGDmV9ahgWVx4hp0/RsMpW+756m4nm4gPyyQJZ1PNQuekZ9yfD9rNjsbBE
         d6LY69dbYaxbTvFSBIOQHBUbrwzK5jivOoupb6TeO2t4/SY26w6EWx8+5DIW78ygM9lX
         XtH5vdyIov0QCT+nSDFOnOiRc4zmNWYApk7JUOnYQpAO3SIRrtBYI0dkoCrT92uD5ftg
         sfGp3+MVV1LO0rn191gHpCw9sPgiiD5e8JdDQ/Jxg82OvRe34eyFIfkyNRx76mCD/VQu
         +IUUL3p1WT62Q/aqfyxHmdQchGgx18lE3XhshFTZFjneM9+Hg/oKAgCScX3z7x9NDFiE
         wj5g==
X-Forwarded-Encrypted: i=1; AJvYcCWH2KRb1vlUC7RL66uwY3KgQZ3ll5huDbSqwn373jRGvvF/z4KUGu5aJtAfD+N6HFK2Jxc/g3tJJpo4UHORD1p4yOQn+W/8jnFrJvr5cblky/DVV6akrrgKUQ==
X-Gm-Message-State: AOJu0YwvRWQpnDhxCkckOcXSijQRkLTe7jhnxyLMtcbi/3aSFbJholNm
	Xfoi3JMlni7e5FP+9XGQiTdb5VFjguGkI+bBiMzcZgevdxJACJlwCo04QJRxqZgO26vrRPBiJRH
	f/cy5zZGV8AOuO3derhs8qAVlME0=
X-Google-Smtp-Source: AGHT+IFpHMBzzrd2WwTZaj/omX89J0hYJxgXadDlPBC9z4uqEu14odCctZtysFpAqXKeO3Uzw2UWn+67EyXCSspP0NM=
X-Received: by 2002:a25:9b46:0:b0:dcc:2f09:4742 with SMTP id
 u6-20020a259b46000000b00dcc2f094742mr956066ybo.51.1712878601892; Thu, 11 Apr
 2024 16:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240411192456.2974073-1-geoffrey.parker@arthrex.com>
In-Reply-To: <20240411192456.2974073-1-geoffrey.parker@arthrex.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 11 Apr 2024 16:36:30 -0700
Message-ID: <CANx9H-D2TaLiwtPAWyPZU5hvDqxL8QOtQ+wX1c-NQCDjjh0Cxg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-tornado: extend for native
 and nativesdk
To: Geoff Parker <geoffhp@gmail.com>
Cc: Geoff Parker <geoffrey.parker@arthrex.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009bfc6c0615daa050"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 23:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109929

--0000000000009bfc6c0615daa050
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please indicate you personally built both conditions all dependencies were
met. I am fairly certain this was dropped because we had a conflict.

On Thu, Apr 11, 2024 at 12:33=E2=80=AFPM Geoff Parker <geoffhp@gmail.com> w=
rote:

> From: Geoff Parker <geoffrey.parker@arthrex.com>
>
> Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> ---
>  meta-python/recipes-devtools/python/python3-tornado_6.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
> b/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
> index e3d0209e1..08c8672eb 100644
> --- a/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
> @@ -37,3 +37,5 @@ PACKAGES =3D+ "\
>  FILES:${PN}-test =3D " \
>      ${libdir}/${PYTHON_DIR}/site-packages/*/test \
>  "
> +
> +BBCLASSEXTEND  +=3D "native nativesdk"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109924):
> https://lists.openembedded.org/g/openembedded-devel/message/109924
> Mute This Topic: https://lists.openembedded.org/mt/105470003/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009bfc6c0615daa050
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please indicate you personally built both conditions all =
dependencies were met. I am fairly certain this was dropped because we had =
a conflict.</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Apr 11, 2024 at 12:33=E2=80=AFPM Geoff Parker &lt;<=
a href=3D"mailto:geoffhp@gmail.com">geoffhp@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-colo=
r:rgb(204,204,204)">From: Geoff Parker &lt;<a href=3D"mailto:geoffrey.parke=
r@arthrex.com" target=3D"_blank">geoffrey.parker@arthrex.com</a>&gt;<br>
<br>
Signed-off-by: Geoff Parker &lt;<a href=3D"mailto:geoffrey.parker@arthrex.c=
om" target=3D"_blank">geoffrey.parker@arthrex.com</a>&gt;<br>
---<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-tornado=
_6.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.4.bb</a> | =
2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
tornado_6.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.4.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-tornad=
o_6.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.4.bb</a><b=
r>
index e3d0209e1..08c8672eb 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-tornado=
_6.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.4.bb</a><br=
>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-tornado=
_6.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.4.bb</a><br=
>
@@ -37,3 +37,5 @@ PACKAGES =3D+ &quot;\<br>
=C2=A0FILES:${PN}-test =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/${PYTHON_DIR}/site-packages/*/test \<br>
=C2=A0&quot;<br>
+<br>
+BBCLASSEXTEND=C2=A0 +=3D &quot;native nativesdk&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109924): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109924" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109924</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105470003/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105470003/924729</a><br>
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

--0000000000009bfc6c0615daa050--

