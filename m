Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5DsS-0005QX-3S for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 10:37:01 +0200
Received: from f053041204.adsl.alicedsl.de ([78.53.41.204]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5Ds4-0007ou-Um for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 08:36:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1286775778-1446-1-git-send-email-sgarman@zenlinux.com>
References: <1286775778-1446-1-git-send-email-sgarman@zenlinux.com>
Date: Mon, 11 Oct 2010 10:36:35 +0200
Message-ID: <1286786195.3835.13.camel@mattotaupa>
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
Subject: Re: [PATCH] cpio: update 2.5 to 2.11
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
X-List-Received-Date: Mon, 11 Oct 2010 08:37:02 -0000
X-Groupsio-MsgNum: 24657
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-DODfdfptdeT3Ep62jP14"

--=-DODfdfptdeT3Ep62jP14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 10.10.2010, 22:42 -0700 schrieb Scott Garman:
> Signed-off-by: Scott Garman <sgarman@zenlinux.com>

I build tested your patch for minimal-eglibc for `MACHINE =3D
"beagleboard"`.

> ---
>  recipes/cpio/cpio-2.11/statdef.patch |   15 ++++++++
>  recipes/cpio/cpio_2.11.bb            |   42 +++++++++++++++++++++++
>  recipes/cpio/cpio_2.5.bb             |   42 -----------------------
>  recipes/cpio/files/install.patch     |   61 ----------------------------=
------
>  4 files changed, 57 insertions(+), 103 deletions(-)
>  create mode 100644 recipes/cpio/cpio-2.11/statdef.patch
>  create mode 100644 recipes/cpio/cpio_2.11.bb
>  delete mode 100644 recipes/cpio/cpio_2.5.bb
>  delete mode 100644 recipes/cpio/files/install.patch
>=20
> diff --git a/recipes/cpio/cpio-2.11/statdef.patch b/recipes/cpio/cpio-2.1=
1/statdef.patch
> new file mode 100644
> index 0000000..059976c
> --- /dev/null
> +++ b/recipes/cpio/cpio-2.11/statdef.patch
> @@ -0,0 +1,15 @@
> +# Avoid multiple stat definitions
> +# Patch taken from cpio mailing list posting 2010-03-19
> +#
> +# Signed-off-by: Scott Garman <sgarman@zenlinux.com>

Please include the link to that message in the archive.

[=E2=80=A6]


Thanks,

Paul

--=-DODfdfptdeT3Ep62jP14
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyyzJMACgkQPX1aK2wOHVg5iACfWuHpufNnv7WUfObnFTvc02q8
ff0AoIylfN1hpfVRW/YTUJNsrMLimyor
=4Bsj
-----END PGP SIGNATURE-----

--=-DODfdfptdeT3Ep62jP14--
