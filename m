Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 33B3261F47
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 12:07:52 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id uo1so4151012pbc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 05:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RgnDGoS48INW5b8RJgeZ0fSTughYW70blZqTTHrVSHw=;
	b=yIeuw9Vd0WfZFlOPLnOz99dT6q3Wqt8IVWCfQEtOMosRAmTkQz5322p4+Ray4G2ygx
	prN5TZ5DoQj/2xsMbPch6xvWMbwM6a31xHN77XDxaE/efVFtnp+/TNNdbeN6d+7MCSyT
	A0VmYnouAZZw/5Ckx1ENUBKr7es0x2xQK4X6J16Df0yUg+78iA2X+kMdKf/98T3VG1EL
	bCs4KACvsp0tEfDI1HJHUpf4Jm8KtYJDSsce1Y1Ag+/d/0sUUNE1MSJRoiNR3h2xFka8
	hqmHdsvb0saGv6we1vr96pHLcaCjLSfhPXuumFW0OWmURJVhqaILtkmvulcOuivW0jrt
	zdoQ==
X-Received: by 10.66.25.244 with SMTP id f20mr8629672pag.211.1369397272963;
	Fri, 24 May 2013 05:07:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ri8sm16019728pbc.3.2013.05.24.05.07.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 24 May 2013 05:07:52 -0700 (PDT)
Date: Fri, 24 May 2013 14:07:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130524120750.GV32431@jama>
References: <3389668.90m8Qn9G8H@luxon>
MIME-Version: 1.0
In-Reply-To: <3389668.90m8Qn9G8H@luxon>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5] Problems with Qt5 and CMake
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
X-List-Received-Date: Fri, 24 May 2013 12:07:52 -0000
X-Groupsio-MsgNum: 44859
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZjLa2K+dB9SFbrgo"
Content-Disposition: inline

--ZjLa2K+dB9SFbrgo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2013 at 01:34:40PM +0200, Manuel Nickschas wrote:
> Hi,
>=20
> we're trying to deploy a Qt5-based piece of software on a Yocto system (I=
=20
> hope this is on topic for this mailing list as well; the issue I'm about =
to=20
> describe should occur on pure OE too). As build system for this software,=
 we=20
> use CMake.
>=20
> We've added meta-qt5 (master) and successfully installed qtbase on the=20
> platform. However, there is a serious issue if one tries to cross-compile=
=20
> CMake-based software against the resulting Qt5 installation.
>=20
> As you probably know, Qt5 ships its own support for CMake in the form of =
a=20
> bunch of Qt5$ModuleConfig.cmake files somewhere in /usr/lib/cmake.=20
> These files are found with a find_package(Qt5Core) call and set everythin=
g=20
> needed for building against the Qt5 installation. The problem is, that th=
ose=20
> files contain absolute paths to both the libraries and the host tools for=
=20
> building (such as moc, rcc etc).
>=20
> meta-qt5 actually installs two sets of CMake files for Qt5, one in the ta=
rget=20
> sysroot (from the qtbase package) and one in the native sysroot (from the=
=20
> qtbase-native package). A recipe inheriting cmake.bbclass will find the o=
nes=20
> in the target sysroot.
>=20
> The issue is that these files hardcode the paths *on the target*, i.e. th=
ey try=20
> to find the host tools in /usr/bin/qt5/ and the libraries in /usr/lib/. O=
bviously,=20
> this fails when trying to build against those, because the target sysroot=
 path=20
> isn't prepended.
>=20
> If I remove the CMake files from the target sysroot (could not figure out=
 how=20
> to force it otherwise in my recipe), the ones from the native sysroot are=
 found=20
> and used instead. These actually contain proper paths into the native=20
> sysroot, so the build tools - like moc - are found and the program compil=
es=20
> successfully - but it can't link, because it then tries to link to the li=
braries in=20
> the native sysroot. And those are, of course, built for the wrong archite=
cture.
>=20
> I'm at a loss as of how to properly fix this issue. What we need is a set=
 of=20
> CMake config files for Qt5 that point to the tools in the native sysroot =
and the=20
> libraries in the target sysroot. However, we probably wouldn't want to de=
ploy=20
> them as such on the target (because there we want to actually point to bo=
th=20
> tools and libraries in /usr for the target), and we probably also wouldn'=
t want=20
> to do it in the native sysroot (because then we couldn't build native thi=
ngs=20
> that like to link to the native libraries).
>=20
> Of course, I could just copy the CMake files from Qt5, patch them=20
> accordingly and ship them as part of my project; but bundling such things=
 is=20
> evil and I would really like to avoid this.
>=20
> So now I'm wondering, are people here aware of that issue and have a plan=
=20
> or idea on how to fix this?
>=20
> https://bugreports.qt-project.org/browse/QTBUG-28922 might be relevant,=
=20
> although I am not sure if this is describing a similar issue and if it ap=
plies to=20
> the multiple sysroot approach Yocto uses.
>=20
> Thank you for any pointers.

I don't have any component which uses CMake and Qt5, so I haven't tested
this, but .prl, .la and .pc files were also generated with wrong paths,
check those patches in qtbase.

It would be good to let CMake respect OE_QMAKE_PATH_* variables, so you can
generate .cmake files with correct paths for target and in OE builds
override them with OE_QMAKE_PATH_* values to use correct sysroot.

The same for finding native host tools in
OE_QMAKE_PATH_EXTERNAL_HOST_BINS

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZjLa2K+dB9SFbrgo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGfWBYACgkQN1Ujt2V2gByxzgCfTKANdTbFVuYhkLPtgeG6C0aB
u+MAnRZaUYR1OPPf9i7IMa5AM+YGgvny
=ZYn+
-----END PGP SIGNATURE-----

--ZjLa2K+dB9SFbrgo--
