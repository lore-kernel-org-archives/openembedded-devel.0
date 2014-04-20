Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0352765DA2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:15:26 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so2875022eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ivwyD5rNOyWQVp0OI3WQCsaSxkC1JQM81EyLzW7GgG8=;
	b=nRLvAoE0QcVeA9Uoh4dSwH7yteaTYitaz6wrYQk/XVZeaeL3fwAvTjHAXa5IsVsHZB
	xCAF7SKaGGLfNiCpv5TSr7GMyqCSwy9vesCiXIArX4H4Z6hXQwhglgmSyI5YK5Qk3zp2
	HGKkUu3ydHM7tBbieegH+Otu033YROiRm8utUdpTLoqgCWlgVRESD7wHM9bPsYkToQMm
	IAALRjwj3gUe9WCVO0HzJWO3Ou5rCVG8euKwxJ9qymi96eYB/iAwNFovFWwymAONvNZq
	esyCSHQ1CCl4R0K42buer5gB9zgWwl3SEHwY9c+kuJaWhtQG2SOhmxjgQKTek2wx0brt
	6DJA==
X-Received: by 10.14.251.204 with SMTP id b52mr37108537ees.36.1397985327164;
	Sun, 20 Apr 2014 02:15:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm92913678eeg.11.2014.04.20.02.15.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:15:26 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:15:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420091531.GV2486@jama>
References: <1397183102-31944-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397183102-31944-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH v2] dialog: update to version 1.1-20120706
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
X-List-Received-Date: Sun, 20 Apr 2014 09:15:34 -0000
X-Groupsio-MsgNum: 49303
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wfgmFf0LjPE7xkRl"
Content-Disposition: inline

--wfgmFf0LjPE7xkRl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2014 at 10:25:02AM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Changes:
> - add SUMMARY and HOMEPAGE
> - remove the use of INC_PR

Merged, thanks.

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  ...1-20111020.bb =3D> dialog-static_1.1-20120706.bb} |    5 ++---
>  meta-oe/recipes-extended/dialog/dialog.inc         |    4 ++--
>  ...alog_1.1-20111020.bb =3D> dialog_1.1-20120706.bb} |    5 ++---
>  3 files changed, 6 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-extended/dialog/{dialog-static_1.1-20111020.bb =
=3D> dialog-static_1.1-20120706.bb} (20%)
>  rename meta-oe/recipes-extended/dialog/{dialog_1.1-20111020.bb =3D> dial=
og_1.1-20120706.bb} (11%)
>=20
> diff --git a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.b=
b b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
> similarity index 20%
> rename from meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
> rename to meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
> index e21a914..595f323 100644
> --- a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
> +++ b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
> @@ -1,7 +1,6 @@
>  require dialog.inc
> -PR =3D "${INC_PR}.0"
> =20
>  LDFLAGS +=3D "-static"
> =20
> -SRC_URI[md5sum] =3D "15dd2ce9f537c0400f600d1a383aa0a3"
> -SRC_URI[sha256sum] =3D "746bf18b8414985864835b61536cee826ac916e6827fbcad=
9faffb496cae8a7a"
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
a-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
> similarity index 11%
> rename from meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
> rename to meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
> index 73079a1..c87fb61 100644
> --- a/meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
> +++ b/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
> @@ -1,5 +1,4 @@
>  require dialog.inc
> -PR =3D "${INC_PR}.0"
> =20
> -SRC_URI[md5sum] =3D "15dd2ce9f537c0400f600d1a383aa0a3"
> -SRC_URI[sha256sum] =3D "746bf18b8414985864835b61536cee826ac916e6827fbcad=
9faffb496cae8a7a"
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

--wfgmFf0LjPE7xkRl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTkDMACgkQN1Ujt2V2gBwIggCeIRCj9hcbWNKrmkdaZZelgddP
4gwAnjO+rgW1KEBaqBrhYBY1X0eSlsA4
=dm9m
-----END PGP SIGNATURE-----

--wfgmFf0LjPE7xkRl--
