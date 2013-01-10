Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtGOQ-00027e-P3
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 12:34:09 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so200301dak.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 03:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5+OkrQ/KhuljcdTuunVy6UxTgoz2P1Pg9pfGKgnY5pM=;
	b=G6A8bIzkuPQ4522L8IHEmiJbBtz4UNtioMVUeg9mtYu8+GOwkJX8Kt4zWfP/oWpOlJ
	wdH/kWovnjJgfeeLuq15AnVmHmsnHZPiZgxa/nOL66fgsoPku7NR4VmxCgBKLzNyQrBU
	J1adZ5WuxOwdj35Y84x3X0eNQn+ooy+uPkcUNcoJrnwQjrusG1ajI0FN/xci0OsmFpIx
	bSo9+jBfBN421+0mjju3V3eRHOSJ3Ai+aYsOqjR2bWhhmFSUbmdH3ZKvpEnt7vjYW4WR
	Wu0BLqX7GKPRVGBrVWjymO5aRJd2aDkcBFtus8c92j+NCIlQhLgaoKUtWQfyucBhOgdI
	eNAw==
X-Received: by 10.68.129.233 with SMTP id nz9mr215107727pbb.139.1357816720878; 
	Thu, 10 Jan 2013 03:18:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t5sm881216paw.20.2013.01.10.03.18.38
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 03:18:39 -0800 (PST)
Date: Thu, 10 Jan 2013 12:18:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130110111845.GX3722@jama.palm1.palmone.com>
References: <1357739154-21256-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<70CC66F5C30A414DADDA6973E4CA391A81CB78@039-SN1MPN1-002.039d.mgd.msft.net>
MIME-Version: 1.0
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A81CB78@039-SN1MPN1-002.039d.mgd.msft.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] libass: add missing dependency on fribidi
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jan 2013 11:34:15 -0000
X-Groupsio-MsgNum: 42624
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0k4Rxg87Lb8yV0u3"
Content-Disposition: inline

--0k4Rxg87Lb8yV0u3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 04:09:56AM +0000, McClintock Matthew-B29882 wrote:
> On Wed, Jan 9, 2013 at 7:45 AM, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
> > Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>=20
> Tested-by: Matthew McClintock <msm@freescale.com>
>=20

Merged, thanks!

> -M
>=20
> > ---
> >  meta-oe/recipes-multimedia/libass/libass.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/rec=
ipes-multimedia/libass/libass.inc
> > index f398d49..28d6caa 100644
> > --- a/meta-oe/recipes-multimedia/libass/libass.inc
> > +++ b/meta-oe/recipes-multimedia/libass/libass.inc
> > @@ -5,7 +5,7 @@ SECTION =3D "libs/multimedia"
> >  LICENSE =3D "ISC"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ae98663bac55afe5d989919d29=
6f28a"
> >
> > -DEPENDS =3D "enca fontconfig freetype libpng"
> > +DEPENDS =3D "enca fontconfig freetype libpng fribidi"
> >
> >  INC_PR =3D "r1"
> >
> > --
> > 1.8.0
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0k4Rxg87Lb8yV0u3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDuo5UACgkQN1Ujt2V2gBxw9QCfeo4deA6jSY7mdlY/1wojGx2k
XPUAmgNFcC7Sw/6ySLeka2k5a2oYFreQ
=U/5X
-----END PGP SIGNATURE-----

--0k4Rxg87Lb8yV0u3--
