Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P2MgG-0007BW-8Q for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 13:24:39 +0200
Received: from f053041250.adsl.alicedsl.de ([78.53.41.250]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P2Mg1-00006l-QC for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 11:24:21 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1286103879.4310.4.camel@mattotaupa>
References: <1286103879.4310.4.camel@mattotaupa>
Date: Sun, 03 Oct 2010 13:24:19 +0200
Message-ID: <1286105059.4310.8.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2 v2] python-{native}-2.6.5: Fix parallel build.
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
X-List-Received-Date: Sun, 03 Oct 2010 11:24:39 -0000
X-Groupsio-MsgNum: 24308
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-nJB0g86JZXvCEaYpW4Bw"

--=-nJB0g86JZXvCEaYpW4Bw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 03.10.2010, 13:04 +0200 schrieb Paul Menzel:
> Date: Sat, 2 Oct 2010 12:51:03 +0200
>=20
> Randomly the build failed for me with the following error message.
>=20
>     libpython2.6.so: undefined reference to `_PyParser_Grammar'
>=20
> The applied patch in [5] tried to fix this problem, but it turns out that=
 this was due to a possible race and already known in OpenOffice too [3].
>=20
> R. David Murray (dmalcolm) <dmalcolm@fedoraproject.org> fixed this in Fed=
ora [1] and I applied his patch.
>=20
> I reported this issue upstream [4] and this will only be fixed in Python =
2.7, so we have to keep this patch for Python 2.6.
>=20
> I put 20 in front of the name of the patch file without any reason.
>=20
> [1] http://pkgs.fedoraproject.org/gitweb/?p=3Dpython.git;a=3Dcommitdiff;h=
=3Db95f6cc2ca6a009f97436c6aa16cfd70547353d9
> [2] http://www.openoffice.org/issues/show_bug.cgi?id=3D114866
> [3] http://doc.services.openoffice.org/wiki/RedTinderboxStatusInEIS
> [4] http://bugs.python.org/issue10013
> [5] http://patchwork.openembedded.org/patch/1899/
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> v1 =E2=86=92 v2: Comments by Khem and Tom: add accidentally removed =C2=
=BB\=C2=AB at the line ending.
> ---

Please disregard this patch also. The added patch seems to not be
applicable to python-native that easily.

[=E2=80=A6]


Thanks,

Paul

--=-nJB0g86JZXvCEaYpW4Bw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyoZ+MACgkQPX1aK2wOHVgGsgCcDmMu1elwbDOcq5uJsMZkPBV2
APMAnRyJsX/VLFW2FqLW5D++uvpQcdCA
=5ZZS
-----END PGP SIGNATURE-----

--=-nJB0g86JZXvCEaYpW4Bw--
