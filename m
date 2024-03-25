Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57605C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 14:59:13 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.54484.1711378746219359614
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 07:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PRPI6gP5;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso4281135276.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711378745; x=1711983545; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v+s/EE9N8hmUWdTFnRWTmBZ+H71bUcDrC46J1WtCv3k=;
        b=PRPI6gP5KZusKTnktveCHjcOdBgGU1iaW67F3n7ywf2ltL5UzOP4HbJd8c0+LZpUOW
         mN8VR8wE8WGXa/PM8wD/Fo/gCRl4XSF2HjadJ16C64ZEjU12xNtDNd+3ty5HqYtlvYcx
         3hP8Ip+UDu0fDxu6O/mkMdGQKYunHocpoR970k7N4c00y3aWM6ujhLNY+Jh3VW/uMeV+
         LM5bqrgVaOi9zLeONorKcWS6NCnpY3R6xSNqJf1uWWOau/4+mY7TyH3Qb3ithBmxZVMa
         bJcjQwNb9iTMlzij9ZImGFHjM17l+a0fx50h51idCmHrJFuxfCyIfGs9wm6H/UaBken/
         Ta6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711378745; x=1711983545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+s/EE9N8hmUWdTFnRWTmBZ+H71bUcDrC46J1WtCv3k=;
        b=CxOAj6BB0fuvXj194LsouToLbsPVubQR3j6uhluDUdSY2IGlD0miH2KCKAx4d7lQyQ
         PSpbk9+LLDzxSCQDz+dXnhxG5O7jL88ZX1BomrBvM+kvm9URgJPWBbHvD/U8ThurIshZ
         jFguqzdZQG3mh8CY7sRvPDgqs3FCBmTiNw7HdIVNMzPcxXdbHQL/v/rCzFVyrSgc4sT8
         tL3gmFHUvbptBoJEXI36fR97CPrBuifP1VSHGPgNVqv4yIskDQ1Hp7k8B8dUuHLO7f/m
         Kv4kg6YXkxdtVpAXYYNor2d1t154Y95a/mRbkWOALUbjxxq5vCWLEXh+wRaJzcSdWpvz
         fomw==
X-Gm-Message-State: AOJu0YxcvSqXy6rwPdK131tiyAsJVxQXOlwXYP+w/lUtfcm9yvoOrImV
	CXxTE4pJw+wh4ekU2xhxBx9nttnNdMxkDxavd8bEak+huRzK8e/EG5U83Sbbh5DUdsXDR/5bb3F
	XhqwY+pLrUeej9UgPh9wjmXOmefg=
X-Google-Smtp-Source: AGHT+IGw9xotuJm1iqhrew1GtDSoqO9u5m7pv4axXRMQQsgtog7JazKwiqdBtTHlLSwvq4t/djlYfspM9DYWgw8iyvM=
X-Received: by 2002:a25:c78f:0:b0:dcd:38f9:f78 with SMTP id
 w137-20020a25c78f000000b00dcd38f90f78mr5555976ybe.29.1711378745237; Mon, 25
 Mar 2024 07:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240325132603.2477-1-jermain.horsman@nedap.com> <20240325132603.2477-2-jermain.horsman@nedap.com>
In-Reply-To: <20240325132603.2477-2-jermain.horsman@nedap.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 25 Mar 2024 07:58:53 -0700
Message-ID: <CANx9H-DS7wfF2U5DrfTOM+GrxsufdW2J+VgHioUer03bbho=Uw@mail.gmail.com>
Subject: Re: [oe] [meta-java][PATCH 2/7] icedtea: Update URL for source downloads
To: jermain.horsman@nedap.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002fa82306147d6a9b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 14:59:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109589

--0000000000002fa82306147d6a9b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 6:27=E2=80=AFAM Jermain Horsman <jermain.horsman@ne=
dap.com>
wrote:

> From: Jermain Horsman <jermain.horsman@nedap.com>
>
> The old icedtea.classpath.org URL does not work anymore,
> update this to the icedtea.wildebeest.org URL used for other
> download sources.
>

icedtea.wildebeest.org has some older sources, but not the newest.

https://icedtea.classpath.org/download/source/ has some newer sources, but
perhaps the
path has changed?

https://icedtea.classpath.org/download/source/icedtea-2.1.3.tar.gz

I'll take this under review anyway, as is, since the old 2.1.3 version of
iceatea7-native we
are building still works from icedtea.wildebeest.org



> Also update both to use https.
>
> Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
> ---
>  recipes-core/icedtea/openjdk-7-release-03b147.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc
> b/recipes-core/icedtea/openjdk-7-release-03b147.inc
> index 16bf592..379fd9e 100644
> --- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
> +++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
> @@ -7,10 +7,10 @@ FILESPATH =3D. "${FILE_DIRNAME}/openjdk-7-03b147:"
>  # Force arm mode for now
>  ARM_INSTRUCTION_SET:armv4t =3D "ARM"
>
> -ICEDTEA_URI =3D "
> http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=3Dic=
ed"
> +ICEDTEA_URI =3D "
> https://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=3Di=
ced
> "
>
>  ICEDTEA_PREFIX =3D "icedtea7-forest-2.1"
> -ICEDTEA_HG_URL =3D "
> http://icedtea.classpath.org/hg/release/${ICEDTEA_PREFIX}"
> +ICEDTEA_HG_URL =3D "
> https://icedtea.wildebeest.org/hg/release/${ICEDTEA_PREFIX}"
>
>  OPENJDK_CHANGESET =3D "22cc03983e20"
>  OPENJDK_FILE_UPSTREAM =3D "${OPENJDK_CHANGESET}.tar.bz2"
> --
> 2.43.0.windows.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109580):
> https://lists.openembedded.org/g/openembedded-devel/message/109580
> Mute This Topic: https://lists.openembedded.org/mt/105137637/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002fa82306147d6a9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 25, 2024 at 6:27=E2=80=AF=
AM Jermain Horsman &lt;<a href=3D"mailto:jermain.horsman@nedap.com">jermain=
.horsman@nedap.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Jermain Horsman &lt;<a href=3D"mailto:jermain.horsm=
an@nedap.com" target=3D"_blank">jermain.horsman@nedap.com</a>&gt;<br>
<br>
The old <a href=3D"http://icedtea.classpath.org" rel=3D"noreferrer" target=
=3D"_blank">icedtea.classpath.org</a> URL does not work anymore,<br>
update this to the <a href=3D"http://icedtea.wildebeest.org" rel=3D"norefer=
rer" target=3D"_blank">icedtea.wildebeest.org</a> URL used for other<br>
download sources.<br></blockquote><div><br></div><div><a href=3D"http://ice=
dtea.wildebeest.org">icedtea.wildebeest.org</a> has some older sources, but=
 not the newest.</div><div><br></div><div><a href=3D"https://icedtea.classp=
ath.org/download/source/">https://icedtea.classpath.org/download/source/</a=
> has some newer sources, but perhaps the<br></div><div>path has changed?</=
div><div><br></div><div><a href=3D"https://icedtea.classpath.org/download/s=
ource/icedtea-2.1.3.tar.gz">https://icedtea.classpath.org/download/source/i=
cedtea-2.1.3.tar.gz</a><br></div><div><br></div><div>I&#39;ll take this und=
er review anyway, as is, since the old 2.1.3 version of iceatea7-native we<=
/div><div>are building still works from <a href=3D"http://icedtea.wildebees=
t.org">icedtea.wildebeest.org</a></div><div><br></div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
Also update both to use https.<br>
<br>
Signed-off-by: Jermain Horsman &lt;<a href=3D"mailto:jermain.horsman@nedap.=
com" target=3D"_blank">jermain.horsman@nedap.com</a>&gt;<br>
---<br>
=C2=A0recipes-core/icedtea/openjdk-7-release-03b147.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-co=
re/icedtea/openjdk-7-release-03b147.inc<br>
index 16bf592..379fd9e 100644<br>
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc<br>
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc<br>
@@ -7,10 +7,10 @@ FILESPATH =3D. &quot;${FILE_DIRNAME}/openjdk-7-03b147:&qu=
ot;<br>
=C2=A0# Force arm mode for now<br>
=C2=A0ARM_INSTRUCTION_SET:armv4t =3D &quot;ARM&quot;<br>
<br>
-ICEDTEA_URI =3D &quot;<a href=3D"http://icedtea.wildebeest.org/download/so=
urce/$%7BICEDTEA%7D.tar.gz;name=3Diced" rel=3D"noreferrer" target=3D"_blank=
">http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=3Dic=
ed</a>&quot;<br>
+ICEDTEA_URI =3D &quot;<a href=3D"https://icedtea.wildebeest.org/download/s=
ource/$%7BICEDTEA%7D.tar.gz;name=3Diced" rel=3D"noreferrer" target=3D"_blan=
k">https://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=3D=
iced</a>&quot;<br>
<br>
=C2=A0ICEDTEA_PREFIX =3D &quot;icedtea7-forest-2.1&quot;<br>
-ICEDTEA_HG_URL =3D &quot;<a href=3D"http://icedtea.classpath.org/hg/releas=
e/$%7BICEDTEA_PREFIX%7D" rel=3D"noreferrer" target=3D"_blank">http://icedte=
a.classpath.org/hg/release/${ICEDTEA_PREFIX}</a>&quot;<br>
+ICEDTEA_HG_URL =3D &quot;<a href=3D"https://icedtea.wildebeest.org/hg/rele=
ase/$%7BICEDTEA_PREFIX%7D" rel=3D"noreferrer" target=3D"_blank">https://ice=
dtea.wildebeest.org/hg/release/${ICEDTEA_PREFIX}</a>&quot;<br>
<br>
=C2=A0OPENJDK_CHANGESET =3D &quot;22cc03983e20&quot;<br>
=C2=A0OPENJDK_FILE_UPSTREAM =3D &quot;${OPENJDK_CHANGESET}.tar.bz2&quot;<br=
>
-- <br>
2.43.0.windows.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109580): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109580" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109580</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105137637/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105137637/924729</a><br>
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

--0000000000002fa82306147d6a9b--

