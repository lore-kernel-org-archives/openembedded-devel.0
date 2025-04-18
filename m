Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6C8C369C2
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 02:21:23 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.4356.1744942877359746208
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 19:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Izim+MHK;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6049acb776bso643415eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 19:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744942876; x=1745547676; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXgjiLR7/ngLb9afCYDXVFsrgsNOSfxfYVhg8ZHGHR4=;
        b=Izim+MHKk4I3NW3CbHGgI2y8cCdfMzh23pL5jzaSeSBk+0W1clxXPHN/D2Yofp0MZU
         wntiyqWM20JMUkaaiEM5sRVl2i+RHYfxn1628nDTHpLGW3WyWwz7fjE3z+L6bEgFlCGc
         5sw8l6aTSVh/wXBisVs0+ym3HtNMRjaf7KquxyEzJplqnyNWy4WJ4AZ+aNrZI0QZXXTB
         FpPI/ZPxwgCoK50cZsxvM6nPRAksTCzp+q42aOV1/L1By2mEypoyQFOY5l3dqM2B5N4d
         NXdgCxKnUfhgcAQJZDIfQDYSSi2kIY5wzck4iIjHbk7T70NT8YECBLRk95ulG1glE8JN
         ogwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744942876; x=1745547676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXgjiLR7/ngLb9afCYDXVFsrgsNOSfxfYVhg8ZHGHR4=;
        b=GT8rq8nRyr4P8hul7YnLhptc1K5kMlKkg7jIWjmllMTQbrM3ZEVF1nZcpTsP8ymctl
         63RoJP3Z8QWpDRhjjCrVJwW+CI0iBwjkl71o6pYHTRAlmqPYKE5c+iZp3zLprwLqv6Kv
         wXM3YdUaPwhZkxYepgbM8vgI0Aa9CDMenKPxYPe205NxxiTDTXeRZxdJCtj7KaDsGIDi
         J9jAfhy3xtabw0PBRrIPGoVxsIWvrf/4vn5FGBN/wgsvxnhmg+4vLiWZX+NektTMFaEn
         jTWl5MaNv5dSWvHHh42irRoV+BtDGRN+ED0s2bJCm2KSSS0VzrvnN+XSqa2IV2HIPbHa
         hQEQ==
X-Gm-Message-State: AOJu0YxaX+GoLjBVffZtwbbAd5+quySrZHOKWQNcDp/A5HF4U6rSHr3w
	WSd96y6Gi+hNaTI+v0EqxXzVABb237Gfb9l9osfDBewJszMlmeFxWB6t/860UTmL2mzhROw6RWL
	aIOhMp72tnGf7mQamipBwpKZBWfY=
X-Gm-Gg: ASbGnctiE6qOMVlb/6aqQ6ShWogZJ6EofPkOeQ3+gs3vJ/Ly4G6dlZrsNbOMo6XLWQq
	1bx92tc8RRK6FmqM2NTzC6sy2WTSX3KDBsuQHC9CjyxErp1QnOCe7Ijthsfv28qv4ZABYhGVpOL
	2PlMl40UEd1+brFDwa9/Hj/w==
X-Google-Smtp-Source: AGHT+IEdHEhuZkpCjEfL1DWi+VugNGLkvynSwFSDQrtyPOqssgseDD8DmanGgq2YxkX1ckGABdyBxVgGYcw1CRRIvNg=
X-Received: by 2002:a05:6820:2226:b0:604:2ac:840a with SMTP id
 006d021491bc7-606005cb4c3mr874759eaf.6.1744942876379; Thu, 17 Apr 2025
 19:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250417123231.3063208-1-leon.anavi@konsulko.com> <20250417123231.3063208-6-leon.anavi@konsulko.com>
In-Reply-To: <20250417123231.3063208-6-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Apr 2025 19:20:50 -0700
X-Gm-Features: ATxdqUEneBak2HfyeP6fes_2GMGPU2bx2ItIM7gJ_DrOyzVCv1HLq4JbygV4Pzw
Message-ID: <CAMKF1sr-t089ZNTZSVF7dzM0_LR6Zpw8bDtE=QdEOxUc57TT_g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 6/6] python3-eth-utils: Upgrade 5.2.0 -> 5.3.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 02:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116944

On Thu, Apr 17, 2025 at 5:32=E2=80=AFAM Leon Anavi via lists.openembedded.o=
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
>  .../{python3-eth-utils_5.2.0.bb =3D> python3-eth-utils_5.3.0.bb} | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-eth-utils_5.2.0.bb =
=3D> python3-eth-utils_5.3.0.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.=
bb b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.b=
b
> rename to meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
> index 435d032a84..84db8b32b3 100644
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
> @@ -16,4 +16,5 @@ RDEPENDS:${PN} +=3D " \
>      python3-eth-typing \
>      python3-setuptools \
>      python3-toolz \
> +    python3-pydantic \

pydantic module is not buildable on riscv32 so please add that same
list here as well now.

COMPATIBLE_HOST:riscv32 =3D "null"


>  "
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116936): https://lists.openembedded.org/g/openembedde=
d-devel/message/116936
> Mute This Topic: https://lists.openembedded.org/mt/112312253/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

