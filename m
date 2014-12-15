Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6172465E38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 09:08:21 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so8274749wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 01:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tiwbkEBdrdInaDI5g5f6jfSX4xXKcZ56+RXq/lpOjkI=;
	b=nWtLzwDQkePFQQ7OP1y+V9MlitO96ZYF9Vuz/jpA7W5Kin0oVjPOa6xuRTDUeuWe84
	5S6dEQcuBDvyKvlYVJZ+fMIC3NjRNt3aBPKsCLyFdaM+NK8dWPDBzHa2JubfCtg7etGF
	In6GNWlKFNvatbkaYzyMfl2ZvVwsbsMS2Sc08wxAvE/0zHJK0gJruSpP3ZNlamxJxTzd
	Dy42xct6mxunqjHXwR9dSAIhWU4onZzgIs/+jYaySuyRm0ryr+azaIJvFsvU5j+Hudr3
	dI1KGsyw2kG7tv5+E8yasoxLEFBfGmijFCzLR5hm2Of5VBRXrNdkulj/QsvkUWWUCPIh
	+sPQ==
X-Received: by 10.194.109.201 with SMTP id hu9mr49867413wjb.45.1418634501847; 
	Mon, 15 Dec 2014 01:08:21 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ud1sm12243108wjc.7.2014.12.15.01.08.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Dec 2014 01:08:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 15 Dec 2014 10:08:20 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141215090820.GB2463@jama>
References: <1418632957-21443-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1418632957-21443-1-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] dfu-util: Change the SRCURI to gitorious
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
X-List-Received-Date: Mon, 15 Dec 2014 09:08:23 -0000
X-Groupsio-MsgNum: 53319
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Content-Disposition: inline

--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2014 at 04:42:37PM +0800, Qian Lei wrote:
> Official website is not available, using git instead.

Commit like this was merged couple weeks ago:

commit edaa1130b6e7b2f55965e119e042f1311e43e6c8
Author:     Chris Morgan <chmorgan@gmail.com>
AuthorDate: Mon Nov 10 13:46:33 2014 -0500
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Mon Nov 24 11:59:48 2014 +0100

    dfu-util: Point to gitorious.org repository as gnumonks.org is down

> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb b/meta-oe/r=
ecipes-support/dfu-util/dfu-util_0.7.bb
> index aa2b84d..65ad10b 100644
> --- a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> +++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> @@ -1,16 +1,14 @@
>  DESCRIPTION =3D "USB Device Firmware Upgrade utility"
> -SECTION =3D "devel"
>  AUTHOR =3D "Harald Welte <laforge@openmoko.org>"
> +SECTION =3D "devel"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +DEPENDS =3D "libusb1"
> =20
> -SRC_URI =3D "http://${BPN}.gnumonks.org/releases/${BP}.tar.gz \
> -    file://0001-configure.ac-Don-t-check-for-usbpath.patch \
> -"
> +SRC_URI =3D "git://gitorious.org/dfu-util/dfu-util.git \
> +           file://0001-configure.ac-Don-t-check-for-usbpath.patch"
> +SRCREV =3D "4e312c5567a84f76654295c267ec35f71727fe5a"
> =20
> -inherit autotools pkgconfig
> +S =3D "${WORKDIR}/git"
> =20
> -DEPENDS =3D "libusb1"
> -
> -SRC_URI[md5sum] =3D "56844020177d4db4c1ea2e926fe9d588"
> -SRC_URI[sha256sum] =3D "f52a2a5489fbf9f3204a6ada05e0b47ee322e19d81c712e0=
c58a332d80ec3eab"
> +inherit autotools pkgconfig
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSOpQQACgkQN1Ujt2V2gBx2twCdH+0gN6KGdtoodzvungNON+Fw
AtQAnj024bN8JUy1m7+RojwgvhNg0eas
=Nv5W
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
