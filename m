Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1M4XOQ-0001iY-RX
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 May 2009 11:38:22 +0200
Received: (qmail invoked by alias); 14 May 2009 09:31:31 -0000
Received: from f053011139.adsl.alicedsl.de (EHLO [192.168.4.110])
	[78.53.11.139]
	by mail.gmx.net (mp006) with SMTP; 14 May 2009 11:31:31 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1829Ehcrns2CLr8mA5ekw8znKEWKUNJ2RIiq5NJb6
	Z32aHEkMKbuNnC
Message-ID: <4A0BE509.8010406@gmx.net>
Date: Thu, 14 May 2009 11:31:53 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090514101502.133dd3e0@christian.taskit.de>
In-Reply-To: <20090514101502.133dd3e0@christian.taskit.de>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.55
Subject: Re: [PATCH] cacao: add missing patch
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
X-List-Received-Date: Thu, 14 May 2009 09:38:23 -0000
X-Groupsio-MsgNum: 10340
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigA9F7572F3653BF166B35F499"

--------------enigA9F7572F3653BF166B35F499
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Christian,
sorry for this glitch. I added the missing file.

Regards
Robert

Christian Glindkamp schrieb:
> In revision af5fcda66139e002d098c0df952b43c455806aba the patch
> cacao-disable-stackbase-check.patch was added to SRC_URI of all
> cacao recipes without committing the patch itself. This patch
> adds it to make cacao buildable again. The patch comes from the
> jalimo overlay.
>=20
> Signed-off-by: Christian Glindkamp <christian.glindkamp@taskit.de>
> ---
>  .../files/cacao-disable-stackbase-check.patch      |   12 ++++++++++++=

>  1 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/cacao/files/cacao-disable-stackbase-check.p=
atch
>=20
> diff --git a/recipes/cacao/files/cacao-disable-stackbase-check.patch b/=
recipes/cacao/files/cacao-disable-stackbase-check.patch
> new file mode 100644
> index 0000000..8eb2089
> --- /dev/null
> +++ b/recipes/cacao/files/cacao-disable-stackbase-check.patch
> @@ -0,0 +1,12 @@
> +Index: cacao-0.99.3+hg20090109/src/mm/boehm-gc/os_dep.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- cacao-0.99.3+hg20090109.orig/src/mm/boehm-gc/os_dep.c	2009-02-15 1=
6:29:15.000000000 +0100
> ++++ cacao-0.99.3+hg20090109/src/mm/boehm-gc/os_dep.c	2009-02-15 16:29:=
24.000000000 +0100
> +@@ -1077,7 +1077,6 @@
> +       c =3D stat_buf[buf_offset++];
> +     }
> +     close(f);
> +-    if (result < 0x10000000) ABORT("Absurd stack bottom value");
> +     return (ptr_t)result;
> +   }
> +=20



--------------enigA9F7572F3653BF166B35F499
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkoL5QwACgkQG9cfwmwwEtqXkgCeKUEwpl/v1HzkYvxKjD9mYRZN
XegAoJRPK6Jvow/KbVp7ZetMJSFSs64h
=kQLL
-----END PGP SIGNATURE-----

--------------enigA9F7572F3653BF166B35F499--
