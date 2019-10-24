Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id B7AE37F8EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 08:18:02 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id q70so15090914qke.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 01:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FRUbtBxgicPF5oV80QjAKaEjGQB4k3YfDd66zMYR7j4=;
	b=UxNWRAL/QsfzZ1nVz3uapsAXbQQJiKCoFP/kMmaO1qLX9iW3OZ9Q9btFuG5SwErM+E
	UcUVBPTCjpEjusQkLLXgwhYR3BpOYNGhq+UTdQbCmaGSkSWbBhF7a5kniPUcD2j5iKSW
	2nrpfjBRmhAiv+wDHjEP1upelvTm459izKWKjNq76ED2sJ1PQqdA7bjvGy7Thh7oh/Zv
	cdQdnPaj69NRWp9trbLTF8KujYzSoaLPrL8sIV91NQgUBD69CB5zDDot+MoJ/BoQ9kca
	2RYeqEOMgv+Rp6uv+fvqXXTStl/K9JEzqMY+9+nxP50xXrIoUBP9nkCfznl1XjCoK5RB
	8gcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FRUbtBxgicPF5oV80QjAKaEjGQB4k3YfDd66zMYR7j4=;
	b=of/xlRk1cmYUwgsQrKmHDyCOs3tT3xkjuhw8tsVsT7H8T0zWQHtQR8in7OvDqOphxH
	uNpVG7Mbf/TiHDdeZPEX4WTAncGVHCcrfcPGNwQM7/RT0MJDcZI2KIei5VIwFU9051gz
	lhx6sdCTswDhaBB1Fz1OQMGpOlpaS2V//L9sW7ZTTOJAH0p/+UnLZlkLJWagjXoMTd5R
	aD4guiFoOAYdbfOv/jPkA9TBNGRzjzyoOuN8dexYCH9ZhH/6/7QBT8rZeV4zr7mpobFk
	pB8qWuOXoHrQqMd3qS+7J1sQkmmPteR0je4qA+8edqvhvu9pTWDAFO/OlNSYAYryv21M
	NmGQ==
X-Gm-Message-State: APjAAAW3ImSQdgJmCFrmgM+vB/50vcDq2XdMSnkWNTSnjwwAGaVGjV8F
	y7701oZ2KdLlaLpaYoH1NrfL6wnDD7d6rdZGdOoBMf1NuGc=
X-Google-Smtp-Source: APXvYqx0gXhyPhDXH3lC+CW7OdxGKByTJ9czqf2kaYWfQDwDBJPOaRvIVtcKQx6CCNDaAieIyKqWR1Zl7QZlqCvkrR4=
X-Received: by 2002:a05:620a:20d2:: with SMTP id
	f18mr12847533qka.474.1571905083277; 
	Thu, 24 Oct 2019 01:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAJNJ+3e6C_gwQ7Oyq0xKTiDCo47SHcr5naChERq0wFrk+r7N9w@mail.gmail.com>
In-Reply-To: <CAJNJ+3e6C_gwQ7Oyq0xKTiDCo47SHcr5naChERq0wFrk+r7N9w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2019 09:17:37 +0100
Message-ID: <CAMKF1sr3YHNUOm=7AEU6VZJDSy-3CdeVgOXAiUvM0Z9e0n+4Sg@mail.gmail.com>
To: =?UTF-8?Q?Micha=C5=82_Lower?= <michal@pcb.red>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] update python setuptools-scm from 2.1.0 to 3.3.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Oct 2019 08:18:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Micha=C5=82

This patch appears malformed. So please use git format-patch to
generate it and git send-email to send it also rebase it on top of
latest master

On Tue, Oct 22, 2019 at 9:03 AM Micha=C5=82 Lower <michal@pcb.red> wrote:
>
> Previous version fails to compile for zeus branch. Upgrading fixes that.
>
> Signed-off-by: Michal Lower <michal at pcb.red>
> ---
>  meta-python/recipes-devtools/python/python-setuptools-scm.inc | 4 ++--
>  ...setuptools-scm_2.1.0.bb =3D> python-setuptools-scm_3.3.3.bb} | 0
>  ...etuptools-scm_2.1.0.bb =3D> python3-setuptools-scm_3.3.3.bb} | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-setuptools-scm_2.1.0.=
bb
> =3D> python-setuptools-scm_3.3.3.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-setuptools-scm_2.1.0=
.bb
> =3D> python3-setuptools-scm_3.3.3.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm.in=
c
> b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
> index 98883ec39..a7e1bf6ad 100644
> --- a/meta-python/recipes-devtools/python/python-setuptools-scm.inc
> +++ b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
> @@ -2,8 +2,8 @@ SUMMARY =3D "the blessed package to manage your versions
> by scm tags"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D8227180126797a0148f94f48=
3f3e1489"
>
> -SRC_URI[md5sum] =3D "cfec5d2dbbd0a85c40066f79035b5878"
> -SRC_URI[sha256sum] =3D
> "a767141fecdab1c0b3c8e4c788ac912d7c94a0d6c452d40777ba84f918316379"
> +SRC_URI[md5sum] =3D "50b2199082fe808d032ec1710c9d7415"
> +SRC_URI[sha256sum] =3D
> "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5"
>
>  PYPI_PACKAGE =3D "setuptools_scm"
>  inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_2.=
1.0.bb
> b/meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-setuptools-scm_2.1=
.0.bb
> rename to meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3=
.bb
> diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_2=
.1.0.bb
> b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-setuptools-scm_2.=
1.0.bb
> rename to meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.=
3.bb
> --
> 2.17.1
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

