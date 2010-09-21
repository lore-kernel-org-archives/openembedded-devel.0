Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Oy9Vn-0005w0-74
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 22:32:25 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Oy9Vi-0004MV-1Y from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 13:32:18 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 21 Sep 2010 13:32:17 -0700
Received: from [172.30.80.208] ([172.30.80.208]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 21 Sep 2010 14:32:12 -0600
Message-ID: <4C991637.8070904@mentor.com>
Date: Tue, 21 Sep 2010 13:31:51 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285097965-7049-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1285097965-7049-1-git-send-email-raj.khem@gmail.com>
X-OriginalArrivalTime: 21 Sep 2010 20:32:14.0720 (UTC)
	FILETIME=[13993800:01CB59CC]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] gcc-cross, gcc-cross-sdk: Link libmpfr, libgmp, libmpc and libelf statically into gcc
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
X-List-Received-Date: Tue, 21 Sep 2010 20:32:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> * Generate static version of these libraries
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  recipes/gcc/gcc-configure-canadian-sdk.inc |    7 +++++++
>  recipes/gcc/gcc-configure-cross.inc        |    7 +++++++
>  recipes/gcc/gcc-configure-sdk.inc          |    8 ++++++++
>  recipes/gmp/gmp.inc                        |    7 +++++++
>  recipes/gmp/gmp_4.2.4.bb                   |   14 +++++++-------
>  recipes/gmp/gmp_5.0.1.bb                   |    5 +----
>  recipes/libelf/libelf_0.8.13.bb            |    2 ++
>  recipes/libmpc/libmpc_0.8.1.bb             |    4 +++-
>  recipes/libmpc/libmpc_0.8.2.bb             |    2 ++
>  recipes/mpfr/mpfr_3.0.0.bb                 |    2 ++
>  recipes/mpfr/mpfr_svn.bb                   |    2 ++
>  11 files changed, 48 insertions(+), 12 deletions(-)
> 
> diff --git a/recipes/gcc/gcc-configure-canadian-sdk.inc b/recipes/gcc/gcc-configure-canadian-sdk.inc
> index 83ae6f5..5e27358 100644
> --- a/recipes/gcc/gcc-configure-canadian-sdk.inc
> +++ b/recipes/gcc/gcc-configure-canadian-sdk.inc
> @@ -71,6 +71,13 @@ EXTRA_OECONF_PATHS = " \
>  
>  do_configure () {
>  	# Work around Hardcoded path assumptions in gcc
> +        # Make sure we use GMP/MPFR statically
> +        sed -i 's/^\(HOST_GMPLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> +        sed -i 's/^\(HOST_GMPLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
> +        sed -i 's/^\(HOST_PPLLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> +        sed -i 's/^\(HOST_PPLLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
> +        sed -i 's/^\(HOST_LIBELFLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> +        sed -i 's/^\(HOST_LIBELFLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
>  	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
>  	(cd ${S}/libstdc++-v3 && autoreconf)
>  	canadian_sdk_runconf
> diff --git a/recipes/gcc/gcc-configure-cross.inc b/recipes/gcc/gcc-configure-cross.inc
> index c3c2b66..7041fcf 100644
> --- a/recipes/gcc/gcc-configure-cross.inc
> +++ b/recipes/gcc/gcc-configure-cross.inc
> @@ -17,6 +17,13 @@ do_configure_prepend () {
>  	export OBJCOPY_FOR_TARGET="${TARGET_SYS}-objcopy"
>  	export STRIP_FOR_TARGET="${TARGET_SYS}-strip"
>  	export CC_FOR_TARGET="${CCACHE} ${TARGET_SYS}-gcc ${TARGET_CC_ARCH}"
> +	# Make sure we use GMP/MPFR statically
> +	sed -i 's/^\(HOST_GMPLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> +	sed -i 's/^\(HOST_GMPLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
> +	sed -i 's/^\(HOST_PPLLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> +	sed -i 's/^\(HOST_PPLLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
> +	sed -i 's/^\(HOST_LIBELFLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> +	sed -i 's/^\(HOST_LIBELFLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
>  }
>  
>  LIBGCCS_VAR = "-lgcc_s"
> diff --git a/recipes/gcc/gcc-configure-sdk.inc b/recipes/gcc/gcc-configure-sdk.inc
> index 328e780..c8fae11 100644
> --- a/recipes/gcc/gcc-configure-sdk.inc
> +++ b/recipes/gcc/gcc-configure-sdk.inc
> @@ -35,6 +35,14 @@ do_configure () {
>  	export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
>  	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
>  	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
> +        # Make sure we use GMP/MPFR statically
> +        sed -i 's/^\(HOST_GMPLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> +        sed -i 's/^\(HOST_GMPLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
> +        sed -i 's/^\(HOST_PPLLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> +        sed -i 's/^\(HOST_PPLLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
> +        sed -i 's/^\(HOST_LIBELFLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.tpl
> +        sed -i 's/^\(HOST_LIBELFLIBS =\) \(.*\)$/\1 -Wl,-Bstatic \2 -Wl,-Bdynamic/' ${S}/Makefile.in
> +
>  	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
>  	oe_runconf
>  }
> diff --git a/recipes/gmp/gmp.inc b/recipes/gmp/gmp.inc
> index 55209f3..522189d 100644
> --- a/recipes/gmp/gmp.inc
> +++ b/recipes/gmp/gmp.inc
> @@ -2,6 +2,7 @@ SECTION = "libs"
>  DESCRIPTION = "GNU multiprecision arithmetic library"
>  HOMEPAGE = "http://www.swox.com/gmp/"
>  LICENSE = "GPL LGPL"
> +INC_PR = "r1"
>  
>  SRC_URI = "${GNU_MIRROR}/gmp/gmp-${PV}.tar.bz2;name=gmp \
>  	   file://configure.patch \
> @@ -11,5 +12,11 @@ inherit autotools
>  
>  ARM_INSTRUCTION_SET = "arm"
>  
> +
> +EXTRA_OECONF_append_virtclass-native = " --enable-static"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +NATIVE_INSTALL_WORKS = "1"
> +
>  acpaths = ""
>  
> diff --git a/recipes/gmp/gmp_4.2.4.bb b/recipes/gmp/gmp_4.2.4.bb
> index af05875..6eb1ecb 100644
> --- a/recipes/gmp/gmp_4.2.4.bb
> +++ b/recipes/gmp/gmp_4.2.4.bb
> @@ -1,13 +1,13 @@
> -INC_PR = "r0"
> +require gmp.inc
> +
> +SRC_URI += "file://sh4-asmfix.patch \
> +            file://use-includedir.patch \
> +            file://dont_use_mips_h_constraint.patch \
> +           "
> +
>  PR = "${INC_PR}.5"
>  
> -SRC_URI_append += "file://sh4-asmfix.patch \
> -                   file://use-includedir.patch \
> -                   file://dont_use_mips_h_constraint.patch \
> -		  "
> -require gmp.inc
>  LICENSE = "GPLv3 LGPLv3"
> -BBCLASSEXTEND = "nativesdk"
>  
>  SRC_URI[gmp.md5sum] = "fc1e3b3a2a5038d4d74138d0b9cf8dbe"
>  SRC_URI[gmp.sha256sum] = "5420b0e558a69a53b36f2b2c70a69f547e075d98366a585fc80cbbcce1efe368"
> diff --git a/recipes/gmp/gmp_5.0.1.bb b/recipes/gmp/gmp_5.0.1.bb
> index 0b117b1..95cb771 100644
> --- a/recipes/gmp/gmp_5.0.1.bb
> +++ b/recipes/gmp/gmp_5.0.1.bb
> @@ -1,8 +1,5 @@
> -INC_PR = "r0"
> +require gmp.inc
>  PR = "${INC_PR}.1"
>  SRC_URI[gmp.md5sum] = "6bac6df75c192a13419dfd71d19240a7"
>  SRC_URI[gmp.sha256sum] = "a2a610f01fd3298dc08c87bf30498c2402590e1bcb227fc40b15ee6d280939fb"
> -require gmp.inc
>  LICENSE = "GPLv3 LGPLv3"
> -NATIVE_INSTALL_WORKS = "1"
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/recipes/libelf/libelf_0.8.13.bb b/recipes/libelf/libelf_0.8.13.bb
> index 27fee38..ea19b35 100644
> --- a/recipes/libelf/libelf_0.8.13.bb
> +++ b/recipes/libelf/libelf_0.8.13.bb
> @@ -12,6 +12,8 @@ PARALLEL_MAKE = ""
>  
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  
> +EXTRA_OECONF_append_virtclass-native = " --enable-static"
> +
>  do_configure_prepend () {
>  	if test ! -e acinclude.m4; then
>  		cp aclocal.m4 acinclude.m4
> diff --git a/recipes/libmpc/libmpc_0.8.1.bb b/recipes/libmpc/libmpc_0.8.1.bb
> index f79321c..ed7e5bb 100644
> --- a/recipes/libmpc/libmpc_0.8.1.bb
> +++ b/recipes/libmpc/libmpc_0.8.1.bb
> @@ -4,9 +4,11 @@ DEPENDS = "gmp mpfr"
>  S = "${WORKDIR}/mpc-${PV}"
>  NATIVE_INSTALL_WORKS = "1"
>  BBCLASSEXTEND = "native"
> -PR = "1"
> +PR = "r2"
>  
>  SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
>  
> +EXTRA_OECONF_append_virtclass-native = " --enable-static"
> +
>  SRC_URI[md5sum] = "5b34aa804d514cc295414a963aedb6bf"
>  SRC_URI[sha256sum] = "e664603757251fd8a352848276497a4c79b7f8b21fd8aedd5cc0598a38fee3e4"
> diff --git a/recipes/libmpc/libmpc_0.8.2.bb b/recipes/libmpc/libmpc_0.8.2.bb
> index 1d383fa..18a161a 100644
> --- a/recipes/libmpc/libmpc_0.8.2.bb
> +++ b/recipes/libmpc/libmpc_0.8.2.bb
> @@ -4,8 +4,10 @@ DEPENDS = "gmp mpfr"
>  S = "${WORKDIR}/mpc-${PV}"
>  NATIVE_INSTALL_WORKS = "1"
>  BBCLASSEXTEND = "native"
> +PR = "r1"
>  
>  SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
>  
> +EXTRA_OECONF_append_virtclass-native = " --enable-static"
>  SRC_URI[md5sum] = "e98267ebd5648a39f881d66797122fb6"
>  SRC_URI[sha256sum] = "ae79f8d41d8a86456b68607e9ca398d00f8b7342d1d83bcf4428178ac45380c7"
> diff --git a/recipes/mpfr/mpfr_3.0.0.bb b/recipes/mpfr/mpfr_3.0.0.bb
> index 97f4970..0dacb1e 100644
> --- a/recipes/mpfr/mpfr_3.0.0.bb
> +++ b/recipes/mpfr/mpfr_3.0.0.bb
> @@ -11,5 +11,7 @@ SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.bz2 \
>  # fix build in thumb mode for armv4t
>  SRC_URI_append_thumb = " file://long-long-thumb.patch"
>  
> +EXTRA_OECONF_append_virtclass-native = " --enable-static"
> +
>  SRC_URI[md5sum] = "f45bac3584922c8004a10060ab1a8f9f"
>  SRC_URI[sha256sum] = "8f4e5f9c53536cb798a30455ac429b1f9fc75a0f8af32d6e0ac31ebf1024821f"
> diff --git a/recipes/mpfr/mpfr_svn.bb b/recipes/mpfr/mpfr_svn.bb
> index c1695b4..da58b37 100644
> --- a/recipes/mpfr/mpfr_svn.bb
> +++ b/recipes/mpfr/mpfr_svn.bb
> @@ -6,3 +6,5 @@ PR = "${INC_PR}.0"
>  
>  SRC_URI = "svn://scm.gforge.inria.fr/svn/mpfr;module=trunk"
>  S = "${WORKDIR}/trunk"
> +
> +EXTRA_OECONF_append_virtclass-native = " --enable-static"


-- 
Tom Rini
Mentor Graphics Corporation


