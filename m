Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PzxGL-0003oH-4N
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 21:24:09 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI600JIM38VLUN2@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Mar 2011 15:22:13 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 16BDC14AF6A; Wed,
	16 Mar 2011 16:22:07 -0400 (EDT)
Date: Wed, 16 Mar 2011 16:22:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110316202207.GJ3042@denix.org>
References: <cover.1300293663.git.bengardiner@nanometrics.ca>
	<2641cb6d7e2db1dcd2608bae7d84909915b1f023.1300293663.git.bengardiner@nanometrics.ca>
MIME-version: 1.0
In-reply-to: <2641cb6d7e2db1dcd2608bae7d84909915b1f023.1300293663.git.bengardiner@nanometrics.ca>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [2010.03-maintenance] [PATCH 6/7] external-toolchain-csl:	handle packaging of gdbserver based on PREFERRED_PROVIDER
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
X-List-Received-Date: Wed, 16 Mar 2011 20:24:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 16, 2011 at 12:50:39PM -0400, Ben Gardiner wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Allow packaging independent copy of specific version of gdbserver with
> external-toolchain-csl by setting PREFERRED_PROVIDER. E.g. for GPLv2
> gdbserver, add these lines to your distro/local.conf:
> 
> PREFERRED_PROVIDER_gdbserver = "gdbserver"
> PREFERRED_VERSION_gdbserver = "6.6"
> 
> Thanks to Ben Gardiner for providing valuable feedback.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> (cherry picked from commit a47c14c83cf97a2c90ee50ec7212ec33bdafb58b)
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  recipes/meta/external-toolchain-csl.bb |   11 ++++++-----
>  1 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes/meta/external-toolchain-csl.bb b/recipes/meta/external-toolchain-csl.bb
> index e56b74f..619658e 100644
> --- a/recipes/meta/external-toolchain-csl.bb
> +++ b/recipes/meta/external-toolchain-csl.bb
> @@ -1,4 +1,4 @@
> -PR = "r9"
> +PR = "r10"
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  
> @@ -23,7 +23,7 @@ PROVIDES = "\
>  	virtual/libiconv \
>  	glibc-thread-db \
>  	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', 'linux-libc-headers', '', d)} \
> -	gdbserver \
> +	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'external-toolchain-csl', 'gdbserver', '', d)} \
>  "
>  
>  DEPENDS = "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'linux-libc-headers', d)}"
> @@ -39,6 +39,7 @@ PACKAGES = "\
>  	libstdc++ \
>  	libstdc++-dev \
>  	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', 'linux-libc-headers', '', d)} \
> +	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'external-toolchain-csl', 'gdbserver', '', d)} \
>  	glibc-dbg \
>  	glibc \
>  	catchsegv \
> @@ -46,7 +47,6 @@ PACKAGES = "\
>  	nscd \
>  	ldd \
>  	localedef \
> -	gdbserver \
>  	glibc-utils \
>  	glibc-dev \
>  	glibc-locale \
> @@ -176,10 +176,10 @@ CSL_VER_MAIN := "${@csl_get_main_version(d)}"
>  CSL_VER_GCC := "${@csl_get_gcc_version(d)}"
>  CSL_VER_LIBC := "${@csl_get_libc_version(d)}"
>  CSL_VER_KERNEL := "${@csl_get_kernel_version(d)}"
> +CSL_VER_GDBSERVER := "${@csl_get_gdb_version(d)}"
>  CSL_LIC_LIBC := "LGPLv2.1+"
>  CSL_LIC_RLE := "${@["GPLv3 with GCC RLE", "GPLv2 with GCC RLE"][csl_get_main_version(d) <= "2007q3-51"]}"
> -CSL_VER_GDBSERVER := "${@csl_get_gdb_version(d)}"
> -CSL_LIC_GDBSERVER := "${@["GNU GPL version 2", "GNU GPL version 3 or later"][csl_get_gdb_version(d) >= "6.7.1"]}"
> +CSL_LIC_GDBSERVER := "${@["GPLv2+", "GPLv3+"][csl_get_gdb_version(d) >= "6.7.1"]}"
>  
>  PKGV = "${CSL_VER_MAIN}"
>  PKGV_libgcc = "${CSL_VER_GCC}"
> @@ -231,6 +231,7 @@ do_install() {
>  	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/* ${D}/usr
>  	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'rm -rf ${D}/usr/include/linux', d)}
>  	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${D}/usr/include
> +	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'external-toolchain-csl', '', 'rm -rf ${D}/usr/bin/gdbserver', d)}
>  
>  	rm -rf ${D}${sysconfdir}/rpc
>  	rm -rf ${D}${datadir}/zoneinfo
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


