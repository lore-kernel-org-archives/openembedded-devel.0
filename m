Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PuuZJ-0006gi-G3
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 23:30:53 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PuuXt-0001II-Iu from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 14:29:25 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 2 Mar 2011 14:29:25 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Wed, 2 Mar 2011 14:29:24 -0800
Message-ID: <4D6EC4B0.5090608@mentor.com>
Date: Wed, 2 Mar 2011 15:29:04 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
	<1299095753-324-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1299095753-324-1-git-send-email-Martin.Jansa@gmail.com>
X-OriginalArrivalTime: 02 Mar 2011 22:29:25.0228 (UTC)
	FILETIME=[49071AC0:01CBD929]
Subject: Re: [PATCHv2] sane-toolchain-*: define DEBUG_FLAGS and add it to	FULL_OPTIMIZATION to make -dbg packages more usefull
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
X-List-Received-Date: Wed, 02 Mar 2011 22:30:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2011 12:55 PM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>   conf/bitbake.conf                                  |    5 +++--
>   conf/distro/include/sane-toolchain-eglibc.inc      |   12 ++++++------
>   conf/distro/include/sane-toolchain-glibc.inc       |   10 +++++-----
>   conf/distro/include/sane-toolchain-uclibc.inc      |    6 +++---
>   .../include/sane-toolchain-uclinux-uclibc.inc      |    2 +-
>   5 files changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 0c11cdb..f23dd05 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -543,10 +543,11 @@ EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "
>   # Optimization flags.
>   ##################################################################
>
> +DEBUG_FLAGS = "-g"
>   FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
> -DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer -g"
> +DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS}"
>   SELECTED_OPTIMIZATION = "${@bb.data.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTIMIZATION'][bb.data.getVar('DEBUG_BUILD', d, 1) == '1'], d, 1)}"
> -BUILD_OPTIMIZATION = "-O2 -g"
> +BUILD_OPTIMIZATION = "-O2 ${DEBUG_FLAGS}"
>
>   ##################################################################
>   # Bootstrap stuff.
> diff --git a/conf/distro/include/sane-toolchain-eglibc.inc b/conf/distro/include/sane-toolchain-eglibc.inc
> index daab0f8..d38ca5d 100644
> --- a/conf/distro/include/sane-toolchain-eglibc.inc
> +++ b/conf/distro/include/sane-toolchain-eglibc.inc
> @@ -3,20 +3,20 @@
>   # eglibc:
>   # [23:00] oxo: glibc (any version) on sparc does not like (repeat me) "-Os"
>
> -FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
> -FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1"
> -FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
> +FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os ${DEBUG_FLAGS}"
> +FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 ${DEBUG_FLAGS}"
> +FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 ${DEBUG_FLAGS}"
>
>   # gcc 4.4 and 4.5 has a problem with 'leakage' into libgcc.a with -Os
> -FULL_OPTIMIZATION_powerpc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
> +FULL_OPTIMIZATION_powerpc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 ${DEBUG_FLAGS}"
>
>   # JaMa: I promise to report bug upstream, but as it can take a while to fix it, I'll switch to -O2 here
>   # Tested with gcc-4.4.2 and gcc-4.4.3 on armv4t and armv5te and it fails with -Os, with gcc-4.3.3 it works OK with -Os
>   # Here is testcase, but you have to rebuild whole libqtxml to test it
>   # http://lists.shr-project.org/pipermail/shr-devel/2010-February/002169.html
> -FULL_OPTIMIZATION_pn-qt4-x11-free = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
> +FULL_OPTIMIZATION_pn-qt4-x11-free = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 ${DEBUG_FLAGS}"
>   # This I've seen only on armv4t, it segfaults when called from pisi, but whole test unit suite can pass
> -FULL_OPTIMIZATION_pn-libsyncml = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
> +FULL_OPTIMIZATION_pn-libsyncml = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 ${DEBUG_FLAGS}"
>
>   BUILD_OPTIMIZATION_pn-perl = "-O1"
>   BUILD_OPTIMIZATION_sparc = "-O2"
> diff --git a/conf/distro/include/sane-toolchain-glibc.inc b/conf/distro/include/sane-toolchain-glibc.inc
> index 770aa87..29c201b 100644
> --- a/conf/distro/include/sane-toolchain-glibc.inc
> +++ b/conf/distro/include/sane-toolchain-glibc.inc
> @@ -7,14 +7,14 @@
>   # perl has some problems, see http://bugs.openembedded.net/show_bug.cgi?id=1616
>   # [23:00] oxo: glibc (any version) on sparc does not like (repeat me) "-Os"
>
> -FULL_OPTIMIZATION = "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2"
> +FULL_OPTIMIZATION = "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 ${DEBUG_FLAGS}"
>
> -FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1"
> -FULL_OPTIMIZATION_pn-glibc = "-fexpensive-optimizations -fomit-frame-pointer -O2"
> -FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
> +FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 ${DEBUG_FLAGS}"
> +FULL_OPTIMIZATION_pn-glibc = "-fexpensive-optimizations -fomit-frame-pointer -O2 ${DEBUG_FLAGS}"
> +FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 ${DEBUG_FLAGS}"
>
>   # gcc 4.4 and 4.5 has a problem with 'leakage' into libgcc.a with -Os
> -FULL_OPTIMIZATION_powerpc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
> +FULL_OPTIMIZATION_powerpc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 ${DEBUG_FLAGS}"
>
>   BUILD_OPTIMIZATION_pn-perl = "-O1"
>   BUILD_OPTIMIZATION_pn-glibc = "-O2"
> diff --git a/conf/distro/include/sane-toolchain-uclibc.inc b/conf/distro/include/sane-toolchain-uclibc.inc
> index b61ee36..b51cdaf 100644
> --- a/conf/distro/include/sane-toolchain-uclibc.inc
> +++ b/conf/distro/include/sane-toolchain-uclibc.inc
> @@ -23,12 +23,12 @@ PREFERRED_VERSION_uclibc-cross-intermediate ?= "${PREFERRED_UCLIBC_VERSION}"
>
>   #mess with compiler flags to use -Os instead of -O2
>   #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
> -FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe"
> +FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe ${DEBUG_FLAGS}"
>   BUILD_OPTIMIZATION += "-pipe"
>
>   # -Os compiled root file system does not boot for powerpc, root cause it still at large
>   # we use -O2 meanwhile
> -FULL_OPTIMIZATION_powerpc = "-O2 -pipe"
> +FULL_OPTIMIZATION_powerpc = "-O2 -pipe ${DEBUG_FLAGS}"
>
>   #Gcc will die with 'internal consistency error when using the above optimizations
>   #with gcc-4.2.1-atmel.1.0.3 (and probably most other avr32 gcc ports).
> @@ -38,7 +38,7 @@ FULL_OPTIMIZATION_powerpc = "-O2 -pipe"
>   #it was removed while debugging an issue that ultimately turned out to be due
>   #to the ICE fixed by gcc-pr32889.patch.  It needs to be tested again.
>   #Note that this testing was done without the gcc-pr32889.patch.
> -FULL_OPTIMIZATION_avr32 = "-Os -fomit-frame-pointer"
> +FULL_OPTIMIZATION_avr32 = "-Os -fomit-frame-pointer ${DEBUG_FLAGS}"
>
>   TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]}"
>
> diff --git a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
> index a1e7df0..8ebaf15 100644
> --- a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
> +++ b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
> @@ -9,7 +9,7 @@ USE_NLS_gcc-cross = "no"
>
>   #mess with compiler flags to use -Os instead of -O2
>   #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
> -FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe"
> +FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe ${DEBUG_FLAGS}"
>   BUILD_OPTIMIZATION = "-Os"
>
>   #Gcc will die with 'internal consistency error when using the above optimizations


-- 
Tom Rini
Mentor Graphics Corporation


