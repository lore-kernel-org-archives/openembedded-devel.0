Return-Path: <joe@deserted.net>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 796F470538
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 03:47:14 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id at20so6123084iec.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 20:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=rgf/FthCsqidHepefRwKGutJqwUqbmk7fgBsh3i80No=;
	b=GiSWgQ512DV25bQmlP7Cv882hqUnLwW4Ypnu/Vyf4ntB1chrWTLf+KA2RmNFItPzsF
	umbWhAc0rP5P+b1DpRc3VRWRp+yzwKRYao/Iqm0CLxvlWHh4tP4n5R7KiuEqIvHtaDpA
	imrc72f/RJftxXkg22D9WNCICASEjv9l9eAE2zvUrAnlQ0EkTb2sjvHZkTnySAobUPRa
	W7rDKyewRTW2fSRoFyKL+Nzispu6/J6q/EkVZxFjWA1WEkOb3MDdZVyOXaGI4iv3c+3Q
	Z/ldw5milz4/AOETuwDLLN57mBpTFfkaZalgJIGNVCOHFqBWE0a6jH2Cbu//OLiKASVZ
	kLVg==
X-Gm-Message-State: ALoCoQlZCeISeigrymCWu8fmUZYeUJp1y0COPjY5P70trPLPhespXIlNrKJvXlqAyobvyI6kAVT6
X-Received: by 10.42.80.208 with SMTP id w16mr8964082ick.83.1405914436090;
	Sun, 20 Jul 2014 20:47:16 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id d2sm3035385igl.6.2014.07.20.20.47.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 20:47:15 -0700 (PDT)
Received: by skynet (Postfix, from userid 1000)
	id A069B1685E3; Sun, 20 Jul 2014 23:47:14 -0400 (EDT)
Date: Sun, 20 Jul 2014 23:47:14 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140721034713.GB11616@deserted.net>
References: <1404805877-7423-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1404805877-7423-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] tnftp: add tnftp recipes file
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
X-List-Received-Date: Mon, 21 Jul 2014 03:47:19 -0000
X-Groupsio-MsgNum: 51135
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline

--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks Roy.

-J.

[[oe] [meta-networking][PATCH] tnftp: add tnftp recipes file] On 14.07.08 (=
Tue 15:51) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../tnftp/tnftp/tnftp-autotools.patch              |   42 ++++++++++++++=
++++++
>  .../recipes-support/tnftp/tnftp_20130505.bb        |   33 +++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 meta-networking/recipes-support/tnftp/tnftp/tnftp-aut=
otools.patch
>  create mode 100644 meta-networking/recipes-support/tnftp/tnftp_20130505.=
bb
>=20
> diff --git a/meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.=
patch b/meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.patch
> new file mode 100644
> index 0000000..1bda576
> --- /dev/null
> +++ b/meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.patch
> @@ -0,0 +1,42 @@
> +[PATCH] Update configure.ac and Makefile.am to resolve warnings/errors
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + configure.ac          |    2 ++
> + libnetbsd/Makefile.am |    2 +-
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index a96d2ab..b3b3069 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -71,9 +71,11 @@ AH_TEMPLATE([WITH_SSL],
> + #
> + # Checks for programs.
> + #
> ++AM_PROG_AR()
> + AC_PROG_CC()
> + AC_PROG_AWK()
> + AC_PROG_LIBTOOL()
> ++AM_PROG_CC_C_O()
> +=20
> + #
> + # Checks for tool features.
> +diff --git a/libnetbsd/Makefile.am b/libnetbsd/Makefile.am
> +index 3e5c3ce..39bb12d 100644
> +--- a/libnetbsd/Makefile.am
> ++++ b/libnetbsd/Makefile.am
> +@@ -5,7 +5,7 @@ noinst_LTLIBRARIES =3D libnetbsd.la
> + libnetbsd_la_SOURCES =3D
> +=20
> +=20
> +-CPPFLAGS =3D \
> ++AM_CPPFLAGS =3D \
> + 	-I$(srcdir) \
> + 	-I$(top_srcdir) \
> + 	-I$(top_builddir)
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-networking/recipes-support/tnftp/tnftp_20130505.bb b/me=
ta-networking/recipes-support/tnftp/tnftp_20130505.bb
> new file mode 100644
> index 0000000..80690c5
> --- /dev/null
> +++ b/meta-networking/recipes-support/tnftp/tnftp_20130505.bb
> @@ -0,0 +1,33 @@
> +SUMMARY =3D "Enhanced NetBSD ftp client"
> +DESCRIPTION =3D "tnftp (formerly known as lukemftp) is a port of the Net=
BSD FTP client \
> +to other systems. It offers many enhancements over the traditional \
> +BSD FTP client, including command-line editing, command-line fetches \
> +of FTP and HTTP URLs (including via proxies), command-line uploads of \
> +FTP URLs, context-sensitive word completion, dynamic progress bar, \
> +IPv6 support, modification time preservation, paging of local and \
> +remote files, passive mode support (with fallback to active mode), \
> +SOCKS support, TIS FWTK gate-ftp server support, and transfer rate \
> +throttling."
> +
> +SECTION =3D "console/network"
> +LICENSE =3D "BSD-4-Clause"
> +
> +DEPENDS =3D "ncurses"
> +
> +SRC_URI =3D "ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/${BPN}-${PV}.tar=
=2Egz \
> +	   file://tnftp-autotools.patch \
> +	  "
> +
> +inherit autotools update-alternatives
> +
> +ALTERNATIVE_PRIORITY =3D "100"
> +
> +ALTERNATIVE_${PN} =3D "ftp"
> +ALTERNATIVE_LINK_NAME_${PN} =3D "${bindir}/ftp"
> +ALTERNATIVE_TARGET_${PN}  =3D "${bindir}/tnftp"
> +
> +FILES_${PN} =3D "${bindir}/tnftp"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6d6796cb166a9bb050958241dad94=
79e"
> +SRC_URI[md5sum] =3D "66e218d02ec7d9fc39ab70ba2900305a"
> +SRC_URI[sha256sum] =3D "6f650e25f6fd51538f677b789b49379f367ae9f1dee74c94=
cfe24d92abc2cffb"
> --=20
> 1.7.10.4
>=20
--=20
-Joe MacDonald.
:wq

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlPMjUEACgkQwFvcllog0XyYEQCguc5aXD6jsPfagsH/OGrnsJMu
8b0An1GA5BT2aE7SdXuUaQ3nkITD2uaW
=H4lb
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
