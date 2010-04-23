Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O5NZn-0002PD-3N
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 20:26:08 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1C00KOEDP5W990@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	23 Apr 2010 13:22:18 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 710CC14AF60; Fri,
	23 Apr 2010 14:22:17 -0400 (EDT)
Date: Fri, 23 Apr 2010 14:22:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100423182217.GB27322@denix.org>
References: <1271852471-16659-1-git-send-email-koen.kooi@gmail.com>
	<hqrv2b$a7u$1@dough.gmane.org> <1272046053.3865.425.camel@trini-m4400>
MIME-version: 1.0
In-reply-to: <1272046053.3865.425.camel@trini-m4400>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC][PATCH] meta-toolchain: use MULTIMACH_TARGET_SYS	instead of TARGET_SYS
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
X-List-Received-Date: Fri, 23 Apr 2010 18:26:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 23, 2010 at 11:07:33AM -0700, Tom Rini wrote:
> On Fri, 2010-04-23 at 13:07 +0200, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > Ping
> 
> It's better than what we have today, true.  And SDKPATH already contains
> DISTRO, which is the likely changer of TOOLCHAIN_*_TASK.  So...
> 
> Acked-by: Tom Rini <tom_rini@mentor.com>

In general:

Acked-by: Denys Dmytriyenko <denis@denix.org>

But, should we then create an arch-specific environment-setup scripts (e.g. 
one for armv4 and another for armv7a, as per your example below)?

> > On 21-04-10 14:21, Koen Kooi wrote:
> > > From: Koen Kooi <koen@openembedded.org>
> > > 
> > > This is the first step to be able to mix multiple arm archs (and ABIs) 
> > > when installing multiple SDKs on one buildhost (e.g. armv4 and armv7a).
> > > 
> > > ---
> > >  recipes/meta/meta-toolchain.bb |   50 ++++++++++++++++++++--------------------
> > >  1 files changed, 25 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
> > > index adc057a..2e2196a 100644
> > > --- a/recipes/meta/meta-toolchain.bb
> > > +++ b/recipes/meta/meta-toolchain.bb
> > > @@ -10,7 +10,7 @@ SDK_OUTPUT2 = "${SDK_DIR}/image-extras"
> > >  SDK_DEPLOY = "${DEPLOY_DIR}/sdk"
> > >  
> > >  IPKG_HOST = "opkg-cl -f ${IPKGCONF_SDK} -o ${SDK_OUTPUT}"
> > > -IPKG_TARGET = "opkg-cl -f ${IPKGCONF_TARGET} -o ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}"
> > > +IPKG_TARGET = "opkg-cl -f ${IPKGCONF_TARGET} -o ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}"
> > >  
> > >  TOOLCHAIN_HOST_TASK ?= "task-sdk-host"
> > >  TOOLCHAIN_TARGET_TASK ?= "task-sdk-bare"
> > > @@ -26,14 +26,14 @@ RDEPENDS = "${DISTRO_FEED_CONFIGS} ${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TAS
> > >  TOOLCHAIN_FEED_URI ?= "${DISTRO_FEED_URI}"
> > >  
> > >  modify_opkg_conf () {
> > > -        OUTPUT_OPKGCONF_TARGET="${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}/opkg.conf"
> > > -        OUTPUT_OPKGCONF_HOST="${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}/opkg-sdk.conf"
> > > +        OUTPUT_OPKGCONF_TARGET="${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/${sysconfdir}/opkg.conf"
> > > +        OUTPUT_OPKGCONF_HOST="${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/${sysconfdir}/opkg-sdk.conf"
> > >          OUTPUT_OPKGCONF_SDK="${SDK_OUTPUT}/${sysconfdir}/opkg-sdk.conf"
> > >          rm -f ${OUTPUT_OPKGCONF_TARGET}
> > >          rm -f ${OUTPUT_OPKGCONF_HOST}
> > >          rm -f ${OUTPUT_OPKGCONF_SDK}
> > >  
> > > -        if [ -e ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}/opkg/arch.conf ] ; then
> > > +        if [ -e ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/${sysconfdir}/opkg/arch.conf ] ; then
> > >              echo "Creating empty opkg.conf since arch.conf is already present"
> > >              echo > ${OUTPUT_OPKGCONF_TARGET} 
> > >          else
> > > @@ -53,7 +53,7 @@ do_populate_sdk() {
> > >  	rm -rf ${SDK_OUTPUT}
> > >  	mkdir -p ${SDK_OUTPUT}
> > >  	mkdir -p ${SDK_OUTPUT}${libdir}/opkg/
> > > -	mkdir -p ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}${libdir}/opkg/
> > > +	mkdir -p ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}${libdir}/opkg/
> > >  
> > >  	package_generate_ipkg_conf
> > >  
> > > @@ -79,17 +79,17 @@ do_populate_sdk() {
> > >  	# Clean up empty directories from excluded packages
> > >  	find ${SDK_OUTPUT} -depth -type d -empty -print0 | xargs -r0 /bin/rmdir
> > >  
> > > -	install -d ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}
> > > -	install -m 0644 ${IPKGCONF_TARGET} ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}/
> > > +	install -d ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/${sysconfdir}
> > > +	install -m 0644 ${IPKGCONF_TARGET} ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/${sysconfdir}/
> > >  
> > >  	install -d ${SDK_OUTPUT}/${SDKPATH}/${sysconfdir}
> > >  	install -m 0644 ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SDKPATH}/${sysconfdir}/
> > >  
> > >  	# extract and store ipks, pkgdata and shlibs data
> > > -	target_pkgs=`cat ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/usr/lib/opkg/status | grep Package: | cut -f 2 -d ' '`
> > > +	target_pkgs=`cat ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/usr/lib/opkg/status | grep Package: | cut -f 2 -d ' '`
> > >  	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/ipk/
> > >  	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/pkgdata/runtime/
> > > -	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/${TARGET_SYS}/shlibs/
> > > +	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/shlibs/
> > >  	for pkg in $target_pkgs ; do
> > >  		for arch in $revipkgarchs; do
> > >  			pkgnames=${DEPLOY_DIR_IPK}/$arch/${pkg}_*_$arch.ipk
> > > @@ -107,7 +107,7 @@ do_populate_sdk() {
> > >  						cp ${TMPDIR}/pkgdata/$pkg_subdir/runtime/$subpkg.packaged ${SDK_OUTPUT2}/${SDKPATH}/pkgdata/$pkg_subdir/runtime/
> > >  					fi
> > >  					if [ -e ${STAGING_DIR_TARGET}/shlibs/$subpkg.list ]; then
> > > -						cp ${STAGING_DIR_TARGET}/shlibs/$subpkg.* ${SDK_OUTPUT2}/${SDKPATH}/${TARGET_SYS}/shlibs/
> > > +						cp ${STAGING_DIR_TARGET}/shlibs/$subpkg.* ${SDK_OUTPUT2}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/shlibs/
> > >  					fi
> > >  				done
> > >  				break
> > > @@ -119,20 +119,20 @@ do_populate_sdk() {
> > >  	# libgcc-dev should be responsible for that, but it's not getting built
> > >  	# RP: it gets smashed up depending on the order that gcc, gcc-cross and 
> > >  	# gcc-cross-sdk get built :( (30/11/07)
> > > -	ln -sf libgcc_s.so.1 ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/lib/libgcc_s.so
> > > +	ln -sf libgcc_s.so.1 ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/lib/libgcc_s.so
> > >  
> > >  	# With sysroot support, gcc expects the default C++ headers to be
> > >  	# in a specific place.
> > > -	install -d ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/include
> > > -	mv ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/usr/include/c++ \
> > > -		${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/include/
> > > +	install -d ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/include
> > > +	mv ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/usr/include/c++ \
> > > +		${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/include/
> > >  
> > >  	# Fix or remove broken .la files
> > > -	for i in `find ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS} -name \*.la`; do
> > > -		sed -i 	-e "/^dependency_libs=/s,\([[:space:]']\)${base_libdir},\1\$SDK_PATH/\$TARGET_SYS${base_libdir},g" \
> > > -			-e "/^dependency_libs=/s,\([[:space:]']\)${libdir},\1\$SDK_PATH/\$TARGET_SYS${libdir},g" \
> > > -			-e "/^dependency_libs=/s,\-\([LR]\)${base_libdir},-\1\$SDK_PATH/\$TARGET_SYS${base_libdir},g" \
> > > -			-e "/^dependency_libs=/s,\-\([LR]\)${libdir},-\1\$SDK_PATH/\$TARGET_SYS${libdir},g" \
> > > +	for i in `find ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS} -name \*.la`; do
> > > +		sed -i 	-e "/^dependency_libs=/s,\([[:space:]']\)${base_libdir},\1\$SDK_PATH/\$MULTIMACH_TARGET_SYS${base_libdir},g" \
> > > +			-e "/^dependency_libs=/s,\([[:space:]']\)${libdir},\1\$SDK_PATH/\$MULTIMACH_TARGET_SYS${libdir},g" \
> > > +			-e "/^dependency_libs=/s,\-\([LR]\)${base_libdir},-\1\$SDK_PATH/\$MULTIMACH_TARGET_SYS${base_libdir},g" \
> > > +			-e "/^dependency_libs=/s,\-\([LR]\)${libdir},-\1\$SDK_PATH/\$MULTIMACH_TARGET_SYS${libdir},g" \
> > >  			-e 's/^installed=yes$/installed=no/' $i
> > >  	done
> > >  	rm -f ${SDK_OUTPUT}/${SDKPATH}/lib/*.la
> > > @@ -148,15 +148,15 @@ do_populate_sdk() {
> > >  	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup
> > >  	touch $script
> > >  	echo 'export SDK_PATH=${SDKPATH}' >> $script
> > > -	echo 'export TARGET_SYS=${TARGET_SYS}' >> $script
> > > +	echo 'export MULTIMACH_TARGET_SYS=${MULTIMACH_TARGET_SYS}' >> $script
> > >  	echo 'export PATH=$SDK_PATH/bin:$PATH' >> $script
> > > -	echo 'export CPATH=$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $script
> > > -	echo 'export LIBTOOL_SYSROOT_PATH=$SDK_PATH/$TARGET_SYS' >> $script
> > > -	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS' >> $script
> > > -	echo 'export PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script
> > > +	echo 'export CPATH=$SDK_PATH/$MULTIMACH_TARGET_SYS/usr/include:$CPATH' >> $script
> > > +	echo 'export LIBTOOL_SYSROOT_PATH=$SDK_PATH/$MULTIMACH_TARGET_SYS' >> $script
> > > +	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$MULTIMACH_TARGET_SYS' >> $script
> > > +	echo 'export PKG_CONFIG_PATH=$SDK_PATH/$MULTIMACH_TARGET_SYS${libdir}/pkgconfig' >> $script
> > >  	echo 'export CONFIG_SITE=$SDK_PATH/site-config' >> $script
> > >  	echo 'alias opkg="LD_LIBRARY_PATH=$SDK_PATH/lib $SDK_PATH/bin/opkg-cl -f $SDK_PATH/${sysconfdir}/opkg-sdk.conf -o $SDK_PATH"' >> $script
> > > -	echo 'alias opkg-target="LD_LIBRARY_PATH=$SDK_PATH/lib $SDK_PATH/bin/opkg-cl -f $SDK_PATH/$TARGET_SYS${sysconfdir}/opkg.conf -o $SDK_PATH/$TARGET_SYS"' >> $script
> > > +	echo 'alias opkg-target="LD_LIBRARY_PATH=$SDK_PATH/lib $SDK_PATH/bin/opkg-cl -f $SDK_PATH/$MULTIMACH_TARGET_SYS${sysconfdir}/opkg.conf -o $SDK_PATH/$MULTIMACH_TARGET_SYS"' >> $script
> > >  
> > >  	# Add version information
> > >  	versionfile=${SDK_OUTPUT}/${SDKPATH}/version
> > 
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.5 (Darwin)
> > 
> > iD8DBQFL0X+LMkyGM64RGpERAjk7AJ44eTjMVw7SD+Qapa1LdwJO5tiEXQCcCw2S
> > EHftzrdtZOChyR9eIKhJ0aw=
> > =AHEQ
> > -----END PGP SIGNATURE-----
> > 
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> -- 
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


