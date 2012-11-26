Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Td1ka-0002TD-8K
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 17:41:40 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6198349eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 08:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o/a1Xi/p2Pk4zx231HDoJ9pC1Spxz0EHovSv7XyRDmE=;
	b=gPbz8OuM6JyDTfweoTXnkn9lBzxBlrNaapr2YWm0SmYNiLWFkuJu7JYvv8JnNbeSdF
	P3QyRmw7eBW01VwOSBq5ZJUZC5iBY83mJYa4Ibtw5L0wwbgZoR/fdE6r8LbRJnsh9lg4
	7su9VPWig2z4+awNbngR71UDzAVrJ62/jRFlWLwY8ENtXC2wMeEfxHn3OjadPMERxlXT
	iXjwHcSTdn87/R9y+VQ0d7/mBOCP+GlrdqggchKLPu9RWLBtKTxLUna/CHQTDUeyjG2k
	EtRPv8kihj3IgqXK68MU+0BfjfBV3p+PvKTLechq6hwVckcQOGdXtT5zZggsG4Qo4Jyg
	a6fA==
Received: by 10.14.184.134 with SMTP id s6mr46977163eem.43.1353947248381;
	Mon, 26 Nov 2012 08:27:28 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n7sm17234201eeo.2.2012.11.26.08.27.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Nov 2012 08:27:27 -0800 (PST)
Date: Mon, 26 Nov 2012 17:27:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121126162733.GC3401@jama.jama.net>
References: <cover.1353603007.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1353603007.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH 0/3] Fix ntp bbappends
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
X-List-Received-Date: Mon, 26 Nov 2012 16:41:40 -0000
X-Groupsio-MsgNum: 41720
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Content-Disposition: inline

--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 04:54:04PM +0000, Paul Eggleton wrote:
> This is the meta-systemd patch series corresponding to the recently sent
> out patches for ntp in meta-networking. 1/3 and 2/3 should be applied
> ASAP even if 3/3 is not applied immediately, as the layer is currently
> broken; 3/3 needs to wait until after the meta-networking patches go in.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Thanks!

> The following changes since commit d08ee5a51d4e89ae587d170f8b990626898414=
28:
>=20
>   qt4-embedded: drop bbappend for 4.8.1 (2012-11-22 09:48:36 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib paule/ntp-systemd
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dpaule/ntp-systemd
>=20
> Otavio Salvador (2):
>   meta-systemd: Move ntp recipes to 'meta-networking' sublayer
>   meta-systemd: meta-networking: ntp: Update bbappend to 4.2.6p5
>=20
> Paul Eggleton (1):
>   meta-systemd: ntp: update for server config improvements
>=20
>  .../recipes-support/ntp/ntp/ntpd.service           |    0
>  .../recipes-support/ntp/ntp/ntpdate.service        |    2 +-
>  .../recipes-support/ntp/ntp_4.2.6p5.bbappend}      |    0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta-systemd/{meta-oe =3D> meta-networking}/recipes-support/ntp/n=
tp/ntpd.service (100%)
>  rename meta-systemd/{meta-oe =3D> meta-networking}/recipes-support/ntp/n=
tp/ntpdate.service (80%)
>  rename meta-systemd/{meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend =
=3D> meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend} (100%)
>=20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCzmHUACgkQN1Ujt2V2gBwYCACfZMfCqJeyjkmF6yM7qFUTxJVN
9cIAnjJ3YEyWQ+MqLDyrERI4la2KKnB1
=2aXN
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
