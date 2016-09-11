Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4CE3A770A6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 07:26:50 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 199so1127132wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 00:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=rx0leFeZ4MxBZ0UtxrNlaggLEJMPGW9rOM6Spro6is4=;
	b=aVl/s8uZltKXPfMxIQnUB/IS1jg9jzMjAKjG2wDSfHHMYCNjECd0c5WJsS5uqyr42I
	0HyegcGcWF7HbZDE6NhKzMR0C/GzNOi3P0yB2+fwC+hCcrG9ptWGH5ZOPDMy4jnoEmSZ
	JspSzqZsaSF/SBqnFA1SOnCHfVlsJRTfVS4icy7b7dKEq317tbyhk1GTkzFECSqytWFs
	MMJqeJynG+xN/EQBJBiNaSroVJKEFSX3wPmmEAnvOHKjv/csAAKoDd7S1yCNjDzxcafk
	XovQp01zNTWBet+wPBDfIq+4dnQLyKGmP3Kn55gogTA6HnKJMt7/CuuUQ58EOcscqzjP
	iLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rx0leFeZ4MxBZ0UtxrNlaggLEJMPGW9rOM6Spro6is4=;
	b=SyXwtlgs+z/I8FtHqsS1o554QzLDC0rwWiVX9DuxkBt32UOB+m6kraKAWU+vny1u8L
	mvJ6hiv5YJhlnEjlb6PXSQCCbYUS70Xgf8bkDChSHzvRSFJ7tk31/XJxFASSLRRchgih
	RkKmg4EEF8m4+8+sIT9LHUO+YwFvYtTmlHZ8YqTKmv3iwyeXG4u8BQfw1ahsGtxTKbzO
	Lk88OG80reBEc/BQt95/mFNxoxr/AyoJgnqqg9jQqIKkySFWll2z+4hjw6EXM/7X8NVa
	VnpKvUzY7px5q0mYXmwlhySGZk9AdJ5AmOaYyD3rmqdNLcLj+UYvNwtc1LYFknzf4A6c
	2r6g==
X-Gm-Message-State: AE9vXwOBFjGAdH/tAUuw2cul4tBXx7UHni7mMpLZGSf2GkCYJHegeYlQXOLbL8CQCh07YQ==
X-Received: by 10.28.9.7 with SMTP id 7mr5564226wmj.95.1473578810195;
	Sun, 11 Sep 2016 00:26:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	ce6sm11696960wjc.27.2016.09.11.00.26.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Sep 2016 00:26:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 11 Sep 2016 09:26:49 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160911072649.GB2634@jama>
References: <1473463969-23268-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1473463969-23268-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [PATCH] upower: handle and pack systemd unit
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
X-List-Received-Date: Sun, 11 Sep 2016 07:26:54 -0000
X-Groupsio-MsgNum: 63049
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline

--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 10, 2016 at 01:32:49AM +0200, Andreas M=FCller wrote:
> | WARNING: upower-0.99.4-r0 do_package: QA Issue: upower: Files/directori=
es were installed but not shipped in any package:
> |   /lib/systemd
> |   /lib/systemd/system
> |   /lib/systemd/system/upower.service

Part of this was already resolved in:
commit 0a5c689b6823bbad0b535c98841f0f85b23db90f
Author: Jackie Huang <jackie.huang@windriver.com>
Date:   Fri Sep 2 12:59:27 2016 +0800

    upower: add systemd support


Please rebase and re-send if you care about SYSTEMD_AUTO_ENABLE

>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-support/upower/upower_0.99.4.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/upower/upower_0.99.4.bb b/meta-oe/re=
cipes-support/upower/upower_0.99.4.bb
> index 770f333..5ac06dd 100644
> --- a/meta-oe/recipes-support/upower/upower_0.99.4.bb
> +++ b/meta-oe/recipes-support/upower/upower_0.99.4.bb
> @@ -8,7 +8,7 @@ SRC_URI =3D "http://upower.freedesktop.org/releases/${BPN=
}-${PV}.tar.xz"
>  SRC_URI[md5sum] =3D "78800e1ac7f92b24aabdf433e38f75d2"
>  SRC_URI[sha256sum] =3D "9ca325a6ccef505529b268ebbbd9becd0ce65a65f6ac7ee3=
1e2e5b17648037b0"
> =20
> -inherit autotools pkgconfig gettext gobject-introspection
> +inherit autotools pkgconfig gettext gobject-introspection systemd
> =20
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[idevice] =3D "--with-idevice,--without-idevice,libimobiled=
evice libplist"
> @@ -29,5 +29,6 @@ FILES_${PN} +=3D "${datadir}/dbus-1/ \
> =20
>  FILES_${PN}-dbg +=3D "${base_libdir}/udev/.debug"
> =20
> -
> -
> +SYSTEMD_SERVICE_${PN} =3D "upower.service"
> +# dbus
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> --=20
> 2.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfVBzkACgkQN1Ujt2V2gBysCACbBYvCgHJD0pRA+17XZPlW6MHm
ffoAoI/wvR/Qv4h+eWCx3YVQiiUtbAN9
=pP8E
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
