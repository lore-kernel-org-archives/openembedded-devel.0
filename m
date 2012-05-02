Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SPTvj-00057n-8x
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 09:24:55 +0200
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3D009TCW4V10E1@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	02 May 2012 02:14:56 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E03F22016E; Wed,
	02 May 2012 03:14:55 -0400 (EDT)
Date: Wed, 02 May 2012 03:14:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120502071455.GA2681@denix.org>
References: <1335819064-29468-1-git-send-email-raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <1335819064-29468-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [toolchain-layer][PATCH 1/3] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
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
X-List-Received-Date: Wed, 02 May 2012 07:24:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Darn it! I wasted too much time today trying to debug this recent breakage in 
gcc-runtime-4.5, before seeing these patches. It was failing like this:

checking dynamic linker characteristics... configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.

Now it works again!

> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Tested-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb |   47 +++++++++++++++-----
>  1 files changed, 36 insertions(+), 11 deletions(-)
> 
> diff --git a/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb b/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
> index 1579c8b..ecef5e7 100644
> --- a/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
> +++ b/toolchain-layer/recipes-devtools/gcc/libgcc_4.5.bb
> @@ -1,33 +1,46 @@
>  require recipes-devtools/gcc/gcc-${PV}.inc
>  
> -
>  INHIBIT_DEFAULT_DEPS = "1"
> +
>  DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
>  
>  PACKAGES = "\
>    ${PN} \
>    ${PN}-dev \
> +  ${PN}-dbg \
> +  libgcov-dev \
>    "
>  
>  FILES_${PN} = "${base_libdir}/libgcc*.so.*"
>  FILES_${PN}-dev = " \
>    ${base_libdir}/libgcc*.so \
>    ${libdir}/${TARGET_SYS}/${BINV}/crt* \
> -  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
> +FILES_libgcov-dev = " \
> +  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a"
>  
> -do_fetch[noexec] = "1"
> -do_unpack[noexec] = "1"
> -do_patch[noexec] = "1"
> -do_configure[noexec] = "1"
> -do_compile[noexec] = "1"
> +FILES_${PN}-dbg += "${base_libdir}/.debug/"
>  
> -do_install () {
> +do_configure () {
>  	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-nativesdk##`
> -
> -	# Install libgcc from our gcc-cross saved data
>  	install -d ${D}${base_libdir} ${D}${libdir}
> -	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${D}
> +	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B}
> +	mkdir -p ${B}/${PN}
> +	cd ${B}/${PN}
> +	chmod a+x ${S}/${PN}/configure
> +	${S}/${PN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
> +}
> +
> +do_compile () {
> +	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
> +	cd ${B}/${PN}
> +	oe_runmake MULTIBUILDTOP=${B}/$target/${PN}/
> +}
> +
> +do_install () {
> +	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
> +	cd ${B}/${PN}
> +	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${PN}/ install
>  
>  	# Move libgcc_s into /lib
>  	mkdir -p ${D}${base_libdir}
> @@ -36,7 +49,19 @@ do_install () {
>  	else
>  		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
>  	fi
> +
> +	# install the runtime in /usr/lib/ not in /usr/lib/gcc on target
> +	# so that cross-gcc can find it in the sysroot
> +
> +	mv ${D}${libdir}/gcc/* ${D}${libdir}
> +	rm -rf ${D}${libdir}/gcc/
>  }
>  
> +do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_package"
> +do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_package"
> +do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
> +
>  BBCLASSEXTEND = "nativesdk"
>  
> +INSANE_SKIP_libgcc-dev = "staticdev"
> +INSANE_SKIP_libgcov-dev = "staticdev"
> -- 
> 1.7.5.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


