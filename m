Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 93C7565DED
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:46:28 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b57so2915819eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AvX3BkLsYjp3DTmlDXg/lJv6jkCGkfmDmwVuUPtcHKs=;
	b=aSbeKc3G8GW4XfnPlsW3HYkDnY8wYPIq8USIghzvBSCcG8P82J8K1A+h0DL3C6FViK
	Pbh4slw5iyym0OERL21WLlGZDZ1a5DRoC6sj6laGJsIhldQE3+sacRoKj6022elC3WMv
	PI6RgsjO8obzDrtROsxezIEtC6DbmuFqpkW8KSRGWi2FVGcswNTOF6NJXB/uPPzyizvh
	uf+40QKRLAWp2cZ6A796gFeeP0r5AMkb4FHm2xbUKlvUinGFQLCWIiuklLRBlc2qBewd
	rACOIzAIF7rXaqgDVLXJvD9kVMtZt2aeFTBClb3cgCYHG0dCs2OsCHjCw47CfY9kIBxt
	2HEw==
X-Received: by 10.14.115.1 with SMTP id d1mr38256074eeh.30.1397994389221;
	Sun, 20 Apr 2014 04:46:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x45sm93944320eeu.23.2014.04.20.04.46.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:46:28 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:46:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-ID: <20140420114633.GC2486@jama>
References: <1397034941-6268-1-git-send-email-trevor.woerner@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1397034941-6268-1-git-send-email-trevor.woerner@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-devel@lists.openembedded.org,
	patches@linaro.org
Subject: Re: [meta-oe][PATCH] acpitests: add individual checksums
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
X-List-Received-Date: Sun, 20 Apr 2014 11:46:28 -0000
X-Groupsio-MsgNum: 49336
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MXXylufPoVaQ01lt"
Content-Disposition: inline

--MXXylufPoVaQ01lt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 05:15:40AM -0400, Trevor Woerner wrote:
> This recipe includes two source tarballs, add a second set of checksums so
> both have checksum definitions.

Merged, thanks!

>=20
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  meta-oe/recipes-extended/acpica/acpitests_20140114.bb | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/acpica/acpitests_20140114.bb b/meta=
-oe/recipes-extended/acpica/acpitests_20140114.bb
> index 4afe3a9..d8a3b9f 100644
> --- a/meta-oe/recipes-extended/acpica/acpitests_20140114.bb
> +++ b/meta-oe/recipes-extended/acpica/acpitests_20140114.bb
> @@ -6,12 +6,14 @@ LIC_FILES_CHKSUM =3D "file://tests/aapits/atexec.c;begi=
nline=3D1;endline=3D115;md5=3De92
> =20
>  DEPENDS =3D "bison flex"
> =20
> -SRC_URI =3D "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.=
tar.gz \
> -           https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.=
gz \
> +SRC_URI =3D "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.=
tar.gz;name=3Dacpitests \
> +           https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.=
gz;name=3Dacpica \
>             file://0001-Fixup-aapits-build.patch \
>      "
> -SRC_URI[md5sum] =3D "c72b61e092d2b25726dfff6e455116c9"
> -SRC_URI[sha256sum] =3D "368f69296edef5138fd33affa2d50bdcdd1dfd2f6919ba78=
2f8ecf03971a3a2c"
> +SRC_URI[acpitests.md5sum] =3D "c72b61e092d2b25726dfff6e455116c9"
> +SRC_URI[acpitests.sha256sum] =3D "368f69296edef5138fd33affa2d50bdcdd1dfd=
2f6919ba782f8ecf03971a3a2c"
> +SRC_URI[acpica.md5sum] =3D "fcd4b7304f1bfabc7d4b9cfdecc6b0c6"
> +SRC_URI[acpica.sha256sum] =3D "0d5bd32690ab77e21ab143ef25361c314a4ed13c3=
3a5fb3ddd6f5559ab24ebc3"
> =20
>  S =3D "${WORKDIR}/acpitests-unix-${PV}"
> =20
> --=20
> 1.9.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MXXylufPoVaQ01lt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTs5kACgkQN1Ujt2V2gByE3ACcCaaEIKkRmW3lSgeruTEBNAdj
GDIAoLVwSIp/hexO+2/KLF/V5qKaDqOM
=eYfL
-----END PGP SIGNATURE-----

--MXXylufPoVaQ01lt--
