Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLxV5-0006ll-Jg for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 15:06:19 +0200
Received: from f053045019.adsl.alicedsl.de ([78.53.45.19]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLxTn-0002KP-CG for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 13:04:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305546074-18796-1-git-send-email-obi@opendreambox.org>
References: <1305546074-18796-1-git-send-email-obi@opendreambox.org>
Date: Mon, 16 May 2011 15:03:27 +0200
Message-ID: <1305551007.5159.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] lib/oe/unpack.py: unpack rar archives
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
X-List-Received-Date: Mon, 16 May 2011 13:06:19 -0000
X-Groupsio-MsgNum: 32101
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-HLcI6KLjJ8ZK9kx2kgRp"

--=-HLcI6KLjJ8ZK9kx2kgRp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 16.05.2011, 11:41 +0000 schrieb Andreas Oberritter:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  lib/oe/unpack.py |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/lib/oe/unpack.py b/lib/oe/unpack.py
> index 8e8bf36..fa517d8 100644
> --- a/lib/oe/unpack.py
> +++ b/lib/oe/unpack.py
> @@ -96,6 +96,8 @@ def unpack_file(file, destdir, parameters, env=3DNone):
>              if dos:
>                  cmd =3D '%s -a' % cmd
>              cmd =3D "%s '%s'" % (cmd, file)
> +        elif file.endswith('.rar'):
> +            cmd =3D 'unrar x %s' % file
> =20
>      if not unpack or not cmd:
>          if os.path.isdir(file):

1. What program needs this? I am just asking to be able to test this.
2. Will `unrar-native` automatically be build when such an archive is
encountered?

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-HLcI6KLjJ8ZK9kx2kgRp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3RIJkACgkQPX1aK2wOHVjokgCfVaWJxz33ixdoLyqGS90lZ6s9
cYYAn0wvXKsFOuYGefUbNNaubWuPpfyk
=KMcK
-----END PGP SIGNATURE-----

--=-HLcI6KLjJ8ZK9kx2kgRp--
