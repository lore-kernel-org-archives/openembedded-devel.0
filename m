Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NvvXt-0006uN-Bd for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 18:41:07 +0200
Received: from f053035077.adsl.alicedsl.de ([78.53.35.77]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NvvUo-0007kk-F7 for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 16:37:54 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1269605601.3889.58.camel@mattotaupa>
References: <1269605601.3889.58.camel@mattotaupa>
Date: Sun, 28 Mar 2010 18:37:52 +0200
Message-ID: <1269794272.8018.60.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: glib-2.0_2.23.6.bb: do_configure failed
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
X-List-Received-Date: Sun, 28 Mar 2010 16:41:07 -0000
X-Groupsio-MsgNum: 18197
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-4bK+7mXwK/amJg+2/2C0"

--=-4bK+7mXwK/amJg+2/2C0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 26.03.2010, 13:13 +0100 schrieb Paul Menzel:
> I get the following error.
>=20
>         $ more glib-2.0-2.23.6-r0/temp/log.do_configure.19885
>         [=E2=80=A6]
>         checking for inflate in -lz... no
>         configure: error: *** Working zlib library and headers not found =
***
>         FATAL: oe_runconf failed
>=20
> Do you get the failure? I am trying to fix it by adding `zlib` to
> `DEPENDS` and will report back if it worked.

Sorry, I forgot that I had promised to report back. It worked. Anyway
GNUtoo fixed it the same way [1].


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D2db06b2=
b54380772a5d173fa2012e78207483002

--=-4bK+7mXwK/amJg+2/2C0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuvheAACgkQPX1aK2wOHViltwCfUaBnSjjptdi+x6jx8pEI+hHe
jYkAnRhVsJtROVVlJ3HGukkQm8ntHjCt
=9Uzl
-----END PGP SIGNATURE-----

--=-4bK+7mXwK/amJg+2/2C0--
