Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 734CA605F1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 19:29:16 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id b13so3605011wgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Feb 2015 11:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U/ipU0MgTL9yiJTuETSdzCLsySlckaQ3kCiO0mo/UdA=;
	b=XTPFmCzsrg7XpMhF+VUmbG4Rw5QmwWUeZJ8wXPO5p6gpROznz3ObFVN44qok+hp5bN
	jdx64fLGjb19fuYDX+bpH7+bQOEOdjKLkCtk9OEyvdPVkj4b35Rhjoi2VFUuXq43me5b
	haIM88btGwpGWTiCeNq4zZ5cMjA//cjGax7oQ/9a3UMI7KaetH//Ki/wWvxyqiEX5VjG
	hF8uYz3Lm8fklP+5Pcnm1ZV+3akrbZ3xKvC7apPAF8t1nxCnqxB5y+HFD/WCB5DRin38
	B+LDaJ/bV/CstbMeivHInGn2FbZYPmJUlWWTtHCXCB8IWLybSPJv3tG9Ae5f1Lxqx+JE
	W3Tw==
X-Received: by 10.194.189.77 with SMTP id gg13mr69421555wjc.81.1423078157530; 
	Wed, 04 Feb 2015 11:29:17 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r8sm4542139wib.16.2015.02.04.11.29.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 11:29:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 4 Feb 2015 20:29:32 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150204192932.GC2437@jama>
References: <1423075108-24559-1-git-send-email-danismostlikely@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1423075108-24559-1-git-send-email-danismostlikely@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 1/5] xserver-nodm-init: only enable for runlevel 5
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
X-List-Received-Date: Wed, 04 Feb 2015 19:29:22 -0000
X-Groupsio-MsgNum: 54093
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline

--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2015 at 12:38:28PM -0600, Dan McGregor wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>=20

This e-mail seems to contain all 5 patches squashed into one.

Patchwork is also confused:
http://patchwork.openembedded.org/patch/88023/

Please resend.

> Runlevel 5 is traditionally graphical. If it starts in runlevel 2
> or 3 systemd gets confused and adds it as a dependency of the
> multi-user target, not just the graphical target.
>=20
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  .../xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm         | 9 +++=
++++++
>  .../recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb  | 4 ++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init=
-2.0/xserver-nodm b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm=
-init-2.0/xserver-nodm
> index d2e2f86..5d7e8a2 100755
> --- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xs=
erver-nodm
> +++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xs=
erver-nodm
> @@ -1,4 +1,13 @@
>  #!/bin/sh
> +#
> +### BEGIN INIT INFO
> +# Provides: xserver
> +# Required-Start: $local_fs $remote_fs dbus
> +# Required-Stop: $local_fs $remote_fs
> +# Default-Start:     5
> +# Default-Stop:      0 1 2 3 6
> +### END INIT INFO
> +
> =20
>  . /etc/init.d/functions
> =20
> diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init=
_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.=
bb
> index 47470fb..f9bf007 100644
> --- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
> +++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
> @@ -15,8 +15,8 @@ S =3D "${WORKDIR}"
>  inherit allarch update-rc.d systemd
> =20
>  INITSCRIPT_NAME =3D "xserver-nodm"
> -INITSCRIPT_PARAMS =3D "start 01 5 2 . stop 01 0 1 6 ."
> -INITSCRIPT_PARAMS_shr =3D "start 90 5 2 . stop 90 0 1 6 ."
> +INITSCRIPT_PARAMS =3D "start 01 5 . stop 01 0 1 2 3 6 ."
> +INITSCRIPT_PARAMS_shr =3D "start 90 5 . stop 90 0 1 2 3 6 ."
> =20
>  do_install() {
>      install -d ${D}${sysconfdir}/init.d
> --=20
> 2.1.0
>=20
>=20
> From 326102dab4af209f6e171ee5773b1eae91e1fdf8 Mon Sep 17 00:00:00 2001
> From: Dan McGregor <danismostlikely@gmail.com>
> Date: Tue, 3 Feb 2015 18:46:42 -0600
> Subject: [meta-oe][PATCH 2/5] lxdm: RDEPEND on libsvg-gtk
> To: openembedded-devel@lists.openembedded.org
>=20
> From: Dan McGregor <dan.mcgregor@usask.ca>
>=20
> The theme uses svg files. If libsvg-gtk isn't available lxdm
> still runs, but throws a bunch of pixbuf errors.
>=20
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta-oe/recipes-graphics/lxdm/lxdm_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-=
graphics/lxdm/lxdm_git.bb
> index a3dcc1b..66dc269 100644
> --- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> +++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> @@ -70,7 +70,7 @@ done
>  sed -i "s:last_langs=3D.*$:last_langs=3D$langs:g" $D${localstatedir}/lib=
/lxdm/lxdm.conf
>  }
> =20
> -RDEPENDS_${PN} =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plug=
in-loginuid', '', d)} setxkbmap bash"
> +RDEPENDS_${PN} =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plug=
in-loginuid', '', d)} setxkbmap bash librsvg-gtk"
> =20
>  RPROVIDES_${PN} +=3D "${PN}-systemd"
>  RREPLACES_${PN} +=3D "${PN}-systemd"
> --=20
> 2.1.0
>=20
>=20
> From 9a238ca43caf0989b4ace91926500493741e6e02 Mon Sep 17 00:00:00 2001
> From: Dan McGregor <danismostlikely@gmail.com>
> Date: Tue, 3 Feb 2015 18:46:42 -0600
> Subject: [meta-oe][PATCH 3/5] emacs: Un-blacklist, seems to work fine wit=
h new
>  qemu
> To: openembedded-devel@lists.openembedded.org
>=20
> From: Dan McGregor <dan.mcgregor@usask.ca>
>=20
> I've only tested the build with armv7 and x86, but the build
> doesn't segfault anymore. The last time this was tested was
> with qemu 1.5, we're now using 2.1.
>=20
> While here, don't copy stuff from the sysroot into the qemu tree
> just use the sysroot itself.
>=20
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta-oe/recipes-support/emacs/emacs.inc     | 89 +----------------------=
------
>  meta-oe/recipes-support/emacs/emacs_23.4.bb |  2 -
>  2 files changed, 2 insertions(+), 89 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-su=
pport/emacs/emacs.inc
> index a1a4965..e052c5e 100644
> --- a/meta-oe/recipes-support/emacs/emacs.inc
> +++ b/meta-oe/recipes-support/emacs/emacs.inc
> @@ -14,14 +14,13 @@ X11DEPENDS =3D " \
>      libx11 libxau libxcomposite libxcursor libxdamage libxdmcp libxext l=
ibxfixes \
>      libxft libxpm libxrandr libxrender \
>      gdk-pixbuf glib-2.0 gtk+ pango libxcb harfbuzz icu \
> -"=20
> +"
> =20
>  EXTRA_OECONF =3D  "--without-sound --with-crt-dir=3D${STAGING_LIBDIR} "
> =20
>  PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '=
', d)}"
>  PACKAGECONFIG[x11] =3D "--with-x-toolkit=3Dgtk,--without-x --without-dbu=
s,${X11DEPENDS}"
> =20
> -
>  inherit autotools
> =20
>  PACKAGES =3D+ "${PN}-el"
> @@ -33,15 +32,13 @@ FILES_${PN} +=3D "${datadir}/emacs ${datadir}/icons"
> =20
>  FILES_${PN}-dbg +=3D "${libexecdir}/emacs/*/*/.debug ${datadir}/emacs/*/=
*/.debug"
> =20
> -TREEDIR =3D "${WORKDIR}/qemu-treedir"
> -
>  QEMUARCH=3D "${TARGET_ARCH}"
>  QEMUARCH_i486 =3D "i386"
>  QEMUARCH_i586 =3D "i386"
>  QEMUARCH_i686 =3D "i386"
> =20
>  # Large stack is required at least on x86_64 host, otherwise random segf=
aults appear:
> -QEMU =3D "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L ${TREEDIR} "
> +QEMU =3D "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L ${STAGING_DIR_H=
OST} "
> =20
>  export LOGNAME =3D "$(whoami)"
> =20
> @@ -52,88 +49,6 @@ do_compile_prepend() {
>      ln -sf ../src/emacs lisp/emacs
>      ln -sf ../src/emacs lib-src/emacs
>      ln -sf ../src/emacs leim/emacs
> -#copy STAGING_DIR_TARGET and libgcc_s.so* to WORKDIR/qemu-treedir #copie=
d code from glibc-package.bbclass
> -    treedir=3D${TREEDIR}
> -    if [ -e $treedir ];then
> -        rm -rf $treedir
> -    fi
> -   =20
> -    mkdir -p $treedir/${base_libdir}
> -
> -    if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so ]=
; then
> -        cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.=
so $treedir/${base_libdir}
> -    fi
> -    if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.*=
 ]; then
> -        cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.=
so.* $treedir/${base_libdir}
> -    fi
> -    # stupid hack, but without it, it tries to use /usr/lib/libc.so from=
 host and fails
> -    # temacs: error while loading shared libraries: /usr/lib/libc.so: EL=
F file version does not match current one
> -    if [ ! -f $treedir/${base_libdir}/libc.so ]; then
> -        ln -s libc.so.6 $treedir/${base_libdir}/libc.so
> -    fi
> -
> -    # copy only as much stuff as we need
> -    # before: 5.5G   ../../qemu-treedir/
> -    # after:   17M   ../../qemu-treedir/
> -    cp -pPR \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/ld-* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libc.* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libc-* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libm-* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libm.* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libtinfo.so.* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libresolv* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libdl* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/librt* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libgcc_s.so.* \
> -    ${STAGING_DIR_TARGET}/${base_libdir}/libpthread* $treedir/${base_lib=
dir}/
> -
> -    if [ ! -z "${@base_contains('PACKAGECONFIG', 'x11', 'x11', '', d)}" =
] ; then
> -        echo "X11 build enabled"
> -        # copy only as much stuff as we need
> -        # before: 5.5G   ../../qemu-treedir/
> -        # after:   86M   ../../qemu-treedir/
> -        cp -pPR \
> -        ${STAGING_DIR_TARGET}/${base_libdir}/libuuid.so.* \
> -        ${STAGING_DIR_TARGET}/${base_libdir}/libz.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libICE.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libSM.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libatk-1.0.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libcairo.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libdbus-1.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libdbus-glib-1.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libexpat.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libffi.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libfontconfig.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libfreetype.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libgconf-2.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libgif.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libjpeg.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/liblzma.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libpixman-1.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libpng1*.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/librsvg-2.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libstdc++.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libtiff.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libxml2.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libcroco-0.6.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libharfbuzz.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libicule.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libicuuc.so.* \
> -        ${STAGING_DIR_TARGET}/${libdir}/libicudata.so.* $treedir/${base_=
libdir}/
> -
> -        # X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes Xft Xpm X=
randr Xrender
> -        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libX*.so.* $treedir/${ba=
se_libdir}/
> -
> -        # gdk-x11 gdk_pixbuf gio glib gmodule gobject gthread gtk-x11
> -        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libg*-2.0.so.* $treedir/=
${base_libdir}/
> -
> -        # pango pangocairo pangoft2
> -        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libpango*-1.0.so.* $tree=
dir/${base_libdir}/
> -
> -        # xcb-render xcb-shm xcb
> -        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libxcb*.so.* $treedir/${=
base_libdir}/
> -    fi
>  }
> =20
>  do_install_append() {
> diff --git a/meta-oe/recipes-support/emacs/emacs_23.4.bb b/meta-oe/recipe=
s-support/emacs/emacs_23.4.bb
> index a324828..36e8f0c 100644
> --- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
> +++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
> @@ -2,8 +2,6 @@ require emacs.inc
> =20
>  PR =3D "r4"
> =20
> -PNBLACKLIST[emacs] ?=3D "qemu: uncaught target signal 11 (Segmentation f=
ault) - core dumped"
> -
>  SRC_URI =3D "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=3Dtarball \
>             file://use-qemu.patch \
>             file://nostdlib-unwind.patch \
> --=20
> 2.1.0
>=20
>=20
> From 09961c681ffd5bd98d5f96ee6a82a710386e119a Mon Sep 17 00:00:00 2001
> From: Dan McGregor <danismostlikely@gmail.com>
> Date: Tue, 3 Feb 2015 18:46:42 -0600
> Subject: [meta-gnome][PATCH 4/5] gdm: Only start in runlevel 5
> To: openembedded-devel@lists.openembedded.org
>=20
> From: Dan McGregor <dan.mcgregor@usask.ca>
>=20
> Runlevel 5 is traditionally graphical. If it starts in runlevel 2
> or 3 systemd gets confused and adds it as a dependency of the
> multi-user target, not just the graphical target.
>=20
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta-gnome/recipes-gnome/gdm/gdm/gdm       | 4 ++--
>  meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/gdm/gdm/gdm b/meta-gnome/recipes-gn=
ome/gdm/gdm/gdm
> index 43eae95..bb5b418 100755
> --- a/meta-gnome/recipes-gnome/gdm/gdm/gdm
> +++ b/meta-gnome/recipes-gnome/gdm/gdm/gdm
> @@ -4,8 +4,8 @@
>  # Should-Start:      console-screen acpid dbus hal network-manager
>  # Required-Start:    $local_fs $remote_fs
>  # Required-Stop:     $local_fs $remote_fs
> -# Default-Start:     2 3 4 5
> -# Default-Stop:      0 1 6
> +# Default-Start:     5
> +# Default-Stop:      0 1 2 3 6
>  # Short-Description: GNOME Display Manager
>  # Description:       Debian init script for the GNOME Display Manager
>  ### END INIT INFO
> diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/reci=
pes-gnome/gdm/gdm_2.32.2.bb
> index b2ae9ac..fcd51ff 100644
> --- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
> +++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
> @@ -88,7 +88,7 @@ RCONFLICTS_${PN} +=3D "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} =3D "gdm.service"
> =20
>  INITSCRIPT_NAME =3D "gdm"
> -INITSCRIPT_PARAMS =3D "start 99 5 2 . stop 20 0 1 6 ."
> +INITSCRIPT_PARAMS =3D "start 99 5 . stop 20 0 1 2 3 6 ."
> =20
>  USERADD_PACKAGES =3D "${PN}"
>  USERADD_PARAM_${PN} =3D "--system --no-create-home --home ${localstatedi=
r}/lib/gdm --user-group gdm"
> --=20
> 2.1.0
>=20
>=20
> From 4dbe8a0bc32d09ea82726d78cfd1292a3a6b3719 Mon Sep 17 00:00:00 2001
> From: Dan McGregor <danismostlikely@gmail.com>
> Date: Tue, 3 Feb 2015 18:46:42 -0600
> Subject: [meta-initramfs][PATCH 5/5] dracut: recipe cleanup
> To: openembedded-devel@lists.openembedded.org
>=20
> From: Dan McGregor <dan.mcgregor@usask.ca>
>=20
> Split out bash-completion data
> Update RDEPENDS: getopt is util-linux-getopt now
> Use distro_features_check to require systemd
> Recommend busybox
>=20
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  .../recipes-devtools/dracut/dracut_git.bb          | 25 ++++++++++++++++=
------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-=
initramfs/recipes-devtools/dracut/dracut_git.bb
> index ea55a4d..8ef0749 100644
> --- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> +++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> @@ -4,6 +4,8 @@ DESCRIPTION =3D "Dracut is an event driven initramfs infr=
astructure. dracut (the t
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> =20
> +PACKAGES =3D+ "${PN}-bash-completion"
> +
>  PE =3D "1"
>  PV =3D "038"
> =20
> @@ -13,8 +15,10 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/boot/dracut/=
dracut.git"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -do_configure() {
> -    ./configure --prefix=3D${prefix} \
> +inherit distro_features_check
> +REQUIRED_DISTRO_FEATURES =3D "systemd"
> +
> +EXTRA_OECONF =3D "--prefix=3D${prefix} \
>                  --libdir=3D${libdir} \
>                  --datadir=3D${datadir} \
>                  --sysconfdir=3D${sysconfdir} \
> @@ -23,20 +27,29 @@ do_configure() {
>                  --bindir=3D${bindir} \
>                  --includedir=3D${includedir} \
>                  --localstatedir=3D${localstatedir} \
> +                --systemdsystemunitdir=3D${systemd_unitdir}/system"
> +
> +do_configure() {
> +    ./configure ${EXTRA_OECONF}
>  }
> =20
>  do_install() {
>      oe_runmake install DESTDIR=3D${D}
>  }
> =20
> -FILES_${PN} +=3D "${datadir}/bash-completion \=20
> -                ${libdir}/kernel \
> +FILES_${PN}-bash-completion =3D "${datadir}/bash-completion"
> +
> +FILES_${PN} +=3D " ${libdir}/kernel \
> +                ${systemd_unitdir} \
>                 "
> +CONFFILES_${PN} +=3D "${sysconfdir}/dracut.conf"
> +
> +RDEPENDS_${PN} =3D "systemd findutils cpio util-linux-blkid util-linux-g=
etopt util-linux bash ldd"
> +RDEPENDS_${PN}-bash-completion =3D "bash-completion"
> =20
> -# 'getopt' is in the util-linux main package
> -RDEPENDS_${PN} =3D "systemd findutils cpio util-linux-blkid util-linux b=
ash ldd"
>  # This could be optimized a bit, but let's avoid non-booting systems :)
>  RRECOMMENDS_${PN} =3D " \
>                       kernel-modules \
> +                     busybox \
>                       coreutils \=20
>                      "
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTScxwACgkQN1Ujt2V2gBx5KwCfXp5h+DBtsCvrzJ3bdXbg1pLJ
FusAnAwYD+E5Hc/q7BaIPeoHzw4i7Kvn
=VaZr
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
