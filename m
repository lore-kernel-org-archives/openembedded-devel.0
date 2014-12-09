Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id E4975723D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 16:41:05 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id bs8so8492337wib.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2014 08:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=erCrHpqYTqpzSPXqDq3TFHGt+De5hNvcXmDbAaJ6xhM=;
	b=AZlbPK1kD9yP4XAouGYlLnFT46uCsjLz4GIrDWyASIiknRdexNP8zyrpra2a561lbd
	T0bU3rXVRHT6H6VlUw9OgJFqPQ/WtQg69PQ+CF93ibtGAcwmSo2ppMnHpDnVST7dQITu
	BG9iGv341CgESCLM4i5qfv0GPkQQU2LWQoAW3MUgMPPHzBEMUOiF0+2G4RIp0C//crZt
	nszgfdkj0vDXgJNKd0pYh3K/ALPyp39iVdmGdVHet/fZI/JlWwiprdjymtDW+4/mR318
	qHam0I+qdkPMipmXcCiZol1gWjhk+dvnUlCKsl6am9uaOQ7P+QOC2xOrZWpYNXva1DaO
	+4mw==
X-Received: by 10.194.62.76 with SMTP id w12mr6513643wjr.5.1418143265433;
	Tue, 09 Dec 2014 08:41:05 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	b10sm2902495wiw.9.2014.12.09.08.41.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 08:41:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Dec 2014 17:41:05 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141209164105.GN2470@jama>
References: <1415923750-17942-1-git-send-email-denis@denix.org>
	<20141124194833.GC25432@denix.org>
	<20141208232826.GH13319@denix.org>
	<CAP9ODKp9S0==V9=nWYD2yFGpd2K5+nBDxRwqrZN92p4h2mvV-g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp9S0==V9=nWYD2yFGpd2K5+nBDxRwqrZN92p4h2mvV-g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCH 2/2] nativesdk-qtbase_git: re-add OEQt5Toolchain to SRC_URI
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
X-List-Received-Date: Tue, 09 Dec 2014 16:41:13 -0000
X-Groupsio-MsgNum: 53245
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AA9g+nFNFPYNJKiL"
Content-Disposition: inline

--AA9g+nFNFPYNJKiL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2014 at 10:57:23AM -0200, Otavio Salvador wrote:
> The patch needs rebase; can you update it and resend? I promise to
> look at it right away :D

It's already merged
https://github.com/meta-qt5/meta-qt5/commit/c9a1041cb956d94c04cbf635b00ca19=
725ffc129

The 2nd one is in master-next, but Anders comment should be resolved
first.

> On Mon, Dec 8, 2014 at 9:28 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > ping^2
> >
> > On Mon, Nov 24, 2014 at 02:48:33PM -0500, Denys Dmytriyenko wrote:
> >> ping
> >>
> >> On Thu, Nov 13, 2014 at 07:09:10PM -0500, Denys Dmytriyenko wrote:
> >> > From: Denys Dmytriyenko <denys@ti.com>
> >> >
> >> > The file is expected by do_install(), but _git version resets SRC_UR=
I.
> >> >
> >> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >> > ---
> >> >  recipes-qt/qt5/nativesdk-qtbase_git.bb | 7 ++++++-
> >> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5=
/nativesdk-qtbase_git.bb
> >> > index 96d86db..095bee7 100644
> >> > --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> >> > +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> >> > @@ -25,13 +25,18 @@ SRC_URI +=3D "\
> >> >  # common for qtbase-native and nativesdk-qtbase
> >> >  SRC_URI +=3D " \
> >> >      file://0011-Always-build-uic.patch \
> >> > -"
> >> > +"
> >> >
> >> >  # specific for nativesdk-qtbase
> >> >  SRC_URI +=3D " \
> >> >      file://0012-configure-preserve-built-qmake-and-swap-with-native=
-.patch \
> >> >  "
> >> >
> >> > +# CMake's toolchain configuration of nativesdk-qtbase
> >> > +SRC_URI +=3D " \
> >> > +    file://OEQt5Toolchain.cmake \
> >> > +"
> >> > +
> >> >  SRCREV =3D "06e706bdbb826b521389409b53079483fda5584a"
> >> >
> >> >  LICENSE =3D "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
> >> > --
> >> > 2.1.2
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AA9g+nFNFPYNJKiL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSHJiEACgkQN1Ujt2V2gByWAACdFsi4qaQEy9miSfxvBr0jpOW7
tTgAoLZcyzeupyTwRgvqYBtHxkMS9daC
=FP4P
-----END PGP SIGNATURE-----

--AA9g+nFNFPYNJKiL--
