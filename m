Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730CECAC5B0
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 15:29:19 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.14778.1758986956679834408
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 08:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CVA6WdyL;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so30140345e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758986955; x=1759591755; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eJ5zZpxfQIuesrGz1AMzJRbjGfF7qsqqhftfKMsadXg=;
        b=CVA6WdyL7Fqx7zotUqbWeQXhUdQJOJvIYf4pic1E8R3fCogjj8JIyzEWmjIlXbFkRU
         6owHc+oSJtzhfOZjkLsHeuNghaUANxMNKnKWQPra7nAst1YiY2eVbKAjn8xY8L2pn81S
         wnAUyaRUgps9w7TJ2eSdC8fLt2+eelKosKNfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758986955; x=1759591755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJ5zZpxfQIuesrGz1AMzJRbjGfF7qsqqhftfKMsadXg=;
        b=QwjqLz9+hMHwJBT/jM8gZr6T4/c2ebsyefQU5s17ZN4eEtzYhaQDd5qWajkD0U6CKK
         FFzezSFcry2Esd2pq+81QyPAFsS0xiVqvPvakkfwohjzbl0knNQ5Hod6hvXL8fXBEDzS
         AeO7Pxfl3RWDZaDfovpwh1dGOTAM4j4W2h4fvxje48P7OQOgLxvSEqQ0DmFqqsuyxAVU
         UlYhDIR7BDRJPrMcqetp5uL9wdGlWMkoiPnEueNN5gh6gyRNTW31yyXVaS6CTyhSEZtB
         avUmE/T7M0wt7qeMNytf7Qq/kvpkdZn+uIsGqTTbqsU92ld77SfDqy1EeNfKkS9JK8BA
         AhSw==
X-Gm-Message-State: AOJu0YwFeV8/IJ3x3zwP6x2LrwEB9wsVWZHlBnERvOLkgXufUm4rskEz
	JrMgPipg0W2lyv75DKa8+NCOeKc3sxs29q2MhNkzPghu56F3y0bZRLgXc4a0ulLrYRWu1njT/0Y
	aaRY6UyzRlgRLLnf50CfQF2yr5dISA3OwysRw9NKJfZvSzARhrQWg
X-Gm-Gg: ASbGncuNKT5NyRw326IsvKz0md+QCNBRzrkVS9XDlh8SdU1IfoMYWgL/Xij79msN10W
	Yk8AN66EGPLPuXY8fV413TF1g5wRvdkWKEBdGfoYjFccSmDz9hRHcAcBocxdnIdRl9pqlnIeqE7
	vCyki+vkVVmV/YDwpJg2dbSbo1Dqc5TIba0xbnrnsIp9YaU8rogKObCgWJG6dKOZORIPHt/xrwz
	AyYn+p1gWJZHAaJDWQ=
X-Google-Smtp-Source: AGHT+IEJ8Xte+/eoPQi1BJPT97SqfOpQC4MbKRsrDsRD4HxpV6xOuvsNxGXw9BpuTi8800jEpHPFPnEjhuwtmHXG82w=
X-Received: by 2002:a05:600c:489a:b0:459:d8c2:80b2 with SMTP id
 5b1f17b1804b1-46e329af060mr68691185e9.7.1758986954774; Sat, 27 Sep 2025
 08:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250926081914.3127272-1-hongxu.jia@windriver.com> <20250926081914.3127272-6-hongxu.jia@windriver.com>
In-Reply-To: <20250926081914.3127272-6-hongxu.jia@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 27 Sep 2025 17:29:02 +0200
X-Gm-Features: AS18NWDUSWFQQU6xL6pnfPwMRwrkohhZjhE9QVX4BqI8tY8ZLxmdZJdKriitPps
Message-ID: <CAMSfU+6Y0DWjzBR9T8=5eQojoh2UaB=8_p57ziyANOMvFnTDGQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v4 6/6] meta-python/conf/layer.conf:
 update OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES
To: hongxu.jia@eng.windriver.com
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009aa8d9063fca1058"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 15:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119991

--0000000000009aa8d9063fca1058
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 26 sept. 2025 =C3=A0 10:21, hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> a =C3=A9crit :

> Due to the recipes listed in OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES has
> supported reproducibility, update OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES
> to latest
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-python/conf/layer.conf | 27 ---------------------------
>  1 file changed, 27 deletions(-)
>
> diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
> index b887accbf8..202c66561f 100644
> --- a/meta-python/conf/layer.conf
> +++ b/meta-python/conf/layer.conf
> @@ -21,31 +21,4 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>  # List of known non-reproducible package of the meta-python layer
>  # Please keep this list sorted
>  OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D " \
> -    python3-evdev \
> -    python3-evdev-dbg \
> -    python3-evdev-src \
> -    python3-frozenlist \
> -    python3-frozenlist-dbg \
> -    python3-kivy-src \
> -    python3-lief \
> -    python3-mlcommons-loadgen \
> -    python3-mlcommons-loadgen-dbg \
> -    python3-mlcommons-loadgen-src \
> -    python3-pandas \
> -    python3-pandas-dbg \
> -    python3-pandas-src \
> -    python3-propcache \
> -    python3-propcache-dbg \
> -    python3-pybind11-json-dev \
> -    python3-pycocotools-src \
> -    python3-pydantic-core \
> -    python3-pynacl \
> -    python3-pynacl-dbg \
> -    python3-pynacl-src \
> -    python3-pyproj \
> -    python3-pyproj-dbg \
> -    python3-pyproj-src \
> -    python3-pyzmq \
> -    python3-yarl \
> -    python3-yarl-dbg \
>

With this merged (and tested) that will mean that meta-python is fully
reproducible. That is excellent news!

Thanks!

 "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119903):
> https://lists.openembedded.org/g/openembedded-devel/message/119903
> Mute This Topic: https://lists.openembedded.org/mt/115445264/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009aa8d9063fca1058
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Le ven. 26 sept. 2025 =C3=A0=
 10:21, hongxu via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;hongxu.jia=3D<a href=3D"mailto:eng.windriver.com@lists.ope=
nembedded.org">eng.windriver.com@lists.openembedded.org</a>&gt; a =C3=A9cri=
t=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Due to =
the recipes listed in OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES has<br>
supported reproducibility, update OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES<br>
to latest<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank" rel=3D"noreferrer">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta-python/conf/layer.conf | 27 ---------------------------<br>
=C2=A01 file changed, 27 deletions(-)<br>
<br>
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf<br>
index b887accbf8..202c66561f 100644<br>
--- a/meta-python/conf/layer.conf<br>
+++ b/meta-python/conf/layer.conf<br>
@@ -21,31 +21,4 @@ LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
=C2=A0# List of known non-reproducible package of the meta-python layer<br>
=C2=A0# Please keep this list sorted<br>
=C2=A0OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D &quot; \<br>
-=C2=A0 =C2=A0 python3-evdev \<br>
-=C2=A0 =C2=A0 python3-evdev-dbg \<br>
-=C2=A0 =C2=A0 python3-evdev-src \<br>
-=C2=A0 =C2=A0 python3-frozenlist \<br>
-=C2=A0 =C2=A0 python3-frozenlist-dbg \<br>
-=C2=A0 =C2=A0 python3-kivy-src \<br>
-=C2=A0 =C2=A0 python3-lief \<br>
-=C2=A0 =C2=A0 python3-mlcommons-loadgen \<br>
-=C2=A0 =C2=A0 python3-mlcommons-loadgen-dbg \<br>
-=C2=A0 =C2=A0 python3-mlcommons-loadgen-src \<br>
-=C2=A0 =C2=A0 python3-pandas \<br>
-=C2=A0 =C2=A0 python3-pandas-dbg \<br>
-=C2=A0 =C2=A0 python3-pandas-src \<br>
-=C2=A0 =C2=A0 python3-propcache \<br>
-=C2=A0 =C2=A0 python3-propcache-dbg \<br>
-=C2=A0 =C2=A0 python3-pybind11-json-dev \<br>
-=C2=A0 =C2=A0 python3-pycocotools-src \<br>
-=C2=A0 =C2=A0 python3-pydantic-core \<br>
-=C2=A0 =C2=A0 python3-pynacl \<br>
-=C2=A0 =C2=A0 python3-pynacl-dbg \<br>
-=C2=A0 =C2=A0 python3-pynacl-src \<br>
-=C2=A0 =C2=A0 python3-pyproj \<br>
-=C2=A0 =C2=A0 python3-pyproj-dbg \<br>
-=C2=A0 =C2=A0 python3-pyproj-src \<br>
-=C2=A0 =C2=A0 python3-pyzmq \<br>
-=C2=A0 =C2=A0 python3-yarl \<br>
-=C2=A0 =C2=A0 python3-yarl-dbg \<br></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">With this merged (and tested) that will me=
an that meta-python is fully reproducible. That is excellent news!</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Thanks!</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#119903): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/119903" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/119903</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115445264/431=
6185" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/115445264/4316185</a><br>
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
</blockquote></div></div></div>

--0000000000009aa8d9063fca1058--

