Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OS9Lg-00076C-0B
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 15:53:44 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OS9H8-0005dC-5T from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 06:48:58 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 25 Jun 2010 06:48:57 -0700
Received: from [134.86.104.18] ([134.86.104.18]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 25 Jun 2010 07:48:56 -0600
Message-ID: <4C24B3C7.2080704@mentor.com>
Date: Fri, 25 Jun 2010 08:48:55 -0500
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikjJzqog2Cla8H_JazzRw6QuSrSdllTOD7XwgBx@mail.gmail.com>
	<1277152663-12051-1-git-send-email-fransmeulenbroeks@gmail.com>
In-Reply-To: <1277152663-12051-1-git-send-email-fransmeulenbroeks@gmail.com>
X-OriginalArrivalTime: 25 Jun 2010 13:48:56.0188 (UTC)
	FILETIME=[27CC43C0:01CB146D]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-libc-headers: use kernel-arch.bbclass
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
X-List-Received-Date: Fri, 25 Jun 2010 13:53:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> linux-libc-headers recipes all have their own code to set ARCH.
> However this same functionality is in kernel-arch.bbclass
> This patch adds an inherit kernel-arch in linux-libc-headers.inc
> and removes all arch calculation code from the recipes
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  recipes/linux-libc-headers/linux-libc-headers.inc  |    2 +
>  .../linux-libc-headers_2.6.11.1.bb                 |   18 +-------------
>  .../linux-libc-headers_2.6.15.99.bb                |   18 +-------------
>  .../linux-libc-headers_2.6.18+2.6.19-rc1.bb        |   22 +----------------
>  .../linux-libc-headers_2.6.18.bb                   |   23 +-----------------
>  .../linux-libc-headers_2.6.20.bb                   |   25 +-------------------
>  .../linux-libc-headers_2.6.22.bb                   |   25 +-------------------
>  .../linux-libc-headers_2.6.23.bb                   |   25 +-------------------
>  .../linux-libc-headers_2.6.24.bb                   |   25 +-------------------
>  .../linux-libc-headers_2.6.25.bb                   |   25 +-------------------
>  .../linux-libc-headers_2.6.29.bb                   |   25 +-------------------
>  .../linux-libc-headers_2.6.30.bb                   |   25 +-------------------
>  .../linux-libc-headers_2.6.31.bb                   |   25 +-------------------
>  .../linux-libc-headers_2.6.32.bb                   |   25 +-------------------
>  .../linux-libc-headers_2.6.7.0.bb                  |   18 +-------------
>  .../linux-libc-headers_2.6.8.1.bb                  |   18 +-------------
>  16 files changed, 17 insertions(+), 327 deletions(-)
> 
> diff --git a/recipes/linux-libc-headers/linux-libc-headers.inc b/recipes/linux-libc-headers/linux-libc-headers.inc
> index 0b0d05a..3410f35 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers.inc
> +++ b/recipes/linux-libc-headers/linux-libc-headers.inc
> @@ -6,3 +6,5 @@ BBCLASSEXTEND = "native"
>  
>  RDEPENDS_${PN}-dev = ""
>  RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
> +
> +inherit kernel-arch
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb
> index 0f925dd..95143c9 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/"
>  #   standard linux kernel license applies.
>  # since we assume GPL for linux i think we can also assume it here
>  INHIBIT_DEFAULT_DEPS = "1"
> -PR = "r4"
> +PR = "r5"
>  
>  SRC_URI = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/linux-libc-headers-${PV}.tar.bz2 \
>  	file://keyboard.patch"
> @@ -15,22 +15,6 @@ SRC_URI = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/linux-libc-heade
>  S = "${WORKDIR}/linux-libc-headers-${PV}"
>  
>  do_configure () {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=ppc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	esac
>  	if test !  -e include/asm-$ARCH; then
>  		oefatal unable to create asm symlink in kernel headers
>  	fi
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb
> index 3dafb32..c5a6c4f 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb
> @@ -13,7 +13,7 @@ require linux-libc-headers.inc
>  # since we assume GPL for linux i think we can also assume it here
>  DEFAULT_PREFERENCE = "-1"
>  INHIBIT_DEFAULT_DEPS = "1"
> -PR = "r6"
> +PR = "r7"
>  
>  SRC_URI = "http://ewi546.ewi.utwente.nl/OE/eabi/linux-libc-headers-${PV}.tar.bz2 \
>  	file://keyboard.patch \
> @@ -27,22 +27,6 @@ SRC_URI = "http://ewi546.ewi.utwente.nl/OE/eabi/linux-libc-headers-${PV}.tar.bz2
>  S = "${WORKDIR}/linux-libc-headers-${PV}"
>  
>  do_configure () {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=ppc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	esac
>  	if test !  -e include/asm-$ARCH; then
>  		oefatal unable to create asm symlink in kernel headers
>  	fi
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb
> index d5494d4..17d2091 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>  
>  DEFAULT_PREFERENCE = "-1"
>  INHIBIT_DEFAULT_DEPS = "1"
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI = " \
>  	${KERNELORG_MIRROR}/pub/linux/kernel/people/dwmw2/kernel-headers/snapshot/linux-kernel-headers-2.6.19-rc1.tar.bz2 \
> @@ -13,27 +13,7 @@ SRC_URI = " \
>  
>  S = "${WORKDIR}/linux-2.6.19-rc1"
>  
> -set_arch() {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=powerpc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	esac
> -}
> -
>  do_install() {
> -	set_arch
>  	install -d ${D}${includedir}
>  	cp -pfLR ${S}${includedir}/linux ${D}${includedir}/
>  	cp -pfLR ${S}${includedir}/asm-${ARCH} ${D}${includedir}/asm
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb
> index 8d88bf1..80806ff 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb
> @@ -2,34 +2,14 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r4"
> +PR = "r5"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.18.tar.bz2 \
>             file://arm-syscall-define.patch"
>  
>  S = "${WORKDIR}/linux-2.6.18"
>  
> -set_arch() {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=powerpc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	esac
> -}
> -
>  do_configure() {
> -	set_arch
>  	oe_runmake allnoconfig ARCH=${ARCH}
>  }
>  
> @@ -37,7 +17,6 @@ do_compile () {
>  }
>  
>  do_install() {
> -	set_arch
>  	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=${ARCH}
>  	# Add UTS_RELEASE to version.h. UTS_RELEASE was moved from version.h to
>  	# utsrelease.h in order to avoid recompiling a kernel every time a localversion
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb
> index f048ea3..32ce044 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r11"
> +PR = "r12"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>             file://procinfo.h \
> @@ -11,29 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>  
>  S = "${WORKDIR}/linux-${PV}"
>  
> -set_arch() {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=powerpc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	        avr32*)   ARCH=avr32 ;;
> -                bfin*)    ARCH=blackfin ;;
> -	esac
> -}
> -
>  do_configure() {
> -	set_arch
>  	oe_runmake allnoconfig ARCH=$ARCH
>  }
>  
> @@ -41,7 +19,6 @@ do_compile () {
>  }
>  
>  do_install() {
> -	set_arch
>  	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
>  }
>  
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
> index 6b9a9f7..12845e0 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
> @@ -2,36 +2,14 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r3"
> +PR = "r4"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>             file://procinfo.h"
>  
>  S = "${WORKDIR}/linux-${PV}"
>  
> -set_arch() {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=powerpc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	        avr32*)   ARCH=avr32 ;;
> -                bfin*)    ARCH=blackfin ;;
> -	esac
> -}
> -
>  do_configure() {
> -	set_arch
>  	oe_runmake allnoconfig ARCH=$ARCH
>  }
>  
> @@ -39,7 +17,6 @@ do_compile () {
>  }
>  
>  do_install() {
> -	set_arch
>  	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
>  }
>  
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> index 742433f..474b96c 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r6"
> +PR = "r7"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>             file://procinfo.h \
> @@ -11,29 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>  
>  S = "${WORKDIR}/linux-${PV}"
>  
> -set_arch() {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=powerpc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	        avr32*)   ARCH=avr32 ;;
> -                bfin*)    ARCH=blackfin ;;
> -	esac
> -}
> -
>  do_configure() {
> -	set_arch
>  	oe_runmake allnoconfig ARCH=$ARCH
>  }
>  
> @@ -41,7 +19,6 @@ do_compile () {
>  }
>  
>  do_install() {
> -	set_arch
>  	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
>  }
>  
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> index 74876bf..b90c478 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r4"
> +PR = "r5"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>             file://procinfo.h \
> @@ -10,29 +10,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>  
>  S = "${WORKDIR}/linux-${PV}"
>  
> -set_arch() {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=powerpc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	        avr32*)   ARCH=avr32 ;;
> -                bfin*)    ARCH=blackfin ;;
> -	esac
> -}
> -
>  do_configure() {
> -	set_arch
>  	oe_runmake allnoconfig ARCH=$ARCH
>  }
>  
> @@ -40,7 +18,6 @@ do_compile () {
>  }
>  
>  do_install() {
> -	set_arch
>  	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
>  }
>  
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb
> index c4200e0..084fea6 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r4"
> +PR = "r5"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>  	   file://reinstate-a.out.h.patch \
> @@ -13,29 +13,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>  
>  S = "${WORKDIR}/linux-${PV}"
>  
> -set_arch() {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=powerpc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	        avr32*)   ARCH=avr32 ;;
> -                bfin*)    ARCH=blackfin ;;
> -	esac
> -}
> -
>  do_configure() {
> -	set_arch
>  	oe_runmake allnoconfig ARCH=$ARCH
>  }
>  
> @@ -43,7 +21,6 @@ do_compile () {
>  }
>  
>  do_install() {
> -	set_arch
>  	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
>  }
>  
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb
> index d939349..d59fb4d 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb
> @@ -2,36 +2,14 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>  	  "
>  
>  S = "${WORKDIR}/linux-${PV}"
>  
> -set_arch() {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=powerpc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	        avr32*)   ARCH=avr32 ;;
> -                bfin*)    ARCH=blackfin ;;
> -	esac
> -}
> -
>  do_configure() {
> -	set_arch
>  	oe_runmake allnoconfig ARCH=$ARCH
>  }
>  
> @@ -39,7 +17,6 @@ do_compile () {
>  }
>  
>  do_install() {
> -	set_arch
>  	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
>  }
>  
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb
> index 0048f24..c64e59c 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>  	   file://uio-header.patch \
> @@ -12,29 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>  
>  S = "${WORKDIR}/linux-${PV}"
>  
> -set_arch() {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=powerpc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	        avr32*)   ARCH=avr32 ;;
> -                bfin*)    ARCH=blackfin ;;
> -	esac
> -}
> -
>  do_configure() {
> -	set_arch
>  	oe_runmake allnoconfig ARCH=$ARCH
>  }
>  
> @@ -42,7 +20,6 @@ do_compile () {
>  }
>  
>  do_install() {
> -	set_arch
>  	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
>  }
>  
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
> index e3a27c5..c31d482 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r4"
> +PR = "r5"
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> @@ -11,29 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>  	  "
>  S = "${WORKDIR}/linux-${PV}"
>  
> -set_arch() {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=powerpc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	        avr32*)   ARCH=avr32 ;;
> -                bfin*)    ARCH=blackfin ;;
> -	esac
> -}
> -
>  do_configure() {
> -	set_arch
>  	oe_runmake allnoconfig ARCH=$ARCH
>  }
>  
> @@ -41,7 +19,6 @@ do_compile () {
>  }
>  
>  do_install() {
> -	set_arch
>  	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
>  	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
>  }
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
> index 16304df..b12100c 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r4"
> +PR = "r5"
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> @@ -11,29 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>  	  "
>  S = "${WORKDIR}/linux-${PV}"
>  
> -set_arch() {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=powerpc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	        avr32*)   ARCH=avr32 ;;
> -                bfin*)    ARCH=blackfin ;;
> -	esac
> -}
> -
>  do_configure() {
> -	set_arch
>  	oe_runmake allnoconfig ARCH=$ARCH
>  }
>  
> @@ -41,7 +19,6 @@ do_compile () {
>  }
>  
>  do_install() {
> -	set_arch
>  	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
>  	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
>  }
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
> index 0a1159a..8141fac 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  NATIVE_INSTALL_WORKS = "0"
> -PR = "r4"
> +PR = "r5"
>  # NOTE: no need to package these headers, since the c library includes them.
>  PACKAGES = ""
>  
> @@ -12,22 +12,6 @@ SRC_URI = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/linux-libc-heade
>  S = "${WORKDIR}/linux-libc-headers-${PV}"
>  
>  do_configure () {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=ppc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	esac
>  	if test !  -e include/asm-$ARCH; then
>  		oefatal unable to create asm symlink in kernel headers
>  	fi
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
> index 6cbd8ba..15c4e6d 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
> @@ -8,7 +8,7 @@ HOMEPAGE = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/"
>  #   standard linux kernel license applies.
>  # since we assume GPL for linux i think we can also assume it here
>  INHIBIT_DEFAULT_DEPS = "1"
> -PR = "r8"
> +PR = "r9"
>  
>  # NOTE: no need to package these headers, since the c library includes them.
>  PACKAGES = ""
> @@ -20,22 +20,6 @@ SRC_URI = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/linux-libc-heade
>  S = "${WORKDIR}/linux-libc-headers-${PV}"
>  
>  do_configure () {
> -	case ${TARGET_ARCH} in
> -		alpha*)   ARCH=alpha ;;
> -		arm*)     ARCH=arm ;;
> -		cris*)    ARCH=cris ;;
> -		hppa*)    ARCH=parisc ;;
> -		i*86*)    ARCH=i386 ;;
> -		ia64*)    ARCH=ia64 ;;
> -		mips*)    ARCH=mips ;;
> -		m68k*)    ARCH=m68k ;;
> -		powerpc*) ARCH=ppc ;;
> -		s390*)    ARCH=s390 ;;
> -		sh*)      ARCH=sh ;;
> -		sparc64*) ARCH=sparc64 ;;
> -		sparc*)   ARCH=sparc ;;
> -		x86_64*)  ARCH=x86_64 ;;
> -	esac
>  	if test !  -e include/asm-$ARCH; then
>  		oefatal unable to create asm symlink in kernel headers
>  	fi


-- 
Tom Rini
Mentor Graphics Corporation


