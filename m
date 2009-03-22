Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LlSSG-0000iv-8O
	for openembedded-devel@openembedded.org; Sun, 22 Mar 2009 19:31:28 +0100
Received: (qmail 19594 invoked by uid 813007); 22 Mar 2009 18:30:10 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2009 18:30:10 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Mar 2009 19:29:47 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc7-00188-gebdcc81-dirty; KDE/4.2.1;
	x86_64; ; )
References: <1237731142-8136-1-git-send-email-matthieu.poullet@gmail.com>
In-Reply-To: <1237731142-8136-1-git-send-email-matthieu.poullet@gmail.com>
MIME-Version: 1.0
Message-Id: <200903221929.57400.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] Alsa-state: Wildcard removed and all *.state put back in the recipes
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
X-List-Received-Date: Sun, 22 Mar 2009 18:31:28 -0000
X-Groupsio-MsgNum: 8614
Content-Type: multipart/signed; boundary="nextPart1638916.cOhH8WCHcV";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1638916.cOhH8WCHcV
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 22 marca 2009 o 15:12:22 Matthieu Poullet napisa=C5=82(a):
> The wildcard doesn't work properly.
> So either the wildcard support must be fixed or all the *.state files
> must be added in the SRC_URI.

NACK

> diff --git a/recipes/alsa/alsa-state.bb b/recipes/alsa/alsa-state.bb
> index 3ebc0d5..a878c57 100644
> --- a/recipes/alsa/alsa-state.bb
> +++ b/recipes/alsa/alsa-state.bb
> @@ -13,7 +13,15 @@ SRC_URI =3D "\
>    file://asound.conf \
>    file://asound.state \
>    file://alsa-state \
> -  file://*.state \
> +  file://asound.state \

This should be enough. BitBake will take proper asound.state from=20
MACHINE/ directory if it is present.

> +  file://at91sam9263ek/asound.state \
> +  file://spitz/asound.state \
> +  file://tosa/asound.state \
> +  file://c7x0/asound.state \
> +  file://magician/asound.state \
> +  file://hx4700/asound.state \
> +  file://nokia800/asound.state \
> +  file://akita/asound.state \

That part is wrong.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart1638916.cOhH8WCHcV
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknGg6AACgkQeQ6MlGH/2qsYGgCaAy7f5tbM5oRGHrr0yHOz27Zl
LrYAn2WEE3XLEbLSlaK6nezHj4LwIdZu
=zlSW
-----END PGP SIGNATURE-----

--nextPart1638916.cOhH8WCHcV--
