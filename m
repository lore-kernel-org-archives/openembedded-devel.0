Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04DBD3C934
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:37:03 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1760.1765388215184946942
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bdtvMv/M;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64472c71fc0so74880d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 09:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765388214; x=1765993014; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cIYCYXYvesPEeWjoJTMoM1ghwlO0HDNkeZQIOO/ICk8=;
        b=bdtvMv/MLD/HHw7CQPjiJ9tOOsPRDYQfE+FhWTLXwDdjeVdyiUOcuatWsls4zLZnRI
         XI4yZbUtyzfyG6aVbi6S3Wa+yXwFOCdS3DfWQzs52t+b6lpzprHBBamCg6Cg2Z2lluBr
         cnJevPbr7+XeHCfNP7RV3T2m2NXKVdY0/Ao8lLTUCVWit8mBGhsjSsf99T5p8m6vRKNE
         93XYQGw4OzFR+nNo2GOOlXPA5uMXBW4iAfzZWyxCQB5mxH1+0/0fYopLCn3WxP1gni74
         v6ansLPeM5gxpe4VIlnzU9Zr3fmrYPcp5cSwuYlULifeTANDQDqo5iqPxzRnWEXtuyTm
         zMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765388214; x=1765993014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIYCYXYvesPEeWjoJTMoM1ghwlO0HDNkeZQIOO/ICk8=;
        b=SODjew+vQW+wERhvUkKN7But31Jeg6z1qFNqE1bM5ECsIL7TzdTb9dnxJyet4UEtBb
         ueGjvmxI1wbqsZflb5eIEJWMaau7USmeOj8/c/0kaeuLqQRJD9c5yjCkLB58v8Um9AwV
         gwYJYYdA17FFW0FnuFHHrxU/LuAVk46tu2O9TdZPD8BTo3ZGZhuytyKI7/M8W7CkOVUX
         rh985KbeUHDaXsNqZcQu/drKed07NFPHkll1NKhMpdseRzHcPd2Smsw7XYK03xWnSYIz
         gw/L7ryl94tRJ4kos9I8e8kZcpqObvTEnaFIzF/BVTWESOBrKyGbch5Ft4VK8p73YhTu
         QTdw==
X-Gm-Message-State: AOJu0YxHyOmkh9OOzGHOtzJezjdezKB+8TzRbWdIcyCyyaxbfxiROdCT
	eH6baUYsxWJKcEqMRrzoeDnfZacyr92W2xvNYxANTJZRn4OYa5E5Hx3V1vwil2N+rmmw5Wad4Ff
	q0bk/+jsHado8bD6+TeD3fPld5iN9CRI=
X-Gm-Gg: AY/fxX5dazR4iqfHtUXsyCUJlVjMEj9IhvN+sNFyp70ZPy2ZZ7NFu5RnzIywtrhTA3g
	DHBSwlCf9sWgivXqdT+s0a7hfJXXGA10OosWKU01nUDyDsLgtec8/hHsdOpa2gJVt7zJlt27HSt
	X5IUcrjOfEvdgK6MDdTNjzr9/RkDIDxgWxW+g0U504hptIJY4JcHUC5FebYKIpWL6pSsvatPLjb
	szTSj6HlR1hN+0/IY6u9CADfhMH48IQDVz1uQDDXeQgopmFLKo9HZv+FnZYRUFcmcnRRmxyOVE/
	vrpnd2Iv7LAnkiKD4lMXx/KjIkh4mh+uvL+irUXTDOedtXwhcUG5lulkJCdBXwC+t50TMc+OQ4F
	/uqTbCIpreqEse/VohSvlFSkG/f1mYyjhoSMn9/gCGwdFZQ==
X-Google-Smtp-Source: AGHT+IEhAkKwXDjelujpviQGyDPpTH6jJywcY64uf+5gQpFt6gso3LZzBTLV0xSm7xl5An9uF/VA5sz8pURwt553u6k=
X-Received: by 2002:a05:690e:1c17:b0:63f:ac4d:426c with SMTP id
 956f58d0204a3-6446eafb6d5mr2498325d50.51.1765388214240; Wed, 10 Dec 2025
 09:36:54 -0800 (PST)
MIME-Version: 1.0
References: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Dec 2025 09:36:26 -0800
X-Gm-Features: AQt7F2pxrDMsE5MqVHyciSG9IJbBew5-QNw5tNtuoRSBEjvs_IeYoAWPLMG9jkw
Message-ID: <CAMKF1srzd+BgonkfytGjeT2Hi9XGYHbUxWCAcy4e8djiMt_4dA@mail.gmail.com>
Subject: Re: [oe][meta-webserver][whinlatter][PATCH 1/7] nginx: switch to libpcre2
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Hongxu Jia <hongxu.jia@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000006689d906459c79de"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 17:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122563

--0000000000006689d906459c79de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not sure of switching defaults on a release branch is going to pan out.

On Wed, Dec 10, 2025 at 6:16=E2=80=AFAM <ankur.tyagi85@gmail.com> wrote:

> From: Hongxu Jia <hongxu.jia@windriver.com>
>
> NGINX 1.22 and later supports PCRE2 [1]
>
> [1]
> https://github.com/nginx/nginx/commit/c6fec0b027569a4e0b1d8aaee7dea0f2e4d=
6052b
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 3e308aacb03631eb1ed27baad7fc28f21075e3a4)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
> b/meta-webserver/recipes-httpd/nginx/nginx.inc
> index bcc384bd8a..fe23eb397b 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -9,7 +9,7 @@ LICENSE =3D "BSD-2-Clause"
>
>  SECTION =3D "net"
>
> -DEPENDS =3D "libpcre zlib"
> +DEPENDS =3D "libpcre2 zlib"
>
>  SRC_URI =3D " \
>      http://nginx.org/download/nginx-${PV}.tar.gz \
>

--0000000000006689d906459c79de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Not sure of switching defaults on a release branch is goin=
g to pan out.=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_containe=
r"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 10, 2025 at 6:16=E2=80=
=AFAM &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D=
"_blank">hongxu.jia@windriver.com</a>&gt;<br>
<br>
NGINX 1.22 and later supports PCRE2 [1]<br>
<br>
[1] <a href=3D"https://github.com/nginx/nginx/commit/c6fec0b027569a4e0b1d8a=
aee7dea0f2e4d6052b" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/nginx/nginx/commit/c6fec0b027569a4e0b1d8aaee7dea0f2e4d6052b</a><br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
(cherry picked from commit 3e308aacb03631eb1ed27baad7fc28f21075e3a4)<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-webserver/recipes-httpd/nginx/nginx.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/=
recipes-httpd/nginx/nginx.inc<br>
index bcc384bd8a..fe23eb397b 100644<br>
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc<br>
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc<br>
@@ -9,7 +9,7 @@ LICENSE =3D &quot;BSD-2-Clause&quot;<br>
<br>
=C2=A0SECTION =3D &quot;net&quot;<br>
<br>
-DEPENDS =3D &quot;libpcre zlib&quot;<br>
+DEPENDS =3D &quot;libpcre2 zlib&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"http://nginx.org/download/nginx-$%7BPV%7D.ta=
r.gz" rel=3D"noreferrer" target=3D"_blank">http://nginx.org/download/nginx-=
${PV}.tar.gz</a> \<br>
</blockquote></div>

--0000000000006689d906459c79de--

