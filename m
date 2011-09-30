Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R9gzE-0007iU-0Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 19:35:00 +0200
Received: by gyg8 with SMTP id 8so1702874gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=OfnWiqLfwQ/HV5G7w2eugIgUm5uFFQW9c//XdMjDBfg=;
	b=GHWyRTdp0hbAAJYNut17vCmhveOQZ/ILb8875lUMKBarzVDT7bOahwmiGuHM7ayiZi
	Z0w5iCf56FCpPyjM2CnB6eY3e12Io+n+mHsoyf3x3dIlT+Dmvr0gmrqifyHggCQ63yTC
	CUAIUI6scy6SIHbABDpsPI6MBGaKU6T7EcXaI=
Received: by 10.146.181.25 with SMTP id d25mr11091826yaf.3.1317403770606;
	Fri, 30 Sep 2011 10:29:30 -0700 (PDT)
Received: from [172.23.2.133] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id k31sm15540462ann.15.2011.09.30.10.29.28
	(version=SSLv3 cipher=OTHER); Fri, 30 Sep 2011 10:29:28 -0700 (PDT)
Message-ID: <4E85FC71.7000905@gmail.com>
Date: Fri, 30 Sep 2011 10:29:21 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:7.0) Gecko/20110922 Thunderbird/7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1314714550-29390-1-git-send-email-sherbrec@cit-ec.uni-bielefeld.de>
In-Reply-To: <1314714550-29390-1-git-send-email-sherbrec@cit-ec.uni-bielefeld.de>
Subject: Re: [PATCH] gcc: Remove package libstdc++-dev and libgcc-dev from gcc-cross
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Sep 2011 17:35:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/2011 7:29 AM, Stefan Herbrechtsmeier wrote:
> Remove package libstdc++-dev and libgcc-dev from gcc-cross as they
> already provided by gcc.
>
> Commit 8c42351519ece9ed60659a103e624d2e154b3641 add dev packages
> (libstdc++-dev libgcc-dev) to gcc-cross (gcc-package-cross.inc)
> which are already part of gcc. The libgcc-dev package both include
> the libgcc_s.so file which triggers a 'file is already provided by
> package' error on incremental builds. The libstdc++-dev package have
> different content and is empty on some archs (armv5te, armv7e).
> The empty package triggers a 'Cannot satisfy the following
> dependencies for task-sdk-bare' error. If an empty libstdc++-dev
> package is generated it triggers a '..../usr/include/c++ not exist'
> error as this is part of the package from gcc but not gcc-cross.
>
> Signed-off-by: Stefan Herbrechtsmeier<sherbrec@cit-ec.uni-bielefeld.de>

this would mean that if you need to use -dev files then you have to 
build target gcc. Have you looked into possiblity of removing these 
duplication from target gcc recipe instead ?

We may not want to build target gcc. Right now the libstdc++ package
will come from gcc-cross and dev packages will come from gcc target
recipes.

Look into why -dev file is not populated properly instead.

> ---
>   recipes/gcc/gcc-4.3.3.inc         |    2 +-
>   recipes/gcc/gcc-4.5.inc           |    2 +-
>   recipes/gcc/gcc-package-cross.inc |    4 +---
>   3 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
> index 649fdfe..8b6ffe5 100644
> --- a/recipes/gcc/gcc-4.3.3.inc
> +++ b/recipes/gcc/gcc-4.3.3.inc
> @@ -8,7 +8,7 @@ LICENSE = "GPLv3"
>   DEPENDS = "mpfr gmp"
>   NATIVEDEPS = "mpfr-native gmp-native"
>
> -INC_PR = "r23"
> +INC_PR = "r24"
>
>   SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
>   	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
> diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
> index 69229ef..2777dca 100644
> --- a/recipes/gcc/gcc-4.5.inc
> +++ b/recipes/gcc/gcc-4.5.inc
> @@ -8,7 +8,7 @@ DEPENDS = "mpfr gmp libmpc libelf"
>   NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
>
>
> -INC_PR = "r37"
> +INC_PR = "r38"
>
>   SRCREV = "170880"
>   PV = "4.5"
> diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
> index 1533069..8d52b6f 100644
> --- a/recipes/gcc/gcc-package-cross.inc
> +++ b/recipes/gcc/gcc-package-cross.inc
> @@ -4,7 +4,7 @@ PACKAGE_STRIP = "no"
>
>   SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
>
> -PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran libstdc++-dev libgcc-dev"
> +PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran"
>
>   # Called from within gcc-cross, so libdir is set wrong
>   FILES_libg2c = "${target_libdir}/libg2c.so.*"
> @@ -14,11 +14,9 @@ FILES_libssp = "${target_libdir}/libssp.so.*"
>   FILES_libgfortran = "${target_libdir}/libgfortran.so.*"
>
>   FILES_libgcc = "${target_base_libdir}/libgcc_s.so.1"
> -FILES_libgcc-dev = "${target_libdir}/libgcc_s.so"
>
>   FILES_libstdc++ = "${target_libdir}/libstdc++.so.*"
>
> -FILES_libstdc++-dev = "${target_datadir}/gdb/auto-load/${libdir}/libstdc++.so.*-gdb.py*"
>   do_install () {
>   	oe_runmake 'DESTDIR=${D}' install
>   	install -d ${D}${target_base_libdir}



