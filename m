Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9D561637
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 12:39:02 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c4so4606748eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 04:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KM13RtMlz7cnnxM4YILEtEyujKdnt5OFuEVRW6M1DqM=;
	b=H06OCM8pF3vMMHOsbU0+GjerQdm+SXsQO9WQ9soz4K6Ea1pj5pCag0+TKwSrc9tQxk
	gY/EQNLBqmwlkFa1UTQg2b+Mp4RifppvM56zQbLhw4iup0NNd1qEpvQK34cww5WgY+80
	8XRirhR/crhv2rp6CFPvlk6jYR0kE/76x4TNGaFoirf9fiMkl8RxD4w4dEUEvBLNjebL
	KaCu8wjiRI6/eTrpoORasL2BtMex1VYsFrsIuQ4cw3/vPNJ1myUIbS4LQWacTlQcjQyi
	06/4jLqmaWoQ9FILKhf0tDv8iCKtZGTvGib/dL2O8VqVoAuB+yV+yuqYVCLl21fM9XbC
	U2lQ==
X-Received: by 10.15.24.142 with SMTP id j14mr2373623eeu.52.1385037541406;
	Thu, 21 Nov 2013 04:39:01 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o45sm51694515eep.2.2013.11.21.04.38.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Nov 2013 04:39:00 -0800 (PST)
Date: Thu, 21 Nov 2013 13:39:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131121123904.GX3708@jama>
References: <CAP71Wjy9mGKjDnzAKED7zFUY6J1c_2-ysUpH8uHgczZe5zNi9A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71Wjy9mGKjDnzAKED7zFUY6J1c_2-ysUpH8uHgczZe5zNi9A@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: making qt5 package machine specific
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
X-List-Received-Date: Thu, 21 Nov 2013 12:39:03 -0000
X-Groupsio-MsgNum: 47229
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v6gilOcl2gU05R9Q"
Content-Disposition: inline

--v6gilOcl2gU05R9Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2013 at 09:33:59AM +0100, Nicolas Dechesne wrote:
> hi,
>=20
> we are building a product/distro with qt5 with support for various SoC. t=
he
> way qt5 recipes are designed, it kind of forces the resulting packages to
> be  <machine> specific, not <arch> specific.
>=20
> first each <machine> has a different provider for GL/GLES and it impacts
> the RDEPENDS, on top of that we have machine specific patches in Qt5 in
> each of our BSP layer, whether we like it or not, that's a reality that we
> cannot have the very same Qt5 config + source code for all platforms.
>=20
> so we end up with many  <qt pkgs>-<arch> which are <machine> specific, not
> <arch>, and it messes up badly with sstate for example, especially when
> cleaning up the sstate (e.g. using sstate-cache-management -d).
>=20
> so i have a couple of questions:
>=20
>  - are we doing something really wrong here? or are we getting issues that
> anyone would get when trying to have a OE based product with Qt5 and
> multiple machines from the same <arch>?
>=20
>  - assuming this is a typical use case... i wish there was an easy
> mechanism to 'mark' all Qt5 packages as PACKAGE_ARCH =3D "${MACHINE_ARCH}=
",
> without having to .bbappend every single recipe. It is indeed quite common
> to have a .bbappend for qtbase, but not for the other packages...

There are 2 ways and I'm using both in different scenarios (different
builds)

1) .inc file with
PACKAGE_ARCH_pn-qtbase =3D "${MACHINE_ARCH}"
PACKAGE_ARCH_pn-qtdeclarative =3D "${MACHINE_ARCH}"
=2E..
for whole qt* stack (use sstate-diff-machines.sh script to see that you
get them all).

2) SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
# Depending on MACHINE_ARCH GL/GLES binaries (or mesa)
SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D "\
    qtbase->other-gl-gles-provider \
    qtbase->mesa \
"

2) doesn't solve your MACHINE specific patches of course

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--v6gilOcl2gU05R9Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKN/ugACgkQN1Ujt2V2gBxqGQCeLuxVuKrwU9rLBAJnReMxsRHH
MbsAnAo9RmQEvJg57C8Wq+dJGpNg92bo
=A4OB
-----END PGP SIGNATURE-----

--v6gilOcl2gU05R9Q--
