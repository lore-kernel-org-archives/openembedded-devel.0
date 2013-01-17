Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tvp8u-0003Rc-DR
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 14:04:33 +0100
Received: by mail-pb0-f50.google.com with SMTP id wz7so1386041pbc.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2013 04:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wqFMg8KZPAERP+YOvJtk7YMmiMh46dru9mPx0ITGqB0=;
	b=VfbVglIGJsyxZ6M/B5Px75DaQaShZwnYvgw+G0U5LQr9UFFADNy/91fAlf2UrcV46M
	gele/nuTdwj3hPFTZPd6qLdW9ZWxzL53Qu9NhFexW51LYiTz+FGCyL97mDmfgc8R4J9X
	1DHdZvXvvf6wG854KRP1rHNkDRFlQv4Z7DwjPMh6CS2UdAWP2AnoGRhzMrSEXth+r50Z
	eEAFYVqu9Rxoa7H86Rh7LDFP3KfNSoVqI0AqXAvKBOjBeD7bM3P3TIc2ehWKvCaCwzx+
	VB8/wHDYOF4eykOFrVXbzS5jtuVk/WiRT72eTJEbD2TS5Jn0In4zPM9EYNaNsZJ4cfsq
	vwVQ==
X-Received: by 10.68.228.102 with SMTP id sh6mr13219358pbc.91.1358426944716;
	Thu, 17 Jan 2013 04:49:04 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id oj1sm1037065pbb.19.2013.01.17.04.49.02
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 04:49:03 -0800 (PST)
Date: Thu, 17 Jan 2013 13:48:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130117124858.GF3067@jama>
References: <1358377712-18666-1-git-send-email-colin.foeparker@aclimalabs.com>
MIME-Version: 1.0
In-Reply-To: <1358377712-18666-1-git-send-email-colin.foeparker@aclimalabs.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] META-OE: DENZIL Branch: SSVB-CPUBURN-A8: MD5SUM and SHA256SUM don't match source.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 13:04:43 -0000
X-Groupsio-MsgNum: 42725
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Mjqg7Yu+0hL22rav"
Content-Disposition: inline

--Mjqg7Yu+0hL22rav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2013 at 03:08:30PM -0800, Colin Foe-Parker wrote:
> Updated the md5sum and sha256sum for the ssvb-cpuburn-a8.S file

Please read README how commit subject should look like.

Or just see other examples.

Change to denzil needs to be in master/danny first (if it isn't already)

Change of checksum should be explained in commit message and also
include diff between old and new version.

Cheers,
=20
> Signed-off-by: Colin Foe-Parker <colin.foeparker@aclimalabs.com>
> ---
>  meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb b/meta-oe/=
recipes-benchmark/cpuburn/cpuburn-neon.bb
> index bb9ca1c..68833e6 100644
> --- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb
> +++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb
> @@ -13,8 +13,8 @@ SRC_URI =3D "http://hardwarebug.org/files/burn.S;name=
=3Dmru \
>             http://github.com/downloads/ssvb/ssvb.github.com/ssvb-cpuburn=
-a8.S;name=3Dssvb"
>  SRC_URI[mru.md5sum] =3D "823abc72c2cd448e87df9bc5355a4456"
>  SRC_URI[mru.sha256sum] =3D "01d9fc04f83740c513c25401dcc89c11b2a5a6013e70=
bfca42b7b02129f88cd2"
> -SRC_URI[ssvb.md5sum] =3D "f1af41dcd56e4f0f7e92b67109dc01ed"
> -SRC_URI[ssvb.sha256sum] =3D "95e2267a684be0d848dd6f935e769fa3ed810274eba=
cddc3fe8ddac4b34838c2"
> +SRC_URI[ssvb.md5sum] =3D "0acc570d943c41c7f8602b9ff6fa111d"
> +SRC_URI[ssvb.sha256sum] =3D "bfddd3226a499ffdf71bb58c05ccdc6dac5bb2c2c3b=
db10ac610ee0b60aac087"
> =20
>  S =3D "${WORKDIR}"
> =20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Mjqg7Yu+0hL22rav
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD38zoACgkQN1Ujt2V2gBwLAACfSWEUdUalYkNKzarBnprbyFVp
bqEAoIsdfI7ONdUrhwI3QWKng0fwZjgy
=SGsB
-----END PGP SIGNATURE-----

--Mjqg7Yu+0hL22rav--
