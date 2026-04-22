Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A6FF9B5F0
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 09:05:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72526.1776840533481932855
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 23:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Sdz/WkxT;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EDF3437FF
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 06:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4508C4AF09
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 06:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776840137;
	bh=5xVBVRlagfY0OLo3EXQ5GzOuydECwLfhW46XzndokxA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sdz/WkxTcJUtSvpxDcutqVyiskTaLbU6S3uabPIrnktTt54IS5AEm0ZYMV1sWhgc9
	 EKoxvcZkx7Nk6Yewo5Er8rFHltqY1kgCwdeKXRGZGOOBd9iXnzyIgeu2bMeyakNCom
	 v+xOa4+Cf1zix9uwQ2TYVowcBAzxgIZP7CTqzY8/uFApS0tmHWkYZS6iQDmbVLeNuC
	 gy4UqXoDG6Ql1m8XMSuAE67hNXsgMLO32MhxUJjNhO6WtIELUkm9VOE0yk3RscrEgv
	 s8XEJ/CENmXtsKBWqQp2Cwk+kEHMq9uAIUq7WUhpWXkOax0sb59hW7+UFrb4Kd9GLi
	 z5d0KOrpLpI6g==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so6962598e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 23:42:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ87t8UZ0aac3SIeDkuq6TXZVnnWBLftwbrA8OpeI3EhS8e39NZ5DG6w5SfrqOFwp8lKitF8Z1wwDbjrFc17/TjxiT8=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/hwZ8hG+dzry17ZCwBwSBQcC7yP17L183yjwkGLbcO7Nrrkx2
	8YUT8s64iu3CRdLrIgju1M3p2Q+actnXpoX7fp15kLxlagNKuwZekOPRyBkuOZI3Sz47DBlo/LB
	XQXnzYXjbDqohhgnRDcGAUs0t6wgh+4ZZ3I45AR2lUw==
X-Received: by 2002:a05:6512:1285:b0:5a1:33b6:2b6d with SMTP id
 2adb3069b0e04-5a4172c590dmr8728197e87.14.1776840136515; Tue, 21 Apr 2026
 23:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260421082247.12962-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260421082247.12962-1-bartosz.golaszewski@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 22 Apr 2026 08:42:04 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mf1whKi5Fy6K8q8GycD2GeQ6xiGtz160NT19JbW7Eb-iQ@mail.gmail.com>
X-Gm-Features: AQROBzBIeCVUCjFOyhK9ZXL3xYQ1J0SgKj23WOavvfHeBvKUclxHjzGQrw-S8-A
Message-ID: <CAMRc=Mf1whKi5Fy6K8q8GycD2GeQ6xiGtz160NT19JbW7Eb-iQ@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-pyfuse3: new recipe
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 09:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126544

On Tue, Apr 21, 2026 at 10:22=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Add a recipe for pyfuse3 - a python package providing high-level bindings
> to libfuse3.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  .../python3-pyfuse3/python3-pyfuse3_3.4.2.bb     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-filesystems/recipes-support/python3-pyfuse3/pyth=
on3-pyfuse3_3.4.2.bb
>
> diff --git a/meta-filesystems/recipes-support/python3-pyfuse3/python3-pyf=
use3_3.4.2.bb b/meta-filesystems/recipes-support/python3-pyfuse3/python3-py=
fuse3_3.4.2.bb
> new file mode 100644
> index 0000000000..8ef6780788
> --- /dev/null
> +++ b/meta-filesystems/recipes-support/python3-pyfuse3/python3-pyfuse3_3.=
4.2.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Python bindings for libfuse3."
> +
> +LICENSE =3D "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D622e3d340933e3857b7561f37a2f4=
12b"
> +
> +inherit pypi python_setuptools_build_meta python_pep517 cython pkgconfig
> +
> +SRC_URI[sha256sum] =3D "0a59031969c4ba51a5ec1b67f3c5c24f641a6a3f8119a86e=
dad56debcb9084d9"
> +
> +DEPENDS =3D " \
> +    fuse3 \
> +    python3-setuptools-native \
> +    python3-setuptools-scm-native \
> +"
> +
> +RDEPENDS:${PN} =3D "python3-trio"

Actually with this dependency, it needs to go into
meta-filesystems/dynamic-layers/meta-python. Or maybe directly into
meta-python since gpiod-sysfs-proxy which will be migrated to pyfuse3
is already in dynamic-layers.

I'll send a v2.

Bart

> --
> 2.47.3
>

