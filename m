Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 795376B4F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 10:29:10 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c41so758428eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ARZgf/1RW/Q45S/BZGJp+L+Wy8kJCVw6BMaR5vNHTrw=;
	b=WKyTVh73ig6ztPHTwNPfhTZHwMEfJo7RAPdq35NXYCQCaQMYeRJ3FdUA6/2UwUEpPk
	mrwUl1IEt6eEVZFr+1kqwX4ICY1sSc/sUMpG1bK3tXaKYv2rP6JaA8JUKaUwSuQBeQM7
	wTqsAnOVcnjX8PNNERm7gSuWPsWx8OxIN4h9As4mRcJ4CiP/eGprowGij5ueuc4eUBsR
	gsCv6vUCt46rKpCmIWDqTl/2rkdCJMLfOVQntGMsGna5JflY4eJgOvwXsEs1sGnhX5kY
	lFT2iregYgU7ucyA2fwjxxxVQCxO8y+5o0IlxuCce+n/VWbf1zJLY4x8QdoYW+CQDvTz
	7aIQ==
X-Received: by 10.14.3.1 with SMTP id 1mr1858789eeg.94.1389781748846;
	Wed, 15 Jan 2014 02:29:08 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id w4sm9058614eef.20.2014.01.15.02.29.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 02:29:08 -0800 (PST)
Date: Wed, 15 Jan 2014 11:29:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140115102929.GG3717@jama>
References: <1389771373-5181-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1389771373-5181-1-git-send-email-b28495@freescale.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH v2] inetutils: fix libreadline path to fix QA errors
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
X-List-Received-Date: Wed, 15 Jan 2014 10:29:10 -0000
X-Groupsio-MsgNum: 47734
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3xoW37o/FfUZJwQG"
Content-Disposition: inline

--3xoW37o/FfUZJwQG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2014 at 01:36:13AM -0600, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>=20
> If wrong path set, inetutils configure script will add a absolute
> rpath, which result in the below QA errors:
> | ERROR: QA Issue: package inetutils-ftp contains bad RPATH
> | ERROR: QA Issue: package inetutils-telnet contains bad RPATH
> | ERROR: QA Issue: package inetutils-telnetd contains bad RPATH
> | ERROR: QA run found fatal errors. Please consider fixing them.
> | ERROR: Function failed: do_package_qa
>=20
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  .../inetutils/inetutils_1.9.1.bb                   |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9=
=2E1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> index 97fc6a1..80022c7 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> @@ -37,7 +37,7 @@ PACKAGECONFIG[uucpd] =3D "--enable-uucpd,--disable-uucp=
d,readline"
> =20
>  EXTRA_OECONF =3D "--with-ncurses-include-dir=3D${STAGING_INCDIR} \
>          ${noipv6} \
> -        --with-libreadline-prefix=3D${STAGING_DIR_HOST}${prefix} \
> +        --with-libreadline-prefix=3D${STAGING_LIBDIR} \

Can you confirm that libreadline support is still enabled after this change?

>  "
> =20
>  do_configure_prepend () {
> --=20
> 1.7.9.7
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3xoW37o/FfUZJwQG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLWYwkACgkQN1Ujt2V2gBxgOQCfZjc0H2e0JI5e5YAGyP6hklD6
o9AAnRLGGhUIfbGL/nWqK6vIZKxsB3zR
=PAX2
-----END PGP SIGNATURE-----

--3xoW37o/FfUZJwQG--
