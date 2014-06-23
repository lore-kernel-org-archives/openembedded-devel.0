Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5615466055
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 12:29:29 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id n15so4187724wiw.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 05:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VP0KXuJZBvnkdY1Z4GXjWx9M5SXxA8IgrC+oZkFNgR0=;
	b=u5XB1MRRENiZdUbXLjHTXBg+NLrDf2RmKUvYep3ONFkycDYmLyu3DtId+Q/POovVuY
	XovieE9CTs1eVJzQ1JNQeLbiwIILs2BAerMtpMOU+0kiwpSSBrtYovohP1bHZI0zq2qt
	BHGeX94az1oVS9KKemIU+Ma+xQgKaTxCDMLqoFTBc7OSTqF4SipbUYLeQuDy46W8R65w
	SZ2TObQQmHBNCjEGwpi71OD+YN7EZiHh5hxNWqF4Q+zUl04TTVzips3bl5OgwOGuXeJH
	JNnJjD0m2m84CXVu1hkh0S4BYzZ6aW0NDvVpTFnyDsA9y9K4v2N/MrcedvyCCbVcpn0U
	cZAA==
X-Received: by 10.180.39.66 with SMTP id n2mr25813983wik.17.1403526566626;
	Mon, 23 Jun 2014 05:29:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i6sm32998130wiy.17.2014.06.23.05.29.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 05:29:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 Jun 2014 14:29:26 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140623122926.GE2437@jama>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
	<1403171993-26208-4-git-send-email-Martin.Jansa@gmail.com>
	<CAOLEWZU2OoLJw9zfyry4=Ju6qqxTF1NuntTCnxvBwjsE9d-BJA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOLEWZU2OoLJw9zfyry4=Ju6qqxTF1NuntTCnxvBwjsE9d-BJA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][WIP][PATCH 04/25] imlib2, mcnavi: Blacklist because of broken imlib2 after freetype2-config was removed
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
X-List-Received-Date: Mon, 23 Jun 2014 12:29:34 -0000
X-Groupsio-MsgNum: 50522
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ryJZkp9/svQ58syV"
Content-Disposition: inline

--ryJZkp9/svQ58syV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2014 at 07:05:16PM -0700, Stephen Arnold wrote:
> This one doesn't build with the pkg-config trick; it needs more help than
> that...  The attached bbappend is what works for me, after removing the
> blacklist.

I've pending patch to convert it to _git.bb recipe (from legacy repo),
I'll look into fixing freetype2.

> Steve
>=20
>=20
> On Thu, Jun 19, 2014 at 2:59 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-efl/recipes-efl/efl/imlib2_svn.bb             | 2 ++
> >  meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb
> > b/meta-efl/recipes-efl/efl/imlib2_svn.bb
> > index 8bd8032..9806de7 100644
> > --- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
> > +++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
> > @@ -7,6 +7,8 @@ PROVIDES =3D "virtual/imlib2"
> >  PV =3D "1.4.5+svnr${SRCPV}"
> >  SRCREV =3D "${EFL_SRCREV}"
> >
> > +PNBLACKLIST[imlib2] =3D "BROKEN: needs to be updated to use freetype2
> > pkg-config"
> > +
> >  inherit efl binconfig
> >  SRC_URI =3D "${E_SVN}/trunk;module=3D${SRCNAME};protocol=3Dhttp;scmdat=
a=3Dkeep"
> >  S =3D "${WORKDIR}/${SRCNAME}"
> > diff --git a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
> > b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
> > index d07b143..1a6e4a0 100644
> > --- a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
> > +++ b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
> > @@ -4,6 +4,8 @@ LICENSE =3D "GPLv3"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f0e2cd40e05189ec81232da84b=
d6e1a"
> >  DEPENDS =3D "ecore evas imlib2 gpsd edje edje-native mysql5"
> >
> > +PNBLACKLIST[mcnavi] =3D "BROKEN: depends on broken imlib2"
> > +
> >  SRC_URI =3D "
> > http://www.gps-routes.info/debian/pool/main/m/mcnavi/mcnavi_${PV}.tar.g=
z"
> >  SRC_URI[md5sum] =3D "6860cde5c02a9f93c829da4b10e5a226"
> >  SRC_URI[sha256sum] =3D
> > "ee7f65155e91386175875fc4f72f4bc94e4e9cdb8258112632da94520ef2c349"
> > --
> > 2.0.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ryJZkp9/svQ58syV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOoHaYACgkQN1Ujt2V2gBw7iwCfUzKBlzJq1r5yw7GKvIDE/ZUV
R4QAoIRjr0UL1cg3uy7A0Oyzn8xQgtPn
=rIA0
-----END PGP SIGNATURE-----

--ryJZkp9/svQ58syV--
