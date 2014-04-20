Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id C024B65D8D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 14:14:52 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so3021439eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D5AfSoIoQtp60p8nueLU1lqyYSPgfR/x/5Xy7RBRQj8=;
	b=Ges6gc1BYwR3P/may0nCLLBEKijpQyPTjYMIrJurjl5bcL1ZZmjVjY+T5mxuP+XX8A
	zUVp0P+4EO71fI83nerI2oo3SAtH/1Gu55Iy/BhGJXmecC/jBik0T40kH6xUejQjETFl
	mD2ZiKRzcOnIJtrEjRX3GdjUC/osoDj4E0FBX0S7KDTbAdRtqAeu6UcVFLM5LHsLKzdU
	V0IpxKeMn0GEgjIkRS4N6/F90pZaLcqfT6lgxSbBh/bwvSNkMPmomhE/cTXVp+w/yBY2
	uEXhfRoMP6A6X1pC814WGqO0RWIxSs1p4WywPoPTIaKJMkT3VNAmvrCq+oM4CR2uTNyt
	i6zg==
X-Received: by 10.15.64.132 with SMTP id o4mr38905405eex.14.1398003293015;
	Sun, 20 Apr 2014 07:14:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm94945830eei.24.2014.04.20.07.14.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 07:14:51 -0700 (PDT)
Date: Sun, 20 Apr 2014 16:14:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Message-ID: <20140420141456.GQ2486@jama>
References: <1396977725-13411-1-git-send-email-fathi.boudra@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1396977725-13411-1-git-send-email-fathi.boudra@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] acpica: update to 20140325 release
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
X-List-Received-Date: Sun, 20 Apr 2014 14:14:54 -0000
X-Groupsio-MsgNum: 49354
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mu1Tvth33Vj8K2q"
Content-Disposition: inline

--5mu1Tvth33Vj8K2q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2014 at 08:22:05PM +0300, Fathi Boudra wrote:
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>

Merged, thanks!

> ---
>  .../acpica/{acpica_20140114.bb =3D> acpica_20140325.bb}                 =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/acpica/{acpica_20140114.bb =3D> acpica_2=
0140325.bb} (91%)
>=20
> diff --git a/meta-oe/recipes-extended/acpica/acpica_20140114.bb b/meta-oe=
/recipes-extended/acpica/acpica_20140325.bb
> similarity index 91%
> rename from meta-oe/recipes-extended/acpica/acpica_20140114.bb
> rename to meta-oe/recipes-extended/acpica/acpica_20140325.bb
> index 2bb7ad7..0210b04 100644
> --- a/meta-oe/recipes-extended/acpica/acpica_20140114.bb
> +++ b/meta-oe/recipes-extended/acpica/acpica_20140325.bb
> @@ -14,8 +14,8 @@ DEPENDS =3D "bison flex"
>  SRC_URI =3D "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.ta=
r.gz \
>      file://no-werror.patch \
>      "
> -SRC_URI[md5sum] =3D "fcd4b7304f1bfabc7d4b9cfdecc6b0c6"
> -SRC_URI[sha256sum] =3D "0d5bd32690ab77e21ab143ef25361c314a4ed13c33a5fb3d=
dd6f5559ab24ebc3"
> +SRC_URI[md5sum] =3D "08efe232bca06a7c54462695bbc2f87c"
> +SRC_URI[sha256sum] =3D "12a7a3c9f2d81e46b0c7095bb7c268ec4bf231178fcbe54f=
f0c30cd83d2ac38c"
> =20
>  S =3D "${WORKDIR}/acpica-unix2-${PV}"
> =20
> --=20
> 1.9.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5mu1Tvth33Vj8K2q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNT1mAACgkQN1Ujt2V2gByXwACfcQU0TgNJmgI/IGDYUew39LMM
zGoAn3Z3zwqdEF8Kj7gE754zzQzmMdcP
=SAWx
-----END PGP SIGNATURE-----

--5mu1Tvth33Vj8K2q--
