Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBotW-00072a-Aq
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Mar 2013 17:02:45 +0100
Received: by mail-da0-f50.google.com with SMTP id h15so1830530dan.23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Mar 2013 07:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c5gqkA6pFn/4oThLwkm8GSg38na6RvR/De7RG0BM6XM=;
	b=xoPuOopOkS4E5yPyscdRZ08+2+INoJ6rbSCXJEPkOIDX50bFWC2yMtiX8RQeBr8QT1
	z/YcnCHHCWs8ak1VE1Q+K+dA3vXA3z9bJAaHWqPl+mja8O2TSleOQmYghgZqSJah3+2G
	cilRiZoDoRtZq2nDo2mTi1Y2M1vl0WuGtORQqHU/oBbqEKJ/N0StZfWRE77AYEeisEnt
	JsOHazKJMp5CW4CySlMlh3pdWoxHCT09iX1/jmcyCFPSNT17jZWFgMWGu9mvFZfYJVOy
	eCLA4dWbKk12ufORnhOF37J+qs4Fu5DbqDFv8N/OTZWzqfjcnOYWl/Yltw0gb894sj4u
	gdqA==
X-Received: by 10.68.195.197 with SMTP id ig5mr19697010pbc.178.1362239176608; 
	Sat, 02 Mar 2013 07:46:16 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id mz8sm13243449pbc.9.2013.03.02.07.46.13
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 02 Mar 2013 07:46:15 -0800 (PST)
Date: Sat, 2 Mar 2013 16:46:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130302154609.GA3279@jama>
References: <cover.1362223895.git.apelete@seketeli.net>
	<79357068d009b46c93485c118c12886a394a78f7.1362223895.git.apelete@seketeli.net>
	<20130302131749.GZ3279@jama> <20130302153227.GD5249@hermes>
MIME-Version: 1.0
In-Reply-To: <20130302153227.GD5249@hermes>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH 2/7] git: update SRC_URI
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
X-List-Received-Date: Sat, 02 Mar 2013 16:02:46 -0000
X-Groupsio-MsgNum: 43367
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dOtxUVmLoGkyu1PA"
Content-Disposition: inline

--dOtxUVmLoGkyu1PA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 02, 2013 at 04:32:27PM +0100, Apelete Seketeli wrote:
> Le 02-Mar-13, Martin Jansa a =E9crit:
> > On Sat, Mar 02, 2013 at 12:57:03PM +0100, Apelete Seketeli wrote:
> > > Update SRC_URI to build.shr-project.org since git source packages are
> > > no longer available from kernel.org.
> > > ---
> > >  recipes/git/git.inc |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/recipes/git/git.inc b/recipes/git/git.inc
> > > index eb59a2c..ae656e1 100644
> > > --- a/recipes/git/git.inc
> > > +++ b/recipes/git/git.inc
> > > @@ -2,7 +2,7 @@ DESCRIPTION =3D "The git revision control system used=
 by the Linux kernel develope
> > >  SECTION =3D "console/utils"
> > >  LICENSE =3D "GPLv2"
> > > =20
> > > -SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/software/scm/git/git-${PV=
}.tar.bz2;name=3Dsrc"
> > > +SRC_URI =3D "http://build.shr-project.org/sources/git-${PV}.tar.bz2;=
name=3Dsrc"
> >=20
> > I don't know how long I'll keep "old" PREMIRROR there, it would be
> > better to send missing archives to Tom King to add them to
> > sources.oe.org which is more official source (and probably already
> > listed in default MIRRORS)
>=20
> How do I send Tom King the missing archives ?
> I'll reformat the patches into a v2 as soon as this is fixed.

You can send him URLs to needed archives on yocto and shr premirrors=20
and he will wget it from there.

>=20
> Cheers.
> --=20
>         Apelete
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dOtxUVmLoGkyu1PA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEyHsEACgkQN1Ujt2V2gBxKaACeLQSKoJpxKISmBP2Qxu0uXp+s
7AUAn0f/O9C/Dp2op7AuEKNHQHNkfGWS
=Mzs2
-----END PGP SIGNATURE-----

--dOtxUVmLoGkyu1PA--
