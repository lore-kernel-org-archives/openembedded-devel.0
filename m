Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A6C4770031
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 10:26:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id w143so11455425wmw.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 03:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=w6h4LijhuZ0aFXO7+1Hifge+ZDVe3Q2+AFifqjfv4LY=;
	b=mChXk5Vx1fodTU70wk/rYxSn1yMdzWjUYeSEhnuezBcbyge/mplSMpQPZyl5xURPF+
	xVvQW0z2mCpbPrKT1MCOl2UxGsTO61f3AdSkdJGV42pd1euEkEew4b3QKg53jnqRy5pD
	DPufd4auHg57Sc7/uC+KfQFOy3a9/tDkI8Wv4ko9llV1bn4j1mv/CVIalzlkPG7Vka3D
	Z2xRqyw+Z0Mw8eYe4eqaPI4Fwipu4PD94TSEnvr1ApnqMvNvTjDXTRjuDunZvTUTMPWK
	cwHFhXtkc92YYIzzPoJ9xg2cc3lLc1DDTmIgtPWXI/vPws57LUMQCUgd+uQ/W6dBYfJx
	YlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=w6h4LijhuZ0aFXO7+1Hifge+ZDVe3Q2+AFifqjfv4LY=;
	b=jtwM3i/NqCiR2FR4XGuSmzO9IazED+a1nritG7dXLPKIRaqtKn3yic7eiMAvKyznhB
	Bo2N5mCThZBujA2hrYueAFafzz4T1d4PeScQswdlJQ3Px8JNoXD513NubaMF5uaHEWKX
	PwEsRj+NJAbUpfppezXMK/FmesI9WuMCRMJZTYpgqf1uGhrnAt+FXKYyV55LMAxi4o4t
	8hsd9x5g2WAmeLQpeszL1Y7h47eoGFTwrfFRQQIe5WYjvtBpNZbqUY15o+0qHqqRxq7i
	yrG1Wt/UklWi86lNLye56pJkBWddpozP+E39RDiyo8/Q9RYI20Mz9oPyv6/26mt826xc
	EVhw==
X-Gm-Message-State: AOPr4FUQqV3CQq5Qd9BhcPlMTxR+uISGgQhqvmjhypTu4yRlzVKR1xQISoVTYko/AZCJPA==
X-Received: by 10.28.91.17 with SMTP id p17mr8546388wmb.86.1461752813504;
	Wed, 27 Apr 2016 03:26:53 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	us3sm3270769wjc.41.2016.04.27.03.26.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Apr 2016 03:26:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Apr 2016 12:27:23 +0200
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160427102723.GI2559@jama>
References: <79b27b412f7fb085cc4525907858cb072b6da7e2.1459773737.git.adrian.ratiu@ni.com>
	<fe58091e2f0319dc7288a651e409852d173e5438.1459773737.git.adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <fe58091e2f0319dc7288a651e409852d173e5438.1459773737.git.adrian.ratiu@ni.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 2/2] openconnect: add recipe
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
X-List-Received-Date: Wed, 27 Apr 2016 10:26:55 -0000
X-Groupsio-MsgNum: 61204
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZOudaV4lSIjFTlHv"
Content-Disposition: inline

--ZOudaV4lSIjFTlHv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 04, 2016 at 03:43:46PM +0300, Ioan-Adrian Ratiu wrote:
> openconnect is a FOSS VPN client designed to work with Cisco AnyConnect
> and Pulse Connect Secure (Juniper SSL).
>=20
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../openconnect/openconnect_git.bb                     | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/openconnect/open=
connect_git.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect=
_git.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_git.=
bb
> new file mode 100644
> index 0000000..0a8b875
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Open client for Cisco AnyConnect VPN"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING.LGPL;md5=3D243b725d71bb5df4a1e5920b=
344b86ad"
> +
> +DEPENDS =3D "vpnc libxml2 gnutls"
> +RDEPENDS_${PN} =3D "vpnc"

There are still some autodetected dependencies as shown by QA warnings:

WARN: openconnect: openconnect rdepends on krb5, but it isn't a build depen=
dency?
WARN: openconnect: openconnect rdepends on libcomerr, but it isn't a build =
dependency?
WARN: openconnect: openconnect rdepends on libproxy, but it isn't a build d=
ependency?
WARN: openconnect: openconnect rdepends on lz4, but it isn't a build depend=
ency?
WARN: openconnect: openconnect rdepends on pcsc-lite-lib, but it isn't a bu=
ild dependency?

> +
> +PV =3D "7.06"
> +
> +SRCREV =3D "35542d52202672b8c12ecc63867432128244013a"
> +SRC_URI =3D "git://git.infradead.org/users/dwmw2/openconnect.git"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF +=3D "--with-vpnc-script=3D${SYSROOT_DESTDIR}${sysconfdir}/=
vpnc/vpnc-script \
> +                 --disable-static"
> --=20
> 2.7.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZOudaV4lSIjFTlHv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcglAoACgkQN1Ujt2V2gBzWrQCeJhtStyQEdCECTGXFmt7ejBTs
qZgAnRj1WPLRAzkbzYkVOukoD2ZJuL1F
=7Aat
-----END PGP SIGNATURE-----

--ZOudaV4lSIjFTlHv--
