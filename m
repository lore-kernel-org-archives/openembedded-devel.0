Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8466FC61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 18:25:31 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.29096.1700677522137578146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Nov 2023 10:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Af0bZpr3;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5cce5075bd6so1163817b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 10:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700677521; x=1701282321; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+IbHGCi+8Z/JUNX34LWA6rjoqPRTPXEEE48sytnaShs=;
        b=Af0bZpr3IqxuyUs4NIXmuzPBLZLMkaw4s0nGIgwSTpbaYprML6xtYal/a9xoScF7ql
         BW3qIxcYD+jcsz4wPor1Z2KBeBdqvBDRjrantecn7cvbcPmibhZ21UCGOH1tFm+TJwHd
         GkZ7zG1ZiLkL/lt4GmCefy3CrQlDe7a4718lo1sob08pvKSZX3yAqtDxagj161PV/tn8
         PLFtcRtNzGyPhNgmk6opk11SlmmwJ7fLwjfVvYRq4v51OAwGo1EK50QWLGq0A5nYEjQm
         VvW0MVH5RsCsUvVIB71lhRKYfJ03UEL+zwHDaJL6hZAl4cqOiMQRC3u2vDNIG+bvMp0H
         mmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677521; x=1701282321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IbHGCi+8Z/JUNX34LWA6rjoqPRTPXEEE48sytnaShs=;
        b=UEJmzMeKyY9BGP2kAjCgfhKVZ/rx58KcVIxlk+Q+U9OAS/ULnp6bSVcuchqzcPFDex
         MH7nIYV3Av2Mv5X/IMm3ADMtxCFnP7U+IAIf4dB16h2c27YdIh4dZFEN5bU2LRokfllY
         YGLnZs295/tN8KJ/EnM/7I4PrVCQS8eMHHk3zSLxsF1XCskE+LLCwZT80j5MyggXsdrK
         Lw7EzLIrDHxTYnnmChp6w+OQRN0Ot09gku0xYOY6N6AhuJ2e8MVzGozq98i8Pif0mAVj
         GxBfGSo4gvo1j8XzL7LnUatoN24S3TaDOiarqJA19jk+YLViYMz03mpVezyaUoWcDAn5
         jpbQ==
X-Gm-Message-State: AOJu0YxVmqZ1YZ366NCn2q1LM4F8YmA2Remc03TgAuseWL54egwDWV7U
	JI/MbQdAAcnCY+owxHhfaTbteFjbpoiDDLEAn7Q=
X-Google-Smtp-Source: AGHT+IFFXUT36HsuQRo7g9qjoilcjS0DzMwbXTbKt7Qv3UJomsbXwa1znhmNFSe0I7XElKeh4jVduTvaxqgsj/YgrtM=
X-Received: by 2002:a0d:e6cc:0:b0:5cc:d88c:ea19 with SMTP id
 p195-20020a0de6cc000000b005ccd88cea19mr315236ywe.6.1700677521160; Wed, 22 Nov
 2023 10:25:21 -0800 (PST)
MIME-Version: 1.0
References: <20231122135814.73695-1-anthony.bagwell@hivehome.com>
In-Reply-To: <20231122135814.73695-1-anthony.bagwell@hivehome.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 22 Nov 2023 10:25:10 -0800
Message-ID: <CANx9H-DF-2QzOrFsQWg-wo4eBJNFJUQo=k+myTsYvbT6ppuHnA@mail.gmail.com>
Subject: Re: [oe] [meta-java][PATCH] layer.conf: Mark as compatible with nanbield
To: Anthony Bagwell <aj.bagwell@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	AJ Bagwell <anthony.bagwell@hivehome.com>
Content-Type: multipart/alternative; boundary="00000000000086beb2060ac1d7ee"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 18:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107013

--00000000000086beb2060ac1d7ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have created the mickledore branches on git.yoctoproject.org,
github.com/meta-java and gitlab.com/meta-java

I will edit in place to drop mickledore and replace with nanbield for
"master" branches

Thank you for the contribution.

On Wed, Nov 22, 2023 at 5:58=E2=80=AFAM Anthony Bagwell <aj.bagwell@gmail.c=
om>
wrote:

> Signed-off-by: AJ Bagwell <anthony.bagwell@hivehome.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index c571df5..fb8590e 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS +=3D "meta-java"
>  BBFILE_PATTERN_meta-java :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-java =3D "10"
> -LAYERSERIES_COMPAT_meta-java =3D "mickledore"
> +LAYERSERIES_COMPAT_meta-java =3D "mickledore nanbield"
>  LAYERDEPENDS_meta-java +=3D "openembedded-layer"
>
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> --
> 2.39.3 (Apple Git-145)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107012):
> https://lists.openembedded.org/g/openembedded-devel/message/107012
> Mute This Topic: https://lists.openembedded.org/mt/102748646/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000086beb2060ac1d7ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have created the mickledore branches on <a href=3D"=
http://git.yoctoproject.org">git.yoctoproject.org</a>, <a href=3D"http://gi=
thub.com/meta-java">github.com/meta-java</a> and <a href=3D"http://gitlab.c=
om/meta-java">gitlab.com/meta-java</a></div><div><br></div><div>I will edit=
 in place to drop mickledore and replace with nanbield for &quot;master&quo=
t; branches</div><div><br></div><div>Thank you for the contribution.</div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 Nov 22, 2023 at 5:58=E2=80=AFAM Anthony Bagwell &lt;<a href=3D"mailto:aj.b=
agwell@gmail.com">aj.bagwell@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Signed-off-by: AJ Bagwell &lt;<a href=
=3D"mailto:anthony.bagwell@hivehome.com" target=3D"_blank">anthony.bagwell@=
hivehome.com</a>&gt;<br>
---<br>
=C2=A0conf/layer.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/conf/layer.conf b/conf/layer.conf<br>
index c571df5..fb8590e 100644<br>
--- a/conf/layer.conf<br>
+++ b/conf/layer.conf<br>
@@ -7,7 +7,7 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.bbappend&quot;<br>
=C2=A0BBFILE_COLLECTIONS +=3D &quot;meta-java&quot;<br>
=C2=A0BBFILE_PATTERN_meta-java :=3D &quot;^${LAYERDIR}/&quot;<br>
=C2=A0BBFILE_PRIORITY_meta-java =3D &quot;10&quot;<br>
-LAYERSERIES_COMPAT_meta-java =3D &quot;mickledore&quot;<br>
+LAYERSERIES_COMPAT_meta-java =3D &quot;mickledore nanbield&quot;<br>
=C2=A0LAYERDEPENDS_meta-java +=3D &quot;openembedded-layer&quot;<br>
<br>
=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
-- <br>
2.39.3 (Apple Git-145)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107012): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107012" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107012</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102748646/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/102748646/924729</a><br>
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

--00000000000086beb2060ac1d7ee--

