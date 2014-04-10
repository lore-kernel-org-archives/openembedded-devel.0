Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4468A65E53
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 08:30:17 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2730175eei.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 01:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DqIzcI9FBoy1uRbIaPPwWliNZ/rwwq+2rAEeHtn4ih4=;
	b=z7xM2b6b1JwT0WU+hqeczox5yI+NJf/g7WoN6dTAjH2GBOp9Tmx6/8xr8liDSMFd/j
	2Ko0EXLh3/x1aa2CUhBbVYUWD/Pr+oiQp0gFwN9MWe8u9EyYS899B/XIfASAB26HsjR+
	NEtjEcsq8fIYSHXHptPdDcqwBRobelqEdABH5uKqoDlxNV07JpuiQeA7zeZiHi+j24BC
	PKJbER8flYQDbxQx1c61fmeATZ0e1lPPnaQGgSCIHySWJSnIvG8iKtpBSbIJWdcWB8E9
	y6R2j1y/RltV8bVybNaBC2rnfm6PZFHJ4wZ/cB+xkrIOjVziuU0fAjQQjetc8ZZ4xmpa
	4c/w==
X-Received: by 10.15.73.134 with SMTP id h6mr19155911eey.3.1397118617770;
	Thu, 10 Apr 2014 01:30:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm8224263eeg.11.2014.04.10.01.30.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Apr 2014 01:30:11 -0700 (PDT)
Date: Thu, 10 Apr 2014 10:30:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140410083020.GN2132@jama>
References: <1396945948-5006-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1396945948-5006-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] dialog: update to version 1.1-20120706
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
X-List-Received-Date: Thu, 10 Apr 2014 08:30:20 -0000
X-Groupsio-MsgNum: 49154
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nljfjKcp9HDtPSOP"
Content-Disposition: inline

--nljfjKcp9HDtPSOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2014 at 04:32:28PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Changes:
> - add SUMMARY and HOMEPAGE
> - remove the use of PRINC

There is no PRINC, did you mean INC_PR?

> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../dialog/dialog-static_1.1-20111020.bb           |    7 -------
>  .../dialog/dialog-static_1.1-20120706.bb           |    6 ++++++
>  meta-oe/recipes-extended/dialog/dialog.inc         |    4 ++--
>  .../recipes-extended/dialog/dialog_1.1-20111020.bb |    5 -----
>  .../recipes-extended/dialog/dialog_1.1-20120706.bb |    4 ++++
>  5 files changed, 12 insertions(+), 14 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/dialog/dialog-static_1.1-201=
11020.bb
>  create mode 100644 meta-oe/recipes-extended/dialog/dialog-static_1.1-201=
20706.bb
>  delete mode 100644 meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
>  create mode 100644 meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
>=20
> diff --git a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.b=
b b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
> deleted file mode 100644
> index e21a914..0000000
> --- a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require dialog.inc
> -PR =3D "${INC_PR}.0"
> -
> -LDFLAGS +=3D "-static"
> -
> -SRC_URI[md5sum] =3D "15dd2ce9f537c0400f600d1a383aa0a3"
> -SRC_URI[sha256sum] =3D "746bf18b8414985864835b61536cee826ac916e6827fbcad=
9faffb496cae8a7a"
> diff --git a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.b=
b b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
> new file mode 100644
> index 0000000..595f323
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
> @@ -0,0 +1,6 @@
> +require dialog.inc
> +
> +LDFLAGS +=3D "-static"
> +
> +SRC_URI[md5sum] =3D "2e538305977178eb085a9859511c299d"
> +SRC_URI[sha256sum] =3D "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b44=
d079cb87cf0ce2f5"
> diff --git a/meta-oe/recipes-extended/dialog/dialog.inc b/meta-oe/recipes=
-extended/dialog/dialog.inc
> index 27e4e60..c1c28fd 100644
> --- a/meta-oe/recipes-extended/dialog/dialog.inc
> +++ b/meta-oe/recipes-extended/dialog/dialog.inc
> @@ -1,13 +1,13 @@
> +SUMMARY =3D "display dialog boxes from shell scripts"
>  DESCRIPTION =3D "Dialog lets you to present a variety of questions \
>  or display messages using dialog boxes from a shell \
>  script (or any scripting language)."
> +HOMEPAGE =3D "http://invisible-island.net/dialog/"
>  SECTION =3D "console/utils"
>  DEPENDS =3D "ncurses"
>  LICENSE =3D "LGPL-2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343"
> =20
> -INC_PR =3D "r0"
> -
>  SRC_URI =3D "ftp://invisible-island.net/dialog/dialog-${PV}.tgz"
> =20
>  # hardcoded here for use in dialog-static recipe
> diff --git a/meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb b/met=
a-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
> deleted file mode 100644
> index 73079a1..0000000
> --- a/meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require dialog.inc
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[md5sum] =3D "15dd2ce9f537c0400f600d1a383aa0a3"
> -SRC_URI[sha256sum] =3D "746bf18b8414985864835b61536cee826ac916e6827fbcad=
9faffb496cae8a7a"
> diff --git a/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb b/met=
a-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
> new file mode 100644
> index 0000000..c87fb61
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
> @@ -0,0 +1,4 @@
> +require dialog.inc
> +
> +SRC_URI[md5sum] =3D "2e538305977178eb085a9859511c299d"
> +SRC_URI[sha256sum] =3D "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b44=
d079cb87cf0ce2f5"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nljfjKcp9HDtPSOP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNGVpwACgkQN1Ujt2V2gBzhNACfWW7kM5yCQg6snw4M5zmTaZGl
A0gAnRGEqg801ow/G+UAAFJkTqS5jurs
=pqk5
-----END PGP SIGNATURE-----

--nljfjKcp9HDtPSOP--
