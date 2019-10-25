Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id AFB547FAA3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 17:34:29 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t8so4423356qtc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 10:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fD5cUWaSynoqHqZww7MBkTjRxuou4I1aBorqoscESyM=;
	b=hiWzXu1LOF7yuxEiGbQRTOiw9QiupwR62jujDh97q2bwJT3n3MhcDYdAM6IeQXylUp
	lKSISfh00p/dolOogFvat9iiOEZCgbcAK9N7SZ8Ig9t+TgvtZYXljN1VhOv1sJOLwmJ/
	REMdzSY4IrL2LvFvsj+gw0f59JqbZLu7pE359p40Gv8hig9eNnXfFLLby4COuAaxC+L+
	p0ilnagTZEZHMvw316nUuzQ/yZNw4C9YUApQy9Qs30BfZ0FFlri/1qjsywCXbV/GqlAj
	h9ROutS2k8mI2LvHJdCKYZ3J7LNYE+wRc0noDTCZ39lGlyuQ6t6dU1dmgOyGsS9Vck5f
	oZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fD5cUWaSynoqHqZww7MBkTjRxuou4I1aBorqoscESyM=;
	b=reb5gNKNyb2vxp069/CWh6cLWIHuwzsdil7f4fenuMV25h2HkQo+DpNM7dQY5MibrU
	v9Q9w1kDWSacFiGon+txFTeXxRTgC3IZ1PDa28R7Z5FF2UsPhX5Uzfm6siIZI3JXdtSo
	GrFHS//p88Z9/7eQgf0vUC3o03Zd92deJpGz9HNDZdsW6OqrSS3LMBk6Ei+DWnbWrYON
	FUcO4CDBFlFS6eYdHh90Vrm1KewvdfGqpIkxECkuIHiq6MY5dHuJXEJQ56F5xihv70B0
	Wj3mhuc9JPMXnOokgSNDGBZsS7PA7XzSomG0aIbjPSPuir1CdkGkMX9M0p0zkEBnmuGL
	cbYw==
X-Gm-Message-State: APjAAAXme1FXpEIk6QAKsRWmLdaKERhHuYNnA8n6LuYjlh5Z/vdY3fvx
	1Nt9dIheZyZMt6Mx5fIBmq13CY/VC/p/MmR3uxvsxr70o7LWjQ==
X-Google-Smtp-Source: APXvYqwa2UZi8icQlBtoSZ+yRzDYer8ROFThZ+KSTSVmaPVHk3aVl+/alf2t+GKpP5surJGzknsrDzqDQvARxzDmM78=
X-Received: by 2002:a0c:ff44:: with SMTP id y4mr4257098qvt.99.1572024870212;
	Fri, 25 Oct 2019 10:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191025070808.2913-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20191025070808.2913-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2019 18:34:03 +0100
Message-ID: <CAMKF1spg=wfY9bDCjXgs9jCOeqMeCPP9cmM8xvecywNASeQNCg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] [PATCH] autofs: upgrade 5.1.5 -> 5.1.6
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
X-List-Received-Date: Fri, 25 Oct 2019 17:34:29 -0000
Content-Type: text/plain; charset="UTF-8"

fails on musl

https://errors.yoctoproject.org/Errors/Details/274617/

On Fri, Oct 25, 2019 at 8:08 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -Refresh the following patch:
>         autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch          | 2 +-
>  .../recipes-daemons/autofs/{autofs_5.1.5.bb => autofs_5.1.6.bb}       | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-daemons/autofs/{autofs_5.1.5.bb => autofs_5.1.6.bb} (95%)
>
> diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
> index 410827b..3928604 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
> +++ b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
> @@ -20,7 +20,7 @@ index 493b9f1..268d06b 100644
>  --- a/configure.in
>  +++ b/configure.in
>  @@ -12,7 +12,7 @@ define([AC_CACHE_SAVE], )dnl
> - AC_INIT(.autofs-5.1.5)
> + AC_INIT(.autofs-5.1.6)
>
>   # for pkg-config macros
>  -m4_include([/usr/share/aclocal/pkg.m4])
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
> similarity index 95%
> rename from meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb
> rename to meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
> index 9e43549..67d03d6 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs_5.1.5.bb
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
> @@ -28,8 +28,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
>             "
>
>
> -SRC_URI[md5sum] = "03b13168ec7bd66a6f2d5f6fea705eee"
> -SRC_URI[sha256sum] = "86a8e56ea9d72bb53ff8cdfeefb5cafe983592c6b0178fb99c4a731e59879181"
> +SRC_URI[md5sum] = "e6800e0afd6009ecdff148088c564050"
> +SRC_URI[sha256sum] = "82094cad44f4e5c4f93eff2789cd66b57d7ab3fa646b7722d97608571001e694"
>
>  UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/"
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

