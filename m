Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OgYyN-0002yT-5N for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 10:05:11 +0200
Received: from f053041223.adsl.alicedsl.de ([78.53.41.223]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OgYyL-0007Vp-8T for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 08:05:09 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1280901529-30358-1-git-send-email-raj.khem@gmail.com>
References: <1280901529-30358-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 04 Aug 2010 10:05:05 +0200
Message-ID: <1280909105.4225.1.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH,v3] recipes: Dont inherit autotools_stage.
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
X-List-Received-Date: Wed, 04 Aug 2010 08:05:11 -0000
X-Groupsio-MsgNum: 21806
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-KVq8lYPD0GMwbYe3jKqQ"

--=-KVq8lYPD0GMwbYe3jKqQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 03.08.2010, 22:58 -0700 schrieb Khem Raj:
> Fixes issues seen by Graham and Denys among others.
> My full x11-build is underway. Please inspect and/or try this
> patch out. I will see how my builds complete in the morning.

[=E2=80=A6]

> -inherit autotools_stage
> +
> =20
>  S =3D "${WORKDIR}/gc-${PV}"

I would prefer the following.

> -inherit autotools_stage
> =20
>  S =3D "${WORKDIR}/gc-${PV}"

So just remove the line entirely instead of replacing it with an empty
one.


Thanks,

Paul

--=-KVq8lYPD0GMwbYe3jKqQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxZHyoACgkQPX1aK2wOHViUswCff8Fyd825hGKcD+fn3OgyKMj6
L7QAn1y7vex8gboViNxOZFsPuRUrRXgx
=3NrH
-----END PGP SIGNATURE-----

--=-KVq8lYPD0GMwbYe3jKqQ--
