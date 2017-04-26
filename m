Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D575D77C85
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 18:10:10 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y10so3305103wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 11:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=w/ZgCesBIazO2+DqpZE1nx8CWkOFyENVyhaGnAc/pZg=;
	b=VcpmTKI/OuEvGvyMgBlVXWCsBxUXBV+yw6Azi6WtB2LVSyRzAdCpbLKbaHnYZMEb1x
	LEigBfhAy/JkraVSLy4CstRfDEzCeErTuWIrkVMnB8h4zRZ09q9wdNcvq5czno75oLz+
	LAXDeJduMvw0j9Z4AeFFBZA5MNUzgA94u2md7YTMdsq+Wh+wFFc7Kpzi4/HQwba/nH5q
	WWlns84ev7E1o/K7ZDEGwVrvY4rDzXmKLFqMyFKxNPgGdIGsjRnEZCVv8rj//Q12mhOI
	GahXjW33dtU8u+oZ6W4BzJVuPlgelb16cKZ28tIfQdNbVodvWXmBaoXo9mXoIDpCNUMH
	zXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=w/ZgCesBIazO2+DqpZE1nx8CWkOFyENVyhaGnAc/pZg=;
	b=gjIS4Jibm0TnlU4gQ2wVwzuEkuGBUyu6VOYS3d/Z9pW07MIJLJZ9c4OBbifs5WFfvH
	EJiruNN3K4mQLeQzYufiJuTG7DJ2qImwW0hEmIChZ3jkOknTCjYlf87B7R4QrCCqZpcv
	Z3Kz7NyormJhGsIBbCFE0bftfAoW1r7/PFsZxCs8NxRV3N4nApPvP1AZIvgI3TceGdju
	UcMVR/LZK4qlciHKN3eFP4FK3DdpLbcCVyeLHeS3LAsKVmxhZlurGaXymGqnooDy2Bv1
	rgx1eSBHz6NZRVG/iS/JEUVgRP68ADf+1j8I/HET/ysb8dm2gFbB6QmieL+UUeVIiRHB
	pEgw==
X-Gm-Message-State: AN3rC/4KMIPPg3m50iWsWREUykKO1E+yjqdaEZsaZ9KJ+kz/suTZlhJb
	uYOSSKtmneZ0yw==
X-Received: by 10.28.91.77 with SMTP id p74mr6796516wmb.123.1493230211154;
	Wed, 26 Apr 2017 11:10:11 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id y31sm963151wrd.23.2017.04.26.11.10.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Apr 2017 11:10:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 26 Apr 2017 20:10:28 +0200
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20170426181028.GE3258@jama>
References: <1491976809-2701-1-git-send-email-stefan@agner.ch>
MIME-Version: 1.0
In-Reply-To: <1491976809-2701-1-git-send-email-stefan@agner.ch>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] wireguard: add WireGuard kernel module and tools
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
X-List-Received-Date: Wed, 26 Apr 2017 18:10:11 -0000
X-Groupsio-MsgNum: 66556
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HeFlAV5LIbMFYYuh"
Content-Disposition: inline

--HeFlAV5LIbMFYYuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 11, 2017 at 11:00:09PM -0700, Stefan Agner wrote:
> WireGuard is an extremely simple yet fast and modern VPN that utilizes
> state-of-the-art cryptography. It aims to be faster, simpler, leaner,
> and more useful than IPSec, while avoiding the massive headache.
>=20
> The recipes add the current experimental snapshot v0.0.20170409
> out-of-tree kernel module and tools. The kernel module has some kernel
> configuration dependencies such as some configuration part of
> features/netfilter/netfilter.scc, hence netfilter.scc should be part
> of KERNEL_EXTRA_FEATURES (which is the case by default).
>=20
> Since wireguard-tools is TUNE_PKGARCH and depends on wireguard-module
> which is MACHINE_ARCH (like all kernel modules) we need to add this
> dependency to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.

I know it's not possible to check it from recipe, but it might be useful
to mention which kernel options this requires, one of my builds failed
with:

wireguard-module/0.0.20170409-r0/WireGuard-0.0.20170409/src/Kbuild:30:
*** "WireGuard requires CONFIG_NETFILTER_XT_MATCH_HASHLIMIT to be
configured in your kernel. See
https://www.wireguard.io/install/#kernel-requirements for more info".
Stop.

So the error message is quite good, but still might be useful to mention
this URL in the recipe as well.

>=20
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> Changes since v1:
> - Upgrade to v0.0.20170409
> - Add wireguard-tools -> wireguard-module dependency to
>   SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.
>=20
>  meta-networking/conf/layer.conf                    |  4 ++++
>  .../wireguard/wireguard-module_0.0.20170409.bb     |  9 ++++++++
>  .../wireguard/wireguard-tools_0.0.20170409.bb      | 27 ++++++++++++++++=
++++++
>  .../recipes-kernel/wireguard/wireguard.inc         | 18 +++++++++++++++
>  4 files changed, 58 insertions(+)
>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-mo=
dule_0.0.20170409.bb
>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-to=
ols_0.0.20170409.bb
>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard.inc
>=20
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer=
=2Econf
> index 85ad93b..b5aa159 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -21,3 +21,7 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> =20
>  # Override security flags
>  require conf/distro/include/meta_networking_security_flags.inc
> +
> +SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
> +  wireguard-tools->wireguard-module \
> +"
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.=
0.20170409.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0=
=2E0.20170409.bb
> new file mode 100644
> index 0000000..aeb8269
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170=
409.bb
> @@ -0,0 +1,9 @@
> +require wireguard.inc
> +
> +inherit module
> +
> +EXTRA_OEMAKE +=3D "KERNELDIR=3D${STAGING_KERNEL_DIR}"
> +MAKE_TARGETS =3D "module"
> +MODULES_INSTALL_TARGET =3D "module-install"
> +
> +RRECOMMENDS_${PN} =3D "kernel-module-xt-hashlimit"
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0=
=2E20170409.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0=
=2E0.20170409.bb
> new file mode 100644
> index 0000000..79d420f
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.201704=
09.bb
> @@ -0,0 +1,27 @@
> +require wireguard.inc
> +
> +inherit bash-completion systemd pkgconfig
> +
> +DEPENDS =3D "wireguard-module libmnl"
> +
> +do_compile_prepend () {
> +    cd ${S}/tools
> +}
> +
> +do_install () {
> +    cd ${S}/tools
> +    oe_runmake DESTDIR=3D"${D}" PREFIX=3D"${prefix}" SYSCONFDIR=3D"${sys=
confdir}" \
> +        SYSTEMDUNITDIR=3D"${systemd_unitdir}" \
> +        WITH_SYSTEMDUNITS=3D${@bb.utils.contains('DISTRO_FEATURES', 'sys=
temd', 'yes', '', d)} \
> +        WITH_BASHCOMPLETION=3Dyes \
> +        WITH_WGQUICK=3Dyes \
> +        install
> +}
> +
> +FILES_${PN} =3D " \
> +    ${sysconfdir} \
> +    ${systemd_unitdir} \
> +    ${bindir} \
> +"
> +
> +RDEPENDS_${PN} =3D "wireguard-module"
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/met=
a-networking/recipes-kernel/wireguard/wireguard.inc
> new file mode 100644
> index 0000000..db98517
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "WireGuard is an extremely simple yet fast and modern VPN"
> +DESCRIPTION=3D"WireGuard is a secure network tunnel, operating at layer =
3, \
> +implemented as a kernel virtual network interface for Linux, which aims =
to \
> +replace both IPsec for most use cases, as well as popular user space and=
/or \
> +TLS-based solutions like OpenVPN, while being more secure, more performa=
nt, \
> +and easier to use."
> +SECTION =3D "networking"
> +HOMEPAGE =3D "https://www.wireguard.io/"
> +LICENSE =3D "GPLv2"
> +
> +LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
> +
> +SRC_URI =3D "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.ta=
r.xz"
> +
> +SRC_URI[md5sum] =3D "5d3146bbd38c534386eb4a0c026780ff"
> +SRC_URI[sha256sum] =3D "31473b4d14178f82d6ff46df019d57982c210c03d1a985d5=
4db35bdd76efbb18"
> +
> +S =3D "${WORKDIR}/WireGuard-${PV}/src/"
> --=20
> 2.7.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HeFlAV5LIbMFYYuh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWQDikwAKCRA3VSO3ZXaA
HKYoAJ9jS7z7+uW+NXJwfA1ZCLfY7XVniACgrtUDnLYsQl6V1pUO5ZsdivTlbXg=
=9RjK
-----END PGP SIGNATURE-----

--HeFlAV5LIbMFYYuh--
