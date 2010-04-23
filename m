Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O5NLQ-0003Gi-2N
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 20:11:23 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O5NHu-0000pJ-3V from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 11:07:38 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 23 Apr 2010 11:07:37 -0700
Received: from 172.30.80.244 ([172.30.80.244]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri, 23 Apr 2010 18:07:37 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	23 Apr 2010 11:07:33 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hqrv2b$a7u$1@dough.gmane.org>
References: <1271852471-16659-1-git-send-email-koen.kooi@gmail.com>
	<hqrv2b$a7u$1@dough.gmane.org>
Organization: Mentor Graphics Corporation
Date: Fri, 23 Apr 2010 11:07:33 -0700
Message-ID: <1272046053.3865.425.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 23 Apr 2010 18:07:37.0876 (UTC)
	FILETIME=[DB6BA540:01CAE30F]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC][PATCH] meta-toolchain: use MULTIMACH_TARGET_SYS instead of TARGET_SYS
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
X-List-Received-Date: Fri, 23 Apr 2010 18:11:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-04-23 at 13:07 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Ping

It's better than what we have today, true.  And SDKPATH already contains
DISTRO, which is the likely changer of TOOLCHAIN_*_TASK.  So...

Acked-by: Tom Rini <tom_rini@mentor.com>

>=20
> On 21-04-10 14:21, Koen Kooi wrote:
> > From: Koen Kooi <koen@openembedded.org>
> >=20
> > This is the first step to be able to mix multiple arm archs (and ABIs) =
when installing multiple SDKs on one buildhost (e.g. armv4 and armv7a).
> >=20
> > ---
> >  recipes/meta/meta-toolchain.bb |   50 ++++++++++++++++++++------------=
--------
> >  1 files changed, 25 insertions(+), 25 deletions(-)
> >=20
> > diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolcha=
in.bb
> > index adc057a..2e2196a 100644
> > --- a/recipes/meta/meta-toolchain.bb
> > +++ b/recipes/meta/meta-toolchain.bb
> > @@ -10,7 +10,7 @@ SDK_OUTPUT2 =3D "${SDK_DIR}/image-extras"
> >  SDK_DEPLOY =3D "${DEPLOY_DIR}/sdk"
> > =20
> >  IPKG_HOST =3D "opkg-cl -f ${IPKGCONF_SDK} -o ${SDK_OUTPUT}"
> > -IPKG_TARGET =3D "opkg-cl -f ${IPKGCONF_TARGET} -o ${SDK_OUTPUT}/${SDKP=
ATH}/${TARGET_SYS}"
> > +IPKG_TARGET =3D "opkg-cl -f ${IPKGCONF_TARGET} -o ${SDK_OUTPUT}/${SDKP=
ATH}/${MULTIMACH_TARGET_SYS}"
> > =20
> >  TOOLCHAIN_HOST_TASK ?=3D "task-sdk-host"
> >  TOOLCHAIN_TARGET_TASK ?=3D "task-sdk-bare"
> > @@ -26,14 +26,14 @@ RDEPENDS =3D "${DISTRO_FEED_CONFIGS} ${TOOLCHAIN_TA=
RGET_TASK} ${TOOLCHAIN_HOST_TAS
> >  TOOLCHAIN_FEED_URI ?=3D "${DISTRO_FEED_URI}"
> > =20
> >  modify_opkg_conf () {
> > -        OUTPUT_OPKGCONF_TARGET=3D"${SDK_OUTPUT}/${SDKPATH}/${TARGET_SY=
S}/${sysconfdir}/opkg.conf"
> > -        OUTPUT_OPKGCONF_HOST=3D"${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}=
/${sysconfdir}/opkg-sdk.conf"
> > +        OUTPUT_OPKGCONF_TARGET=3D"${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH=
_TARGET_SYS}/${sysconfdir}/opkg.conf"
> > +        OUTPUT_OPKGCONF_HOST=3D"${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_T=
ARGET_SYS}/${sysconfdir}/opkg-sdk.conf"
> >          OUTPUT_OPKGCONF_SDK=3D"${SDK_OUTPUT}/${sysconfdir}/opkg-sdk.co=
nf"
> >          rm -f ${OUTPUT_OPKGCONF_TARGET}
> >          rm -f ${OUTPUT_OPKGCONF_HOST}
> >          rm -f ${OUTPUT_OPKGCONF_SDK}
> > =20
> > -        if [ -e ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}/o=
pkg/arch.conf ] ; then
> > +        if [ -e ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/${sys=
confdir}/opkg/arch.conf ] ; then
> >              echo "Creating empty opkg.conf since arch.conf is already =
present"
> >              echo > ${OUTPUT_OPKGCONF_TARGET}=20
> >          else
> > @@ -53,7 +53,7 @@ do_populate_sdk() {
> >  	rm -rf ${SDK_OUTPUT}
> >  	mkdir -p ${SDK_OUTPUT}
> >  	mkdir -p ${SDK_OUTPUT}${libdir}/opkg/
> > -	mkdir -p ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}${libdir}/opkg/
> > +	mkdir -p ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}${libdir}/op=
kg/
> > =20
> >  	package_generate_ipkg_conf
> > =20
> > @@ -79,17 +79,17 @@ do_populate_sdk() {
> >  	# Clean up empty directories from excluded packages
> >  	find ${SDK_OUTPUT} -depth -type d -empty -print0 | xargs -r0 /bin/rmd=
ir
> > =20
> > -	install -d ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}
> > -	install -m 0644 ${IPKGCONF_TARGET} ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SD=
KPATH}/${TARGET_SYS}/${sysconfdir}/
> > +	install -d ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/${sysconf=
dir}
> > +	install -m 0644 ${IPKGCONF_TARGET} ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SD=
KPATH}/${MULTIMACH_TARGET_SYS}/${sysconfdir}/
> > =20
> >  	install -d ${SDK_OUTPUT}/${SDKPATH}/${sysconfdir}
> >  	install -m 0644 ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SDKPATH}/${sysconfdir=
}/
> > =20
> >  	# extract and store ipks, pkgdata and shlibs data
> > -	target_pkgs=3D`cat ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/usr/lib/opk=
g/status | grep Package: | cut -f 2 -d ' '`
> > +	target_pkgs=3D`cat ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/u=
sr/lib/opkg/status | grep Package: | cut -f 2 -d ' '`
> >  	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/ipk/
> >  	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/pkgdata/runtime/
> > -	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/${TARGET_SYS}/shlibs/
> > +	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/shlibs/
> >  	for pkg in $target_pkgs ; do
> >  		for arch in $revipkgarchs; do
> >  			pkgnames=3D${DEPLOY_DIR_IPK}/$arch/${pkg}_*_$arch.ipk
> > @@ -107,7 +107,7 @@ do_populate_sdk() {
> >  						cp ${TMPDIR}/pkgdata/$pkg_subdir/runtime/$subpkg.packaged ${SDK_=
OUTPUT2}/${SDKPATH}/pkgdata/$pkg_subdir/runtime/
> >  					fi
> >  					if [ -e ${STAGING_DIR_TARGET}/shlibs/$subpkg.list ]; then
> > -						cp ${STAGING_DIR_TARGET}/shlibs/$subpkg.* ${SDK_OUTPUT2}/${SDKPA=
TH}/${TARGET_SYS}/shlibs/
> > +						cp ${STAGING_DIR_TARGET}/shlibs/$subpkg.* ${SDK_OUTPUT2}/${SDKPA=
TH}/${MULTIMACH_TARGET_SYS}/shlibs/
> >  					fi
> >  				done
> >  				break
> > @@ -119,20 +119,20 @@ do_populate_sdk() {
> >  	# libgcc-dev should be responsible for that, but it's not getting bui=
lt
> >  	# RP: it gets smashed up depending on the order that gcc, gcc-cross a=
nd=20
> >  	# gcc-cross-sdk get built :( (30/11/07)
> > -	ln -sf libgcc_s.so.1 ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/lib/libgc=
c_s.so
> > +	ln -sf libgcc_s.so.1 ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}=
/lib/libgcc_s.so
> > =20
> >  	# With sysroot support, gcc expects the default C++ headers to be
> >  	# in a specific place.
> > -	install -d ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/include
> > -	mv ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/usr/include/c++ \
> > -		${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/include/
> > +	install -d ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/include
> > +	mv ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/usr/include/c++ \
> > +		${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/include/
> > =20
> >  	# Fix or remove broken .la files
> > -	for i in `find ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS} -name \*.la`; d=
o
> > -		sed -i 	-e "/^dependency_libs=3D/s,\([[:space:]']\)${base_libdir},\1=
\$SDK_PATH/\$TARGET_SYS${base_libdir},g" \
> > -			-e "/^dependency_libs=3D/s,\([[:space:]']\)${libdir},\1\$SDK_PATH/\=
$TARGET_SYS${libdir},g" \
> > -			-e "/^dependency_libs=3D/s,\-\([LR]\)${base_libdir},-\1\$SDK_PATH/\=
$TARGET_SYS${base_libdir},g" \
> > -			-e "/^dependency_libs=3D/s,\-\([LR]\)${libdir},-\1\$SDK_PATH/\$TARG=
ET_SYS${libdir},g" \
> > +	for i in `find ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS} -name=
 \*.la`; do
> > +		sed -i 	-e "/^dependency_libs=3D/s,\([[:space:]']\)${base_libdir},\1=
\$SDK_PATH/\$MULTIMACH_TARGET_SYS${base_libdir},g" \
> > +			-e "/^dependency_libs=3D/s,\([[:space:]']\)${libdir},\1\$SDK_PATH/\=
$MULTIMACH_TARGET_SYS${libdir},g" \
> > +			-e "/^dependency_libs=3D/s,\-\([LR]\)${base_libdir},-\1\$SDK_PATH/\=
$MULTIMACH_TARGET_SYS${base_libdir},g" \
> > +			-e "/^dependency_libs=3D/s,\-\([LR]\)${libdir},-\1\$SDK_PATH/\$MULT=
IMACH_TARGET_SYS${libdir},g" \
> >  			-e 's/^installed=3Dyes$/installed=3Dno/' $i
> >  	done
> >  	rm -f ${SDK_OUTPUT}/${SDKPATH}/lib/*.la
> > @@ -148,15 +148,15 @@ do_populate_sdk() {
> >  	script=3D${SDK_OUTPUT}/${SDKPATH}/environment-setup
> >  	touch $script
> >  	echo 'export SDK_PATH=3D${SDKPATH}' >> $script
> > -	echo 'export TARGET_SYS=3D${TARGET_SYS}' >> $script
> > +	echo 'export MULTIMACH_TARGET_SYS=3D${MULTIMACH_TARGET_SYS}' >> $scri=
pt
> >  	echo 'export PATH=3D$SDK_PATH/bin:$PATH' >> $script
> > -	echo 'export CPATH=3D$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $sc=
ript
> > -	echo 'export LIBTOOL_SYSROOT_PATH=3D$SDK_PATH/$TARGET_SYS' >> $script
> > -	echo 'export PKG_CONFIG_SYSROOT_DIR=3D$SDK_PATH/$TARGET_SYS' >> $scri=
pt
> > -	echo 'export PKG_CONFIG_PATH=3D$SDK_PATH/$TARGET_SYS${libdir}/pkgconf=
ig' >> $script
> > +	echo 'export CPATH=3D$SDK_PATH/$MULTIMACH_TARGET_SYS/usr/include:$CPA=
TH' >> $script
> > +	echo 'export LIBTOOL_SYSROOT_PATH=3D$SDK_PATH/$MULTIMACH_TARGET_SYS' =
>> $script
> > +	echo 'export PKG_CONFIG_SYSROOT_DIR=3D$SDK_PATH/$MULTIMACH_TARGET_SYS=
' >> $script
> > +	echo 'export PKG_CONFIG_PATH=3D$SDK_PATH/$MULTIMACH_TARGET_SYS${libdi=
r}/pkgconfig' >> $script
> >  	echo 'export CONFIG_SITE=3D$SDK_PATH/site-config' >> $script
> >  	echo 'alias opkg=3D"LD_LIBRARY_PATH=3D$SDK_PATH/lib $SDK_PATH/bin/opk=
g-cl -f $SDK_PATH/${sysconfdir}/opkg-sdk.conf -o $SDK_PATH"' >> $script
> > -	echo 'alias opkg-target=3D"LD_LIBRARY_PATH=3D$SDK_PATH/lib $SDK_PATH/=
bin/opkg-cl -f $SDK_PATH/$TARGET_SYS${sysconfdir}/opkg.conf -o $SDK_PATH/$T=
ARGET_SYS"' >> $script
> > +	echo 'alias opkg-target=3D"LD_LIBRARY_PATH=3D$SDK_PATH/lib $SDK_PATH/=
bin/opkg-cl -f $SDK_PATH/$MULTIMACH_TARGET_SYS${sysconfdir}/opkg.conf -o $S=
DK_PATH/$MULTIMACH_TARGET_SYS"' >> $script
> > =20
> >  	# Add version information
> >  	versionfile=3D${SDK_OUTPUT}/${SDKPATH}/version
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFL0X+LMkyGM64RGpERAjk7AJ44eTjMVw7SD+Qapa1LdwJO5tiEXQCcCw2S
> EHftzrdtZOChyR9eIKhJ0aw=3D
> =3DAHEQ
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


