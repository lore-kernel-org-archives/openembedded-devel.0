Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A32D5B161
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 07:57:23 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17283.1765871833973793076
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 23:57:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QVAl2SOt;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso2535521f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 23:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765871832; x=1766476632; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbnGAc338NWyaZWG00Hff1SkZJXlmZqhdLUZMBPZN6Q=;
        b=QVAl2SOtwADDpmt2V1Pv4djjHP9CBlBD36RygaufCPgTLdzVzcw+MsTE2vlMuLk00Q
         PSpJhhURmS8U8N6MUnvW89NNUkMy2BMqWBNQi4ZNKlOuCA7BOF3BmrffISzII2a1b6xn
         PClUKkjhtMFZpku6qoLs4nWB8UoHpnUWof0C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765871832; x=1766476632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gbnGAc338NWyaZWG00Hff1SkZJXlmZqhdLUZMBPZN6Q=;
        b=l48+3FVyIMdIP4rTpJD/BVsMTi2LJan3oMJNusdk5pcNoVvb6xGOA4bryP4LgM3hBr
         MO354Z6z9YVGbotzuGymzvKjkxLx6OA588xdhd5+qzBcbk+Zv1fxSrNEUzlOh+99I67f
         lwLWLdSy6mAPe7hy9Ry89zreOGxzFyj6u1AUCVgsKfJ/vbhHdxFnJQZAHtzXT3UbXAn0
         0ZIK0jbk/J7tPjjwFgP0CyHffAuDyQ1H516lcsc4q79fAJ/gUVFXKDTd/oqJHVVeT7W6
         AsQ8PZ15D5G44H4QpXk3vwUd1RBBrxypmM6bXSJt7uyk1xw13nV8dz8UDxdoFZgU0DEA
         k0og==
X-Gm-Message-State: AOJu0YwqCSx3TpvIbtMgMU/CnLDL1N4QSwoqBWE7ms3vVn5Dq4XI40vX
	qiGHi3f3I6s18HIvjJxQFNeW7N6ZrQvYAaAYyeAvwyMb7wi0IepskrfLGD7M7DWqBH9YpP6pxWh
	++L3pgAc3XZ/Ze/w3NOaB7EAjrIcuwbrtW+uZBR1w4A==
X-Gm-Gg: AY/fxX5eDa+Ib/xqQWM3ZM+rUWKUO2Oqk2l9tU62LezQh4eXz52CRTRpV2HcGqz1wjT
	6yElIoZTihz6mTnMd8otfPJYgV7+ZrwazvjUhPvqh7F1xnZ+P3ZOIfY1itZy8v/fsiwU2Nd+Gxu
	2FuHji1sE7BAd7D9NK/6u4xI4DGtZ+ot+y+MUruNp6J4rkl1m5FZVV1jSpJuptOvUklrIk5YIf7
	ErXGOGLboTL8hcXGIB+gnz/qMg7Bk0sRy0fTMx9nZRCdI1fkgiIiPdh90+ygHaNYcaQXzrdbxna
	0g7PHAW7gdG/bNJ4Q9oTP6SZU4Bg
X-Google-Smtp-Source: AGHT+IEr6aVUknCDGo12jfgGUoCwmtaSGwEj9HimcCHS1Pnaqbm2oCleUFPwCLnZ5OF6onPSBPgtVWXuxfbZa5HkBTM=
X-Received: by 2002:a05:6000:240a:b0:430:f494:6a9c with SMTP id
 ffacd0b85a97d-430f4946d3amr8696907f8f.17.1765871832240; Mon, 15 Dec 2025
 23:57:12 -0800 (PST)
MIME-Version: 1.0
References: <20251215225122.2243816-2-t.f.g.geelen@gmail.com> <20251215225122.2243816-3-t.f.g.geelen@gmail.com>
In-Reply-To: <20251215225122.2243816-3-t.f.g.geelen@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 16 Dec 2025 08:56:46 +0100
X-Gm-Features: AQt7F2r-Atgoi9PqBzpj3VIZbjHOEdv1HAFqHbIwo4v-xQWabMgKj9BfipxW1i0
Message-ID: <CAMSfU+7t_qYE5eWc+740kGZ=-XqG-08HN+vPL6foWncJZ9jjhw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-aiohttp: add BBCLASSEXTEND:
 native and nativesdk to the recipe
To: t.f.g.geelen@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 07:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122687

Le lun. 15 d=C3=A9c. 2025 =C3=A0 23:51, Tom Geelen via lists.openembedded.o=
rg
<t.f.g.geelen=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>
> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.b=
b b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
> index ca188911c9..5419db3535 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
> @@ -23,3 +23,5 @@ RDEPENDS:${PN} =3D "\
>  "
>
>  CFLAGS:append:toolchain-gcc:arm =3D " -flax-vector-conversions"
> +
> +BBCLASSEXTEND =3D "native nativesdk"

With this, I get
 $ bitbake --dry-run python3-aiohttp-native nativesdk-python3-aiohttp -k
Loading cache: 100%
|##########################################################################=
###########################################################################=
#####|
Time: 0:00:00
Loaded 5226 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'python3-async-timeout-native' (but
virtual:native:.../meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-aiohttp_3.13.2.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-async-timeout-native' is unbuildable, removin=
g...
Missing or unbuildable dependency chain was: ['python3-async-timeout-native=
']
NOTE: Runtime target 'python3-aiohttp-native' is unbuildable, removing...
Missing or unbuildable dependency chain was:
['python3-aiohttp-native', 'python3-async-timeout-native']
NOTE: Runtime target 'python3-aiohttp-dev-native' is unbuildable, removing.=
..
Missing or unbuildable dependency chain was:
['python3-aiohttp-dev-native', 'python3-async-timeout-native']
ERROR: Nothing RPROVIDES 'nativesdk-python3-async-timeout' (but
virtual:nativesdk:.../meta-openembedded/meta-python/recipes-devtools/python=
/python3-aiohttp_3.13.2.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'nativesdk-python3-async-timeout' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['nativesdk-python3-async-time=
out']
NOTE: Runtime target 'nativesdk-python3-aiohttp' is unbuildable, removing..=
.
Missing or unbuildable dependency chain was:
['nativesdk-python3-aiohttp', 'nativesdk-python3-async-timeout']
ERROR: Nothing RPROVIDES 'nativesdk-python3-aiohttp-dev' (but
virtual:nativesdk:.../meta-openembedded/meta-python/recipes-devtools/python=
/python3-aiohttp_3.13.2.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'nativesdk-python3-aiohttp-dev'
NOTE: Runtime target 'nativesdk-python3-aiohttp-dev' is unbuildable, removi=
ng...
Missing or unbuildable dependency chain was: ['nativesdk-python3-aiohttp-de=
v']

Did I miss a python3-async-timeout update?

> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122671): https://lists.openembedded.org/g/openembedde=
d-devel/message/122671
> Mute This Topic: https://lists.openembedded.org/mt/116801466/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [y=
oann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Yoann Congal
Smile ECS

