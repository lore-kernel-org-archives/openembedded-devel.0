Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NXX20-0005eO-2B for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 10:39:23 +0100
Received: from f053034093.adsl.alicedsl.de ([78.53.34.93]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NXWzq-0006nG-9K for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 09:37:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B564B3D.7020108@atmel.com>
References: <4B564B3D.7020108@atmel.com>
Date: Wed, 20 Jan 2010 10:37:04 +0100
Message-ID: <1263980224.3384.9.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH v2] Enable bmp and JPEG files for fbv
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
X-List-Received-Date: Wed, 20 Jan 2010 09:39:23 -0000
X-Groupsio-MsgNum: 15925
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-7z/NizZKNvLrke2Uy/28"

--=-7z/NizZKNvLrke2Uy/28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 20.01.2010, 01:15 +0100 schrieb Ulf Samuelsson:
> Enable bmp and JPEG files for fbv
>=20
> Previously only supported PNG.
> Ungif still not supported.

Not supported or just not enabled?

One last question. Does anyone know why this support was not enabled in
the first place? Not needed back then, not working, size constrains?

        $ git log --follow recipes/fbv/fbv_1.0b.bb=20
        commit 0bdb7654c8a9b9850db27e5f6b4a746fb1083ed1
        Author: Tom Rini <trini@embeddedalley.com>
        Date:   Thu Apr 23 15:07:52 2009 -0400
       =20
            fbv: Add a framebuffer-based png viewer.
            bmp/gif is supported but disabled.

> Remove unneccesary whitespace.
> Do not install manuals to target
>=20
> Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>

I do not have commit rights. Someone else has to commit your patches.


Thanks,

Paul

--=-7z/NizZKNvLrke2Uy/28
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktWzrkACgkQPX1aK2wOHVjMKwCaAoKa6XPn6L3Uf6Ff/ASipNy3
pB8AnA2WvIogsAtH6SI8IYyb7UecpPNk
=Txc3
-----END PGP SIGNATURE-----

--=-7z/NizZKNvLrke2Uy/28--
