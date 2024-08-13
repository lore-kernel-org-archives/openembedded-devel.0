Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D823C52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 03:39:30 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.64272.1723520365599686604
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 20:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RxnahzJt;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5d5b850d969so3158086eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 20:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723520365; x=1724125165; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqNXhyoUOngFM3X8V1zRMvPpwdPEb+lpo3FbLEaptZc=;
        b=RxnahzJt6thoRdwhKbdtPxz3B8+Iq4RKp0pUwz/GP32GK9ufDt56rv7kDB8Cq7invg
         728NHXPkjSqB3SEiexIpZk9ioeO3L3jQ0kiwAWtfFT3tzYET5DWIpErn/F4jVUDNyVq/
         nqHEBBM/kwOWjhf8AB8PWclrOThfI7funGL8t6w2S9hrDQg19Xr498xvccu2FByjK2P8
         8nV00slwlThRbbskXNW2AzgK53KE61jkC0EYRJZZPzEFu+mvcN3D01vNfYBB7hni0eQH
         PIJ3PQxt7vn72hux6SAj+SXWh8MJ/EAgNuCYd3y0tEOwqBVbKrLBEPV3TvDEf7dJUp5Q
         9Y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723520365; x=1724125165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqNXhyoUOngFM3X8V1zRMvPpwdPEb+lpo3FbLEaptZc=;
        b=MJ/Xwi6On8LXsA69CFsmJGWrg1pnYlujqi9As0ITt5nlw2YAovYysYh+6d4oOo0oVy
         CDASi2oBcoO4hOrZJxHN/R5VcbXjSB5yZWgmrC/kgn+l2QYwstqcAm48EbYIsrylXCxU
         5PA4awpXCzwjF4vmhlHzre/nsQioV1qTH4bp02fQvavpzWrfboWH8ZJbEE/98wmw4loW
         B12bUrEq+3YZbTaR05dxSWHDDgHuCoQ+OML7pZfX6EXBw8Vv2LlTWkolMlv1o/c7lAOY
         PnExKJbP1EO4qaF7SWH0XsL94um+ph/0QWMelTa4hVCxvnQF0B4lB/I8BrJxU79MV0Ud
         x5+g==
X-Gm-Message-State: AOJu0YwT8SKZ4hTVbhzi9MtSghDMcn/bIcXVjjjNvBbwzUMajloZyrdH
	7/LcKkSb/vpSmFZzkU4w2Vo05gqsqnXV85m2bOZUdejYgv5eOXz7zdUmMcYcpiHNeuKCT0Z3HFi
	+Kz5ROHYDf/qkMI4C0kYgeVQ1rem9uA==
X-Google-Smtp-Source: AGHT+IF/Ni29eIuGkRsdBxePfeZnYESV2F1d5c3CH7JbOcCyaH5LqjAu3IDy4ZKB46BsJXTLo5JsuMPHilfn4VaWdg8=
X-Received: by 2002:a05:6820:60b:b0:5d5:d718:1b7f with SMTP id
 006d021491bc7-5da685ac49emr2639338eaf.1.1723520364766; Mon, 12 Aug 2024
 20:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240812182036.1132711-1-tgamblin@baylibre.com>
In-Reply-To: <20240812182036.1132711-1-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Aug 2024 20:38:58 -0700
Message-ID: <CAMKF1srPzUW_GjtbxLNUtHrsLkLAd-=GbZ5Z3S0UjEAfid=W8A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pandas: upgrade 2.0.3 -> 2.2.2
To: tgamblin@baylibre.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 03:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111786

On Mon, Aug 12, 2024 at 11:20=E2=80=AFAM Trevor Gamblin via
lists.openembedded.org <tgamblin=3Dbaylibre.com@lists.openembedded.org>
wrote:
>
> pandas 2.2.2 is the first version compatible with numpy 2.0.x.
>
> The package now uses meson as the build backend, so change the recipe to
> inherit that.
>
> Its pyproject.toml pins required versions for Cython and meson, but
> newer upstream pandas releases are using different versions and
> compatibility strings, so just add an OE-specific patch to relax the
> requirements a bit for us.
>
> Changelog: https://pandas.pydata.org/pandas-docs/version/2.2.2/whatsnew/v=
2.2.2.html
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  ...t.toml-don-t-pin-dependency-versions.patch | 37 +++++++++++++++++++
>  ...andas_2.0.3.bb =3D> python3-pandas_2.2.2.bb} |  8 +++-
>  2 files changed, 43 insertions(+), 2 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pandas/00=
01-pyproject.toml-don-t-pin-dependency-versions.patch
>  rename meta-python/recipes-devtools/python/{python3-pandas_2.0.3.bb =3D>=
 python3-pandas_2.2.2.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-pypr=
oject.toml-don-t-pin-dependency-versions.patch b/meta-python/recipes-devtoo=
ls/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.=
patch
> new file mode 100644
> index 000000000..f60f43a5b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.t=
oml-don-t-pin-dependency-versions.patch
> @@ -0,0 +1,37 @@
> +From d46b8720a6bccb345f6bdd7ee2f5c357e7eb227b Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Mon, 12 Aug 2024 11:27:36 -0400
> +Subject: [PATCH] pyproject.toml: don't pin dependency versions
> +
> +Pandas will fail to build if the exact versions aren't found, but newer
> +ones actually work. Since newer versions of pandas are adjusting the
> +requires section of pyproject toml further, just patch it for us.
> +
> +Upstream-Status: Inappropriate [OE-Specific]
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + pyproject.toml | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/pyproject.toml b/pyproject.toml
> +index db9f055799..5158d60f59 100644
> +--- a/pyproject.toml
> ++++ b/pyproject.toml
> +@@ -2,10 +2,10 @@
> + # Minimum requirements for the build system to execute.
> + # See https://github.com/scipy/scipy/pull/12940 for the AIX issue.
> + requires =3D [
> +-    "meson-python=3D=3D0.13.1",
> +-    "meson=3D=3D1.2.1",
> ++    "meson-python>=3D0.13.1",
> ++    "meson>=3D1.2.1",
> +     "wheel",
> +-    "Cython=3D=3D3.0.5",  # Note: sync with setup.py, environment.yml a=
nd asv.conf.json
> ++    "Cython>=3D3.0.5",  # Note: sync with setup.py, environment.yml and=
 asv.conf.json
> +     # Force numpy higher than 2.0rc1, so that built wheels are compatib=
le
> +     # with both numpy 1 and 2
> +     "numpy>=3D2.0.0rc1",

This means I have to synchronise this patch with the numpy 2.x upgrade
patch in oe-core

> +--
> +2.39.2
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb =
b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
> rename to meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
> index 91e76d991..ac8d46984 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
> @@ -6,9 +6,13 @@ HOMEPAGE =3D "http://pandas.pydata.org/"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcb819092901ddb13a7d0a4f5e05f0=
98a"
>
> -SRC_URI[sha256sum] =3D "c02f372a88e0d17f36d3093a644c73cfc1788e876a7c4bcb=
4020a77512e2043c"
> +SRC_URI +=3D " \
> +            file://0001-pyproject.toml-don-t-pin-dependency-versions.pat=
ch \
> +            "
>
> -inherit pypi setuptools3
> +SRC_URI[sha256sum] =3D "9e79019aba43cb4fda9e4d983f8e88ca0373adbb697ae9c6=
c43093218de28b54"
> +
> +inherit pypi python_mesonpy
>
>  DEPENDS +=3D " \
>      python3-cython-native \
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111773): https://lists.openembedded.org/g/openembedde=
d-devel/message/111773
> Mute This Topic: https://lists.openembedded.org/mt/107862188/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

