Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RjTxn-0002bp-NT
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 11:57:27 +0100
Received: by eeit10 with SMTP id t10so1314530eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jan 2012 02:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=igRg7p3ySsl5hTr57JsirVPnITdaY/I5rnJKqRMGj4Y=;
	b=GFpCnvLTd8MPd1ijsyE5C+Ax3g8kO2uiOEc6nXoLuq2LJPpi0QR32OD84LfceCPWTK
	Ho8VWTZL0320HUWM8SWyqg9fm8ZD/T7TUASuFu3Ex3+ZaUopNuqt7N+ju93OGpueHmbQ
	Jtf5Nn5O4o/yhwaQzMoTAg2UqkLtiR5QKCTGM=
Received: by 10.14.16.38 with SMTP id g38mr3492464eeg.56.1325933398632;
	Sat, 07 Jan 2012 02:49:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b49sm229279684eec.9.2012.01.07.02.49.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 Jan 2012 02:49:57 -0800 (PST)
Date: Sat, 7 Jan 2012 11:49:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120107104945.GB3938@jama.jama.net>
References: <1325894128-26110-1-git-send-email-andrea.adami@gmail.com>
	<je8ucj$vub$1@dough.gmane.org>
	<CAP9ODKqFPd2GX6bw1_a0Fi2U+q5=_pcd4=OoHvYjVvPSLNf7RQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqFPd2GX6bw1_a0Fi2U+q5=_pcd4=OoHvYjVvPSLNf7RQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] [PATCH] xserver-common: remove extraneous BSP customizations
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
X-List-Received-Date: Sat, 07 Jan 2012 10:57:27 -0000
X-Groupsio-MsgNum: 36418
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline

--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 07, 2012 at 08:41:51AM -0200, Otavio Salvador wrote:
> On Sat, Jan 7, 2012 at 06:05, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
>=20
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Op 07-01-12 00:55, Andrea Adami schreef:
> > > * delete patches meant for BSP layers * bump PR
> >
> > With a recipe like xserver-common I don't see a point in going all out =
BSP
> > on it. This patch just moves things to layers just for the sake of movi=
ng
> > it
> > to layers. I strongly suspect that applying this patch will be a net bu=
rden
> > on device maintainers instead of a gain.
> >
>=20
> I agree this is going to be bad at first but those kind of improvements
> always cause some problems for a later gain. Dropping things that ought to
> be in BSP layers is a good thing but only after the "fix other layers" ti=
me
> window.
>=20
> I think this is worth it however it might be better to instead port the
> needed changes to OE-Core and ask other layers to adopt x11-common allowi=
ng
> us to remove this later on. This makes the change easier and avoid some
> problems for users IMO.

This whole recipe has machine specific bits and removing those bits
only of some machines (in this case all from meta-smartphone BSPs)
doesn't improve that recipe.

So if you want to improve it, merge extra functionality (like
xinput-pointercal) to oe-core and drop this completely, but breaking
some machines doesn't make thinks better.

Instead of "fixing" it in meta-smartphone BSPs I would just copy whole
xserver-common back to meta-shr, because I don't have time now to fix it
properly and spending time on .bbappends is not worth it in this case.

Cheers,

JaMa, from daywork..ffs

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8II0kACgkQN1Ujt2V2gBy0ZgCfcUG31+/jYoeQpiPs17YePVU9
1cYAnjvqLQuAY01eWtwqBWAYfZjHVw/g
=HyUd
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
