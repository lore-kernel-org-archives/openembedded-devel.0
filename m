Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48848C5AE59
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 21:44:37 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.17144.1748209469904223906
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 May 2025 14:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ECwB2gPJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0618746bso12494515e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 May 2025 14:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1748209468; x=1748814268; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pV1GrucwFH5/7GHFkoXCfywriQlpDGrnorlpP/eDKhM=;
        b=ECwB2gPJMybkQsH5XitYa6RERxjKip9hi0ejsVzlUhQ7TKYdTPlk6Dql6Vku37rpMA
         9awBEqqgClJDuIKNDnXWlBSO3PQm4NTUNqXe/m0I/o7gquJ7TdhgOpPo08zjuTdvCkK6
         mpYCaGWgiBnAiXmmNU7aOaLPMa441UmWKGGQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748209468; x=1748814268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pV1GrucwFH5/7GHFkoXCfywriQlpDGrnorlpP/eDKhM=;
        b=iVJf3f8xlleQa2R/E1hVvKI1Z7goc8jsU07hFWp6CniDi1NEMrnujoowfPeM1PnXv8
         uKDPxtGsggPP7N8lGH8jPnMNuzypessgql2MYBm/nfEHdWLjOwCYy/DvBJf/9Han4DP/
         l/hj/tjZT/uljvgb5jW6troGZkZBJpoze/tzEcpwCGlXqpuGy4xSqkCxLn4/Y6i1E8AC
         H3cVb40LPDNsgdIWD26LqbJLxNMmPyovMMlMHorGxJ+q53rsHFaUF9NfnNQUmXrdQfRc
         ZGbd9LC59KzT33EqW1Bhz7doMK8LH35S7/V8SBQ4BV9rlx9HJFeFZjY3i1Qh4dPAd2X+
         SV8Q==
X-Gm-Message-State: AOJu0YyHkASah37g8zyHG7RqhwQ+RdDJrb3iUXUWKE9HJaphF1xnSsHZ
	+FXZKjfI1deqEPJ2qR5g9Ihc09npXlVnmlllou05WwSa2RfzGF2BQ4/bqm7gtEsJs8ew2FwkIgL
	m5jR4O3YVKPbtMci6oFRQfbctbpkPtRitmKvDOl+ebQ==
X-Gm-Gg: ASbGncsYvbp6twvLS7o404pW5XG780YtZbd2Oiq8O1LkOgKOCIOs9yjR9Q62ESyzCgc
	AJ7U0Ux9jbDKfTj0nrKHwXPZdqb8LB5FJJuqUEeic+X86Wlo+HcMYKXzzAH+D4Vut0DKaBirjrn
	tyRUpHP7ykW+0cPhs/Q6+jeXrgdxsVLV+kRESL4DHj7TGdJMqvrqMNagLrAWU74RUP8cetwO0ik
	AHAmA==
X-Google-Smtp-Source: AGHT+IEOm/gJQdoNXCxZbLt1OokiWiUpp8m3B1ZDeg+ObTlNA6QrskYooSxLdF8h2lbNuooSqAZUaLxohQKD9eiODF8=
X-Received: by 2002:a05:600c:8112:b0:43d:47e:3205 with SMTP id
 5b1f17b1804b1-44c935dd583mr52866315e9.11.1748209468134; Sun, 25 May 2025
 14:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250525041423.1210095-1-raj.khem@gmail.com>
In-Reply-To: <20250525041423.1210095-1-raj.khem@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sun, 25 May 2025 23:44:02 +0200
X-Gm-Features: AX0GCFsNo6V1Mjo7dLpGNUIKLA7H8YLZ74qAG5rxkZzbuU_zXGBo8_8SreZgVCo
Message-ID: <CAMSfU+6db-4MSBfQmPzM5ufFpZbtgJmE3VQxStV5dyhDKdCgnQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-pyzstd: Bump upper version
 of setuptools to > 80
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005769d70635fcbca8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 May 2025 21:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117619

--0000000000005769d70635fcbca8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

Le dim. 25 mai 2025 =C3=A0 06:14, Khem Raj via lists.openembedded.org <raj.=
khem=3D
gmail.com@lists.openembedded.org> a =C3=A9crit :

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-Bump-setuptools-dependency-from-74-to-79.patch         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools=
-dependency-from-74-to-79.patch
> b/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools=
-dependency-from-74-to-79.patch
> index 8fc26bd90b..cbc167157b 100644
> ---
> a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools=
-dependency-from-74-to-79.patch
> +++
> b/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools=
-dependency-from-74-to-79.patch
>

The patch name does not match the content anymore.
You may want to update the patch name.
I'd suggest removing the specific version from it.

@@ -22,6 +22,6 @@ index dd885e4..9f273b3 100644
>   # setuptools 64+ support --build-option
>   # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9
> under Windows
>  -requires =3D ["setuptools>=3D64,<74"]
> -+requires =3D ["setuptools>=3D64,<79"]
> ++requires =3D ["setuptools>=3D64,<89"]
>   backend-path =3D ["build_script"]
>   build-backend =3D "pyzstd_pep517"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117615):
> https://lists.openembedded.org/g/openembedded-devel/message/117615
> Mute This Topic: https://lists.openembedded.org/mt/113290576/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000005769d70635fcbca8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Khem,</div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 25 mai =
2025 =C3=A0=C2=A006:14, Khem Raj via <a href=3D"http://lists.openembedded.o=
rg">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@l=
ists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9cri=
t=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-=
off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Bump-setuptools-dependency-from-74-to-79.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-s=
etuptools-dependency-from-74-to-79.patch b/meta-python/recipes-devtools/pyt=
hon/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-79.patch<br>
index 8fc26bd90b..cbc167157b 100644<br>
--- a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptoo=
ls-dependency-from-74-to-79.patch<br>
+++ b/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptoo=
ls-dependency-from-74-to-79.patch<br></blockquote><div><br></div><div>The p=
atch name does not match the content anymore.</div><div>You may want to upd=
ate the patch name.</div><div>I&#39;d suggest removing the specific version=
 from it.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
@@ -22,6 +22,6 @@ index dd885e4..9f273b3 100644<br>
=C2=A0 # setuptools 64+ support --build-option<br>
=C2=A0 # setuptools 74+ drops distutils.msvc9compiler required for Python 3=
.9 under Windows<br>
=C2=A0-requires =3D [&quot;setuptools&gt;=3D64,&lt;74&quot;]<br>
-+requires =3D [&quot;setuptools&gt;=3D64,&lt;79&quot;]<br>
++requires =3D [&quot;setuptools&gt;=3D64,&lt;89&quot;]<br>
=C2=A0 backend-path =3D [&quot;build_script&quot;]<br>
=C2=A0 build-backend =3D &quot;pyzstd_pep517&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#117615): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117615" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/117615</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113290576/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113290576/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000005769d70635fcbca8--

