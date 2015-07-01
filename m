Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3593C60017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 13:11:43 +0000 (UTC)
Received: by wgqq4 with SMTP id q4so36480091wgq.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2015 06:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=drsPlPEvM1UCUmW2/el352pZTKrRJ0G03Ac7Vu7kuEk=;
	b=UvCu4x21jfhlpQc3J+og6rKGHme2eTurapJS0YXC4ejPrt/bm21X3w46EE69KrU1qB
	q7XoCXp0EVqPZZn3uKfCdm6Ksb7VVlHMvbLn0U3Da/1EykLUUB4HmZ14eI3visnuNJLw
	nEA0h0by2JaBP3SkjdDwerHbVD1gSoRJo0JK/8N+zhyKnm4Aiyi2N1l3BS28ps+pVmyU
	KgWkztUCvRhStSuFxCcb6mizAPsLoMJGNOlYpZPta7xDLqEr8mHyhhsgY/loTag/vtYK
	GgZzanQXU+UirbDFpjyn3Za3YQGdka7O7y+N/+YLOu9QFskht1zw6v3KGDMZ+zYYfBea
	YN1w==
X-Received: by 10.180.86.73 with SMTP id n9mr43180889wiz.78.1435756302515;
	Wed, 01 Jul 2015 06:11:42 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ma15sm22024132wic.20.2015.07.01.06.11.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 06:11:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Jul 2015 15:12:04 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150701131204.GC2409@jama>
References: <1435732236-22986-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1435732236-22986-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] hidapi: new recipe
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
X-List-Received-Date: Wed, 01 Jul 2015 13:11:45 -0000
X-Groupsio-MsgNum: 56106
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Content-Disposition: inline

--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2015 at 04:30:36PM +1000, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta-oe/recipes-support/hidapi/hidapi_git.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-support/hidapi/hidapi_git.bb
>=20
> diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recip=
es-support/hidapi/hidapi_git.bb
> new file mode 100644
> index 0000000..1f5e9fd
> --- /dev/null
> +++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Multi-platform library to interface with USB and Bluetooth =
HID-Class devices"
> +AUTHOR =3D "Alan Ott"
> +HOMEPAGE =3D "http://www.signal11.us/oss/hidapi/"
> +SECTION =3D "libs"
> +LICENSE =3D "BSD-3-Clause | GPLv3"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D7c3949a631240cb6c31c50f3e=
b696077"
> +DEPENDS =3D "libusb udev"
> +PV =3D "0.8.0-rc1+git${SRCPV}"
> +
> +SRCREV =3D "d17db57b9d4354752e0af42f5f33007a42ef2906"
> +SRC_URI =3D "git://github.com/signal11/hidapi.git;protocol=3Dgit"

protocol=3Dgit is default, you can drop it.

> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
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

--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWT5yMACgkQN1Ujt2V2gBwhdwCeMmJnEHHOypB35CtiMTh0AiDc
7bUAniX4MWdgFzKYEkeB6SjU4R9Y+QU5
=TjDT
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--
