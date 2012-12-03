Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfYCY-0005vy-AZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 16:44:58 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1623433eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 07:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4EsceJWmOJG9AZhlCwYZgSCavJ7nrPobDfurQzYCwSU=;
	b=YKkJKBmpZ5nvTJAh24cvw9UTp8mKICxZCtvHh9cTcPEAshSQLkOeInk3PL2KZBfcin
	wDMEdcIX9EXL202j5SgzFBXqokDxTOuuDr0iBLyTKDdAYoJE1FcN3lIqp8cUkxH/0HoF
	AJHIbC/LdAy7/o4IXLe6w2jKsQVZ+wH4tmrKbL7uTkoME4CZKEUJvI6xLie7PpyHmkLQ
	0NSeltWyJDPy272vRsQsGbMZ60hyfb8UmTYqAh+juBlRjftoEVHiQbtsP+gyfQG+8vOA
	CoGsM1RKntXHGhYpUFIUn1dRpq6rXGbOxWIb+W7rlrLmuUAaNnTF3YsP0G2yWhqejxAX
	jIMA==
Received: by 10.14.178.196 with SMTP id f44mr37580979eem.14.1354548636984;
	Mon, 03 Dec 2012 07:30:36 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b2sm31845156eep.9.2012.12.03.07.30.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 07:30:36 -0800 (PST)
Date: Mon, 3 Dec 2012 16:30:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121203153030.GE3354@jama.jama.net>
References: <1351604444-16246-1-git-send-email-s.stirtzel@googlemail.com>
	<CA+chaQfjv11Mk_vZwAHsfQEr=ncqda9BOKfych_xU+Gs8wZyQQ@mail.gmail.com>
	<CAGiJk9f3+e19_wk6SnoBPcgPCxYVAMW5Uq+-eouJ8B9Y04P4QQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9f3+e19_wk6SnoBPcgPCxYVAMW5Uq+-eouJ8B9Y04P4QQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] maliit-plugins: Clean up recipe and add missing RDEPENDS
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
X-List-Received-Date: Mon, 03 Dec 2012 15:44:58 -0000
X-Groupsio-MsgNum: 41860
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rgf3q3z9SdmXC6oT"
Content-Disposition: inline

--Rgf3q3z9SdmXC6oT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 03, 2012 at 04:16:03PM +0100, Samuel Stirtzel wrote:
> 2012/12/3 Martin Jansa <martin.jansa@gmail.com>:
> > On Tue, Oct 30, 2012 at 2:40 PM, Samuel Stirtzel
> > <s.stirtzel@googlemail.com> wrote:
> >> The following errors are only shown when started from console, also th=
ere are no visible errors during execution.
> >> Error fixed: QML Image: Error decoding: file:///usr/share/maliit/plugi=
ns/org/nemomobile/icon-m-input-methods-shift-lowercase.svg: Unsupported ima=
ge format
> >>
> >> This is unaffected from whether libqtsvg4 is installed or not.
> >>
> >> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> >> ---
> >>  .../recipes-support/maliit/maliit-plugins_git.bb   |   10 ++++------
> >>  1 file changed, 4 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb b/me=
ta-oe/recipes-support/maliit/maliit-plugins_git.bb
> >> index 932c0ae..2fb52c7 100644
> >> --- a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
> >> +++ b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
> >> @@ -8,6 +8,8 @@ inherit autotools qt4x11
> >>
> >>  DEPENDS =3D "maliit-framework"
> >>
> >> +RDEPENDS_${PN} +=3D "qt4-plugin-iconengine-svgicon qt4-plugin-imagefo=
rmat-svg"
> >> +
> >>  SRC_URI =3D "git://gitorious.org/maliit/maliit-plugins.git;branch=3Dm=
aster"
> >>
> >>  SRCREV =3D "0760e585df494b394df1b887e5138ffef19c481f"
> >> @@ -23,12 +25,8 @@ FILES_${PN} +=3D "\
> >>      ${datadir} \
> >>      "
> >>
> >> -FILES_${PN}-dbg +=3D "\
> >> -    ${libdir}/maliit/plugins-*/.debug \
> >> -    "
> >> +FILES_${PN}-dbg +=3D "${libdir}/maliit/plugins-*/.debug"
> >>
> >>  S=3D "${WORKDIR}/git"
> >>
> >> -do_install() {
> >> -  cd ${S} && (INSTALL_ROOT=3D${D} oe_runmake install)
> >> -}
> >> \ No newline at end of file
> >> +EXTRA_OEMAKE +=3D "INSTALL_ROOT=3D${D}"
> >> --
> >
> > It fails to build docs on hosts without doxygen, can we disable docs?
>=20
> Seems like I was careless, this hasn't been noticed as doxygen is
> installed on all my build machines.

No problem, it's hard to notice such issues unless you're building in
minimal chroot like I do.

> However I'll send a follow-up patch, do you want me to disable docs
> for the framework as well? The Framework uses gtk-doc.

It doesn't fail in framework, bbclass takes care of that IIRC, but fix
those QA Errors there, please.

Cheers,

> >
> > | make[1]: Entering directory
> > `/OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnuea=
bi/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef19c481f-r0/g=
it/doc'
> > | sed -e "s;@VERSION@;0.92.3;g" -e
> > "s;@IN_PWD@;/OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-=
linux-gnueabi/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef1=
9c481f-r0/git/doc;g"
> > doxyfile.conf.in >
> > /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueab=
i/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef19c481f-r0/gi=
t/doc/doxyfile.conf
> > && doxygen /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-l=
inux-gnueabi/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef19=
c481f-r0/git/doc/doxyfile.conf
> > | /bin/sh: doxygen: command not found
> > | make[1]: *** [html/index.html] Error 127
> > | make[1]: Leaving directory
> > `/OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnuea=
bi/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef19c481f-r0/g=
it/doc'
> >
> > Cheers,
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
> --=20
> Regards
> Samuel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Rgf3q3z9SdmXC6oT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC8xZYACgkQN1Ujt2V2gBxwKgCgrgdQ6itrs9XdnHtsef3KOVEj
emAAoIXMXGRJI90XGJEAuZqWG6tptWTF
=D+YB
-----END PGP SIGNATURE-----

--Rgf3q3z9SdmXC6oT--
