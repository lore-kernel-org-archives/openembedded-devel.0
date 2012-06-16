Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sfyz8-0002mx-A9
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jun 2012 21:48:38 +0200
Received: by wgbds1 with SMTP id ds1so475963wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2012 12:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OAyWU/3dyT6HZcaVRCx08SFV6LT0NfKCkRPGHO7Xh0s=;
	b=GTOT7HGWkQkJx/uHyRPNvwZcELLgleawPAeQb7JPUiWM0qGZ6PPQeMOTpi4bWFerRu
	QwW2aoR8VM+EnDz4N+XYgeNsO4X4IFTd+bLYM6TwMKGX+zlPtQuOMwbhBo3guUhfvuik
	Vpq08sXA6kSv+oMNzfsPZPDOCAhSLJf1jYeIwBC0/w/tG5UCFu3T1LK1U5teGtP5UF0J
	9G72RbCAPCbelf9A4Fn4pX4lWeuw2MkEnrps/XOJuk+fOmvKagzMzSuo3q9833AwyMlC
	J/vZzbpIxapIVssGSIIWYudJdGAzgMC6laNQ4N77b0+JFwQuf0qDiSFMLxdqhSl1LCbL
	FkOg==
Received: by 10.180.93.99 with SMTP id ct3mr12922905wib.13.1339875478411;
	Sat, 16 Jun 2012 12:37:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fo7sm13004828wib.9.2012.06.16.12.37.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Jun 2012 12:37:57 -0700 (PDT)
Date: Sat, 16 Jun 2012 21:37:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120616193756.GE3178@jama.jama.net>
References: <1337788237-9475-1-git-send-email-Martin.Jansa@gmail.com>
	<20120616070117.GC3140@jama.jama.net> <5704152.9u4br1nZj5@helios>
MIME-Version: 1.0
In-Reply-To: <5704152.9u4br1nZj5@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] meta-handheld: append to BBPATH instead of prepend so order of bblayers.conf is respected
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
X-List-Received-Date: Sat, 16 Jun 2012 19:48:38 -0000
X-Groupsio-MsgNum: 39261
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline

--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 16, 2012 at 08:28:28PM +0100, Paul Eggleton wrote:
> On Saturday 16 June 2012 09:01:17 Martin Jansa wrote:
> > On Wed, May 23, 2012 at 05:50:37PM +0200, Martin Jansa wrote:
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >=20
> > ping
> >=20
> > > ---
> > >=20
> > >  conf/layer.conf |   11 ++++++++---
> > >  1 files changed, 8 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/conf/layer.conf b/conf/layer.conf
> > > index 7a2441b..31dcb16 100644
> > > --- a/conf/layer.conf
> > > +++ b/conf/layer.conf
> > > @@ -1,13 +1,18 @@
> > >=20
> > >  # Layer configuration for meta-handheld layer
> > >  # Copyright 2011 Intel Corporation
> > >=20
> > > -# We have a conf and classes directory, prepend to BBPATH to prefer =
our
> > > versions -BBPATH :=3D "${LAYERDIR}:${BBPATH}"
> > > +# We have a conf and classes directory, append to BBPATH
> > > +BBPATH .=3D ":${LAYERDIR}"
> > >=20
> > >  # We have a recipes directory, add to BBFILES
> > >=20
> > > -BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb
> > > ${LAYERDIR}/recipes-*/*/*.bbappend"=20
> > > +BBFILES +=3D
> > > "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend">=20
> > >  BBFILE_COLLECTIONS +=3D "meta-handheld"
> > >  BBFILE_PATTERN_meta-handheld :=3D "^${LAYERDIR}/"
>=20
> I was all set to apply this now (sorry for the delay) and then I noticed =
you=20
> changed the above without comment - why was that?

Just to match what other layers do, or is there some advantage of using
:=3D instead of +=3D in BBFILES?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/c4JQACgkQN1Ujt2V2gBx+5QCfVWhtkhgaKCdjxaSoFAmX2JMI
WmcAn24ran8SaIQMhrsS3f6vp14K97J4
=aiXX
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
