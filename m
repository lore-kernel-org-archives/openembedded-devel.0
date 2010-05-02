Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1O8eu0-0001Vo-MW
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 21:32:33 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1O8eqN-0007Na-RK
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 23:28:48 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 2 May 2010 23:28:36 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1272824348-17407-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1272824348-17407-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Message-Id: <201005022328.40590.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] zlib: convert to BBCLASSEXTAND and add version 1.2.5
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
X-List-Received-Date: Sun, 02 May 2010 19:32:33 -0000
X-Groupsio-MsgNum: 18936
Content-Type: multipart/signed; boundary="nextPart1640574.R1YXkqvjQE";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1640574.R1YXkqvjQE
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 02 =D0=
=BC=D0=B0=D1=8F 2010 22:19:08 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Eric Benard =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> - convert to BBCLASSEXTAND
> - unify versions with .inc file
> - add version 1.2.5 with updated autotool patch for this version
>=20
> Signed-off-by: Eric Benard <eric@eukrea.com>
> ---
=2E...
> diff --git a/recipes/zlib/zlib.inc b/recipes/zlib/zlib.inc
> new file mode 100644
> index 0000000..e60f69c
> --- /dev/null
> +++ b/recipes/zlib/zlib.inc
> @@ -0,0 +1,14 @@
=2E...
> +inherit autotools autotools_stage

Actually, even autotools_stage is not needed, my mistake, I've corrected th=
at=20
in a patch along with s/BBCLASSEXTAND/BBCLASSEXTEND/ in commit message.

Acked-by: Roman I Khimov <khimov@altell.ru>

And pushed. Thanks.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1640574.R1YXkqvjQE
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkvd0mgACgkQXJ70z+XgVcMl4gCeI1Tn1AotX4foS2q5+YAdDvRt
Sa8AoNToBsy8gYI7tnaeK9iv0cm+3EOo
=bBG9
-----END PGP SIGNATURE-----

--nextPart1640574.R1YXkqvjQE--
