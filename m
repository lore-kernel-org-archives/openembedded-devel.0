Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2D16D8E9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 17:40:27 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so6942303eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bZYs8FxbF0RakCM+d37edJoRUMYLAEN++uo175qlO2s=;
	b=FVjnp4DNgECf8ZII3sM1aKGcOD3qrv8CCEiqPiHGHm5Vs7D6dfWb45IDxCUOxfkC3a
	IJNk8gy1PfpWwH0IlMw0oKoVcFotg6feiT7WbI/dq1lAOsaOvJraMNlh1FpOCPXL87jS
	OiAerNSwVrxBnVfOepEm1VI7fpwDTkfFlalcZv5oIwyoHOgjxkPnRGyzXkUt/H9bWWa5
	wEOmd5uoBpHvELdcQKY2x+rqhgLaQ6YvTdrCsdrv69snW/DvNyvWPxfKho/QPfXiVGeK
	m3zYq6b9+XdpVIoGmpG2ymGpSTiji7NNbMwAndnKMKC7ZgJ0hl2fuvKuKa8ojbeG/8R+
	sTmA==
X-Received: by 10.14.224.6 with SMTP id w6mr37585388eep.60.1395250828094;
	Wed, 19 Mar 2014 10:40:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u46sm15283397eel.1.2014.03.19.10.40.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Mar 2014 10:40:24 -0700 (PDT)
Date: Wed, 19 Mar 2014 18:40:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: =?iso-8859-1?Q?S=F8ren?= Holm <sgh@sgh.dk>
Message-ID: <20140319174024.GB3726@jama>
References: <1395236677-28379-1-git-send-email-sgh@sgh.dk>
	<CAPbeDCkN2jeKJr-+0hV0DWvJ1v26a8WYHb3wn1u1Novssa7_=Q@mail.gmail.com>
	<20140319141501.GA3726@jama> <1647989.PEsjAC07VF@koontz>
MIME-Version: 1.0
In-Reply-To: <1647989.PEsjAC07VF@koontz>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qtbase: Add libxi to depends.
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
X-List-Received-Date: Wed, 19 Mar 2014 17:40:31 -0000
X-Groupsio-MsgNum: 48763
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline

--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2014 at 06:02:57PM +0100, S=F8ren Holm wrote:
>=20
> yes problably. I did not investigate the whole structure that thorough=20
> apparently.
>=20
> Could that change get into dora?

Yes, but first it needs to go to master.

> Onsdag den 19. marts 2014 15:15:01 skrev Martin Jansa:
> > On Wed, Mar 19, 2014 at 02:56:18PM +0100, Jacob Kroon wrote:
> > > Maybe do something this instead ? This is only necessary for X11 righ=
t ?
> > >=20
> > > -DEPENDS +=3D "qtbase-native"
> > > +DEPENDS +=3D " \
> > > +    qtbase-native \
> > > +    ${@base_contains('DISTRO_FEATURES', 'x11', 'libxi', '', d)} \
> > > +"
> > >=20
> > > /Jacob
> >=20
> > I think it belongs to
> > PACKAGECONFIG[xinput2] =3D "-xinput2,-no-xinput2,libxi"
> >=20
> --=20
> S=F8ren Holm

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEUEARECAAYFAlMp1ogACgkQN1Ujt2V2gBzJywCfYu0md0KCLhxnxwrecXTFJ6MY
xUYAlRfjAZ2yinuL9P9SlmLUwVbeKrc=
=Tjlw
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
