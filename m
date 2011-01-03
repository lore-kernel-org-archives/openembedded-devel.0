Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PZrXG-0007Ep-DV
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 22:01:46 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PZrWw-00050f-0w
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 00:01:26 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 4 Jan 2011 00:01:24 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
	<1294084926-3115-8-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1294084926-3115-8-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
Message-Id: <201101040001.25051.roman@khimov.ru>
Subject: Re: [PATCH 08/12] busybox: provide -passwd and -shadow packages
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
X-List-Received-Date: Mon, 03 Jan 2011 21:01:46 -0000
X-Groupsio-MsgNum: 27677
Content-Type: multipart/signed; boundary="nextPart3960338.NjpOY1jkVv";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3960338.NjpOY1jkVv
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA 03 =D1=
=8F=D0=BD=D0=B2=D0=B0=D1=80=D1=8F 2011 23:02:02 =D0=B0=D0=B2=D1=82=D0=BE=D1=
=80 Bernhard Reutner-
=46ischer =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
>  recipes/busybox/busybox.inc      |   28 ++++++++++++++++++++++++++++
>  recipes/busybox/busybox_1.1x.inc |    2 ++
>  recipes/busybox/files/passwd     |   11 +++++++++++
>  recipes/busybox/files/shadow     |   11 +++++++++++
>  4 files changed, 52 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/busybox/files/passwd
>  create mode 100644 recipes/busybox/files/shadow

I don't quite understand why is it needed. We have base-passwd for passwd (=
and=20
group) and missing shadow usually is not an issue (if my memory serves me=20
right, it'll be created on first usage). Then, speaking of base-passwd that=
=20
needs to be updated to use alternatives if this goes in.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart3960338.NjpOY1jkVv
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0iOSUACgkQXJ70z+XgVcNwrACg4ZjmlLW3+3N2xCddg3VhFqAE
N2UAnA5kXZbbxT4OlRrBbP6bpBChuy/c
=NQjI
-----END PGP SIGNATURE-----

--nextPart3960338.NjpOY1jkVv--
