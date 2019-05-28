Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8DE6BCD6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 19:08:36 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w13so13079447wru.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 12:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NKW/V/hh6yMdMGpT2DNPfHxpEcCeAPR914iwiUf60gM=;
	b=E8WL+1FULhBMALNADZpoff4JXSi1HTg8pvPauoggolQocWsewx/fBcTYW3LSSsU4JG
	TDQoC252nkeAMlyKwdr2LG3JgwvnAn7ZqZbE0k1TgvK+VV9VNmUE3+AfnXlIKQfHh3ZI
	9BniXg87HQ7uVUcd2EmxXdhfJWkAqKbI5CyTe46adxI6+gbI80a67iWjY8rcuG7TE8fO
	9cqieEpibsoENdE5YQBoJimW9OKdK9DMUuX44IPjozz9oCr/oQlkZOHHlbCFzmPqcuIw
	JKIUKmLpjJzhRo1DO8m79Y1YAN+f53HP/r96oIhWfT4Zlnz+vg5pQqZtOZRj28jV2xFL
	l5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NKW/V/hh6yMdMGpT2DNPfHxpEcCeAPR914iwiUf60gM=;
	b=GAgdoVNgAy/C0d2ic/iSSWPyJVrdRvgJ24Ri6VZ6PxdkOkurAkYmaxHChAGja19V9s
	l929fGBrgv1e+rJyMc4JWOXDj4SrVy0iVg3wlOgeNC7FN5O5RZtFF/KW7Q1mb9bGhV/x
	7W0h15qrZRCohuHHDLUPvW07DaI4tTHJcto1+xxYukK4X6SSrAoa8UTz8S0TYv035+vR
	S1pZZMJNeV0clgTF4MErQeCdgnctLXNWOz2QJNBB57j8ZdqbRWVf3oe3YMZ0kbmKKIdx
	U8VQmW8ILTtyQ4orfWcSgF9TiKFV5C6aL4zvNe3Q5AbqzQNPqQuIQG/6F45o1tlbbG9P
	3UoQ==
X-Gm-Message-State: APjAAAXiGJcPtWT/C26wo0O9wUO0TjYQWz2QsMtUGfeD1PmoYPlf0Syi
	OKwXfP876eN4XGyQcxSVODA=
X-Google-Smtp-Source: APXvYqzEkTsaD5OHWkjNgRYhK3c3xXi4uIEvgmr9Sky3+2y70Z/Z85JZc1wxGtL2WHUtq1qcsCq9IQ==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr17633758wrs.191.1559070516785;
	Tue, 28 May 2019 12:08:36 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id j2sm6431995wrx.65.2019.05.28.12.08.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 12:08:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 28 May 2019 21:08:38 +0200
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190528190838.GA1481@jama>
References: <20190528165200.10764-1-open.source@oleksandr-kravchuk.com>
	<20190528180945.GB14708@localhost>
MIME-Version: 1.0
In-Reply-To: <20190528180945.GB14708@localhost>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: openembedded-devel@lists.openembedded.org,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH][meta-oe] libp11: update to 0.4.10
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
X-List-Received-Date: Tue, 28 May 2019 19:08:36 -0000
X-Groupsio-MsgNum: 77832
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 09:09:45PM +0300, Adrian Bunk wrote:
> On Tue, May 28, 2019 at 06:52:00PM +0200, Oleksandr Kravchuk wrote:
> > Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> > ---
> >  .../libp11/{libp11_0.4.7.bb =3D> libp11_0.4.10.bb}                | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-support/libp11/{libp11_0.4.7.bb =3D> libp11_0.4=
=2E10.bb} (92%)
> >=20
> > diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.7.bb b/meta-oe/r=
ecipes-support/libp11/libp11_0.4.10.bb
> > similarity index 92%
> > rename from meta-oe/recipes-support/libp11/libp11_0.4.7.bb
> > rename to meta-oe/recipes-support/libp11/libp11_0.4.10.bb
> > index 87d99c1a6..2911e37c7 100644
> > --- a/meta-oe/recipes-support/libp11/libp11_0.4.7.bb
> > +++ b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfad9b3332be8=
94bab9bc501572864b29"
> >  DEPENDS =3D "libtool openssl"
> > =20
> >  SRC_URI =3D "git://github.com/OpenSC/libp11.git"
> > -SRCREV =3D "64569a391897bd29c5060b19fa4613e619e59277"
> > +SRCREV =3D "libp11-0.4.10"
> >...
>=20
> This is not a good idea - upstream might move the label,
> and a man-in-the-middle attack on someone building this
> recipe might also be possible.

Not only that, but bitbake fetcher will convert the tag name to the hash
every single time the recipe is being parsed which is not only annoying,
but also breaks parsing for people who don't even use this recipe when
they loose network connection during build (or build intentionally
without one).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXO2HNQAKCRA3VSO3ZXaA
HHTYAJ9QfyKLV80IQkXxNxH99dEonHeC4QCfamjSQ6h9GQ+VjAT+nmSb2+QuVKU=
=x7u3
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
