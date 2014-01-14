Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id E9C736A566
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:21:19 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d49so71166eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 01:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EKUYBBHFT8knSNexxFKPWtl5AJsdrXkKZqSZSwMdH64=;
	b=xiTVeNska7nXCLceqg5K6pUz0JibEm+pdADcIyTy9/4N9t1LsDmmbzNNuK2GWxsB1G
	FDopf1Ua9aNjCYnjHuNKYzfEbnWR0kj9dLbFvSYyTA+sUOvocZ8mF05nGwd+7EEZxQkS
	7bebGlcKN4SHzoJLBmIdh6qrtKJ1DC0+xHQymJEL+Aiegf07LSk9BR/nT7/Uf+mowWEI
	D6E/vy15+DwfHJl263kNbsrkYAlnJ+XY5n0oOmC+DQJA6BhJo/98ZSdEC+j57tNwWMcw
	gem5x3+G9kUF1QRBKynB6P0wh1fu3Nt2APTW2i3YmU+hvWA8B7O2Vs+rMcse2yTSM4U0
	DUZA==
X-Received: by 10.14.32.132 with SMTP id o4mr831592eea.14.1389691280092;
	Tue, 14 Jan 2014 01:21:20 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m1sm46868391eeg.0.2014.01.14.01.21.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 01:21:19 -0800 (PST)
Date: Tue, 14 Jan 2014 10:21:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: b28495@freescale.com
Message-ID: <20140114092139.GO16995@jama>
References: <1389690610-4230-1-git-send-email-b28495@freescale.com>
	<1389690610-4230-2-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1389690610-4230-2-git-send-email-b28495@freescale.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] inetutils: not hard coded libreadline path
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
X-List-Received-Date: Tue, 14 Jan 2014 09:21:21 -0000
X-Groupsio-MsgNum: 47719
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A7FgPGrDEcSmmdo/"
Content-Disposition: inline

--A7FgPGrDEcSmmdo/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2014 at 05:10:10PM +0800, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>=20
> Avoid below QA issues:
> | ERROR: QA Issue: package inetutils-ftp contains bad RPATH
> | ERROR: QA Issue: package inetutils-telnet contains bad RPATH
> | ERROR: QA Issue: package inetutils-telnetd contains bad RPATH
> | ERROR: QA run found fatal errors. Please consider fixing them.
> | ERROR: Function failed: do_package_qa

Doesn't it autodetect libreadline?

> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  .../inetutils/inetutils_1.9.1.bb                   |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9=
=2E1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> index 97fc6a1..03b8e65 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> @@ -37,7 +37,6 @@ PACKAGECONFIG[uucpd] =3D "--enable-uucpd,--disable-uucp=
d,readline"
> =20
>  EXTRA_OECONF =3D "--with-ncurses-include-dir=3D${STAGING_INCDIR} \
>          ${noipv6} \
> -        --with-libreadline-prefix=3D${STAGING_DIR_HOST}${prefix} \
>  "
> =20
>  do_configure_prepend () {
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--A7FgPGrDEcSmmdo/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLVAaMACgkQN1Ujt2V2gBwnMQCdGrpuzK7jQM0RCoWJXaN5AGBb
9jsAoK8IL2EHr5oVMVIcUrGRIv3xa1mn
=jqL8
-----END PGP SIGNATURE-----

--A7FgPGrDEcSmmdo/--
