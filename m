Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 10D0B6F378
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 16:07:54 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so3078851eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SdnciajhA8vz+uJrSq9bj85J26n5SgnVY/mAwGCcqzE=;
	b=nJ+7jad+fWH+KNqa9rEtgzGw/KKet2ZZdJ5gOc5bJxSTsD70u+kd9Sm/FM3Qk82MlD
	T7cszcqoCxc/0NDd1I44W1ZtBowiC0bHjyHORab4VaNVoHCDlTXVjQKRJQyLCyockYdN
	8k39w9Aaqsr6yUOdqelTRU4h10vLZmjiOC+XjVs02vmrfKbtOtp0yGRcy2KrpAL78SxC
	3XmDRg/1TySxll4oHBEgAuib4JqW6L10ECDi9ySekD42OwrH9m+oBSExU2UCA/a8FyQq
	n5T7ivHZ2PTBNzLbTtIZnL9pq5fXbAYs6/3yzzCDkquBEyZULQhSyohsOP7Pj/bXkmjT
	J0bg==
X-Received: by 10.15.31.137 with SMTP id y9mr2500222eeu.12.1395936475738;
	Thu, 27 Mar 2014 09:07:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x45sm5248230eeu.23.2014.03.27.09.07.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Mar 2014 09:07:54 -0700 (PDT)
Date: Thu, 27 Mar 2014 17:07:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140327160755.GR3709@jama>
References: <1395930787-25372-1-git-send-email-thomas.senyk@pelagicore.com>
	<5896879.V9IzFsXxVK@rudolf>
MIME-Version: 1.0
In-Reply-To: <5896879.V9IzFsXxVK@rudolf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH] qtbase.inc: add -no-xkbcommon
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
X-List-Received-Date: Thu, 27 Mar 2014 16:08:00 -0000
X-Groupsio-MsgNum: 48867
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VdnGiXwuH6t1Tqzo"
Content-Disposition: inline

--VdnGiXwuH6t1Tqzo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2014 at 03:36:39PM +0100, Thomas Senyk wrote:
> sorry I think I've missed=20
>=20
> --subject-prefix=3D"meta-qt5][PATCH"
>=20
> ... Is that 'bad' enough to re-send it?

I've noticed it and will apply, so no need to re-send this time.

> Is it:
> --subject-prefix=3D"meta-qt5][PATCH"

this one ^^ (as README says)

> or
> --subject-prefix=3D"oe][meta-qt5][PATCH"
>=20
> ?
>=20
> Greets
> Thomas
>=20
> On Thursday, 27 March, 2014 15:33:07 Thomas Senyk wrote:
> > If one builds with xkb, both -no-xkb and
> > -no-xkbcommon should be set.
> > Without -no-xkbcommon you'll get link-errors
> > for libcomposeplatforminputcontextplugin.so
> > ---
> >  recipes-qt/qt5/qtbase.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> > index 89736be..8aefb5c 100644
> > --- a/recipes-qt/qt5/qtbase.inc
> > +++ b/recipes-qt/qt5/qtbase.inc
> > @@ -105,7 +105,7 @@ PACKAGECONFIG[xsync] =3D "-xsync,-no-xsync"
> >  PACKAGECONFIG[xvideo] =3D "-xvideo,-no-xvideo"
> >  PACKAGECONFIG[openvg] =3D "-openvg,-no-openvg"
> >  PACKAGECONFIG[iconv] =3D "-iconv,-no-iconv,virtual/libiconv"
> > -PACKAGECONFIG[xkb] =3D "-xkb,-no-xkb,libxkbcommon"
> > +PACKAGECONFIG[xkb] =3D "-xkb,-no-xkb -no-xkbcommon,libxkbcommon"
> >  PACKAGECONFIG[evdev] =3D "-evdev,-no-evdev"
> >  PACKAGECONFIG[mtdev] =3D "-mtdev,-no-mtdev,mtdev"
> >  # depends on glib
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VdnGiXwuH6t1Tqzo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM0TNsACgkQN1Ujt2V2gByt/QCeORghECwe8pDPYVWcmbU5hXl4
Vm8AoIEdvpI17PoGWDJ7Hzl1TYtTKCZ4
=dJOl
-----END PGP SIGNATURE-----

--VdnGiXwuH6t1Tqzo--
