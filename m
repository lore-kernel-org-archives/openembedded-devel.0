Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.157.1622755630547169864
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 14:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eFRIB19U;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id u18so5874213pfk.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 14:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jnFodnZoO3xAbGui/Sgx6ilgKRwzvacuS552O+yT/2w=;
        b=eFRIB19UhFqbSid/KktEnUQAhDQ6kLlOAy1h1fpWbxF55yrcBzCjPhSzmIsWg6oEDH
         VlxTe+x14MBP0c9+WS6/peH56Cdd8PCm8/BzDD01MMoLTG8gPUEs/NL7U/Qd23jNcan2
         nds1MWdnfuR6WNdB1mg3ElE2TLAr4vdmmrUXw9oiEAVlYDhEvJOmYpLnOD2qBQYqvKoT
         gIIT+NAJp7+7/U/jKHsTG68h3UTPdwT//ODPwWW8c7LOiXOhSlBfHRdL61iPBj09aap9
         GMtl1FdjgRWAAwIpfgAPzj7CiL9Y2Fw8T8V31XELiRZap73Nc294OrOKt8NjE0AOI30p
         P8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jnFodnZoO3xAbGui/Sgx6ilgKRwzvacuS552O+yT/2w=;
        b=YeEyqvnBxZqRDrnoTUv6z3RJByt5ZNVwntSfDbH5Tibp+8crcsxnGS49TQGnUt4Au0
         d0R+FKy2weR9Z4EqKqT9L4cBLJjKh1W9LfjamdfP/+0K701iTFw7pLuDIx0jocGAtshG
         hzVb7cD8LW6TJc9bRkjhoq7O9S7JV/f03mnzhbJciuM+JpTBRA00pectZp2/TUC356h4
         K9u3BEqcR5HrD5j4sYoIlIQPciILAkIZ7/XTgHofOEvrk6/hJBsP3B2fLupqKqZjlO5s
         Q1QwJJRrgYcnz5mUDkNzHOuEwEmZOnSQL+5t9Rkay+WSAitLfeQF9+UekzLTnKdLf1uH
         2gPw==
X-Gm-Message-State: AOAM532/DJAccKivBJo4LEyeII43aaKs1JUJfd5TSmPRL+GJeibQePL1
	NcU2DVsnyM7ck8DoGbz4v04srHTkcouAA0T1tyg=
X-Google-Smtp-Source: ABdhPJwhqYo2Nha5gjghKFaXre0WvoUBxvJHXcjYpixEKshCIEmf/ZuJYgKR3R6ri99tXGf3tv53g8MrZiSSvZ3wfXU=
X-Received: by 2002:aa7:8888:0:b029:2ec:763f:4bcc with SMTP id
 z8-20020aa788880000b02902ec763f4bccmr1288315pfe.35.1622755629912; Thu, 03 Jun
 2021 14:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210603210531.2314701-1-schnitzeltony@gmail.com> <16852E7A607BB2E4.32687@lists.openembedded.org>
In-Reply-To: <16852E7A607BB2E4.32687@lists.openembedded.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 3 Jun 2021 23:26:58 +0200
Message-ID: <CALbNGRT+anFr8rXG+BB+BCTOWTx8kspY0LfgcNEaMCPDHM566A@mail.gmail.com>
Subject: Re: [oe] [PATCH 4/5] nss: upgrade 3.64 -> 3.66
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 3, 2021 at 11:06 PM Andreas M=C3=BCller via
lists.openembedded.org
<schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
Please ignore this one for now- it breaks pkcs11-helper

Andreas
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-oe/recipes-support/nss/{nss_3.64.bb =3D> nss_3.66.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/nss/{nss_3.64.bb =3D> nss_3.66.bb} (99%)
>
> diff --git a/meta-oe/recipes-support/nss/nss_3.64.bb b/meta-oe/recipes-s=
upport/nss/nss_3.66.bb
> similarity index 99%
> rename from meta-oe/recipes-support/nss/nss_3.64.bb
> rename to meta-oe/recipes-support/nss/nss_3.66.bb
> index fce5a856e..b5edc2b00 100644
> --- a/meta-oe/recipes-support/nss/nss_3.64.bb
> +++ b/meta-oe/recipes-support/nss/nss_3.66.bb
> @@ -33,7 +33,7 @@ SRC_URI =3D "http://ftp.mozilla.org/pub/mozilla.org/se=
curity/nss/releases/${VERSIO
>             file://nss-fix-nsinstall-build.patch \
>             file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-=
cryp.patch \
>             "
> -SRC_URI[sha256sum] =3D "d3175427172e9c3a6f1ebc74452cb791590f28191c6a1a4=
43dbc0d87c9df1126"
> +SRC_URI[sha256sum] =3D "89a79e3a756cf0ac9ba645f4d4c0fc58d4133134401fb0b=
6c8a74c420bb4cdc9"
>
>  UPSTREAM_CHECK_URI =3D "https://developer.mozilla.org/en-US/docs/Mozill=
a/Projects/NSS/NSS_Releases"
>  UPSTREAM_CHECK_REGEX =3D "NSS_(?P<pver>.+)_release_notes"
> --
> 2.31.1
>
>
>=20
>
