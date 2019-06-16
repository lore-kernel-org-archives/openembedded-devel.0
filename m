Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 38A6A7EBFD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jun 2019 08:34:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45RSLj0Smvz3k;
	Sun, 16 Jun 2019 10:34:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560674061;
	bh=qdI0rESwNBMZsiXPiNGMYA8iAL/FdSapVwVXfuVRmIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hfFOq+qXbzY2XQwzZZKlVM6b/50AF1cv9D3xkBLch+wCGMsgXGqW1pGHer/R005ac
	lVRM8+l4QOuVwzmaHQ1i/Oyimb61yCGiBnzs+dB8yK+faG9LKTrX6rtnsV5wqWKOlI
	cSx/Eh5zyfRuRmAWQuawb9p6SdIPeZOXmBNbtMamaLEdge5xR8vGCT66Ck7rD7NTR4
	tNxGbYFb/SNzEph2xVmvGKZJy8r39AxdwZV+V71efG8vsiJokk6dfL5QNTXtfXA0lz
	D6nNnxllUQIhQMrdXPRyjMPvrgABmxLvxNxqib1m+V+6grh35HKvwwJhw8s+FzccSk
	eXt8Lo2rZ0eCQQsLeqG/ralpdGAXj1KzeTVZPVCfws2AGpDVgIz6pK1l6B6ih4XRtX
	E/PgTmK5OpVwsGS2fh0bz+2iB29CI2mXdsxuRmqFteferHpYe0A8LnGJ7I0FR2jD4n
	px3t1I2IfW9D5qZutNzLsxR70noe4UvtmSZCQGFPIi/sZXTMU3HWnyey7rD/VPLMPm
	Vd5r5j//ZcEFCku8kYmFYK74ATQdg96ihjIDGAXV8BOriorZ6BrT8rvsGvSYRYlocd
	1COQl6UC6kQoR8P07Q8d+7mNs4tv1rG+prZxJ3GcVZcYDZT1YYV8qml4MmExDCrArm
	84QgUO8thVtYwAM17MMFsOsU=
Date: Sun, 16 Jun 2019 11:34:19 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190616083419.GC2479@localhost>
References: <cover.1560620937.git.akuster808@gmail.com>
	<08c5b09a1add97bb5dbe993fdffdd0aebd09bcc3.1560620937.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <08c5b09a1add97bb5dbe993fdffdd0aebd09bcc3.1560620937.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Warror][ 02/23] ndctl: make MACHINE_ARCH and ignore from libblockdev
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
X-List-Received-Date: Sun, 16 Jun 2019 08:34:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Jun 15, 2019 at 10:57:06AM -0700, Armin Kuster wrote:
>...
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -51,6 +51,12 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    phoronix-test-suite->php \
>  "
>  
> +# Depends on ndctl (through nvdimm PACKAGECONFIG) which depends on MACHINE_ARCH kernel
> +# and making libblockdev MACHINE_ARCH is not an option as python3-blivet, udisks2, gvfs
> +# would be MACHINE_ARCH as well
> +SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
> +  libblockdev->ndctl \
> +"
>  # ttf.inc inherits fontcache which adds fontconfig-utils to RDEPENDS
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    terminus-font->fontconfig \
> diff --git a/meta-oe/recipes-core/ndctl/ndctl_v63.bb b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
> index 1f3abf5..61e5302 100644
> --- a/meta-oe/recipes-core/ndctl/ndctl_v63.bb
> +++ b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
> @@ -19,6 +19,9 @@ S = "${WORKDIR}/git"
>  
>  EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
>  
> +# Depends on MACHINE_ARCH kernel
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
>...

This looks like another case where the actual problem is an unnecessary 
DEPENDS on virtual/kernel, and the proper fix is to remove that instead.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


