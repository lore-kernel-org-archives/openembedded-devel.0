Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SPTwC-00058W-5Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 09:25:24 +0200
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3D00G9YW5NEBN1@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	02 May 2012 02:15:29 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0880E2016E; Wed,
	02 May 2012 03:15:23 -0400 (EDT)
Date: Wed, 02 May 2012 03:15:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120502071523.GC2681@denix.org>
References: <1335819064-29468-1-git-send-email-raj.khem@gmail.com>
	<1335819064-29468-3-git-send-email-raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <1335819064-29468-3-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [toolchain-layer][PATCH 3/3] libgcc-4.5: Fix nativesdk build problem
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
X-List-Received-Date: Wed, 02 May 2012 07:25:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 30, 2012 at 01:51:04PM -0700, Khem Raj wrote:
> We need to use BPN instead of PN so we
> access libgcc and not libgcc-nativesdk
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Tested-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb |   32 +++++++++++--------
>  1 files changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb b/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
> index ecef5e7..3f63931 100644
> --- a/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
> +++ b/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
> @@ -4,11 +4,14 @@ INHIBIT_DEFAULT_DEPS = "1"
>  
>  DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
>  
> +PKGSUFFIX = ""
> +PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
> +
>  PACKAGES = "\
>    ${PN} \
>    ${PN}-dev \
>    ${PN}-dbg \
> -  libgcov-dev \
> +  libgcov${PKGSUFFIX}-dev \
>    "
>  
>  FILES_${PN} = "${base_libdir}/libgcc*.so.*"
> @@ -16,31 +19,31 @@ FILES_${PN}-dev = " \
>    ${base_libdir}/libgcc*.so \
>    ${libdir}/${TARGET_SYS}/${BINV}/crt* \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
> -FILES_libgcov-dev = " \
> -  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a"
> -
> +FILES_libgcov${PKGSUFFIX}-dev = " \
> +  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
> +  "
>  FILES_${PN}-dbg += "${base_libdir}/.debug/"
>  
>  do_configure () {
>  	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-nativesdk##`
>  	install -d ${D}${base_libdir} ${D}${libdir}
>  	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B}
> -	mkdir -p ${B}/${PN}
> -	cd ${B}/${PN}
> -	chmod a+x ${S}/${PN}/configure
> -	${S}/${PN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
> +	mkdir -p ${B}/${BPN}
> +	cd ${B}/${BPN}
> +	chmod a+x ${S}/${BPN}/configure
> +	${S}/${BPN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
>  }
>  
>  do_compile () {
>  	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
> -	cd ${B}/${PN}
> -	oe_runmake MULTIBUILDTOP=${B}/$target/${PN}/
> +	cd ${B}/${BPN}
> +	oe_runmake MULTIBUILDTOP=${B}/$target/${BPN}/
>  }
>  
>  do_install () {
>  	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
> -	cd ${B}/${PN}
> -	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${PN}/ install
> +	cd ${B}/${BPN}
> +	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${BPN}/ install
>  
>  	# Move libgcc_s into /lib
>  	mkdir -p ${D}${base_libdir}
> @@ -63,5 +66,6 @@ do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
>  
>  BBCLASSEXTEND = "nativesdk"
>  
> -INSANE_SKIP_libgcc-dev = "staticdev"
> -INSANE_SKIP_libgcov-dev = "staticdev"
> +INSANE_SKIP_${PN}-dev = "staticdev"
> +INSANE_SKIP_libgcov${PKGSUFFIX}-dev = "staticdev"
> +
> -- 
> 1.7.5.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


