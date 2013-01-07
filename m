Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TsFKB-0005SW-J2
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 17:13:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r07FwBlU019365
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Jan 2013 07:58:11 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 7 Jan 2013 07:58:09 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 8F54F7FCE	for
	<openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jan 2013 10:56:34 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 8D70A2414F; Mon,
	7 Jan 2013 10:58:08 -0500 (EST)
Date: Mon, 7 Jan 2013 10:58:08 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130107155808.GE6154@windriver.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
	<1357463568-26241-3-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1357463568-26241-3-git-send-email-raj.khem@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH V2 03/25] autofs: Add recipes for 5.0.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 16:13:20 -0000
X-Groupsio-MsgNum: 42563
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xJK8B5Wah2CMJs8h"
Content-Disposition: inline

--xJK8B5Wah2CMJs8h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Two simple questions on this.  Therefore, aggressive snipping.

[[oe] [meta-networking][PATCH V2 03/25] autofs: Add recipes for 5.0.7] On 1=
3.01.06 (Sun 01:12) Khem Raj wrote:

[...]

> diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc=
=2Epatch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc.pat=
ch
> new file mode 100644
> index 0000000..04f52c6
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc.patch
> @@ -0,0 +1,26 @@
> +Index: autofs-5.0.7/aclocal.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- autofs-5.0.7.orig/aclocal.m4	2012-10-28 13:17:45.504237027 -0700
> ++++ autofs-5.0.7/aclocal.m4	2012-10-28 13:20:50.108242739 -0700
> +@@ -403,7 +403,7 @@
> + # save current flags
> + af_check_libtirpc_save_cflags=3D"$CFLAGS"
> + af_check_libtirpc_save_ldflags=3D"$LDFLAGS"
> +-CFLAGS=3D"$CFLAGS -I/usr/include/tirpc"
> ++CFLAGS=3D"$CFLAGS -I=3D/usr/include/tirpc"
> + LDFLAGS=3D"$LDFLAGS -ltirpc"
> +=20
> + AC_TRY_LINK(
> +Index: autofs-5.0.7/Makefile.rules
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- autofs-5.0.7.orig/Makefile.rules	2012-10-28 13:17:45.308237022 -0700
> ++++ autofs-5.0.7/Makefile.rules	2012-10-28 13:21:25.720242803 -0700
> +@@ -48,7 +48,7 @@
> + LDFLAGS +=3D -lpthread
> +=20
> + ifdef TIRPCLIB
> +-CFLAGS +=3D -I/usr/include/tirpc
> ++CFLAGS +=3D -I=3D/usr/include/tirpc
> + LDFLAGS +=3D $(TIRPCLIB)
> + endif
> +=20

Are these required?  If they're not, they're probably benign, but I
thought the -I=3D<path> was an rpmbuildism that wasn't specifically
required here.

[...]

> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/met=
a-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> new file mode 100644
> index 0000000..5013e5e
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> @@ -0,0 +1,71 @@
> +DESCRIPTION =3D "Kernel based automounter for linux."
> +SECTION =3D "base"
> +LICENSE =3D "GPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> +
> +DEPENDS +=3D "openldap libtirpc flex-native bison-native"
> +
> +inherit autotools systemd
> +
> +SRC_URI =3D "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.ta=
r.bz2 \
> +           file://autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch \
> +           file://autofs-5.0.7-fix-use-cache-entry-after-free-mistake.pa=
tch \
> +           file://autofs-5.0.7-fix-ipv6-proximity-calculation.patch \
> +           file://autofs-5.0.7-fix-parse-buffer-initialization.patch \
> +           file://autofs-5.0.7-fix-typo-in-automount-8.patch \
> +           file://autofs-5.0.7-include-usage-in-usage-message.patch \
> +           file://autofs-5.0.7-dont-wait-forever-to-restart.patch \
> +           file://autofs-5.0.7-add-timeout-option-description-to-man-pag=
e.patch \
> +           file://autofs-5.0.7-fix-null-map-entry-order-handling.patch \
> +           file://autofs-5.0.7-make-description-of-default-MOUNT_WAIT-se=
tting-clear.patch \
> +           file://autofs-5.0.7-configure-in-allow-cross-compilation.patc=
h \
> +           file://autofs-5.0.7-README-update-mailing-list-subscription-i=
nfo.patch \
> +           file://autofs-5.0.7-allow-non-root-user-to-check-status.patch=
 \
> +           file://autofs-5.0.7-configure-allow-cross-compilation-update.=
patch \
> +           file://autofs-5.0.6-fix-recursive-mount-deadlock.patch \
> +           file://autofs-5.0.6-increase-file-map-read-buffer-size.patch \
> +           file://autofs-5.0.7-handle-new-location-of-systemd.patch \
> +           file://Makefile.rules-cross.patch \
> +           file://no-bash.patch \
> +           file://cross.patch \
> +           file://libtirpc.patch \
> +           file://libtirpc-name-clash-backout.patch \
> +          "
> +
> +SRC_URI[md5sum] =3D "bc46838dece83c02d800ff144ed9f431"
> +SRC_URI[sha256sum] =3D "08c4304d8076dc80c14df559bc5fd821b67ef3457b245f61=
068bd053d8f94ccc"
> +
> +inherit update-rc.d
> +
> +INITSCRIPT_NAME =3D "autofs"
> +INITSCRIPT_PARAMS =3D "defaults"
> +
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> +SYSTEMD_SERVICE =3D "autofs.service"
> +
> +# FIXME: modules/Makefile has crappy rules that don't obey LDFLAGS
> +CFLAGS +=3D "${LDFLAGS}"
> +
> +EXTRA_OEMAKE =3D "DONTSTRIP=3D1"
> +EXTRA_OECONF +=3D "--with-systemd --disable-mount-locking \
> +                --enable-ignore-busy --with-openldap=3Dno \
> +                --with-sasl=3Dno --with-libtirpc=3Dyes \
> +                --with-path=3D${STAGING_BINDIR_NATIVE} \
> +                "
> +CACHED_CONFIGUREVARS =3D "ac_cv_path_RANLIB=3D${RANLIB} \
> +                        ac_cv_path_RPCGEN=3Drpcgen \
> +                       "
> +
> +do_configure_prepend () {
> +        if [ ! -e acinclude.m4 ]; then
> +                cp aclocal.m4 acinclude.m4
> +        fi
> +}
> +
> +#do_install () {
> +#        install -d ${D}${mandir}/man5 ${D}${mandir}/man8 \
> +#                   ${D}${sbindir}
> +#        oe_runmake 'INSTALLROOT=3D${D}' install
> +#}

If do_install() is dead, any harm in removing it from the recipe
entirely?

> +
> +INSANE_SKIP_${PN} =3D "dev-so"
--=20
-Joe MacDonald.
:wq

--xJK8B5Wah2CMJs8h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlDq8JAACgkQPN8S4W6ZZncmPgCfTu/CF9W5+w1aXG56ynfHLw//
WVYAniFxjqZ47CKefMA7HKYUp9PMzlgn
=LslG
-----END PGP SIGNATURE-----

--xJK8B5Wah2CMJs8h--
