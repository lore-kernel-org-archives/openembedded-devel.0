Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id A0F0A6FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 11:24:24 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id p187so60732485wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 03:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xCEZ6m1JxxerDOOQ7UojfMPCVeXhRj0BKWHpfgjdxD0=;
	b=k8yafK9DK1JvbVRZup57Wrm1sx2//HVbu5sj+Fj3lj7JAxNSxK8oei4H+/G/WEhI41
	oYCCR4wb00irtUl41Zb6nxB5iW4T3eHY1TzvqOCkw2s26q0wGTQDGM4JD+Ty/orOdMv3
	gK5PMbOsRYfcov/6OV724lF0sf/NxvzZz0Azb8shPehGFFggNv1XJ+6mkXzGlATOCIfg
	s+nydiLM6uHKLKBuds8cJ6QeG18iGAsxCgwi64Go/jE7vWWNn2CePfpUVomLD9HzkZZ1
	YN3wJTZIs2mBPqfbenytmJ0mnDV1ZvlZFqk5APbYf4IuzROFtIykF8fx2s1aXdUnfgUA
	BCHA==
X-Received: by 10.28.57.65 with SMTP id g62mr2365214wma.65.1450437864068;
	Fri, 18 Dec 2015 03:24:24 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pn6sm14395018wjb.15.2015.12.18.03.24.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 03:24:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Dec 2015 12:26:55 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151218112655.GB2563@jama>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
	<1447192164-9399-10-git-send-email-adrian.freihofer@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1447192164-9399-10-git-send-email-adrian.freihofer@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH 09/17] networkmanager: Add package for nmtui
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
X-List-Received-Date: Fri, 18 Dec 2015 11:24:27 -0000
X-Groupsio-MsgNum: 59090
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline

--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2015 at 10:49:16PM +0100, Adrian Freihofer wrote:
> Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> ---
>  .../networkmanager/networkmanager_1.0.6.bb               | 16 ++++++++++=
++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1=
=2E0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.=
6.bb
> index 294a666..3277fdc 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcbbffd568227ad=
a506640fe950a4823b \
>                      file://libnm-util/COPYING;md5=3D1c4fa765d6eb3cd2fbd8=
4344a1b816cd \
>                      file://docs/api/html/license.html;md5=3D51d7fb67bde9=
92e58533a8481cee070b"
> =20
> -DEPENDS =3D "libnl dbus dbus-glib libgudev wireless-tools util-linux lib=
ndp"
> +DEPENDS =3D "libnl dbus dbus-glib libgudev wireless-tools util-linux lib=
ndp libnewt"
> =20
>  inherit gnomebase gettext systemd
> =20
> @@ -47,6 +47,7 @@ EXTRA_OECONF =3D " \
>      --with-iptables=3D${sbindir}/iptables \
>      --with-tests \
>      --with-dnsmasq=3D${bindir}/dnsmasq \
> +    --with-nmtui=3Dyes \
>  "
> =20
>  # If you need a different configuration for networkmanager, add a line s=
imilar to
> @@ -70,7 +71,7 @@ PACKAGECONFIG[ppp] =3D "--enable-ppp,--disable-ppp,ppp"
>  PACKAGECONFIG[nss] =3D "--with-crypto=3Dnss,,nss"
>  PACKAGECONFIG[gnutls] =3D "--with-crypto=3Dgnutls,,gnutls libgcrypt,gnut=
ls libgcrypt"
> =20
> -PACKAGES =3D+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-=
completion"
> +PACKAGES =3D+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-=
completion ${PN}-nmtui ${PN}-nmtui-doc"
> =20
>  FILES_libnmutil +=3D "${libdir}/libnm-util.so.*"
>  FILES_libnmglib +=3D "${libdir}/libnm-glib.so.*"
> @@ -114,6 +115,17 @@ FILES_${PN}-tests =3D " \
> =20
>  FILES_${PN}-bash-completion =3D "${datadir}/bash-completion"
> =20
> +FILES_${PN}-nmtui =3D " \
> +    ${bindir}/nmtui \
> +    ${bindir}/nmtui-edit \
> +    ${bindir}/nmtui-connect \
> +    ${bindir}/nmtui-hostname \
> +"

Please fix:
networkmanager-1.0.6: /usr/bin/nmtui-connect_networkmanager-nmtui
contained in package networkmanager-nmtui requires libnewt.so()(64bit),
but no providers found in its RDEPENDS [file-rdeps]
networkmanager-1.0.6: /usr/bin/nmtui-connect_networkmanager-nmtui
contained in package networkmanager-nmtui requires libnewt.so, but no
providers found in its RDEPENDS [file-rdeps]

In follow-up patch.

> +
> +FILES_${PN}-nmtui-doc =3D " \
> +    ${mandir}/man1/nmtui* \
> +"
> +
>  SYSTEMD_SERVICE_${PN} =3D "NetworkManager.service"
> =20
>  do_install_append() {
> --=20
> 2.4.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZz7X4ACgkQN1Ujt2V2gBzIpgCfaODiVnxMtUnIbE6ENgFAtH+Z
KrcAn0LYJXPsjL8yTEu2dXXuwnOOKaGb
=73em
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
