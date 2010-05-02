Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1O8fjY-0007PJ-W5
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 22:25:49 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1O8ffx-0007Rg-5g
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 00:22:06 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 3 May 2010 00:22:01 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1271240361-8354-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1271240361-8354-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Message-Id: <201005030022.04359.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] autotools.bbclass: swapped calls of intltoolize + autoreconf
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
X-List-Received-Date: Sun, 02 May 2010 20:25:49 -0000
X-Groupsio-MsgNum: 18938
Content-Type: multipart/signed; boundary="nextPart4096657.zNch4C9FMD";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart4096657.zNch4C9FMD
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 14 =D0=B0=D0=BF=D1=80=D0=B5=D0=BB=D1=8F 2010=
 14:19:21 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Enrico Scholz =D0=BD=D0=B0=D0=BF=
=D0=B8=D1=81=D0=B0=D0=BB:
> Because 'intltoolize' checks whether aclocal.m4 contains a recent copy
> of 'intltool.m4' and it will fail when the found version is too old,
> 'aclocal' must be called before 'intltoolize'.
>=20
> I built projects it with intltool-0.40.6-r3, autoconf-2.65-r9,
> automake-1.11.1-r3 and gettext-0.17-r6 successfully with this change but
> it will require probably tests with older versions.
>=20
> This patch is a requirement for
> http://patchwork.openembedded.org/patch/1858/ because 'autopoint' from
> the 'aclocal' call will override 'intltool' files and build will fail
> then.
>=20
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  classes/autotools.bbclass |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Roman I Khimov <khimov@altell.ru>

And pushed, thanks.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart4096657.zNch4C9FMD
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkvd3uwACgkQXJ70z+XgVcNKlACfZMwgNZAxoiKcgceQLB6SlFwY
UIAAoJLRPo3o4+kghBYekFQreGLgMFhd
=64qb
-----END PGP SIGNATURE-----

--nextPart4096657.zNch4C9FMD--
