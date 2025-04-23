Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F180BC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 16:29:48 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.169.1745425782625166294
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Apr 2025 09:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EHTVLpzi;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c14016868so20136f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 09:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1745425781; x=1746030581; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nY6t6xxj63oaCsj1/v9rEj2iuXNkNRXIdPwWVi0D148=;
        b=EHTVLpziOKogtmMIwZl3iLAyidaTI77/GzmlZ5wOcBjB8hx8B28p6A7B+RebTZcY/B
         LYH3vJBa/7/Mh1RND741njiAobEX9dhSdmJjbLpondxmFJxrmHCgJHUmU5cyEfI4Vpq+
         sii7Y8654MG7Mq+3uRdAgC7bHWU5cnfyzgCAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745425781; x=1746030581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nY6t6xxj63oaCsj1/v9rEj2iuXNkNRXIdPwWVi0D148=;
        b=J9dUuVqfv2waXg44TIzXXHzcTbkhZyph6CamR4wIpNle3GPZ+6BjrxWpe/ADpY2c7M
         1pfpHH4J+kog3d/Zh3qf5tnFpTT7r9A+2rmJ3aGR1/wd9NKvOwDARp+MoUines4x0JYV
         BFfybu1dB3PBwbsL6Mp6O6iVVmIRFQeQrCurmbzyb1ey6/Uwqk4FEreYfme3wHQsfDk2
         mwwPsvHINPSzo9U8MHTN7ZsgVE5Pm0FFaArwfRzuH300pa+PuOjoHSwxCFpJ1scYr0Am
         f9IGw8xSwnwj1uJAwbrMHQE/qyxtxR25lp/pNw1eK4pAqNaMyeAXbflARpEfw6YTIUSZ
         DisQ==
X-Gm-Message-State: AOJu0YxD0I5ZmnB+bL4pxavxfEheHQX2JJQWd+AVdy7AGkrmPWNikBy0
	4a5M6XkDfYnMoIR5CEO+JRhv5jzvidiuzTkA9l3NsweuuiCx3QC8ZvqZE8ODj8ywFpIJ2EjtmPv
	yKHqB57T2LAy4HgBKwGvyR/g6gGPuoSSDehGCxA==
X-Gm-Gg: ASbGnctyZpbC2iFLwROCxm5gpGNS9Vp0r/rV4OzzxhEoBSBO3vl0Q1QNQlL6Da+k5rL
	UYuIfwW2NEOOQhWTxpy5OgSqTZnHWqquLF302GqAPQUBWQknt66NUrvQ4NJOY+DDqQU9SpzbFAU
	KIePHEnkqFVI2KEMIgKMAGRBXPHKlPhHD9bSNyWI+Fii6HgJyWDQ==
X-Google-Smtp-Source: AGHT+IGdtPaz1cbKqTh7bP9TsTYslT5WU0piaZ1zfNHihkPjV9wAhQF+zfZh/pDRA1uyYpkUZWDxg7KwvB7RWBT2HPc=
X-Received: by 2002:a5d:64a5:0:b0:391:4914:3c6a with SMTP id
 ffacd0b85a97d-39efba5c644mr14552205f8f.29.1745425778315; Wed, 23 Apr 2025
 09:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250423144546.1737495-1-kelefa.sane@smile.fr>
In-Reply-To: <20250423144546.1737495-1-kelefa.sane@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 23 Apr 2025 18:29:24 +0200
X-Gm-Features: ATxdqUFIHcieSfb4DT_EQU9IoSuVd1GQMcX6ZAkdjXeUgCl0LYvcWebceE6dY50
Message-ID: <CAMSfU+4n-gPYCJwZLk5THN79=mzenx7t+B15NpG6X79wrQx63g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] reproducilibility: remove cjson-ptest
 package from non reproducible list
To: =?UTF-8?B?S8OpbMOpZmEgU0FOw4k=?= <kelefa.sane@smile.fr>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007fb4640633749be5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 16:29:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117085

--0000000000007fb4640633749be5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 23 avr. 2025 =C3=A0 16:46, kelefa.sane via lists.openembedded.org
<kelefa.sane=3Dsmile.fr@lists.openembedded.org> a =C3=A9crit :

> From: K=C3=A9l=C3=A9fa San=C3=A9 <kelefa.sane@smile.fr>
>
> The reproducibility issue has been fixed by the commit "cjson: fix
> buildpath warnings (0cc731540808d848c03c2e345c36904b83529266)"
> which replace the build path present in files:
> - CTestTestfile.cmake
> - tests/CTestTestfile.cmake
> - fuzzing/CTestTestfile.cmake
>
> by PTEST_PATH (/usr/lib/cjson/ptest).
>
> Signed-off-by: K=C3=A9l=C3=A9fa San=C3=A9 <kelefa.sane@smile.fr>
>

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

---
>  meta-oe/conf/include/non-repro-meta-oe.inc | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc
> b/meta-oe/conf/include/non-repro-meta-oe.inc
> index b8b5adf45..ba0874941 100755
> --- a/meta-oe/conf/include/non-repro-meta-oe.inc
> +++ b/meta-oe/conf/include/non-repro-meta-oe.inc
> @@ -4,7 +4,6 @@ KNOWN_NON_REPRO_META_OE =3D " \
>      asio-dbg \
>      asio-ptest \
>      asio-src \
> -    cjson-ptest \
>      cpuid-doc \
>      crash \
>      crash-dbg \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117081):
> https://lists.openembedded.org/g/openembedded-devel/message/117081
> Mute This Topic: https://lists.openembedded.org/mt/112415404/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007fb4640633749be5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"><br></div><br><div class=3D"gmail_quote=
 gmail_quote_container" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">=
Le mer. 23 avr. 2025 =C3=A0 16:46, kelefa.sane via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;kelefa.sane=3D<a href=3D"m=
ailto:smile.fr@lists.openembedded.org">smile.fr@lists.openembedded.org</a>&=
gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: K=C3=A9l=C3=A9fa San=C3=A9 &lt;<a href=3D"mailto:kelefa.sane@=
smile.fr" target=3D"_blank" rel=3D"noreferrer">kelefa.sane@smile.fr</a>&gt;=
<br>
<br>
The reproducibility issue has been fixed by the commit &quot;cjson: fix<br>
buildpath warnings (0cc731540808d848c03c2e345c36904b83529266)&quot;<br>
which replace the build path present in files:<br>
- CTestTestfile.cmake<br>
- tests/CTestTestfile.cmake<br>
- fuzzing/CTestTestfile.cmake<br>
<br>
by PTEST_PATH (/usr/lib/cjson/ptest).<br>
<br>
Signed-off-by: K=C3=A9l=C3=A9fa San=C3=A9 &lt;<a href=3D"mailto:kelefa.sane=
@smile.fr" target=3D"_blank" rel=3D"noreferrer">kelefa.sane@smile.fr</a>&gt=
;<br></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">Revie=
wed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.con=
gal@smile.fr</a>&gt;</div><div dir=3D"auto"><br></div><div class=3D"gmail_q=
uote gmail_quote_container" dir=3D"auto"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
---<br>
=C2=A0meta-oe/conf/include/non-repro-meta-oe.inc | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/incl=
ude/non-repro-meta-oe.inc<br>
index b8b5adf45..ba0874941 100755<br>
--- a/meta-oe/conf/include/non-repro-meta-oe.inc<br>
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc<br>
@@ -4,7 +4,6 @@ KNOWN_NON_REPRO_META_OE =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0asio-dbg \<br>
=C2=A0 =C2=A0 =C2=A0asio-ptest \<br>
=C2=A0 =C2=A0 =C2=A0asio-src \<br>
-=C2=A0 =C2=A0 cjson-ptest \<br>
=C2=A0 =C2=A0 =C2=A0cpuid-doc \<br>
=C2=A0 =C2=A0 =C2=A0crash \<br>
=C2=A0 =C2=A0 =C2=A0crash-dbg \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#117081): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117081" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/117081</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112415404/431=
6185" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/112415404/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@=
smile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>]<b=
r>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007fb4640633749be5--

