Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 361A66AC82
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 14:49:01 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so1063080wgh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 06:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=w6PXfn3sUeLBbVtakgBTOi5llQ4DxXM4x1PD+jQ3kTI=;
	b=0mgVuziE8fGusklJESdiLXeOfaVVRxXhk6GCIz0xDbIZNXGMDaDimcky0joa/FHwY6
	pzc1U1NlBdBSIurgBQPgfaVWDtw9YHq31uHzCCUcLtXODC7VFpKRa5zgp34VmBD9hGNL
	NUCmzTmOZtFADMN1nV+pz6/HYOnraiUNnLIqhOvjSfSMIuCjzNXGx3jVyUt53c96+p13
	7S7ZsWOp3FHDw9rLdAzYF07U6LB4DqhK+PbuLrsNuRpMeFoiLdjWTquizvci5t5VxFEO
	ZJuo5H6A/ScM4C/Duf5C5Jpb51WlDNhL91TfUuod5sMq2uqeiylm4S7bc3LhbnY2B0hM
	+2zQ==
X-Received: by 10.194.78.82 with SMTP id z18mr29219069wjw.120.1416408541425;
	Wed, 19 Nov 2014 06:49:01 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j2sm2577535wjs.28.2014.11.19.06.49.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 06:49:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 15:49:01 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141119144901.GJ3315@jama>
References: <1415645193-14565-1-git-send-email-cmorgan@cybexintl.com>
MIME-Version: 1.0
In-Reply-To: <1415645193-14565-1-git-send-email-cmorgan@cybexintl.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Chris Morgan <cmorgan@cybexintl.com>
Subject: Re: [meta-oe][PATCH] dfu-util: Point to gitorious.org repository as gnumonks.org is down
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
X-List-Received-Date: Wed, 19 Nov 2014 14:49:09 -0000
X-Groupsio-MsgNum: 52935
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I/5syFLg1Ed7r+1G"
Content-Disposition: inline

--I/5syFLg1Ed7r+1G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2014 at 01:46:33PM -0500, Chris Morgan wrote:
> ---
>  meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb b/meta-oe/r=
ecipes-support/dfu-util/dfu-util_0.7.bb
> index aa2b84d..c706fd1 100644
> --- a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> +++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> @@ -4,7 +4,10 @@ AUTHOR =3D "Harald Welte <laforge@openmoko.org>"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> =20
> -SRC_URI =3D "http://${BPN}.gnumonks.org/releases/${BP}.tar.gz \
> +S =3D "${WORKDIR}/${BPN}-${BPN}"
> +
> +REV=3D"a0a3668e0571a9b007f7d62b01e7dcfd7754ce50"
> +SRC_URI =3D "https://gitorious.org/${BPN}/${BPN}/archive/${REV}.tar.gz \

Aren't archives on gitorious generated ad-hoc like on github (changing
SRC_URI checksums from time to time)?

Why not use git repo on gitorious?

>      file://0001-configure.ac-Don-t-check-for-usbpath.patch \
>  "
> =20
> @@ -12,5 +15,5 @@ inherit autotools pkgconfig
> =20
>  DEPENDS =3D "libusb1"
> =20
> -SRC_URI[md5sum] =3D "56844020177d4db4c1ea2e926fe9d588"
> -SRC_URI[sha256sum] =3D "f52a2a5489fbf9f3204a6ada05e0b47ee322e19d81c712e0=
c58a332d80ec3eab"
> +SRC_URI[md5sum] =3D "1de724551604bce1962960b7a301cc08"
> +SRC_URI[sha256sum] =3D "5d253f924fd29bc13054b664bba9aa86b865299971195969=
478253c1775b7e56"
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--I/5syFLg1Ed7r+1G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRsrd0ACgkQN1Ujt2V2gBwGZACeJsEYAKdo71a5finrHDt1PE0w
36YAoKewI0TUOLe1qxDAzA67B/RntXLT
=mNSO
-----END PGP SIGNATURE-----

--I/5syFLg1Ed7r+1G--
