Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1ObhDy-0001oG-EH
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 23:53:27 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1ObhDm-0007JZ-0U from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 14:52:58 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 21 Jul 2010 14:52:57 -0700
Received: from [172.30.80.5] ([172.30.80.5]) by na2-mail.mgc.mentorg.com with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 21 Jul 2010 15:52:56 -0600
Message-ID: <4C476C30.8020908@mentor.com>
Date: Wed, 21 Jul 2010 14:52:48 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
	<1279735486-7050-3-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1279735486-7050-3-git-send-email-raj.khem@gmail.com>
X-OriginalArrivalTime: 21 Jul 2010 21:52:56.0507 (UTC)
	FILETIME=[13EAC8B0:01CB291F]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/4] toolchain: Remove references to CROSS_DIR
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
X-List-Received-Date: Wed, 21 Jul 2010 21:53:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> * Toolchain is installed into native sysroot now.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  recipes/binutils/binutils-cross.inc                |   20 +++++++++---------
>  recipes/eglibc/eglibc-package.bbclass              |    4 +-
>  recipes/gcc/gcc-configure-sdk.inc                  |   22 ++++++++++----------
>  recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb    |    4 +-
>  .../gcc/gcc-cross-intermediate_csl-arm-2007q3.bb   |    4 +-
>  recipes/gcc/gcc-cross-kernel.inc                   |    2 +-
>  recipes/gcc/gcc-cross-sdk_3.4.4.bb                 |    4 +-
>  recipes/gcc/gcc-cross_csl-arm-2007q3.bb            |    6 ++--
>  recipes/gcc/gcc-cross_csl-arm-2008q1.bb            |    6 ++--
>  recipes/gcc/gcc-cross_csl-arm-2008q3.bb            |    6 ++--
>  recipes/gcc/gcc-package-cross.inc                  |    8 +++---
>  11 files changed, 43 insertions(+), 43 deletions(-)
> 
> diff --git a/recipes/binutils/binutils-cross.inc b/recipes/binutils/binutils-cross.inc
> index 432e1a7..f3ba5c3 100644
> --- a/recipes/binutils/binutils-cross.inc
> +++ b/recipes/binutils/binutils-cross.inc
> @@ -16,14 +16,14 @@ do_install () {
>  	${D}${libdir}/libiberty_pic.a
>  
>  	# We don't really need these, so we'll remove them...
> -	rm -rf ${D}${CROSS_DIR}/lib/ldscripts
> -	rm -rf ${D}${CROSS_DIR}/share/info
> -	rm -rf ${D}${CROSS_DIR}/share/locale
> -	rm -rf ${D}${CROSS_DIR}/share/man
> -	rmdir ${D}${CROSS_DIR}/share || :
> -	rmdir ${D}${CROSS_DIR}/${libdir}/gcc-lib || :
> -	rmdir ${D}${CROSS_DIR}/${libdir}64/gcc-lib || :
> -	rmdir ${D}${CROSS_DIR}/${libdir} || :
> -	rmdir ${D}${CROSS_DIR}/${libdir}64 || :
> -	rmdir ${D}${CROSS_DIR}/${prefix} || :
> +	rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/lib/ldscripts
> +	rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/share/info
> +	rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/share/locale
> +	rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/share/man
> +	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/share || :
> +	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir}/gcc-lib || :
> +	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir}64/gcc-lib || :
> +	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir} || :
> +	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir}64 || :
> +	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${prefix} || :
>  }
> diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
> index 3dc97b4..4e286af 100644
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ b/recipes/eglibc/eglibc-package.bbclass
> @@ -169,8 +169,8 @@ do_prep_locale_tree() {
>  		gunzip $i
>  	done
>  	ls -d ${PKGD}${base_libdir}/* | xargs -iBLAH cp -pPR BLAH $treedir/lib
> -	if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.* ]; then
> -		cp -pPR ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.* $treedir/lib
> +	if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.* ]; then
> +		cp -pPR ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.* $treedir/lib
>  	fi
>  	install -m 0755 ${PKGD}${bindir}/localedef $treedir/bin
>  }
> diff --git a/recipes/gcc/gcc-configure-sdk.inc b/recipes/gcc/gcc-configure-sdk.inc
> index 205b106..d5a5942 100644
> --- a/recipes/gcc/gcc-configure-sdk.inc
> +++ b/recipes/gcc/gcc-configure-sdk.inc
> @@ -5,23 +5,23 @@ USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
>  USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibceabi", "no", "", d )}'
>  
>  EXTRA_OECONF_PATHS = "--with-sysroot=${prefix}/${TARGET_SYS} \
> -                      --with-build-time-tools=${CROSS_DIR}/${TARGET_SYS}/bin \
> +                      --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
>                        --with-build-sysroot=${STAGING_DIR_TARGET}"
>  
>  #
>  # gcc-cross looks and finds these in ${exec_prefix} but we're not so lucky
>  # for the sdk. Hardcoding the paths ensures the build doesn't go canadian or worse.
>  #
> -export AR_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/ar"
> -export AS_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/as"
> -export DLLTOOL_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/dlltool"
> -export LD_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/ld"
> -export LIPO_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/lipo"
> -export NM_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/nm"
> -export OBJDUMP_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/objdump"
> -export RANLIB_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/ranlib"
> -export STRIP_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/strip"
> -export WINDRES_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/windres"
> +export AR_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/ar"
> +export AS_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/as"
> +export DLLTOOL_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/dlltool"
> +export LD_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/ld"
> +export LIPO_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/lipo"
> +export NM_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/nm"
> +export OBJDUMP_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/objdump"
> +export RANLIB_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/ranlib"
> +export STRIP_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/strip"
> +export WINDRES_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/windres"
>  
>  #
>  # We need to override this and make sure the compiler can find staging
> diff --git a/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
> index 908b612..dd60164 100644
> --- a/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
> +++ b/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
> @@ -5,6 +5,6 @@ S = "${WORKDIR}/gcc-4.2"
>  
>  # Hack till we fix *libc properly
>  do_install_append() {
> -	install -d ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
> -	ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
> +	install -d ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include/
> +	ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include/
>  }
> diff --git a/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
> index 89e6a85..b9b34b6 100644
> --- a/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
> +++ b/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
> @@ -5,6 +5,6 @@ S = "${WORKDIR}/gcc-4.2"
>  
>  # Hack till we fix *libc properly
>  do_install_append() {
> -	install -d ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include
> -	ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
> +	install -d ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include
> +	ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include/
>  }
> diff --git a/recipes/gcc/gcc-cross-kernel.inc b/recipes/gcc/gcc-cross-kernel.inc
> index c0a8de7..e6f1fb8 100644
> --- a/recipes/gcc/gcc-cross-kernel.inc
> +++ b/recipes/gcc/gcc-cross-kernel.inc
> @@ -19,5 +19,5 @@ do_compile () {
>  do_stage () {
>  	cd gcc
>  	oe_runmake installdirs install-common install-headers install-libgcc
> -	install -m 0755 xgcc ${CROSS_DIR}/bin/${TARGET_PREFIX}gcc-${PV}
> +	install -m 0755 xgcc ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gcc-${PV}
>  }
> diff --git a/recipes/gcc/gcc-cross-sdk_3.4.4.bb b/recipes/gcc/gcc-cross-sdk_3.4.4.bb
> index 16ca9e4..a885c07 100644
> --- a/recipes/gcc/gcc-cross-sdk_3.4.4.bb
> +++ b/recipes/gcc/gcc-cross-sdk_3.4.4.bb
> @@ -7,7 +7,7 @@ SRC_URI += 'file://sdk-libstdc++-includes.patch'
>  
>  do_compile_prepend () {
>  	mkdir -p gcc
> -	ln -s ${CROSS_DIR}/bin/${TARGET_PREFIX}as gcc/as 
> -	ln -s ${CROSS_DIR}/bin/${TARGET_PREFIX}ld gcc/ld
> +	ln -s ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}as gcc/as 
> +	ln -s ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}ld gcc/ld
>  }
>  
> diff --git a/recipes/gcc/gcc-cross_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
> index 945e8ac..70c869e 100644
> --- a/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
> +++ b/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
> @@ -14,9 +14,9 @@ LDFLAGS = ""
>  
>  # staging-linkage and cross-linkage recipes don't work anymore, so do it by hand for this backwards CSL toolchain
>  do_compile_prepend() {
> -	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${CROSS_DIR}/${TARGET_SYS}/lib/
> -	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${CROSS_DIR}/${TARGET_SYS}/lib/
> -	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${CROSS_DIR}/${TARGET_SYS}/lib/ 
> +	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
> +	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
> +	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/ 
>  	sed -i -e 's:gcc_no_link=yes:gcc_no_link=no:' ${S}/libstdc++-v3/configure
>  
>  }
> diff --git a/recipes/gcc/gcc-cross_csl-arm-2008q1.bb b/recipes/gcc/gcc-cross_csl-arm-2008q1.bb
> index a3edb28..7ed0f51 100644
> --- a/recipes/gcc/gcc-cross_csl-arm-2008q1.bb
> +++ b/recipes/gcc/gcc-cross_csl-arm-2008q1.bb
> @@ -14,9 +14,9 @@ LDFLAGS = ""
>  
>  # staging-linkage and cross-linkage recipes don't work anymore, so do it by hand for this backwards CSL toolchain
>  do_compile_prepend() {
> -	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${CROSS_DIR}/${TARGET_SYS}/lib/
> -	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${CROSS_DIR}/${TARGET_SYS}/lib/
> -	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${CROSS_DIR}/${TARGET_SYS}/lib/ 
> +	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
> +	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
> +	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/ 
>  	sed -i -e 's:gcc_no_link=yes:gcc_no_link=no:' ${S}/libstdc++-v3/configure
>  
>  }
> diff --git a/recipes/gcc/gcc-cross_csl-arm-2008q3.bb b/recipes/gcc/gcc-cross_csl-arm-2008q3.bb
> index 88b222e..9ada568 100644
> --- a/recipes/gcc/gcc-cross_csl-arm-2008q3.bb
> +++ b/recipes/gcc/gcc-cross_csl-arm-2008q3.bb
> @@ -14,9 +14,9 @@ LDFLAGS = ""
>  
>  # staging-linkage and cross-linkage recipes don't work anymore, so do it by hand for this backwards CSL toolchain
>  do_compile_prepend() {
> -	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${CROSS_DIR}/${TARGET_SYS}/lib/
> -	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${CROSS_DIR}/${TARGET_SYS}/lib/
> -	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${CROSS_DIR}/${TARGET_SYS}/lib/ 
> +	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
> +	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
> +	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/ 
>  	sed -i -e 's:gcc_no_link=yes:gcc_no_link=no:' ${S}/libstdc++-v3/configure
>  
>  }
> diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
> index 95936ed..6978340 100644
> --- a/recipes/gcc/gcc-package-cross.inc
> +++ b/recipes/gcc/gcc-package-cross.inc
> @@ -38,12 +38,12 @@ do_install () {
>       
>  	# Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
>  	# gfortran is fully backwards compatible. This is a safe and practical solution.
> -	if [ -f ${D}${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
> +	if [ -f ${D}${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gfortran ]; then
>  		currdir="$PWD"
> -		cd ${D}${CROSS_DIR}/bin/
> +		cd ${D}${STAGING_DIR_NATIVE}${prefix_native}/bin/
>  		ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g77 || true
> -		if [ -d ${CROSS_DIR}/${TARGET_SYS}/bin/ ] ; then 
> -			cd ${CROSS_DIR}/${TARGET_SYS}/bin/
> +		if [ -d ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/ ] ; then 
> +			cd ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/
>  			ln -sf gfortran g77 || true
>  		fi
>  		cd $currdir


-- 
Tom Rini
Mentor Graphics Corporation


