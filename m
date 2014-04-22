Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id F0886605A1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 05:02:50 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so4082127eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 22:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KhBwJgnQBgkzFYRSUdabHBZrvoKLD3YWlgpwucWDjSs=;
	b=vKCVGWxAktbIfxq77P+gZ1jEYw80L0ltvwHFO+mYcHnqGR2MdTLXl8iDD8/BT/4EpT
	wTDDXEdpq+teD9evZ/3QalMgIAceeWBHKEqullIR8OzBiU1BOyhl5fxxkUNc7fySnGlj
	jjnsjoHSFOiI/8WyPvYifKm29kCWb8xBycckwZpXI8FL9k/UYhtNXzJtUmU7jHBejTkV
	pnS6u2ncknP4e0WpyLiaDrqT9HbBtJWQUBuVtALupDx8kzqJ8Cu2zy4WpCTsSUznvd/r
	JFH6EoSF57mpocR0hci891zICGZ/JhoRLoZ9nwRUsMnkoCDopdxt7tJkCiAJUyAeK3ak
	MDaQ==
X-Received: by 10.14.47.12 with SMTP id s12mr87811eeb.116.1398142970547;
	Mon, 21 Apr 2014 22:02:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u46sm109458935eel.1.2014.04.21.22.02.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 22:02:49 -0700 (PDT)
Date: Tue, 22 Apr 2014 07:02:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140422050256.GH2486@jama>
References: <1397631065-13521-1-git-send-email-Chong.Lu@windriver.com>
	<20140420120130.GI2486@jama> <5355CB76.1050403@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5355CB76.1050403@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] rrdtool: enable libwrap, perl and python bindings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Apr 2014 05:02:52 -0000
X-Groupsio-MsgNum: 49417
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A6/RaK8Cbiy3x9M4"
Content-Disposition: inline

--A6/RaK8Cbiy3x9M4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2014 at 09:52:54AM +0800, Chong Lu wrote:
>=20
> On 04/20/2014 08:01 PM, Martin Jansa wrote:
> > On Wed, Apr 16, 2014 at 02:51:05PM +0800, Chong Lu wrote:
> >> 1. default enable libwrap, perl and python bindings
> >> 2. rrdtool uses perl.real, perl.real doesn't know where the PERL5LIB s=
hould be
> >> when prebuilts are used. Use the wrapper perl instead, perl sets PERL5=
LIB and
> >> invokes perl.real
> >> 3. While using dash as /bin/sh, subsequent commands in functions will =
not use
> >> the environment variables passed to the function call line unless expl=
icitly
> >> run "export ENV_VAR".
> >> 4. delete unrecognized options: "--enable-local-libpng" and "--enable-=
local-zlib"
> >>
> >> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> >> ---
> >>   meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb |  127 +++++++++++=
++++++++--
> >>   1 file changed, 120 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb b/meta-=
oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
> >> index 533451f..422e22f 100644
> >> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
> >> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
> >> @@ -5,6 +5,7 @@ LICENSE =3D "GPLv2"
> >>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D44fee82a1d2ed0676cf354782=
83e0aa0"
> >>  =20
> >>   DEPENDS =3D "libpng zlib cairo pango glib-2.0 libxml2"
> >> +DEPENDS_${PN}-perl =3D "perl-module-lib perl-module-dynaloader"
> > This looks like misspelled RDEPENDS_${PN}-perl
> >
> >>  =20
> >>   PR =3D "r2"
> >>  =20
> >> @@ -15,25 +16,137 @@ SRC_URI =3D "http://oss.oetiker.ch/rrdtool/pub/rr=
dtool-${PV}.tar.gz \
> >>   SRC_URI[md5sum] =3D "ffe369d8921b4dfdeaaf43812100c38f"
> >>   SRC_URI[sha256sum] =3D "956aaf431c955ba88dd7d98920ade3a8c4bad04adb1f=
9431377950a813a7af11"
> >>  =20
> >> -inherit autotools gettext
> >> +inherit autotools gettext pythonnative perlnative python-dir
> >>  =20
> >>   EXTRA_AUTORECONF =3D "-I m4"
> >>  =20
> >> -PACKAGECONFIG ??=3D ""
> >> +PACKAGECONFIG ??=3D "python libwrap perl"
> >> +
> >> +PACKAGECONFIG[python] =3D "--enable-python=3Dyes \
> >> +am_cv_python_pythondir=3D${STAGING_LIBDIR}/python${PYTHON_BASEVERSION=
}/site-packages \
> >> +am_cv_python_pyexecdir=3D${STAGING_LIBDIR}/python${PYTHON_BASEVERSION=
}/site-packages,\
> >> +--disable-python,python,"
> >> +
> >> +PACKAGECONFIG[perl] =3D \
> >> +"--enable-perl=3Dyes --with-perl-options=3D'INSTALLDIRS=3D"vendor"' \
> >> +ac_cv_path_PERL_CC=3D'${CC}',  \
> >> +--disable-perl,perl,"
> >> +
> >> +PACKAGECONFIG[libwrap] =3D ",--disable-libwrap,tcp-wrappers,libwrap"
> >>   PACKAGECONFIG[dbi] =3D "--enable-libdbi,--disable-libdbi,libdbi"
> >>  =20
> >>   EXTRA_OECONF =3D " \
> >>       --enable-shared \
> >> -    --enable-local-libpng \
> >> -    --enable-local-zlib \
> >> -    --disable-libwrap \
> >>       --program-prefix=3D'' \
> >>       rd_cv_ieee_works=3Dyes \
> >> -    --disable-perl \
> >> -    --disable-python \
> >>       --disable-ruby \
> >>       --disable-lua \
> >>       --disable-rpath \
> >>   "
> >>  =20
> >> +# don't use perl.real, this results in break issues with prebuilts si=
nce perl.real doesn't
> >> +# know where the PERL5LIB is...
> >> +# use wrapper perl instead
> >> +EXTRA_OEMAKE =3D "PERL=3D${STAGING_BINDIR_NATIVE}/perl-native/perl FU=
LLPERL=3D${STAGING_BINDIR_NATIVE}/perl-native/perl"
> >> +
> >> +export BUILD_SYS
> >> +export HOST_SYS
> >> +export STAGING_LIBDIR
> >> +export STAGING_INCDIR
> >> +
> >> +do_configure() {
> >> +	#fix the pkglib problem with newer automake
> >> +	#perl
> >> +	sed -i -e "s|-Wl,--rpath -Wl,\$rp||g" \
> >> +	    ${S}/bindings/perl-shared/Makefile.PL
> >> +
> >> +	#python
> >> +	sed -i -e '/PYTHON_INCLUDES=3D"-I${/c \
> >> +	PYTHON_INCLUDES=3D"-I=3D/usr/include/python${PYTHON_BASEVERSION}"' \
> >> +	    ${S}/m4/acinclude.m4
> >> +	#remove the hardcoded $(libdir) rpath
> >> +	sed -i -e 's|--rpath=3D$(libdir)||g' ${S}/bindings/Makefile.am
> >> +
> >> +	autotools_do_configure
> >> +
> >> +	perl_version=3D`perl -v 2>/dev/null | \
> >> +	    sed -n 's/This is perl.*v[a-z ]*\([0-9]\.[0-9][0-9.]*\).*$/\1/p'`
> >> +
> >> +	#modify python sitepkg
> >> +	#remove the dependency of perl-shared:Makefile
> >> +	#or perl-shared/Makefile will be regenerated
> >> +	#if any code touch bindings/Makefile after below perl bindings code
> >> +	sed -i -e "s:\$(PYTHON) setup.py install:\$(PYTHON) setup.py install=
 \
> >> +	    --install-lib=3D${D}${PYTHON_SITEPACKAGES_DIR}:" \
> >> +	    -e "s:perl-shared/Makefile.PL Makefile:perl-shared/Makefile.PL:"=
 \
> >> +	    ${S}/bindings/Makefile
> >> +
> >> +	#redo the perl bindings
> >> +	(
> >> +	cd bindings/perl-shared;
> >> +	perl -I${STAGING_LIBDIR}/perl/$perl_version Makefile.PL INSTALLDIRS=
=3D"vendor"
> >> +	    INSTALLPRIVLIB=3D"abc";
> >> +	sed -i -e "s| ${libdir}/perl/| ${STAGING_LIBDIR}/perl/|g" Makefile;
> >> +
> >> +	cd ../../bindings/perl-piped;
> >> +	perl -I${STAGING_LIBDIR}/perl/$perl_version Makefile.PL INSTALLDIRS=
=3D"vendor";
> >> +	sed -i -e "s| ${libdir}/perl/| ${STAGING_LIBDIR}/perl/|g" Makefile;
> >> +	)
> >> +
> >> +	#change the interpreter in file
> >> +	sed -i -e "s|^PERL =3D ${STAGING_BINDIR_NATIVE}/.*|PERL =3D /usr/bin=
/perl|g" \
> >> +	    ${S}/examples/Makefile
> >> +	sed -i -e "s|${STAGING_BINDIR_NATIVE}/perl-native/perl|/usr/bin/perl=
|g" \
> >> +	    ${S}/examples/*.pl
> >> +}
> >> +
> >> +python populate_packages_prepend() {
> >> +    def fill_more(name, dbg=3DTrue, rdep=3DNone):
> >> +        if name is None or name.strip() =3D=3D "":
> >> +            return
> >> +
> >> +        fpack=3Dd.getVar('PACKAGES') or ""
> >> +        fpack=3D"${PN}-" + name + " " + fpack
> >> +        if dbg:
> >> +            fpack=3D"${PN}-" + name + "-dbg" + " " + fpack
> >> +        d.setVar('PACKAGES', fpack)
> >> +        if rdep is not None:
> >> +            prdep=3Dd.getVar('RDEPENDS_${PN}-' + name) or ""
> >> +            prdep=3Drdep + " " + prdep
> >> +            d.setVar('RDEPENDS_${PN}-' + name, prdep)
> >> +
> >> +            prdep=3Dd.getVar('RDEPENDS_${PN}-' + name) or ""
> >> +            bb.debug(1, "RDEPENDS_${PN}-" + name + "=3D" + prdep)
> >> +
> >> +    conf=3D(d.getVar('PACKAGECONFIG', True) or "").split()
> >> +    pack=3Dd.getVar('PACKAGES') or ""
> >> +    bb.debug(1, "PACKAGECONFIG=3D%s" % conf)
> >> +    bb.debug(1, "PACKAGES1=3D%s" % pack )
> >> +
> >> +    if "perl" in conf :
> >> +        fill_more("perl")
> >> +
> >> +    if "python" in conf:
> >> +        fill_more("python")
> >> +
> >> +    pack=3Dd.getVar('PACKAGES', True) or ""
> >> +    bb.debug(1, "PACKAGES after=3D%s" % pack)
> >> +
> >> +    #debug code
> >> +    #prdep=3Dd.getVar('RDEPENDS_${PN}') or ""
> >> +    #bb.debug(1, "RDEPENDS_${PN}" + "=3D" + prdep)
> >> +    #prdep=3Dd.getVar('RDEPENDS') or ""
> >> +    #bb.debug(1, "RDEPENDS" + "=3D" + prdep)
> >> +}
> >> +
> >> +FILES_${PN}-doc +=3D "${datadir}/examples"
> >> +
> >> +DESCRIPTION_${PN}-perl =3D \
> >> +"The ${PN}-perl package includes RRDtool bindings for perl."
> >> +FILES_${PN}-perl =3D "${libdir}/perl/vendor_perl/* ${datadir}/${PN}/e=
xamples"
> >> +FILES_${PN}-perl-dbg =3D "${libdir}/perl/vendor_perl/*/auto/RRDs/.deb=
ug"
> >>  =20
> >> +DESCRIPTION_${PN}-python =3D \
> >> +"The ${PN}-python package includes RRDtool bindings for python."
> >> +FILES_${PN}-python =3D "${libdir}/python${PYTHON_BASEVERSION}/site-pa=
ckages/*"
> >> +FILES_${PN}-python-dbg =3D "${libdir}/python${PYTHON_BASEVERSION}/sit=
e-packages/.debug"
> > I think there should be just one -dbg package.
> If have only one -dbg package, we will get QA error:
> non debug package contains .debug directory: rrdtool-perl
> So, I split them into two packages.
> I will resend V2 for other issues.

You can have one -dbg package which contains all FILES_* if you order
PACKAGES correctly.

>=20
> Best Regards
> Chong
> >> --=20
> >> 1.7.9.5
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--A6/RaK8Cbiy3x9M4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNV+AAACgkQN1Ujt2V2gByXLwCgne1o//loWwNyGFj+4nYli24y
sPkAni0sbDdWftqsPMncNUPu2ss57WjH
=0oDY
-----END PGP SIGNATURE-----

--A6/RaK8Cbiy3x9M4--
