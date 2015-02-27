Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id E0C7072491
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 20:44:45 +0000 (UTC)
Received: by widex7 with SMTP id ex7so2945374wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 12:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+tGD3qkGcmAzs7QxK4y3xS5pi7H4cD6UWd5OGo33hVY=;
	b=ifKPWBZxUheQfQQHM3JWocJN3VxE/JVFpSPYNy+FMvdw9XabBz6I3G5M7YHs3/re4Y
	yk7t477/E8SHVpsr0+hC20ckg8tweUYd0jCMT9wuMZUUoIJUS54Gy0usTHH5hgI+xI2F
	hk82++Am0SP0f0koDg7TWGMFGCTiTiqlnqIXsffC1sHUHsdMjJ7145txYfKd6XAW0bXB
	DXQh6xViCrLKkBESchgio6qjaEL1vSb/MAULUt29dps32ssgKwoN4evwbTB+3KcngwG7
	YYfYkTELi6mgt5Gk9wgLQ7HC6sbLmuloqvbBF3UN+MRROtBfHXW/wbV1JjgvcOiHiZFp
	b4dg==
X-Received: by 10.194.121.10 with SMTP id lg10mr9585873wjb.71.1425069886359;
	Fri, 27 Feb 2015 12:44:46 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n2sm4341863wiw.16.2015.02.27.12.44.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 12:44:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Feb 2015 21:45:05 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150227204505.GQ2309@jama>
References: <1425053339-17979-1-git-send-email-paul.gortmaker@windriver.com>
	<20150227162031.GP2309@jama> <54F0CBBA.8010403@windriver.com>
MIME-Version: 1.0
In-Reply-To: <54F0CBBA.8010403@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Peter Urbanec <openembedded-devel@urbanec.net>
Subject: Re: [PATCH v2] mozjs: fix build failure due to failed X11 configure test
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
X-List-Received-Date: Fri, 27 Feb 2015 20:44:46 -0000
X-Groupsio-MsgNum: 54545
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="de1H0RjRxOSdb4we"
Content-Disposition: inline

--de1H0RjRxOSdb4we
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2015 at 02:55:38PM -0500, Paul Gortmaker wrote:
> On 15-02-27 11:20 AM, Martin Jansa wrote:
> > On Fri, Feb 27, 2015 at 11:08:59AM -0500, Paul Gortmaker wrote:
> >> The failure intermittently shows up as follows:
> >>
> >> ERROR: This autoconf log indicates errors, it looked at host include a=
nd/or library paths while determining system capabilities.
> >> Rerun configure task after fixing this. The path was 'poky/build/tmp/w=
ork/core2-64-poky-linux/mozjs/17.0.0-r0/build'
> >> ERROR: Function failed: do_qa_configure
> >> ERROR: Logfile of failure stored in: poky/build/tmp/work/core2-64-poky=
-linux/mozjs/17.0.0-r0/temp/log.do_configure.8047
> >> ERROR: Task 5 (poky/meta-openembedded/meta-oe/recipes-extended/mozjs/m=
ozjs_17.0.0.bb, do_configure) failed with exit code '1'
> >>
> >> The configure log has:
> >>
> >> configure:5494: checking for IceConnectionNumber in -lICE
> >> configure:5513: x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dco=
re2 -msse3 -mfpmath=3Dsse --sysroot=3Dpoky/build/tmp/sysroots/genericx86-64=
 -o conftest  -O2 -pipe -g -feliminate-unused-debug-types  -Wl, -O1 -Wl,--h=
ash-style=3Dgnu -Wl,--as-needed -L/usr/lib conftest.c -lICE   1>&5
> >> poky/build/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linux/gcc=
/x86_64-poky-linux/4.9.1/ld: warning: library search path "/usr/lib" is uns=
afe for cross-compilation
> >>
> >> Checking build/config/autoconf.mk we find:
> >>
> >> X_CFLAGS =3D  -I/usr/include
> >> X_EXTRA_LIBS =3D
> >> X_LIBS =3D  -L/usr/lib
> >>
> >> Looking at the configure script, we see these invalid values are output
> >> when the autoconf test for X11 fails.  That test fails in the following
> >> fashion:
> >>
> >> configure:4768:27: fatal error: X11/Intrinsic.h: No such file or direc=
tory
> >>
> >> This header in turn gets put in the sysroot by our build of libxt.  So=
 we
> >> get build fails whenever mozjs is built before libxt.
> >>
> >> Aside from the configure test, it doesn't appear that mozjs really has
> >> a hard dependency on libxt in order to compile.  So we can avoid the
> >> problem by simply avoiding the configure test - and here we do that by
> >> looking for X11 in the distro features.
> >>
> >> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> >> ---
> >>
> >> [apologies if anyone gets this 2x ; the mailing list is misconfigured =
and
> >>  currently operating in subscriber-only mode; someone please fix that.]
> >>
> >> [v2: change depends on libxt to distro features solution]
> >>
> >> [v1: http://patchwork.openembedded.org/patch/88625/  ]
> >>
> >>  meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/=
recipes-extended/mozjs/mozjs_17.0.0.bb
> >> index 174f6fe0a89b..0a4cf6b03cc4 100644
> >> --- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> >> +++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> >> @@ -27,6 +27,8 @@ EXTRA_OECONF =3D " \
> >>      --libdir=3D${libdir} \
> >>  "
> >> =20
> >> +EXTRA_OECONF_X =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '-=
-with-x', '--without-x', d)}"
> >=20
> > Does it need some extra dependency when enabled?
>=20
> Not as far as I can tell ; only the libxt thing showed up, and
> that only happens as a result of configure autotests.
>=20
> >=20
> > Why don't you use PACKAGECONFIG for this?
>=20
> I searched for existing solutions in recipes for X/no-X type
> problems and found this.  And it follows a block of EXTRA_OECONF
> settings in the recipe that already exist, so I'm not sure why
> PACKAGECONFIG would be better/advantageous....

Because it's newer common solution for this kind of configuration and
allows to easily adjust it on per-recipe basis (e.g. from distro
config).

> >=20
> >>  # mozjs requires autoreconf 2.13
> >>  do_configure() {
> >>      ${S}/configure ${EXTRA_OECONF}
> >> --=20
> >> 2.2.1
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> >=20
> >=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--de1H0RjRxOSdb4we
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTw11EACgkQN1Ujt2V2gBxePACgrWAE+3cJBSB9S3JJPm3dFRKy
7V0AoIpI/WfBNV/axnwnXpPP2lFqjsj7
=1LER
-----END PGP SIGNATURE-----

--de1H0RjRxOSdb4we--
