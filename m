Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE8373454
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 22:22:09 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id h11so8014573wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 14:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZpVUxYsdTlniOwk9a/t+KTg3a1YKqwR2bK/Gw6poJIQ=;
	b=Hq/QJqxzmjBVYV0q9OyE8BN3DtT2t0WpyrbOHs1J6vSJUHbBAxDGK5i5mKKg+rFBMP
	4EC4PDW+EmIQqyytMXQviTszz2vAUXIW1LCcYVe7yRz8tuwccuqEKGS2XwFaxp00I/VG
	N7MVZsiHoh9SINjaA78RvyRGAW868HgReQ2afF6Mmn7RyxFbXkd5jQs8VGPG1kKABwwB
	0HtE5CwkAP6cRN8aJmJ9nzbNkqxhWR7NooHYYfLjfHah5YaHX+LxOQZcbTmNa8zNUoad
	DX/wsAl1WROn+Idha8C3aM7iTns0nr6EYhg04DTBL1rDOP8ZuXTPemU7s4IPMbJzor5B
	O1LA==
X-Received: by 10.194.186.200 with SMTP id fm8mr12367751wjc.138.1423779730399; 
	Thu, 12 Feb 2015 14:22:10 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id k1sm7444846wjn.9.2015.02.12.14.22.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 14:22:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Feb 2015 23:22:14 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150212222214.GK2272@jama>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
	<1423776119-14981-3-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1423776119-14981-3-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 02/19] libqmi: initial add 1.12.2
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
X-List-Received-Date: Thu, 12 Feb 2015 22:22:09 -0000
X-Groupsio-MsgNum: 54240
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdEQJo40s7ofW8iR"
Content-Disposition: inline

--sdEQJo40s7ofW8iR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2015 at 10:21:42PM +0100, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb b/meta-=
oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb
> new file mode 100644
> index 0000000..a111c1f
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "libqmi is a glib-based library for talking to WWAN modems a=
nd devices which speak the Qualcomm MSM Interface (QMI) protocol"

SUMMARY should be short, please change to short SUMMARY + longer=20
DESCRIPTION.

> +HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/libqmi"
> +LICENSE =3D "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> +    file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
> +"
> +
> +DEPENDS =3D "glib-2.0"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar=
=2Exz"
> +SRC_URI[md5sum] =3D "5b3b6b37a57e2fa828fd4cb6f86d7a9f"
> +SRC_URI[sha256sum] =3D "d1661d73b510482b29b93b7e396756c433d35360b3d44c72=
afa7921339a98624"
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

--sdEQJo40s7ofW8iR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTdJ5YACgkQN1Ujt2V2gBwSkACdFR2SOe6NBKwLal7unqLqAlli
d1kAn1h7RohkA/At33AKX9/4e2b35DEJ
=bNdm
-----END PGP SIGNATURE-----

--sdEQJo40s7ofW8iR--
