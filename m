Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id C8885718E9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 09:10:44 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w55so14081050wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 01:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MOYCTEhWp2ZPIJeadUSAmPHL+M9g9Pp+hdVSywyMzYY=;
	b=F9MHnWt36MvkLfVEV6HiGi4kf8L0yAmO5440xq4zhf+QZQWN2R/Wwy9nWm87frI6Qu
	hXubP3ECX2TtYHz8qqPrRw+qP6E/0qJCXuyXpdSdOgoVsKbIn1VQy+tPJr9xoUwX31eR
	Sx33pYOslqUJZAALrgNxSGR2lpHoFwqALt4UVQ4awVJpcF0v/iOcLqQqGJ8DpY+2Uamw
	dymKLyIZWueK7O2ojhlzgLNqxRLrtdCHt4xkxo8aZDU8ka9YqFhP3eL9nxmvZUlSYBC5
	LGo+B62zkWSEXgNHFnvH6bT7AUi1hCxoUxpP69aAf0o0J/7hl6TMFQ93IgNtEvuZvXBQ
	QQNA==
X-Received: by 10.180.21.206 with SMTP id x14mr4980674wie.64.1422436244649;
	Wed, 28 Jan 2015 01:10:44 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u18sm5166195wjq.42.2015.01.28.01.10.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 01:10:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 28 Jan 2015 10:10:45 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150128091045.GC2477@jama>
References: <1422254380-30419-1-git-send-email-Chong.Lu@windriver.com>
	<1422254380-30419-2-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1422254380-30419-2-git-send-email-Chong.Lu@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-webserver][PATCH 2/2] cherokee: Add a PACKAGECONFIG for cherokee
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
X-List-Received-Date: Wed, 28 Jan 2015 09:10:54 -0000
X-Groupsio-MsgNum: 54004
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
Content-Disposition: inline

--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2015 at 02:39:40PM +0800, Chong Lu wrote:
> This solves the following warning:
> WARNING: QA Issue: cherokee rdepends on geoip, but it isn't a build depen=
dency?
> [build-deps]

Duplicates:
[oe] [meta-webserver] [PATCH 5/5] cherokee: add PACKAGECONFIG for geoip
which has better subject, so I'll take that one.
>=20
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/m=
eta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> index 054858e..451e97c 100644
> --- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> +++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> @@ -22,6 +22,7 @@ inherit autotools pkgconfig binconfig update-rc.d syste=
md
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[ffmpeg] =3D "--with-ffmpeg,--without-ffmpeg,libav"
>  PACKAGECONFIG[ldap] =3D "--with-ldap,--without-ldap,openldap"
> +PACKAGECONFIG[geoip] =3D "--with-geoip,--without-geoip,geoip"
> =20
>  EXTRA_OECONF =3D "--disable-static \
>                  --disable-nls \
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

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTIp5UACgkQN1Ujt2V2gBz20QCgtqZMZwymP/VPiRE6bthZMAVz
yxIAn1y/FfedvkqCBxEecQjR4b6B2q0N
=cw4F
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--
