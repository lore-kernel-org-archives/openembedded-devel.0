Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QkFg6-0000Ab-0l
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jul 2011 15:22:06 +0200
Received: by fxh10 with SMTP id 10so5361563fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2011 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1lLY2SHPJwjMz1x6QuINdbxjJCZ0i6K4C1bXZp/k+2U=;
	b=Uz78ismA3nhfMXLPjvRjpobYxY+DWqs8CVSlXxjbJcDU1x3FcHdu3CIDHAhvF9hBc2
	D9a2Cz/LgBdVYCq8XzlUYd53Gc6EUlemUZVm27tuaONUWiOv8OJ1xzfZU+RxLnBQ7cPJ
	cQH2WfGkAfejj1xximhsIGofdk9VKL9JRO79Y=
Received: by 10.223.54.79 with SMTP id p15mr309839fag.10.1311340676420;
	Fri, 22 Jul 2011 06:17:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w11sm2044286faj.14.2011.07.22.06.17.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jul 2011 06:17:54 -0700 (PDT)
Date: Fri, 22 Jul 2011 15:17:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110722131748.GD3767@jama.jama.net>
References: <1311287464-13001-1-git-send-email-philippedeswert@gmail.com>
	<1311288853.7847.6.camel@mattotaupa>
	<CAPsFW+QbVj089SmBAWtMU3xX2yPxghQmpsF=qAUZhpcnVLvKdA@mail.gmail.com>
	<20110722123449.GC3767@jama.jama.net>
	<CAPsFW+R4MH_dSPX5sit65u7j7=+pwp5R4dNT9=QQPUcy=-PG5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPsFW+R4MH_dSPX5sit65u7j7=+pwp5R4dNT9=QQPUcy=-PG5Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gpe-mini-browser2_svn : remove fixes SRCREV
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
X-List-Received-Date: Fri, 22 Jul 2011 13:22:06 -0000
X-Groupsio-MsgNum: 33289
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MIdTMoZhcV1D07fI"
Content-Disposition: inline

--MIdTMoZhcV1D07fI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 22, 2011 at 04:06:43PM +0300, Philippe De Swert wrote:
> Hi,
>=20
> Thanks for clarifying Martin.
>=20
> On 22/07/2011, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Fri, Jul 22, 2011 at 03:18:37PM +0300, Philippe De Swert wrote:
> >> I already wondered who added one (as I originally added the svn
> >> recipe). Anyway I thought the whole idea of _svn etc were to have
> >> bleeding edge builds. If we wanted stable there would be a versioned
> >> recipe.
> >
> > If you want it bleeding then you or your distribution will set
> >
> > SRCREV_pn-gpe-mini-browser2 =3D "${AUTOREV}"
> >
> > in local.conf or some distro .inc file
> > like there is
> > conf/distro/include/shr-autorev.inc
> > conf/distro/include/fso-autorev.inc
> > etc.
> >
> > but for rest of world is better to say which SRCREV was tested and
> > should work for everybody.
>=20
> Ok so things have changed since I made the recipe. Still catching up
> on all the new things in OE.

BTW: let's go to catch some oe-core :)

Looking on that commit it was me changing SRCREV in recipe

gpe-mini-browser2_svn
-SRCREV =3D "9819"
+SRCREV =3D "9900"
because there was
-SRCREV_pn-gpe-mini-browser2 ?=3D "9900"
in conf/distro/include/sane-srcrevs.inc which was included by default
and removed later after moving all SRCREVs to corresponding recipes.

and before that it was converted from SRCDATE to SRCREV (+ in recipe
SRCREV was added)
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3De7814af64674=
5ab8c6884c817d00475be3cd94e1

later SRCREV upgraded to 9900 by
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3De7814af64674=
5ab8c6884c817d00475be3cd94e1

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MIdTMoZhcV1D07fI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4peHsACgkQN1Ujt2V2gBxLGQCeLaqPVCK4JbDXjIqYD8OH0x+x
f/AAoK9x9YqHg2yU1N7zuLx9TGL5qXWC
=v2bU
-----END PGP SIGNATURE-----

--MIdTMoZhcV1D07fI--
