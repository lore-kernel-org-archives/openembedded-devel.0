Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2466BD116F3
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 18:36:36 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2953.1764527789270195021
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 10:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L6IfJmHp;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-63f97ab5cfcso2620891d50.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 10:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764527788; x=1765132588; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgtzZ7CmAfJsXLBk0kLAaGxLjeAAn1PV7f6PFs78fps=;
        b=L6IfJmHpIC49TztWHilOjt7fu1xeeCPnSnUio/CrBpUDKCFSvnCGnvfOsGhgfBafpK
         bh5x1qwKfL+wpt7BvVSfJVpz/xSH5WAQFo2OlXfJdCuvsuTBXp5Ibahuy3Au15qNDVW1
         s4mgGTvTTJ+vjisXKKMsz+fqBFRpL66ikwc/hLqhCDXA+/Yl80CW3hzWOF+IUEWzmtV7
         7IsJh2wvKM6vm1PIpy2GA13xcyAv4uqpfwWPkjRmQOVFBkqOSWSSLn4e3NAVPeR/zRbj
         kjOwziTu94fO1NFbR666UlkOfyFPhadqTl5iWhzCY9mAKVIeHp9rShC48mxNhVv/mJFE
         9Ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764527788; x=1765132588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lgtzZ7CmAfJsXLBk0kLAaGxLjeAAn1PV7f6PFs78fps=;
        b=kGKZvn/P+wZtTmUETFzRL9V3VOCpOdmf2eQcW49xSZ0ciB4zzZywLAE83RRFIoahoC
         fDJhsDDi3MuUN4VDXqyv5DYGfHtr+cI8pp+NEJKfwbCIwkk0nxXzJcsj0gEoc/zlpHJ2
         r8K3guNf2DRU116OUT2QaKFGEbL5yc82/s4EimAyFn5O9wVzW+4mPplc6VclSU3Z1Xrf
         3LszBRo9GPX0r7VoxugMOUxMetKuWjqVkqbdAz9CC5PhpF9SLYm/lXO37jnw8bVY7ouS
         y1o/pElGdVJ92FWlslBzffEJH3SmAa98x0Mw8b65ab6rfNb98zZwaf2sA2eGZbHb1ebS
         O+TA==
X-Gm-Message-State: AOJu0YwsFsVEyqH7oCHwhJgPPILbM6Wjd+Dc0Q+UOcoCnHxZyyzlezbd
	sPR/w+4XgTg0b1mP3XBQB//gVvxnljxeg9rWhxg8OIL8yE30lvmQLRP8WsQYO4gUOG2z42znJqZ
	dwQmMrorMYBzygxodNKzEOAn0gzBTOzM=
X-Gm-Gg: ASbGncvIE6IU4eBElDDLcb1udX45aj6joM+blry70/HgJktnWFAMQxu4WWgreI32UjZ
	y0KRm792GLIZ1bLadBdlgPlNGVTOlnMCAjj73QB91JQhEcWzJrPGmMBvc3qT3KN2Xtky1mbCgk8
	1RMzGbinbILksSsn8Sr4m0tbhc+LWdPw9zqbIv1uxq4kH/aEBeL11K4wiUesaXMeJ5axFqOQYU4
	hOcveG+qocTzpjOXWtvf3bNvuHtuM7ybc4CrsFnqEaOCOfd4eh/dbjYky5HHeDXX4Ik+jAfmgxT
	V+X6C1z0gWs14ywxNdfWZZN3HMYYlt6uKkWvs0iVWwYc1vvvquzkSpRb2OmK96jDLeQZgA==
X-Google-Smtp-Source: AGHT+IFGIOKVqZKmOcIFnvFKs/2/a5KoQK+HZ0dDSiBR9eYaLnPrQPKEEkfVuhDZH2kPorr76DiBqpjW9LVcSwh7B4s=
X-Received: by 2002:a05:690e:2448:b0:63f:b87a:8369 with SMTP id
 956f58d0204a3-6432931e895mr14085810d50.25.1764527788387; Sun, 30 Nov 2025
 10:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20251130183450.101776-1-raj.khem@gmail.com>
In-Reply-To: <20251130183450.101776-1-raj.khem@gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sun, 30 Nov 2025 19:36:17 +0100
X-Gm-Features: AWmQ_bnclvWqKnO4Tqg-8qUdxCncDWNWTedtj8J2JEeMB9dgFGbtYIGZCVA5fZI
Message-ID: <CABF_=ygSAEuaz6agdxcySBq1uV32s_Jnmj-LGgGozTTJSEMBwA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-fastapi: Turn swagger-ui
 dependency into packageconfig
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 18:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122171

meta-xfce -> meta-webserver

On Sun, Nov 30, 2025 at 7:34=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-devtools/python/python3-fastapi_0.122.0.bb    | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.=
bb b/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
> index 37a475ef8f..a5c9d257b0 100644
> --- a/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
> @@ -9,6 +9,12 @@ SRC_URI +=3D "file://run-ptest"
>
>  inherit pypi python_pdm ptest-python-pytest
>
> +PACKAGECONFIG ?=3D ""
> +# swagger-ui is in meta-xfce that meta-python does not depend upon
> +# Users can still enable it in their distros explicitly but its disabled
> +# by default
> +PACKAGECONFIG[swagger-ui] =3D ",,,swagger-ui"
> +
>  RDEPENDS:${PN} +=3D "\
>      python3-annotated-doc \
>      python3-fastapi-cli \
> @@ -18,6 +24,4 @@ RDEPENDS:${PN} +=3D "\
>      python3-typing-extensions \
>  "
>
> -RRECOMMENDS:${PN} +=3D "swagger-ui"
> -
>  RDEPENDS:${PN}-ptest +=3D "python3-orjson"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122170): https://lists.openembedded.org/g/openembedde=
d-devel/message/122170
> Mute This Topic: https://lists.openembedded.org/mt/116542571/2167232
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [j=
an.vermaete@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

