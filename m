Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 724CA6E5F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 13:16:56 +0000 (UTC)
Received: by wgjx7 with SMTP id x7so36537811wgj.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2015 06:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nftMvUCVebwGDfce+LKgaG97aLFHNcV9/zsaSmpx7uQ=;
	b=X9K6eveGajPn0fl/U8YqD5zJb/PAn5Gh+5TWM/ECRgtwNlZQn/2BwQDC34Yiywmx2K
	fIgYBK6XscFHepfpNdOC5RKJVKtvAJ8Sua3YyGnYYc/I/GaXoxcQ55ncSdg0LBZjCmWr
	brR55ivhZp3KPAjfoQb3J+U9S05Qo01R0Qh7QBp645Vk/IBIL0Zv/PrLaINotcNv0MJO
	VqMv1IvOJD4FrudlSaLtRJAEGzX2EKCjuv5FWeWKHSgQyi6wdTnNj+Jljji3bsHFk+NH
	7/FLkOvbHo2/Pj/D25H4OSoOO7D7WEGheX+6geJ9kpwkA9vWOj3CmvOoa8bnNEUHHi+f
	GxWQ==
X-Received: by 10.194.88.69 with SMTP id be5mr1673199wjb.149.1435756616300;
	Wed, 01 Jul 2015 06:16:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ho10sm2887485wjb.39.2015.07.01.06.16.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 06:16:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Jul 2015 15:17:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150701131718.GG2409@jama>
References: <1435735750-26252-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1435735750-26252-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] quazip: new recipe
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
X-List-Received-Date: Wed, 01 Jul 2015 13:16:57 -0000
X-Groupsio-MsgNum: 56110
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r4QXMf6/kyF/FvJJ"
Content-Disposition: inline

--r4QXMf6/kyF/FvJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2015 at 05:29:10PM +1000, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  recipes-qt/quazip/quazip_0.7.1.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 recipes-qt/quazip/quazip_0.7.1.bb
>=20
> diff --git a/recipes-qt/quazip/quazip_0.7.1.bb b/recipes-qt/quazip/quazip=
_0.7.1.bb
> new file mode 100644
> index 0000000..97a6e4f
> --- /dev/null
> +++ b/recipes-qt/quazip/quazip_0.7.1.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Qt/C++ wrapper for ZIP/UNZIP package"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D27818cd7fd83877a8e3ef82b82798=
ef4"
> +DEPENDS =3D "qtbase"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"

${BPN}-${PV} -> ${BP}

> +SRC_URI[md5sum] =3D "3b99effb2a9417707d463e6f19cf2629"
> +SRC_URI[sha256sum] =3D "78c984103555c51e6f7ef52e3a2128e2beb9896871b2cc4d=
4dbd4d64bff132de"
> +
> +S =3D "${WORKDIR}/${BPN}-${PV}"

This looks like default ${BP}, can you drop it?

> +
> +inherit qmake5
> +
> +EXTRA_QMAKEVARS_PRE +=3D "PREFIX=3D${prefix}"
> +EXTRA_QMAKEVARS_POST +=3D "SUBDIRS=3D${BPN}"
> --=20
> 2.4.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--r4QXMf6/kyF/FvJJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWT6F0ACgkQN1Ujt2V2gBzYXwCdEJItE8vifAZujDctbHdda/jZ
6mMAnRMKWOtIflyQFwsVfyGdKlDB3XYB
=LQJx
-----END PGP SIGNATURE-----

--r4QXMf6/kyF/FvJJ--
