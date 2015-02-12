Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id E189C7340C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 22:21:59 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id n12so13150866wgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 14:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IGYPDPcYep+8uLkRCnClRqRouAEuvGowVDAgqlggXw0=;
	b=HXGpsmwqOWNq20dXkSkvjMQ7+drf5NOKlHOVquCMjMi0DUd/9wExhL6/CtwsQo+f0x
	ZNgTD1GGjrgAIYGjsvtpYFuEcHYBm7vxKtVm/jRMvPZd0tTnV32q6cDxPFgZpzM3bNuV
	JozXAFFTUQ/dbnQ3+0zch3aQCjqVH+9JPL2NUriAWGNQqSJ7lrk/MU8xnF4+OTI8URkJ
	tcy5vzQ7VBT8aKpeJZqTHrNNKKKLw4HdVrSq4FkGP+KUaDbMOK+8Ibw2bFiEWYpnhN4m
	RavOwBD5JeAUyEZiXP/HX49mHksg1Tkk1DOxQsTs9OGCikFUz3j2Cpr4BJjDqiQj6KTZ
	sB7g==
X-Received: by 10.180.211.83 with SMTP id na19mr888084wic.29.1423779720296;
	Thu, 12 Feb 2015 14:22:00 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id c4sm317502wik.0.2015.02.12.14.21.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 14:21:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Feb 2015 23:22:04 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150212222204.GJ2272@jama>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
	<1423776119-14981-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1423776119-14981-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 01/19] libmbim: initial add 1.12.2
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
X-List-Received-Date: Thu, 12 Feb 2015 22:22:00 -0000
X-Groupsio-MsgNum: 54239
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8jNwmpfkpox/fiJK"
Content-Disposition: inline

--8jNwmpfkpox/fiJK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2015 at 10:21:41PM +0100, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb | 15 ++++++++++++=
+++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb b/met=
a-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
> new file mode 100644
> index 0000000..17cfba2
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "libmbim is a glib-based library for talking to WWAN modems =
and devices which speak the Mobile Interface Broadband Model (MBIM) protoco=
l"

SUMMARY should be short, please change to short SUMMARY + longer
DESCRIPTION.

> +HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/libmbim/"
> +LICENSE =3D "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> +    file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
> +"
> +
> +DEPENDS =3D "glib-2.0 udev"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar=
=2Exz"
> +SRC_URI[md5sum] =3D "921fb5ab3f13f1e00833e009d8f3b4f6"
> +SRC_URI[sha256sum] =3D "949351d3e3d69b81e40a49f1d187944c26149e0647a415f0=
227ccdc112047b29"
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

--8jNwmpfkpox/fiJK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTdJ4wACgkQN1Ujt2V2gBwNHACeM+AluOgV2eIBf4hH1iv0ajAU
NhoAnjjalqMmqN3sCptqUtBZ611+TUmG
=pHA7
-----END PGP SIGNATURE-----

--8jNwmpfkpox/fiJK--
