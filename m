Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LDMiR-0002P5-1S
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Dec 2008 18:31:16 +0100
Received: (qmail invoked by alias); 18 Dec 2008 17:26:36 -0000
Received: from e178093009.adsl.alicedsl.de (EHLO [192.168.4.110]) [85.178.93.9]
	by mail.gmx.net (mp011) with SMTP; 18 Dec 2008 18:26:36 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18L20BeG/sLgyGGWYxdlHnJ5HkFPinS32IqHJVmxj
	Q38HcVsf/7kXXG
Message-ID: <494A8809.502@gmx.net>
Date: Thu, 18 Dec 2008 18:27:37 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.17 (X11/20081018)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20081218161337.32EA0189349@amethyst.openembedded.net>
In-Reply-To: <20081218161337.32EA0189349@amethyst.openembedded.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.59
Cc: John Lee <john_lee@openmoko.com>
Subject: Re: [oe-commits] John Lee : om-gta02.conf: bring over this conf from om.dev
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
X-List-Received-Date: Thu, 18 Dec 2008 17:31:16 -0000
X-Groupsio-MsgNum: 7037
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig903A857920C0E3E04494613D"

--------------enig903A857920C0E3E04494613D
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

GIT User account schrieb:
>  TARGET_ARCH =3D "arm"
> -MACHINE_CLASS =3D "neo1973"
> -PACKAGE_EXTRA_ARCHS =3D "fic-gta02 ${MACHINE_CLASS}"
> +PACKAGE_EXTRA_ARCHS =3D "armv4t"
Something may be missing. When the change is applied I cannot build
anything because I get an error from the sanity checker:

ERROR:  Openembedded's config sanity checker detected a potential
misconfiguration.
	Either fix the cause of this error or at your own risk disable the
checker (see sanity.conf).
	Following is the list of potential problems / advisories:

	Error, Your PACKAGE_ARCHS field contains duplicates. Perhaps you set
EXTRA_PACKAGE_ARCHS twice accidently through some tune file?


Regards
Robert


--------------enig903A857920C0E3E04494613D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAklKiAwACgkQG9cfwmwwEtrlQgCgmFheymfVw/TMz9Eeyx0N5YtN
seAAoIP5pq828u49Epu1PAorKNTEUzr9
=Oy3D
-----END PGP SIGNATURE-----

--------------enig903A857920C0E3E04494613D--
