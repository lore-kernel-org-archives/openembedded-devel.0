Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id C720965DA2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:17:43 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so2881144eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m1COgxruHIxe4jKG84LTxh+1w5YRKC1Y/7YJPl+fEDw=;
	b=D2rBCaVUpz/De1Ki5lKoiNlnZgYU1KgkvIRWXHALiHVx1kqKtdMEHwqStEoxvtISnd
	Ae35Ze5txUTPGoKudeXjwU4XcGrNRfL3r7f+iLpkNNXltnALo6p8OPm57ATcBtgz0Nog
	PsZ3W23ZDKpUBpuRz6a0bhjnw24uY21euFsakFs+IxCpevypWCk1bd+hW0z2Sui+KIF2
	L2yZatwdTJhOwN1N/q/Iq4Vc7Tx7dZ936wTPtLZ1v3q6dmkKedZ5XikRPMLZulPR9jaL
	LNpVzi9za10CyCZuXHTAgMe9W8LpXMWkGeZGsrhjF7LrnEGymZTFawcRDH+q/384+spb
	9OFg==
X-Received: by 10.14.224.6 with SMTP id w6mr37625118eep.60.1397985463993;
	Sun, 20 Apr 2014 02:17:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l42sm92931411eew.19.2014.04.20.02.17.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:17:43 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:17:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420091748.GY2486@jama>
References: <1397203184-24356-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397203184-24356-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libestr: use BP instead of P to fix multilib builds
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
X-List-Received-Date: Sun, 20 Apr 2014 09:17:44 -0000
X-Groupsio-MsgNum: 49306
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HSHpc5A+GJc9BHcd"
Content-Disposition: inline

--HSHpc5A+GJc9BHcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2014 at 03:59:44PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>

Merged, thanks.

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-support/libestr/libestr_0.1.6.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/libestr/libestr_0.1.6.bb b/meta-oe/r=
ecipes-support/libestr/libestr_0.1.6.bb
> index ae29856..e3f675a 100644
> --- a/meta-oe/recipes-support/libestr/libestr_0.1.6.bb
> +++ b/meta-oe/recipes-support/libestr/libestr_0.1.6.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://libestr.adiscon.com/"
>  LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9d6c993486c18262afba4ca5bcb89=
4d0"
> =20
> -SRC_URI =3D "http://libestr.adiscon.com/files/download/${P}.tar.gz"
> +SRC_URI =3D "http://libestr.adiscon.com/files/download/${BP}.tar.gz"
> =20
>  SRC_URI[md5sum] =3D "f48a7098080eebfe7842673c23dcd064"
>  SRC_URI[sha256sum] =3D "b9c819d30397845fdf85bb1f37c52e81de23aa3b061ec6cc=
4386f1b942960153"
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

--HSHpc5A+GJc9BHcd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTkLwACgkQN1Ujt2V2gBx3JACfa6tvAxSqdaKWUyEnSim1sFyQ
RYYAoKTho77Y3V2PlLOII9CFoKsnXD9F
=+5AN
-----END PGP SIGNATURE-----

--HSHpc5A+GJc9BHcd--
