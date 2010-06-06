Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OLLK8-0001Yx-5n
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 21:16:02 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OLLFq-0001ep-GX
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 23:11:34 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 6 Jun 2010 23:11:23 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <4C09946F.9040401@mentor.com>
In-Reply-To: <4C09946F.9040401@mentor.com>
MIME-Version: 1.0
Message-Id: <201006062311.28237.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add locking on tasks that add package_update_index_ipk
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
X-List-Received-Date: Sun, 06 Jun 2010 19:16:02 -0000
X-Groupsio-MsgNum: 19942
Content-Type: multipart/signed; boundary="nextPart7076773.NHoa96TnjU";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart7076773.NHoa96TnjU
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=83=D0=B1=D0=B1=D0=BE=D1=82=D0=B0 05 =D0=B8=D1=8E=D0=BD=D1=8F 2010=
 04:03:59 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Tom Rini =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=BB:
> We add a lockfile of do_populate_sdk and do_rootfs (in rootfs_ipk) that
> is also the lockfile that package_update_index_ipk uses.  With enough
> threads it is possible that one image (or meta-toolchain) is attempting
> to use the package index while another has only reached the point of
> generating the index leading to an empty index being seen later on.

Am I right that effectively it makes rootfs creation sequential? It's bad f=
or=20
performance. Probably it's time to fix ipkg-make-index to not touch index=20
files if no new packages are found as was suggested some time ago:

http://patchwork.openembedded.org/patch/744/

But thinking about it a bit more, ipkg-make-index hack won't really fix the=
=20
issue in this case, as we can have image A with a set of packages, image B=
=20
with a similar set of packages plus additional package P and then A would d=
o=20
package_update_index_ipk and enter do_rootfs, then P gets completed,=20
package_update_index_ipk for B is started and the package index really need=
s=20
an update, thus things can break again.

Maybe it's easier to make those indexes per-image for performance.

Well,

Acked-by: Roman I Khimov <khimov@altell.ru>

for now.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart7076773.NHoa96TnjU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkwL8t8ACgkQXJ70z+XgVcN7cwCfd2YAnIzhAV83EcwLLT00qXpO
xZMAoJ1BEcXd769Si5X6nvcln2Cp13R6
=I2xR
-----END PGP SIGNATURE-----

--nextPart7076773.NHoa96TnjU--
