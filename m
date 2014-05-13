Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f48.google.com (unknown [209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6EE2A60167
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 15:02:43 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id mc6so386002lab.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 08:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RLDYPAXuvGYFR9JRbFYa1GLV+g0UC83jj0zSyyY3w1k=;
	b=UhxFZG/5JJdHJX/hZ+Z3W6cYlgcR1UFFWP3fh/F2lQM67oVGxY1AJ6BxMwk1sMTaJy
	IlA3hGfkHlmcvJzruosCovHxLi4OmKp3pbISqsvqjCa7Px0Egs9Q2tz1eydrsnNwjDQm
	ANwMq7A09Kigjg7E4EXzCc8dCat9/hLCq0ebQKQVNMtNOWwd46K5/HHIbC66emZzTzav
	5+vi2aYZljnsAVRpZ6iK5uqUuCsFTQrV+YOMpNFyYh7Jpdx2CZVyjOvoeAmHr2w6VRwL
	VaGABNniZIGYhexr155nz4T0rH6A10rYgGlfwav5k8za4h4dSr5ajXaXQILTEl6CjLbx
	85rw==
X-Received: by 10.112.55.70 with SMTP id q6mr5696028lbp.5.1399993363708;
	Tue, 13 May 2014 08:02:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	aa1sm16939339lbd.12.2014.05.13.08.02.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 May 2014 08:02:42 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 May 2014 17:03:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140513150310.GO22774@jama>
References: <cover.1399914295.git.ben.shelton@ni.com>
	<139978ea7125a5ffb15a583faef889b1409e3987.1399914295.git.ben.shelton@ni.com>
	<8672BB614B4CCA40A6B3BDD6FD82050BA112C7DD@COSNADEXC13.usr.ingenico.loc>
	<20140513082931.GK22774@jama>
	<20140513145203.GA31462@bshelton-desktop>
MIME-Version: 1.0
In-Reply-To: <20140513145203.GA31462@bshelton-desktop>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 1/7] bdftopcf: add recipe
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
X-List-Received-Date: Tue, 13 May 2014 15:02:44 -0000
X-Groupsio-MsgNum: 49918
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5AmtYbcgdBTTPS58"
Content-Disposition: inline

--5AmtYbcgdBTTPS58
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2014 at 09:52:03AM -0500, Ben Shelton wrote:
> On 05/13, Martin Jansa wrote:
> > On Tue, May 13, 2014 at 08:08:18AM +0000, Matthieu CRAPET wrote:
> > > Hi,
> > >=20
> > > Did you reused this recipe:
> > > https://www.mail-archive.com/openembedded-devel%40lists.openembedded.=
org/msg35721.html
> > > If so, you could give some credits to the original author.
> >=20
> > But it doesn't seem to address the review comments in original patch.
> >=20
>=20
> I thought the issue with the original patch was that the "require
> recipes-graphics/xorg-app/xorg-app-common.inc" line needed to be moved
> to the top of the recipe to fix the build.  Are there other changes that
> need to be made?

Ah right, sorry I've overlooked it, it's in master-next now, thanks!

>=20
> Thanks,
> Ben
>=20
> > > -----Message d'origine-----
> > > De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:open=
embedded-devel-bounces@lists.openembedded.org] De la part de Ben Shelton
> > > Envoy=E9=A0: lundi 12 mai 2014 19:32
> > > =C0=A0: openembedded-devel@lists.openembedded.org
> > > Objet=A0: [oe] [meta-oe][PATCH 1/7] bdftopcf: add recipe
> > >=20
> > > The bdftopcf tool is necessary to build the core X fonts, which ship =
in BDF format.  Adapted from a recipe in OE-Classic and from an earlier mai=
ling list post by Trevor Woerner.
> > >=20
> > > Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> > > ---
> > >  meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb | 13 +++++++++++=
++
> > >  1 file changed, 13 insertions(+)
> > >  create mode 100644 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.=
bb
> > >=20
> > > diff --git a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb b/me=
ta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
> > > new file mode 100644
> > > index 0000000..5009d54
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
> > > @@ -0,0 +1,13 @@
> > > +require recipes-graphics/xorg-app/xorg-app-common.inc
> > > +
> > > +SUMMARY =3D "bdftopcf is a tool to convert BDF fonts to PCF fonts"
> > > +HOMEPAGE =3D "http://cgit.freedesktop.org/xorg/app/bdftopcf/"
> > > +SECTION =3D "x11/app"
> > > +LICENSE =3D "MIT"
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9a35333adf75edd1eaef84bc=
a65a490"
> > > +DEPENDS =3D "libxfont"
> > > +
> > > +SRC_URI[md5sum] =3D "96a648a332160a7482885800f7a506fa"
> > > +SRC_URI[sha256sum] =3D "eaf59057ba3d7cffe29526562ce50868da7da823487a=
4cfb3e16946e5ffd2798"
> > > +
> > > +BBCLASSEXTEND =3D "native"
> > > --
> > > 1.9.3
> > >=20
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > --=20
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5AmtYbcgdBTTPS58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNyNC4ACgkQN1Ujt2V2gByvEwCgpwk0QSayvM8lgEom1zMPZzIf
pO4An0alkFKU4Mr4rkx/LCHcMmpePzU2
=Hanq
-----END PGP SIGNATURE-----

--5AmtYbcgdBTTPS58--
