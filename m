Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1Jm0ku-0002xq-Gf
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Apr 2008 08:04:28 +0200
Received: (qmail invoked by alias); 16 Apr 2008 06:04:23 -0000
Received: from brln-4db99a72.pool.einsundeins.de (EHLO [192.168.4.110])
	[77.185.154.114]
	by mail.gmx.net (mp034) with SMTP; 16 Apr 2008 08:04:23 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+UbFxAMn2U3HzgsZ1hBGbHYvJVnrvtAfJTgZBuGM
	NojxYBmQ/pViOf
Message-ID: <480596E2.7030906@gmx.net>
Date: Wed, 16 Apr 2008 08:04:18 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>	<47FE2530.2@gmx.net>	<35a670560804101007m1d787b4ai97927bb42fcbfe5d@mail.gmail.com>	<4800DC3B.9080007@gmx.net>	<35a670560804140932s53231dcj1adfa6bc21e0353e@mail.gmail.com>
	<35a670560804150810k603d1986t4e02eefa7f411728@mail.gmail.com>
In-Reply-To: <35a670560804150810k603d1986t4e02eefa7f411728@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: Building ubuntu/gcc-4_2-branch to get GCJ for arm EABI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Apr 2008 06:04:28 -0000
X-Groupsio-MsgNum: 4972
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigAD80605DACB6A0370D2AF7C8"

--------------enigAD80605DACB6A0370D2AF7C8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi.

Matthijs van de Water schrieb:
> 2) Split out all GCJ related stuff to compile in a separate set of
> tasks so that it does not always get build, because this takes ages
> and loads of memory.
I don't think that is possible atm. GCJ is part of a GCC build and can
only be enabled or disabled at configuration time.

I did a quick glance at the gcc-package-*.inc recipes and they do not
provide packaging info for GCJ specifically. So either things end up
in another binary package or they end up nowhere. I'll have a look at tha=
t.

> I'm not sure about the best way to get (2)... any suggestions are welco=
me.
>=20
> Regards,
> Matthijs
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20



--------------enigAD80605DACB6A0370D2AF7C8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIBZblG9cfwmwwEtoRCPRlAJ4gCIfEnA+2x0K4RJKtI6SE3cloawCfTXSI
x/bIkAb4Ua4fCMLU5MRxALU=
=j3Vi
-----END PGP SIGNATURE-----

--------------enigAD80605DACB6A0370D2AF7C8--
