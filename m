Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtyE9-00075z-Dk for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 10:45:25 +0200
Received: from f053044176.adsl.alicedsl.de ([78.53.44.176]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qty9n-0007TP-O0 for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 08:40:55 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b70d3308cd1493c12b7e1ba39fbfa5bb38c8ecc1.1313655217.git.Martin.Jansa@gmail.com>
References: <cover.1313655217.git.Martin.Jansa@gmail.com>
	<b70d3308cd1493c12b7e1ba39fbfa5bb38c8ecc1.1313655217.git.Martin.Jansa@gmail.com>
Date: Thu, 18 Aug 2011 10:40:46 +0200
Message-ID: <1313656846.4016.18.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH 1/3] kexec-tools-klibc: import from meta-zaurus layer
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
X-List-Received-Date: Thu, 18 Aug 2011 08:45:25 -0000
X-Groupsio-MsgNum: 33685
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-bJFT8MtaxuxfQ96WgmNb"

--=-bJFT8MtaxuxfQ96WgmNb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Martin,


Am Donnerstag, den 18.08.2011, 10:14 +0200 schrieb Martin Jansa:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

please include the commit id as documented in the Commit Patch Message
Guidelines [1].

Why was is not included into meta-oe in the first place? Should it be
included in oe-core right away?

> ---
>  .../kexec/kexec-tools-klibc-2.0.2/elf.patch        |   94 ++++++++++++++=
+++++
>  .../kexec/kexec-tools-klibc-2.0.2/errno.patch      |   13 +++
>  .../kexec/kexec-tools-klibc-2.0.2/other.patch      |   97 ++++++++++++++=
++++++
>  .../kexec/kexec-tools-klibc-2.0.2/string.patch     |   11 ++
>  .../kexec/kexec-tools-klibc-2.0.2/syscall.patch    |   46 +++++++++
>  .../kexec/kexec-tools-klibc_2.0.2.bb               |   27 ++++++
>  6 files changed, 288 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/=
elf.patch
>  create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/=
errno.patch
>  create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/=
other.patch
>  create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/=
string.patch
>  create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/=
syscall.patch
>  create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.=
bb

[=E2=80=A6]

> diff --git a/meta-oe/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/me=
ta-oe/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
> new file mode 100644
> index 0000000..e4f126e
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
> @@ -0,0 +1,27 @@
> +# the binaries are statically linked against klibc
> +require recipes-kernel/kexec/kexec-tools.inc
> +SRC_URI[md5sum] =3D "bc401cf3262b25ff7c9a51fc76c8ab91"
> +SRC_URI[sha256sum] =3D "549ab65c18a2229b6bf21b6875ca6bbe0e579bca08c3543c=
e6aaf8287a0b4188"
> +
> +PR =3D "r6"

Start with "r0" or will that cause problems for the meta-zaurus users?

> +inherit klibc
> +
> +FILESPATH =3D. "${FILE_DIRNAME}/kexec-tools-${PV}:"
> +
> +SRC_URI +=3D "file://elf.patch \
> +            file://errno.patch \
> +            file://string.patch \
> +            file://syscall.patch \
> +            file://other.patch \
> +            "
> +
> +S =3D "${WORKDIR}/kexec-tools-${PV}"
> +
> +EXTRA_OECONF =3D " --without-zlib"

Is `+=3D` needed? Either way the space could be removed in a fix up patch.

> +
> +PACKAGES =3D+ "kexec-klibc kdump-klibc"
> +
> +CFLAGS +=3D "-I${STAGING_DIR_HOST}${base_libdir}/klibc/include -I${STAGI=
NG_DIR_HOST}${base_libdir}/klibc/include/bits32"
> +
> +FILES_kexec-klibc =3D "${sbindir}/kexec"
> +FILES_kdump-klibc =3D "${sbindir}/kdump"

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines#=
Importing_from_Elsewhere

--=-bJFT8MtaxuxfQ96WgmNb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5M0A4ACgkQPX1aK2wOHVjUXACdEO8cW8H9YKNVhWbk0em167K6
eG8An3gu3zIZuh4segwHA3HUWbyZ1u7o
=fxoT
-----END PGP SIGNATURE-----

--=-bJFT8MtaxuxfQ96WgmNb--
