Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id CC4FE6A566
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:49:40 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e51so73763eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 01:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sQdmMw/hjM2oVJtUjGQdIpw6CJp/Az7DMT0P6I5jloE=;
	b=sDBI9rPBW1Ey6s60mFkNB1li6iH9sjZuUZHd7gqubNh9FdDsRFhL1w7eogUXHN68iH
	GibTyNh4FD0sjTfC0sNUsiLbC+gy0h7+NSujGE++89g1PAlFWFClsyt5DwWZUaZdFtbY
	2Tnw77k6RW+Cz5CBmstMEvJk+jiM/xPTkrHgfTWd7jsr3xAWijGRnsbzqVD4g9U6aYn9
	1FYxE2F4tCENaFUwYcmmcPWGg1Qn6xVuG+YHiBM3B6LnaR8S0bJwPB5n5XgF03b77J7o
	X8M9B2+gFXK7qEp+kKFJwFyVzMDM3W7vmHN7M5Xn1sq1ei44BFdKMD3JgyW2JvNG07tw
	1Tbw==
X-Received: by 10.15.82.67 with SMTP id z43mr811555eey.60.1389692981543;
	Tue, 14 Jan 2014 01:49:41 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o13sm30247eex.19.2014.01.14.01.49.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 01:49:40 -0800 (PST)
Date: Tue, 14 Jan 2014 10:50:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "ting.liu@freescale.com" <ting.liu@freescale.com>
Message-ID: <20140114095000.GP16995@jama>
References: <1389690610-4230-1-git-send-email-b28495@freescale.com>
	<1389690610-4230-2-git-send-email-b28495@freescale.com>
	<20140114092139.GO16995@jama>
	<d6d29dfe2a204196a850afc04467a23d@BN1PR03MB156.namprd03.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <d6d29dfe2a204196a850afc04467a23d@BN1PR03MB156.namprd03.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] inetutils: not hard coded libreadline path
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
X-List-Received-Date: Tue, 14 Jan 2014 09:49:41 -0000
X-Groupsio-MsgNum: 47721
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="foM9DbudB2CcldhH"
Content-Disposition: inline

--foM9DbudB2CcldhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2014 at 09:26:18AM +0000, ting.liu@freescale.com wrote:
> > -----Original Message-----
> > From: Martin Jansa [mailto:martin.jansa@gmail.com]
> > Sent: Tuesday, January 14, 2014 5:22 PM
> > To: Liu Ting-B28495
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH 2/2] inetutils: not hard coded
> > libreadline path
> >=20
> > On Tue, Jan 14, 2014 at 05:10:10PM +0800, b28495@freescale.com wrote:
> > > From: Ting Liu <b28495@freescale.com>
> > >
> > > Avoid below QA issues:
> > > | ERROR: QA Issue: package inetutils-ftp contains bad RPATH
> > > | ERROR: QA Issue: package inetutils-telnet contains bad RPATH
> > > | ERROR: QA Issue: package inetutils-telnetd contains bad RPATH
> > > | ERROR: QA run found fatal errors. Please consider fixing them.
> > > | ERROR: Function failed: do_package_qa
> >=20
> > Doesn't it autodetect libreadline?
>=20
> it can find libreadline without specifying --with-libreadline-prefix, so =
just remove the option to avoid QA errors.

If it disables libreadline support, that should be clearly stated in
commit message - from current one it looks like you're just fixing QA
issue.

>=20
> >=20
> > > Signed-off-by: Ting Liu <b28495@freescale.com>
> > > ---
> > >  .../inetutils/inetutils_1.9.1.bb                   |    1 -
> > >  1 files changed, 0 insertions(+), 1 deletions(-)
> > >
> > > diff --git a/meta-networking/recipes-
> > connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-
> > connectivity/inetutils/inetutils_1.9.1.bb
> > > index 97fc6a1..03b8e65 100644
> > > --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.=
bb
> > > +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.=
bb
> > > @@ -37,7 +37,6 @@ PACKAGECONFIG[uucpd] =3D "--enable-uucpd,--disable-
> > uucpd,readline"
> > >
> > >  EXTRA_OECONF =3D "--with-ncurses-include-dir=3D${STAGING_INCDIR} \
> > >          ${noipv6} \
> > > -        --with-libreadline-prefix=3D${STAGING_DIR_HOST}${prefix} \
> > >  "
> > >
> > >  do_configure_prepend () {
> > > --
> > > 1.7.3.4
> > >
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--foM9DbudB2CcldhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLVCEgACgkQN1Ujt2V2gBxnlACglQLpYyFw3m/LD+pcNyVzuUs2
mMsAn1fLS8OAuQb2NEkUAvBElC/cJrdc
=8D6Y
-----END PGP SIGNATURE-----

--foM9DbudB2CcldhH--
