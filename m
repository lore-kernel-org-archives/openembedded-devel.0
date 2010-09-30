Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1FGE-0004IY-3S for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 11:17:07 +0200
Received: from f053042246.adsl.alicedsl.de ([78.53.42.246]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1FG2-0001np-Ua for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 09:16:55 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285774983-31373-1-git-send-email-t.fromm@dresearch.de>
References: <1285765693.4578.14.camel@mattotaupa>
	<1285774983-31373-1-git-send-email-t.fromm@dresearch.de>
Date: Thu, 30 Sep 2010 11:16:53 +0200
Message-ID: <1285838213.3805.52.camel@mattotaupa>
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
Subject: Re: [PATCH v2] linux-libc-headers (2.6.24): Add falloc.h to kernel exported headers
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
X-List-Received-Date: Thu, 30 Sep 2010 09:17:07 -0000
X-Groupsio-MsgNum: 24207
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Iwp9Gg4Vz2jPxzuCGSsM"

--=-Iwp9Gg4Vz2jPxzuCGSsM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Thilo,


although not very important I think it is better to write

	linux-libc-headers_2.6.24

in the commit summary.


Am Mittwoch, den 29.09.2010, 17:43 +0200 schrieb Thilo Fromm:
> upstream: OE-only

This can be omitted in the commit message.

> This adds include/linux/falloc.h to the list of files exported by the ker=
nel=20
> to the C library. The include file is required for building e.g. a recent=
=20
> util-linux-ng against 2.6.24.
>=20
> Starting from 2.6.25 a similar patch has been accepted upstream (the main=
line=20
> kernel). For 2.6.24, however, falloc.h is not exported although it's pres=
ent.
>=20
> Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>
> ---
>  .../linux-libc-headers/files/export_falloc_h.patch |   10 ++++++++++
>  .../linux-libc-headers_2.6.24.bb                   |    1 +
>  2 files changed, 11 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/linux-libc-headers/files/export_falloc_h.patc=
h
>=20
> diff --git a/recipes/linux-libc-headers/files/export_falloc_h.patch b/rec=
ipes/linux-libc-headers/files/export_falloc_h.patch
> new file mode 100644
> index 0000000..5860e88
> --- /dev/null
> +++ b/recipes/linux-libc-headers/files/export_falloc_h.patch

Just for the record. Please add the patch header as I wrote in my other
message

> @@ -0,0 +1,10 @@
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
> index b90c478..6db6fd1 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> @@ -6,6 +6,7 @@ PR =3D "r5"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2 \
>             file://procinfo.h \
> +           file://export_falloc_h.patch \
>             file://unifdef.patch"
> =20
>  S =3D "${WORKDIR}/linux-${PV}"

I think the next iteration will be ready to be committed.


Thanks,

Paul

--=-Iwp9Gg4Vz2jPxzuCGSsM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkykVYUACgkQPX1aK2wOHVgfXgCdEWhjlWR/F3PkQPAbRHehXiWI
CDQAn11p+iszbEkKRM/FN2GjhvkxenVS
=t12H
-----END PGP SIGNATURE-----

--=-Iwp9Gg4Vz2jPxzuCGSsM--
