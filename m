Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 983556F783
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 15:11:35 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so3805080eei.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=856w080ZP7zNPjD98v5mTzhyEuSSqfOAb876SLMsYhY=;
	b=EH4FP14GTz8jdigu5tKlN0EhHEeWjxi0o1ni7LYG+6v7t2KP69/wSrAeuWwZmhMvd9
	1ASvacccEDFUR0orWBSA47KK2zQeMWyprwTybLOFjbsG678HBgOolLUG3Tkm1z34byK/
	9KQU//M1YLYQUiC6/Fm59NKKWfRzEzm7HAnSSpsgnpydBk6xwnHU8TkNwLi+2sh8eldg
	G3R8qcTTAtLXnt23VN8b/pzUvKeA4WWrshD4otq34KNvn5DCd1IojICM+N2nAL9H/3pM
	hFpscerX2hua/kfKYiXEVAGkt6GI0nj1AE6RegofvpNT8FG0nxgGOgUNF9FCHsjqfuKL
	IAYQ==
X-Received: by 10.15.44.3 with SMTP id y3mr4283969eev.58.1394550696442;
	Tue, 11 Mar 2014 08:11:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	43sm58473749eeh.13.2014.03.11.08.11.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 08:11:35 -0700 (PDT)
Date: Tue, 11 Mar 2014 16:11:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140311151148.GG2137@jama>
References: <1393516986-25391-1-git-send-email-ticotimo@gmail.com>
	<20140311142639.GE2137@jama>
MIME-Version: 1.0
In-Reply-To: <20140311142639.GE2137@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-multimedia][PATCH v2] libmusicbrainz: workaround for build-native/do_configure
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
X-List-Received-Date: Tue, 11 Mar 2014 15:11:39 -0000
X-Groupsio-MsgNum: 48598
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OFj+1YLvsEfSXdCH"
Content-Disposition: inline

--OFj+1YLvsEfSXdCH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2014 at 03:26:39PM +0100, Martin Jansa wrote:
> On Thu, Feb 27, 2014 at 08:03:06AM -0800, Tim Orling wrote:
> > From: Tim Orling <TicoTimo@gmail.com>
> >=20
> > Changes in v2:
> >     bump PR to r2 rather than drop (doh!)
> >=20
> > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > ---
> >  .../musicbrainz/libmusicbrainz_git.bb              | 50 ++++++++++++++=
+++++++-
> >  1 file changed, 48 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbra=
inz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_=
git.bb
> > index f6a8f53..2928587 100644
> > --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git=
=2Ebb
> > +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git=
=2Ebb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dfbc09390=
1857fcd118f065f900982c24"
> >  DEPENDS =3D "expat neon"
> > =20
> >  PV =3D "5.0.1+git${SRCPV}"
> > -PR =3D "r1"
> > +PR =3D "r2"
> > =20
> >  SRCREV =3D "0749dd0a35b4a54316da064475863a4ac6e28e7e"
> >  SRC_URI =3D "git://github.com/metabrainz/libmusicbrainz.git \
> > @@ -30,9 +30,55 @@ do_configure_prepend() {
> >            -DCMAKE_C_COMPILER=3D${BUILD_CC} \
> >            -DCMAKE_CXX_FLAGS=3D${BUILD_CXXFLAGS} \
> >            -DCMAKE_CXX_COMPILER=3D${BUILD_CXX} \
> > -          ..
> > +          ${S}=20
> >      make make-c-interface
> >      cd ..
> > +
> > +    # the first thing cmake_do_configure does is delete ${B}
> > +    # stash it first
> > +    cp -r build-native ..
> > +}
> > +
> > +# recreate default here, with work around for build-native
> > +cmake_do_configure() {
> > +	if [ "${OECMAKE_BUILDPATH}" -o "${OECMAKE_SOURCEPATH}" ]; then
> > +		bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH and OECMAKE_=
BUILDPATH.  The default behaviour is now out-of-tree builds with B=3DWORKDI=
R/build."
> > +	fi
> > +
> > +	if [ "${S}" !=3D "${B}" ]; then
> > +		rm -rf ${B}
> > +		mkdir -p ${B}
> > +		cd ${B}
> > +	fi
> > +
> > +	# bring build-native back into build/
> > +	mv ../build-native .
> > +
> > +	# Just like autotools cmake can use a site file to cache result that =
need generated binaries to run
> > +	if [ -e ${WORKDIR}/site-file.cmake ] ; then
> > +		OECMAKE_SITEFILE=3D" -C ${WORKDIR}/site-file.cmake"
> > +	else
> > +		OECMAKE_SITEFILE=3D""
> > +	fi
> > +
> > +	cmake \
> > +	  ${OECMAKE_SITEFILE} \
> > +	  ${S} \
> > +	  -DCMAKE_INSTALL_PREFIX:PATH=3D${prefix} \
> > +	  -DCMAKE_INSTALL_BINDIR:PATH=3D${bindir} \
> > +	  -DCMAKE_INSTALL_SBINDIR:PATH=3D${sbindir} \
> > +	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=3D${libexecdir} \
> > +	  -DCMAKE_INSTALL_SYSCONFDIR:PATH=3D${sysconfdir} \
> > +	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=3D${sharedstatedir} \
> > +	  -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=3D${localstatedir} \
> > +	  -DCMAKE_INSTALL_LIBDIR:PATH=3D${libdir} \
> > +	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=3D${includedir} \
> > +	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=3D${datadir} \
> > +	  -DCMAKE_INSTALL_SO_NO_EXE=3D0 \
> > +	  -DCMAKE_TOOLCHAIN_FILE=3D${WORKDIR}/toolchain.cmake \
> > +	  -DCMAKE_VERBOSE_MAKEFILE=3D1 \
> > +	  ${EXTRA_OECMAKE} \
> > +	  -Wno-dev
> >  }
>=20
> There is still some issue with this patch applied:
>=20
> ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libmusicb=
rainz/5.0.1+gitAUTOINC+0749dd0a35-r2/temp/log.do_configure.20744)
> ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/s=
hr-core/tmp-eglibc/work/core2-64-oe-linux/libmusicbrainz/5.0.1+gitAUTOINC+0=
749dd0a35-r2/temp/log.do_configure.20744
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bi=
t-64', 'x86_64-linux', 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_copy_aclocals
> | DEBUG: Python function autotools_copy_aclocals finished
> | DEBUG: Executing shell function do_configure
> | fatal: Not a git repository (or any parent up to mount parent /home/jen=
kins/oe/shr-core-branches/shr-core)
> | Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not se=
t).
> | WARNING: exit code 128 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at /home/jenk=
ins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libmusi=
cbrainz/5.0.1+gitAUTOINC+0749dd0a35-r2/temp/log.do_configure.20744)
> NOTE: recipe libmusicbrainz-5.0.1+gitAUTOINC+0749dd0a35-r2: task do_confi=
gure: Failed
> ERROR: Task 1242 (/home/jenkins/oe/shr-core-branches/shr-core/meta-openem=
bedded/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb=
, do_configure) failed with exit code '1'
>=20
> (link to full log in last State of bitbake world, Failed tasks 2014-03-11=
 e-mail)

Ah, it seems like I've reported this before :)

Yes it's caused by:
do_configure() {
    # The native build really doesn't like being rebuilt, so delete
    # it if it's already present. Also delete all other files not
    # known to Git to fix subsequent invocations of do_configure.
    git clean -dfx -e /.pc/ -e /patches/ .
=2E..

which is executed in ${B} which isn't git repo:
cd '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/libmusicbrainz/5.0.1+gitAUTOINC+0749dd0a35-r2/build'
do_configure

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OFj+1YLvsEfSXdCH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMfJ7QACgkQN1Ujt2V2gByT0QCeOtvDBk+oV7/5lZ1skZZ/Wrku
+CYAn0gsYeapktfCxFrU0m34xatvDQU0
=7X9G
-----END PGP SIGNATURE-----

--OFj+1YLvsEfSXdCH--
