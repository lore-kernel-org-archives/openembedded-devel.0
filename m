Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MARmF-0001Q3-1x
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 18:51:23 +0200
Received: (qmail 27445 invoked from network); 30 May 2009 16:42:50 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 May 2009 09:42:50 -0700
Date: Sat, 30 May 2009 09:42:49 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090530164249.GG23842@smtp.west.cox.net>
References: <Pine.LNX.4.64.0905260228240.6446@juice.ott.cti.com>
	<1243319696-16223-1-git-send-email-msmith@cbnco.com>
	<1243319696-16223-2-git-send-email-msmith@cbnco.com>
	<1243319696-16223-3-git-send-email-msmith@cbnco.com>
	<1243319696-16223-4-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <1243319696-16223-4-git-send-email-msmith@cbnco.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 4/4] uclibc: remove calls to obsolete	base_set_filespath()
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
X-List-Received-Date: Sat, 30 May 2009 16:51:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2009 at 02:34:56AM -0400, Michael Smith wrote:

> Some recipes can use the default FILESPATHPKG, others need to override.
> 
> Signed-off-by: Michael Smith <msmith@cbnco.com>

Acked-by: Tom Rini <trini@embeddedalley.com>

> ---
> 
> All untested.
> 
>  recipes/uclibc/bfin-uclibc_svn.bb         |    2 +-
>  recipes/uclibc/uclibc-initial_0.9.26.bb   |    2 --
>  recipes/uclibc/uclibc-initial_0.9.27.bb   |    2 --
>  recipes/uclibc/uclibc-initial_0.9.28.bb   |    2 --
>  recipes/uclibc/uclibc-initial_0.9.29.bb   |    2 --
>  recipes/uclibc/uclibc-initial_0.9.30.1.bb |    2 --
>  recipes/uclibc/uclibc-initial_0.9.30.bb   |    2 --
>  recipes/uclibc/uclibc_nptl.bb             |    2 +-
>  recipes/uclibc/uclibc_svn.bb              |    2 +-
>  9 files changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/recipes/uclibc/bfin-uclibc_svn.bb b/recipes/uclibc/bfin-uclibc_svn.bb
> index 9b438a2..9305245 100644
> --- a/recipes/uclibc/bfin-uclibc_svn.bb
> +++ b/recipes/uclibc/bfin-uclibc_svn.bb
> @@ -25,7 +25,7 @@ KERNEL_SOURCE = "${CROSS_DIR}/${TARGET_SYS}"
>  SRC_URI = "svn://sources.blackfin.uclinux.org/toolchain/trunk;module=uClibc "
>  SRC_URI += "file://uClibc.machine file://uClibc.distro"
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${UCLIBC_BASE}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> +FILESPATHPKG =. "uclibc-${UCLIBC_BASE}:uclibc:"
>  
>  
>  S = "${WORKDIR}/uClibc"
> diff --git a/recipes/uclibc/uclibc-initial_0.9.26.bb b/recipes/uclibc/uclibc-initial_0.9.26.bb
> index a6a83bd..d36a647 100644
> --- a/recipes/uclibc/uclibc-initial_0.9.26.bb
> +++ b/recipes/uclibc/uclibc-initial_0.9.26.bb
> @@ -1,8 +1,6 @@
>  SECTION = "base"
>  require uclibc_${PV}.bb
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> -
>  DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
>  PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
>  PACKAGES = ""
> diff --git a/recipes/uclibc/uclibc-initial_0.9.27.bb b/recipes/uclibc/uclibc-initial_0.9.27.bb
> index 3aecd80..f48e81d 100644
> --- a/recipes/uclibc/uclibc-initial_0.9.27.bb
> +++ b/recipes/uclibc/uclibc-initial_0.9.27.bb
> @@ -1,8 +1,6 @@
>  SECTION = "base"
>  require uclibc_${PV}.bb
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> -
>  DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
>  PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
>  PACKAGES = ""
> diff --git a/recipes/uclibc/uclibc-initial_0.9.28.bb b/recipes/uclibc/uclibc-initial_0.9.28.bb
> index b996f64..dbd90fc 100644
> --- a/recipes/uclibc/uclibc-initial_0.9.28.bb
> +++ b/recipes/uclibc/uclibc-initial_0.9.28.bb
> @@ -1,8 +1,6 @@
>  SECTION = "base"
>  require uclibc_${PV}.bb
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> -
>  DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
>  PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
>  PACKAGES = ""
> diff --git a/recipes/uclibc/uclibc-initial_0.9.29.bb b/recipes/uclibc/uclibc-initial_0.9.29.bb
> index c56e5fb..98ef7b2 100644
> --- a/recipes/uclibc/uclibc-initial_0.9.29.bb
> +++ b/recipes/uclibc/uclibc-initial_0.9.29.bb
> @@ -1,8 +1,6 @@
>  SECTION = "base"
>  require uclibc_${PV}.bb
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> -
>  DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
>  PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
>  PACKAGES = ""
> diff --git a/recipes/uclibc/uclibc-initial_0.9.30.1.bb b/recipes/uclibc/uclibc-initial_0.9.30.1.bb
> index c56e5fb..98ef7b2 100644
> --- a/recipes/uclibc/uclibc-initial_0.9.30.1.bb
> +++ b/recipes/uclibc/uclibc-initial_0.9.30.1.bb
> @@ -1,8 +1,6 @@
>  SECTION = "base"
>  require uclibc_${PV}.bb
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> -
>  DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
>  PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
>  PACKAGES = ""
> diff --git a/recipes/uclibc/uclibc-initial_0.9.30.bb b/recipes/uclibc/uclibc-initial_0.9.30.bb
> index c56e5fb..98ef7b2 100644
> --- a/recipes/uclibc/uclibc-initial_0.9.30.bb
> +++ b/recipes/uclibc/uclibc-initial_0.9.30.bb
> @@ -1,8 +1,6 @@
>  SECTION = "base"
>  require uclibc_${PV}.bb
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> -
>  DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
>  PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
>  PACKAGES = ""
> diff --git a/recipes/uclibc/uclibc_nptl.bb b/recipes/uclibc/uclibc_nptl.bb
> index 18c88c8..ba46a50 100644
> --- a/recipes/uclibc/uclibc_nptl.bb
> +++ b/recipes/uclibc/uclibc_nptl.bb
> @@ -19,7 +19,7 @@ PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
>  
>  #recent versions uclibc require real kernel headers
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-nptl', '${FILE_DIRNAME}/uclibc-${UCLIBC_BASE}', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> +FILESPATHPKG =. "uclibc-nptl:uclibc-${UCLIBC_BASE}:"
>  
>  #as stated above, uclibc needs real kernel-headers
>  #however: we can't depend on virtual/kernel when nptl hits due to depends deadlocking ....
> diff --git a/recipes/uclibc/uclibc_svn.bb b/recipes/uclibc/uclibc_svn.bb
> index 127cea7..d3f0973 100644
> --- a/recipes/uclibc/uclibc_svn.bb
> +++ b/recipes/uclibc/uclibc_svn.bb
> @@ -19,7 +19,7 @@ PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
>  
>  #recent versions uclibc require real kernel headers
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-svn', '${FILE_DIRNAME}/uclibc-${UCLIBC_BASE}', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> +FILESPATHPKG =. "uclibc-svn:uclibc-${UCLIBC_BASE}:"
>  
>  #as stated above, uclibc needs real kernel-headers
>  #however: we can't depend on virtual/kernel when nptl hits due to depends deadlocking ....
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Tom Rini


