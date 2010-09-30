Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1IyL-0000U7-R8 for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 15:14:54 +0200
Received: from g225136165.adsl.alicedsl.de ([92.225.136.165]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1IyA-0007Pk-A6 for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 13:14:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285850437-2620-1-git-send-email-t.fromm@dresearch.de>
References: <1285838213.3805.52.camel@mattotaupa>
	<1285850437-2620-1-git-send-email-t.fromm@dresearch.de>
Date: Thu, 30 Sep 2010 15:14:40 +0200
Message-ID: <1285852480.3805.79.camel@mattotaupa>
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
Subject: Re: [PATCH v3] linux-libc-headers_2.6.24: Add falloc.h to kernel exported headers
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
X-List-Received-Date: Thu, 30 Sep 2010 13:14:54 -0000
X-Groupsio-MsgNum: 24216
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-fk23BMu12hopzOi0vbbp"

--=-fk23BMu12hopzOi0vbbp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 30.09.2010, 14:40 +0200 schrieb Thilo Fromm:
> This adds include/linux/falloc.h to the list of files exported by the ker=
nel to the C library.
> The include file is required for building e.g. a recent util-linux-ng aga=
inst 2.6.24.
>=20
> Starting from 2.6.25 a similar patch has been accepted upstream (the main=
line
> kernel). For 2.6.24, however, falloc.h is not exported although it's pres=
ent.
>=20
> Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>
> ---
>  .../linux-libc-headers/files/export_falloc_h.patch |   11 +++++++++++
>  .../linux-libc-headers_2.6.24.bb                   |    3 ++-
>  2 files changed, 13 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/linux-libc-headers/files/export_falloc_h.patc=
h
>=20
> diff --git a/recipes/linux-libc-headers/files/export_falloc_h.patch b/rec=
ipes/linux-libc-headers/files/export_falloc_h.patch
> new file mode 100644
> index 0000000..2133a36
> --- /dev/null
> +++ b/recipes/linux-libc-headers/files/export_falloc_h.patch
> @@ -0,0 +1,11 @@
> +upstream: OE-only

Hmm, do you think it is OE only. As written in my other message I
consider this an upstream patch, which has been committed already.

        upstream: http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linu=
x-2.6.git;a=3Dcommit;h=3D040922c04cf2c8ac70be2e88a8a9614ecdb41d2e
        comment: Patch is present in Linux kernel >=3D 2.6.25.

> +--- a/include/linux/Kbuild	2010-09-27 16:04:29.000000000 +0200
> ++++ b/include/linux/Kbuild	2010-09-27 15:59:06.000000000 +0200
> +@@ -61,6 +61,7 @@
> + header-y +=3D elf.h
> + header-y +=3D elf-em.h
> + header-y +=3D fadvise.h
> ++header-y +=3D falloc.h
> + header-y +=3D fd.h
> + header-y +=3D fdreg.h
> + header-y +=3D fib_rules.h
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> index b90c478..e95299b 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> @@ -2,10 +2,11 @@ require linux-libc-headers.inc
> =20
>  INHIBIT_DEFAULT_DEPS =3D "1"
>  DEPENDS +=3D "unifdef-native"
> -PR =3D "r5"
> +PR =3D "r6"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2 \
>             file://procinfo.h \
> +           file://export_falloc_h.patch \
>             file://unifdef.patch"
> =20
>  S =3D "${WORKDIR}/linux-${PV}"


Thanks,

Paul

--=-fk23BMu12hopzOi0vbbp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkykjUAACgkQPX1aK2wOHVgx+wCcCICZIHXrX/aXwJDxL7sKp0DE
yAQAniJ6QDgkJHNIDST3CZMeQWSlqTiF
=L1uo
-----END PGP SIGNATURE-----

--=-fk23BMu12hopzOi0vbbp--
