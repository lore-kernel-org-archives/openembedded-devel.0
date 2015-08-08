Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 18F86767FC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2015 22:26:17 +0000 (UTC)
Received: by pabyb7 with SMTP id yb7so79406880pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Aug 2015 15:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=2l+jorMyvJ18ZQE2Errc0ialbJ+k2dE8Ubrn2nDpA0A=;
	b=wgJKM+61Tsxq6REX0x10aWQR8Hr8ANI8hjImPhhMjbFZLkCaxjJLd/VeGKioamieb+
	As6XleB+ByeiJ6ZL8Csrd5RtrwwL1VjCdtpjsgw8ftf0mje+Tm7qeOteD9CkVHC6Npbx
	VjQJQiQBPkLVY5hc+0HqWpOQjI/2jlXV/0VLB1dWu66H9r/bhJWhGPedc5TtXj3E784x
	HaZq7puM6bkUTLr75Vlq2t5fDSsaxmQS2OibCrVfXbOtu0caR83VHybh2sNlZhMy9+Rn
	0piKQ8PsuFYt+TKKc/Fbwne+g21gUttNNyXZfWrx0HAJKyMdPLzkQB5THHKMOvs8ffnK
	N/Cg==
X-Received: by 10.69.20.33 with SMTP id gz1mr29427435pbd.102.1439072777842;
	Sat, 08 Aug 2015 15:26:17 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:61b5:b56b:3665:2b08?
	([2601:646:8601:4580:61b5:b56b:3665:2b08])
	by smtp.gmail.com with ESMTPSA id z8sm6767900pas.42.2015.08.08.15.26.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 15:26:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1438030411-5934-2-git-send-email-schnitzeltony@googlemail.com>
Date: Sat, 8 Aug 2015 15:26:09 -0700
Message-Id: <0CA2D0C9-295B-430B-9E4A-C6A73C1C9C19@gmail.com>
References: <1438030411-5934-1-git-send-email-schnitzeltony@googlemail.com>
	<1438030411-5934-2-git-send-email-schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [PATCH] imagemagick: update patchset from 9 to 10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Aug 2015 22:26:21 -0000
X-Groupsio-MsgNum: 56610
Content-Type: multipart/signed;
	boundary="Apple-Mail=_15C44713-4CD0-48EE-AB14-823536F00AEE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_15C44713-4CD0-48EE-AB14-823536F00AEE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 27, 2015, at 1:53 PM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>=20
> The ImageMagick-6.9.1-9.tar.xz is gone again.
>=20
> To avoid somebody doing the same mistake as I did - updating to an =
unfinished
> series - a note was dropped. Hopefully we don't see too many further =
patchsets
> within this version...
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
> meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb =
b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
> index e7c5374..d84d518 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
> @@ -5,11 +5,14 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D0887b670be7ef0c3cb37092b64d57514"
> # FIXME: There are many more checked libraries. All should be added or =
explicitly disabled to get consistent results.
> DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw =
freetype"
>=20
> -PATCHSET =3D "9"
> +# Important note: tarballs for all patchsets within a version are =
deleted when
> +# a new pachset is created. To avoid multiple patches for each =
patchset, try to
> +# update to the last pachset of a version
> +PATCHSET =3D =E2=80=9C10"

the minor patchset updates are often, I wish there was  more permanent =
place to store these tarballs
on parent dir there is same file with out version info =
http://www.imagemagick.org/download/ImageMagick.tar.bz2
this will make SRC_URI static but obfuscate the situation even more.

may be we should just start dumping the tarballs into =
sources.openembedded.org at the same time so we don=E2=80=99t have to =
upgrade the recipes
as and when ImageMagick release plus it also fixes the problem on =
release branches where recipe upgrade may not be sought at all.
> SRC_URI =3D =
"http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET=
}.tar.xz \
> "
> -SRC_URI[md5sum] =3D "5a3a60d1dae65ee7b1cc88498e3a0008"
> -SRC_URI[sha256sum] =3D =
"83cd785caeb26a171e185b5deba2900c5b73e79c97364caa4c879d26c9f4a91b"
> +SRC_URI[md5sum] =3D "cf5c663a31d0ca2975121d0803db0e61"
> +SRC_URI[sha256sum] =3D =
"22565464059376513869b6626982e0726a33788ccc7e19a08e55ff1683d4ff92"
>=20
> S =3D "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
>=20
> --
> 2.1.0
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_15C44713-4CD0-48EE-AB14-823536F00AEE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGgggACgkQuwUzVZGdMxRVhQCdHUqLD2lYDE7DgXVRdtcd+zBk
XaUAn2DHagPKa1KAQWtfY81ge41jkSh5
=EPp+
-----END PGP SIGNATURE-----

--Apple-Mail=_15C44713-4CD0-48EE-AB14-823536F00AEE--
