Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id C7A4178272
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 18:47:09 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u48so4816875wrf.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 11:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I6v91eQyw4bVqlA5GRFBc+EHaIqc2loWH0XELbOUF/8=;
	b=A9MWWraC3HMLMaj4sZ4JM5a04FbiPPCtfRcGqBWAjNepxbq/dFKC9nVY/qmpCwJ/eR
	0eJsjtIIKruV/5Ib4aKPmSoIerv0a9n8o39bhBZsT5uhXviZ7ZrIOMfym/esPwN7ZFEv
	9/EI/ovejo4SndHxDeckHGaQ9sy6mW/U5Tyjk85RBY6P7th0GGTpy5jfyXedHeIPxHah
	rUnuq3hd+0G08jEKh83hT8pbUpjCvHKbiVtgRbLUjp6BKSVJrAAFm5g+CiGv2KGxeX1g
	kIAja+X4GumjTwAhx5JCcGmnSlu3fd39zYbdGsRtWUN77gMjkRQ2Kex7EbB5Jaa2T5ft
	InuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I6v91eQyw4bVqlA5GRFBc+EHaIqc2loWH0XELbOUF/8=;
	b=ocPXlJfaAj/E+OGwwP9gGgcryluqh7L/AgQQIELtLUjIMk8FcpxgwAt6vRMHyh7Oll
	EhDoIrZ4nYDXz1VEP0IjdbNYpj8JCNP9LH+qt69a8AyOhc5uoxKPw/CHQigRpUyCfRvy
	g+c39vpht74ULwNAgsvWChGAkXUFrDajOxrzWeu7fn8aQ8Ga3FgrsRROakvoZG6gjtzL
	pyYMWcJSbu/BDUYdYxqk4xitiFceCwPU0GYjL211mer9kVfFMD+ZTflvVqdZbVrkWcDr
	9SBFE8I6h6fqnjqNvalqHgkOlB3FNrauHeCX62iGHqd/smLwqkMs/w5R1PBGADxX0shk
	ffiA==
X-Gm-Message-State: AHPjjUgxWDKC/ZujS07nGnzMXADDo9r0mLvTuMQhIjT009bU3KlR73Ss
	bHeX8lVq8DO7wxLjk7GJ45EKQztDCQ==
X-Google-Smtp-Source: ADKCNb5yHVg8vI5GFb88O5IzX0YV6jy6QjdKZV0yWi26TAnqJSK66sScGKi+a2Y3Luo0or1/X28J4+FCNg1xt6+Zij8=
X-Received: by 10.223.142.6 with SMTP id n6mr8773512wrb.140.1505155630481;
	Mon, 11 Sep 2017 11:47:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Mon, 11 Sep 2017 11:47:09 -0700 (PDT)
In-Reply-To: <20170911151056.4577-4-raj.khem@gmail.com>
References: <20170911151056.4577-1-raj.khem@gmail.com>
	<20170911151056.4577-4-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 11 Sep 2017 11:47:09 -0700
Message-ID: <CAJ86T=UQtomn1KeUuUBaSnqmhofieCOWz9WEAUTLqR2FDTqzWA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 4/5] klibc.bbclass: Use forcevariable override to define flags
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
X-List-Received-Date: Mon, 11 Sep 2017 18:47:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 11, 2017 at 8:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
> This is required so it can override the CC settings when
> clang is used because meta-clang uses toolchain-clang
> override to set CC and friends so we need to use higher
> order override, forcevariable is highest order.

Just for reference, ${LIBCOVERRIDE} is the highest order over-ride,
forcevariable is second.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-initramfs/classes/klibc.bbclass | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
> index f864104cf..2aacf241e 100644
> --- a/meta-initramfs/classes/klibc.bbclass
> +++ b/meta-initramfs/classes/klibc.bbclass
> @@ -3,13 +3,12 @@ DEPENDS =+ "klcc-cross"
>
>  # Default for klcc is to build static binaries.
>  # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
> +CC_forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
> +CC_forcevariable_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
>
> -export CC = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
> -export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
> -
> -export CPP = "${CC} -E"
> +CPP_forcevariable = "${CC} -E"
>
>  # klcc uses own optimizations by default. See klcc(1) man file.
> -export CFLAGS=""
> -export CPPFLAGS=""
> -export LDFLAGS=""
> +CFLAGS_forcevariable=""
> +CPPFLAGS_forcevariable=""
> +LDFLAGS_forcevariable=""
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

