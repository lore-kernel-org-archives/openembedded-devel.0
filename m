Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3544C369CF
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 15:26:41 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.14289.1744990001119167429
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 08:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iAADCZGc;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7272f9b4132so1513680a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 08:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744990000; x=1745594800; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skHHwzNrpJ/HuqjB78qpy0myhJ1JW/TNqTAElYMkf34=;
        b=iAADCZGcPzYmrLxsLKUn+5i04FCNKxf7YfUqJjwm9vPwZkkfgzdvi1iir0TNIIQEB/
         AeTO45hjINjsdMT4LftFuVfCukZxvJYbN3jo+4kSi8fu3e0NuLWAxS2XObYATjApVC35
         oOK5+7yEid+VVJs+OEC1y98CxgKgCFeGThzmKvWGpsPjOMPr4GoruAdQZk/qqXtLenJT
         SzZuTCAChEU/NNK3JTZ6uYrgq3oH8E/NzR8XB/mWg2Ubmhtvh6sBnGOwstcXRd3HnbI8
         P+HSyUORhdMMudKTX7beQ99TYXxxkmTLg3bj81WEcs2EfvGk5z/Ndr4W/J8g2+vGmout
         1T+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744990000; x=1745594800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skHHwzNrpJ/HuqjB78qpy0myhJ1JW/TNqTAElYMkf34=;
        b=eyaZG0wDNWiyZ01rMQAsjO0q58tZTtvu7E0i+djVicdjK1lkLFV53YiXErqvWVPB9V
         hdQwtFNi8BGZa0DF+n3+kc1kcUdwrtW92SoUMNXjROrDXHR1mNoxCfxYIDQ/zBVvNW2x
         CQxc8NcsCJkSb0VVqsjSK61Fz+4HC6EHy+nOPALt7kz4NrNIUAHN6O6Oo3p7tSodv1eQ
         eiRwWE1KlhPVEiNr9hsBYcTRbRfHDFa9Aj7/xLLJw5OgBkjEUFGtQov4V76JzX6hvWFk
         qudJyh71J5dz888rnAAFa8tM1NBGydwiTv3YrDNXzHrdPTKmtZ3PshwP3f7wknthl+sz
         tqpA==
X-Gm-Message-State: AOJu0YwEBb7L6wPYief10fIFFaMBVwgzGvxaGi/RTffYt/HjYPpeMVzq
	4iun6JCvlz/xfJvuSwKt+SCB8rAHouhIr569cbwumzxUU1T3VylT40GmS6JJSFfTL+u4YD0mEGR
	vk46yogKuqEi/MYbapLk7th6L6bn1Cqa2
X-Gm-Gg: ASbGncu7SlKG6nbGKt2PXHlQRpSvUAme3jDUCViiaDcNUTDs6fn8T99CdyOYp12Y/jo
	Lm60Q8tbv5u782EcJdTbUrnorsHBRHO6z6ygeYI/YHBgi0NHYiyFfUsu2I62XpEQ3rOJn8MejuC
	OY6k0PxGra1KxoOe2FD6Is
X-Google-Smtp-Source: AGHT+IEJ2pIorPuiOgGe+ww4+iHS9Mxit5dk06QQfpydXAraAHd1u9+66jTA5mw8qug7c5XSe5D0QHyjr1sa7NbpEIE=
X-Received: by 2002:a05:6808:320a:b0:3f9:8092:14be with SMTP id
 5614622812f47-401c0a7b4fbmr1726972b6e.13.1744990000260; Fri, 18 Apr 2025
 08:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250418105119.3211549-1-leon.anavi@konsulko.com>
In-Reply-To: <20250418105119.3211549-1-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Apr 2025 08:26:13 -0700
X-Gm-Features: ATxdqUFm9KVQ2jkT3eoXcyysa2eFqbwSugwOHMxg8Vq1WLmkgfHuzzAZfg2cxVU
Message-ID: <CAMKF1sqhR5FRsw3cfM1J1V4qhbdo4YYgf+NQ3CODAk9O9nD4iA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCHv2] python3-eth-utils: Upgrade 5.2.0 -> 5.3.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 15:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116971

On Fri, Apr 18, 2025 at 3:51=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> Upgrade to release 5.3.0:
>
> - Replace arg["name"] with arg.get("name") to correctly handle
>   optional names
> - Add new methods: to_wei_decimals, and from_wei_decimals which
>   take a number instead of a string
> - Add CamelModel pydantic model for validating objects and
>   serializing to camelCase when used with by_alias=3DTrue, with
>   the general expectation of a well-formed JSON-RPC object.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...python3-eth-utils_5.2.0.bb =3D> python3-eth-utils_5.3.0.bb} | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-eth-utils_5.2.0.bb =
=3D> python3-eth-utils_5.3.0.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.=
bb b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.b=
b
> rename to meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
> index 435d032a84..3b71684820 100644
> --- a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
> @@ -4,7 +4,7 @@ SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd3f53e7cc5bf80b16eff1f4a38c73=
182"
>
> -SRC_URI[sha256sum] =3D "17e474eb654df6e18f20797b22c6caabb77415a996b3ba0f=
3cc8df3437463134"
> +SRC_URI[sha256sum] =3D "1f096867ac6be895f456fa3acb26e9573ae66e753abad920=
8f316d24d6178156"
>
>  PYPI_PACKAGE =3D "eth_utils"
>  UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> @@ -16,4 +16,7 @@ RDEPENDS:${PN} +=3D " \
>      python3-eth-typing \
>      python3-setuptools \
>      python3-toolz \
> +    python3-pydantic \
>  "
> +
> +COMPATIBLE_HOST:riscv32 =3D "null"

this should also be applied to recipes which depend upon python3-eth-utils
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116947): https://lists.openembedded.org/g/openembedde=
d-devel/message/116947
> Mute This Topic: https://lists.openembedded.org/mt/112328943/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

