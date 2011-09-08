Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R1XGh-0000Qe-6m
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 07:35:19 +0200
Received: by fxg11 with SMTP id 11so1256381fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 22:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U3pnrPa8Hw7RE6ztUTmtdTf2MMM69+ASGSU2JZRnsno=;
	b=BULesbqQ9wJDLs4E3wMM8t/7kl8cTnn/24b0SXuzR5GuX72bt1dZIvgfTLf9xHX8TN
	P+jqyGNHGr+CDoeRFmpTWeH4ny4dNzHdDotSPusggHLl0tu8vNILHTsCnEMb2SeQi/j2
	4Dyj8zN5SGI0guZO2wi8Ki6Fp4XZnpDGy2Mgk=
Received: by 10.223.30.214 with SMTP id v22mr468627fac.108.1315459816148;
	Wed, 07 Sep 2011 22:30:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a17sm802296faf.22.2011.09.07.22.30.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 22:30:14 -0700 (PDT)
Date: Thu, 8 Sep 2011 07:30:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110908053008.GD19221@jama.jama.net>
References: <CA+chaQdYjN2tEhr6NXa0Qvix-1MoRPrG3iVMnD6ueLsSvXL+9g@mail.gmail.com>
	<1315387311-20180-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1315387311-20180-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-oe v2] binutils-2.20.1: fix checksums as 2.20.1 is now 2.20.1a
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
X-List-Received-Date: Thu, 08 Sep 2011 05:35:19 -0000
X-Groupsio-MsgNum: 34139
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OROCMA9jn6tkzFBc"
Content-Disposition: inline

--OROCMA9jn6tkzFBc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2011 at 11:21:51AM +0200, Eric B=E9nard wrote:
> 2.20.1 is now 2.20.1a (but when extracting the 2.20.1a sources, the
> directory name is still 2.20.1)
>=20
> $ LANG=3DC diff -rq binutils-2.20.1 binutils-2.20.1a
> Only in binutils-2.20.1a: cgen
> Files binutils-2.20.1/md5.sum and binutils-2.20.1a/md5.sum differ
> Files binutils-2.20.1/opcodes/m32c-desc.c and binutils-2.20.1a/opcodes/m3=
2c-desc.c differ
> Files binutils-2.20.1/opcodes/mep-asm.c and binutils-2.20.1a/opcodes/mep-=
asm.c differ
> Files binutils-2.20.1/opcodes/mep-opc.c and binutils-2.20.1a/opcodes/mep-=
opc.c differ
>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

Thanks!

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  .../recipes-devtools/binutils/binutils_2.20.1.bb   |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb b/meta-=
oe/recipes-devtools/binutils/binutils_2.20.1.bb
> index 2558bda..d4eb516 100644
> --- a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
> +++ b/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
> @@ -1,6 +1,6 @@
>  require binutils.inc
> =20
> -PR =3D "r6"
> +PR =3D "r7"
> =20
>  LIC_FILES_CHKSUM=3D"\
>      file://src-release;endline=3D17;md5=3D4830a9ef968f3b18dd5e9f2c00db2d=
35\
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM=3D"\
>      "
> =20
>  SRC_URI =3D "\
> -     ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
> +     ${GNU_MIRROR}/binutils/binutils-${PV}a.tar.bz2 \
>       file://binutils-uclibc-100-uclibc-conf.patch \
>       file://110-arm-eabi-conf.patch \
>       file://binutils-uclibc-300-001_ld_makefile_patch.patch \
> @@ -36,7 +36,7 @@ SRC_URI =3D "\
>       file://202_elflink_noaddneeded_vs_weak.patch \
>       "
> =20
> -SRC_URI[md5sum] =3D "9cdfb9d6ec0578c166d3beae5e15c4e5"
> -SRC_URI[sha256sum] =3D "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53=
df906498afe6f6f8"
> +SRC_URI[md5sum] =3D "2b9dc8f2b7dbd5ec5992c6e29de0b764"
> +SRC_URI[sha256sum] =3D "71d37c96451333c5c0b84b170169fdcb138bbb27397dc062=
81905d9717c8ed64"
> =20
>  BBCLASSEXTEND =3D "native"
> --=20
> 1.7.6
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OROCMA9jn6tkzFBc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5oUuAACgkQN1Ujt2V2gBy1PwCghMfmfe+TxWJoptqIww2kgIe8
sIwAmgK02aydtyGTZlcE80/NqG4RywIC
=NrmE
-----END PGP SIGNATURE-----

--OROCMA9jn6tkzFBc--
