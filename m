Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA8DC27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 15:39:44 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.11735.1718293179702932484
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jun 2024 08:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ctmdZqFN;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6f9fbec4fd9so678380a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718293179; x=1718897979; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oifhWrRfaUd2vQSL9XfB3/rihfLsXHyVhNs5/dX4AOs=;
        b=ctmdZqFNJDTzHhwcQ64OBmrypq4asACZYAqN5e+tAcOrcpCt7XA54gm+LhSzKobJUZ
         AAZ1UUN8ceclWT266qoPGxMmUda/TEVr9OuneqyhW4ZxN9hnEt4U6L2LyNmvOvYgnKrp
         GOPv0i0DYTcoulAFZ6utL5vMy1MuWr8eAPsMG3f9pd6HKfL5dnS5g3gMwk4agMYkeOSy
         nalrYeo4tWhkJY7UwSAcxC+N0Gv4pl+vWDzoya4JRjFNFGOkokxkotokG/MwGWNy4017
         PGGShsu5Xg57yB7o9CFR7F429kdFWSLpEdd63Dn0d4068U+BsneYLo1yvXqeRUEFd5hL
         Nmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718293179; x=1718897979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oifhWrRfaUd2vQSL9XfB3/rihfLsXHyVhNs5/dX4AOs=;
        b=cAAEGXwWffxe3H7Yl4BlzBqkuCxY5WAIglBAO+Ct8E6hf+M34AisBSAAD+MPB7RgpO
         0eNetqRsmAhBTrOPZdG9ieZLaWqZDq1MFbhA9P7OH5AsZChS4P9YQNIyUHXJD3rouKmg
         XEkqMgHd5dGmFiccyCh/+IQLE6dqMKnL+PCwp9lZVfmxK5Lbv6RZXEg1QmIK/wRTXhF4
         tR4pnUr0BUShMmzBb5gbncdXxXibdEXBsnHVOU8LLGXMWRksBnLqddbKWleAWcp0+8iX
         fiGpr+/vXK5UBr0FV5CqcmV79aer4SjZKHmOaCrBSCgXzfzV5O9nIxESiqf1eznR25CS
         QNZw==
X-Gm-Message-State: AOJu0YwSKH1ePyXKn7NQJGaLm9f8QW6p3Iury/dQs8uVxOnDgTZElaJB
	pBiKL+38yIM6mUOpVVk3IestRdxhtk4vCX0gGegAvCZvrDcoUPXJ3ch3sIRKRoP5F1KfOLg97OC
	SGF/yc5Fbs/pL+D7Xp0u83DRZFX87BQf8
X-Google-Smtp-Source: AGHT+IGNXgPfpmo1Y8e6vdUswddp1aJ3OzY021V6XkyeghUsLifckvUQGJ9UKXfXOV/+XbSQ3Gp4XNFb3KKIKjSMSf8=
X-Received: by 2002:a05:6870:61cc:b0:254:b781:2f71 with SMTP id
 586e51a60fabf-25514f1d238mr5444377fac.57.1718293178702; Thu, 13 Jun 2024
 08:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240613084703.1858419-1-changqing.li@windriver.com>
In-Reply-To: <20240613084703.1858419-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Jun 2024 08:39:11 -0700
Message-ID: <CAMKF1sozZLs+7XkTZnmoxJmuSz+pqBcVaDn5-G3M2hv7Ak=L1Q@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] tnftp: Disable incompatible-pointer-types
 warning as error
To: changqing.li@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 15:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110895

On Thu, Jun 13, 2024 at 1:47=E2=80=AFAM Changqing Li via
lists.openembedded.org
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Fix lib32-tnftp do_compile failure with gcc-14:
> ../../tnftp-20230507/libedit/terminal.c:597:56: error: passing argument 2=
 of 'terminal_overwrite' from incompatible pointer type [-Wincompatible-poi=
nter-types]
>   597 |                                 terminal_overwrite(el, &el->el_di=
splay[
>       |                                                        ^~~~~~~~~~=
~~~~~~
>       |                                                        |
>       |                                                        wint_t * {=
aka unsigned int *}
>   598 |                                     el->el_cursor.v][el->el_curso=
r.h],
>       |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
> ../../tnftp-20230507/libedit/refresh.c:114:38: error: initialization of '=
wchar_t *' {aka 'long int *'} from incompatible pointer type 'wint_t *' {ak=
a 'unsigned int *'} [-Wincompatible-pointer-types]
>   114 |                 wchar_t *firstline =3D el->el_vdisplay[0];
>

there is a new release available
https://ftp.netbsd.org/pub/NetBSD/misc/tnftp/tnftpd-20231001.tar.gz
it might be good to upgrade it while here, and check if the issue is
fixed upstream or not.
secondly, it would be good to see if we can fix the problem or explain
it what's going on.

> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/tnftp/tnftp_20230507.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-networking/recipes-support/tnftp/tnftp_20230507.bb b/me=
ta-networking/recipes-support/tnftp/tnftp_20230507.bb
> index bdd9759f2..da4466794 100644
> --- a/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
> +++ b/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
> @@ -36,3 +36,6 @@ PACKAGECONFIG ?=3D "openssl \
>  "
>  PACKAGECONFIG[openssl] =3D "--enable-ssl, --disable-ssl --with-ssl=3Dno,=
 openssl"
>  PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
> +
> +#fix lib32-tnftp do_compile error with gcc-14
> +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110889): https://lists.openembedded.org/g/openembedde=
d-devel/message/110889
> Mute This Topic: https://lists.openembedded.org/mt/106648104/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

