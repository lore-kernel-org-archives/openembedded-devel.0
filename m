Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q77M0-0002TA-8m
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 16:35:36 +0200
Received: by bwz5 with SMTP id 5so355906bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 07:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=tZ/1hB3qtacrdKcIfCHrGM3q8oGYwBwfxx7dhxQQ7z0=;
	b=PICotZkgV8VC0RwCfwxxb7uaYNCmzMtMKR04peetNHjVJBrtLM8gGjyTYy+dgzj+33
	FlOJHQuzhV/Ga6RTzgbaYcQR0VfxjMxiqJRINlqS0OpmUz7VRlP9xotuSXGqNUStUNN6
	7K6j3KlaCTtLPHCut0xOwM5WmalLOsNi7vX+0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NeigPkaR+8hifQw+b+oDoA1h36j1V/wh2DOvDPObz9Go72lec31hf+Qjr2QlBgXdsY
	jijLSyZWxXolDjlWmptqRYnBTGRAnXcRrT3/cSXeld4kDg/cHgxqvovtVazSVY+ACaWs
	UIRoI1IQtre6AuOl4/dK4vOkGFX3OfH01QyhU=
Received: by 10.204.128.85 with SMTP id j21mr1024645bks.89.1302014010341;
	Tue, 05 Apr 2011 07:33:30 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q18sm3797072bka.3.2011.04.05.07.33.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 07:33:27 -0700 (PDT)
Date: Tue, 5 Apr 2011 16:33:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110405143320.GE30816@jama.jama.net>
References: <1301967081-14512-1-git-send-email-robert@erafx.com>
MIME-Version: 1.0
In-Reply-To: <1301967081-14512-1-git-send-email-robert@erafx.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] tzcode-native: update to 2011e
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
X-List-Received-Date: Tue, 05 Apr 2011 14:35:36 -0000
X-Groupsio-MsgNum: 30937
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q8BnQc91gJZX4vDc"
Content-Disposition: inline

--Q8BnQc91gJZX4vDc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 04, 2011 at 09:31:20PM -0400, Bob Foerster wrote:
> Signed-off-by: Bob Foerster <robert@erafx.com>
> ---
>  ...code-native_2011d.bb =3D> tzcode-native_2011e.bb} |   11 ++++++-----
>  1 files changed, 6 insertions(+), 5 deletions(-)
>  rename recipes/tzcode/{tzcode-native_2011d.bb =3D> tzcode-native_2011e.b=
b} (51%)

Hi,

Can you please add LICENSE and LIC_FILES_CHKSUM fields? The same for tzdata.

Something like this:
OE nokia900@shr ~/shr-core $ grep LIC
openembedded-core/meta/recipes-extended/tzdata/tzdata_2010o.bb
LICENSE =3D "PD"
LIC_FILES_CHKSUM =3D "file://asia;beginline=3D2;endline=3D3;md5=3D06468c0e8=
4ef4d4c97045a4a29b08234"
OE nokia900@shr ~/shr-core $ grep LIC
openembedded-core/meta/recipes-extended/tzcode/tzcode-native_2009r.bb
LICENSE =3D "Public Domain"
LIC_FILES_CHKSUM =3D "file://${WORKDIR}/README;md5=3D3ae8198f82258417ce2906=
6d3b034035"

Thanks,

> diff --git a/recipes/tzcode/tzcode-native_2011d.bb b/recipes/tzcode/tzcod=
e-native_2011e.bb
> similarity index 51%
> rename from recipes/tzcode/tzcode-native_2011d.bb
> rename to recipes/tzcode/tzcode-native_2011e.bb
> index 1cc7757..39b172b 100644
> --- a/recipes/tzcode/tzcode-native_2011d.bb
> +++ b/recipes/tzcode/tzcode-native_2011e.bb
> @@ -6,11 +6,12 @@ require tzcode-native.inc
>  # Also, tzdata (and it is needed to build tzcode) version can differ from
>  # tzcode version, thus this variable
> =20
> -TZDATA_PV =3D "2011d"
> +TZDATA_PV =3D "2011e"
> =20
>  PR =3D "${INC_PR}.0"
> =20
> -SRC_URI[tzcode-2011d.md5sum] =3D "95095242ee368e6a7e107f154590ac11"
> -SRC_URI[tzcode-2011d.sha256sum] =3D "68f2c07471c5390199c09fe9fee6a22f8a4=
dac24713af88b92da17b33ad98cc7"
> -SRC_URI[tzdata-2011d.md5sum] =3D "03c5793502b7c41985edd73146bf7e36"
> -SRC_URI[tzdata-2011d.sha256sum] =3D "415a54774094e8dcdc9ba141fafbee4b3b2=
f2140a5b8cf012eea4b37fb9a23bd"
> +SRC_URI[tzcode-2011e.md5sum] =3D "fbfc05dbf9ebcfe7c4bba18549870173"
> +SRC_URI[tzcode-2011e.sha256sum] =3D "8fb00f8763aa51d83d6f3190d144124bb71=
76ca829fc08823d6205297bf0426b"
> +SRC_URI[tzdata-2011e.md5sum] =3D "044a07072300a0ee72b046e5a9a4ec90"
> +SRC_URI[tzdata-2011e.sha256sum] =3D "44fef01de4589a4979eb6b5fdbbfd21a3b1=
35852af1ecbfb9e0368ae47392c79"
> +
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Q8BnQc91gJZX4vDc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2bKDAACgkQN1Ujt2V2gBwPjgCfYyEca9y4Pl/EDNUH0tUoQYtM
Y00AoJU4pLpRDKEFBcTVqFDFSwEHmWlg
=CrhF
-----END PGP SIGNATURE-----

--Q8BnQc91gJZX4vDc--
