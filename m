Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id AFC587895F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 15:40:14 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id b15-v6so4527704qtp.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 08:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6iWh3tjb4js5ab4ly8F4pB/Co6R83WHekkN5pTQyt8U=;
	b=Hlg/ziiw4JvnkjdySTlD658Dg9wl1rKP1BhRhJlPuFVPT5+XVIC0S66aIbE1M/QVUx
	5eDqE6kFCZnfloQZ4n9Wa5Uygk91AirVUxHmxJ6CM+wL88/HNdwOugrrRC+x2RUjzcA+
	c46fq+qHD69L7sd/zrdZVO8Ns8QjT+8uyNcFLqk4hUZI6IZ0du8XcL0MXM24lEwg5Mm6
	DrmD2rNWz35LTS+E/JsU2QlfM81EY2S19b5l2ltHhJflsdUg90b1lpo7gXukALGZ/VfN
	NvTf/R6LkF+vLQyERBYKmPqIje+dEyrG/VkCTkRHteUzCNx1rB7MzDd5Cdg3gBGvBFra
	ESow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6iWh3tjb4js5ab4ly8F4pB/Co6R83WHekkN5pTQyt8U=;
	b=TebQvTRMXch/0GLVJUasfemn/15FIrGyzLS1eNtMXAm6yl708Og18+c6eSnPoIWAQK
	rOTmpDdXZ/LrU5dp429J33a/ex0pvtnl6MTaU0zWTxzkgaMwfB8S3CYk3Tn5QLa8fjO5
	C/JC10WZbeBeRhiwExGG6Peim0IQRe6qFzfLysX3J6ctWB2y3fDTPjJCl3uUyL8j8lWt
	S+eOk8p7qokWgM4jwWl1of/pIWp/68gjUIGqPJxNwkLUjRf4yeVpxTsl7vf5w10K2ka6
	yvh4/N9kd8CcfxRgfnwGhnvdn5N2ic2Qovh5W/H34xTTZzDYNixFhXMHpVnkDSYEt2xZ
	o7DQ==
X-Gm-Message-State: AOUpUlGRW7sznMpNGAfINLz4q7ENgDOSKnYOW47mqaBK921OztIv28N2
	AeMcZBXNPn9svPrDO/HC8x6QLVnow5MxpUOLw3x4Cg==
X-Google-Smtp-Source: AAOMgpdAgpt1bpZm9cEsMLi0CPiiy2QkCOlllxg4I4vCiRmsLtKisoe+IgFjLHqCFm9wEK89lwi/fwe1jNzQ5QNozjk=
X-Received: by 2002:ac8:2ad8:: with SMTP id
	c24-v6mr17118073qta.117.1532446815491; 
	Tue, 24 Jul 2018 08:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20180724134300.31744-1-philip@balister.org>
In-Reply-To: <20180724134300.31744-1-philip@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Jul 2018 08:39:49 -0700
Message-ID: <CAMKF1so9ECEqyD49imbeZMPfPwmHs5UBA8oU8bOh89+kvUx9eA@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] lapack: Add recipe.
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
X-List-Received-Date: Tue, 24 Jul 2018 15:40:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 24, 2018 at 6:43 AM Philip Balister <philip@balister.org> wrote:
>
>  * Build tested.
>  * Note: needs FORTRAN enabled in local.conf or similar.
>  * Used to build scipy on pi-3. scipy passed many tests.
>  * Based on work from meta-gnss https://github.com/carlesfernandez/meta-gnss-sdr
>  * Hopefully this helps others playing with scipy and things.
>

thanks for this,  fortran is not a daily driver for many here, and is
not enabled
in toolchain by default as well. So in this scenario is there any easy way to
exclude this recipe from parsing ? I am interested in getting our recipe fail
count down and this recipe wont help.

> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb
>
> diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb
> new file mode 100644
> index 000000000..ef1abd567
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Linear Algebra PACKage"
> +URL = "http://www.netlib.org/lapack"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=930f8aa500a47c7dab0f8efb5a1c9a40"
> +
> +# Recipe needs FORTRAN support (copied from conf/local.conf.sample.extended)
> +# Enabling FORTRAN
> +# Note this is not officially supported and is just illustrated here to
> +# show an example of how it can be done
> +# You'll also need your fortran recipe to depend on libgfortran
> +#FORTRAN_forcevariable = ",fortran"
> +#RUNTIMETARGET_append_pn-gcc-runtime = " libquadmath"
> +
> +DEPENDS = "libgfortran"
> +
> +SRC_URI = "http://www.netlib.org/lapack/lapack-${PV}.tar.gz"
> +SRC_URI[md5sum] = "96591affdbf58c450d45c1daa540dbd2"
> +SRC_URI[sha256sum] = "deb22cc4a6120bff72621155a9917f485f96ef8319ac074a7afbc68aab88bcf6"
> +
> +EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=ON "
> +OECMAKE_GENERATOR = "Unix Makefiles"
> +
> +inherit cmake pkgconfig
> +
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

