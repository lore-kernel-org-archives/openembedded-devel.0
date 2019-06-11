Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 55E867E67D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 19:33:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45NgCr3d4Gz4v;
	Tue, 11 Jun 2019 21:33:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560281624;
	bh=3NUMTpm5jZvznQXN71t0FWqx1XRqVI+5SinxpAtKfIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cs+iQz9QsFxJ4SqVF38Lev2VagBP9ACfJL/8sQTFtbUI0djwRugzRJSExUszMBzKJ
	+T17x8UZwqyZ141XDP77bXkPMQczND042wAKJfCAQfptr3iRjzULM193UAEVQsZXNC
	RGIAgc9CUTuZRw3PoZ6Ik9qHCZdXgPsjF8B9kW+PrB5WHALERY6e+57vOqMiLKIxvb
	l9RqeFesgtjLyJoLNXAK8hc/ucU/dzYA6+rAOsABdjcscOjwEWjlI5mDyWD45HvQ8R
	ccHoOxPaTsg2QYJhTxX3AMKekeEodPMSQHO+ETF9zrrnJky9yFx/MmGaesLQogPCGW
	DKrJUrjM1aCMDdiWwm+e1k/yFm4Bt5UKIiBRuPeDdlBm38IizhOcIEvgOx/Evh9xrX
	aQrmtm/5lt95ic6s44QN1ayI1n2fEmDGz6kfSX8DaoyBs3Bc2G5Ielx1dkQlYwjlkd
	wh4gBJ03ziZmPB3YPPJ5nj0prT6I5glI8tmNx5acURQAhHCHHntwqeaSlqPSD2Ad84
	Tf3/0+WzwCQkvokE2lpYOgqRqY+cN7dWi9M94Rlo2AUxCbEfpqTMazA6mJ5LkUiumP
	ayr4JQ/yZNStf5cpmQircIrKuSeNFc2dEIvO4CMY98ROiO6CvZUWqqfvx1Yp/T++0M
	YZopLbVWJtss/AJ59wytickg=
Date: Tue, 11 Jun 2019 22:33:39 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190611193339.GA18027@localhost>
References: <20190611165504.23049-1-Martin.Jansa@gmail.com>
	<20190611165504.23049-3-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190611165504.23049-3-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][warrior][PATCH 03/11] oprofile: make MACHINE_ARCH
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
X-List-Received-Date: Tue, 11 Jun 2019 19:33:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jun 11, 2019 at 04:54:56PM +0000, Martin Jansa wrote:
> * fixes:
> ERROR: oprofile different signature for task do_configure.sigdata between hammerhead and mako
> Hash for dependent task oprofile/oprofile_1.3.0.bb.do_prepare_recipe_sysroot changed from deecd34bc94f47935ce3dc7f83f9a8407269959e446518bd9700a2ebae4324bb to d4d6301a72fcd061c167a6715372a6e35f57bf08152a6223b1571957834428f0
> Unable to find matching sigdata for /OE/build/luneos-master/webos-ports/meta-openembedded/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb.do_prepare_recipe_sysroot with hashes deecd34bc94f47935ce3dc7f83f9a8407269959e446518bd9700a2ebae4324bb or d4d6301a72fcd061c167a6715372a6e35f57bf08152a6223b1571957834428f0
> 
> $ bitbake-diffsigs /OE/build/luneos-master/webos-ports/tmp-glibc/sstate-diff/1557963509/[hm]*/*/oprofile/*do_prepare*.sigdata*
> runtaskdeps changed:
> ['autoconf/autoconf_2.69.bb.do_populate_sysroot:virtual:native automake/automake_1.16.1.bb.do_populate_sysroot:virtual:native binutils/binutils_2.32.bb.do_populate_sysroot gcc/gcc-cross_7.3.bb.do_populate_sysroot gcc/gcc-runtime_7.3.bb.do_populate_sysroot glibc/glibc_2.29.bb.do_populate_sysroot gnu-config/gnu-config_git.bb.do_populate_sysroot:virtual:native libtool/libtool-cross_2.4.6.bb.do_populate_sysroot libtool/libtool-native_2.4.6.bb.do_populate_sysroot', -linux/linux-lg-hammerhead_git.bb.do_populate_sysroot, +linux/linux-lg-mako_git.bb.do_populate_sysroot, 'oprofile/oprofile_1.3.0.bb.do_fetch pkgconfig/pkgconfig_git.bb.do_populate_sysroot:virtual:native popt/popt_1.16.bb.do_populate_sysroot']
> linux/linux-lg-hammerhead_git.bb.do_populate_sysroot with hash e58e94601af73831ea51ca6cc18578c26b9b491bcadb82a2c590b22498447438
>  changed to
> linux/linux-lg-mako_git.bb.do_populate_sysroot with hash 4c7372d0063be9d5c96bfad20a2052ded3a7121a06027c21a75e79a4f6a678e3
> Dependency on task linux/linux-lg-mako_git.bb.do_populate_sysroot was added with hash 4c7372d0063be9d5c96bfad20a2052ded3a7121a06027c21a75e79a4f6a678e3
> Dependency on task linux/linux-lg-hammerhead_git.bb.do_populate_sysroot was removed with hash e58e94601af73831ea51ca6cc18578c26b9b491bcadb82a2c590b22498447438
> 
> * as detected with:
> openembedded-core/scripts/sstate-diff-machines.sh --targets=world --tmpdir=tmp-glibc/ --analyze --machines="hammerhead mako qemux86"
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
> index 1dc535ed8d..8d706e4a50 100644
> --- a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
> +++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
> @@ -3,6 +3,9 @@ require oprofile.inc
>  DEPENDS += "virtual/kernel"
>  DEPENDS_append_powerpc64 = " libpfm4"
>  
> +# Depends on MACHINE_ARCH kernel
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>...

Sorry that I missed this when it went into master,
but this looks bogus to me:

oprofile only needs the userspace kernel headers and shouldn't depend 
on virtual/kernel.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


