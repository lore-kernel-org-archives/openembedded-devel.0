Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PzxGO-0003oR-JQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 21:24:12 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI6004ER38MLLQ4@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Mar 2011 15:22:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6076014AF6A; Wed,
	16 Mar 2011 16:21:58 -0400 (EDT)
Date: Wed, 16 Mar 2011 16:21:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110316202158.GI3042@denix.org>
References: <cover.1300293663.git.bengardiner@nanometrics.ca>
	<1775a7d2fdc6b7cc242b2b4e9f0a6516edf0ad83.1300293663.git.bengardiner@nanometrics.ca>
MIME-version: 1.0
In-reply-to: <1775a7d2fdc6b7cc242b2b4e9f0a6516edf0ad83.1300293663.git.bengardiner@nanometrics.ca>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [2010.03-maintenance] [PATCH 5/7] external-toolchain-csl:	Drop do_stage, add gdbserver
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
X-List-Received-Date: Wed, 16 Mar 2011 20:24:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 16, 2011 at 12:50:38PM -0400, Ben Gardiner wrote:
> From: Tom Rini <tom_rini@mentor.com>
> 
> Based on work from Noor Ahsan, we merge the important part of do_stage
> into do_install and then set NATIVE_INSTALL_WORKS.  We also add a function
> for getting the gdb version for packaging up gdbserver and ship that.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> (cherry picked from commit 207971b244ee6958dab1fb41d6f3cd94ac416b73)
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  recipes/meta/external-toolchain-csl.bb |   39 +++++++++++++++++--------------
>  1 files changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/recipes/meta/external-toolchain-csl.bb b/recipes/meta/external-toolchain-csl.bb
> index 0761cf2..e56b74f 100644
> --- a/recipes/meta/external-toolchain-csl.bb
> +++ b/recipes/meta/external-toolchain-csl.bb
> @@ -1,4 +1,4 @@
> -PR = "r8"
> +PR = "r9"
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  
> @@ -6,6 +6,7 @@ INSANE_SKIP_libgcc = "True"
>  INSANE_SKIP_libstdc++ = "True"
>  INSANE_SKIP_nscd = "True"
>  INSANE_SKIP_glibc-utils = "True"
> +INSANE_SKIP_gdbserver = "True"
>  
>  SRC_URI = "file://SUPPORTED"
>  
> @@ -22,6 +23,7 @@ PROVIDES = "\
>  	virtual/libiconv \
>  	glibc-thread-db \
>  	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', 'linux-libc-headers', '', d)} \
> +	gdbserver \
>  "
>  
>  DEPENDS = "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'linux-libc-headers', d)}"
> @@ -44,6 +46,7 @@ PACKAGES = "\
>  	nscd \
>  	ldd \
>  	localedef \
> +	gdbserver \
>  	glibc-utils \
>  	glibc-dev \
>  	glibc-locale \
> @@ -120,6 +123,7 @@ FILES_ldd = "${bindir}/ldd"
>  FILES_nscd = "${sbindir}/nscd*"
>  FILES_sln = "${base_sbindir}/sln"
>  FILES_localedef = "${bindir}/localedef"
> +FILES_gdbserver = "${bindir}/gdbserver"
>  
>  DESCRIPTION_glibc-utils = "glibc: misc utilities like iconf, local, gencat, tzselect, rpcinfo, ..."
>  DESCRIPTION_glibc-extra-nss = "glibc: nis, nisplus and hesiod search services"
> @@ -127,6 +131,7 @@ DESCRIPTION_ldd = "glibc: print shared library dependencies"
>  DESCRIPTION_nscd = "glibc: name service cache daemon for passwd, group, and hosts"
>  DESCRIPTION_sln = "glibc: create symbolic links between files"
>  DESCRIPTION_localedef = "glibc: compile locale definition files"
> +DESCRIPTION_gdbserver = "gdb - GNU debugger"
>  
>  def csl_get_main_version(d):
>  	import subprocess,os,bb
> @@ -162,12 +167,19 @@ def csl_get_kernel_version(d):
>  				return str(maj)+'.'+str(min)+'.'+str(ver)
>  		return None
>  
> +def csl_get_gdb_version(d):
> +	import subprocess,os,bb
> +	if os.path.exists(bb.data.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+bb.data.getVar('TARGET_PREFIX', d, 1)+'gdb'):
> +		return subprocess.Popen([bb.data.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+bb.data.getVar('TARGET_PREFIX', d, 1)+'gdb', '-v'],stdout=subprocess.PIPE).communicate()[0].splitlines()[0].split()[-1]
> +
>  CSL_VER_MAIN := "${@csl_get_main_version(d)}"
>  CSL_VER_GCC := "${@csl_get_gcc_version(d)}"
>  CSL_VER_LIBC := "${@csl_get_libc_version(d)}"
>  CSL_VER_KERNEL := "${@csl_get_kernel_version(d)}"
>  CSL_LIC_LIBC := "LGPLv2.1+"
>  CSL_LIC_RLE := "${@["GPLv3 with GCC RLE", "GPLv2 with GCC RLE"][csl_get_main_version(d) <= "2007q3-51"]}"
> +CSL_VER_GDBSERVER := "${@csl_get_gdb_version(d)}"
> +CSL_LIC_GDBSERVER := "${@["GNU GPL version 2", "GNU GPL version 3 or later"][csl_get_gdb_version(d) >= "6.7.1"]}"
>  
>  PKGV = "${CSL_VER_MAIN}"
>  PKGV_libgcc = "${CSL_VER_GCC}"
> @@ -190,6 +202,7 @@ PKGV_ldd = "${CSL_VER_LIBC}"
>  PKGV_localedef = "${CSL_VER_LIBC}"
>  PKGV_libsegfault = "${CSL_VER_LIBC}"
>  PKGV_linux-libc-headers = "${CSL_VER_KERNEL}"
> +PKGV_gdbserver = "${CSL_VER_GDBSERVER}"
>  
>  LICENSE = "${CSL_LIC_LIBC}"
>  LICENSE_ldd = "${CSL_LIC_LIBC}"
> @@ -199,6 +212,7 @@ LICENSE_libgcc = "${CSL_LIC_RLE}"
>  LICENSE_libgcc-dev = "${CSL_LIC_RLE}"
>  LICENSE_libstdc++ = "${CSL_LIC_RLE}"
>  LICENSE_libstdc++-dev = "${CSL_LIC_RLE}"
> +LICENSE_gdbserver = "${CSL_LIC_GDBSERVER}"
>  
>  do_install() {
>  	install -d ${D}${sysconfdir}
> @@ -218,27 +232,14 @@ do_install() {
>  	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'rm -rf ${D}/usr/include/linux', d)}
>  	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${D}/usr/include
>  
> -	rm -rf ${D}${bindir}/gdbserver
>  	rm -rf ${D}${sysconfdir}/rpc
>  	rm -rf ${D}${datadir}/zoneinfo
> -}
>  
> -do_stage() {
> -	install -d ${STAGING_INCDIR}
> -	install -d ${STAGING_LIBDIR}
> -	install -d ${STAGING_DIR_TARGET}${base_libdir}
> +	sed -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so > ${D}${libdir}/temp
> +	mv ${D}${libdir}/temp ${D}${libdir}/libc.so
>  
> -	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/include/* ${STAGING_INCDIR}
> -	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'rm -rf ${D}/usr/include/linux', d)}
> -	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${STAGING_INCDIR}
> -	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/lib/* ${STAGING_LIBDIR}
> -	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/lib/* ${STAGING_DIR_TARGET}${base_libdir}
> -
> -	sed -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${STAGING_LIBDIR}/libc.so > ${STAGING_LIBDIR}/temp
> -	mv ${STAGING_LIBDIR}/temp ${STAGING_LIBDIR}/libc.so
> -
> -	sed -e "s# /lib# ../../lib#" -e "s# /usr/lib# .#g" ${STAGING_LIBDIR}/libpthread.so > ${STAGING_LIBDIR}/temp
> -	mv ${STAGING_LIBDIR}/temp ${STAGING_LIBDIR}/libpthread.so
> +	sed -e "s# /lib# ../../lib#" -e "s# /usr/lib# .#g" ${D}${libdir}/libpthread.so > ${D}${libdir}/temp
> +	mv ${D}${libdir}/temp ${D}${libdir}/libpthread.so
>  }
>  
>  TMP_LOCALE="/tmp/locale${libdir}/locale"
> @@ -457,3 +458,5 @@ python populate_packages_prepend () {
>  		bb.data.setVar('PKG_libgcc-dev', 'libgcc1-dev', d)
>  	bb.build.exec_func('package_do_split_gconvs', d)
>  }
> +
> +NATIVE_INSTALL_WORKS = "1"
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


