Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 143DE731FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 10:56:50 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b14so116960552wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2016 02:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nH4tPmGNIIA3cL46+j6xkQckd35+zuiOoKiqdOivtj4=;
	b=BXQtQ8X+syhmq5HyAUPHSadW5+pUPVHNr2ptWPAoMfupSxx75DbXghjcZtLznBsiCP
	62z4f8cgBVBR9YGTtGykBz6NVPfyS9LFSwEM6KxIHtw7IcuGLQ4K5M0tk8T5ECkxUIdI
	ZH63tM4O5YiZEV4Ftiz4VSvSB8xBrteQxdsAuGPX2eK0Tmtsfw9gzIhwMUJTywBSOpYO
	lV1INBnBlQSMldbJeV3Y0ac3HBnIEoAE50Ju1hKiUaeXGkjQ4aAYFf0tpWtdOFRx+UHs
	B1jiMGU/aibUmSllBToIXHBgMeFkRiOO8NQIElWPfJq3GGPiUqdFYgzzQeiv+mdNp6eZ
	acGQ==
X-Received: by 10.28.174.196 with SMTP id x187mr16619939wme.2.1452164211344;
	Thu, 07 Jan 2016 02:56:51 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id ka4sm856117wjc.47.2016.01.07.02.56.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 02:56:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Jan 2016 11:57:15 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160107105715.GB2512@jama>
References: <1452142924-881-1-git-send-email-daicy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1452142924-881-1-git-send-email-daicy.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
Subject: Re: [meta-networking][PATCH] opensaf: 4.6.0 -> 4.7.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jan 2016 10:56:52 -0000
X-Groupsio-MsgNum: 59396
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline

--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2016 at 09:02:04PM -0800, Dai Caiyun wrote:
> 1) Upgrade opensaf from 4.6.0 to 4.7.0.
> 2) Delete two patches,since they are not needed any more.
>    Revert_imma_client_node_replyPending_to_unsigned_char.patch
>    Fix_GCC_5.1.0_compiler_warning.patch
>=20
> Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
> ---
>  .../recipes-daemons/opensaf/{opensaf_4.6.0.bb =3D> opensaf_4.7.0.bb}  | =
6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>  rename meta-networking/recipes-daemons/opensaf/{opensaf_4.6.0.bb =3D> op=
ensaf_4.7.0.bb} (89%)
>=20
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb b/m=
eta-networking/recipes-daemons/opensaf/opensaf_4.7.0.bb
> similarity index 89%
> rename from meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
> rename to meta-networking/recipes-daemons/opensaf/opensaf_4.7.0.bb
> index 9084524..42e883a 100644
> --- a/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.7.0.bb
> @@ -16,12 +16,10 @@ inherit autotools useradd systemd pkgconfig
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
>             file://install-samples-from-srcdir.patch \
>             file://0001-plmcd-error-fix.patch \
> -           file://Revert_imma_client_node_replyPending_to_unsigned_char.=
patch \
> -           file://Fix_GCC_5.1.0_compiler_warning.patch \

Are these 2 patches used somewhere else? If not then delete them in the
same patch.

>             "
> =20
> -SRC_URI[md5sum] =3D "a1ceddb517c0972aa7e899b092d7f464"
> -SRC_URI[sha256sum] =3D "f6ea754a145ae42552f328f96c32f38429ad06478a351b9d=
0aed812adcecb2b4"
> +SRC_URI[md5sum] =3D "82dd2777a672140e22b8205f10aa55d3"
> +SRC_URI[sha256sum] =3D "da9e138650b835728ad51d99268d3a31419b254c4cb4e87c=
6ec90bc45266d7d2"
> =20
>  SECTION =3D "admin"
>  LICENSE =3D "LGPLv2.1"
> --=20
> 1.9.1
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaORIoACgkQN1Ujt2V2gBy6aQCff8yTdytB7RUGeZK5yZpaGkZs
v0kAoK+y5+lqmV40nFa5w9f4g5YPoivy
=tD8u
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
