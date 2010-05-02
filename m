Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1O8Yn2-0003X7-Qv
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 15:00:58 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1O8YjQ-0006vL-Ay
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 16:57:13 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 2 May 2010 16:57:08 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1272790986-26842-1-git-send-email-eric@eukrea.com>
	<1272795698-23606-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1272795698-23606-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Message-Id: <201005021657.11572.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] zlib: Add version 1.2.5
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
X-List-Received-Date: Sun, 02 May 2010 13:00:58 -0000
X-Groupsio-MsgNum: 18931
Content-Type: multipart/signed; boundary="nextPart2327059.ySYbIMMv66";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2327059.ySYbIMMv66
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 02 =D0=
=BC=D0=B0=D1=8F 2010 14:21:38 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Eric Benard =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> - update autotool patch for this version
> - tested on x86
>=20
> Signed-off-by: Eric Benard <eric@eukrea.com>
> ---
> v2 :
> 	fix the autotools patch to have the correct version number
> 	remove whitspaces

Please, the next time you submit updated version of any patch go to=20
patchwork.openembedded.org and update the status of old one to "Superseded"=
=2E=20
I've done that for this particular patch as I've looked at it anyway, but a=
t=20
quick glance there are other leftovers there, so it'd be nice if you've=20
cleaned that up.

>  recipes/zlib/files/0001-autotools.patch |   57
>  +++++++++++++++++++++++++++++++ recipes/zlib/zlib-native_1.2.5.bb       =
|=20
>    9 +++++
>  recipes/zlib/zlib-sdk_1.2.5.bb          |    4 ++
>  recipes/zlib/zlib_1.2.5.bb              |   22 ++++++++++++
>  4 files changed, 92 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/zlib/files/0001-autotools.patch
>  create mode 100644 recipes/zlib/zlib-native_1.2.5.bb
>  create mode 100644 recipes/zlib/zlib-sdk_1.2.5.bb
>  create mode 100644 recipes/zlib/zlib_1.2.5.bb

I think it'd be nice to do BBCLASSEXTEND conversion here (there was an=20
attempt:=20
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-March/018132.h=
tml=20
) and add new version with a move to common .inc file.

> --- /dev/null
> +++ b/recipes/zlib/zlib_1.2.5.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "Zlib Compression Library"
> +SECTION =3D "libs"
> +PRIORITY =3D "required"
> +HOMEPAGE =3D "http://www.gzip.org/zlib/"
> +LICENSE =3D "zlib"
> +PR =3D"r1"

PR should be "r0".

> +inherit autotools
> +
> +do_stage() {
> +       autotools_stage_all
> +}

Maybe change this to

inherit autotools_stage

?

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2327059.ySYbIMMv66
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkvddqcACgkQXJ70z+XgVcNprQCgqewdX1FRVU7rVY+ZirALKPeF
jJQAnAinP4ktJVPG0A+z2xF+O+eNdbul
=umAk
-----END PGP SIGNATURE-----

--nextPart2327059.ySYbIMMv66--
