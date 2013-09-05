Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 82FC3615C4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 21:17:18 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so1193072eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 14:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zG5q1ryr245Ycco9QgXj3qiCxfMZECA//acMWUjSlhk=;
	b=plOBcQcsqGr9fckZhCCQVhKybGx5C2wK/QuWqoJFxXi7lJc+OUy/+EX0bwQx/jK4TL
	s7DHOxPe5GyMmBgy3MSAbN0q3fUk01kCYSIx1TKZO2k57KPlk30l0jQFpLaJCOSAzRFz
	UOpPGdPssYCu0GhS1ruBD1uB+YhQ/+YLsAjC4Ahny9AFNhpnCtlSUBdG7OuTvi2L4dq+
	/7EEmt78PxabmWiu+5QaBhRbLwAepjIJP03TNUlJZh1vdQeJsiXEVp9caHT/2t7ckuZ8
	0iw/u5MpZ8C698r50qYc50ieJgrmMfTy9HRhrYjqFkgH32dz22EIxU8vVkjw5MnUXnRs
	Vcog==
X-Received: by 10.14.183.2 with SMTP id p2mr16508008eem.44.1378415839471;
	Thu, 05 Sep 2013 14:17:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i1sm51939237eeg.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 14:17:18 -0700 (PDT)
Date: Thu, 5 Sep 2013 23:18:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130905211839.GM11500@jama>
References: <1378414975-13587-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1378414975-13587-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] inetutils: Remove empty usr/lib
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
X-List-Received-Date: Thu, 05 Sep 2013 21:17:19 -0000
X-Groupsio-MsgNum: 46112
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n1iI6MeELQa9IOaF"
Content-Disposition: inline

--n1iI6MeELQa9IOaF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2013 at 02:02:55PM -0700, Khem Raj wrote:
> This directory is empty and is flagged by QA checker
>=20
> ERROR: QA Issue: inetutils: Files/directories were installed but not
> shipped
>   /usr/lib
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9=
=2E1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> index 7c7343e..e371ae5 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> @@ -70,6 +70,8 @@ do_install_append () {
>      cp ${WORKDIR}/telnet.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/t=
elnet
>      cp ${WORKDIR}/tftpd.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/tf=
tpd
>      rm -rf ${D}${libexecdir}/
> +    # remove usr/lib if empty
> +    rmdir ${D}${libdir}

The comment suggests missing --ignore-fail-on-non-empty

>  }
> =20
>  PACKAGES =3D+ "${PN}-ping ${PN}-ping6 ${PN}-hostname ${PN}-ifconfig \
> --=20
> 1.8.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--n1iI6MeELQa9IOaF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIo9S8ACgkQN1Ujt2V2gByjhgCbBkD/GdQstBAoTWCue56by+dY
DzQAnjUcHQlDX53YlALFZQCoux1FlNcO
=A/dI
-----END PGP SIGNATURE-----

--n1iI6MeELQa9IOaF--
