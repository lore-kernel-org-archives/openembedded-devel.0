Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBCBC48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 23:20:36 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.34.1708989635688313877
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Feb 2024 15:20:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b/8RRjQx;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6092387bdd0so2379627b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 15:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708989635; x=1709594435; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0+5V/ClYEDCFhj6ZrlPcS/AmWgtJ8ser48HLSW573q4=;
        b=b/8RRjQxD3fkN8ybJ1wCizFodqQF9EYHVulJT9eTwNW4ZTAxvrEg8BlTxGYBzW2Ivb
         JOnIVeUKKY4KJorx5d5JftnCdeeZHykMEJu5tLNcVI21Z0KTkezBR7M1WUuniQKGko75
         7yVhweSGlA0L1iVdsYBqb8SKd0f0uXS7X++E0W5dKOazceHnO5i/nwTXXVABGpbhpRcb
         siSzPHVN5m4jvQBlW9GU1qU5G+fJ+8Kwo/sTaBE3lcmGSK7qHLsCagAaUeM6jxA7EFgz
         OOsueYCSitY4MvN9ihnb0JHCqwqLPHqGp3oSqWou6NHm5hGErrL1aANOjZNB8WM7IvEi
         Zirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708989635; x=1709594435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+5V/ClYEDCFhj6ZrlPcS/AmWgtJ8ser48HLSW573q4=;
        b=wi/Y0uG+Xe/TjBxoM4zsFOaqJTuSh/oMvSQFFrFCqy1pnixKGW+Ns9lBhWhh0dCEXy
         1T74EEEchAiUpuvA46mPt8vJn13mAczMXTAi8Tqjbly7na8XxdkiTkonL5FdTPUkaurJ
         YguHu4WNzkhZIZqDdp9UcjpIXoqIFMOQQ2Ocg+Thr90tnRl5LUSJSwIyewcZunkou/HC
         e7/lmncuB0gtltBraIaeFOzimaABBg4wodAs4BkxSySv6ZnCHpsOg4yokR+RH8nggEmX
         f3mWhSJrWwpL3Vn7E9tEYmyDW1DoYF6o3yfZw/n0B5v8QmCuvowQ4RM/YRgoCp2/s2tc
         RHSw==
X-Gm-Message-State: AOJu0YwzdOWpha3K3XU56IQxNEnV6e1nUcgpkD//aFDawof87w2kjL+D
	yKNQFG/aeXmVfbNafVAweYu9XO+1k4WA1zhENUeKUX6dq5Q1GJ44ZOSi8AtK0Yy13QbW1NGVD7m
	PVdTeudypsD0OfL6LegqRpgGh8Dw=
X-Google-Smtp-Source: AGHT+IH/x/dUUanDKAhGnPpED+97SP2MtbaA9KxiTRGPYTZoz/1nTuUWuJTf3E/HgmSU44VQwEExE3R5z3Wf/ezdPVY=
X-Received: by 2002:a81:4004:0:b0:604:bfd:cdba with SMTP id
 l4-20020a814004000000b006040bfdcdbamr631036ywn.9.1708989634657; Mon, 26 Feb
 2024 15:20:34 -0800 (PST)
MIME-Version: 1.0
References: <20240224113942.11482-1-peter.marko@siemens.com>
In-Reply-To: <20240224113942.11482-1-peter.marko@siemens.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 26 Feb 2024 15:20:23 -0800
Message-ID: <CANx9H-Bxz_Eu_yV5Whc4YT0+XcpbPNTadq3eUxpjoaYN6s0dYg@mail.gmail.com>
Subject: Re: [oe] [meta-java][PATCH] jsch,xerces-j: fix CVE_STATUS
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000019438906125128dc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 23:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109036

--00000000000019438906125128dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2024 at 3:40=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> From: Peter Marko <peter.marko@siemens.com>
>
> Last commit tried to convert CVE_CHECK_IGNORE to CVE_STATUS,
> however it was done in wrong way and caused the CVEs
> to be reported as open again.
>
> This fixes CVE_STATUS syntax.
>
> Merged. Thank you. (Especially thank you for fixing MY mistakes)

NOTE: both jsched and xerces-j have newer CVEs so if you have time to
investigate upgrades to fix them, it would be appreciated:
https://nvd.nist.gov/vuln/detail/CVE-2022-23437
https://nvd.nist.gov/vuln/detail/CVE-2023-48795


> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  recipes-core/jcraft/jsch_0.1.40.bb       | 3 +--
>  recipes-core/xerces-j/xerces-j_2.11.0.bb | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-core/jcraft/jsch_0.1.40.bb b/recipes-core/jcraft/
> jsch_0.1.40.bb
> index 8ef5c85..aeb04b4 100644
> --- a/recipes-core/jcraft/jsch_0.1.40.bb
> +++ b/recipes-core/jcraft/jsch_0.1.40.bb
> @@ -25,8 +25,7 @@ do_compile() {
>  SRC_URI[md5sum] =3D "b59cec19a487e95aed68378976b4b566"
>  SRC_URI[sha256sum] =3D
> "ca9d2ae08fd7a8983fb00d04f0f0c216a985218a5eb364ff9bee73870f28e097"
>
> -# Ignore the CVE because it only affects Windows platforms
> -CVE_STATUS +=3D "CVE-2016-5725"
> +CVE_STATUS[CVE-2016-5725] =3D "not-applicable-platform: Issue only appli=
es
> on Windows"
>
>  BBCLASSEXTEND =3D "native"
>
> diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb
> b/recipes-core/xerces-j/xerces-j_2.11.0.bb
> index c7a54ab..45d3c43 100644
> --- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
> +++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
> @@ -18,7 +18,7 @@ SRC_URI =3D "
> http://archive.apache.org/dist/xerces/j/source/Xerces-J-src.${PV}.tar
>  # Already fixed with updates and closed.
>  # https://access.redhat.com/security/cve/CVE-2018-2799
>  # https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542
> -CVE_STATUS +=3D "CVE-2018-2799"
> +CVE_STATUS[CVE-2018-2799] =3D "not-applicable-platform: Issue only appli=
es
> on some Oracle Java SE and Red Hat Enterprise Linux versions"
>
>  S =3D "${WORKDIR}/xerces-2_11_0"
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109025):
> https://lists.openembedded.org/g/openembedded-devel/message/109025
> Mute This Topic: https://lists.openembedded.org/mt/104544794/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000019438906125128dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 24, 2024 at 3:40=E2=80=AF=
AM Peter Marko via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembe=
dded.org">siemens.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">From: Peter Marko &lt;<a href=
=3D"mailto:peter.marko@siemens.com" target=3D"_blank">peter.marko@siemens.c=
om</a>&gt;<br>
<br>
Last commit tried to convert CVE_CHECK_IGNORE to CVE_STATUS,<br>
however it was done in wrong way and caused the CVEs<br>
to be reported as open again.<br>
<br>
This fixes CVE_STATUS syntax.<br>
<br></blockquote><div>Merged. Thank you. (Especially thank you for fixing M=
Y mistakes)</div><div><br></div><div>NOTE: both jsched and xerces-j have ne=
wer CVEs so if you have time to investigate upgrades to fix them, it would =
be appreciated:</div><div><a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2=
022-23437">https://nvd.nist.gov/vuln/detail/CVE-2022-23437</a></div><div><a=
 href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-48795">https://nvd.nist.=
gov/vuln/detail/CVE-2023-48795</a></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0recipes-core/jcraft/<a href=3D"http://jsch_0.1.40.bb" rel=3D"noreferr=
er" target=3D"_blank">jsch_0.1.40.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +--<=
br>
=C2=A0recipes-core/xerces-j/<a href=3D"http://xerces-j_2.11.0.bb" rel=3D"no=
referrer" target=3D"_blank">xerces-j_2.11.0.bb</a> | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-core/jcraft/<a href=3D"http://jsch_0.1.40.bb" rel=3D"n=
oreferrer" target=3D"_blank">jsch_0.1.40.bb</a> b/recipes-core/jcraft/<a hr=
ef=3D"http://jsch_0.1.40.bb" rel=3D"noreferrer" target=3D"_blank">jsch_0.1.=
40.bb</a><br>
index 8ef5c85..aeb04b4 100644<br>
--- a/recipes-core/jcraft/<a href=3D"http://jsch_0.1.40.bb" rel=3D"noreferr=
er" target=3D"_blank">jsch_0.1.40.bb</a><br>
+++ b/recipes-core/jcraft/<a href=3D"http://jsch_0.1.40.bb" rel=3D"noreferr=
er" target=3D"_blank">jsch_0.1.40.bb</a><br>
@@ -25,8 +25,7 @@ do_compile() {<br>
=C2=A0SRC_URI[md5sum] =3D &quot;b59cec19a487e95aed68378976b4b566&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ca9d2ae08fd7a8983fb00d04f0f0c216a985218a=
5eb364ff9bee73870f28e097&quot;<br>
<br>
-# Ignore the CVE because it only affects Windows platforms<br>
-CVE_STATUS +=3D &quot;CVE-2016-5725&quot;<br>
+CVE_STATUS[CVE-2016-5725] =3D &quot;not-applicable-platform: Issue only ap=
plies on Windows&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
diff --git a/recipes-core/xerces-j/<a href=3D"http://xerces-j_2.11.0.bb" re=
l=3D"noreferrer" target=3D"_blank">xerces-j_2.11.0.bb</a> b/recipes-core/xe=
rces-j/<a href=3D"http://xerces-j_2.11.0.bb" rel=3D"noreferrer" target=3D"_=
blank">xerces-j_2.11.0.bb</a><br>
index c7a54ab..45d3c43 100644<br>
--- a/recipes-core/xerces-j/<a href=3D"http://xerces-j_2.11.0.bb" rel=3D"no=
referrer" target=3D"_blank">xerces-j_2.11.0.bb</a><br>
+++ b/recipes-core/xerces-j/<a href=3D"http://xerces-j_2.11.0.bb" rel=3D"no=
referrer" target=3D"_blank">xerces-j_2.11.0.bb</a><br>
@@ -18,7 +18,7 @@ SRC_URI =3D &quot;<a href=3D"http://archive.apache.org/di=
st/xerces/j/source/Xerces-J-src.$%7BPV%7D.tar" rel=3D"noreferrer" target=3D=
"_blank">http://archive.apache.org/dist/xerces/j/source/Xerces-J-src.${PV}.=
tar</a><br>
=C2=A0# Already fixed with updates and closed.<br>
=C2=A0# <a href=3D"https://access.redhat.com/security/cve/CVE-2018-2799" re=
l=3D"noreferrer" target=3D"_blank">https://access.redhat.com/security/cve/C=
VE-2018-2799</a><br>
=C2=A0# <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542" r=
el=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cg=
i?id=3D1567542</a><br>
-CVE_STATUS +=3D &quot;CVE-2018-2799&quot;<br>
+CVE_STATUS[CVE-2018-2799] =3D &quot;not-applicable-platform: Issue only ap=
plies on some Oracle Java SE and Red Hat Enterprise Linux versions&quot;<br=
>
<br>
=C2=A0S =3D &quot;${WORKDIR}/xerces-2_11_0&quot;<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109025): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109025" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109025</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104544794/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104544794/924729</a><br>
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

--00000000000019438906125128dc--

