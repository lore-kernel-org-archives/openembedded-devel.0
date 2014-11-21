Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3418D6AC82
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 14:10:22 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ex7so12157337wid.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 06:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2arzrJrVYJsKcBYVTOWouDQiG/9yfzy15jAwPdzB/vw=;
	b=tOM6hBgNHtmtY3zd4hkpwKzgTIvAtKlIYmz+t56WmMWAzTvRQcD7+ao+wyVcsbOkJ/
	8iEvBdRIdcrmlw3wi5CxVpKrR9AJNRMjNIi/6rp7figuFGbzvvR8kV05Qk9vsmmxOEhh
	FOHqx362c6PudAMlXkqRz74qb/bzHtVGR7EdBogWgXgxGNRWrdYEl72Uusgb4eaemKT8
	dKXVz4/oZMWKXsGK+oJRyqHHWZPjmCJTuOswnvJnwiD8LOjIA4ZC+WimV+dTbOaX1m9z
	p6zEIrnn9ObGWDSs3q1A461aSz1wBYytXnxJpRpmeTG1aRKBWqL8jz9EVOkiNMJTj7R3
	cbaQ==
X-Received: by 10.194.249.70 with SMTP id ys6mr7671954wjc.61.1416579021652;
	Fri, 21 Nov 2014 06:10:21 -0800 (PST)
Received: from localhost ([89.176.104.3])
	by mx.google.com with ESMTPSA id fp9sm8923841wic.12.2014.11.21.06.10.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Nov 2014 06:10:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Nov 2014 15:10:17 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141121141017.GJ2163@jama>
References: <1416420840-2194-1-git-send-email-cmorgan@cybexintl.com>
MIME-Version: 1.0
In-Reply-To: <1416420840-2194-1-git-send-email-cmorgan@cybexintl.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Chris Morgan <cmorgan@cybexintl.com>
Subject: Re: [meta-oe]]PATCH] dfu-util: Switch from using a gitorious generated download to using the git repository to avoid potential checksum mismatches if the generated download changes
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
X-List-Received-Date: Fri, 21 Nov 2014 14:10:26 -0000
X-Groupsio-MsgNum: 52974
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="apbmkPN6Hu/1dI3g"
Content-Disposition: inline

--apbmkPN6Hu/1dI3g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2014 at 01:14:00PM -0500, Chris Morgan wrote:
> ---

Next time please include your SOB line.

>  meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb b/meta-oe/r=
ecipes-support/dfu-util/dfu-util_0.7.bb
> index c706fd1..7f06f8f 100644
> --- a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> +++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> @@ -4,12 +4,12 @@ AUTHOR =3D "Harald Welte <laforge@openmoko.org>"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> =20
> -S =3D "${WORKDIR}/${BPN}-${BPN}"
> +S =3D "${WORKDIR}/git"
> =20
> -REV=3D"a0a3668e0571a9b007f7d62b01e7dcfd7754ce50"
> -SRC_URI =3D "https://gitorious.org/${BPN}/${BPN}/archive/${REV}.tar.gz \
> +SRC_URI =3D "git://gitorious.org/dfu-util/dfu-util.git \
>      file://0001-configure.ac-Don-t-check-for-usbpath.patch \
>  "
> +SRCREV=3D"a0a3668e0571a9b007f7d62b01e7dcfd7754ce50"
> =20
>  inherit autotools pkgconfig
> =20
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

--apbmkPN6Hu/1dI3g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRvR8kACgkQN1Ujt2V2gBwedQCgi/71ln96NOoRnl9vuxuFQgX1
rNUAn0J/iiIqq74F0OZps7SjGm0Li0ed
=o06+
-----END PGP SIGNATURE-----

--apbmkPN6Hu/1dI3g--
