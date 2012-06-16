Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sfz1Q-0002tD-3E
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jun 2012 21:51:00 +0200
Received: by wgbdr1 with SMTP id dr1so3647830wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2012 12:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SiiFW4MGGGzbldCCPQMe55Et+e6URzlh9azK067Yrgc=;
	b=ak/KmoUouNhP2Wik7q0ra5WDWYqCF0celgVsX6yfqb7wUIp7nz1bMTsXfvX4Ym3vMR
	GJYd3i1SLfHyYRqQ00YgtkifislrJspOTpBLrt+cvX2sZNyOH7x5mdNuBroGD7LYl3YG
	IRutPYmWbcxAVO1ULGLY31l1ENFXYJcx7NomNs6fTP47obqfKB1GMi4bY894ombpvpD3
	gnZ1B7fLcY+R5iumnjRS4AM9jJFk+cgOvLjnvs1XOIauTQAck+xPL0JYkul5BlplXBCA
	wIAKg+K2HNPd6RrUPSg4VwsMmjiTtO9jwD8kGB7PfS13MceIoMQmwo0r+qLBBpV2rCoO
	tvrw==
Received: by 10.180.102.9 with SMTP id fk9mr14879428wib.1.1339875620330;
	Sat, 16 Jun 2012 12:40:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d3sm22096066wiz.9.2012.06.16.12.40.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Jun 2012 12:40:19 -0700 (PDT)
Date: Sat, 16 Jun 2012 21:40:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120616194018.GF3178@jama.jama.net>
References: <1337788237-9475-1-git-send-email-Martin.Jansa@gmail.com>
	<20120616070117.GC3140@jama.jama.net> <5704152.9u4br1nZj5@helios>
	<20120616193756.GE3178@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120616193756.GE3178@jama.jama.net>
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
X-List-Received-Date: Sat, 16 Jun 2012 19:51:00 -0000
X-Groupsio-MsgNum: 39262
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O98KdSgI27dgYlM5"
Content-Disposition: inline

--O98KdSgI27dgYlM5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 16, 2012 at 09:37:56PM +0200, Martin Jansa wrote:
> On Sat, Jun 16, 2012 at 08:28:28PM +0100, Paul Eggleton wrote:
> > On Saturday 16 June 2012 09:01:17 Martin Jansa wrote:
> > > On Wed, May 23, 2012 at 05:50:37PM +0200, Martin Jansa wrote:
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >=20
> > > ping
> > >=20
> > > > ---
> > > >=20
> > > >  conf/layer.conf |   11 ++++++++---
> > > >  1 files changed, 8 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/conf/layer.conf b/conf/layer.conf
> > > > index 7a2441b..31dcb16 100644
> > > > --- a/conf/layer.conf
> > > > +++ b/conf/layer.conf
> > > > @@ -1,13 +1,18 @@
> > > >=20
> > > >  # Layer configuration for meta-handheld layer
> > > >  # Copyright 2011 Intel Corporation
> > > >=20
> > > > -# We have a conf and classes directory, prepend to BBPATH to prefe=
r our
> > > > versions -BBPATH :=3D "${LAYERDIR}:${BBPATH}"
> > > > +# We have a conf and classes directory, append to BBPATH
> > > > +BBPATH .=3D ":${LAYERDIR}"
> > > >=20
> > > >  # We have a recipes directory, add to BBFILES
> > > >=20
> > > > -BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb
> > > > ${LAYERDIR}/recipes-*/*/*.bbappend"=20
> > > > +BBFILES +=3D
> > > > "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend">=
=20
> > > >  BBFILE_COLLECTIONS +=3D "meta-handheld"
> > > >  BBFILE_PATTERN_meta-handheld :=3D "^${LAYERDIR}/"
> >=20
> > I was all set to apply this now (sorry for the delay) and then I notice=
d you=20
> > changed the above without comment - why was that?
>=20
> Just to match what other layers do, or is there some advantage of using
> :=3D instead of +=3D in BBFILES?

And IIRC there was some discussion about BBFILES :=3D/+=3D on ML before
ba31e4eabd31af63eb0244096c8bcdcac185fac6 changed it in other layers.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O98KdSgI27dgYlM5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/c4SIACgkQN1Ujt2V2gBzkWACfZB9c4yzcS7BpKZRsZTVn9tSo
tkAAoJNcPfH5KTLrvAYFGt1IZX+83ELC
=sUhs
-----END PGP SIGNATURE-----

--O98KdSgI27dgYlM5--
