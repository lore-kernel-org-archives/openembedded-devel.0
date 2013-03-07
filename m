Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UDdLg-0002uq-Ro
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 17:07:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Mar 2013 07:50:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,803,1355126400"; d="scan'208";a="210522131"
Received: from unknown (HELO helios.localnet) ([10.255.12.181])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Mar 2013 07:50:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 07 Mar 2013 15:50:39 +0000
Message-ID: <2953155.d53ADznyZ4@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <1361329774-27984-1-git-send-email-mark.hatle@windriver.com>
References: <1361329774-27984-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Pradeep Tumati <pradeep.tumati@windriver.com>
Subject: Re: [PATCH meta-webserver] apache2: correct header file location
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
X-List-Received-Date: Thu, 07 Mar 2013 16:07:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 19 February 2013 21:09:34 Mark Hatle wrote:
> From: Pradeep Tumati <pradeep.tumati@windriver.com>
> 
> Apache header files are being placed in ../usr/include/lib32-apache2
> under the sysroot where as lib32-modphp looks for ../usr/include/apache2
> directory. This fix ensures that apache2 header files are placed
> in the ../usr/include/apache2/ directory.
> 
> Signed-off-by: Pradeep Tumati <pradeep.tumati@windriver.com>
> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> ---
>  recipes-httpd/apache2/apache2_2.4.2.bb | 32
> ++++++++++++++++---------------- 1 file changed, 16 insertions(+), 16
> deletions(-)
> 
> diff --git a/recipes-httpd/apache2/apache2_2.4.2.bb
> b/recipes-httpd/apache2/apache2_2.4.2.bb index af7840d..af8c4ca 100644
> --- a/recipes-httpd/apache2/apache2_2.4.2.bb
> +++ b/recipes-httpd/apache2/apache2_2.4.2.bb
> @@ -41,13 +41,13 @@ EXTRA_OECONF = "--enable-ssl \
>  		--enable-rewrite \
>  		--with-dbm=sdbm \
>  		--with-berkeley-db=no \
> -		--localstatedir=/var/${PN} \
> +		--localstatedir=/var/${BPN} \
>  		--with-gdbm=no \
>  		--with-ndbm=no \
> -		--includedir=${includedir}/${PN} \
> -		--datadir=${datadir}/${PN} \
> -		--sysconfdir=${sysconfdir}/${PN} \
> -                --libexecdir=${libdir}/${PN}/modules \
> +		--includedir=${includedir}/${BPN} \
> +		--datadir=${datadir}/${BPN} \
> +		--sysconfdir=${sysconfdir}/${BPN} \
> +                --libexecdir=${libdir}/${BPN}/modules \
>  		ap_cv_void_ptr_lt_long=no \
>  		--enable-mpms-shared \
>  		ac_cv_have_threadsafe_pollset=no"
> @@ -68,19 +68,19 @@ do_install_append() {
>  		    -e 's,/usr/bin/,${bindir}/,g' \
>  		    -e 's,/usr/lib,${libdir}/,g' \
>  		    -e 's,/etc/,${sysconfdir}/,g' \
> -		    -e 's,/usr/,${prefix}/,g' > ${D}/${sysconfdir}/init.d/${PN}
> -	chmod 755 ${D}/${sysconfdir}/init.d/${PN}
> +		    -e 's,/usr/,${prefix}/,g' > ${D}/${sysconfdir}/init.d/${BPN}
> +	chmod 755 ${D}/${sysconfdir}/init.d/${BPN}
>  	# remove the goofy original files...
> -	rm -rf ${D}/${sysconfdir}/${PN}/original
> +	rm -rf ${D}/${sysconfdir}/${BPN}/original
>  	# Expat should be found in the staging area via DEPENDS...
>  	rm -f ${D}/${libdir}/libexpat.*
> 
> -	install -d ${D}${sysconfdir}/${PN}/conf.d
> -	install -d ${D}${sysconfdir}/${PN}/modules.d
> +	install -d ${D}${sysconfdir}/${BPN}/conf.d
> +	install -d ${D}${sysconfdir}/${BPN}/modules.d
> 
>  	# Ensure configuration file pulls in conf.d and modules.d
> -	printf "\nIncludeOptional ${sysconfdir}/${PN}/conf.d/*.conf" >>
> ${D}/${sysconfdir}/${PN}/httpd.conf -	printf "\nIncludeOptional
> ${sysconfdir}/${PN}/modules.d/*.conf\n\n" >>
> ${D}/${sysconfdir}/${PN}/httpd.conf +	printf "\nIncludeOptional
> ${sysconfdir}/${BPN}/conf.d/*.conf" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
> +	printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.conf\n\n" >>
> ${D}/${sysconfdir}/${BPN}/httpd.conf }
> 
>  SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
> @@ -88,12 +88,12 @@ SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
>  apache_sysroot_preprocess () {
>  	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>  	install -m 755 ${D}${bindir}/apxs
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/ -	sed -i 's!my $installbuilddir 
=
> .*!my $installbuilddir = "${STAGING_DIR_HOST}/${datadir}/${PN}/build";!'
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs +	sed -i 's!my
> $installbuilddir = .*!my $installbuilddir =
> "${STAGING_DIR_HOST}/${datadir}/${BPN}/build";!'
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs sed -i 's!my $libtool = .*!my
> $libtool = "${STAGING_BINDIR_CROSS}/${TARGET_PREFIX}libtool";!'
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
> 
> -	sed -i 's!^APR_CONFIG = .*!APR_CONFIG =
> ${STAGING_BINDIR_CROSS}/apr-1-config!'
> ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk -	sed -i
> 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!'
> ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk -	sed -i
> 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!'
> ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk +	sed -i
> 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!'
> ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk +	sed -i
> 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!'
> ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk +	sed -i
> 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!'
> ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk }
> 
>  #

Like the last patch this is not actually against meta-webserver master, and 
like the last patch I was about to rebase and apply it on top, and again I 
notice that there are ${PN} references that haven't been changed but appear to 
need to be - the ones I can see are in the FILES_ values e.g.

FILES_${PN}-dbg += "${libdir}/${PN}/modules/.debug"

To match up with the paths we're specifying in EXTRA_OECONF this would need to 
be changed to:

FILES_${PN}-dbg += "${libdir}/${BPN}/modules/.debug"

Surely this sort of thing should be showing up in testing?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


