Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D79D97198D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 22:32:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 15:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="110177691"
Received: from ttorling-mac01.jf.intel.com ([10.24.14.216])
	by orsmga002.jf.intel.com with ESMTP; 11 Jul 2017 15:32:07 -0700
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <1499791478-2407-2-git-send-email-liu.ming50@gmail.com>
Date: Tue, 11 Jul 2017 15:32:06 -0700
Message-Id: <C483BBAB-ADAB-4944-8339-192A9A934C65@linux.intel.com>
References: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
	<1499791478-2407-2-git-send-email-liu.ming50@gmail.com>
To: liu.ming50@gmail.com
X-Mailer: Apple Mail (2.3273)
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-perl] [PATCH 1/8] libsombok3: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jul 2017 22:32:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Jul 11, 2017, at 9:44 AM, liu.ming50@gmail.com wrote:
>=20
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>=20
> Sombok - Unicode Text Segmentation Package.
>=20
> It's being depended by libunicode-linebreak-perl.
>=20
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
> ...01-configure.ac-fix-cross-compiling-issue.patch | 31 =
++++++++++++++++++++++
> .../libsombok3/libsombok3_2.4.0.bb                 | 25 =
+++++++++++++++++
> 2 files changed, 56 insertions(+)
> create mode 100644 =
meta-oe/recipes-devtools/libsombok3/libsombok3/0001-configure.ac-fix-cross=
-compiling-issue.patch
> create mode 100644 =
meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb

This is not following Debian naming, it should be =
libsombok3-perl_2.4.0.bb

>=20
> diff --git =
a/meta-oe/recipes-devtools/libsombok3/libsombok3/0001-configure.ac-fix-cro=
ss-compiling-issue.patch =
b/meta-oe/recipes-devtools/libsombok3/libsombok3/0001-configure.ac-fix-cro=
ss-compiling-issue.patch
> new file mode 100644
> index 0000000..1a69287
> --- /dev/null
> +++ =
b/meta-oe/recipes-devtools/libsombok3/libsombok3/0001-configure.ac-fix-cro=
ss-compiling-issue.patch
> @@ -0,0 +1,31 @@
> +=46rom 9c2ffe825e28d63e2a771135f297e8ffac0dbe81 Mon Sep 17 00:00:00 =
2001
> +From: Ming Liu <liu.ming50@gmail.com>
> +Date: Tue, 11 Jul 2017 14:35:30 +0200
> +Subject: [PATCH] configure.ac: fix cross-compiling issue
> +
> +Avoid checking for file existence when cross compiling.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> +---
> + configure.ac | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 9978852..06b16e3 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -120,9 +120,6 @@ AC_ARG_WITH(unicode-version,
> +   AC_HELP_STRING(--with-unicode-version=3DVERSION,
> +   [version of Unicode Standard @<:@default=3Dcurrent version@:>@]),
> +   UNICODE_VERSION=3D$withval,UNICODE_VERSION=3D$DEFAULT_UNICODE_VERSIO=
N)
> +-AC_CHECK_FILE([lib/$UNICODE_VERSION.c],
> +-  AC_MSG_RESULT($UNICODE_VERSION),
> +-  AC_MSG_ERROR(Unknown Unicode version $UNICODE_VERSION.))
> + AC_SUBST(UNICODE_VERSION)
> +=20
> + # check if code to debug memory allocation is enabled.
> +--=20
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb =
b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
> new file mode 100644
> index 0000000..b83e86a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb

> @@ -0,0 +1,25 @@
> +SUMMARY =3D "Sombok - Unicode Text Segmentation Package."
> +DESCRIPTION =3D "Sombok library package performs Line Breaking =
Algorithm described in \
> +Unicode Standard Annex #14 (UAX #14).  East_Asian_Width informative \
> +properties defined by Annex #11 (UAX #11) may be concerned to =
determin \
> +breaking positions.  This package also implements "default" Grapheme =
\
> +Cluster segmentation described in Annex #29 (UAX #29)."
> +LICENSE =3D "Artistic-1.0 | GPLv1+"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D5b122a36d0f6dc55279a0ebc69f3c60b"
> +
> +SRC_URI =3D "git://github.com/hatukanezumi/sombok.git;protocol=3Dhttps =
\
> +           file://0001-configure.ac-fix-cross-compiling-issue.patch \
> +          "
> +
> +inherit autotools pkgconfig
> +
> +# sombok-2.4.0
> +SRCREV =3D "0098d85a037ef5c99a648a3669a077781a45e8cc"
> +
> +S =3D "${WORKDIR}/git"
> +B =3D "${S}"
> +
> +# Disable libthai support
> +EXTRA_OECONF =3D "--disable-libthai"
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


