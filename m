Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SsWNa-0004em-F7
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2012 11:53:42 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SsWCa-0002FH-Fs>; Sat, 21 Jul 2012 11:42:20 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SsWCa-0001Mx-D4>; Sat, 21 Jul 2012 11:42:20 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SsWCZ-0000vu-AB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2012 11:42:19 +0200
Date: Sat, 21 Jul 2012 11:42:19 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120721094219.GC31778@mi.fu-berlin.de>
References: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
	<1342761538-19890-3-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1342761538-19890-3-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [meta-java][PATCH 3/5] openjdk-6: Fix build on ppc
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
X-List-Received-Date: Sat, 21 Jul 2012 09:53:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 19, 2012 at 10:18:56PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../icedtea-jdk-powerpc-atomic64.patch             |   65 ++++++++++++++++++++
>  recipes-core/openjdk/openjdk-6-common.inc          |    2 +-
>  recipes-core/openjdk/openjdk-6-release-6b24.inc    |    2 +
>  3 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-powerpc-atomic64.patch
> 
> diff --git a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-powerpc-atomic64.patch b/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-powerpc-atomic64.patch
> new file mode 100644
> index 0000000..cc5e4e8
> --- /dev/null
> +++ b/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-powerpc-atomic64.patch
> @@ -0,0 +1,65 @@
> +http://mail.openjdk.java.net/pipermail/zero-dev/2010-June/000346.html
> +
> +this cute C code does the same thing on powerpc as the assembly code that
> +was here before. If the compiler was built with the SPE extensions instead
> +of traditional FPU and double operations are performed in HW then we are
> +one step further: The compiler turns this into evldd & evstdd. Voila :)
> +
> +This C code could also be activated on s390. The compiler turns this into
> +a single mvc instruction which does the copy operation. I don't know if
> +mvc's copy ability is atomic _or_ not and therefore I leave it as it.
> +
> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy at linutronix.de>
> +
> +./openjdk-src-dir/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp
> +Index: openjdk/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp
> +===================================================================
> +--- openjdk/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp.org	2011-11-14 14:07:32.000000000 -0800
> ++++ openjdk/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp	2012-07-19 07:28:26.208405923 -0700
> +@@ -25,6 +25,16 @@
> + 
> + #ifndef OS_CPU_LINUX_ZERO_VM_OS_LINUX_ZERO_HPP
> + #define OS_CPU_LINUX_ZERO_VM_OS_LINUX_ZERO_HPP
> ++#if defined(PPC) && !defined(_LP64)
> ++
> ++#ifndef __NO_FPRS__
> ++#define ATOMIC64_COPY_THROUGH_DOUBLE 1
> ++
> ++#elif defined(__SPE__) && !defined(_SOFT_DOUBLE)
> ++#define ATOMIC64_COPY_THROUGH_DOUBLE 1
> ++
> ++#endif
> ++#endif
> + 
> +   static void setup_fpu() {}
> + 
> +@@ -36,12 +46,23 @@
> + 
> +   // Atomically copy 64 bits of data
> +   static void atomic_copy64(volatile void *src, volatile void *dst) {
> +-#if defined(PPC) && !defined(_LP64)
> +-    double tmp;
> +-    asm volatile ("lfd  %0, 0(%1)\n"
> +-                  "stfd %0, 0(%2)\n"
> +-                  : "=f"(tmp)
> +-                  : "b"(src), "b"(dst));
> ++#if ATOMIC64_COPY_THROUGH_DOUBLE
> ++  /*
> ++   * In order to copy 8 bytes atomicly we rely on the trick that some
> ++   * architectures can load and store a double as a single operation.
> ++   * gcc picks the correct opcode here and with optimization turned on
> ++   * all temporary assignments are gone.                       - bigeasy
> ++   */
> ++   union {
> ++          double *d;
> ++          volatile void *v;
> ++   } s, d;
> ++
> ++   s.v = src;
> ++   d.v = dst;
> ++
> ++   *d.d = *s.d;
> ++
> + #elif defined(S390) && !defined(_LP64)
> +     double tmp;
> +     asm volatile ("ld  %0, 0(%1)\n"
> diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
> index c1861b6..6e984f6 100644
> --- a/recipes-core/openjdk/openjdk-6-common.inc
> +++ b/recipes-core/openjdk/openjdk-6-common.inc
> @@ -10,7 +10,7 @@ ICEDTEA = "NEEDS TO BE SET"
>  S = "${WORKDIR}/${ICEDTEA}"
>  B = "${S}/build"
>  
> -INC_PR = "r18"
> +INC_PR = "r19"
>  
>  SRC_URI = "\
>    ${ICEDTEA_URI} \
> diff --git a/recipes-core/openjdk/openjdk-6-release-6b24.inc b/recipes-core/openjdk/openjdk-6-release-6b24.inc
> index 00a14c2..b867fb3 100644
> --- a/recipes-core/openjdk/openjdk-6-release-6b24.inc
> +++ b/recipes-core/openjdk/openjdk-6-release-6b24.inc
> @@ -81,6 +81,7 @@ ICEDTEAPATCHES = "\
>  	file://icedtea-fix-xrender.patch;apply=no \
>  	file://icedtea-shark-arm-linux-cpu-detection.patch;apply=no \
>          file://icedtea-zero-hotspotfix.patch;apply=no \
> +        file://icedtea-jdk-powerpc-atomic64.patch;apply=no \
>  	"
>  
>  ICEDTEAPATCHES_append_libc-uclibc = " \
> @@ -105,6 +106,7 @@ DISTRIBUTION_PATCHES = "\
>  	patches/icedtea-fix-xrender.patch \
>  	patches/icedtea-shark-arm-linux-cpu-detection.patch \
>  	patches/icedtea-zero-hotspotfix.patch \
> +	patches/icedtea-jdk-powerpc-atomic64.patch \
>  	"
>  
>  DISTRIBUTION_PATCHES_append_libc-uclibc = "\
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Thanks,

patch is applied to master.

Bye Henning


