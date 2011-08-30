Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QyUva-0000z1-3i
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 22:28:58 +0200
Received: by bkbzu17 with SMTP id zu17so22481bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 13:24:01 -0700 (PDT)
Received: by 10.204.136.66 with SMTP id q2mr411996bkt.269.1314735841453;
	Tue, 30 Aug 2011 13:24:01 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de (recycler-gw.in-dsl.de
	[217.197.85.167])
	by mx.google.com with ESMTPS id f15sm112826bke.27.2011.08.30.13.23.58
	(version=SSLv3 cipher=OTHER); Tue, 30 Aug 2011 13:23:59 -0700 (PDT)
Message-ID: <4E5D46DD.10409@dresearch-fe.de>
Date: Tue, 30 Aug 2011 22:23:57 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1314714550-29390-1-git-send-email-sherbrec@cit-ec.uni-bielefeld.de>
In-Reply-To: <1314714550-29390-1-git-send-email-sherbrec@cit-ec.uni-bielefeld.de>
X-Enigmail-Version: 1.3.1
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
X-List-Received-Date: Tue, 30 Aug 2011 20:28:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.08.2011 16:29, Stefan Herbrechtsmeier wrote:
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
> Signed-off-by: Stefan Herbrechtsmeier <sherbrec@cit-ec.uni-bielefeld.de>

Acked-by: Steffen Sledz <sledz@dresearch-fe.de>

> ---
>  recipes/gcc/gcc-4.3.3.inc         |    2 +-
>  recipes/gcc/gcc-4.5.inc           |    2 +-
>  recipes/gcc/gcc-package-cross.inc |    4 +---
>  3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
> index 649fdfe..8b6ffe5 100644
> --- a/recipes/gcc/gcc-4.3.3.inc
> +++ b/recipes/gcc/gcc-4.3.3.inc
> @@ -8,7 +8,7 @@ LICENSE = "GPLv3"
>  DEPENDS = "mpfr gmp"
>  NATIVEDEPS = "mpfr-native gmp-native"
>  
> -INC_PR = "r23"
> +INC_PR = "r24"
>  
>  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
>  	file://fedora/gcc43-c++-builtin-redecl.patch;striplevel=0 \
> diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
> index 69229ef..2777dca 100644
> --- a/recipes/gcc/gcc-4.5.inc
> +++ b/recipes/gcc/gcc-4.5.inc
> @@ -8,7 +8,7 @@ DEPENDS = "mpfr gmp libmpc libelf"
>  NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
>  
>  
> -INC_PR = "r37"
> +INC_PR = "r38"
>  
>  SRCREV = "170880"
>  PV = "4.5"
> diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
> index 1533069..8d52b6f 100644
> --- a/recipes/gcc/gcc-package-cross.inc
> +++ b/recipes/gcc/gcc-package-cross.inc
> @@ -4,7 +4,7 @@ PACKAGE_STRIP = "no"
>  
>  SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
>  
> -PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran libstdc++-dev libgcc-dev"
> +PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran"
>  
>  # Called from within gcc-cross, so libdir is set wrong
>  FILES_libg2c = "${target_libdir}/libg2c.so.*"
> @@ -14,11 +14,9 @@ FILES_libssp = "${target_libdir}/libssp.so.*"
>  FILES_libgfortran = "${target_libdir}/libgfortran.so.*"
>  
>  FILES_libgcc = "${target_base_libdir}/libgcc_s.so.1"
> -FILES_libgcc-dev = "${target_libdir}/libgcc_s.so"
>  
>  FILES_libstdc++ = "${target_libdir}/libstdc++.so.*"
>  
> -FILES_libstdc++-dev = "${target_datadir}/gdb/auto-load/${libdir}/libstdc++.so.*-gdb.py*"
>  do_install () {
>  	oe_runmake 'DESTDIR=${D}' install
>  	install -d ${D}${target_base_libdir}


-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


