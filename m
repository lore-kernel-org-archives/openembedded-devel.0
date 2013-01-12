Received: from mail-wg0-f54.google.com ([74.125.82.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ttp5X-000197-KB
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jan 2013 01:36:46 +0100
Received: by mail-wg0-f54.google.com with SMTP id fg15so1072015wgb.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2013 16:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=/cvgOUlxRW8tuYMrxpiB0LO58F6l12xu65K6+4JaC3o=;
	b=sruzUOKk5pk8OTf7g5ffGL1ZmilehQ7b4vJ1ipwDeZJGgH/cmra0GdsMvjPkVrqyVH
	WcqblUCGLWyQWyp2Ib+tivNlqztvWB/youcrRV7sYteArvhR4vsRrTdRA6NeurxuavwU
	ARpyvaSNlA356Swa8vQvHqjZ901PuWdrOg1/jBFNSwlixWESSav/P8NLNR8BDfVJztD6
	KdxnB4/2f+surJo9lfwMrRIqXXOLWxCcZUbjgkNk8v3f62eexFv8O0kSHDfMsecMnhHS
	1I61SL2C29ZsWiPPPVSOgmx+w9rMz1dWivtBFc32Yl0afugP3moxFoYPIbsd3VqpA/e/
	c0+Q==
X-Received: by 10.194.92.180 with SMTP id cn20mr124140218wjb.51.1357950088237; 
	Fri, 11 Jan 2013 16:21:28 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w5sm1439011wif.11.2013.01.11.16.21.27
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 16:21:27 -0800 (PST)
Date: Sat, 12 Jan 2013 01:21:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Philip Balister <philip@balister.org>
Message-ID: <20130112002126.GA3085@jama>
References: <1357936861-8245-1-git-send-email-philip@balister.org>
	<1357936861-8245-3-git-send-email-philip@balister.org>
	<20130111223053.GB13385@jama.palm1.palmone.com>
	<50F0A887.3000106@balister.org>
MIME-Version: 1.0
In-Reply-To: <50F0A887.3000106@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 3/3] gnuradio : Update to version 3.6.3.
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
X-List-Received-Date: Sat, 12 Jan 2013 00:36:47 -0000
X-Groupsio-MsgNum: 42673
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline

--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2013 at 07:04:23PM -0500, Philip Balister wrote:
> You'd have to be crazy to run gnuradio on anything less than armv7a.
> However, I thought someone gave us a patch to let it build for machine
> without NEON. I'll look into this again.

I don't want to run it. Just trying to get world build sane.=20

Cheers,

>=20
> Philip
>=20
> On 01/11/2013 05:30 PM, Martin Jansa wrote:
> > On Fri, Jan 11, 2013 at 03:41:01PM -0500, Philip Balister wrote:
> >> Also fixes pakcaging issues for the examples package.
> >>=20
> >=20
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/gnuradio/3.6.3-r0/git/gnuradio-core/src/lib/filter/dotprod_ff=
f_armv7_a.c:
> > In function 'dotprod_fff_armv7_a': |
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/gnuradio/3.6.3-r0/git/gnuradio-core/src/lib/filter/dotprod_ff=
f_armv7_a.c:67:5:
> > error: inconsistent operand constraints in an 'asm' | make[2]: ***
> > [gnuradio-core/src/lib/CMakeFiles/gnuradio-core.dir/filter/dotprod_fff_=
armv7_a.c.o]
> > Error 1 | make[2]: *** Waiting for unfinished jobs.... |
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-=
linux/usr/bin/cmake
> > -E cmake_progress_report
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/gnuradio/3.6.3-r0/git/build/CMakeFiles
> >
> >=20
> |
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/bin/cmake
> -E cmake_progress_report
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/gnuradio/3.6.3-r0/git/build/CMakeFiles
> > | [ 37%] [ 37%] Generating gnuradio_core_general.pyc
> >=20
> > For whole log see=20
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130111_140417.log/
> >
> >  Cheers,
> >=20
> >> Signed-off-by: Philip Balister <philip@balister.org> ---=20
> >> meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb | 16
> >> +++++----------- 1 file changed, 5 insertions(+), 11
> >> deletions(-)
> >>=20
> >> diff --git
> >> a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> >> b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb index
> >> aca2f97..f084149 100644 ---
> >> a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb +++
> >> b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb @@ -4,8
> >> +4,6 @@ SECTION =3D  "apps" LICENSE =3D "GPLv3" LIC_FILES_CHKSUM =3D
> >> "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
> >>=20
> >> -PR =3D "r0" - DEPENDS =3D "uhd gsl fftwf python alsa-lib boost
> >> cppunit \ swig-native python-numpy python-pygtk orc qt4-x11-free
> >> qwt"
> >>=20
> >> @@ -23,11 +21,6 @@ RDEPENDS_${PN} =3D "python-core python-audio
> >> python-threading python-codecs \
> >>=20
> >> C_FILES_CHKSUM =3D
> >> "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
> >>=20
> >> -#do_configure_append() { -#	find ${S} -name Makefile | xargs sed
> >> -i s:'-I${STAGING_INCDIR_NATIVE'::g -#	find ${S} -name Makefile |
> >> xargs sed -i s:'-L${STAGING_LIBDIR_NATIVE'::g -#} -=20
> >> do_configure_prepend() { ${BUILD_CC}
> >> ${S}/gr-vocoder/lib/codec2/generate_codebook.c -o
> >> ${S}/gr-vocoder/lib/generate_codebook -lm echo
> >> "ADD_EXECUTABLE(generate_codebook IMPORTED)"
> >> >${S}/gr-vocoder/lib/generate_codebook.txt @@ -39,7 +32,7 @@
> >> do_compile_prepend() { cp ${S}/gr-vocoder/lib/codec2/defines.h
> >> ${OECMAKE_BUILDPATH}/gr-vocoder/lib/codec2 }
> >>=20
> >> -PACKAGES =3D+ "\ +PACKAGES +=3D " \ ${PN}-examples \ ${PN}-grc \ "=20
> >> @@ -53,20 +46,21 @@ FILES_${PN} +=3D "${prefix}/etc/gnuradio/*"
> >>=20
> >> FILES_${PN}-dbg +=3D "${PYTHON_SITEPACKAGES_DIR}/gnuradio/.debug \=20
> >> ${PYTHON_SITEPACKAGES_DIR}/gnuradio/*/.debug \ +
> >> ${datadir}/gnuradio/examples/*/.debug \ " FILES_${PN}-examples =3D
> >> "${datadir}/gnuradio/examples"
> >>=20
> >> -PV =3D "3.5.3" +PV =3D "3.6.3"
> >>=20
> >> FILESPATHPKG_prepend =3D "gnuradio-git:"
> >>=20
> >> -SRCREV =3D "f621a52f779381cfe550b4278b83e701a747944c" +SRCREV =3D
> >> "607a6fa3f80e08298ce7b3ee74ffca1590c05164"
> >>=20
> >> # Make it easy to test against developer repos and branches=20
> >> GIT_REPO =3D "gnuradio.git" GIT_BRANCH =3D "master"
> >>=20
> >> -SRC_URI =3D
> >> "git://gnuradio.org/git/${GIT_REPO};branch=3D${GIT_BRANCH};protocol=3D=
http
> >> \ +SRC_URI =3D
> >> "git://gnuradio.org/${GIT_REPO};branch=3D${GIT_BRANCH};protocol=3Dgit
> >> \ "
> >>=20
> >> S=3D"${WORKDIR}/git" -- 1.7.11.7
> >>=20
> >>=20
> >> _______________________________________________=20
> >> Openembedded-devel mailing list=20
> >> Openembedded-devel@lists.openembedded.org=20
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >>=20
> >=20
> >=20
> > _______________________________________________ Openembedded-devel
> > mailing list Openembedded-devel@lists.openembedded.org=20
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDwrIYACgkQN1Ujt2V2gBz2owCdEXYNr5xuv6d/FXBENG941VeL
ke0An0ZTr5R6lHSZF5EEKiON1uT3AT1G
=R2nU
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
