Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A028CD98EC
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 01:14:22 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5764.1781658858474596954
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 18:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LDhKt9JP;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7fe4808741eso5774467b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 18:14:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781658857; cv=none;
        d=google.com; s=arc-20240605;
        b=NL/hORWHpdQcFWJ4FV5uD4QB8WsfPJ0X6lKeJkg1fmOvHHw92+bp6Ci9CoMoqhw3UK
         nkPvVE1ALc6xKcrFC2fGDl+lnBvLQ53gZpwaU/e+e7/I88wlAVXdVblnojPZkriHZ+PS
         Dg3r5QhC7dFuHfgmUMdk19v3NImoexxNAv4iRR8IvwDHoCX1UcoA5jnE23tbtFvizcy+
         EtcKXnTprsp9wtY79kLtyS/hu2gguxhb7mGNNqBqoPXNNmkGXtxCFqPUPrK8dgqZDjj3
         cmkZ3xUlXBDRmkd+edlTxu7MW/THp4vevOkSFLU3raXGFkiTht61GXsQCZO6JTdpjprG
         fgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CNpOggGR5MModxz97LnOmczuSDa0/gpmqs3WWrGM+AY=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=a4mxZEzKiEvvHhVUzY2SjU/2TbsCTXZAEarHHUIkVgQ0hP4fNIieda9IUz9eS2t+eG
         FBFUJh5I/D1n1HkXlMTbfGBENfMUWGLEOzTGmdh5vE4w+F20GsBldCP07NFC/SdJrOk9
         72vgJTh6kY6clAvvWFOcDtf4unmdTsU5BF3mKwcjVeYJ5zio9czp5P3c5Vw/vwFDS/wa
         BaiEA+LaJMFtK+NVf5qBVA7+FKhHpCPgCYjtiPk9VvX53yO2O1xk2/zNk4Ym2Dyen6lX
         jPyn4jkg6IHhb6swzONFh2YC9Ml47OinCh1H0nEU+5hzjxlJZ5x2Lcza8cVPpUnsABFu
         bZBQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781658857; x=1782263657; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CNpOggGR5MModxz97LnOmczuSDa0/gpmqs3WWrGM+AY=;
        b=LDhKt9JPJieg6VCoWHdOOL/z3LbQ4sB3Cy2FXx7aCE2I9OXo2JgVVmV/oYR9Y0IzVL
         CzsAW306VQKWZuRuVmUWwq0Y4Fs6hixY939wqxWGwLozB2LR3VLAQU8+uEiJau4iH9oU
         eMscK0WC5sBplj+cbluVR1L6b9CIZpLZF9pXCESgH6tuEg0uuLd4udaGS76I7VtuZoTl
         ymIC5KSD+2PLA/oR9QzF6p4TzZ1I6PerQf2seFPOJ5Bkg8scKlgs8VMWL6cyPoJIcx6+
         4i9qhdO//zwHEq+Rm74z5WXq79KJ/HH5NTbV6TmdSS/LxR4Zjt55IY64b3SWUMTybJf2
         HCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781658857; x=1782263657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNpOggGR5MModxz97LnOmczuSDa0/gpmqs3WWrGM+AY=;
        b=izHleEbM30ZK5sYYUQHFVvYkZS9dZlv72NkSicVrflgw0S+ljWoC7LB7YH+Q7NuKxi
         km5EukqXAG2tUoImL54zzKFe9dhIY8j3u2mdzZMftpicDshIDcg76LnTCtalgPCCpstL
         XE2mKK4NP1BJwiRX5d0GdpfNBNyrjKb2ejJNIzIHbyukZaOgVQDu/qPwQB8PVjohZMDi
         MUy0Ki6mCg4V47kZUZDtekA91makdbNSJejg8sE4zWEFhdXgaNO0QMuSu+ZbrdTV3Dhb
         tHEJETMU8IJ2Tk0d0I34uRQhDphIucPqLVVZ7QAF7ZWjWxRXC1lOr6yzXuW6sXDX5Agc
         oUfg==
X-Gm-Message-State: AOJu0YzOJvlCZ+qbO062XBk6mP3wfZcw7GjiCLfHZQ87uXDnCZ0/SDym
	zGkxgenyDfjmcptOLORqmQlWQeFtI7el0ZtK3j0OXsYoBuQbuF1C+eEZhbDOSFR6tK9itn0Mta2
	VCjpyCN5b/bEjLDHUuLfJQz0XlCaBDSZwiF0fuow=
X-Gm-Gg: AfdE7ck2atlk9BJ9VTP474IzQrDyWpWdha3bqy6wdI/TYmK5OgDTT671e8wFZS8g3Zb
	Sbpf5KAWG/nTwFJ42JfXw0Enmo6hCk2aXuPl5C0FZ9naPxfmCGrrpJ2X0UWwR5/QRIfkFzhmGQq
	a8tbKhKuecIbl4oo8w1BM4uuwr2Zbkz3C0h8+WxQz3QcaNcRotUss8oo4z0w/hXHH9lhG20avKC
	wyzDXg13v+PpYM6Hn5zPfjxUBv/4jANiQ7UuWnBFRXZjeWm20Gn1WzzkPRGfEdBP0GKw9xcCPCH
	ueCb4nqTZdclC+Q9MMUkm8QHerCaj84uRt9CEPVj5Qf12U/k6zWNLJ5ZjqYM/qFZopii6+mr3Qx
	nN39KfBetxN53N1v7/+Bq7ltm/gYXebSoT+vM8G/w/VbkDWa8iP5phGGDawvRe/uXAWU4cnXbba
	gY99/c
X-Received: by 2002:a05:690c:c526:b0:7bd:882a:43d9 with SMTP id
 00721157ae682-7fe5f47aa84mr13994407b3.27.1781658857169; Tue, 16 Jun 2026
 18:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1781009217.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1781009217.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jun 2026 18:13:51 -0700
X-Gm-Features: AVVi8CfsATlbTMrjiYZu2k9FzH0j0LE7PqbVLbZ2lRVxTg7YvlkQwJozDi8--jc
Message-ID: <CAMKF1sr6Zathv1k6KYfZFhtjQwg2Ab=ibf=DnxDXPTVsMgkdDg@mail.gmail.com>
Subject: Re: [PATCH 00/13] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004ae6da065468c7d9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 01:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127626

--0000000000004ae6da065468c7d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is merged now. Thanks

On Tue, Jun 9, 2026 at 5:49=E2=80=AFAM Anuj Mittal <anuj.mittal@oss.qualcom=
m.com>
wrote:

> Please merge these changes in scarthgap. Tested locally and on autobuilde=
r.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1547
>
> The following changes since commit
> d8cc4e44001c7257273d290ce8c4496e93d32841:
>
>   postgresql: upgrade 16.12 -> 16.14 (2026-05-25 08:05:43 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> for you to fetch changes up to b0c2c648a1af89e7a8dd4c2ec841f3bc0ed0ccb9:
>
>   nginx: backport fix for CVE-2026-9256 (2026-06-09 11:37:19 +0530)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (1):
>   postfix: upgrade 3.8.16 -> 3.8.17
>
> Gyorgy Sarvari (4):
>   python3-paramiko: set CVE_PRODUCT
>   python3-priority: set CVE_PRODUCT
>   python3-pydantic: set CVE_PRODUCT
>   python3-supervisor: set CVE_PRODUCT
>
> Naman Jain (1):
>   libssh: ignore CVE-2025-14821
>
> Nelson Garcia (1):
>   nginx: backport fix for CVE-2026-9256
>
> Sudhir Dumbhare (6):
>   python3-grpcio: Fix CVE-2024-7246
>   python3-grpcio: set status for CVE-2026-33186
>   python3-grpcio-tools: set status for CVE-2026-33186
>   python3-grpcio-tools: set status for CVE-2024-7246
>   python3-grpcio-tools: set status for CVE-2024-11407
>   python3-tornado: Fix CVE-2026-31958
>
>  .../{postfix_3.8.16.bb =3D> postfix_3.8.17.bb}  |   2 +-
>  .../recipes-support/libssh/libssh_0.10.6.bb   |   2 +
>  .../python-priority/python3-priority_2.0.0.bb |   2 +
>  .../python/python3-grpcio-tools_1.62.2.bb     |   4 +
>  .../python/python3-grpcio/CVE-2024-7246.patch | 206 ++++++++++++++
>  .../python/python3-grpcio_1.62.2.bb           |   3 +
>  .../python/python3-paramiko_3.4.0.bb          |   2 +
>  .../python/python3-pydantic_2.7.4.bb          |   2 +
>  .../python/python3-supervisor_4.2.5.bb        |   1 +
>  .../python3-tornado/CVE-2026-31958.patch      | 262 ++++++++++++++++++
>  .../python/python3-tornado_6.4.2.bb           |   1 +
>  .../nginx/nginx-1.24.0/CVE-2026-9256.patch    |  63 +++++
>  .../recipes-httpd/nginx/nginx_1.24.0.bb       |   1 +
>  13 files changed, 550 insertions(+), 1 deletion(-)
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.8.16.bb =3D>
> postfix_3.8.17.bb} (99%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-grpcio/CVE-2024-7246.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-31958.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-9256.patch
>
> --
> 2.54.0
>
>

--0000000000004ae6da065468c7d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is merged now. Thanks</div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Ju=
n 9, 2026 at 5:49=E2=80=AFAM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@=
oss.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Please merge these changes in=
 scarthgap. Tested locally and on autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1547" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1547</a><br>
<br>
The following changes since commit d8cc4e44001c7257273d290ce8c4496e93d32841=
:<br>
<br>
=C2=A0 postgresql: upgrade 16.12 -&gt; 16.14 (2026-05-25 08:05:43 +0530)<br=
>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/scarthgap<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/scarthgap" rel=3D"noreferrer" target=3D"_blank">https://git.op=
enembedded.org/meta-openembedded-contrib/log/?h=3Danujm/scarthgap</a><br>
<br>
for you to fetch changes up to b0c2c648a1af89e7a8dd4c2ec841f3bc0ed0ccb9:<br=
>
<br>
=C2=A0 nginx: backport fix for CVE-2026-9256 (2026-06-09 11:37:19 +0530)<br=
>
<br>
----------------------------------------------------------------<br>
<br>
Ankur Tyagi (1):<br>
=C2=A0 postfix: upgrade 3.8.16 -&gt; 3.8.17<br>
<br>
Gyorgy Sarvari (4):<br>
=C2=A0 python3-paramiko: set CVE_PRODUCT<br>
=C2=A0 python3-priority: set CVE_PRODUCT<br>
=C2=A0 python3-pydantic: set CVE_PRODUCT<br>
=C2=A0 python3-supervisor: set CVE_PRODUCT<br>
<br>
Naman Jain (1):<br>
=C2=A0 libssh: ignore CVE-2025-14821<br>
<br>
Nelson Garcia (1):<br>
=C2=A0 nginx: backport fix for CVE-2026-9256<br>
<br>
Sudhir Dumbhare (6):<br>
=C2=A0 python3-grpcio: Fix CVE-2024-7246<br>
=C2=A0 python3-grpcio: set status for CVE-2026-33186<br>
=C2=A0 python3-grpcio-tools: set status for CVE-2026-33186<br>
=C2=A0 python3-grpcio-tools: set status for CVE-2024-7246<br>
=C2=A0 python3-grpcio-tools: set status for CVE-2024-11407<br>
=C2=A0 python3-tornado: Fix CVE-2026-31958<br>
<br>
=C2=A0.../{<a href=3D"http://postfix_3.8.16.bb" rel=3D"noreferrer" target=
=3D"_blank">postfix_3.8.16.bb</a> =3D&gt; <a href=3D"http://postfix_3.8.17.=
bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.8.17.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../recipes-support/libssh/<a href=3D"http://libssh_0.10.6.bb" rel=3D=
"noreferrer" target=3D"_blank">libssh_0.10.6.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0.../python-priority/<a href=3D"http://python3-priority_2.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-priority_2.0.0.bb</a> |=C2=A0 =C2=
=A02 +<br>
=C2=A0.../python/<a href=3D"http://python3-grpcio-tools_1.62.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-grpcio-tools_1.62.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0.../python/python3-grpcio/CVE-2024-7246.patch | 206 ++++++++++++++<br=
>
=C2=A0.../python/<a href=3D"http://python3-grpcio_1.62.2.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-grpcio_1.62.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0.../python/<a href=3D"http://python3-paramiko_3.4.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-paramiko_3.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../python/<a href=3D"http://python3-pydantic_2.7.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-pydantic_2.7.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../python/<a href=3D"http://python3-supervisor_4.2.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-supervisor_4.2.5.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../python3-tornado/CVE-2026-31958.patch=C2=A0 =C2=A0 =C2=A0 | 262 ++=
++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-tornado_6.4.2.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-tornado_6.4.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-9256.patch=C2=A0 =C2=A0 |=C2=A0 63 ++=
+++<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.24.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.24.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A013 files changed, 550 insertions(+), 1 deletion(-)<br>
=C2=A0rename meta-networking/recipes-daemons/postfix/{<a href=3D"http://pos=
tfix_3.8.16.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.8.16.bb</a> =
=3D&gt; <a href=3D"http://postfix_3.8.17.bb" rel=3D"noreferrer" target=3D"_=
blank">postfix_3.8.17.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-grpcio=
/CVE-2024-7246.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-31958.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-9256.patch<br>
<br>
-- <br>
2.54.0<br>
<br>
</blockquote></div>

--0000000000004ae6da065468c7d9--

