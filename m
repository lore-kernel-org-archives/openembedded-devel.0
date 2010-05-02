Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1O8YIi-0000cW-Ld
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 14:29:37 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1O8YF7-0006t3-1D
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 16:25:53 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 2 May 2010 16:25:52 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1272549694-23764-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1272549694-23764-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Message-Id: <201005021625.52543.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] nano: Add version 2.2.4.
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
X-List-Received-Date: Sun, 02 May 2010 12:29:37 -0000
X-Groupsio-MsgNum: 18930
Content-Type: multipart/signed; boundary="nextPart5648941.UYL6bnPLeO";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart5648941.UYL6bnPLeO
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 29 =D0=B0=D0=BF=D1=80=D0=B5=D0=
=BB=D1=8F 2010 18:01:34 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Eric Benard =D0=BD=
=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> * give access to the latest stable release available
> * Tested on x86
>=20
> Signed-off-by: Eric Benard <eric@eukrea.com>
> ---
>  recipes/nano/nano_2.2.4.bb |   22 ++++++++++++++++++++++
>  1 files changed, 22 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/nano/nano_2.2.4.bb

Scott Garman submitted 2.2.4 version a bit earlier (see=20
http://patchwork.openembedded.org/patch/1952/) and

> +do_configure_prepend () {
> +	install -m 0644 ${WORKDIR}/glib.m4 m4/
> +}

this actually is not needed for 2.2.4 version. So I've submitted his patch =
for=20
that. Thanks, anyway.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart5648941.UYL6bnPLeO
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkvdb1AACgkQXJ70z+XgVcN0+gCfQqzuLa9XVoyy0JaMiW2DvnaA
ZacAoM9lRS3DxsAp84EXm97XFv8bSD0R
=W0Tm
-----END PGP SIGNATURE-----

--nextPart5648941.UYL6bnPLeO--
