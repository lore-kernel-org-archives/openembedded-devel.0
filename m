Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BF2CAC5B0
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 03:08:18 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.web10.9121.1758856093928269382
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 20:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aGX27M60;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63606491e66so920331d50.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 20:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758856093; x=1759460893; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Oah4N/yaFozs830DtJxlUf14KhQsB/Z1svjj3s1th4=;
        b=aGX27M60nbWtZ3IivY/DyZoyUQ0Tko5Rsc3aabBtZy6165iYDfJJUGUfDi6myTqZz9
         8IXkFEhF+zvSvFGZdB64DPwemXAeNQgFolNw6NNOomYoJ2abyfcUyn1cLXAgEPMRtFCh
         +eQw7XQgMkgJsmy+lfwdKA5um95+ozQVfMJd9yFN9KvbJknznjoEXGZ3PyXcFVimIO5z
         6EUgtnS1vRIlkzpVcs6NtH01rsmD3ti6SE3eC9hsKxeNm/Qppon7LYUHk7qi4lvz152s
         Ru8MArXQf3LlUa6kZIaDIYI8eSb4wVAbFaHdvmLOU9Bi6Z8UUhFgB0R+BH6MxIbC72xU
         wCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758856093; x=1759460893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Oah4N/yaFozs830DtJxlUf14KhQsB/Z1svjj3s1th4=;
        b=bl4Cvc0iHYXMeDKcMC0UkB8S3Uf9FDjAcOQJYQFBLoYT1Nyl9KJSgSopO1/h9hkhHa
         boDq3eLWWqMrJV5G4ml82ugIEsqPj7xNReK0ComR4PRFvVsNdRMRYESh0VoDahzM5uKo
         JlLEm58C4RsTWQEOdcLg2EKJJCs+eJj2jfPHgTohYna63BsbDaUEz+UwylfKv1dOKQ6S
         ykcoCcXXFFRdrUYVbnQUt5NcIWVI9dyzwTg7vnW9wfP3HhaXdutEJmo5y1fVwsXqsUkL
         wrCGab9VbiBLf6bKwxFwn/+NwOc5qH7s7YKClMOsMEgtYHT2EHjpubDHo8dBZ5ykbQDy
         w4zQ==
X-Gm-Message-State: AOJu0YyjsHKdKV6oBVPhD5mAW3K5Nk2PUvxdOtpngUCbJvgipLDp+YwE
	srYjFlbXek+zE00/+lb1C4lozXKJxQu6LzZzLVv4HJQe3vd6SxT+MT817GAdGYpECkjthaijusl
	9lP/oZ1Mrc8mT/SK+lY+6bPARYAGBP4c=
X-Gm-Gg: ASbGnctDl4opX2tBiJ4z8Ich8tFkKILiGWgIP5nFz2S65v1PA7wDDRzzgguM+SvgrVd
	+CM0WOdEq1NmsqLRokztK3YHDM5mmFulSpxJivzLnlkm8+81LHBUSo/X587jwh71qgGSxwuxICx
	E19Ne8tgDQ0jUPASU7YlsWGs/jBqVChNZ/jyGI0+b9VvhX6xJeYfqtdzfpGipZHphGp/qTE/0Fw
	m+BrVV9ZXOHeg3hBJNhgTcB2TalZRHBZkBTaqvp+37ar6qAYxUNaM0zPVGr2b7quAodQ1N6SK6k
	r08yJQSHuyPwogOTLjupDzCQNP1cxCL1vJH+0TE=
X-Google-Smtp-Source: AGHT+IG/JCUOepSg8ASMb+2mpXorOpovTvI15N+v0kOS+c8CIXSXO2SS3FyAtGN2bRNc49uZXCF8NydpEx/oA2CJWMQ=
X-Received: by 2002:a05:690e:159b:20b0:636:d415:c8a with SMTP id
 956f58d0204a3-636d4151744mr2116620d50.48.1758856092945; Thu, 25 Sep 2025
 20:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250926015937.2916794-1-hongxu.jia@windriver.com>
In-Reply-To: <20250926015937.2916794-1-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Sep 2025 20:07:46 -0700
X-Gm-Features: AS18NWDLKVsAkEjIJUYv2_TwSYKpVyUM03Msro-V612TwIZ00pTPY2B9umn5IO8
Message-ID: <CAMKF1sqfj7nxs53NS1=OgM8sM==GfzjmsKgcNG=WWRhF+6DOsw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v3 1/3] python3-frozenlist: support reproducibility
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 03:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119891

It would be better to have a per-recipe copy of the patch. I know it
is the same patch today but it may not be the same tomorrow since
these recipes are quite different.

On Thu, Sep 25, 2025 at 7:00=E2=80=AFPM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> In order to make the generated library be reproducible, build wheel
> in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
> option -fdebug-prefix-map could work as expected
>
> Note: To support reproducibility, it also requires oe-core commit [1] to =
be merged
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=3D61d98d12e=
ca1c7bdf3b7387a820c83d3b8fad965
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../files/0001-build-wheel-in-place.patch     | 31 +++++++++++++++++++
>  .../python/python3-frozenlist_1.7.0.bb        |  3 ++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/files/0001-build-=
wheel-in-place.patch
>
> diff --git a/meta-python/recipes-devtools/python/files/0001-build-wheel-i=
n-place.patch b/meta-python/recipes-devtools/python/files/0001-build-wheel-=
in-place.patch
> new file mode 100644
> index 0000000000..84f81da775
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/files/0001-build-wheel-in-place=
.patch
> @@ -0,0 +1,31 @@
> +From 606843ad079d9d0dac1172533d42b5a2327b99ed Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 17 Sep 2025 15:41:09 +0800
> +Subject: [PATCH] build wheel in place
> +
> +In order to make the generated library be reproducible, build wheel
> +in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
> +option -fdebug-prefix-map could work as expected
> +
> +Upstream-Status: Pending
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + packaging/pep517_backend/_backend.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep517_bac=
kend/_backend.py
> +index 61cad34..d5d839e 100644
> +--- a/packaging/pep517_backend/_backend.py
> ++++ b/packaging/pep517_backend/_backend.py
> +@@ -316,7 +316,7 @@ def build_wheel(
> +     """
> +     with maybe_prebuild_c_extensions(
> +             line_trace_cython_when_unset=3DFalse,
> +-            build_inplace=3DFalse,
> ++            build_inplace=3DTrue,
> +             config_settings=3Dconfig_settings,
> +     ):
> +         return _setuptools_build_wheel(
> +--
> +2.34.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0=
.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> index 7d813a026c..d832494c82 100644
> --- a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> @@ -7,6 +7,9 @@ SRC_URI[sha256sum] =3D "2e310d81923c2437ea8670467121cc3e9=
b0f76d3043cc1d2331d56c7fb
>
>  inherit pypi python_setuptools_build_meta cython
>
> +SRC_URI +=3D " \
> +    file://0001-build-wheel-in-place.patch \
> +"
>  DEPENDS +=3D " \
>      python3-expandvars-native \
>  "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119888): https://lists.openembedded.org/g/openembedde=
d-devel/message/119888
> Mute This Topic: https://lists.openembedded.org/mt/115442281/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

