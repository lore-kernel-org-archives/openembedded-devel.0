Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 66B4A7E46E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 18:10:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 458yG21XH6z5Q;
	Thu, 23 May 2019 20:10:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558635002;
	bh=01vLiS5Gk5RddVrZEA2G4nR4TycwDKR17DMz0I4mpjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPjnqebX49ooUXrUzKd/Wy9+YkiHlKBRZ9hyaENMutYBqq9Wf8P3NrCmh1cttAEsj
	/kZ3urL+e+EjFIkb2jZRgvNN2xN1vh5Q50xmJw6YrwVV3RV7UBSSdfEDwdZHCqWzqU
	ReesY1X3cEHb/L3pn0WYO93OYbvfpIoC+6ZMa8LK37F+UPQ3kuqeKuzSSg7gd+fjEW
	QLGXv6xgNpIjmX9QtgduL8pq6e/tc/3C2bMezVY43F/TAAUZp6DvckYKcOAuKXAI3d
	XIIdxwwWCg67/HUZPmNyJehzgmokcrIsrXSLxmuRfIfF81Lw3t+gXgYGaxsMUMSSxV
	cTXJxkesJ1m2/oclZwHqwEDQsjw/vptTW4/swWfL/LsA4FVZvYFleV7wvbcKcZnFhF
	kftIAohVMw4XnhqTO6f2JeglMD8hIsR2JNfSObLAsiL6o3OOBIJuDW4g5Z5nSWVD/p
	mQTlsA3Eda2qU08pj7MAiQEw7tZ3cIgkOeQsR6543g5shdR7BN10MD+nv7z8k+WgH6
	BXtAY+aom2ux60y+/8WDu+hdq5AOXvkcRGO78L2DwniyVgnA3HZr46mCGW99A7S7kP
	Bht0rHwf2D8SbARMrCMdG11fhhXiLbxoaKBQQx6JFURobaKk7PKTWhM0i+NnVEgy9e
	6ijoc/fEGLMDWV37oOF25w0Q=
Date: Thu, 23 May 2019 21:10:00 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190523181000.GD3348@localhost>
References: <20190523174735.42541-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190523174735.42541-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] spice, spice-protocol: Uprev to 0.14.0
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
X-List-Received-Date: Thu, 23 May 2019 18:10:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 23, 2019 at 10:47:35AM -0700, Khem Raj wrote:
>...
> --- a/meta-networking/recipes-support/spice/spice-protocol_git.bb
> +++ b/meta-networking/recipes-support/spice/spice-protocol_git.bb
> @@ -13,9 +13,9 @@ architectures."
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b37311cb5604f3e5cc2fb0fd23527e95"
>
> -PV = "0.12.13+git${SRCPV}"
> +PV = "0.14.0+git${SRCPV}"
>
> -SRCREV = "87441524f4e7b79658e42bd8f1f6c3e3c8649aa5"
> +SRCREV = "f72ece993aeaf23f77e2845562b20e5563e52ba0"
>...

The previous one was a git snapshot but this is a release,
so +git should be dropped from PV.

>...
> Add -Wno-address-of-packed-member needed with gcc9
> 
> replace _append += with just _append syntax
>...
> +CFLAGS += "-Wno-address-of-packed-member"
> +
>  PACKAGECONFIG_class-native = ""
>  PACKAGECONFIG_class-nativesdk = ""
>  PACKAGECONFIG ?= "sasl"
> @@ -54,4 +55,4 @@ COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
>  
>  BBCLASSEXTEND = "native nativesdk"
>  
> -EXTRA_OECONF_toolchain-clang += "--disable-werror"
> +EXTRA_OECONF_append_toolchain-clang = " --disable-werror"
>...

Would adding --disable-werror for all toolchains also fix the
gcc 9 build error?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


