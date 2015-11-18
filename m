Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 74D7F60767
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 14:33:15 +0000 (UTC)
Received: by wmec201 with SMTP id c201so281501374wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 06:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/m1q3nUprTXvtQX0fG+4BeNrMHIL+ygniN+n7pEpLsQ=;
	b=HFo98c2ZFfGpTiqwalrxzknLb7bJll+CE84dXKnkqr7PEl7NOAy8VOrhr0dSpxxg9X
	lqo7dK44B2RJt1v4wQcFLZonHevccwSXbAMgQMEeKZl50NWLD92+pdDHZ5AgqAiQ0f0j
	41ODNmjRDbho+6mF8qmnz9H/jCHlSm4Yec6PMp9aexplkwNK5avX9BMcRA8q6DxO5q+s
	R5RBDvjnQ7mCH4n9MJR3qehZuZdSrFpHdKywr6ojEkPrLBLa+ax4oL9Kqhg68koByLLw
	//LRcE53TPZ0YInLlPLSRaSCgtbp+mfnSGdgd2K0KwmxjD5FgXDYhjlWy5jLxbyCvn+M
	VH7Q==
X-Received: by 10.194.200.233 with SMTP id jv9mr2655462wjc.133.1447857195439; 
	Wed, 18 Nov 2015 06:33:15 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	200sm3601985wmn.11.2015.11.18.06.33.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Nov 2015 06:33:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 Nov 2015 15:33:30 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151118143330.GC2213@jama>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
	<1447271300-4153-3-git-send-email-adrian.freihofer@gmail.com>
	<20151116212303.GD2240@jama>
MIME-Version: 1.0
In-Reply-To: <20151116212303.GD2240@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH V2 02/17] modemmanager: Update to 1.4.12
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Nov 2015 14:33:21 -0000
X-Groupsio-MsgNum: 58705
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CblX+4bnyfN0pR09"
Content-Disposition: inline

--CblX+4bnyfN0pR09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2015 at 10:23:03PM +0100, Martin Jansa wrote:
> On Wed, Nov 11, 2015 at 08:48:05PM +0100, Adrian Freihofer wrote:
> >  - Fixes segfaults, memleaks and other bugs
> >  - Support more modems
> >=20
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> > ---
> >  .../{modemmanager_1.4.2.bb =3D> modemmanager_1.4.12.bb}        | 12 ++=
++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >  rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.4.2.b=
b =3D> modemmanager_1.4.12.bb} (71%)
> >=20
> > diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4=
=2E2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
> > similarity index 71%
> > rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.=
2.bb
> > rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12=
=2Ebb
> > index b273c91..db7a28d 100644
> > --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
> > +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
> > @@ -1,19 +1,19 @@
> >  SUMMARY =3D "ModemManager is a daemon controlling broadband devices/co=
nnections"
> >  DESCRIPTION =3D "ModemManager is a DBus-activated daemon which control=
s mobile broadband (2G/3G/4G) devices and connections"
> >  HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/ModemManager/"
> > -LICENSE =3D "GPLv2 & LGPLv2.1"
> > +LICENSE =3D "GPL-2.0 & LGPL-2.1"
> >  LIC_FILES_CHKSUM =3D " \
> >      file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> >      file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
> >  "
> > =20
> > -inherit autotools gettext gtk-doc systemd
> > +inherit gnomebase gettext systemd
> > =20
> > -DEPENDS =3D "glib-2.0 libmbim libqmi polkit libgudev dbus-glib"
> > +DEPENDS =3D "glib-2.0 libmbim libqmi (>=3D1.12.4) polkit libgudev dbus=
-glib"
>=20
> bitbake doesn't support versioned dependencies, I've removed
> "(>=3D1.12.4)" when cherry-picking to master-next, but I wonder how you
> were able to test this.
>=20
> > -SRC_URI =3D "http://www.freedesktop.org/software/ModemManager/ModemMan=
ager-${PV}.tar.xz"
> > -SRC_URI[md5sum] =3D "fe74eaa9a77e51e552b4356b4c7195cb"
> > -SRC_URI[sha256sum] =3D "07d332fbe6f45f788f740810951e04042aaf023bd5ecf8=
ef0b3a06e37703585d"
> > +SRC_URI =3D "${GNOME_MIRROR}/ModemManager/ModemManager-${PV}.tar.xz"

Why do you think it exists on GNOME_MIRROR?

http://ftp.gnome.org/pub/GNOME/sources/ModemManager/
shows only versions til 0.7.991

I'll undo this change for next build, but please be more careful next
time and really test the changes.

> > +SRC_URI[md5sum] =3D "66cc7266b15525cb366253e6639fc564"
> > +SRC_URI[sha256sum] =3D "7ef5035375a953b285a742591df0a65fd442f4641ce4d8=
f4392a41d6d6bc70b3"=20
> > =20
> >  S =3D "${WORKDIR}/ModemManager-${PV}"
> > =20
> > --=20
> > 2.4.3
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CblX+4bnyfN0pR09
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZMjDkACgkQN1Ujt2V2gByylwCgklbV++kWDVok6VyW2ArQaA0E
dl8AoJBDPnnIMGDUjZ7mBdvGrs8ZalZe
=VCOo
-----END PGP SIGNATURE-----

--CblX+4bnyfN0pR09--
