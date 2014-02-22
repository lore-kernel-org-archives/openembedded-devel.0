Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 918FE6E7E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 08:24:26 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id m10so1745469eaj.33
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 00:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7uu8gAklnirGrnbErwkeB+lBCWBv6cPbqn1d+0FiyjM=;
	b=g10J7OUiWmqFWEfi7djQHc25PJfsWePZft9j6d2jf85VMCXso9r21a914/u0LYXHD9
	ZhmU65ViGAgivctqygH/sgDkvTxZ+9lSXmmpw37e2Wv2NDxz4CgBcr50JMOfoTDNuQPD
	BWLug8prtD46M/egbChpipDWVNtJ01Xjt3Ud/hG8OL5aehfms2O8kubIzwxVBFPWTmqv
	5MFL11+YWoEC7qgkF9m+ID/3N/iOEnLsczbkojWEFxKieKvvTtnjRsjsvQxTAH+qWTN3
	6wMfbyKGfHcv1H0Yx7qysfFqZuYSURIfJjxPgEv46u+EskDoU8lCLdTJKWWmimNQ5uoh
	9zjg==
X-Received: by 10.14.177.135 with SMTP id d7mr1429265eem.33.1393057466969;
	Sat, 22 Feb 2014 00:24:26 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v6sm36097795eef.2.2014.02.22.00.24.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 00:24:25 -0800 (PST)
Date: Sat, 22 Feb 2014 09:25:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140222082502.GL3854@jama>
References: <1393047007-20507-1-git-send-email-armccurdy@gmail.com>
	<1393047007-20507-2-git-send-email-armccurdy@gmail.com>
	<20140222063919.GJ3854@jama>
MIME-Version: 1.0
In-Reply-To: <20140222063919.GJ3854@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH v2 2/2] qtwebkit-examples: add RDEPENDS for ca-certificates
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
X-List-Received-Date: Sat, 22 Feb 2014 08:24:29 -0000
X-Groupsio-MsgNum: 48266
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AQNmCumFClRcGgHG"
Content-Disposition: inline

--AQNmCumFClRcGgHG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2014 at 07:39:19AM +0100, Martin Jansa wrote:
> On Fri, Feb 21, 2014 at 09:30:07PM -0800, Andre McCurdy wrote:
> > If qtbase is configured with openssl support then the
> > qtwebkit browser example apps require CA certificates.
> >=20
> > Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> > ---
> >  recipes-qt/qt5/qt5.inc               | 2 ++
> >  recipes-qt/qt5/qtbase.inc            | 2 +-
> >  recipes-qt/qt5/qtwebkit-examples.inc | 1 +
> >  3 files changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> > index 7e739c5..e2a1662 100644
> > --- a/recipes-qt/qt5/qt5.inc
> > +++ b/recipes-qt/qt5/qt5.inc
> > @@ -7,6 +7,8 @@ inherit qmake5
> >  ICU =3D "icu "
> >  ICU_powerpc =3D "pango"
> > =20
> > +PACKAGECONFIG_OPENSSL ?=3D "openssl"
> > +
> >  QT_MODULE ?=3D "${BPN}"
> > =20
> >  # we don't want conflicts with qt4
> > diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> > index 6a0149a..d805c47 100644
> > --- a/recipes-qt/qt5/qtbase.inc
> > +++ b/recipes-qt/qt5/qtbase.inc
> > @@ -47,7 +47,7 @@ PACKAGECONFIG ??=3D " \
> >      udev \
> >      evdev \
> >      widgets \
> > -    openssl \
> > +    ${PACKAGECONFIG_OPENSSL} \
> >      ${PACKAGECONFIG_GL} \
> >      ${PACKAGECONFIG_FB} \
> >      ${PACKAGECONFIG_X11} \
> > diff --git a/recipes-qt/qt5/qtwebkit-examples.inc b/recipes-qt/qt5/qtwe=
bkit-examples.inc
> > index 50c28cd..84f16a4 100644
> > --- a/recipes-qt/qt5/qtwebkit-examples.inc
> > +++ b/recipes-qt/qt5/qtwebkit-examples.inc
> > @@ -10,3 +10,4 @@ SRC_URI +=3D " \
> > =20
> >  DEPENDS +=3D "qtwebkit"
> >  RDEPENDS_${PN}-examples +=3D "qtwebkit-qmlplugins"
> > +RDEPENDS_${PN}-examples +=3D "${@base_contains('PACKAGECONFIG_OPENSSL'=
, 'openssl', 'ca-certificates', '', d)}"
>=20
> This should be checking PACKAGECONFIG variable (not
> PACKAGECONFIG_OPENSSL).

Please ignore my comment, I haven't noticed that you've added
PACKAGECONFIG_OPENSSL to qt5.inc and it's actually "from qtbase's
PACKAGECONFIG".

I've added comment in qtbase.inc and integrated this to master-next.

Thanks
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AQNmCumFClRcGgHG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMIXt4ACgkQN1Ujt2V2gBy03gCfYBPshVuwIPK7MPr5hd3f8FQa
OxgAoLdk5GJZ4k6a3ExWzkYAvS/4Y78l
=w1Gf
-----END PGP SIGNATURE-----

--AQNmCumFClRcGgHG--
