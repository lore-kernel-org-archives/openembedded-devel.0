Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id 920DB7C426
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 15:44:17 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id r16so2529689edq.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/OwucfeQ60ewHvokveEVd2Bvyie0o2mfNGBm9P1r/nU=;
	b=kYoYPDYi+VQeuL4RTfvLMb/eJhItTV6NI+2OLfciyJzO2tOzuC0c/irl4z229P1Ax6
	WaY3LEJPlCC+JWY2YTzgHghQ7J8lJ+Ia0d6H6q9OsAloktjlmNNYnkw+KWM242RVHcQN
	Xhcts5dwYW/xupRHcgnl4knTPOdNE6IIm+2n8eq/7J0JNbNkscr/MTczVY/f2ybwjuAT
	8sC5KJ9zg/+jVohPnf0AWvI1MvHPR4xXV3Sg4JJ31V0iNNB+Luj27UdndJ7grFeEqo0B
	JYevGN9sfMw3p5k8Cy7AaS8Nujy0YgZN2sEAal24ozMr/gSzs8/gA3CSLG/6hrrILLy/
	T8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/OwucfeQ60ewHvokveEVd2Bvyie0o2mfNGBm9P1r/nU=;
	b=oAM3eg70+g9Ctnx0GXOU0bRpm9WfOufy0/WusBjLSvWzlMAGVtY8Peh/Cd230LdmZp
	ZUQHbTKt0vg6YVrdIDHBXcEKDbcdBNYFQ6Q6hO/Y/HM85S3EH3dL6YQjfXO9DZe/JkoI
	IcZwRXa7amexoe5gHcN3xMW9yQcovG6DqD4GQYLC6EEMhjDxQHMv+n0MXWTuqpZwDfcI
	PXUHdHnkanKMYmakiHBIVCh8uo+OXV6Yp1ig+51I+lnwQAUy8cAxcXVgKf2Q5LzDdWvI
	n9qBsY5pNwrjLT+W70zddszl5AbWIOX/cqC7pxCh22py72ksKufAoWZNfRbtt2fjrX8j
	1KYA==
X-Gm-Message-State: APjAAAWE8J2ytL4cofOzBw07yHS1zb5xyQ5RP2PA7APh3ienU4pCskwB
	WFimW1rR0mOZ30+nusyM6UjFz4djW9doRMWYCP2by/ye
X-Google-Smtp-Source: APXvYqzE2/fZkRI/7k+KDgl4CdSVWoE2DFPkQKRn5rmY31hrPOKHjy5Jgr92o8eG1iSRj6VDAfY/1rQ3/pJFVdJ+wKI=
X-Received: by 2002:aa7:c614:: with SMTP id h20mr4289544edq.209.1569512658161; 
	Thu, 26 Sep 2019 08:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569403988.git.liezhi.yang@windriver.com>
	<10fa582ff48102bdf3380916207f636daa0f4c69.1569403988.git.liezhi.yang@windriver.com>
In-Reply-To: <10fa582ff48102bdf3380916207f636daa0f4c69.1569403988.git.liezhi.yang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 26 Sep 2019 17:44:15 +0200
Message-ID: <CA+chaQfB7aTq_nLmy9Dkwdg=DyB4u_s769QvOWK_iuqtjq0u=A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 8/8] spice: Drop broken native
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
X-List-Received-Date: Thu, 26 Sep 2019 15:44:18 -0000
Content-Type: text/plain; charset="UTF-8"

Can you check config.log to see what is broken on your native compiler?

It was building fine for me and it's dependency of qemu-native when spice
PACKAGECONFIG is enabled, so I would say it's still useful.

Maybe your host has really old gcc or something?

On Wed, Sep 25, 2019 at 11:36 AM Robert Yang <liezhi.yang@windriver.com>
wrote:

> $ bitbake spice-native
> checking whether the C compiler works... no
> configure: error: in
> `/path/to/spice-native/0.14.2+gitAUTOINC+7cbd70b931_4fc4c2db36-r0/build':
> configure: error: C compiler cannot create executables
>
> It's a broken native recipe which means no ones need it any more, so
> remove it.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-networking/recipes-support/spice/spice_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb
> b/meta-networking/recipes-support/spice/spice_git.bb
> index 552f81d..30e939a 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -39,7 +39,6 @@ export
> PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
>
>  CFLAGS_append = " -Wno-error=address-of-packed-member"
>
> -PACKAGECONFIG_class-native = ""
>  PACKAGECONFIG_class-nativesdk = ""
>  PACKAGECONFIG ?= "sasl"
>
> @@ -54,6 +53,6 @@ PACKAGECONFIG[xinerama] =
> "--enable-xinerama,--disable-xinerama,libxinerama,"
>
>  COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
>
> -BBCLASSEXTEND = "native nativesdk"
> +BBCLASSEXTEND = "nativesdk"
>
>  EXTRA_OECONF_append_toolchain-clang = " --disable-werror"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

