Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5151E73D13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 14:57:59 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so30189814wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EUjQOJcJ8IEHviy0RuKAAf9rHn94iL41ZZmGmhH9ZPQ=;
	b=oIdjMWEhJJYGXSwJj/yVpCYUed1fO+0zZmF+atvQpyZj1X2opWOWGNIu2r9S2N5wLL
	clFZhd66a3u3t2QbLwTPPa8bOS5C95IuyyiSUQTpfmg65Jee9fdt635dm4kArdmT5ua+
	ppBnw8V4d3/q4k/yWCmT4PFnOwEdIt462yDtN7yk6hAW48Ttzl4FPMz//+Z8XfG81b8j
	AZzg5uc6d4VN3hmWKeTiP2TDvnV+ziTkUOALzNOtYDWanlJIctcZe0tGtPzkAbhgsUe/
	asdOfCi6DpBqOarQy4FiQYHr9gayf9ge+hTs/8INRbP7tnecfZNNAYsGlvz7Rla829Zb
	PKDg==
X-Received: by 10.180.105.165 with SMTP id gn5mr6547321wib.20.1438181879910;
	Wed, 29 Jul 2015 07:57:59 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id s5sm24778714wik.2.2015.07.29.07.57.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 07:57:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Jul 2015 16:58:08 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150729145808.GB12478@jama>
References: <1437620893-8149-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1437620893-8149-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [meta-networking][PATCH] netmap: add new package
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
X-List-Received-Date: Wed, 29 Jul 2015 14:58:02 -0000
X-Groupsio-MsgNum: 56428
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline

--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2015 at 08:08:13PM -0700, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>=20
> this adds netmap, the fast packet I/O framework
> http://info.iet.unipi.it/~luigi/netmap/

Fails to build on jenkins log in:
http://errors.yoctoproject.org/Errors/Build/7660/

>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../recipes-kernel/netmap/netmap-modules_git.bb    | 33 ++++++++++++++++=
++++++
>  meta-networking/recipes-kernel/netmap/netmap.inc   | 14 +++++++++
>  .../recipes-kernel/netmap/netmap_git.bb            | 32 ++++++++++++++++=
+++++
>  3 files changed, 79 insertions(+)
>  create mode 100644 meta-networking/recipes-kernel/netmap/netmap-modules_=
git.bb
>  create mode 100644 meta-networking/recipes-kernel/netmap/netmap.inc
>  create mode 100644 meta-networking/recipes-kernel/netmap/netmap_git.bb
>=20
> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb =
b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> new file mode 100644
> index 0000000..63ca50f
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> @@ -0,0 +1,33 @@
> +require netmap.inc
> +
> +DEPENDS =3D "virtual/kernel"
> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
> +
> +inherit module
> +
> +COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
> +
> +CLEANBROKEN =3D "1"
> +
> +export INSTALL_MOD_DIR=3D"kernel/netmap-modules"
> +
> +EXTRA_OECONF =3D "--kernel-dir=3D${STAGING_KERNEL_BUILDDIR} \
> +                --kernel-sources=3D${STAGING_KERNEL_DIR} \
> +                --install-mod-path=3D${D} \
> +                --driver-suffix=3D"-netmap" \
> +                "
> +
> +do_configure () {
> +    cd ${S}/LINUX
> +    ./configure ${EXTRA_OECONF}
> +}
> +
> +do_compile () {
> +    cd ${S}/LINUX
> +    make=20
> +}
> +
> +do_install () {
> +    cd ${S}/LINUX
> +    oe_runmake install
> +}
> diff --git a/meta-networking/recipes-kernel/netmap/netmap.inc b/meta-netw=
orking/recipes-kernel/netmap/netmap.inc
> new file mode 100644
> index 0000000..4a101a1
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/netmap/netmap.inc
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "netmap and VALE - very fast packet I/O from userspace (Free=
BSD/Linux)"
> +DESCRIPTION=3D "NETMAP is a framework for very fast packet I/O from user=
space.  VALE is an equally fast in-kernel software switch using the netmap =
API.  Both are implemented as a single kernel module for FreeBSD and Linux,=
 and can deal with line rate on real or emulated 10 Gbit ports."
> +SECTION =3D "networking"
> +HOMEPAGE =3D "http://code.google.com/p/netmap/"
> +LICENSE =3D "GPLv2+"
> +
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D13;endline=3D14;md5=3Df6=
4f2b172fe6903ff7b6272c6edde588"
> +
> +SRCREV =3D "a14a35b839fe7ab6855f25f1e86e306ee7ad8123"
> +PV =3D "master+git${SRCPV}"
> +
> +SRC_URI =3D "git://github.com/luigirizzo/netmap.git"
> +
> +S =3D "${WORKDIR}/git"
> diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-n=
etworking/recipes-kernel/netmap/netmap_git.bb
> new file mode 100644
> index 0000000..da80bad
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
> @@ -0,0 +1,32 @@
> +require netmap.inc
> +
> +DEPENDS =3D "netmap-modules"
> +
> +EXTRA_OECONF =3D "--kernel-dir=3D${STAGING_KERNEL_BUILDDIR} \
> +                --kernel-sources=3D${STAGING_KERNEL_DIR} \
> +                --install-mod-path=3D${D} \
> +                --no-drivers \
> +                --prefix=3D${prefix} \
> +                --destir=3D${D} \
> +                --cc=3D'${CC}' \
> +                --ld=3D'${LD}' \
> +                "
> +
> +do_configure () {
> +    cd ${S}/LINUX
> +    ./configure ${EXTRA_OECONF}
> +}
> +
> +do_compile () {
> +    cd ${S}/LINUX
> +    make  apps
> +}
> +
> +do_install () {
> +    cd ${S}/LINUX
> +    make install-apps DESTDIR=3D${D}
> +}
> +
> +FILES_${PN} +=3D "${bindir}"
> +RDEPENDS_${PN} =3D "kernel-module-netmap"
> +RRECOMMENDS_${PN} =3D "kernel-module-netmap"
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW46f8ACgkQN1Ujt2V2gBxtoQCgjv6aMBT5l/3wilwMH28tJ3fX
6rsAoKTQ5SorqMCt7YcbgTSRtxVgFl29
=W+WD
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
