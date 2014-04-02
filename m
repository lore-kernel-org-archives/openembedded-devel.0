Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5FCB86B269
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 12:50:03 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u56so162055wes.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Apr 2014 05:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=09kDXR3almd3SMdGpl2frLioxLsiGWT8KBvrbUpGsBE=;
	b=jIoDiQtpu+MltJvbGGkx1VhgN4Q+SH48EbIGO35DZ6O2dkz+f5NXePfsrGfDVV70T5
	ikdZvmpBJPWhhS8lAQ+yVm4K6Lx35Xxr3VsS3aD4QkPle0CdCK1yDZb02lSmjrSAcjZm
	r6Gok25NBWSTBKKwBngEX/0ZOcJMytzXKiBOmU/m85le4Tt5fwlPEB+FI1uI4Exbs3hH
	4x8nHvgm4xNYSZn25QNZZw5h87v249c6Af97AdzQGbOXKqwoGH78XUvtyuOmpezRmHer
	jcfmWhUOxinXm2Z8tJQRw1q71pEyxN0STrPNE8c3bhAT468e4RK8O7ICy8OWxzI3OiFw
	Qcnw==
X-Received: by 10.180.20.71 with SMTP id l7mr1717694wie.35.1396443004375;
	Wed, 02 Apr 2014 05:50:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o7sm4332502eew.25.2014.04.02.05.50.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Apr 2014 05:50:03 -0700 (PDT)
Date: Wed, 2 Apr 2014 14:50:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140402125004.GB2132@jama>
References: <1396410465-13709-1-git-send-email-stephen.arnold42@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1396410465-13709-1-git-send-email-stephen.arnold42@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH v2 1/2] gd: added upstream license file and fixed configure warnings
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
X-List-Received-Date: Wed, 02 Apr 2014 12:50:09 -0000
X-Groupsio-MsgNum: 49033
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline

--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 01, 2014 at 08:47:44PM -0700, Stephen Arnold wrote:
> This fixes QA warnings about missing license file and stale configure opt=
ions,
> (includes updates for freetype libpath and disables hardcoded rpaths).

It shows couple of trailing whitespaces in license text, but if they are
also in the original source of it, then we should probably keep them.

Please confirm.

> Upstream-Status: Inappropriate (distribution/packaging fix)
>=20
> Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
> ---
>  meta-oe/licenses/GD                               | 53 +++++++++++++++++=
++++++
>  meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb |  4 +-
>  2 files changed, 55 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/licenses/GD
>=20
> diff --git a/meta-oe/licenses/GD b/meta-oe/licenses/GD
> new file mode 100644
> index 0000000..5e17d03
> --- /dev/null
> +++ b/meta-oe/licenses/GD
> @@ -0,0 +1,53 @@
> +=20
> +     Portions copyright 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001,
> +     2002 by Cold Spring Harbor Laboratory. Funded under Grant
> +     P41-RR02188 by the National Institutes of Health.=20
> +
> +     Portions copyright 1996, 1997, 1998, 1999, 2000, 2001, 2002 by
> +     Boutell.Com, Inc.=20
> +
> +     Portions relating to GD2 format copyright 1999, 2000, 2001, 2002
> +     Philip Warner.
> +    =20
> +     Portions relating to PNG copyright 1999, 2000, 2001, 2002 Greg
> +     Roelofs.=20
> +
> +     Portions relating to gdttf.c copyright 1999, 2000, 2001, 2002 John =
=20
> +     Ellson (ellson@lucent.com).
> +  =20
> +     Portions relating to gdft.c copyright 2001, 2002 John Ellson =20
> +     (ellson@lucent.com). =20
> +
> +     Portions copyright 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007
> +		 Pierre-Alain Joye (pierre@libgd.org). =20
> +
> +     Portions relating to JPEG and to color quantization copyright 2000,
> +     2001, 2002, Doug Becker and copyright (C) 1994, 1995, 1996, 1997,
> +     1998, 1999, 2000, 2001, 2002, Thomas G. Lane. This software is
> +     based in part on the work of the Independent JPEG Group. See the
> +     file README-JPEG.TXT for more information.
> +
> +     Portions relating to WBMP copyright 2000, 2001, 2002 Maurice
> +     Szmurlo and Johan Van den Brande.
> +
> +     Permission has been granted to copy, distribute and modify gd in
> +     any context without fee, including a commercial application,
> +     provided that this notice is present in user-accessible supporting
> +     documentation.
> +
> +     This does not affect your ownership of the derived work itself, and=
=20
> +     the intent is to assure proper credit for the authors of gd, not to
> +     interfere with your productive use of gd. If you have questions,
> +     ask. "Derived works" includes all programs that utilize the  =20
> +     library. Credit must be given in user-accessible documentation.
> +
> +     This software is provided "AS IS." The copyright holders disclaim =
=20
> +     all warranties, either express or implied, including but not
> +     limited to implied warranties of merchantability and fitness for a
> +     particular purpose, with respect to this code and accompanying =20
> +     documentation.
> +
> +     Although their code does not appear in gd, the authors wish to thank
> +     David Koblas, David Rowley, and Hutchison Avenue Software Corporati=
on
> +     for their prior contributions.
> +
> diff --git a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb b/meta-oe/=
recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
> index 957c4eb..5fb5857 100644
> --- a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
> +++ b/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
> @@ -15,10 +15,10 @@ S =3D "${WORKDIR}/gd-2.0.36RC1"
> =20
>  inherit autotools binconfig gettext
> =20
> -EXTRA_OECONF +=3D " --with-zlib=3D${STAGING_LIBDIR}/.. \
> +EXTRA_OECONF +=3D " --disable-rpath \
>                    --with-png=3D${STAGING_LIBDIR}/.. \
>                    --with-jpeg=3D${STAGING_LIBDIR}/.. \
> -                  --with-freetype \
> +                  --with-freetype=3D${STAGING_LIBDIR}/.. \
>                    --without-fontconfig \
>                    --without-xpm \
>                    --without-x"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM8B3wACgkQN1Ujt2V2gBwqrgCgiJFAjf5bT/Df6r7hQzyBvIgM
+jUAoJgVRSF70b22M7VXgrUwvv1/13Nr
=x8wS
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
