Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC898C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:30:36 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.9636.1744975829990336268
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kNTIasYv;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso16958981fa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744975828; x=1745580628; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7Q+xgn+wcnZKtH287GFDhA6YMRhTUiaQrN+tG2AAWU=;
        b=kNTIasYvSvv9VKv7ufJhZbsMm/ib7b0Bq+s6aK68CEGHsqSvxF4mi64C9x3FfV0AxB
         pH4e0WGQjugz0cR/iCT8JfU8xF97EJH7WKPwnEBDN3s1svwDHcuK/U4LfEPTWpGibK7j
         4rRRH8q3QbfQtHTGXsg2lXHbfzCcVlmPi5PqvMMS1lu5QoaJ223PH6OJfw3LHk+c5SrX
         iJ8G/6v2iQZTDk6fu6zH/lWeCXOjDGDkfakv+OtPCkVX3+R0KbnCSivMMBayMCBgx3jE
         mWma8c7zROcujFV4E1qwreLv5uX3Mc7ucxXu2Bpp5Eyy+aSRKfZXsop80nWceP5X/A8e
         Zc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744975828; x=1745580628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7Q+xgn+wcnZKtH287GFDhA6YMRhTUiaQrN+tG2AAWU=;
        b=qbjLtNiWkXIQelxbKgDaeJKwKWB3mVfVPZtJXjUTYtSfGCYUf7Uyz553MqfBkWm++l
         do93Wjtj6klrgtO/jX+ZACp0b3kabC5AhEk7zKZoL6iwKDosTETCBgitbBTVWyPqW4oG
         z8HIj4FX2WDFydCZF8K18H3r5R4yZoASlF7yyeddTmkTBhU+S5X1SpTzKfoH096Ly+RR
         N9JL1zfWsRygBsMVKgOfEzM2SklvM5lgEOlfVnXvmBVzHa62LitCuKP4U5pZzrEo94XA
         v0WM7kP3+um2KtjSYbHTa3iZQlC7V9VgC7mzFGS+ZyArQzqnfhNRtdt9xcdA1EoNtp1v
         czFQ==
X-Gm-Message-State: AOJu0Yw5ym1TkB4dlN5l+3Wqq3yUVN3XZrM2Unk7DgzV+nq8sQvjHjA7
	R5jF/ZtDxYqMYaGs6pJtdk07FWV0Hgi1tdxoYPzfmsqUpLM3xqOfotlu8Ju55h3yoA58mwl7sZw
	vxR8zq586tfFj5mR241q2Xi83HTo=
X-Gm-Gg: ASbGncvxDCODYaJei9Tdp8T+GBTL/VKq8demX6oR3/GAMLbV3+bWmHpM1uBK3fzbSg/
	glOzyLPSTaHBPcy0bl1m5AdtALkV2RT+Q8SfDoEoozqz3Rejzyja5w16v+YYoihNMpyfSycAd8c
	kCcAof/hhkCXhI0YaGdjqNkvVfW7ddmg3tqt5ltfmuay3A0P2heAyQjoE=
X-Google-Smtp-Source: AGHT+IG74qubrjDP7iZ1C9B3BJG774SBdARdBueXI7mVQOyJrxpmwkzVBzkdKkQXBAojFFx4xn5rmBThjgbAJQR375o=
X-Received: by 2002:a05:651c:241:b0:30b:f006:3f5 with SMTP id
 38308e7fff4ca-310904d618dmr6959911fa.15.1744975827899; Fri, 18 Apr 2025
 04:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250418014123.3684623-1-raj.khem@gmail.com>
In-Reply-To: <20250418014123.3684623-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 18 Apr 2025 13:30:15 +0200
X-Gm-Features: ATxdqUE74YFbeXfzQkg8Auoj1Jav0RSEKYBGfCd90_cgQCZQ1_zIb9p4Eol-_tY
Message-ID: <CA+chaQewE4WX=DXQv17=aw2etQLj4wxJ_hmtHDY0zaGFgerpBA@mail.gmail.com>
Subject: Re: [oe] [meta-initramfs][PATCH] klibc.bbclass: Add spaces around assignment
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116950

On Fri, Apr 18, 2025 at 3:41=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-initramfs/classes/klibc.bbclass | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classe=
s/klibc.bbclass
> index ca50a3d431..935ee10c40 100644
> --- a/meta-initramfs/classes/klibc.bbclass
> +++ b/meta-initramfs/classes/klibc.bbclass
> @@ -9,8 +9,13 @@ CC:append:armv7ve =3D " ${@' -mfloat-abi=3D${TUNE_CCARGS=
_MFLOAT}' if (d.getVar('TUNE
>  CC:append:armv7a =3D " ${@' -mfloat-abi=3D${TUNE_CCARGS_MFLOAT}' if (d.g=
etVar('TUNE_CCARGS_MFLOAT') !=3D '') else ''}"
>
>  # klcc uses own optimizations by default. See klcc(1) man file.
> -export CFLAGS=3D"${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}"
> -export CPPFLAGS=3D"${TUNE_CCARGS}"
> -export LDFLAGS=3D"${TUNE_CCARGS}"
> +CFLAGS =3D "${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}"
> +CFLAGS[export] =3D "1"
> +
> +CPPFLAGS =3D "${TUNE_CCARGS}"
> +CPPFLAGS[export] =3D "1"
> +
> +LDFLAGS=3D" ${TUNE_CCARGS}"
> +LDFLAGS[export] =3D "1"

Why the change in export syntax, is the varflag preferred now?

