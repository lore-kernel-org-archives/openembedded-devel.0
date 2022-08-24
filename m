Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC99C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 16:05:23 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web08.12816.1661357118029456926
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O1AQLPd8;
 spf=pass (domain: gmail.com, ip: 209.85.128.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-333a4a5d495so471952347b3.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=HyYcdD0CBX1zok3Bm5MWqhgNj13X2JIGrssY0lVUxWA=;
        b=O1AQLPd8zWVw/bjWEs3/Ny4L+VssZKgZUYBTVCLX2pfTMrQDdXA+QkBIXtF7yqllPT
         51HE4HjCR83s5y3IKcsQ+7cRWPQnpzn1uIoXn4LlK91zUhU2pX4oU3LX3cu7znUKugpJ
         VDX9TWoggv5rq/kJu0dO+QgU+tCEcMPGh+LzkKd5MaTyJJnqhRYj/X/K6OJcCU5mfkcz
         pkJAYldXcrHrxw5RGY/242GC2VRIsyimjZQO0SQ03thLiz+A16m3YhWJswwqLf1Xm17k
         2XLKG4eJnlBtVtFavdPZVbNNM/BDQwOGxhifg1m0b5EbdlDGT3EGDRh4UXuQHmZHkUZa
         0WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=HyYcdD0CBX1zok3Bm5MWqhgNj13X2JIGrssY0lVUxWA=;
        b=7uXGeK/M+XC/Co7VtC5xDwgurMvRFBxVuRdHGRcqJ+pKn4rTBP4QL38uqDXk94PvJk
         mixISFO2wOemQ5nEzoocU+2FabMrdHaYkqBkFI0Wmvp1cSVJz8v2uUwi7klOnQBuPF2B
         psqdwmHMM757GUDftw0++nQ9d0A2VKI84vCSnDTMwCh7mtPxHihyppZF8zjg8qWhUzPd
         Id/O5eRtlKGMoqlO+XWpdQ4J9FGkxubP7aSINR5XdRymPkUkloul7PQ1bZzoEz7g5QE3
         wEKohdfSzo5HwtStb/YzQ9fXTQwQD5gZYGDr2sDE5aW1l4lC4mqNhkUaWkpwR+k8pVPa
         V2bA==
X-Gm-Message-State: ACgBeo03YHnVerHNt12VyKthH1El5RLadpEKMQJcnvEbHRXgP7HzDSNu
	5uCwCozm2Y8XPV2UOVl2jtvSDJdYxnZ0T7dKstRXlwR8FCY=
X-Google-Smtp-Source: 
 AA6agR6FoqRNkKg7UoQ8C4xOD1zYplyhQH36r+Hm7ctIKfNWWzlXPKd2OlswRodcr42GupOvaRfSqtClVdZslIJEEmY=
X-Received: by 2002:a5b:107:0:b0:67c:4077:17f0 with SMTP id
 7-20020a5b0107000000b0067c407717f0mr26844515ybx.363.1661357116694; Wed, 24
 Aug 2022 09:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220824153539.423878-1-mac@mcrowe.com>
In-Reply-To: <20220824153539.423878-1-mac@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Aug 2022 09:05:05 -0700
Message-ID: 
 <CAMKF1spmzy7HkzNA36TmsK7BjrkBxXsBvO1ZCo759Ygd-Qrk5w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] yasm: Only depend on xmlto when docs are
 enabled
To: mac@mcrowe.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c926d405e6fed82a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 16:05:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98419

--000000000000c926d405e6fed82a
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 24, 2022 at 8:35 AM Mike Crowe via lists.openembedded.org <mac=
mcrowe.com@lists.openembedded.org> wrote:

> The yasm build system only requires xmlto when building its
> documentation. It automatically detects whether it is present at
> configure time.


Does it also detect it from build machine ?
Perhaps better to turn the knob on and off explicitly as well for
determinism

>
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta-oe/recipes-devtools/yasm/yasm_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb
> b/meta-oe/recipes-devtools/yasm/yasm_git.bb
> index 044fcbea7..3dd382be1 100644
> --- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
> +++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
> @@ -4,7 +4,8 @@ HOMEPAGE = "http://www.tortall.net/projects/yasm/"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=a12d8903508fb6bfd49d8d82c6170dd9"
>
> -DEPENDS += "flex-native bison-native xmlto-native"
> +DEPENDS += "flex-native bison-native"
> +PACKAGECONFIG[docs] = ",,xmlto-native,"
>
>  PV = "1.3.0+git${SRCPV}"
>  # v1.3.0
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98418):
> https://lists.openembedded.org/g/openembedded-devel/message/98418
> Mute This Topic: https://lists.openembedded.org/mt/93229252/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c926d405e6fed82a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 24, 2022 at 8:35 AM Mike Crowe via <a href=3D"h=
ttp://lists.openembedded.org">lists.openembedded.org</a> &lt;mac=3D<a href=
=3D"mailto:mcrowe.com@lists.openembedded.org">mcrowe.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The yasm build =
system only requires xmlto when building its<br>
documentation. It automatically detects whether it is present at<br>
configure time.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">D=
oes it also detect it from build machine ?</div><div dir=3D"auto">Perhaps b=
etter to turn the knob on and off explicitly as well for determinism=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Signed-off-by: Mike Crowe &lt;<a href=3D"mailto:mac@mcrowe.com" target=3D"_=
blank">mac@mcrowe.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">yasm_git.bb</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" r=
el=3D"noreferrer" target=3D"_blank">yasm_git.bb</a> b/meta-oe/recipes-devto=
ols/yasm/<a href=3D"http://yasm_git.bb" rel=3D"noreferrer" target=3D"_blank=
">yasm_git.bb</a><br>
index 044fcbea7..3dd382be1 100644<br>
--- a/meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">yasm_git.bb</a><br>
+++ b/meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">yasm_git.bb</a><br>
@@ -4,7 +4,8 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.tortall.net/projec=
ts/yasm/" rel=3D"noreferrer" target=3D"_blank">http://www.tortall.net/proje=
cts/yasm/</a>&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da12d8903508fb6bfd49d8=
d82c6170dd9&quot;<br>
<br>
-DEPENDS +=3D &quot;flex-native bison-native xmlto-native&quot;<br>
+DEPENDS +=3D &quot;flex-native bison-native&quot;<br>
+PACKAGECONFIG[docs] =3D &quot;,,xmlto-native,&quot;<br>
<br>
=C2=A0PV =3D &quot;1.3.0+git${SRCPV}&quot;<br>
=C2=A0# v1.3.0<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#98418): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/98418" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/98418</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93229252/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93229252/1997914</a><br>
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

--000000000000c926d405e6fed82a--

