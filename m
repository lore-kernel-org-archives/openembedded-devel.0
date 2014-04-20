Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7F93F6098B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 12:54:05 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so3026036eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 05:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c4b5GzVecXFHln+R/YCVZGvjgtAdHiWyNnufCAfme5E=;
	b=vvodtb1ebMiGzVu9XShKpGKfiv/7kzYwyzykkC6yfwxISquD8zuz6MV2yvKhRXtSsE
	vxxP7lWbAE4XqezQzGfOq9l7TLHYkWwdCfBzZF2Uaa28HUAWDOgWhGkS8aAz2LGWoktR
	36VFb0/AR1jv8qJryRH5J9bQ9HSo+72rCEouajwp79T3uu/Zbc2La9hUEQpOeIdVvrD3
	Dnx8xLN0ywIj02gXfkFkZBTwV564JJrQXWoZHTlsMGdKLshTCD5VStA4flukw/bJ/v9I
	L7RWBCeV+sQ3rjV2n6sO82g3G+fIeEK+peVLI7SepCjiXgrwSQmEkakP0qDkvS87oIlf
	e+fw==
X-Received: by 10.14.95.136 with SMTP id p8mr156039eef.103.1397998446870;
	Sun, 20 Apr 2014 05:54:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o7sm94403093eew.25.2014.04.20.05.54.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 05:54:05 -0700 (PDT)
Date: Sun, 20 Apr 2014 14:54:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420125411.GL2486@jama>
References: <1395326878-6726-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<1396358092-9738-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B57550F94@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B57550F94@COSNADEXC13.usr.ingenico.loc>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [OE-core][PATCH v2] open-vcdiff: add new recipe for version 0.8.3
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
X-List-Received-Date: Sun, 20 Apr 2014 12:54:06 -0000
X-Groupsio-MsgNum: 49345
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/k2pzXB1sdSS/P9"
Content-Disposition: inline

--W/k2pzXB1sdSS/P9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 01, 2014 at 01:27:49PM +0000, Matthieu CRAPET wrote:
> Hi,

Merged, thanks!

>=20
> This discards and replaces the patch already in master-next:
> http://cgit.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D7720023d0e69215746753cb3dea2ec9e61408a15
>=20
> Regards,
> Matthieu
>=20
>=20
> -----Message d'origine-----
> De=A0: Matthieu CRAPET=20
> Envoy=E9=A0: mardi 1 avril 2014 15:15
> =C0=A0: openembedded-devel@lists.openembedded.org
> Cc=A0: Matthieu CRAPET
> Objet=A0: [OE-core][PATCH v2] open-vcdiff: add new recipe for version 0.8=
=2E3
>=20
> From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
>=20
> This is Google's implementation of VCDIFF (RFC 3284) delta compression.
> It's more flexible than Xdelta3 (as a developer point of view).
>=20
> v2 patch:
> State of bitbake world, Failed tasks 2014-03-29 reported a do_configure e=
rror:
>=20
> | aclocal: error: non-option arguments are not accepted: '\'.
>=20
> configure.ac file is quite out of date. Submitted patch upstream:
> http://code.google.com/p/open-vcdiff/issues/detail?id=3D43
> Note: autoupdate could be considered later...
>=20
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  .../open-vcdiff/files/aclocal-amflags-fix.patch    | 33 ++++++++++++++++=
++++++
>  .../open-vcdiff/open-vcdiff_0.8.3.bb               | 19 +++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta-oe/recipes-support/open-vcdiff/files/aclocal-amf=
lags-fix.patch
>  create mode 100644 meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3=
=2Ebb
>=20
> diff --git a/meta-oe/recipes-support/open-vcdiff/files/aclocal-amflags-fi=
x.patch b/meta-oe/recipes-support/open-vcdiff/files/aclocal-amflags-fix.pat=
ch
> new file mode 100644
> index 0000000..cd1efd7
> --- /dev/null
> +++ b/meta-oe/recipes-support/open-vcdiff/files/aclocal-amflags-fix.patc
> +++ h
> @@ -0,0 +1,33 @@
> +Fix this error:
> +
> +| aclocal: error: non-option arguments are not accepted: '\'.
> +
> +Starting from commit v1.11-662-g52246cc, when given non-option arguments=
, aclocal rejects them, instead of silently ignoring them.
> +
> +Declare ACLOCAL_AMFLAGS as a single line because autoreconf can't handle=
 multiline.
> +
> +Notice that ACLOCAL_AMFLAGS is deprecated.
> +In configure.ac, AC_CONFIG_MACRO_DIRS should be used (instead of AC_CONF=
IG_MACRO_DIR) but requires automake 1.13+.
> +
> +Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> +---
> + Makefile.am | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 5c765c7..f4295a6 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -1,8 +1,7 @@
> + ## Process this file with automake to produce Makefile.in
> +=20
> + # Make sure that when we re-make ./configure, we get the macros we=20
> +need -ACLOCAL_AMFLAGS =3D -I m4 \
> +-                  -I gflags/m4
> ++ACLOCAL_AMFLAGS =3D -I m4 -I gflags/m4
> +=20
> + # This is so we can #include <google/vcencoder.h> or <gtest/gtest.h> =
=20
> +AM_CPPFLAGS =3D -I$(top_srcdir)/src \
> +--
> +1.8.5.4
> +
> diff --git a/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb b/m=
eta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb
> new file mode 100644
> index 0000000..c6af25d
> --- /dev/null
> +++ b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "An encoder/decoder for the VCDIFF (RFC3284) format"
> +DESCRIPTION =3D "A library with a simple API is included, as well as a \
> +               command-line executable that can apply the encoder and \
> +               decoder to source, target, and delta files. \
> +               A slight variation from the draft standard is defined \
> +               to allow chunk-by-chunk decoding when only a partial \
> +               delta file window is available."
> +HOMEPAGE =3D "http://code.google.com/p/open-vcdiff/"
> +SECTION =3D "console/utils"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db2c8309843bc5297cfb4dc84f43f3=
ccc"
> +
> +SRC_URI =3D "http://open-vcdiff.googlecode.com/files/${BPN}-${PV}.tar.gz=
 \
> +           file://aclocal-amflags-fix.patch"
> +SRC_URI[md5sum] =3D "5f848e4916b407879f55e0ca74c3f6af"
> +SRC_URI[sha256sum] =3D "b7e47db78866082e9e8b5782f5491092c8414f0acc0440ae=
a03b14c7d1d3c371"
> +
> +inherit autotools
> --
> 1.8.5.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/k2pzXB1sdSS/P9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTw3MACgkQN1Ujt2V2gBxuYwCfcMgX98/Euiz6rZevWXlYrMwr
rPUAoIhEk6yC1Q9Zk7m7qSrqsDHN9RC3
=WMdU
-----END PGP SIGNATURE-----

--W/k2pzXB1sdSS/P9--
