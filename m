Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PzxG5-0003o6-0x
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 21:23:53 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI6003X138DTCX0@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Mar 2011 15:21:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8430914AF6C; Wed,
	16 Mar 2011 16:21:49 -0400 (EDT)
Date: Wed, 16 Mar 2011 16:21:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110316202149.GH3042@denix.org>
References: <cover.1300293663.git.bengardiner@nanometrics.ca>
	<a96c10d6cff4f8298c43eccd9139dd20d41a4cc8.1300293663.git.bengardiner@nanometrics.ca>
MIME-version: 1.0
In-reply-to: <a96c10d6cff4f8298c43eccd9139dd20d41a4cc8.1300293663.git.bengardiner@nanometrics.ca>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [2010.03-maintenance] [PATCH 4/7] external-toolchain-csl:	allow linux-libc-headers
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
X-List-Received-Date: Wed, 16 Mar 2011 20:23:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 16, 2011 at 12:50:37PM -0400, Ben Gardiner wrote:
> If PREFERRED_PROVIDER_linux-libc-headers is defined as anything
> other than external-toolchain-csl then don't PROVIDE, install or
> stage the linux headers packaged with the CSL toolchain.
> 
> (Updated by Tom Rini to not modify local.conf.sample yet and to use
> cp + rm -rf rather than rsync)
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> Tested-by: Andrea Galbusera <gizero@gmail.com>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> (cherry picked from commit 3116ad58e507c6e5dc7b7249f521c395db586b9f)
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  recipes/meta/external-toolchain-csl.bb |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/meta/external-toolchain-csl.bb b/recipes/meta/external-toolchain-csl.bb
> index 2e109c8..0761cf2 100644
> --- a/recipes/meta/external-toolchain-csl.bb
> +++ b/recipes/meta/external-toolchain-csl.bb
> @@ -1,4 +1,4 @@
> -PR = "r7"
> +PR = "r8"
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  
> @@ -21,9 +21,10 @@ PROVIDES = "\
>  	virtual/libintl \
>  	virtual/libiconv \
>  	glibc-thread-db \
> -	linux-libc-headers \
> +	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', 'linux-libc-headers', '', d)} \
>  "
>  
> +DEPENDS = "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'linux-libc-headers', d)}"
>  RPROVIDES_glibc-dev += "libc-dev libc6-dev virtual-libc-dev"
>  PACKAGES_DYNAMIC += "glibc-gconv-*"
>  PACKAGES_DYNAMIC += "glibc-locale-*"
> @@ -35,7 +36,7 @@ PACKAGES = "\
>  	libgcc-dev \
>  	libstdc++ \
>  	libstdc++-dev \
> -	linux-libc-headers \
> +	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', 'linux-libc-headers', '', d)} \
>  	glibc-dbg \
>  	glibc \
>  	catchsegv \
> @@ -214,6 +215,7 @@ do_install() {
>  	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/sbin/* ${D}${base_sbindir} \
>  		|| true
>  	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/* ${D}/usr
> +	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'rm -rf ${D}/usr/include/linux', d)}
>  	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${D}/usr/include
>  
>  	rm -rf ${D}${bindir}/gdbserver
> @@ -227,6 +229,7 @@ do_stage() {
>  	install -d ${STAGING_DIR_TARGET}${base_libdir}
>  
>  	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/include/* ${STAGING_INCDIR}
> +	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'rm -rf ${D}/usr/include/linux', d)}
>  	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${STAGING_INCDIR}
>  	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/lib/* ${STAGING_LIBDIR}
>  	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/lib/* ${STAGING_DIR_TARGET}${base_libdir}
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


