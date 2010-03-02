Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NmZWy-0003LJ-D8
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 22:21:36 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NmZUC-0000tE-7r from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 13:18:36 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 2 Mar 2010 13:18:35 -0800
Received: from 172.30.80.138 ([172.30.80.138]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue,  2 Mar 2010 21:17:44 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	02 Mar 2010 14:17:43 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hmjucb$9v9$1@dough.gmane.org>
References: <1267553457.4739.324.camel@trini-m4400>
	<hmjucb$9v9$1@dough.gmane.org>
Organization: Mentor Graphics Corporation
Date: Tue, 02 Mar 2010 14:17:43 -0700
Message-ID: <1267564663.4739.329.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 02 Mar 2010 21:18:35.0713 (UTC)
	FILETIME=[EB57D310:01CABA4D]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Firefox cleanups
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
X-List-Received-Date: Tue, 02 Mar 2010 21:21:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-03-02 at 22:02 +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 02-03-10 19:10, Tom Rini wrote:
> > firefox: Perform a number of cleanups and consistency issues.
>=20
> What are your thoughts on building things like xul and nss seperately so
> things like chromium can use them?

Honestly, not on my radar right now.  It's just stuff, especially big
stuff that turns off PARALLEL_MAKE that bugs me right now.  Toss in
firefox and wait what, how little of this big box is being used right
now?

Now, where's the Janitors thing that had been talked about.  Right about
now I've got a handful of other would be nice things to toss into the
firefox recipes, and it sounds like there's a few I hadn't thought of
too.

>=20
> regards,
>=20
> Koen
>=20
> >=20
> > - parallel builds need to happen via MOZ_MAKE_FLAGS and it gripes if
> > still passed -jN, so keep the old value before we clear it.
> > - Move the HOST_LIBIDL stuff into configure, otherwise bad things happe=
n
> > when you don't have pkg-config on the build host.
> > - Prior to 3.6, wireless-tools can be, or not be built already and the
> > Necko wifi options deals.  With how 3.6 is configured, it must be
> > disabled or DEPENDED on.  For consistency, turn it off.
> > - In 3.5 and newer, libnotify can be used, add it to DEPENDS (could be
> > disabled).
> > - Because of both of the above, bump PR.
> >=20
> > Signed-off-by: Tom Rini <tom_rini@mentor.com>
> >=20
> > diff --git a/classes/mozilla.bbclass b/classes/mozilla.bbclass
> > index c9a3966..4e3054b 100644
> > --- a/classes/mozilla.bbclass
> > +++ b/classes/mozilla.bbclass
> > @@ -6,10 +6,12 @@ SRC_URI +=3D "file://mozconfig"
> > =20
> >  inherit gettext pkgconfig
> > =20
> > +# Parallel make is special in mozilla.
> > +OLD_PARALLEL_MAKE :=3D "${PARALLEL_MAKE}"
> > +PARALLEL_MAKE =3D ""
> > +
> >  EXTRA_OECONF =3D "--target=3D${TARGET_SYS} --host=3D${BUILD_SYS} \
> >  		--build=3D${BUILD_SYS} --prefix=3D${prefix}"
> > -EXTRA_OEMAKE =3D "'HOST_LIBIDL_LIBS=3D${HOST_LIBIDL_LIBS}' \
> > -		'HOST_LIBIDL_CFLAGS=3D${HOST_LIBIDL_CFLAGS}'"
> >  SELECTED_OPTIMIZATION =3D "-Os -fsigned-char -fno-strict-aliasing"
> > =20
> >  export CROSS_COMPILE =3D "1"
> > @@ -17,9 +19,6 @@ export MOZCONFIG =3D "${WORKDIR}/mozconfig"
> >  export MOZ_OBJDIR =3D "${S}"
> > =20
> >  export CONFIGURE_ARGS =3D "${EXTRA_OECONF}"
> > -export HOST_LIBIDL_CFLAGS =3D "`${HOST_LIBIDL_CONFIG} --cflags`"
> > -export HOST_LIBIDL_LIBS =3D "`${HOST_LIBIDL_CONFIG} --libs`"
> > -export HOST_LIBIDL_CONFIG =3D "PKG_CONFIG_PATH=3D
> > ${STAGING_LIBDIR_NATIVE}/pkgconfig pkg-config libIDL-2.0"
> >  export HOST_CC =3D "${BUILD_CC}"
> >  export HOST_CXX =3D "${BUILD_CXX}"
> >  export HOST_CFLAGS =3D "${BUILD_CFLAGS}"
> > @@ -38,7 +37,22 @@ mozilla_do_configure() {
> >  			`dirname $cg`/
> >  		done
> >  	)
> > -	if [ -e ${MOZ_OBJDIR}/Makefile ] ; then=20
> > +
> > +	# Put PARALLEL_MAKE into mozconfig
> > +	if [ ! -z "${OLD_PARALLEL_MAKE}" ] ; then
> > +		echo mk_add_options MOZ_MAKE_FLAGS=3D\"${OLD_PARALLEL_MAKE}\" \
> > +			>> ${MOZCONFIG}
> > +	fi
> > +
> > +	# Set the host libIDL stuff correctly.
> > +	export HOST_LIBIDL_CONFIG=3D"PKG_CONFIG_PATH=3D
> > ${STAGING_LIBDIR_NATIVE}/pkgconfig pkg-config libIDL-2.0"
> > +	# Due to sysroot we need to sed out references to the target staging
> > +	# when building the native version of xpidl Symptons of the failure
> > +	# include "gthread.h:344: error: size of array 'type name' is
> > negative"
> > +	export HOST_LIBIDL_CFLAGS=3D"`${HOST_LIBIDL_CONFIG} --cflags | sed -e=
 s:
> > ${STAGING_DIR_TARGET}:${STAGING_DIR_NATIVE}:g`"
> > +	export HOST_LIBIDL_LIBS=3D"`${HOST_LIBIDL_CONFIG} --libs`"
> > +
> > +	if [ -e ${MOZ_OBJDIR}/Makefile ] ; then
> >  		oe_runmake -f client.mk ${MOZ_OBJDIR}/Makefile \
> >  					${MOZ_OBJDIR}/config.status
> >  	fi
> > diff --git a/recipes/mozilla/fennec_hg.bb b/recipes/mozilla/fennec_hg.b=
b
> > index ef4cedd..ada5fa8 100644
> > --- a/recipes/mozilla/fennec_hg.bb
> > +++ b/recipes/mozilla/fennec_hg.bb
> > @@ -19,8 +19,6 @@ require firefox.inc
> > =20
> >  DEPENDS +=3D "libnotify autoconf213-native cairo alsa-lib sqlite3"
> > =20
> > -PARALLEL_MAKE =3D ""
> > -
> >  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> > -frename-registers -O2"
> > =20
> >  export LIBXUL_DIST=3D"${S}/objdir/xulrunner/dist/"
> > diff --git a/recipes/mozilla/firefox-3.5.2/mozconfig
> > b/recipes/mozilla/firefox-3.5.2/mozconfig
> > index d8d3f39..7e2ade0 100644
> > --- a/recipes/mozilla/firefox-3.5.2/mozconfig
> > +++ b/recipes/mozilla/firefox-3.5.2/mozconfig
> > @@ -26,6 +26,7 @@ ac_add_options --disable-jsd
> >  ac_add_options --disable-installer
> >  ac_add_options --disable-xprint
> >  ac_add_options --disable-necko-disk-cache
> > +ac_add_options --disable-necko-wifi
> >  ac_add_options --disable-updater
> > =20
> >  # configure necko to allocate smaller network buffers
> > diff --git a/recipes/mozilla/firefox-3.5.4/mozconfig
> > b/recipes/mozilla/firefox-3.5.4/mozconfig
> > index d8d3f39..7e2ade0 100644
> > --- a/recipes/mozilla/firefox-3.5.4/mozconfig
> > +++ b/recipes/mozilla/firefox-3.5.4/mozconfig
> > @@ -26,6 +26,7 @@ ac_add_options --disable-jsd
> >  ac_add_options --disable-installer
> >  ac_add_options --disable-xprint
> >  ac_add_options --disable-necko-disk-cache
> > +ac_add_options --disable-necko-wifi
> >  ac_add_options --disable-updater
> > =20
> >  # configure necko to allocate smaller network buffers
> > diff --git a/recipes/mozilla/firefox-3.5.5/mozconfig
> > b/recipes/mozilla/firefox-3.5.5/mozconfig
> > index d8d3f39..7e2ade0 100644
> > --- a/recipes/mozilla/firefox-3.5.5/mozconfig
> > +++ b/recipes/mozilla/firefox-3.5.5/mozconfig
> > @@ -26,6 +26,7 @@ ac_add_options --disable-jsd
> >  ac_add_options --disable-installer
> >  ac_add_options --disable-xprint
> >  ac_add_options --disable-necko-disk-cache
> > +ac_add_options --disable-necko-wifi
> >  ac_add_options --disable-updater
> > =20
> >  # configure necko to allocate smaller network buffers
> > diff --git a/recipes/mozilla/firefox-3.6/mozconfig
> > b/recipes/mozilla/firefox-3.6/mozconfig
> > index b561f06..883a396 100644
> > --- a/recipes/mozilla/firefox-3.6/mozconfig
> > +++ b/recipes/mozilla/firefox-3.6/mozconfig
> > @@ -26,6 +26,7 @@ ac_add_options --disable-jsd
> >  ac_add_options --disable-installer
> >  ac_add_options --disable-xprint
> >  ac_add_options --enable-necko-disk-cache
> > +ac_add_options --disable-necko-wifi
> >  ac_add_options --disable-updater
> > =20
> >  # configure necko to allocate smaller network buffers
> > diff --git a/recipes/mozilla/firefox.inc b/recipes/mozilla/firefox.inc
> > index b0e79f9..cf429f0 100644
> > --- a/recipes/mozilla/firefox.inc
> > +++ b/recipes/mozilla/firefox.inc
> > @@ -2,7 +2,6 @@ DESCRIPTION ?=3D "Browser made by mozilla"
> >  DEPENDS +=3D "alsa-lib"
> >  SRC_URI +=3D "file://mozilla-${PN}.png file://mozilla-${PN}.desktop"
> > =20
> > -PARALLEL_MAKE =3D ""
> >  ARM_INSTRUCTION_SET =3D "arm"
> > =20
> >  MOZPV ?=3D "${PV}"
> > @@ -31,13 +30,6 @@ FILES_${PN}-dbg +=3D "	${libdir}/${PN}-*/.debug \
> >  			${bindir}/.debug \
> >  			"
> > =20
> > -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-=
2"
> > -
> > -# Due to sysroot we need to sed out references to the target staging
> > when building the native version of xpidl
> > -# Symptons of the failure include "gthread.h:344: error: size of array
> > 'type name' is negative"
> > -export HOST_LIBIDL_CFLAGS =3D "`${HOST_LIBIDL_CONFIG} --cflags | sed -=
e
> > s:${STAGING_DIR_TARGET}:${STAGING_DIR_NATIVE}:g`"
> > -
> > -
> >  do_install() {
> >  	oe_runmake DESTDIR=3D"${D}" destdir=3D"${D}" install
> >  	install -d ${D}${datadir}/applications
> > diff --git a/recipes/mozilla/firefox_3.0.1.bb
> > b/recipes/mozilla/firefox_3.0.1.bb
> > index ee60fc0..72c72bd 100644
> > --- a/recipes/mozilla/firefox_3.0.1.bb
> > +++ b/recipes/mozilla/firefox_3.0.1.bb
> > @@ -23,7 +23,6 @@ S =3D "${WORKDIR}/mozilla"
> >  inherit mozilla
> >  require firefox.inc
> > =20
> > -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-=
2"
> >  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> > -frename-registers -O2"
> > =20
> >  do_compile_prepend() {
> > diff --git a/recipes/mozilla/firefox_3.0.4.bb
> > b/recipes/mozilla/firefox_3.0.4.bb
> > index 7cfebfc..f783000 100644
> > --- a/recipes/mozilla/firefox_3.0.4.bb
> > +++ b/recipes/mozilla/firefox_3.0.4.bb
> > @@ -23,7 +23,6 @@ DEFAULT_PREFERENCE =3D "-1"
> >  inherit mozilla
> >  require firefox.inc
> > =20
> > -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-=
2"
> >  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> > -frename-registers -O2"
> > =20
> >  do_compile_prepend() {
> > diff --git a/recipes/mozilla/firefox_3.0.8.bb
> > b/recipes/mozilla/firefox_3.0.8.bb
> > index 541a542..5ce6f95 100644
> > --- a/recipes/mozilla/firefox_3.0.8.bb
> > +++ b/recipes/mozilla/firefox_3.0.8.bb
> > @@ -23,7 +23,6 @@ S =3D "${WORKDIR}/mozilla"
> >  inherit mozilla
> >  require firefox.inc
> > =20
> > -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-=
2"
> >  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> > -frename-registers -O2"
> > =20
> >  do_compile_prepend() {
> > diff --git a/recipes/mozilla/firefox_3.1b1.bb
> > b/recipes/mozilla/firefox_3.1b1.bb
> > index 7a41491..54113f4 100644
> > --- a/recipes/mozilla/firefox_3.1b1.bb
> > +++ b/recipes/mozilla/firefox_3.1b1.bb
> > @@ -17,7 +17,6 @@ DEFAULT_PREFERENCE =3D "-1"
> >  inherit mozilla
> >  require firefox.inc
> > =20
> > -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-=
2"
> >  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> > -frename-registers -O2"
> > =20
> >  do_configure_prepend() {
> > diff --git a/recipes/mozilla/firefox_3.1b2.bb
> > b/recipes/mozilla/firefox_3.1b2.bb
> > index 2d661ea..7be8baa 100644
> > --- a/recipes/mozilla/firefox_3.1b2.bb
> > +++ b/recipes/mozilla/firefox_3.1b2.bb
> > @@ -16,7 +16,6 @@ DEFAULT_PREFERENCE =3D "-1"
> >  inherit mozilla
> >  require firefox.inc
> > =20
> > -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-=
2"
> >  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> > -frename-registers -O2"
> > =20
> >  do_configure_prepend() {
> > diff --git a/recipes/mozilla/firefox_3.5.2.bb
> > b/recipes/mozilla/firefox_3.5.2.bb
> > index 3d940d7..b6e265b 100644
> > --- a/recipes/mozilla/firefox_3.5.2.bb
> > +++ b/recipes/mozilla/firefox_3.5.2.bb
> > @@ -1,5 +1,6 @@
> > -DEPENDS +=3D "cairo sqlite3"
> > -PR =3D "r3"
> > +DEPENDS +=3D "cairo sqlite3 libnotify"
> > +
> > +PR =3D "r4"
> > =20
> >  SRC_URI =3D
> > "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/fi=
refox-${PV}-source.tar.bz2 \
> >  	file://jsautocfg.h \
> > @@ -25,7 +26,6 @@ require firefox.inc
> >  EXTRA_OECONF +=3D " --enable-official-branding "
> > =20
> > =20
> > -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-=
2"
> >  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> > -frename-registers -O2"
> > =20
> >  do_compile_prepend() {
> > diff --git a/recipes/mozilla/firefox_3.5.4.bb
> > b/recipes/mozilla/firefox_3.5.4.bb
> > index 8ba6ba1..b1b2af3 100644
> > --- a/recipes/mozilla/firefox_3.5.4.bb
> > +++ b/recipes/mozilla/firefox_3.5.4.bb
> > @@ -1,6 +1,6 @@
> > -DEPENDS +=3D "cairo sqlite3"
> > +DEPENDS +=3D "cairo sqlite3 libnotify"
> > =20
> > -PR =3D "r2"
> > +PR =3D "r3"
> > =20
> >  SRC_URI =3D
> > "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/fi=
refox-${PV}.source.tar.bz2 \
> >  	file://jsautocfg.h \
> > @@ -26,7 +26,6 @@ require firefox.inc
> >  EXTRA_OECONF +=3D " --enable-official-branding "
> > =20
> > =20
> > -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-=
2"
> >  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> > -frename-registers -O2"
> > =20
> >  do_compile_prepend() {
> > diff --git a/recipes/mozilla/firefox_3.5.5.bb
> > b/recipes/mozilla/firefox_3.5.5.bb
> > index da54872..ea3d4fc 100644
> > --- a/recipes/mozilla/firefox_3.5.5.bb
> > +++ b/recipes/mozilla/firefox_3.5.5.bb
> > @@ -1,6 +1,6 @@
> > -DEPENDS +=3D "cairo sqlite3"
> > +DEPENDS +=3D "cairo sqlite3 libnotify"
> > =20
> > -PR =3D "r3"
> > +PR =3D "r4"
> > =20
> >  SRC_URI =3D
> > "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/fi=
refox-${PV}.source.tar.bz2 \
> >  	file://jsautocfg.h \
> > @@ -26,7 +26,6 @@ require firefox.inc
> >  EXTRA_OECONF +=3D " --enable-official-branding --disable-crashreporter=
"
> > =20
> > =20
> > -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-=
2"
> >  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> > -frename-registers -O2"
> > =20
> >  do_compile_prepend() {
> > diff --git a/recipes/mozilla/firefox_3.5b4.bb
> > b/recipes/mozilla/firefox_3.5b4.bb
> > index 4a12329..0418c3b 100644
> > --- a/recipes/mozilla/firefox_3.5b4.bb
> > +++ b/recipes/mozilla/firefox_3.5b4.bb
> > @@ -1,8 +1,8 @@
> > -DEPENDS +=3D "cairo sqlite"
> > +DEPENDS +=3D "cairo sqlite libnotify"
> > =20
> >  PV =3D "3.0.1+3.5b4"
> >  MOZPV =3D "3.5b4"
> > -PR =3D "r2"
> > +PR =3D "r3"
> > =20
> >  SRC_URI =3D
> > "http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/${MOZPV}-candid=
ates/build1/source/firefox-${MOZPV}-source.tar.bz2 \
> >  	file://jsautocfg.h \
> > @@ -16,7 +16,6 @@ DEFAULT_PREFERENCE =3D "-10"
> >  inherit mozilla
> >  require firefox.inc
> > =20
> > -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-=
2"
> >  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> > -frename-registers -O2"
> > =20
> >  do_configure_prepend() {
> > diff --git a/recipes/mozilla/firefox_3.6.bb
> > b/recipes/mozilla/firefox_3.6.bb
> > index 82e92be..43e42b7 100644
> > --- a/recipes/mozilla/firefox_3.6.bb
> > +++ b/recipes/mozilla/firefox_3.6.bb
> > @@ -1,6 +1,6 @@
> > -DEPENDS +=3D "cairo sqlite3"
> > +DEPENDS +=3D "cairo sqlite3 libnotify"
> > =20
> > -PR =3D "r1"
> > +PR =3D "r2"
> > =20
> >  SRC_URI =3D
> > "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/fi=
refox-${PV}.source.tar.bz2;name=3Darchive \
> >  	file://jsautocfg.h \
> > @@ -28,7 +28,6 @@ require firefox.inc
> >  EXTRA_OECONF +=3D " --enable-official-branding --disable-crashreporter=
"
> > =20
> > =20
> > -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-=
2"
> >  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> > -frename-registers -O2"
> > =20
> >  do_compile_prepend() {
> > diff --git a/recipes/mozilla/firefox_hg.bb
> > b/recipes/mozilla/firefox_hg.bb
> > index 17a46ee..37bb260 100644
> > --- a/recipes/mozilla/firefox_hg.bb
> > +++ b/recipes/mozilla/firefox_hg.bb
> > @@ -17,8 +17,6 @@ S =3D "${WORKDIR}/mozilla-central"
> >  inherit mozilla
> >  require firefox.inc
> > =20
> > -PARALLEL_MAKE =3D ""
> > -export HOST_LIBIDL_CONFIG =3D "${STAGING_BINDIR_NATIVE}/libIDL-config-=
2"
> >  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> > -frename-registers -O2"
> > =20
> >  export LIBXUL_DIST=3D"${S}/objdir/xulrunner/dist/"
> >=20
> >=20
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFLjXzLMkyGM64RGpERAkzkAJ9drWWVHCSMuHXJIu61JBrNo7zyWgCeLoH0
> 8TbZpBGWsiWX79vJeES1PnY=3D
> =3DEUW5
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


