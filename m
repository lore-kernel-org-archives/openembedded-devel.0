Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id D594B601F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 12:00:05 +0000 (UTC)
Received: by wicgb10 with SMTP id gb10so108823859wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OiLEOAVF+VhQQiZATQuyVm9Jnc4d/z3zAZDbi5E/GgU=;
	b=FFCVO315THJL5rup7ZeJ+TXCg1eLwz2qorXJXfW/zPLpWNfKqOCQjTIMnYZ/OePrJi
	qpw09gAJTo/3nrkFp/B2IxBkk+uY1S8v2jbW6aBG/WYSd+xivRLbfMELy563GUJbLHyg
	tth4ntnJ9nAcOL26HeEFQJWiCtSwZzkGAtq01hFa7r3qoNSBd0C9oKngSC9x7DzDt1fn
	HQzr4A8ouqhiXvHtzMF+X5JHTRFzUyRj4nYIIBQE4eau2k2OgGufRUncHpQQoq5nBmFS
	KxlP4o/MHxM4+rLfHTDK9xAVwE6+3hgcvI2Z338tB5CsNuLYSrwaEaHGTU6JlVE0kWG6
	yOrg==
X-Received: by 10.194.238.193 with SMTP id vm1mr53423139wjc.57.1437998405472; 
	Mon, 27 Jul 2015 05:00:05 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gt10sm13265395wib.20.2015.07.27.05.00.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 05:00:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Jul 2015 14:00:09 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150727120009.GA2442@jama>
References: <1437591250-9247-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1437591250-9247-1-git-send-email-jslater@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH 1/1] ypbind-mt: add dependency but keep as broken
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
X-List-Received-Date: Mon, 27 Jul 2015 12:00:06 -0000
X-Groupsio-MsgNum: 56389
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2015 at 11:54:10AM -0700, Joe Slater wrote:
> We will need the conditional dependency on systemd.  It is

> not a good idea to use PNBLACKLIST in a recipe, and the

Why?

> version here does not suppress lib32-ypbind-mt.
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  recipes-support/nis/ypbind-mt_2.2.bb |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/meta-=
networking/recipes-support/nis/ypbind-mt_2.2.bb
> index 4f8bf48..359b020 100644
> --- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> +++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> @@ -15,10 +15,12 @@ of known secure NIS server (/etc/yp.conf) Binds to \
>  the server which answered as first. \
>  "
>  HOMEPAGE =3D "http://www.linux-nis.org/nis/ypbind-mt/index.html"
> -DEPENDS =3D "yp-tools"
> +DEPENDS =3D "yp-tools ${@base_contains('DISTRO_FEATURES', 'systemd', 'sy=
stemd', '', d)}"
>  PROVIDES +=3D "ypbind"
> =20
> -PNBLACKLIST[ypbind-mt] ?=3D "BROKEN: Depends on broken yp-tools"
> +python () {
> +    raise bb.parse.SkipPackage("BROKEN: Depends on broken yp-tools")
> +}
> =20
>  SRC_URI =3D "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
>             file://ypbind-yocto.init \
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

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW2HUgACgkQN1Ujt2V2gBwSoQCeK/msbR2uXenuvJc2ntlDOvfL
ThYAniD2nN0bKB171uiOd9NOnlZnUmzM
=XLp0
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
