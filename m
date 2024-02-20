Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8E4C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 16:46:16 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.18065.1708447567158860528
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 08:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Klsh7M2U;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-21e6be74db4so2526732fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708447566; x=1709052366; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OGlhOu0wXrrsTakeHBxmwuHrDjgZrS3XLiPJjRgCkI=;
        b=Klsh7M2ULdUJGD+beu6bLDqvGn++EvJGFn9dNk+qgZftKHppVkBsOWu/D4mNf1kEy0
         5noWQXk2vXUHbRRgQag0Optp26MV6Fk4+UcnFGC56YGl/WZWm5jzACM5SrNELzvww9/u
         IWB/qzLX8cv+Jw+qJHVdZ721JLw+3ejx8n9qpXMqht1+YBrXNCJZwqMxDQhg+RBGsOxh
         bsurJIcs2sMiDqIgRjVElieabYmJmkWaiOYlVxLsBzvqaD3ga4Q+UYV2BZSo/nTlJgs8
         PiD9ZAsAT9QE1Aa7HXR3/xlpudTSjRIMvMNT93cH9nCPbdrJTX6J7wTZLN3EZfVdQvQM
         Ua1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708447566; x=1709052366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OGlhOu0wXrrsTakeHBxmwuHrDjgZrS3XLiPJjRgCkI=;
        b=Z5kFhtIjxJP6Vd8KOgdygmOgbQCz6GAMiaMy4TiLXytIH74AoD9JJ9lqSUkNXYxgik
         sJBbTW9dLssO0jK471sSS6vjq4klyZqXpcLQIqlWFteDShxmV1Zwym9QU6eL2nbOXAxd
         fTUMNR4IIsF/y9XDrxEH7TgUte/XCcEc57AYTi75RDyXsxZjEvkv8uh+rQDSnL6IN1JM
         zhCQHgwkdXfhwC8NK3lx0DzoiinhCe3OUQtwqsrytZhVkdwWOmfiWKNEhlt+BIO3xGFA
         igKzyrWEZVyqhl46DeHQ8nJeYwGJCQV4+hv9dNuet8siJH5tHfkGqJ9+8sPqpg2pf5q7
         jvYQ==
X-Gm-Message-State: AOJu0YxIbURUyy4tE+8cOmXSgvS8ZltgGORFaJn98ZJv5qGJJSncoWJS
	JU4LgVowd2U85upQnQCfWWrKcoaKIONF9zZgGauXvbmI+sHgXXJHGyobEPATmSGXIr5LFB/qDSe
	qnWqcLa/WFaUx25gttefY1Q+VpSo=
X-Google-Smtp-Source: AGHT+IFH1scSUW2QVhEnaLt79V1p2gvZs7HOkp2CuygjLthu6N/svYjy/u6Kz0dZMRVB9TZ8Pty/wvOdsdYVZ6qEylA=
X-Received: by 2002:a05:6870:d253:b0:21e:a2c0:b94b with SMTP id
 h19-20020a056870d25300b0021ea2c0b94bmr8046983oac.54.1708447566443; Tue, 20
 Feb 2024 08:46:06 -0800 (PST)
MIME-Version: 1.0
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com> <1708419281-26047-9-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1708419281-26047-9-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Feb 2024 08:45:40 -0800
Message-ID: <CAMKF1sreHC+6tuvu8ZzJ_rLASECJRG3VFzCX_N_2+QwqQ3SJaw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 09/26] python3-gspread: upgrade 6.0.1
 -> 6.0.2
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 16:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108953

please rebase this patch on current master-next branch and resend.

On Tue, Feb 20, 2024 at 12:55=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
>  Fixup gspread client init arguments
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-gspread_6.0.1.bb =3D> python3-gspread_6.0.2.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python3-gspread/{python3-gspread_6.0=
.1.bb =3D> python3-gspread_6.0.2.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread=
_6.0.1.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.=
0.2.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python3-gspread/python3-gspread_=
6.0.1.bb
> rename to meta-python/recipes-devtools/python3-gspread/python3-gspread_6.=
0.2.bb
> index 7854b7562..6d8f4b411 100644
> --- a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.=
bb
> +++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.2.=
bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/burnash/gspread"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D9488e21983675fa56dc05af55=
8b83e2f"
>
> -SRC_URI[sha256sum] =3D "8c8bf83be676a019d3a483455d8b17b442f2acfc620172f2=
45422ca4fc960dd0"
> +SRC_URI[sha256sum] =3D "0982beeb07fa3ec4482a3aaa96ca13a1e6b427a0aca4058b=
eab4cdc33c0cbb64"
>
>  RDEPENDS:${PN} =3D " \
>         ${PYTHON_PN}-google-auth \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108929): https://lists.openembedded.org/g/openembedde=
d-devel/message/108929
> Mute This Topic: https://lists.openembedded.org/mt/104464217/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

