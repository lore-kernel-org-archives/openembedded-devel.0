Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1LN6Gh-0002lg-W6
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jan 2009 14:58:52 +0100
Received: (qmail invoked by alias); 14 Jan 2009 13:52:15 -0000
Received: from p579E16CB.dip.t-dialin.net (EHLO [192.168.4.51]) [87.158.22.203]
	by mail.gmx.net (mp045) with SMTP; 14 Jan 2009 14:52:15 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/jlRoPenzjCfoWjjnp8onN8MMpCrnrmcZ4dZ0WGY
	qiFBf02/1GtPqC
Message-ID: <496DEDF1.9080506@gmx.net>
Date: Wed, 14 Jan 2009 14:51:45 +0100
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <496D4B33.60102@gmx.net>
	<gkk2ut$5m8$1@ger.gmane.org>	<496DC520.90601@gmx.net>
	<1231931047.2952.208.camel@mill.internal.reciva.com>
In-Reply-To: <1231931047.2952.208.camel@mill.internal.reciva.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6
Subject: Re: "armv6" override not used
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
X-List-Received-Date: Wed, 14 Jan 2009 13:58:52 -0000
X-Groupsio-MsgNum: 7228
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig16C7C7C4DD662CE0854C78E7"

--------------enig16C7C7C4DD662CE0854C78E7
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Phil Blundell schrieb:
> On Wed, 2009-01-14 at 11:57 +0100, Robert Schuster wrote:
>> Is that such a controversial feature? I think this should be part of a=
ll
>> distros.
>>
>> Without this libffi breaks (on armv6 and arm7a) and in the future this=

>> means that stuff like openjdk won't be buildable on these arches. :(
>=20
> Why exactly is this override required?  It seems a bit sad that these
> packages need to be fed a special "-DMAKE_ME_WORK" flag by some externa=
l
> intelligence in order to build on newer architectures.  Can't they
> figure it out for themselves?
it is related to GCC: Although -mfloat-abi=3Dvfp is given __SOFTFP__ is
not defined and that is required for libffi because otherwise the sysv.S
assembler file uses instructions not available any more on armv6/armv7.

Regards
Robert


--------------enig16C7C7C4DD662CE0854C78E7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAklt7fEACgkQG9cfwmwwEtoR4QCfUBqkzy0TJgC8x0cUW28RnniG
Z5oAoJWPwELSys/Hhzg0iqMjLFAWBzRM
=AQcg
-----END PGP SIGNATURE-----

--------------enig16C7C7C4DD662CE0854C78E7--
