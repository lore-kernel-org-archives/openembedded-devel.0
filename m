Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C833371A73
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 08:56:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c85so10371554wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 00:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=MdqizmZcMDyU/awq0rrwflp/4S5bP8wOe3muG/IFe6E=;
	b=XGJA2wTHjNo6ZLiKRLSAFs90RtXmwAFKKJSg60ONcZNX7o7FOZpPJvk1OiiswjmXkk
	TGC6PvhahLRQ/0WxYg1CgYXPtAEWmbfXZJrgmDoAR2aHToSFpC58SX67FTas+8QqbMoy
	V1owGtSXcm5ELgbQwNwl6SuiTGsoaKSdlhi9BPogbR6k0Lxa4Py9nafAS7TjdrY5LgDE
	r6MbhBVKdKtcyFz+UOa+a3ZCfqZ1cleHajvQuT9v6cooYR7JSjJ3Y9tTUJ7th2nd5MUc
	FtCDwVGd3M/UTTNQP/WDEMpzkXzqg1p0lp05u0e/0GcxJciMd/Dsf8scRH6gq2uLMUgq
	Yt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=MdqizmZcMDyU/awq0rrwflp/4S5bP8wOe3muG/IFe6E=;
	b=HhEnWUWLtCy3c8DqVSZjZExbFmDBJOJGpvd0jvM4L3nxy5oJIs1RvIcCrIq8WnBVFA
	6Nq9J/RJBEDBPmSUZTVBCf/6E8518fpN9IgZOFBcZfzEutj52ym/fAzwhPcAFdlc4C2/
	PxNzMG/lY6/0oMtAQQbKcBimbFKeqAJzB+2jjLV5nn/CrFQ3r7Hb/pHMnsYWE0e5aPHc
	EVYjNcw5Q3SxK5xz2s4owFPk5idekbAU1Dg5aOCy+VHahIz/Tcn4+MJncUZd3KA8URzw
	cwZsKErR1iMK97Qyw+VtTMdIZ6B4pioRjd34vTxCApyNd2qcyw7qLmyWjQB5z0luNi4z
	LC0g==
X-Gm-Message-State: AIkVDXLJ+T7mLRtti1EPwNya+GfSiC2jTBmrQqJUQ9tl2GGKaqq3fWxc+dFEMFmQMlbtmQ==
X-Received: by 10.223.171.65 with SMTP id r1mr6351424wrc.38.1484816214088;
	Thu, 19 Jan 2017 00:56:54 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u78sm51759052wma.11.2017.01.19.00.56.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jan 2017 00:56:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jan 2017 09:56:55 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170119085655.GB3265@jama>
References: <1484778400-11041-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1484778400-11041-1-git-send-email-jslater@windriver.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH 1/1] gnulib: derive PV from SRCPV
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
X-List-Received-Date: Thu, 19 Jan 2017 08:56:56 -0000
X-Groupsio-MsgNum: 64787
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline

--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2017 at 02:26:40PM -0800, Joe Slater wrote:
> Currently, PV is "git" and contains no version information.
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta-oe/recipes-support/gnulib/gnulib_git.bb |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/gnulib/gnulib_git.bb b/meta-oe/recip=
es-support/gnulib/gnulib_git.bb
> index 5b2ed49..96f0893 100644
> --- a/meta-oe/recipes-support/gnulib/gnulib_git.bb
> +++ b/meta-oe/recipes-support/gnulib/gnulib_git.bb
> @@ -12,8 +12,10 @@ LICENSE =3D "LGPLv2+"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4cf3810f33a067ea7ccd2cd889fe=
d21"
>  SRCREV =3D "b6b3ed1fa4c6de12908a9f01d1689f156c3cd441"
> +PV =3D "git+${SRCPV}"

As with cppzmq, I've changed this

PV =3D "0.1.496+git${SRCPV}

based on:
OE @ ~/projects/gnulib $ ./gnulib-tool --version
gnulib-tool (GNU gnulib 2015-07-01 10:30:57) 0.1.496-b6b3e
Copyright (C) 2017 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.htm=
l>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Someone should also fix the LICENSE variable

>  SRC_URI =3D "git://git.sv.gnu.org/gnulib;protocol=3Dgit \
>  "
> +
>  S =3D "${WORKDIR}/git"
> =20
>  do_install () {
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

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIB/VQAKCRA3VSO3ZXaA
HMSPAKCXWoE2Qd22oWzsV00TlyfZLdZkeACghQxQPqVy/f2MRuFYYvX+Iw89FKk=
=3Jqt
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
