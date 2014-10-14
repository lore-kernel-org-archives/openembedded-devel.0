Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id C80D36ACB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 05:04:24 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so10165184wgh.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 22:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D8YEJBNs6aZeHE10EaoQdlwke3KdLKZK1lm3I092JZI=;
	b=i9gAlX2V0opdbnWjKQQzpg/hgfzYd9P9ZGdUrBRJPlbwEQ/FyoWXAZhNr9PQeByg36
	XemxyTXgX5o+S5A353CoGRY9zfAQxIil/qxrz3Pf6DO07N3ZSd7ZJH1n6sEES/7qBjwh
	QO2u4BsF7WLZ4LBk4po1zdtb6FRjBcYKIF1n04CxTkHUZQxcjtREeQmaLe4otLzCuyOl
	NG5xVARAyyE+Y90fFCUsz48HJXYtTM/czR8HBjKTKLB95LZspscmwlWkwUgQummAaSEX
	zleXzB0IvM8C7euFb5oU1813i6n5s1ASUZs7/VTkKA5HS8I01Byqc2vbLXow82g42f2l
	Wfrg==
X-Received: by 10.180.72.5 with SMTP id z5mr3158746wiu.16.1413263064618;
	Mon, 13 Oct 2014 22:04:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cx1sm14340794wib.1.2014.10.13.22.04.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Oct 2014 22:04:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Oct 2014 07:06:12 +0200
To: Nick D'Ademo <nickdademo@gmail.com>
Message-ID: <20141014050612.GH3000@jama>
References: <CANR6C54p6yC1FPviBpmX-qHiF198s3vK7UWEmmDj3hYs7mAovQ@mail.gmail.com>
	<CANR6C57416FmV0MHSKmKLvD=Xdf=Lds5OnrHu_6nCW8z3qB_jg@mail.gmail.com>
	<20141013071037.GA5099@ad.chargestorm.se>
	<20141013081638.GF3000@jama>
	<CANR6C57Ojtx=ptYQiMP4oRrSzzc24JiCfdXitRXvvVScjcEqXg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANR6C57Ojtx=ptYQiMP4oRrSzzc24JiCfdXitRXvvVScjcEqXg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] What is needed to build a recipe with CMake?
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
X-List-Received-Date: Tue, 14 Oct 2014 05:04:31 -0000
X-Groupsio-MsgNum: 52485
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLauP2uySp+9cKYP"
Content-Disposition: inline

--SLauP2uySp+9cKYP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2014 at 08:41:10AM +1100, Nick D'Ademo wrote:
> Hi Martin,
>=20
> Thanks - what are some example recipes in that layer? (I had a look but
> couldn't find any cmake + qt5 recipes)

OE @ ~/meta-webos-ports $ git grep inherit.*cmake_qt5
recipes-webos/apps/org.webosports.app.phone.bb:inherit cmake_qt5
recipes-webos/luna-appmanager/luna-appmanager.bb:inherit cmake_qt5
recipes-webos/luna-next/luna-next.bb:inherit cmake_qt5
recipes-webos/luna-qml-launcher/luna-qml-launcher.bb:inherit cmake_qt5
recipes-webos/luna-sysmgr-common/luna-sysmgr-common.bb:inherit cmake_qt5
recipes-webos/luna-sysmgr/luna-sysmgr.bb:inherit cmake_qt5
recipes-webos/luna-webappmanager/luna-webappmanager.bb:inherit cmake_qt5
recipes-webos/mediaindexer/mediaindexer.bb:inherit cmake_qt5
recipes-webos/webapp-launcher/webapp-launcher.bb:inherit cmake_qt5

>=20
> Nick
>=20
> On Mon, Oct 13, 2014 at 7:16 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > On Mon, Oct 13, 2014 at 09:10:37AM +0200, Anders Darander wrote:
> > > Hi,
> > >
> > > * Nick D'Ademo <nickdademo@gmail.com> [141013 01:50]:
> > > > Has anyone had any success at all building a Qt5-based recipe with
> > CMake?
> > >
> > > Yes, I've at least got a local recipe here building KDSoap, which uses
> > > cmake.
> >
> > See meta-webos-ports layer for more recipes using cmake + qt5.
> >
> > >
> > >
> > >
> > > > On Wed, Oct 8, 2014 at 1:41 PM, Nick D'Ademo <nickdademo@gmail.com>
> > wrote:
> > >
> > > > > Looks like the *qmake* binary cannot be found.
> > >
> > > > > The relevant parts of the recipe are as follows:
> > >
> > >
> > > > > *DEPENDS =3D "qtbase"*
> > >
> > > Just as you, I've got hte DEPENDS li=C5=84e above in my recipe. Howev=
er, I've
> > > also the following line (situated after the DEPENDS +=3D...)
> > >
> > > inherit qmake5
> > >
> > > That line should set up all the necessary path's in order to find qma=
ke.
> > >
> > > Let us know if this helps you.
> > >
> > > Cheers,
> > > Anders
> > >
> > > --
> > > Abstainer, n.:
> > >       A weak person who yields to the temptation of denying himself a
> > >       pleasure.
> > >               -- Ambrose Bierce, "The Devil's Dictionary"
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SLauP2uySp+9cKYP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ8r0QACgkQN1Ujt2V2gBzgnACfeWoCbD+dO3H/MA6s/915NU+T
+3YAmwSsRPvAVVGJGrKpdVb79PR+stD+
=bFrK
-----END PGP SIGNATURE-----

--SLauP2uySp+9cKYP--
