Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id EBDCD736B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 07:07:09 +0000 (UTC)
Received: by wixo5 with SMTP id o5so2551646wix.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 00:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=buUT5JJR4AUpneE2zktWYszTgbMeOwqF8nAlN0gnbY0=;
	b=Zjw8DwtvK1tJb7nZNAXReIbrWEjKBwXeK39YTaWos/7n0nMDDhEY4bOuJk6tkN83TN
	AyIiikFtDXFRiogH6CuIe3pdO3VqFOhXNzYd3d10EwbseG3r/p4SqaxEvvrO7Ij2OhZA
	gpGqu/2gY2I17RujUZbJCotqHPhK5eLJMoVcuwZQnKDGLJ2ZK4M8hbMVL30fJQ69r9BY
	F2ZHWBcWz+H8Lw/m9/KJ87Eq1COXqY4lemagEMr6oaOSdgFRK1HR5+XaPR7boJbokbpL
	fvrv4He3+UqB88pjLSewewiIkNpizYhavPDYzV7DXMHXieHtlbWtM4UogTz0o/s4l6Qr
	a2rQ==
X-Received: by 10.180.218.162 with SMTP id ph2mr2774062wic.22.1427785629891;
	Tue, 31 Mar 2015 00:07:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o10sm19543727wiy.18.2015.03.31.00.07.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Mar 2015 00:07:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 31 Mar 2015 09:07:31 +0200
To: "Gary S. Robertson" <gary.robertson@linaro.org>
Message-ID: <20150331070731.GI14928@jama>
References: <1413992945-33655-1-git-send-email-mike.holmes@linaro.org>
	<1427775041-9330-1-git-send-email-gary.robertson@linaro.org>
	<1427775041-9330-2-git-send-email-gary.robertson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1427775041-9330-2-git-send-email-gary.robertson@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] add CUnit test suite
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
X-List-Received-Date: Tue, 31 Mar 2015 07:07:11 -0000
X-Groupsio-MsgNum: 54912
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aFi3jz1oiPowsTUB"
Content-Disposition: inline

--aFi3jz1oiPowsTUB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2015 at 11:10:41PM -0500, Gary S. Robertson wrote:
> From: Mike Holmes <mike.holmes@linaro.org>
>=20
> This patch adds a recipe for building the CUnit test framework libraries
>=20
> Upstream Status - not applicable - recipe addition only

Upstream-Status belongs to .patch files not metadata commit messages.

>=20
> Signed-off-by: Mike Holmes <mike.holmes@linaro.org>
> Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> ---
>  meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb      | 19 ++++++++++++
>  .../cunit/files/fixup-install-docdir.patch         | 36 ++++++++++++++++=
++++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
>  create mode 100644 meta-oe/recipes-devtools/cunit/files/fixup-install-do=
cdir.patch
>=20
> diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb b/meta-oe/reci=
pes-devtools/cunit/cunit_2.1-3.bb
> new file mode 100644
> index 0000000..246a121
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "CUnit is a C framework for unit testing. Test output su=
pports comandline and GUI results reporting"
> +HOMEPAGE =3D "http://cunit.sourceforge.net"
> +LICENSE =3D "LGPL-2.0"
> +SECTION =3D "libs"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7734aa853b85d6f935466f081490d=
dbb"
> +
> +S =3D "${WORKDIR}/CUnit-${PV}"
> +
> +SRC_URI =3D "http://downloads.sourceforge.net/project/cunit/CUnit/${PV}/=
CUnit-${PV}.tar.bz2 \
> +		file://fixup-install-docdir.patch;patch=3D1"

Use 4 spaces for indentation and ";patch=3D1" shouldn't be needed, drop
it.

Use SOURCEFORGE_MIRROR =3D "http://downloads.sourceforge.net" variable.

> +SRC_URI[md5sum] =3D "b5f1a9f6093869c070c6e4a9450cc10c"
> +SRC_URI[sha256sum] =3D "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249=
a464efa49a40f214"
> +
> +inherit autotools-brokensep
> +
> +EXTRA_OECONF =3D "--enable-memtrace --enable-automated --enable-basic --=
enable-console"
> +
> +FILES_${PN}-dev +=3D "${datadir}/CUnit"
> +FILES_${PN}-doc +=3D "${docdir}"
> diff --git a/meta-oe/recipes-devtools/cunit/files/fixup-install-docdir.pa=
tch b/meta-oe/recipes-devtools/cunit/files/fixup-install-docdir.patch
> new file mode 100644
> index 0000000..a9dc4bc
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/cunit/files/fixup-install-docdir.patch
> @@ -0,0 +1,36 @@
> +From: "Mike Holmes" <mike.holmes@linaro.org>
> +Date: Thu, 30 October 2014 16:21:03 -0500
> +Subject: [PATCH] fixup-install-docdir
> +
> +The default configuration macros for CUnit install the documentation and
> +header files in locations not consistent with the OE filesystem layout.
> +This patch specifies new locations which are consistent with OE filesyst=
ems.
> +
> +Upstream Status - not applicable - customizes configs for OE build envir=
onment

See:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Head=
er_Recommendations
for proper format

> +
> +Signed-off-by: Mike Holmes <mike.holmes@linaro.org>
> +Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> +---
> +
> +diff -uNr a/doc/headers/Makefile.am b/doc/headers/Makefile.am
> +--- a/doc/headers/Makefile.am	2014-10-30 22:06:29.704574162 +0100
> ++++ b/doc/headers/Makefile.am	2014-10-30 22:07:43.578524791 +0100
> +@@ -1,6 +1,6 @@
> + ## Process this file with automake to produce Makefile.in
> +=20
> +-dochdrdir =3D $(prefix)/doc/@PACKAGE@/headers
> ++dochdrdir =3D $(docdir)/headers
> +=20
> + INCLUDE_FILES =3D \
> + 	Automated.h \
> +diff -uNr a/doc/Makefile.am b/doc/Makefile.am
> +--- a/doc/Makefile.am	2014-10-30 22:06:29.704574162 +0100
> ++++ b/doc/Makefile.am	2014-10-30 22:07:01.461412166 +0100
> +@@ -1,7 +1,5 @@
> + ## Process this file with automake to produce Makefile.in
> +=20
> +-docdir =3D $(prefix)/doc/@PACKAGE@
> +-
> + doc_DATA =3D \
> + 	CUnit_doc.css \
> + 	error_handling.html \
> --=20
> 1.9.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aFi3jz1oiPowsTUB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUaR7MACgkQN1Ujt2V2gBwvTACfaArYRK/XKAeHiyTtTdvX92Le
MqkAnRoPDAtynkKdhV/GrNph1snRTud6
=5qiy
-----END PGP SIGNATURE-----

--aFi3jz1oiPowsTUB--
