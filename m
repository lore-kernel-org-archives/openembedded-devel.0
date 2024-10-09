Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3764CCEE339
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 17:49:13 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.23422.1728496147970398574
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 10:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JuKe7Zp+;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-287ca01c15fso88780fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 10:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728496147; x=1729100947; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouxiBFWUQhyjDu4Hm3QihM4DxN/n6YxFncKyZd3MHSY=;
        b=JuKe7Zp+TUo+CkIxVBnPNVfX5Tj15k0Tny1okq2xXEhhvXnaGWUhqX06XIaXNqcoLH
         w7HPNm0FJjVBngmqABuZ8rCD6TEqvvQKdhXQoLCYJDLHaeGHZ6WzRnMcFp6eXBI/SudX
         iUmj0MJ4N7tWYjOWCLnvFkbs9eB4PMDDoce/ZHmQjvHraLrnVAiywkxXBUlkS59mqbB0
         C5pfCRGhJWlqTjEI0n7YOpBzqVlok9ebTGmE12O8sB3+EYqmMbyktXhXte3BsOafBs5d
         GlMbrwZRKXF+IqugSdbf0MvD5utt91ASROpyMy90plZjTvJNj0Y4a42g5nBptmK/ByD5
         bZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728496147; x=1729100947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouxiBFWUQhyjDu4Hm3QihM4DxN/n6YxFncKyZd3MHSY=;
        b=E1ujwtC6mfEpHv2Kr/XFP64dOaIQ48C5R3nN3ltonFfuuz43SThC6IJL97DF1zppv7
         ZOg9gXpjn/q9oVXl/DcgdrhBWVmiqIvRPJknWU3cUloKkt3O6t0fQnITYkt5fQ4ehhjT
         Zqnn786nHFqu6Fh01VLmJYmw0eqkl9mCDoj9xGPWIIQGVIsuqyUMdEiK1oPC7mcgQfJm
         ReJpLt8MfX/ARXctaITaT/2aqDniqn1Hu7Luc/S5i+c/NMucBtEm0TTGld/8Pq6/u7A4
         sKHXR4NJ8nGLYG5Sdlc5B7GraSvvfjaho8tkR5xTQkZhOHBTmElVvlXaDI9fSzBXQrK+
         hDAg==
X-Gm-Message-State: AOJu0YxjbAUqoa2uGxQCzq2Njt3jI3FMRq8vowtuIrwJJMTZMiXrgr51
	CQGYzD+g1IDZpgmGdCDu9kO6VM/wFirpm7+zsUmH1GmS4u9qnvi22leRGESmo1r8p8rXAd9lxZ+
	H9MZgpn5SLhLwQrmhnBNN0+DWKWo=
X-Google-Smtp-Source: AGHT+IHofc/+PAhnKXGPWAeor+Wir5F+79yNAAoYpuoHEASSxGyljtIS+rs+mPSYIQDZGtdUtL1DUt+uyXSbU5V1BsQ=
X-Received: by 2002:a05:6870:ec9e:b0:268:880c:9de3 with SMTP id
 586e51a60fabf-288342af408mr2568095fac.14.1728496147175; Wed, 09 Oct 2024
 10:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241009123007.1023153-1-leon.anavi@konsulko.com> <20241009123007.1023153-3-leon.anavi@konsulko.com>
In-Reply-To: <20241009123007.1023153-3-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Oct 2024 10:48:41 -0700
Message-ID: <CAMKF1srnjtkO+jV1KmMM+0EYaRGbxRcANL3OGEwkxyx3mt3ddg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-propcache: Add recipe
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 17:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112735

On Wed, Oct 9, 2024 at 5:30=E2=80=AFAM Leon Anavi via lists.openembedded.or=
g
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> Add recipe for release 0.2.0:
>
> - Fixed loading the C-extensions on Python 3.8
> - Improved typing for the :func:`propcache.api.under_cached_property`
>   decorator
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../python/python3-propcache_0.2.0.bb         | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-propcache=
_0.2.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.2.0.=
bb b/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
> new file mode 100644
> index 000000000..01a7c4c05
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "Fast property caching"
> +HOMEPAGE =3D "https://github.com/aio-libs/propcache"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
> +
> +SRC_URI[sha256sum] =3D "df81779732feb9d01e5d513fad0122efb3d53bbc75f61b2a=
4f29a020bc985e70"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +DEPENDS +=3D " \
> +    python3-expandvars-native \
> +    python3-cython-native \
> +"
> +
> +#RDEPENDS:${PN} =3D "\
> +#    python3-multidict \
> +#    python3-idna \
> +#    python3-io \
> +#"
> +
> +#RDEPENDS:${PN}-ptest +=3D " \
> +#    python3-pytest \
> +#    python3-unittest-automake-output \
> +#"

why are we adding commented code? Do tests work for this package at
all or is it wip
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112729): https://lists.openembedded.org/g/openembedde=
d-devel/message/112729
> Mute This Topic: https://lists.openembedded.org/mt/108907750/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

