Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P75yK-00056l-9c for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 14:35:24 +0200
Received: from f053038254.adsl.alicedsl.de ([78.53.38.254]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P75xr-0003M5-3B for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 12:34:19 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1287230170-20745-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1287230170-20745-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Sat, 16 Oct 2010 14:34:15 +0200
Message-ID: <1287232455.3980.60.camel@mattotaupa>
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
Subject: Re: [PATCH] gnutols_2.10.1: remove the libtool-m4-macros
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
X-List-Received-Date: Sat, 16 Oct 2010 12:36:34 -0000
X-Groupsio-MsgNum: 24937
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-l0cXbtGat/rnS4qQP9+Q"

--=-l0cXbtGat/rnS4qQP9+Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 16.10.2010, 13:56 +0200 schrieb Frans Meulenbroeks:

Typo in commit summary. s/gnutols/gnutls/

I have not kept up with recent changes. But why is that patch not needed
anymore and why can the `libtool-m4-macros` be removed?

> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
>  recipes/gnutls/gnutls-2.10.1/libtool-update.patch |10965 ---------------=
------
>  recipes/gnutls/gnutls_2.10.1.bb                   |   15 +-
>  2 files changed, 13 insertions(+), 10967 deletions(-)
>  delete mode 100644 recipes/gnutls/gnutls-2.10.1/libtool-update.patch
>=20
> diff --git a/recipes/gnutls/gnutls-2.10.1/libtool-update.patch b/recipes/=
gnutls/gnutls-2.10.1/libtool-update.patch
> deleted file mode 100644
> index 04cbe72..0000000
> --- a/recipes/gnutls/gnutls-2.10.1/libtool-update.patch
> +++ /dev/null

[=E2=80=A6]

> diff --git a/recipes/gnutls/gnutls_2.10.1.bb b/recipes/gnutls/gnutls_2.10=
.1.bb
> index 2828735..84efb1f 100644
> --- a/recipes/gnutls/gnutls_2.10.1.bb
> +++ b/recipes/gnutls/gnutls_2.10.1.bb
> @@ -1,6 +1,6 @@
>  require gnutls.inc
> =20
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.2"
> =20
>  LICENSE_${PN}-extra =3D "GPLv3"
> =20
> @@ -9,8 +9,19 @@ EXTRA_OECONF +=3D " --without-libgcrypt-prefix "
>  SRC_URI +=3D "file://gettextize-with-gettext-0.18.patch \
>              file://gnutls-openssl.patch \
>              file://gnutls-replace-siginterrupt.patch \
> -            ${@['','file://libtool-update.patch'][bb.data.getVar('LIBTOO=
L_HAS_SYSROOT', d, 1) =3D=3D 'yes']} \
>             "
> =20
> +do_configure_prepend() {
> +
> + MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m=
4"
> +
> + for i in ${MACROS}; do
> +   rm m4/$i
> +   rm lib/m4/$i
> +   rm libextra/m4/$i
> + done
> +
> +}
> +
>  SRC_URI[gnutls.md5sum] =3D "b614448d7fb43ea0d4f727e6302bbf0f"
>  SRC_URI[gnutls.sha256sum] =3D "731078bc11661411ba47b20a65024abeca40d43a1=
b3c4526a6599b7905c302ee"


Thanks,

Paul

--=-l0cXbtGat/rnS4qQP9+Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky5m8cACgkQPX1aK2wOHVjbwwCfZnoGtWXZa+uK8+NitpU/3suT
hUwAniftwueTQPRQG4NhIs3Cz2GTfgks
=4R7j
-----END PGP SIGNATURE-----

--=-l0cXbtGat/rnS4qQP9+Q--
