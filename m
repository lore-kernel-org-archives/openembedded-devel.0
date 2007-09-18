Received: from [71.182.72.36] (helo=desktop)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <markgross@thegnar.org>) id 1IXS9C-0008OE-Oa
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2007 03:45:07 +0200
Received: by desktop (Postfix, from userid 1000)
	id 26F4322950F; Mon, 17 Sep 2007 18:41:28 -0700 (PDT)
Date: Mon, 17 Sep 2007 18:41:28 -0700
From: mark gross <markgross@thegnar.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070918014128.GA760@thegnar.org>
References: <1189985156.9658.38.camel@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1189985156.9658.38.camel@localhost.localdomain>
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	Ross Burton <ross@openedhand.com>
Subject: Re: RFC: Staging layout and pkgconfig sysroot support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2007 01:45:07 -0000
X-Groupsio-MsgNum: 2935
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline

--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 17, 2007 at 12:25:56AM +0100, Richard Purdie wrote:
> The sed code in pkgconfig.bbclass has always struck me as ugly. In an
> ideal world we shouldn't have to rewrite the contents of the pkgconfig
> files to make them work with OE.
>=20
> Packages like dbus and eds are starting to add paths to runtime module
> and state directories into the pkgconfig files and OE's current approach
> totally breaks these.

Then shouldn't we beet on the dbus guys to not break things?

>=20
> Assuming our staging directory looked like our target systems, the paths
> in the pkgconfig files would just need a path prepending to them to make
> them work properly. Convention in other places refers to this as a
> "sysroot". I found such a patch for pkgconfig on its mailing list which
> does this for -L and -I compiler options so I thought experiment a bit
> with it.
>=20
> The big question is therefore whether we want staging to look like the
> target system? It simplifies some things and complicates others. The
> creation of two lib directories means more compiler options and more
> STAGING* variables. As yet I haven't touched on the up to four bin
> directories that could result (/bin, /sbin, /usr/bin, /usb/sbin)
> although thankfully its more native binaries we're interested in. In
> theory we could keep the existing layout for native packages and just
> change the layout of target systems...
>=20
> I've experimented a bit and the changes below show what needed changes
> in poky to build up to gtk+. As can be seen, assumptions about the
> staging layout are spread about the metadata quite a bit. Having said
> that I think there is scope for some valid cleanups here regardless of
> which layout we end up choosing.
>=20
> As I see it, changing to match the target system structure has the
> advantages:
>=20
>  * "make install" could be used more directly with staging instead of=20
>    the current two step system since the autoconf bindir / libdir /=20
>    includedir paths will match
>  * Less manipulation of staged files should be needed since the=20
>    directory structures match more
>  * pkgconfig with a sysroot option will "just work"
>  * libtool could in theory be patched to support the idea of a sysroot
>  * Package files match the layout in staging resulting in possibly=20
>    simplified packages staging in the future
>  * Eventually might allow qemu to "boot" staging

This could be cool if I can hack the staging and run a command to
re-spin a hacked target image, or PXE boot the staging directory.
Otherwise this seems like a waste of time to do.

>  * Simplifies meta-toolchain slightly
>=20
> and the disadvantages:
>=20
>  * Breaks compatibility with existing builds quite fundamentally
>  * Will take a while to iron out all the bugs the change will introduce
>  * The existing different layout system stresses the packages and=20
>    highlights bad assumptions in them which we lose.
>=20
> I'm interested in people's views on whether this would be a worthwhile
> change or not? Should we change all staging layouts or leave say native
> packages as they are?

I'm not sure what the win is.  Seems like a lot of thrash for not much
return.


--mgross


>=20
> As a first step I will investigate removing some of the hardcoded layout
> assumptions I've found so far as I think they're good to remove
> regardless of whether we change staging layout or not. In theory people
> or distros could maybe then choose their own layout even!
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> Index: conf/bitbake.conf
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- conf/bitbake.conf	(revision 2734)
> +++ conf/bitbake.conf	(working copy)
> @@ -167,17 +167,26 @@
>  B =3D "${S}"
> =20
>  STAGING_DIR =3D "${TMPDIR}/staging"
> -STAGING_BINDIR =3D "${STAGING_DIR}/${HOST_SYS}/bin"
> -STAGING_BINDIR_CROSS =3D "${STAGING_DIR}/${BUILD_SYS}/bin/${HOST_SYS}"
> -STAGING_BINDIR_NATIVE =3D "${STAGING_DIR}/${BUILD_SYS}/bin"
> -STAGING_LIBDIR =3D "${STAGING_DIR}/${HOST_SYS}/lib"
> -STAGING_LIBDIR_NATIVE =3D "${STAGING_DIR}/${BUILD_SYS}/lib"
> +
> +STAGING_BINDIR_CROSS =3D "${STAGING_DIR}/${BUILD_SYS}/usr/bin/${HOST_SYS=
}"
> +STAGING_BINDIR_NATIVE =3D "${STAGING_DIR}/${BUILD_SYS}/usr/bin"
> +STAGING_LIBDIR_NATIVE =3D "${STAGING_DIR}/${BUILD_SYS}/usr/lib"
> +STAGING_INCDIR_NATIVE =3D "${STAGING_DIR}/${BUILD_SYS}/usr/include"
>  STAGING_ETCDIR_NATIVE =3D "${STAGING_DIR}/${BUILD_SYS}/etc"
> -STAGING_INCDIR =3D "${STAGING_DIR}/${HOST_SYS}/include"
> -STAGING_DATADIR =3D "${STAGING_DIR}/${HOST_SYS}/share"
> +
> +STAGING_BASELIBDIR_TARGET =3D "${STAGING_DIR}/${TARGET_SYS}/lib"
> +STAGING_LIBDIR_TARGET =3D "${STAGING_DIR}/${TARGET_SYS}/usr/lib"
> +STAGING_INCDIR_TARGET =3D "${STAGING_DIR}/${TARGET_SYS}/usr/include"
> +
> +STAGING_BINDIR =3D "${STAGING_DIR}/${HOST_SYS}/usr/bin"
> +STAGING_BASELIBDIR =3D "${STAGING_DIR}/${HOST_SYS}/lib"
> +STAGING_LIBDIR =3D "${STAGING_DIR}/${HOST_SYS}/usr/lib"
> +STAGING_INCDIR =3D "${STAGING_DIR}/${HOST_SYS}/usr/include"
> +STAGING_DATADIR =3D "${STAGING_DIR}/${HOST_SYS}/usr/share"
> +
>  STAGING_LOADER_DIR =3D "${STAGING_DIR}/${HOST_SYS}/loader"
>  STAGING_FIRMWARE_DIR =3D "${STAGING_DIR}/${HOST_SYS}/firmware"
> -STAGING_PYDIR =3D "${STAGING_DIR}/lib/python2.4"
> +STAGING_PYDIR =3D "${STAGING_DIR}/usr/lib/python2.4"
> =20
>  DEPLOY_DIR =3D "${TMPDIR}/deploy"
>  DEPLOY_DIR_TAR =3D "${DEPLOY_DIR}/tar"
> @@ -290,9 +299,9 @@
>  # Build flags and options.
>  ##################################################################
> =20
> -export BUILD_CPPFLAGS =3D "-isystem${STAGING_DIR}/${BUILD_SYS}/include"
> +export BUILD_CPPFLAGS =3D "-isystem${STAGING_INCDIR_NATIVE}"
>  export CPPFLAGS =3D "${TARGET_CPPFLAGS}"
> -export TARGET_CPPFLAGS =3D "-isystem${STAGING_DIR}/${TARGET_SYS}/include"
> +export TARGET_CPPFLAGS =3D "-isystem${STAGING_INCDIR_TARGET}"
> =20
>  export BUILD_CFLAGS =3D "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
>  export CFLAGS =3D "${TARGET_CFLAGS}"
> @@ -302,12 +311,14 @@
>  export CXXFLAGS =3D "${TARGET_CXXFLAGS}"
>  export TARGET_CXXFLAGS =3D "${TARGET_CFLAGS} -fpermissive"
> =20
> -export BUILD_LDFLAGS =3D "-L${STAGING_DIR}/${BUILD_SYS}/lib \
> -                        -Wl,-rpath-link,${STAGING_DIR}/${BUILD_SYS}/lib \
> -                        -Wl,-rpath,${STAGING_DIR}/${BUILD_SYS}/lib -Wl,-=
O1"
> +export BUILD_LDFLAGS =3D "-L${STAGING_LIBDIR_NATIVE} \
> +                        -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
> +                        -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"
>  export LDFLAGS =3D "${TARGET_LDFLAGS}"
> -export TARGET_LDFLAGS =3D "-L${STAGING_DIR}/${TARGET_SYS}/lib \
> -                         -Wl,-rpath-link,${STAGING_DIR}/${TARGET_SYS}/li=
b \
> +export TARGET_LDFLAGS =3D "-L${STAGING_BASELIBDIR_TARGET} \
> +                         -Wl,-rpath-link,${STAGING_BASELIBDIR_TARGET} \
> +                         -L${STAGING_LIBDIR_TARGET} \
> +                         -Wl,-rpath-link,${STAGING_LIBDIR_TARGET} \
>                           -Wl,-O1"
> =20
>  # Which flags to leave by strip-flags() in bin/build/oebuild.sh ?
> @@ -437,6 +448,7 @@
> =20
>  export PKG_CONFIG_DIR =3D "${STAGING_LIBDIR}/pkgconfig"
>  export PKG_CONFIG_PATH =3D "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconf=
ig"
> +export PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR}/${TARGET_SYS}"
>  export PKG_CONFIG_DISABLE_UNINSTALLED =3D "yes"
> =20
>  export QMAKE_MKSPEC_PATH =3D "${STAGING_DIR}/${BUILD_SYS}/share/qmake"
> Index: classes/pkgconfig.bbclass
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- classes/pkgconfig.bbclass	(revision 2734)
> +++ classes/pkgconfig.bbclass	(working copy)
> @@ -6,19 +6,21 @@
>  def get_pkgconfig_mangle(d):
>  	import bb.data
>  	s =3D "-e ''"
> -	if not bb.data.inherits_class('native', d):
> -		s +=3D " -e 's:=3D${libdir}:=3DOELIBDIR:;'"
> -		s +=3D " -e 's:=3D${includedir}:=3DOEINCDIR:;'"
> -		s +=3D " -e 's:=3D${datadir}:=3DOEDATADIR:'"
> -		s +=3D " -e 's:=3D${prefix}:=3DOEPREFIX:'"
> -		s +=3D " -e 's:=3D${exec_prefix}:=3DOEEXECPREFIX:'"
> -		s +=3D " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
> -		s +=3D " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
> -		s +=3D " -e 's:OEDATADIR:${STAGING_DATADIR}:'"
> -		s +=3D " -e 's:OEPREFIX:${STAGING_LIBDIR}/..:'"
> -		s +=3D " -e 's:OEEXECPREFIX:${STAGING_LIBDIR}/..:'"
>  	return s
> =20
> +#	if not bb.data.inherits_class('native', d):
> +#		s +=3D " -e 's:=3D${libdir}:=3DOELIBDIR:;'"
> +#		s +=3D " -e 's:=3D${includedir}:=3DOEINCDIR:;'"
> +#		s +=3D " -e 's:=3D${datadir}:=3DOEDATADIR:'"
> +#		s +=3D " -e 's:=3D${prefix}:=3DOEPREFIX:'"
> +#		s +=3D " -e 's:=3D${exec_prefix}:=3DOEEXECPREFIX:'"
> +#		s +=3D " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
> +#		s +=3D " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
> +#		s +=3D " -e 's:OEDATADIR:${STAGING_DATADIR}:'"
> +#		s +=3D " -e 's:OEPREFIX:${STAGING_LIBDIR}/..:'"
> +#		s +=3D " -e 's:OEEXECPREFIX:${STAGING_LIBDIR}/..:'"
> +
> +
>  do_stage_append () {
>  	for pc in `find ${S} -name '*.pc' -type f | grep -v -- '-uninstalled.pc=
$'`; do
>  		pcname=3D`basename $pc`
> Index: classes/base.bbclass
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- classes/base.bbclass	(revision 2734)
> +++ classes/base.bbclass	(working copy)
> @@ -673,11 +673,9 @@
>  	:
>  }
> =20
> -do_populate_staging[dirs] =3D "${STAGING_DIR}/${TARGET_SYS}/bin ${STAGIN=
G_DIR}/${TARGET_SYS}/lib \
> -			     ${STAGING_DIR}/${TARGET_SYS}/include \
> -			     ${STAGING_DIR}/${BUILD_SYS}/bin ${STAGING_DIR}/${BUILD_SYS}/lib \
> -			     ${STAGING_DIR}/${BUILD_SYS}/include \
> -			     ${STAGING_DATADIR} \
> +do_populate_staging[dirs] =3D "${STAGING_BINDIR} ${STAGING_LIBDIR} ${STA=
GING_INCDIR} ${STAGING_DATADIR} \
> +			     ${STAGING_BINDIR_NATIVE} ${STAGING_LIBDIR_NATIVE} \
> +			     ${STAGING_DIR}/${BUILD_SYS}/usr/include \
>  			     ${S} ${B}"
> =20
>  # Could be compile but populate_staging and do_install shouldn't run at =
the same time
> Index: classes/autotools.bbclass
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- classes/autotools.bbclass	(revision 2734)
> +++ classes/autotools.bbclass	(working copy)
> @@ -97,9 +97,9 @@
>  			AUTOV=3D`automake --version |head -n 1 |sed "s/.* //;s/\.[0-9]\+$//"`
>  			automake --version
>  			echo "AUTOV is $AUTOV"
> -			install -d ${STAGING_DIR}/${HOST_SYS}/share/aclocal
> -			install -d ${STAGING_DIR}/${HOST_SYS}/share/aclocal-$AUTOV
> -			acpaths=3D"$acpaths -I ${STAGING_DIR}/${HOST_SYS}/share/aclocal-$AUTO=
V -I ${STAGING_DIR}/${HOST_SYS}/share/aclocal"
> +			install -d ${STAGING_DIR}/${HOST_SYS}/usr/share/aclocal
> +			install -d ${STAGING_DIR}/${HOST_SYS}/usr/share/aclocal-$AUTOV
> +			acpaths=3D"$acpaths -I ${STAGING_DIR}/${HOST_SYS}/usr/share/aclocal-$=
AUTOV -I ${STAGING_DIR}/${HOST_SYS}/usr/share/aclocal"
>  			# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
>  			# like it was auto-generated.  Work around this by blowing it away
>  			# by hand, unless the package specifically asked not to run aclocal.
> Index: classes/native.bbclass
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- classes/native.bbclass	(revision 2734)
> +++ classes/native.bbclass	(working copy)
> @@ -47,39 +47,38 @@
>  export RANLIB =3D "${HOST_PREFIX}ranlib"
>  export STRIP =3D "${HOST_PREFIX}strip"
> =20
> -
>  # Path prefixes
> -base_prefix =3D "${exec_prefix}"
> -prefix =3D "${STAGING_DIR}"
> -exec_prefix =3D "${STAGING_DIR}/${BUILD_ARCH}-${BUILD_OS}"
> +base_prefix =3D "${STAGING_DIR}/${BUILD_ARCH}-${BUILD_OS}"
> +prefix =3D "${base_prefix}/usr"
> +exec_prefix =3D "${prefix}"
> =20
>  # Base paths
> -base_bindir =3D "${base_prefix}/bin"
> -base_sbindir =3D "${base_prefix}/bin"
> -base_libdir =3D "${base_prefix}/lib"
> +#base_bindir =3D "${base_prefix}/bin"
> +#base_sbindir =3D "${base_prefix}/bin"
> +#base_libdir =3D "${base_prefix}/lib"
> =20
>  # Architecture independent paths
> -sysconfdir =3D "${prefix}/etc"
> -sharedstatedir =3D "${prefix}/com"
> -localstatedir =3D "${prefix}/var"
> -infodir =3D "${datadir}/info"
> -mandir =3D "${datadir}/man"
> -docdir =3D "${datadir}/doc"
> -servicedir =3D "${prefix}/srv"
> +sysconfdir =3D "${base_prefix}/etc"
> +# sharedstatedir =3D "${base_prefix}/com"
> +localstatedir =3D "${base_prefix}/var"
> +#infodir =3D "${datadir}/info"
> +#mandir =3D "${datadir}/man"
> +#docdir =3D "${datadir}/doc"
> +servicedir =3D "${base_prefix}/srv"
> =20
>  # Architecture dependent paths
> -bindir =3D "${exec_prefix}/bin"
> -sbindir =3D "${exec_prefix}/bin"
> -libexecdir =3D "${exec_prefix}/libexec"
> -libdir =3D "${exec_prefix}/lib"
> -includedir =3D "${exec_prefix}/include"
> -oldincludedir =3D "${exec_prefix}/include"
> +#bindir =3D "${exec_prefix}/bin"
> +#sbindir =3D "${exec_prefix}/bin"
> +#libexecdir =3D "${exec_prefix}/libexec"
> +#libdir =3D "${exec_prefix}/lib"
> +#includedir =3D "${exec_prefix}/include"
> +#oldincludedir =3D "${exec_prefix}/include"
> =20
>  # Datadir is made arch dependent here, primarily
>  # for autoconf macros, and other things that
>  # may be manipulated to handle crosscompilation
>  # issues.
> -datadir =3D "${exec_prefix}/share"
> +#datadir =3D "${exec_prefix}/share"
> =20
>  do_stage () {
>  	if [ "${INHIBIT_NATIVE_STAGE_INSTALL}" !=3D "1" ]
> @@ -93,3 +92,4 @@
>  }
> =20
>  PKG_CONFIG_PATH .=3D "${EXTRA_NATIVE_PKGCONFIG_PATH}"
> +export PKG_CONFIG_SYSROOT_DIR =3D ""
> \ No newline at end of file
> Index: packages/db/db_4.2.52.bb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/db/db_4.2.52.bb	(revision 2734)
> +++ packages/db/db_4.2.52.bb	(working copy)
> @@ -71,7 +71,7 @@
>  CONFIG_SITE =3D ""
>  do_configure() {
>  	rm -f ${S}/config.sub
> -	cp ${STAGING_DIR}/${BUILD_SYS}/share/gnu-config/config.sub ${S}/config.=
sub=20
> +	cp ${STAGING_DIR}/${BUILD_SYS}/usr/share/gnu-config/config.sub ${S}/con=
fig.sub=20
>  	oe_runconf
>  }
> =20
> Index: packages/fontconfig/fontconfig_2.4.2.bb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/fontconfig/fontconfig_2.4.2.bb	(revision 2734)
> +++ packages/fontconfig/fontconfig_2.4.2.bb	(working copy)
> @@ -44,7 +44,7 @@
>  	for i in ${S}/fontconfig/*.h; do install -m 0644 $i ${STAGING_INCDIR}/f=
ontconfig/; done
>  }
> =20
> -BUILD_CFLAGS +=3D " -I${STAGING_DIR}/${BUILD_SYS}/include/freetype2"
> +BUILD_CFLAGS +=3D " -I${STAGING_DIR}/${BUILD_SYS}/usr/include/freetype2"
> =20
>  do_configure_append () {
>  	sed -i 's|LDFLAGS =3D.*|LDFLAGS =3D|' fc-case/Makefile
> Index: packages/glibc/glibc_2.5.bb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/glibc/glibc_2.5.bb	(revision 2734)
> +++ packages/glibc/glibc_2.5.bb	(working copy)
> @@ -154,10 +154,11 @@
>  }
> =20
>  do_stage() {
> -	rm -f ${STAGING_LIBDIR}/libc.so.6
> +	STAGING_BASE_LIBDIR=3D'${STAGING_DIR}/${HOST_SYS}${base_libdir}'
> +	rm -f $STAGING_BASE_LIBDIR/libc.so.6
>  	oe_runmake 'install_root=3D${STAGING_DIR}/${HOST_SYS}' \
> -		   'includedir=3D/include' 'libdir=3D/lib' 'slibdir=3D/lib' \
> -		   '${STAGING_LIBDIR}/libc.so.6' \
> +		   'includedir=3D${includedir}' 'libdir=3D${libdir}' 'slibdir=3D${base=
_libdir}' \
> +		   "$STAGING_BASE_LIBDIR/libc.so.6" \
>  		   install-headers install-lib
> =20
>  	install -d ${STAGING_INCDIR}/gnu \
> @@ -171,10 +172,10 @@
>  		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${STAGING_INCDIR}/rpcsvc/
>  	done
>  	for i in libc.a libc_pic.a libc_nonshared.a; do
> -		install -m 0644 ${B}/$i ${STAGING_LIBDIR}/ || die "failed to install $=
i"
> +		install -m 0644 ${B}/$i $STAGING_BASE_LIBDIR/ || die "failed to instal=
l $i"
>  	done
> -	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIB=
DIR}/libpthread.so
> -	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
> +	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > $STAGING_BASE=
_LIBDIR/libpthread.so
> +	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > $STAGING_BASE_LIBDIR/libc=
=2Eso
> =20
>  	rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
>  	oe_runmake 'install_root=3D${CROSS_DIR}/${TARGET_SYS}' \
> Index: packages/pkgconfig/pkgconfig.inc
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/pkgconfig/pkgconfig.inc	(revision 2736)
> +++ packages/pkgconfig/pkgconfig.inc	(working copy)
> @@ -8,6 +8,7 @@
>  PR =3D "r1"
> =20
>  SRC_URI =3D "http://pkgconfig.freedesktop.org/releases/pkg-config-${PV}.=
tar.gz \
> +           file://sysroot-support.patch;patch=3D1 \
>             file://glibconfig-sysdefs.h"
> =20
>  S =3D "${WORKDIR}/pkg-config-${PV}/"
> Index: packages/pkgconfig/pkgconfig-0.22/sysroot-support.patch
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/pkgconfig/pkgconfig-0.22/sysroot-support.patch	(revision 0)
> +++ packages/pkgconfig/pkgconfig-0.22/sysroot-support.patch	(revision 0)
> @@ -0,0 +1,102 @@
> +Add support for PKG_CONFIG_SYSROOT_DIR to pkgconfig
> +
> +---
> + main.c       |    5 ++++-
> + pkg-config.1 |    9 +++++++++
> + pkg.c        |   14 +++++++++++++-
> + pkg.h        |    3 +++
> + 4 files changed, 29 insertions(+), 2 deletions(-)
> +
> +Index: pkg-config-0.22/main.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- pkg-config-0.22.orig/main.c	2007-09-14 10:20:15.000000000 +0100
> ++++ pkg-config-0.22/main.c	2007-09-14 10:22:41.000000000 +0100
> +@@ -46,6 +46,8 @@
> + static int want_debug_spew =3D 0;
> + static int want_verbose_errors =3D 0;
> + static int want_stdout_errors =3D 0;
> ++char *pcsysrootdir =3D NULL;
> ++
> +=20
> + void
> + debug_spew (const char *format, ...)
> +@@ -196,7 +198,7 @@ main (int argc, char **argv)
> +   GString *str;
> +   GSList *packages =3D NULL;
> +   char *search_path;
> +-  char *pcbuilddir;
> ++	char *pcbuilddir;
> +   const char *pkglibdir;
> +   char **search_dirs;
> +   char **iter;
> +@@ -345,6 +347,7 @@ main (int argc, char **argv)
> +       }
> +   }
> + #endif
> ++  pcsysrootdir =3D getenv ("PKG_CONFIG_SYSROOT_DIR");
> +=20
> +   pcbuilddir =3D getenv ("PKG_CONFIG_TOP_BUILD_DIR");
> +   if (pcbuilddir)
> +Index: pkg-config-0.22/pkg.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- pkg-config-0.22.orig/pkg.c	2007-09-14 10:20:15.000000000 +0100
> ++++ pkg-config-0.22/pkg.c	2007-09-14 10:22:41.000000000 +0100
> +@@ -479,11 +479,23 @@ string_list_to_string (GSList *list)
> +   GSList *tmp;
> +   GString *str =3D g_string_new ("");
> +   char *retval;
> ++	int offset=3D0;
> +  =20
> +   tmp =3D list;
> +   while (tmp !=3D NULL)
> +     {
> +-      g_string_append (str, tmp->data);
> ++			if (pcsysrootdir !=3D NULL)
> ++				{
> ++					if (!strncmp(tmp->data,"-I",2) ||
> ++							!strncmp(tmp->data,"-L",2))
> ++						{
> ++							offset=3D2;
> ++							g_string_append_c (str,((char*)tmp->data)[0]);
> ++							g_string_append_c (str,((char*)tmp->data)[1]);
> ++							g_string_append (str,pcsysrootdir);
> ++						}
> ++				}
> ++      g_string_append (str, tmp->data+offset);
> +       g_string_append_c (str, ' ');
> +      =20
> +       tmp =3D g_slist_next (tmp);
> +Index: pkg-config-0.22/pkg-config.1
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- pkg-config-0.22.orig/pkg-config.1	2007-09-14 10:20:15.000000000 +0100
> ++++ pkg-config-0.22/pkg-config.1	2007-09-14 10:23:08.000000000 +0100
> +@@ -260,6 +260,15 @@ Don't strip -I/usr/include out of cflags
> + Don't strip -L/usr/lib out of libs
> +=20
> + .TP
> ++.I "PKG_CONFIG_SYSROOT_DIR"
> ++Modify -I and -L to use the directories located in target sysroot.
> ++this option is usefull when crosscompiling package that use pkg-config
> ++to determine CFLAGS anf LDFLAGS. -I and -L are modified to point to
> ++the new system root. this means that a -I/usr/include/libfoo will
> ++become -I/var/target/usr/include/libfoo with a PKG_CONFIG_SYSROOT_DIR
> ++equal to /var/target (same rule apply to -L)
> ++
> ++.TP
> + .I "PKG_CONFIG_LIBDIR"
> + Replaces the default \fIpkg-config\fP search directory.
> +=20
> +Index: pkg-config-0.22/pkg.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- pkg-config-0.22.orig/pkg.h	2007-09-14 10:20:15.000000000 +0100
> ++++ pkg-config-0.22/pkg.h	2007-09-14 10:22:41.000000000 +0100
> +@@ -123,6 +123,9 @@ void disable_private_libs(void);
> + /* If TRUE, do not automatically prefer uninstalled versions */
> + extern gboolean disable_uninstalled;
> +=20
> ++/* string that contain environment */
> ++extern char* pcsysrootdir;
> ++
> + #ifdef G_OS_WIN32
> + /* If TRUE, do not automatically define "prefix"  while
> +  * parsing each .pc file */
> Index: packages/qemu/qemu-native_20070613.bb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/qemu/qemu-native_20070613.bb	(revision 2734)
> +++ packages/qemu/qemu-native_20070613.bb	(working copy)
> @@ -1,7 +1,7 @@
>  require qemu_${PV}.bb
>  inherit native
>  DEPENDS =3D "zlib-native"
> -prefix =3D "${STAGING_DIR}/${BUILD_SYS}"
> +#prefix =3D "${STAGING_DIR}/${BUILD_SYS}"
> =20
>  python __anonymous() {
>      from bb import which, data
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFG7yzIhK5OsmQOmSARAgAkAJ0aTy56QwtpwM1RBTFYyL/P0yRoZwCeOy89
QNr6v6MP0MiX82i77zvdKc8=
=HJnJ
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
