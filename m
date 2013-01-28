Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tzt16-0007Dk-QK
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 19:01:15 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so1610522pbc.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 09:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0bx+yzJZus1eSgmihHdwElsKbkgvvjS7tcihbDHpDIk=;
	b=HHJlBz/t2ODQwk4MCWkROnBI/7Z71Teu4UL49fpR8EjZ3q3vSK0isagRDLxVNJHFkd
	XGt5CNffrvizBGrP+R0BE/IlKH+Ow4dQ0i3x4opS5okTgGrig5Kjgch8h2b7sNQM1pBK
	VrTCWRYW0qcxuSfPr/87boZaPvpOJJWXTJQeRvS2u/IMrXEAuHjOSoc6Sg+V0u6GzDue
	PejIaCxI/pVveG0+X+N3b2qLtde8Z5mGNoc9h8BM7d/n//7Je7nzQqKVe5V7Kj+ahYld
	5JhJiedmSb6TrdaDf/weBUrvtvKNT2yHvEtym4X07EO7r13T/6XsTRjy23VLmM4UiGDb
	pANA==
X-Received: by 10.68.233.201 with SMTP id ty9mr40144448pbc.14.1359395132944;
	Mon, 28 Jan 2013 09:45:32 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qt2sm6683874pbb.24.2013.01.28.09.45.28
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:45:31 -0800 (PST)
Date: Mon, 28 Jan 2013 18:45:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130128174530.GE16904@jama.palm1.palmone.com>
References: <1359381032-24881-1-git-send-email-schnitzeltony@googlemail.com>
	<1359381032-24881-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1359381032-24881-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd/V2 1/4] systemd: remove core recipes - they migrated to oe-core
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
X-List-Received-Date: Mon, 28 Jan 2013 18:01:16 -0000
X-Groupsio-MsgNum: 42898
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="95nVhCDQCgPWiQqT"
Content-Disposition: inline

--95nVhCDQCgPWiQqT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2013 at 02:50:29PM +0100, Andreas M=FCller wrote:
> oe-core moved to systemd 197 so no package feeds should break

In case someone still cares about upgrade paths:

| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r packagegroup-shr-cli:
|  *    libsystemd-journal0 (>=3D v196-105-gdecd634) *    libudev1 (>=3D v1=
96-105-gdecd634) *       libudev1 (>=3D v196-105-gdecd634) *       libsyste=
md-daemon0 (>=3D v196-105-gdecd634) *     libude
v1 (>=3D v196-105-gdecd634) *     libudev1 (>=3D v196-105-gdecd634) *      =
 libudev1 (>=3D v196-105-gdecd634) *       libudev1 (>=3D v196-105-gdecd634=
) *       libudev1 (>=3D v196-105-gdecd634) *    l
ibudev1 (>=3D v196-105-gdecd634) *        libudev1 (>=3D v196-105-gdecd634)=
 *       libudev1 (>=3D v196-105-gdecd634) *
|  * opkg_install_cmd: Cannot install package packagegroup-shr-cli.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r packagegroup-shr-minimal-x:
|  *    libudev1 (>=3D v196-105-gdecd634) *       libudev1 (>=3D v196-105-g=
decd634) *       libudev1 (>=3D v196-105-gdecd634) *       libudev1 (>=3D v=
196-105-gdecd634) *       libudev1 (>=3D v196-105-
gdecd634) *     libudev1 (>=3D v196-105-gdecd634) *
|  * opkg_install_cmd: Cannot install package packagegroup-shr-minimal-x.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r packagegroup-shr-apps:
|  *    libudev1 (>=3D v196-105-gdecd634) *
|  * opkg_install_cmd: Cannot install package packagegroup-shr-apps.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r packagegroup-shr-gtk:
|  *    libsystemd-login0 (>=3D v196-105-gdecd634) *
|  * opkg_install_cmd: Cannot install package packagegroup-shr-gtk.

I guess that with OEBasicHash + PR service it builds fine because all stall=
ed references=20
get rebuilt, so only 22 ERRORs are shown when buildhistory is enabled:

ERROR: Package version for package udev-dbg went backwards which would brea=
k package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package udev went backwards which would break pa=
ckage feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package udev-consolekit went backwards which wou=
ld break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package udev-utils went backwards which would br=
eak package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package udev-systemd went backwards which would =
break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-gui went backwards which would b=
reak package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-vconsole-setup went backwards wh=
ich would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-initramfs went backwards which w=
ould break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-analyze went backwards which wou=
ld break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-dbg went backwards which would b=
reak package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-staticdev went backwards which w=
ould break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-dev went backwards which would b=
reak package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-doc went backwards which would b=
reak package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-locale went backwards which woul=
d break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd went backwards which would break=
 package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package libgudev-1.0 went backwards which would =
break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package libsystemd-daemon went backwards which w=
ould break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package libsystemd-id128 went backwards which wo=
uld break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package libsystemd-journal went backwards which =
would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package libsystemd-login went backwards which wo=
uld break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package libudev went backwards which would break=
 package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)

I don't care about upgrade paths anymore so much (because official builder =
will use
danny until next release), but I'll propose PE bump in oe-core.

Cheers,

> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-core/systemd/systemd-compat-units.bb   |   59 ----
>  .../systemd/systemd-compat-units/machineid.service |   16 -
>  .../systemd-compat-units/run-postinsts.service     |   17 -
>  .../recipes-core/systemd/systemd-serialgetty.bb    |   46 ---
>  .../systemd/systemd-serialgetty/LICENSE            |  339 --------------=
------
>  .../systemd-serialgetty/serial-getty@.service      |   32 --
>  .../systemd/systemd-systemctl-native.bb            |   18 -
>  .../systemd/systemd-systemctl-native/systemctl     |  126 --------
>  ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ------
>  ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ------
>  .../recipes-core/systemd/systemd/gtk-doc.make      |  230 -------------
>  .../recipes-core/systemd/systemd/modprobe.rules    |   17 -
>  .../systemd/systemd/optional_secure_getenv.patch   |   19 --
>  .../systemd-pam-configure-check-uclibc.patch       |   26 --
>  .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 --
>  .../systemd/systemd-pam-fix-fallocate.patch        |   82 -----
>  .../systemd/systemd-pam-fix-getty-unit.patch       |   35 --
>  .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ----------
>  .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 --------------=
-----
>  .../recipes-core/systemd/systemd/touchscreen.rules |   18 -
>  .../recipes-core/systemd/systemd/var-run.conf      |    4 -
>  meta-systemd/recipes-core/systemd/systemd_git.bb   |  263 ---------------
>  22 files changed, 0 insertions(+), 2068 deletions(-)
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-compat-unit=
s.bb
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-compat-unit=
s/machineid.service
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-compat-unit=
s/run-postinsts.service
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-serialgetty=
=2Ebb
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-serialgetty=
/LICENSE
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-serialgetty=
/serial-getty@.service
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd-systemctl-n=
ative.bb
>  delete mode 100755 meta-systemd/recipes-core/systemd/systemd-systemctl-n=
ative/systemctl
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/0001-Revert=
-systemd-analyze-use-argparse-instead-of-getop.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/0002-Revert=
-analyze-use-GDBus-instead-of-dbus-python.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/gtk-doc.make
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/modprobe.ru=
les
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/optional_se=
cure_getenv.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-configure-check-uclibc.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-execvpe.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-fallocate.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-getty-unit.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-mkostemp.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/systemd-pam=
-fix-msformat.patch
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/touchscreen=
=2Erules
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd/var-run.conf
>  delete mode 100644 meta-systemd/recipes-core/systemd/systemd_git.bb
>=20
> diff --git a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb b/=
meta-systemd/recipes-core/systemd/systemd-compat-units.bb
> deleted file mode 100644
> index 6b6b4dd..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -DESCRIPTION =3D "Units to make systemd work better with existing sysvini=
t scripts"
> -
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58"
> -
> -PR =3D "r18"
> -
> -inherit allarch
> -
> -SRC_URI =3D "file://*.service"
> -
> -do_install() {
> -	install -d ${D}${systemd_unitdir}/system/basic.target.wants
> -	install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
> -	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${systemd_unitdir}=
/system
> -	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/basic.tar=
get.wants/
> -	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/sysinit.t=
arget.wants/
> -
> -	install -m 0644 ${WORKDIR}/machineid.service ${D}${systemd_unitdir}/sys=
tem
> -	ln -sf ../machineid.service ${D}${systemd_unitdir}/system/sysinit.targe=
t.wants/
> -	ln -sf ../machineid.service ${D}${systemd_unitdir}/system/basic.target.=
wants/
> -
> -	# hack to make old style sysvinit postinsts succeed
> -	install -d ${D}${bindir}
> -	echo "echo 1" > ${D}${bindir}/runlevel
> -	chmod 0755 ${D}${bindir}/runlevel
> -}
> -
> -SYSTEMD_DISABLED_SYSV_SERVICES =3D " \
> -  busybox-udhcpc \
> -  dnsmasq \
> -  hwclock \
> -  networking \
> -  syslog \
> -  syslog.busybox \
> -"
> -
> -pkg_postinst_${PN} () {
> -cd $D${sysconfdir}/init.d
> -
> -echo "Disabling the following sysv scripts: "
> -
> -OPTS=3D""
> -
> -if [ -n "$D" ]; then
> -    OPTS=3D"--root=3D$D"
> -fi
> -
> -for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
> -    if [ \( -e $i -o $i.sh \) -a ! -e $D${sysconfdir}/systemd/system/$i.=
service ] ; then
> -        echo -n "$i: " ; systemctl ${OPTS} mask $i.service
> -    fi
> -done ; echo
> -}
> -
> -FILES_${PN} =3D "${systemd_unitdir}/system ${bindir}"
> -RDPEPENDS_${PN} =3D "systemd"
> -
> -
> diff --git a/meta-systemd/recipes-core/systemd/systemd-compat-units/machi=
neid.service b/meta-systemd/recipes-core/systemd/systemd-compat-units/machi=
neid.service
> deleted file mode 100644
> index cab8f76..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd-compat-units/machineid.se=
rvice
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -[Unit]
> -Description=3DMachine ID first boot configure
> -DefaultDependencies=3Dno
> -ConditionPathExists=3D|!/etc/machine-id
> -After=3Dremount-rootfs.service
> -Before=3Dsysinit.target
> -
> -[Service]
> -ExecStart=3D/bin/systemd-machine-id-setup
> -RemainAfterExit=3DNo
> -Type=3Doneshot
> -StandardOutput=3Dsyslog
> -
> -[Install]
> -WantedBy=3Dbasic.target
> -WantedBy=3Dsysinit.target
> diff --git a/meta-systemd/recipes-core/systemd/systemd-compat-units/run-p=
ostinsts.service b/meta-systemd/recipes-core/systemd/systemd-compat-units/r=
un-postinsts.service
> deleted file mode 100644
> index da6fe76..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd-compat-units/run-postinst=
s.service
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -[Unit]
> -Description=3DRun pending postinsts
> -DefaultDependencies=3Dno
> -ConditionPathExists=3D|/etc/rcS.d/S98run-postinsts
> -After=3Dremount-rootfs.service tmp.mount
> -Before=3Dsysinit.target
> -
> -[Service]
> -ExecStart=3D/etc/rcS.d/S98run-postinsts
> -RemainAfterExit=3DNo
> -Type=3Doneshot
> -StandardOutput=3Dsyslog
> -TimeoutSec=3D0
> -
> -[Install]
> -WantedBy=3Dbasic.target
> -WantedBy=3Dsysinit.target
> diff --git a/meta-systemd/recipes-core/systemd/systemd-serialgetty.bb b/m=
eta-systemd/recipes-core/systemd/systemd-serialgetty.bb
> deleted file mode 100644
> index c310672..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd-serialgetty.bb
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -DESCRIPTION =3D "Systemd serial config"
> -LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE;md5=3D751419260aa954499f=
7abaabaa882bbe"
> -
> -PR =3D "r3"
> -
> -SERIAL_CONSOLE ?=3D "115200 ttyS0"
> -
> -SRC_URI =3D "file://LICENSE \
> -           file://serial-getty@.service"
> -
> -def get_serial_console_value(d, index):
> -    c =3D d.getVar('SERIAL_CONSOLE', True)
> -
> -    if len(c):
> -        return c.split()[index]
> -
> -    return ""
> -
> -def get_baudrate(d):
> -    return get_serial_console_value(d, 0)
> -
> -def get_console(d):
> -    return get_serial_console_value(d, 1)
> -
> -do_install() {
> -	if [ ! ${@get_baudrate(d)} =3D "" ]; then
> -		sed -i -e s/\@BAUDRATE\@/${@get_baudrate(d)}/g ${WORKDIR}/serial-getty=
@.service
> -		install -d ${D}${systemd_unitdir}/system/
> -		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
> -		install ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/
> -
> -		# enable the service
> -		ln -sf ${systemd_unitdir}/system/serial-getty@.service \
> -			${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@${@g=
et_console(d)}.service
> -	fi
> -}
> -
> -PACKAGES =3D "${PN} ${PN}-dbg ${PN}-dev ${PN}-doc"
> -
> -RRECOMMENDS_${PN} =3D ""
> -RDEPENDS_${PN} =3D "systemd"
> -
> -# This is a machine specific file
> -FILES_${PN} =3D "${systemd_unitdir}/system/serial-getty@.service ${sysco=
nfdir}"
> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta-systemd/recipes-core/systemd/systemd-serialgetty/LICENS=
E b/meta-systemd/recipes-core/systemd/systemd-serialgetty/LICENSE
> deleted file mode 100644
> index d511905..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd-serialgetty/LICENSE
> +++ /dev/null
> @@ -1,339 +0,0 @@
> -		    GNU GENERAL PUBLIC LICENSE
> -		       Version 2, June 1991
> -
> - Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
> - 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> - Everyone is permitted to copy and distribute verbatim copies
> - of this license document, but changing it is not allowed.
> -
> -			    Preamble
> -
> -  The licenses for most software are designed to take away your
> -freedom to share and change it.  By contrast, the GNU General Public
> -License is intended to guarantee your freedom to share and change free
> -software--to make sure the software is free for all its users.  This
> -General Public License applies to most of the Free Software
> -Foundation's software and to any other program whose authors commit to
> -using it.  (Some other Free Software Foundation software is covered by
> -the GNU Lesser General Public License instead.)  You can apply it to
> -your programs, too.
> -
> -  When we speak of free software, we are referring to freedom, not
> -price.  Our General Public Licenses are designed to make sure that you
> -have the freedom to distribute copies of free software (and charge for
> -this service if you wish), that you receive source code or can get it
> -if you want it, that you can change the software or use pieces of it
> -in new free programs; and that you know you can do these things.
> -
> -  To protect your rights, we need to make restrictions that forbid
> -anyone to deny you these rights or to ask you to surrender the rights.
> -These restrictions translate to certain responsibilities for you if you
> -distribute copies of the software, or if you modify it.
> -
> -  For example, if you distribute copies of such a program, whether
> -gratis or for a fee, you must give the recipients all the rights that
> -you have.  You must make sure that they, too, receive or can get the
> -source code.  And you must show them these terms so they know their
> -rights.
> -
> -  We protect your rights with two steps: (1) copyright the software, and
> -(2) offer you this license which gives you legal permission to copy,
> -distribute and/or modify the software.
> -
> -  Also, for each author's protection and ours, we want to make certain
> -that everyone understands that there is no warranty for this free
> -software.  If the software is modified by someone else and passed on, we
> -want its recipients to know that what they have is not the original, so
> -that any problems introduced by others will not reflect on the original
> -authors' reputations.
> -
> -  Finally, any free program is threatened constantly by software
> -patents.  We wish to avoid the danger that redistributors of a free
> -program will individually obtain patent licenses, in effect making the
> -program proprietary.  To prevent this, we have made it clear that any
> -patent must be licensed for everyone's free use or not licensed at all.
> -
> -  The precise terms and conditions for copying, distribution and
> -modification follow.
> -
> -		    GNU GENERAL PUBLIC LICENSE
> -   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
> -
> -  0. This License applies to any program or other work which contains
> -a notice placed by the copyright holder saying it may be distributed
> -under the terms of this General Public License.  The "Program", below,
> -refers to any such program or work, and a "work based on the Program"
> -means either the Program or any derivative work under copyright law:
> -that is to say, a work containing the Program or a portion of it,
> -either verbatim or with modifications and/or translated into another
> -language.  (Hereinafter, translation is included without limitation in
> -the term "modification".)  Each licensee is addressed as "you".
> -
> -Activities other than copying, distribution and modification are not
> -covered by this License; they are outside its scope.  The act of
> -running the Program is not restricted, and the output from the Program
> -is covered only if its contents constitute a work based on the
> -Program (independent of having been made by running the Program).
> -Whether that is true depends on what the Program does.
> -
> -  1. You may copy and distribute verbatim copies of the Program's
> -source code as you receive it, in any medium, provided that you
> -conspicuously and appropriately publish on each copy an appropriate
> -copyright notice and disclaimer of warranty; keep intact all the
> -notices that refer to this License and to the absence of any warranty;
> -and give any other recipients of the Program a copy of this License
> -along with the Program.
> -
> -You may charge a fee for the physical act of transferring a copy, and
> -you may at your option offer warranty protection in exchange for a fee.
> -
> -  2. You may modify your copy or copies of the Program or any portion
> -of it, thus forming a work based on the Program, and copy and
> -distribute such modifications or work under the terms of Section 1
> -above, provided that you also meet all of these conditions:
> -
> -    a) You must cause the modified files to carry prominent notices
> -    stating that you changed the files and the date of any change.
> -
> -    b) You must cause any work that you distribute or publish, that in
> -    whole or in part contains or is derived from the Program or any
> -    part thereof, to be licensed as a whole at no charge to all third
> -    parties under the terms of this License.
> -
> -    c) If the modified program normally reads commands interactively
> -    when run, you must cause it, when started running for such
> -    interactive use in the most ordinary way, to print or display an
> -    announcement including an appropriate copyright notice and a
> -    notice that there is no warranty (or else, saying that you provide
> -    a warranty) and that users may redistribute the program under
> -    these conditions, and telling the user how to view a copy of this
> -    License.  (Exception: if the Program itself is interactive but
> -    does not normally print such an announcement, your work based on
> -    the Program is not required to print an announcement.)
> -
> -These requirements apply to the modified work as a whole.  If
> -identifiable sections of that work are not derived from the Program,
> -and can be reasonably considered independent and separate works in
> -themselves, then this License, and its terms, do not apply to those
> -sections when you distribute them as separate works.  But when you
> -distribute the same sections as part of a whole which is a work based
> -on the Program, the distribution of the whole must be on the terms of
> -this License, whose permissions for other licensees extend to the
> -entire whole, and thus to each and every part regardless of who wrote it.
> -
> -Thus, it is not the intent of this section to claim rights or contest
> -your rights to work written entirely by you; rather, the intent is to
> -exercise the right to control the distribution of derivative or
> -collective works based on the Program.
> -
> -In addition, mere aggregation of another work not based on the Program
> -with the Program (or with a work based on the Program) on a volume of
> -a storage or distribution medium does not bring the other work under
> -the scope of this License.
> -
> -  3. You may copy and distribute the Program (or a work based on it,
> -under Section 2) in object code or executable form under the terms of
> -Sections 1 and 2 above provided that you also do one of the following:
> -
> -    a) Accompany it with the complete corresponding machine-readable
> -    source code, which must be distributed under the terms of Sections
> -    1 and 2 above on a medium customarily used for software interchange;=
 or,
> -
> -    b) Accompany it with a written offer, valid for at least three
> -    years, to give any third party, for a charge no more than your
> -    cost of physically performing source distribution, a complete
> -    machine-readable copy of the corresponding source code, to be
> -    distributed under the terms of Sections 1 and 2 above on a medium
> -    customarily used for software interchange; or,
> -
> -    c) Accompany it with the information you received as to the offer
> -    to distribute corresponding source code.  (This alternative is
> -    allowed only for noncommercial distribution and only if you
> -    received the program in object code or executable form with such
> -    an offer, in accord with Subsection b above.)
> -
> -The source code for a work means the preferred form of the work for
> -making modifications to it.  For an executable work, complete source
> -code means all the source code for all modules it contains, plus any
> -associated interface definition files, plus the scripts used to
> -control compilation and installation of the executable.  However, as a
> -special exception, the source code distributed need not include
> -anything that is normally distributed (in either source or binary
> -form) with the major components (compiler, kernel, and so on) of the
> -operating system on which the executable runs, unless that component
> -itself accompanies the executable.
> -
> -If distribution of executable or object code is made by offering
> -access to copy from a designated place, then offering equivalent
> -access to copy the source code from the same place counts as
> -distribution of the source code, even though third parties are not
> -compelled to copy the source along with the object code.
> -
> -  4. You may not copy, modify, sublicense, or distribute the Program
> -except as expressly provided under this License.  Any attempt
> -otherwise to copy, modify, sublicense or distribute the Program is
> -void, and will automatically terminate your rights under this License.
> -However, parties who have received copies, or rights, from you under
> -this License will not have their licenses terminated so long as such
> -parties remain in full compliance.
> -
> -  5. You are not required to accept this License, since you have not
> -signed it.  However, nothing else grants you permission to modify or
> -distribute the Program or its derivative works.  These actions are
> -prohibited by law if you do not accept this License.  Therefore, by
> -modifying or distributing the Program (or any work based on the
> -Program), you indicate your acceptance of this License to do so, and
> -all its terms and conditions for copying, distributing or modifying
> -the Program or works based on it.
> -
> -  6. Each time you redistribute the Program (or any work based on the
> -Program), the recipient automatically receives a license from the
> -original licensor to copy, distribute or modify the Program subject to
> -these terms and conditions.  You may not impose any further
> -restrictions on the recipients' exercise of the rights granted herein.
> -You are not responsible for enforcing compliance by third parties to
> -this License.
> -
> -  7. If, as a consequence of a court judgment or allegation of patent
> -infringement or for any other reason (not limited to patent issues),
> -conditions are imposed on you (whether by court order, agreement or
> -otherwise) that contradict the conditions of this License, they do not
> -excuse you from the conditions of this License.  If you cannot
> -distribute so as to satisfy simultaneously your obligations under this
> -License and any other pertinent obligations, then as a consequence you
> -may not distribute the Program at all.  For example, if a patent
> -license would not permit royalty-free redistribution of the Program by
> -all those who receive copies directly or indirectly through you, then
> -the only way you could satisfy both it and this License would be to
> -refrain entirely from distribution of the Program.
> -
> -If any portion of this section is held invalid or unenforceable under
> -any particular circumstance, the balance of the section is intended to
> -apply and the section as a whole is intended to apply in other
> -circumstances.
> -
> -It is not the purpose of this section to induce you to infringe any
> -patents or other property right claims or to contest validity of any
> -such claims; this section has the sole purpose of protecting the
> -integrity of the free software distribution system, which is
> -implemented by public license practices.  Many people have made
> -generous contributions to the wide range of software distributed
> -through that system in reliance on consistent application of that
> -system; it is up to the author/donor to decide if he or she is willing
> -to distribute software through any other system and a licensee cannot
> -impose that choice.
> -
> -This section is intended to make thoroughly clear what is believed to
> -be a consequence of the rest of this License.
> -
> -  8. If the distribution and/or use of the Program is restricted in
> -certain countries either by patents or by copyrighted interfaces, the
> -original copyright holder who places the Program under this License
> -may add an explicit geographical distribution limitation excluding
> -those countries, so that distribution is permitted only in or among
> -countries not thus excluded.  In such case, this License incorporates
> -the limitation as if written in the body of this License.
> -
> -  9. The Free Software Foundation may publish revised and/or new versions
> -of the General Public License from time to time.  Such new versions will
> -be similar in spirit to the present version, but may differ in detail to
> -address new problems or concerns.
> -
> -Each version is given a distinguishing version number.  If the Program
> -specifies a version number of this License which applies to it and "any
> -later version", you have the option of following the terms and conditions
> -either of that version or of any later version published by the Free
> -Software Foundation.  If the Program does not specify a version number of
> -this License, you may choose any version ever published by the Free Soft=
ware
> -Foundation.
> -
> -  10. If you wish to incorporate parts of the Program into other free
> -programs whose distribution conditions are different, write to the author
> -to ask for permission.  For software which is copyrighted by the Free
> -Software Foundation, write to the Free Software Foundation; we sometimes
> -make exceptions for this.  Our decision will be guided by the two goals
> -of preserving the free status of all derivatives of our free software and
> -of promoting the sharing and reuse of software generally.
> -
> -			    NO WARRANTY
> -
> -  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRAN=
TY
> -FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
> -OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
> -PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS=
ED
> -OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> -MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
> -TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
> -PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
> -REPAIR OR CORRECTION.
> -
> -  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRIT=
ING
> -WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
> -REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGE=
S,
> -INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARIS=
ING
> -OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
> -TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
> -YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTH=
ER
> -PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
> -POSSIBILITY OF SUCH DAMAGES.
> -
> -		     END OF TERMS AND CONDITIONS
> -
> -	    How to Apply These Terms to Your New Programs
> -
> -  If you develop a new program, and you want it to be of the greatest
> -possible use to the public, the best way to achieve this is to make it
> -free software which everyone can redistribute and change under these ter=
ms.
> -
> -  To do so, attach the following notices to the program.  It is safest
> -to attach them to the start of each source file to most effectively
> -convey the exclusion of warranty; and each file should have at least
> -the "copyright" line and a pointer to where the full notice is found.
> -
> -    <one line to give the program's name and a brief idea of what it doe=
s.>
> -    Copyright (C) <year>  <name of author>
> -
> -    This program is free software; you can redistribute it and/or modify
> -    it under the terms of the GNU General Public License as published by
> -    the Free Software Foundation; either version 2 of the License, or
> -    (at your option) any later version.
> -
> -    This program is distributed in the hope that it will be useful,
> -    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -    GNU General Public License for more details.
> -
> -    You should have received a copy of the GNU General Public License al=
ong
> -    with this program; if not, write to the Free Software Foundation, In=
c.,
> -    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -
> -Also add information on how to contact you by electronic and paper mail.
> -
> -If the program is interactive, make it output a short notice like this
> -when it starts in an interactive mode:
> -
> -    Gnomovision version 69, Copyright (C) year name of author
> -    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `sho=
w w'.
> -    This is free software, and you are welcome to redistribute it
> -    under certain conditions; type `show c' for details.
> -
> -The hypothetical commands `show w' and `show c' should show the appropri=
ate
> -parts of the General Public License.  Of course, the commands you use may
> -be called something other than `show w' and `show c'; they could even be
> -mouse-clicks or menu items--whatever suits your program.
> -
> -You should also get your employer (if you work as a programmer) or your
> -school, if any, to sign a "copyright disclaimer" for the program, if
> -necessary.  Here is a sample; alter the names:
> -
> -  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
> -  `Gnomovision' (which makes passes at compilers) written by James Hacke=
r.
> -
> -  <signature of Ty Coon>, 1 April 1989
> -  Ty Coon, President of Vice
> -
> -This General Public License does not permit incorporating your program i=
nto
> -proprietary programs.  If your program is a subroutine library, you may
> -consider it more useful to permit linking proprietary applications with =
the
> -library.  If this is what you want to do, use the GNU Lesser General
> -Public License instead of this License.
> diff --git a/meta-systemd/recipes-core/systemd/systemd-serialgetty/serial=
-getty@.service b/meta-systemd/recipes-core/systemd/systemd-serialgetty/ser=
ial-getty@.service
> deleted file mode 100644
> index 8eeaab6..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd-serialgetty/serial-getty@=
=2Eservice
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -#  This file is part of systemd.
> -#
> -#  systemd is free software; you can redistribute it and/or modify it
> -#  under the terms of the GNU General Public License as published by
> -#  the Free Software Foundation; either version 2 of the License, or
> -#  (at your option) any later version.
> -
> -[Unit]
> -Description=3DSerial Getty on %I
> -BindTo=3Ddev-%i.device
> -After=3Ddev-%i.device systemd-user-sessions.service
> -
> -# If additional gettys are spawned during boot then we should make
> -# sure that this is synchronized before getty.target, even though
> -# getty.target didn't actually pull it in.
> -Before=3Dgetty.target
> -
> -[Service]
> -Environment=3DTERM=3Dvt100
> -ExecStart=3D-/sbin/agetty -s %I @BAUDRATE@
> -Restart=3Dalways
> -RestartSec=3D0
> -UtmpIdentifier=3D%I
> -TTYPath=3D/dev/%I
> -TTYReset=3Dyes
> -TTYVHangup=3Dyes
> -KillMode=3Dprocess
> -IgnoreSIGPIPE=3Dno
> -
> -# Some login implementations ignore SIGTERM, so we send SIGHUP
> -# instead, to ensure that login terminates cleanly.
> -KillSignal=3DSIGHUP
> diff --git a/meta-systemd/recipes-core/systemd/systemd-systemctl-native.b=
b b/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
> deleted file mode 100644
> index c9c3317..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -DESCRIPTION =3D "Wrapper to enable of systemd services"
> -
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58"
> -
> -PR =3D "r7"
> -
> -inherit native
> -
> -# BPN is not enough in this case
> -FILESPATH =3D "${FILE_DIRNAME}/${PN}/"
> -
> -SRC_URI =3D "file://systemctl"
> -
> -do_install() {
> -	install -d ${D}${bindir}
> -	install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
> -}
> diff --git a/meta-systemd/recipes-core/systemd/systemd-systemctl-native/s=
ystemctl b/meta-systemd/recipes-core/systemd/systemd-systemctl-native/syste=
mctl
> deleted file mode 100755
> index d71c7ed..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd-systemctl-native/systemctl
> +++ /dev/null
> @@ -1,126 +0,0 @@
> -#!/bin/sh
> -echo "Started $0 $*"
> -
> -ROOT=3D
> -
> -# parse command line params
> -action=3D
> -while [ $# !=3D 0 ]; do
> -	opt=3D"$1"
> -
> -	case "$opt" in
> -		enable)
> -			shift
> -
> -			action=3D"$opt"
> -			services=3D"$1"
> -			cmd_args=3D"1"
> -			shift
> -			;;
> -		disable)
> -			shift
> -
> -			action=3D"$opt"
> -			services=3D"$1"
> -			cmd_args=3D"1"
> -			shift
> -			;;
> -		mask)
> -			shift
> -
> -			action=3D"$opt"
> -			services=3D"$1"
> -			cmd_args=3D"1"
> -			shift
> -			;;
> -		--root=3D*)
> -			ROOT=3D${opt##--root=3D}
> -			cmd_args=3D"0"
> -			shift
> -			;;
> -		*)
> -			if [ "$cmd_args" =3D "1" ]; then
> -				services=3D"$services $opt"=20
> -				shift
> -			else
> -				echo "'$opt' is an unkown option; exiting with error"
> -				exit 1
> -			fi
> -			;;
> -	esac
> -done
> -
> -for service in $services; do
> -	if [ "$action" =3D "mask" ]; then
> -		if [ ! -d $ROOT/etc/systemd/system/ ]; then
> -			mkdir -p $ROOT/etc/systemd/system/
> -		fi
> -		cmd=3D"ln -s /dev/null $ROOT/etc/systemd/system/$service"
> -		echo "$cmd"
> -		$cmd
> -		exit 0
> -	fi
> -
> -	echo "Try to find location of $service..."
> -	# find service file
> -	for p in $ROOT/etc/systemd/system \
> -		 $ROOT/lib/systemd/system \
> -		 $ROOT/usr/lib/systemd/system; do
> -		if [ -e $p/$service ]; then
> -			service_file=3D$p/$service
> -			service_file=3D${service_file##$ROOT}
> -		fi
> -	done
> -	if [ -z "$service_file" ]; then
> -		echo "'$service' couldn't be found; exiting with error"
> -		exit 1
> -	fi
> -	echo "Found $service in $service_file"
> -
> -	# create the required symbolic links
> -	wanted_by=3D$(grep WantedBy $ROOT/$service_file \
> -		        | sed 's,WantedBy=3D,,g' \
> -		        | tr ',' '\n' \
> -		        | grep '\(\.target$\)\|\(\.service$\)')
> -
> -	for r in $wanted_by; do
> -		echo "WantedBy=3D$r found in $service"
> -		if [ "$action" =3D "enable" ]; then
> -			mkdir -p $ROOT/etc/systemd/system/$r.wants
> -			ln -s $service_file $ROOT/etc/systemd/system/$r.wants
> -			echo "Enabled $service for $wanted_by."
> -		else
> -			rm -f $ROOT/etc/systemd/system/$r.wants/$service
> -			rmdir --ignore-fail-on-non-empty -p $ROOT/etc/systemd/system/$r.wants
> -			echo "Disabled $service for $wanted_by."
> -		fi
> -	done
> -
> -	# create the required symbolic 'Alias' links
> -	alias=3D$(grep Alias $ROOT/$service_file \
> -		        | sed 's,Alias=3D,,g' \
> -		        | tr ',' '\n' \
> -		        | grep '\.service$')
> -
> -	for r in $alias; do
> -		if [ "$action" =3D "enable" ]; then
> -			mkdir -p $ROOT/etc/systemd/system
> -			ln -s $service_file $ROOT/etc/systemd/system/$r
> -			echo "Enabled $service for $alias."
> -		else
> -			rm -f $ROOT/etc/systemd/system/$r
> -			echo "Disabled $service for $alias."
> -		fi
> -	done
> -
> -	# call us for the other required scripts
> -	also=3D$(grep Also $ROOT/$service_file \
> -		   | sed 's,Also=3D,,g' \
> -		   | tr ',' '\n')
> -	for a in $also; do
> -		echo "Also=3D$a found in $service"
> -		if [ "$action" =3D "enable" ]; then
> -			$0 --root=3D$ROOT enable $a
> -		fi
> -	done
> -done
> diff --git a/meta-systemd/recipes-core/systemd/systemd/0001-Revert-system=
d-analyze-use-argparse-instead-of-getop.patch b/meta-systemd/recipes-core/s=
ystemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.pa=
tch
> deleted file mode 100644
> index 7de2705..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd/0001-Revert-systemd-analy=
ze-use-argparse-instead-of-getop.patch
> +++ /dev/null
> @@ -1,103 +0,0 @@
> -From 2003e63f48cee2f497de7b90b66284f98c1c9919 Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Mon, 10 Dec 2012 12:24:32 +0100
> -Subject: [PATCH 1/2] Revert "systemd-analyze: use argparse instead of ge=
topt"
> -
> -This reverts commit 0c0271841ab45595f71528c50bcf1904d4b841d5.
> -
> -Argparse is broken in current OE python
> ----
> - src/analyze/systemd-analyze |   60 ++++++++++++++++++++++++++++--------=
-------
> - 1 files changed, 39 insertions(+), 21 deletions(-)
> -
> -diff --git a/src/analyze/systemd-analyze b/src/analyze/systemd-analyze
> -index 88699d6..87a83dd 100755
> ---- a/src/analyze/systemd-analyze
> -+++ b/src/analyze/systemd-analyze
> -@@ -1,7 +1,6 @@
> - #!/usr/bin/python
> -=20
> --import sys, os
> --import argparse
> -+import getopt, sys, os
> - from gi.repository import Gio
> - try:
> -         import cairo
> -@@ -76,6 +75,20 @@ def draw_text(context, x, y, text, size =3D 12, r =3D=
 0, g =3D 0, b =3D 0, vcenter =3D 0.5
> -=20
> -         context.restore()
> -=20
> -+def usage():
> -+        sys.stdout.write("""systemd-analyze [--user] time
> -+systemd-analyze [--user] blame
> -+systemd-analyze [--user] plot
> -+
> -+Process systemd profiling information
> -+
> -+  -h --help         Show this help
> -+""")
> -+
> -+def help():
> -+        usage()
> -+        sys.exit()
> -+
> - def time():
> -=20
> -         initrd_time, start_time, finish_time =3D acquire_start_time()
> -@@ -266,29 +279,34 @@ def plot():
> -=20
> -         surface.finish()
> -=20
> --parser =3D argparse.ArgumentParser(formatter_class=3Dargparse.RawDescri=
ptionHelpFormatter,
> --                                 description=3D'Process systemd profili=
ng information',
> --                                 epilog=3D'''\
> --time - print time spent in the kernel before reaching userspace
> --blame - print list of running units ordered by time to init
> --plot - output SVG graphic showing service initialization
> --''')
> --
> --parser.add_argument('action', choices=3D('time', 'blame', 'plot'),
> --                    default=3D'time', nargs=3D'?',
> --                    help=3D'action to perform (default: time)')
> --parser.add_argument('--user', action=3D'store_true',
> --                    help=3D'use the session bus')
> -+def unknown_verb():
> -+        sys.stderr.write("Unknown verb '%s'.\n" % args[0])
> -+        usage()
> -+        sys.exit(1)
> -=20
> --args =3D parser.parse_args()
> -+bus =3D Gio.BusType.SYSTEM
> -=20
> --if args.user:
> --        bus =3D Gio.BusType.SESSION
> --else:
> --        bus =3D Gio.BusType.SYSTEM
> -+try:
> -+        opts, args =3D getopt.gnu_getopt(sys.argv[1:], "h", ["help", "u=
ser"])
> -+except getopt.GetoptError as err:
> -+        sys.stdout.write(str(err) + "\n")
> -+        usage()
> -+        sys.exit(2)
> -+for o, a in opts:
> -+        if o in ("-h", "--help"):
> -+                help()
> -+        elif o =3D=3D '--user':
> -+                bus =3D Gio.BusType.SESSION
> -+        else:
> -+                assert False, "unhandled option"
> -=20
> - verb =3D {'time' : time,
> - 	'blame': blame,
> - 	'plot' : plot,
> -+	'help' : help,
> - 	}
> --verb.get(args.action)()
> -+
> -+if len(args) =3D=3D 0:
> -+        time()
> -+else:
> -+        verb.get(args[0], unknown_verb)()
> ---=20
> -1.7.7.6
> -
> diff --git a/meta-systemd/recipes-core/systemd/systemd/0002-Revert-analyz=
e-use-GDBus-instead-of-dbus-python.patch b/meta-systemd/recipes-core/system=
d/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
> deleted file mode 100644
> index e5e8d7d..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd/0002-Revert-analyze-use-G=
DBus-instead-of-dbus-python.patch
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -From 8079db861b8ffdce69fa10a9ab9ef4740045187f Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Mon, 10 Dec 2012 12:25:00 +0100
> -Subject: [PATCH 2/2] Revert "analyze: use GDBus instead of dbus-python"
> -
> -This reverts commit 4940c64240541e91411620b7dc0963e012aa6b91.
> -
> -Python-gobject is too old in current OE
> ----
> - src/analyze/systemd-analyze |   31 ++++++++++++++-----------------
> - 1 files changed, 14 insertions(+), 17 deletions(-)
> -
> -diff --git a/src/analyze/systemd-analyze b/src/analyze/systemd-analyze
> -index 87a83dd..636fd74 100755
> ---- a/src/analyze/systemd-analyze
> -+++ b/src/analyze/systemd-analyze
> -@@ -1,15 +1,14 @@
> - #!/usr/bin/python
> -=20
> --import getopt, sys, os
> --from gi.repository import Gio
> -+import getopt, dbus, sys, os
> - try:
> -         import cairo
> - except ImportError:
> -         cairo =3D None
> -=20
> - def acquire_time_data():
> --        manager =3D Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFl=
ags.NONE,
> --                None, 'org.freedesktop.systemd1', '/org/freedesktop/sys=
temd1', 'org.freedesktop.systemd1.Manager', None)
> -+
> -+        manager =3D dbus.Interface(bus.get_object('org.freedesktop.syst=
emd1', '/org/freedesktop/systemd1'), 'org.freedesktop.systemd1.Manager')
> -         units =3D manager.ListUnits()
> -=20
> -         l =3D []
> -@@ -18,25 +17,23 @@ def acquire_time_data():
> -                 if i[5] !=3D "":
> -                         continue
> -=20
> --                properties =3D Gio.DBusProxy.new_for_bus_sync(bus, Gio.=
DBusProxyFlags.NONE,
> --                        None, 'org.freedesktop.systemd1', i[6], 'org.fr=
eedesktop.DBus.Properties', None)
> -+                properties =3D dbus.Interface(bus.get_object('org.freed=
esktop.systemd1', i[6]), 'org.freedesktop.DBus.Properties')
> -=20
> --                ixt =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Unit', 'InactiveExitTimestampMonotonic')
> --                aet =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Unit', 'ActiveEnterTimestampMonotonic')
> --                axt =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Unit', 'ActiveExitTimestampMonotonic')
> --                iet =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Unit', 'InactiveEnterTimestampMonotonic')
> -+                ixt =3D int(properties.Get('org.freedesktop.systemd1.Un=
it', 'InactiveExitTimestampMonotonic'))
> -+                aet =3D int(properties.Get('org.freedesktop.systemd1.Un=
it', 'ActiveEnterTimestampMonotonic'))
> -+                axt =3D int(properties.Get('org.freedesktop.systemd1.Un=
it', 'ActiveExitTimestampMonotonic'))
> -+                iet =3D int(properties.Get('org.freedesktop.systemd1.Un=
it', 'InactiveEnterTimestampMonotonic'))
> -=20
> -                 l.append((str(i[0]), ixt, aet, axt, iet))
> -=20
> -         return l
> -=20
> - def acquire_start_time():
> --        properties =3D Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProx=
yFlags.NONE,
> --                None, 'org.freedesktop.systemd1', '/org/freedesktop/sys=
temd1', 'org.freedesktop.DBus.Properties', None)
> -+        properties =3D dbus.Interface(bus.get_object('org.freedesktop.s=
ystemd1', '/org/freedesktop/systemd1'), 'org.freedesktop.DBus.Properties')
> -=20
> --        initrd_time =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Manager', 'InitRDTimestampMonotonic')
> --        userspace_time =3D properties.Get('(ss)', 'org.freedesktop.syst=
emd1.Manager', 'UserspaceTimestampMonotonic')
> --        finish_time =3D properties.Get('(ss)', 'org.freedesktop.systemd=
1.Manager', 'FinishTimestampMonotonic')
> -+        initrd_time =3D int(properties.Get('org.freedesktop.systemd1.Ma=
nager', 'InitRDTimestampMonotonic'))
> -+        userspace_time =3D int(properties.Get('org.freedesktop.systemd1=
=2EManager', 'UserspaceTimestampMonotonic'))
> -+        finish_time =3D int(properties.Get('org.freedesktop.systemd1.Ma=
nager', 'FinishTimestampMonotonic'))
> -=20
> -         if finish_time =3D=3D 0:
> -                 sys.stderr.write("Bootup is not yet finished. Please tr=
y again later.\n")
> -@@ -284,7 +281,7 @@ def unknown_verb():
> -         usage()
> -         sys.exit(1)
> -=20
> --bus =3D Gio.BusType.SYSTEM
> -+bus =3D dbus.SystemBus()
> -=20
> - try:
> -         opts, args =3D getopt.gnu_getopt(sys.argv[1:], "h", ["help", "u=
ser"])
> -@@ -296,7 +293,7 @@ for o, a in opts:
> -         if o in ("-h", "--help"):
> -                 help()
> -         elif o =3D=3D '--user':
> --                bus =3D Gio.BusType.SESSION
> -+                bus =3D dbus.SessionBus()
> -         else:
> -                 assert False, "unhandled option"
> -=20
> ---=20
> -1.7.7.6
> -
> diff --git a/meta-systemd/recipes-core/systemd/systemd/gtk-doc.make b/met=
a-systemd/recipes-core/systemd/systemd/gtk-doc.make
> deleted file mode 100644
> index 57fab98..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd/gtk-doc.make
> +++ /dev/null
> @@ -1,230 +0,0 @@
> -# -*- mode: makefile -*-
> -
> -####################################
> -# Everything below here is generic #
> -####################################
> -
> -if GTK_DOC_USE_LIBTOOL
> -GTKDOC_CC =3D $(LIBTOOL) --tag=3DCC --mode=3Dcompile $(CC) $(INCLUDES) $=
(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
> -GTKDOC_LD =3D $(LIBTOOL) --tag=3DCC --mode=3Dlink $(CC) $(AM_CFLAGS) $(C=
FLAGS) $(AM_LDFLAGS) $(LDFLAGS)
> -GTKDOC_RUN =3D $(LIBTOOL) --mode=3Dexecute
> -else
> -GTKDOC_CC =3D $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) =
$(CFLAGS)
> -GTKDOC_LD =3D $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
> -GTKDOC_RUN =3D
> -endif
> -
> -# We set GPATH here; this gives us semantics for GNU make
> -# which are more like other make's VPATH, when it comes to
> -# whether a source that is a target of one rule is then
> -# searched for in VPATH/GPATH.
> -#
> -GPATH =3D $(srcdir)
> -
> -TARGET_DIR=3D$(HTML_DIR)/$(DOC_MODULE)
> -
> -EXTRA_DIST =3D 				\
> -	$(content_files)		\
> -	$(HTML_IMAGES)			\
> -	$(DOC_MAIN_SGML_FILE)		\
> -	$(DOC_MODULE)-sections.txt	\
> -	$(DOC_MODULE)-overrides.txt
> -
> -DOC_STAMPS=3Dscan-build.stamp tmpl-build.stamp sgml-build.stamp html-bui=
ld.stamp \
> -	pdf-build.stamp \
> -	$(srcdir)/tmpl.stamp $(srcdir)/sgml.stamp $(srcdir)/html.stamp \
> -	$(srcdir)/pdf.stamp
> -
> -SCANOBJ_FILES =3D 		 \
> -	$(DOC_MODULE).args 	 \
> -	$(DOC_MODULE).hierarchy  \
> -	$(DOC_MODULE).interfaces \
> -	$(DOC_MODULE).prerequisites \
> -	$(DOC_MODULE).signals
> -
> -REPORT_FILES =3D \
> -	$(DOC_MODULE)-undocumented.txt \
> -	$(DOC_MODULE)-undeclared.txt \
> -	$(DOC_MODULE)-unused.txt
> -
> -CLEANFILES =3D $(SCANOBJ_FILES) $(REPORT_FILES) $(DOC_STAMPS)
> -
> -if ENABLE_GTK_DOC
> -if GTK_DOC_BUILD_HTML
> -HTML_BUILD_STAMP=3Dhtml-build.stamp
> -else
> -HTML_BUILD_STAMP=3D
> -endif
> -if GTK_DOC_BUILD_PDF
> -PDF_BUILD_STAMP=3Dpdf-build.stamp
> -else
> -PDF_BUILD_STAMP=3D
> -endif
> -
> -all-local: $(HTML_BUILD_STAMP) $(PDF_BUILD_STAMP)
> -else
> -all-local:
> -endif
> -
> -docs: $(HTML_BUILD_STAMP) $(PDF_BUILD_STAMP)
> -
> -$(REPORT_FILES): sgml-build.stamp
> -
> -#### scan ####
> -
> -scan-build.stamp: $(HFILE_GLOB) $(CFILE_GLOB)
> -	@echo 'gtk-doc: Scanning header files'
> -	@-chmod -R u+w $(srcdir)
> -	@_source_dir=3D'' ; for i in $(DOC_SOURCE_DIR) ; do \
> -	    _source_dir=3D"$${_source_dir} --source-dir=3D$$i" ; \
> -	  done ; \
> -	  cd $(srcdir) && \
> -	  gtkdoc-scan --module=3D$(DOC_MODULE) --ignore-headers=3D"$(IGNORE_HFI=
LES)" $${_source_dir} $(SCAN_OPTIONS) $(EXTRA_HFILES)
> -	@if grep -l '^..*$$' $(srcdir)/$(DOC_MODULE).types > /dev/null 2>&1 ; t=
hen \
> -	    CC=3D"$(GTKDOC_CC)" LD=3D"$(GTKDOC_LD)" RUN=3D"$(GTKDOC_RUN)" CFLAG=
S=3D"$(GTKDOC_CFLAGS) $(CFLAGS)" LDFLAGS=3D"$(GTKDOC_LIBS) $(LDFLAGS)" gtkd=
oc-scangobj $(SCANGOBJ_OPTIONS) --module=3D$(DOC_MODULE) --output-dir=3D$(s=
rcdir) ; \
> -	else \
> -	    cd $(srcdir) ; \
> -	    for i in $(SCANOBJ_FILES) ; do \
> -               test -f $$i || touch $$i ; \
> -	    done \
> -	fi
> -	@touch scan-build.stamp
> -
> -$(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC=
_MODULE)-overrides.txt: scan-build.stamp
> -	@true
> -
> -#### templates ####
> -
> -tmpl-build.stamp: $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-=
sections.txt $(DOC_MODULE)-overrides.txt
> -	@echo 'gtk-doc: Rebuilding template files'
> -	@-chmod -R u+w $(srcdir)
> -	@cd $(srcdir) && gtkdoc-mktmpl --module=3D$(DOC_MODULE) $(MKTMPL_OPTION=
S)
> -	@touch tmpl-build.stamp
> -
> -tmpl.stamp: tmpl-build.stamp
> -	@true
> -
> -$(srcdir)/tmpl/*.sgml:
> -	@true
> -
> -#### xml ####
> -
> -sgml-build.stamp: tmpl.stamp $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*=
=2Esgml $(expand_content_files)
> -	@echo 'gtk-doc: Building XML'
> -	@-chmod -R u+w $(srcdir)
> -	@_source_dir=3D'' ; for i in $(DOC_SOURCE_DIR) ; do \
> -	    _source_dir=3D"$${_source_dir} --source-dir=3D$$i" ; \
> -	  done ; \
> -	  cd $(srcdir) && \
> -	  gtkdoc-mkdb --module=3D$(DOC_MODULE) --output-format=3Dxml --expand-c=
ontent-files=3D"$(expand_content_files)" --main-sgml-file=3D$(DOC_MAIN_SGML=
_FILE) $${_source_dir} $(MKDB_OPTIONS)
> -	@touch sgml-build.stamp
> -
> -sgml.stamp: sgml-build.stamp
> -	@true
> -
> -#### html ####
> -
> -html-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
> -	@echo 'gtk-doc: Building HTML'
> -	@-chmod -R u+w $(srcdir)
> -	@rm -rf $(srcdir)/html
> -	@mkdir $(srcdir)/html
> -	@mkhtml_options=3D""; \
> -	gtkdoc-mkhtml 2>&1 --help | grep  >/dev/null "\-\-path"; \
> -	if test "$(?)" =3D "0"; then \
> -	  mkhtml_options=3D--path=3D"$(srcdir)"; \
> -	fi; \
> -	cd $(srcdir)/html && gtkdoc-mkhtml $$mkhtml_options $(MKHTML_OPTIONS) $=
(DOC_MODULE) ../$(DOC_MAIN_SGML_FILE)
> -	@test "x$(HTML_IMAGES)" =3D "x" || ( cd $(srcdir) && cp $(HTML_IMAGES) =
html )
> -	@echo 'gtk-doc: Fixing cross-references'
> -	@cd $(srcdir) && gtkdoc-fixxref --module=3D$(DOC_MODULE) --module-dir=
=3Dhtml --html-dir=3D$(HTML_DIR) $(FIXXREF_OPTIONS)
> -	@touch html-build.stamp
> -
> -#### pdf ####
> -
> -pdf-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
> -	@echo 'gtk-doc: Building PDF'
> -	@-chmod -R u+w $(srcdir)
> -	@rm -rf $(srcdir)/$(DOC_MODULE).pdf
> -	@mkpdf_imgdirs=3D""; \
> -	if test "x$(HTML_IMAGES)" !=3D "x"; then \
> -	  for img in $(HTML_IMAGES); do \
> -	    part=3D`dirname $$img`; \
> -	    echo $$mkpdf_imgdirs | grep >/dev/null "\-\-imgdir=3D$$part "; \
> -	    if test $$? !=3D 0; then \
> -	      mkpdf_imgdirs=3D"$$mkpdf_imgdirs --imgdir=3D$$part"; \
> -	    fi; \
> -	  done; \
> -	fi; \
> -	cd $(srcdir) && gtkdoc-mkpdf --path=3D"$(abs_srcdir)" $$mkpdf_imgdirs $=
(DOC_MODULE) $(DOC_MAIN_SGML_FILE) $(MKPDF_OPTIONS)
> -	@touch pdf-build.stamp
> -
> -##############
> -
> -clean-local:
> -	rm -f *~ *.bak
> -	rm -rf .libs
> -
> -distclean-local:
> -	cd $(srcdir) && \
> -	  rm -rf xml $(REPORT_FILES) $(DOC_MODULE).pdf \
> -	         $(DOC_MODULE)-decl-list.txt $(DOC_MODULE)-decl.txt
> -
> -maintainer-clean-local: clean
> -	cd $(srcdir) && rm -rf xml html
> -
> -install-data-local:
> -	@installfiles=3D`echo $(srcdir)/html/*`; \
> -	if test "$$installfiles" =3D '$(srcdir)/html/*'; \
> -	then echo '-- Nothing to install' ; \
> -	else \
> -	  if test -n "$(DOC_MODULE_VERSION)"; then \
> -	    installdir=3D"$(DESTDIR)$(TARGET_DIR)-$(DOC_MODULE_VERSION)"; \
> -	  else \
> -	    installdir=3D"$(DESTDIR)$(TARGET_DIR)"; \
> -	  fi; \
> -	  $(mkinstalldirs) $${installdir} ; \
> -	  for i in $$installfiles; do \
> -	    echo '-- Installing '$$i ; \
> -	    $(INSTALL_DATA) $$i $${installdir}; \
> -	  done; \
> -	  if test -n "$(DOC_MODULE_VERSION)"; then \
> -	    mv -f $${installdir}/$(DOC_MODULE).devhelp2 \
> -	      $${installdir}/$(DOC_MODULE)-$(DOC_MODULE_VERSION).devhelp2; \
> -	    mv -f $${installdir}/$(DOC_MODULE).devhelp \
> -	      $${installdir}/$(DOC_MODULE)-$(DOC_MODULE_VERSION).devhelp; \
> -	  fi; \
> -	  $(GTKDOC_REBASE) --relative --dest-dir=3D$(DESTDIR) --html-dir=3D$${i=
nstalldir}; \
> -	fi
> -
> -uninstall-local:
> -	@if test -n "$(DOC_MODULE_VERSION)"; then \
> -	  installdir=3D"$(DESTDIR)$(TARGET_DIR)-$(DOC_MODULE_VERSION)"; \
> -	else \
> -	  installdir=3D"$(DESTDIR)$(TARGET_DIR)"; \
> -	fi; \
> -	rm -rf $${installdir}
> -
> -#
> -# Require gtk-doc when making dist
> -#
> -if ENABLE_GTK_DOC
> -dist-check-gtkdoc:
> -else
> -dist-check-gtkdoc:
> -	@echo "*** gtk-doc must be installed and enabled in order to make dist"
> -	@false
> -endif
> -
> -dist-hook: dist-check-gtkdoc dist-hook-local
> -	mkdir $(distdir)/tmpl
> -	mkdir $(distdir)/html
> -	-cp $(srcdir)/tmpl/*.sgml $(distdir)/tmpl
> -	cp $(srcdir)/html/* $(distdir)/html
> -	-cp $(srcdir)/$(DOC_MODULE).pdf $(distdir)/
> -	-cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
> -	-cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
> -	cd $(distdir) && rm -f $(DISTCLEANFILES)
> -	$(GTKDOC_REBASE) --online --relative --html-dir=3D$(distdir)/html
> -
> -.PHONY : dist-hook-local docs
> diff --git a/meta-systemd/recipes-core/systemd/systemd/modprobe.rules b/m=
eta-systemd/recipes-core/systemd/systemd/modprobe.rules
> deleted file mode 100644
> index d4a096b..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd/modprobe.rules
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -# There are a number of modifiers that are allowed to be used in some
> -# of the different fields. They provide the following subsitutions:
> -#
> -# %n the "kernel number" of the device.
> -#    For example, 'sda3' has a "kernel number" of '3'
> -# %e the smallest number for that name which does not matches an existin=
g node
> -# %k the kernel name for the device
> -# %M the kernel major number for the device
> -# %m the kernel minor number for the device
> -# %b the bus id for the device
> -# %c the string returned by the PROGRAM
> -# %s{filename} the content of a sysfs attribute
> -# %% the '%' char itself
> -#
> -
> -# Try and modprobe for drivers for new hardware
> -ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*", R=
UN+=3D"/sbin/modprobe $env{MODALIAS}"
> diff --git a/meta-systemd/recipes-core/systemd/systemd/optional_secure_ge=
tenv.patch b/meta-systemd/recipes-core/systemd/systemd/optional_secure_gete=
nv.patch
> deleted file mode 100644
> index 35f1467..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd/optional_secure_getenv.pa=
tch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -on uclibc secure_getenv is not available
> -therefore default to using getenv instead
> -
> -Singed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -Index: git/src/shared/missing.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/shared/missing.h	2012-09-22 18:46:44.141282145 -0700
> -+++ git/src/shared/missing.h	2012-09-22 18:48:44.081276570 -0700
> -@@ -233,6 +233,8 @@
> - #ifndef HAVE_SECURE_GETENV
> - #  ifdef HAVE___SECURE_GETENV
> - #    define secure_getenv __secure_getenv
> -+#  elif defined __UCLIBC__
> -+#    define secure_getenv getenv
> - #  else
> - #    error neither secure_getenv nor __secure_getenv are available
> - #  endif
> diff --git a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-config=
ure-check-uclibc.patch b/meta-systemd/recipes-core/systemd/systemd/systemd-=
pam-configure-check-uclibc.patch
> deleted file mode 100644
> index 1bfc3bd..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-configure-che=
ck-uclibc.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> ---- systemd-185.orig/configure.ac	2012-06-04 14:15:16.000000000 -0400
> -+++ systemd-pam-185/configure.ac	2012-06-21 22:57:10.000000000 -0400
> -@@ -63,6 +63,23 @@
> -=20
> - AC_PATH_PROG([M4], [m4])
> -=20
> -+# check for few functions not implemented in uClibc
> -+
> -+AC_CHECK_FUNCS_ONCE(mkostemp execvpe posix_fallocate)
> -+
> -+# check for %ms format support - assume always no if cross compiling
> -+
> -+AC_MSG_CHECKING([whether %ms format is supported by *scanf])
> -+
> -+AC_RUN_IFELSE(
> -+	[AC_LANG_PROGRAM([[ include <stdio.h> ]],
> -+			[[ char *buf1, *buf2, *buf3, str=3D"1 2.3 abcde" ;
> -+			   int rc =3D sscanf(str, "%ms %ms %ms", &buf1, &buf2, &buf3) ;
> -+			   return (rc=3D=3D3)?0:1;]])],
> -+	[AC_DEFINE([HAVE_MSFORMAT], [1], [Define if %ms format is supported by=
 *scanf.])],
> -+	[AC_MSG_RESULT([no])],
> -+	[AC_MSG_RESULT([no])])
> -+
> - # gtkdocize greps for '^GTK_DOC_CHECK', so it needs to be on its own li=
ne
> - m4_ifdef([GTK_DOC_CHECK], [
> - GTK_DOC_CHECK([1.18],[--flavour no-tmpl])
> diff --git a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-ex=
ecvpe.patch b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-exe=
cvpe.patch
> deleted file mode 100644
> index 449c27f..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.p=
atch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Index: git/src/nspawn/nspawn.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/nspawn/nspawn.c	2012-09-22 17:57:05.000000000 -0700
> -+++ git/src/nspawn/nspawn.c	2012-09-22 18:01:41.541405768 -0700
> -@@ -63,6 +63,8 @@
> -         LINK_GUEST
> - } LinkJournal;
> -=20
> -+#include "config.h"
> -+
> - static char *arg_directory =3D NULL;
> - static char *arg_user =3D NULL;
> - static char **arg_controllers =3D NULL;
> -@@ -1373,7 +1375,12 @@
> -                                 a[0] =3D (char*) "/sbin/init";
> -                                 execve(a[0], a, (char**) envp);
> -                         } else if (argc > optind)
> -+#ifdef HAVE_EXECVPE
> -                                 execvpe(argv[optind], argv + optind, (c=
har**) envp);
> -+#else
> -+                                environ =3D (char **)envp;
> -+                                execvp(argv[optind], argv + optind);
> -+#endif /* HAVE_EXECVPE */		=09
> -                         else {
> -                                 chdir(home ? home : "/root");
> -                                 execle("/bin/bash", "-bash", NULL, (cha=
r**) envp);
> diff --git a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-fa=
llocate.patch b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-f=
allocate.patch
> deleted file mode 100644
> index 089ba64..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-fallocate=
=2Epatch
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -Index: git/src/journal/journal-file.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/journal/journal-file.c	2012-09-02 09:49:15.126089594 -0=
700
> -+++ git/src/journal/journal-file.c	2012-09-02 09:49:17.118089670 -0700
> -@@ -34,6 +34,8 @@
> - #include "compress.h"
> - #include "fsprg.h"
> -=20
> -+#include "config.h"
> -+
> - #define DEFAULT_DATA_HASH_TABLE_SIZE (2047ULL*sizeof(HashItem))
> - #define DEFAULT_FIELD_HASH_TABLE_SIZE (333ULL*sizeof(HashItem))
> -=20
> -@@ -262,7 +264,7 @@
> -=20
> - static int journal_file_allocate(JournalFile *f, uint64_t offset, uint6=
4_t size) {
> -         uint64_t old_size, new_size;
> --        int r;
> -+        int r =3D 0;
> -=20
> -         assert(f);
> -=20
> -@@ -307,10 +309,25 @@
> -         /* Note that the glibc fallocate() fallback is very
> -            inefficient, hence we try to minimize the allocation area
> -            as we can. */
> -+#ifdef HAVE_POSIX_ALLOCATE
> -         r =3D posix_fallocate(f->fd, old_size, new_size - old_size);
> -         if (r !=3D 0)
> -                 return -r;
> -=20
> -+#else
> -+	/* Use good old method to write zeros into the journal file
> -+	   perhaps very inefficient yet working. */
> -+	if(new_size > old_size) {
> -+		char *buf =3D alloca(new_size - old_size);
> -+		off_t oldpos =3D lseek(f->fd, 0, SEEK_CUR);
> -+		bzero(buf, new_size - old_size);
> -+		lseek(f->fd, old_size, SEEK_SET);
> -+		r =3D write(f->fd, buf, new_size - old_size);
> -+		lseek(f->fd, oldpos, SEEK_SET);
> -+	}
> -+	if (r < 0)
> -+		return -errno;
> -+#endif /* HAVE_POSIX_FALLOCATE */
> -         if (fstat(f->fd, &f->last_stat) < 0)
> -                 return -errno;
> -=20
> -Index: git/src/journal/journald-kmsg.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/journal/journald-kmsg.c	2012-09-02 09:49:15.130089595 -=
0700
> -+++ git/src/journal/journald-kmsg.c	2012-09-02 12:26:17.326447895 -0700
> -@@ -404,6 +404,7 @@
> -=20
> - int server_open_kernel_seqnum(Server *s) {
> -         int fd;
> -+	int r =3D 0;
> -         uint64_t *p;
> -=20
> -         assert(s);
> -@@ -417,8 +418,19 @@
> -                 log_error("Failed to open /run/systemd/journal/kernel-s=
eqnum, ignoring: %m");
> -                 return 0;
> -         }
> --
> --        if (posix_fallocate(fd, 0, sizeof(uint64_t)) < 0) {
> -+#ifdef HAVE_POSIX_ALLOCATE
> -+        r =3D posix_fallocate(fd, 0, sizeof(uint64_t));
> -+#else
> -+	/* Use good old method to write zeros into the journal file
> -+	   perhaps very inefficient yet working. */
> -+	char *buf =3D alloca(sizeof(uint64_t));
> -+	off_t oldpos =3D lseek(fd, 0, SEEK_CUR);
> -+	bzero(buf, sizeof(uint64_t));
> -+	lseek(fd, 0, SEEK_SET);
> -+	r =3D write(fd, buf, sizeof(uint64_t));
> -+	lseek(fd, oldpos, SEEK_SET);
> -+#endif /* HAVE_POSIX_FALLOCATE */
> -+	if (r < 0) {
> -                 log_error("Failed to allocate sequential number file, i=
gnoring: %m");
> -                 close_nointr_nofail(fd);
> -                 return 0;
> diff --git a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-ge=
tty-unit.patch b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-=
getty-unit.patch
> deleted file mode 100644
> index 3e5ea71..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-getty-uni=
t.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -Prefer getty to agetty in console setup systemd units
> -
> -Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ----
> - units/getty@.service.m4        |    2 +-
> - units/serial-getty@.service.m4 |    2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -Index: systemd-37/units/getty@.service.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- systemd-37.orig/units/getty@.service.m4
> -+++ systemd-37/units/getty@.service.m4
> -@@ -41,7 +41,7 @@
> -=20
> - [Service]
> - Environment=3DTERM=3Dlinux
> - # the VT is cleared by TTYVTDisallocate
> --ExecStart=3D-/sbin/agetty --noclear %I 38400
> -+ExecStart=3D-/sbin/getty -L %I 115200 linux
> - Type=3Didle
> - Restart=3Dalways
> - RestartSec=3D0
> -Index: systemd-37/units/serial-getty@.service.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- systemd-37.orig/units/serial-getty@.service.m4
> -+++ systemd-37/units/serial-getty@.service.m4
> -@@ -37,7 +37,7 @@
> -=20
> - [Service]
> - Environment=3DTERM=3Dvt102
> --ExecStart=3D-/sbin/agetty -s %I 115200,38400,9600
> -+ExecStart=3D-/sbin/getty -L %I 115200 vt100
> - Type=3Didle
> - Restart=3Dalways
> - RestartSec=3D0
> diff --git a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-mk=
ostemp.patch b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-mk=
ostemp.patch
> deleted file mode 100644
> index 8de9a3a..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.=
patch
> +++ /dev/null
> @@ -1,166 +0,0 @@
> -Index: git/src/journal/journal-send.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/journal/journal-send.c	2012-09-02 00:10:08.748768268 -0=
700
> -+++ git/src/journal/journal-send.c	2012-09-02 00:10:10.508768335 -0700
> -@@ -34,6 +34,8 @@
> -=20
> - #define SNDBUF_SIZE (8*1024*1024)
> -=20
> -+#include "config.h"
> -+
> - /* We open a single fd, and we'll share it with the current process,
> -  * all its threads, and all its subprocesses. This means we need to
> -  * initialize it atomically, and need to operate on it atomically
> -@@ -293,7 +295,12 @@
> -          * file and just pass a file descriptor of it to the other
> -          * side */
> -=20
> -+#ifdef HAVE_MKOSTEMP
> -         buffer_fd =3D mkostemp(path, O_CLOEXEC|O_RDWR);
> -+#else
> -+	buffer_fd =3D mkstemp(path);
> -+	if (buffer_fd >=3D 0) fcntl(buffer_fd, F_SETFD, FD_CLOEXEC);
> -+#endif	/* HAVE_MKOSTEMP */
> -         if (buffer_fd < 0) {
> -                 r =3D -errno;
> -                 goto finish;
> -Index: git/src/core/manager.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/core/manager.c	2012-09-02 00:10:08.732768266 -0700
> -+++ git/src/core/manager.c	2012-09-02 00:10:10.512768334 -0700
> -@@ -67,6 +67,8 @@
> - #include "cgroup-util.h"
> - #include "path-util.h"
> -=20
> -+#include "config.h"
> -+
> - /* As soon as 16 units are in our GC queue, make sure to run a gc sweep=
 */
> - #define GC_QUEUE_ENTRIES_MAX 16
> -=20
> -@@ -1701,7 +1703,12 @@
> -                 return -ENOMEM;
> -=20
> -         saved_umask =3D umask(0077);
> -+#ifdef HAVE_MKOSTEMP
> -         fd =3D mkostemp(path, O_RDWR|O_CLOEXEC);
> -+#else
> -+	fd =3D mkstemp(path);
> -+	if (fd >=3D 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
> -+#endif	/* HAVE_MKOSTEMP */
> -         umask(saved_umask);
> -=20
> -         if (fd < 0) {
> -Index: git/src/shared/util.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/shared/util.c	2012-09-02 00:10:08.784768269 -0700
> -+++ git/src/shared/util.c	2012-09-02 00:10:10.512768334 -0700
> -@@ -68,6 +68,8 @@
> - #include "exit-status.h"
> - #include "hashmap.h"
> -=20
> -+#include "config.h"
> -+
> - int saved_argc =3D 0;
> - char **saved_argv =3D NULL;
> -=20
> -@@ -4519,7 +4521,12 @@
> -         t[k] =3D '.';
> -         stpcpy(stpcpy(t+k+1, fn), "XXXXXX");
> -=20
> -+#ifdef HAVE_MKOSTEMP
> -         fd =3D mkostemp(t, O_WRONLY|O_CLOEXEC);
> -+#else
> -+	fd =3D mkstemp(t);
> -+	if (fd >=3D 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
> -+#endif	/* HAVE_MKOSTEMP */
> -         if (fd < 0) {
> -                 free(t);
> -                 return -errno;
> -Index: git/src/shared/ask-password-api.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/shared/ask-password-api.c	2012-09-02 00:10:08.772768268=
 -0700
> -+++ git/src/shared/ask-password-api.c	2012-09-02 00:10:10.512768334 -0700
> -@@ -37,6 +37,8 @@
> -=20
> - #include "ask-password-api.h"
> -=20
> -+#include "config.h"
> -+
> - static void backspace_chars(int ttyfd, size_t p) {
> -=20
> -         if (ttyfd < 0)
> -@@ -326,7 +328,12 @@
> -         mkdir_p_label("/run/systemd/ask-password", 0755);
> -=20
> -         u =3D umask(0022);
> -+#ifdef HAVE_MKOSTEMP
> -         fd =3D mkostemp(temp, O_CLOEXEC|O_CREAT|O_WRONLY);
> -+#else
> -+	fd =3D mkstemp(temp);
> -+	if (fd >=3D 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
> -+#endif	/* HAVE_MKOSTEMP */
> -         umask(u);
> -=20
> -         if (fd < 0) {
> -Index: git/src/journal/journalctl.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/journal/journalctl.c	2012-09-02 00:10:08.752768267 -0700
> -+++ git/src/journal/journalctl.c	2012-09-02 00:18:41.928787779 -0700
> -@@ -540,7 +540,13 @@
> -         n /=3D arg_interval;
> -=20
> -         close_nointr_nofail(fd);
> -+#ifdef HAVE_MKOSTEMP
> -         fd =3D mkostemp(k, O_WRONLY|O_CLOEXEC|O_NOCTTY);
> -+#else
> -+	fd =3D mkstemp(k);
> -+	if (fd >=3D 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
> -+#endif /* HAVE_MKOSTEMP */
> -+
> -         if (fd < 0) {
> -                 log_error("Failed to open %s: %m", k);
> -                 r =3D -errno;
> -Index: git/src/journal/journal-verify.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/journal/journal-verify.c	2012-09-02 00:10:08.752768267 =
-0700
> -+++ git/src/journal/journal-verify.c	2012-09-02 00:24:10.268800268 -0700
> -@@ -693,8 +693,12 @@
> - #endif
> -         } else if (f->seal)
> -                 return -ENOKEY;
> --
> -+#ifdef HAVE_MKOSTEMP
> -         data_fd =3D mkostemp(data_path, O_CLOEXEC);
> -+#else
> -+	data_fd =3D mkstemp(data_path);
> -+	if (data_fd >=3D 0) fcntl(data_fd, F_SETFD, FD_CLOEXEC);
> -+#endif	/* HAVE_MKOSTEMP */
> -         if (data_fd < 0) {
> -                 log_error("Failed to create data file: %m");
> -                 r =3D -errno;
> -@@ -702,7 +706,12 @@
> -         }
> -         unlink(data_path);
> -=20
> -+#ifdef HAVE_MKOSTEMP
> -         entry_fd =3D mkostemp(entry_path, O_CLOEXEC);
> -+#else
> -+	entry_fd =3D mkstemp(entry_path);
> -+	if (entry_fd >=3D 0) fcntl(entry_fd, F_SETFD, FD_CLOEXEC);
> -+#endif	/* HAVE_MKOSTEMP */
> -         if (entry_fd < 0) {
> -                 log_error("Failed to create entry file: %m");
> -                 r =3D -errno;
> -@@ -710,7 +719,12 @@
> -         }
> -         unlink(entry_path);
> -=20
> -+#ifdef HAVE_MKOSTEMP
> -         entry_array_fd =3D mkostemp(entry_array_path, O_CLOEXEC);
> -+#else
> -+	entry_array_fd =3D mkstemp(entry_array_path);
> -+	if (entry_array_fd >=3D 0) fcntl(entry_array_fd, F_SETFD, FD_CLOEXEC);
> -+#endif  /* HAVE_MKOSTEMP */
> -         if (entry_array_fd < 0) {
> -                 log_error("Failed to create entry array file: %m");
> -                 r =3D -errno;
> diff --git a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-ms=
format.patch b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-ms=
format.patch
> deleted file mode 100644
> index ee63329..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-msformat.=
patch
> +++ /dev/null
> @@ -1,335 +0,0 @@
> ---- systemd-pam-185/src/fsck/fsck.c.orig	2012-06-22 23:22:22.000000000 -=
0400
> -+++ systemd-pam-185/src/fsck/fsck.c	2012-06-22 21:15:56.000000000 -0400
> -@@ -36,6 +36,8 @@
> - #include "bus-errors.h"
> - #include "virt.h"
> -=20
> -+#include "config.h"
> -+
> - static bool arg_skip =3D false;
> - static bool arg_force =3D false;
> - static bool arg_show_progress =3D false;
> -@@ -193,9 +195,16 @@
> -                 char *device;
> -                 double p;
> -                 usec_t t;
> --
> -+#ifdef HAVE_MSFORMAT
> -                 if (fscanf(f, "%i %lu %lu %ms", &pass, &cur, &max, &dev=
ice) !=3D 4)
> --                        break;
> -+#else
> -+		device =3D malloc(257);
> -+		if (fscanf(f, "%i %lu %lu %256s", &pass, &cur, &max, device) !=3D 4) {
> -+			free(device);
> -+		}
> -+
> -+#endif /* HAVE_MSFORMAT */
> -+			break;
> -=20
> -                 /* Only show one progress counter at max */
> -                 if (!locked) {
> ---- systemd-pam-185/src/core/swap.c.orig	2012-06-22 23:22:55.000000000 -=
0400
> -+++ systemd-pam-185/src/core/swap.c	2012-06-22 21:17:10.000000000 -0400
> -@@ -40,6 +40,8 @@
> - #include "def.h"
> - #include "path-util.h"
> -=20
> -+#include "config.h"
> -+
> - static const UnitActiveState state_translation_table[_SWAP_STATE_MAX] =
=3D {
> -         [SWAP_DEAD] =3D UNIT_INACTIVE,
> -         [SWAP_ACTIVATING] =3D UNIT_ACTIVATING,
> -@@ -1038,7 +1040,7 @@
> -         for (i =3D 1;; i++) {
> -                 char *dev =3D NULL, *d;
> -                 int prio =3D 0, k;
> --
> -+#ifdef HAVE_MSFORMAT
> -                 if ((k =3D fscanf(m->proc_swaps,
> -                                 "%ms "  /* device/file */
> -                                 "%*s "  /* type of swap */
> -@@ -1046,10 +1048,18 @@
> -                                 "%*s "  /* used */
> -                                 "%i\n", /* priority */
> -                                 &dev, &prio)) !=3D 2) {
> --
> -+#else
> -+		dev =3D malloc(257);
> -+                if ((k =3D fscanf(m->proc_swaps,
> -+                                "%256s "   /* device/file */
> -+                                "%*s "  /* type of swap */
> -+                                "%*s "  /* swap size */
> -+                                "%*s "  /* used */
> -+                                "%i\n", /* priority */
> -+                                dev, &prio)) !=3D 2) {
> -+#endif /* HAVE_MSFORMAT */
> -                         if (k =3D=3D EOF)
> -                                 break;
> --
> -                         log_warning("Failed to parse /proc/swaps:%u.", =
i);
> -                         free(dev);
> -                         continue;
> ---- systemd-pam-185/src/core/mount-setup.c.orig	2012-06-22 23:23:41.0000=
00000 -0400
> -+++ systemd-pam-185/src/core/mount-setup.c	2012-06-22 21:19:44.000000000=
 -0400
> -@@ -28,6 +28,7 @@
> - #include <assert.h>
> - #include <unistd.h>
> - #include <ftw.h>
> -+#include <linux/fs.h>
> -
> - #include "mount-setup.h"
> - #include "dev-setup.h"
> -@@ -41,6 +41,8 @@
> - #include "path-util.h"
> - #include "missing.h"
> -=20
> -+#include "config.h"
> -+
> - #ifndef TTY_GID
> - #define TTY_GID 5
> - #endif
> -@@ -200,9 +202,12 @@
> -         for (;;) {
> -                 char *controller;
> -                 int enabled =3D 0;
> --
> -+#ifdef HAVE_MSFORMAT
> -                 if (fscanf(f, "%ms %*i %*i %i", &controller, &enabled) =
!=3D 2) {
> --
> -+#else
> -+		controller =3D malloc(257);
> -+                if (fscanf(f, "%256s %*i %*i %i", controller, &enabled)=
 !=3D 2) {
> -+#endif /* HAVE_MSFORMAT */
> -                         if (feof(f))
> -                                 break;
> -=20
> ---- systemd-pam-185/src/core/mount.c.orig	2012-06-22 23:24:17.000000000 =
-0400
> -+++ systemd-pam-185/src/core/mount.c	2012-06-22 22:51:21.000000000 -0400
> -@@ -41,6 +41,8 @@
> - #include "exit-status.h"
> - #include "def.h"
> -=20
> -+#include "config.h"
> -+
> - static const UnitActiveState state_translation_table[_MOUNT_STATE_MAX] =
=3D {
> -         [MOUNT_DEAD] =3D UNIT_INACTIVE,
> -         [MOUNT_MOUNTING] =3D UNIT_ACTIVATING,
> -@@ -1514,7 +1516,7 @@
> -                 int k;
> -=20
> -                 device =3D path =3D options =3D options2 =3D fstype =3D=
 d =3D p =3D o =3D NULL;
> --
> -+#ifdef HAVE_MSFORMAT
> -                 if ((k =3D fscanf(m->proc_self_mountinfo,
> -                                 "%*s "       /* (1) mount id */
> -                                 "%*s "       /* (2) parent id */
> -@@ -1533,7 +1535,31 @@
> -                                 &fstype,
> -                                 &device,
> -                                 &options2)) !=3D 5) {
> --
> -+#else
> -+		path =3D malloc(257);
> -+		options =3D malloc(257);
> -+		fstype =3D malloc(257);
> -+		device =3D malloc(257);
> -+		options2 =3D malloc(257);
> -+                if ((k =3D fscanf(m->proc_self_mountinfo,
> -+                                "%*s "       /* (1) mount id */
> -+                                "%*s "       /* (2) parent id */
> -+                                "%*s "       /* (3) major:minor */
> -+                                "%*s "       /* (4) root */
> -+                                "%256s "     /* (5) mount point */
> -+                                "%256s"      /* (6) mount options */
> -+                                "%*[^-]"     /* (7) optional fields */
> -+                                "- "         /* (8) separator */
> -+                                "%256s "     /* (9) file system type */
> -+                                "%256s"      /* (10) mount source */
> -+                                "%256s"      /* (11) mount options 2 */
> -+                                "%*[^\n]",   /* some rubbish at the end=
 */
> -+                                path,
> -+                                options,
> -+                                fstype,
> -+                                device,
> -+                                options2)) !=3D 5) {
> -+#endif /* HAVE_MSFORMAT */
> -                         if (k =3D=3D EOF)
> -                                 break;
> -=20
> ---- systemd-pam-185/src/core/umount.c.orig	2012-06-22 23:24:37.000000000=
 -0400
> -+++ systemd-pam-185/src/core/umount.c	2012-06-22 22:56:15.000000000 -0400
> -@@ -35,6 +35,8 @@
> - #include "path-util.h"
> - #include "util.h"
> -=20
> -+#include "config.h"
> -+
> - typedef struct MountPoint {
> -         char *path;
> -         dev_t devnum;
> -@@ -74,7 +76,7 @@
> -                 MountPoint *m;
> -=20
> -                 path =3D p =3D NULL;
> --
> -+#ifdef HAVE_MSFORMAT
> -                 if ((k =3D fscanf(proc_self_mountinfo,
> -                                 "%*s "       /* (1) mount id */
> -                                 "%*s "       /* (2) parent id */
> -@@ -89,6 +91,23 @@
> -                                 "%*s"        /* (11) mount options 2 */
> -                                 "%*[^\n]",   /* some rubbish at the end=
 */
> -                                 &path)) !=3D 1) {
> -+#else
> -+		path =3D malloc(257);
> -+                if ((k =3D fscanf(proc_self_mountinfo,
> -+                                "%*s "       /* (1) mount id */
> -+                                "%*s "       /* (2) parent id */
> -+                                "%*s "       /* (3) major:minor */
> -+                                "%*s "       /* (4) root */
> -+                                "%256s "     /* (5) mount point */
> -+                                "%*s"        /* (6) mount options */
> -+                                "%*[^-]"     /* (7) optional fields */
> -+                                "- "         /* (8) separator */
> -+                                "%*s "       /* (9) file system type */
> -+                                "%*s"        /* (10) mount source */
> -+                                "%*s"        /* (11) mount options 2 */
> -+                                "%*[^\n]",   /* some rubbish at the end=
 */
> -+                                path)) !=3D 1) {
> -+#endif /* HAVE_MSFORMAT */
> -                         if (k =3D=3D EOF)
> -                                 break;
> -=20
> -@@ -150,7 +169,7 @@
> -                 MountPoint *swap;
> -                 char *dev =3D NULL, *d;
> -                 int k;
> --
> -+#ifdef HAVE_MSFORMAT
> -                 if ((k =3D fscanf(proc_swaps,
> -                                 "%ms " /* device/file */
> -                                 "%*s " /* type of swap */
> -@@ -158,7 +177,16 @@
> -                                 "%*s " /* used */
> -                                 "%*s\n", /* priority */
> -                                 &dev)) !=3D 1) {
> --
> -+#else
> -+		dev =3D malloc(257);
> -+                if ((k =3D fscanf(proc_swaps,
> -+                                "%256s " /* device/file */
> -+                                "%*s " /* type of swap */
> -+                                "%*s " /* swap size */
> -+                                "%*s " /* used */
> -+                                "%*s\n", /* priority */
> -+                                dev)) !=3D 1) {
> -+#endif /* HAVE_MSFORMAT */
> -                         if (k =3D=3D EOF)
> -                                 break;
> -=20
> ---- systemd-pam-185/src/shared/socket-util.c.orig	2012-06-22 23:25:00.00=
0000000 -0400
> -+++ systemd-pam-185/src/shared/socket-util.c	2012-06-22 22:59:27.0000000=
00 -0400
> -@@ -39,6 +39,8 @@
> - #include "socket-util.h"
> - #include "missing.h"
> -=20
> -+#include "config.h"
> -+
> - int socket_address_parse(SocketAddress *a, const char *s) {
> -         int r;
> -         char *e, *n;
> -@@ -201,8 +203,16 @@
> -         a->type =3D SOCK_RAW;
> -=20
> -         errno =3D 0;
> --        if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
> -+#ifdef HAVE_MSFORMAT
> -+	if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
> -+                return errno ? -errno : -EINVAL;
> -+#else
> -+	sfamily =3D malloc(257);
> -+	if (sscanf(s, "%256s %u", sfamily, &group) < 1) {
> -+		free(sfamily);
> -                 return errno ? -errno : -EINVAL;
> -+	}
> -+#endif /* HAVE_MSFORMAT */
> -=20
> -         if ((family =3D netlink_family_from_string(sfamily)) < 0)
> -                 if (safe_atoi(sfamily, &family) < 0) {
> ---- systemd-pam-185/src/tmpfiles/tmpfiles.c.orig	2012-06-22 23:25:21.000=
000000 -0400
> -+++ systemd-pam-185/src/tmpfiles/tmpfiles.c	2012-06-22 23:13:49.00000000=
0 -0400
> -@@ -48,6 +48,8 @@
> - #include "set.h"
> - #include "conf-files.h"
> -=20
> -+#include "config.h"
> -+
> - /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
> -  * them in the file system. This is intended to be used to create
> -  * properly owned directories beneath /tmp, /var/tmp, /run, which are
> -@@ -970,7 +972,7 @@
> -         i =3D new0(Item, 1);
> -         if (!i)
> -                 return log_oom();
> --
> -+#ifdef HAVE_MSFORMAT
> -         if (sscanf(buffer,
> -                    "%c "
> -                    "%ms "
> -@@ -986,6 +988,28 @@
> -                    &group,
> -                    &age,
> -                    &n) < 2) {
> -+#else
> -+	i->path =3D malloc(257);
> -+	mode =3D malloc(257);
> -+	user =3D malloc(257);
> -+	group =3D malloc(257);
> -+	age =3D malloc(257);
> -+        if (sscanf(buffer,
> -+                   "%c "
> -+                   "%256s "
> -+                   "%256s "
> -+                   "%256s "
> -+                   "%256s "
> -+                   "%256s "
> -+                   "%n",
> -+                   &type,
> -+                   i->path,
> -+                   mode,
> -+                   user,
> -+                   group,
> -+                   age,
> -+                   &n) < 2) {
> -+#endif /* HAVE_MSFORMAT */
> -                 log_error("[%s:%u] Syntax error.", fname, line);
> -                 r =3D -EIO;
> -                 goto finish;
> ---- systemd-pam-185/src/cryptsetup/cryptsetup-generator.c.orig	2012-06-2=
2 23:25:47.000000000 -0400
> -+++ systemd-pam-185/src/cryptsetup/cryptsetup-generator.c	2012-06-22 23:=
16:35.000000000 -0400
> -@@ -30,6 +30,8 @@
> - #include "virt.h"
> - #include "strv.h"
> -=20
> -+#include "config.h"
> -+
> - static const char *arg_dest =3D "/tmp";
> - static bool arg_enabled =3D true;
> - static bool arg_read_crypttab =3D true;
> -@@ -421,8 +423,15 @@
> -                 l =3D strstrip(line);
> -                 if (*l =3D=3D '#' || *l =3D=3D 0)
> -                         continue;
> --
> -+#ifdef HAVE_MSFORMAT
> -                 k =3D sscanf(l, "%ms %ms %ms %ms", &name, &device, &pas=
sword, &options);
> -+#else
> -+		name =3D malloc(257);
> -+		device =3D malloc(257);
> -+		password =3D malloc(257);
> -+		options =3D malloc(257);
> -+                k =3D sscanf(l, "%256s %256s %256s %256s", name, device=
, password, options);
> -+#endif /* HAVE_MSFORMAT */
> -                 if (k < 2 || k > 4) {
> -                         log_error("Failed to parse /etc/crypttab:%u, ig=
noring.", n);
> -                         r =3D EXIT_FAILURE;
> diff --git a/meta-systemd/recipes-core/systemd/systemd/touchscreen.rules =
b/meta-systemd/recipes-core/systemd/systemd/touchscreen.rules
> deleted file mode 100644
> index d83fd16..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd/touchscreen.rules
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -# There are a number of modifiers that are allowed to be used in some
> -# of the different fields. They provide the following subsitutions:
> -#
> -# %n the "kernel number" of the device.
> -#    For example, 'sda3' has a "kernel number" of '3'
> -# %e the smallest number for that name which does not matches an existin=
g node
> -# %k the kernel name for the device
> -# %M the kernel major number for the device
> -# %m the kernel minor number for the device
> -# %b the bus id for the device
> -# %c the string returned by the PROGRAM
> -# %s{filename} the content of a sysfs attribute
> -# %% the '%' char itself
> -#
> -
> -# Create a symlink to any touchscreen input device
> -SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ATTRS{modalias}=3D=3D=
"input:*-e0*,3,*a0,1,*18,*", SYMLINK+=3D"input/touchscreen0"
> -SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ATTRS{modalias}=3D=3D=
"ads7846", SYMLINK+=3D"input/touchscreen0"
> diff --git a/meta-systemd/recipes-core/systemd/systemd/var-run.conf b/met=
a-systemd/recipes-core/systemd/systemd/var-run.conf
> deleted file mode 100644
> index c2c18e2..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd/var-run.conf
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# empty /var/run
> -R	/var/run/*	-	-	-	-	-
> -# systemd-update-utmp-runlevel.service fails to start without this
> -f /var/run/utmp 0644 root root - -
> diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-syst=
emd/recipes-core/systemd/systemd_git.bb
> deleted file mode 100644
> index f2e168e..0000000
> --- a/meta-systemd/recipes-core/systemd/systemd_git.bb
> +++ /dev/null
> @@ -1,263 +0,0 @@
> -DESCRIPTION =3D "Systemd a init replacement"
> -HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/systemd"
> -
> -LICENSE =3D "GPLv2 & LGPLv2.1 & MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaab=
aa882bbe \
> -                    file://LICENSE.LGPL2.1;md5=3Df0df8fd67dfa1db3cc0bd43=
1837f0b89 \
> -                    file://LICENSE.MIT;md5=3D544799d0b492f119fa04641d1b8=
868ed"
> -
> -PROVIDES =3D "udev"
> -
> -DEPENDS =3D "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0 lib=
gcrypt python"
> -DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
> -
> -SERIAL_CONSOLE ?=3D "115200 /dev/ttyS0"
> -
> -SECTION =3D "base/shell"
> -
> -inherit gitpkgv
> -PKGV =3D "v${GITPKGVTAG}"
> -
> -PV =3D "git"
> -PR =3D "r13"
> -
> -# need to export these variables for python-config to work
> -export BUILD_SYS
> -export HOST_SYS
> -export STAGING_INCDIR
> -export STAGING_LIBDIR
> -
> -inherit useradd pkgconfig autotools perlnative pythonnative python-dir
> -
> -SRCREV =3D "decd634e801bee2c554edb35383cc9d43417a850"
> -SRC_URI =3D "git://anongit.freedesktop.org/systemd/systemd;protocol=3Dgi=
t \
> -           file://0001-Revert-systemd-analyze-use-argparse-instead-of-ge=
top.patch \
> -           file://0002-Revert-analyze-use-GDBus-instead-of-dbus-python.p=
atch \
> -           file://gtk-doc.make \
> -           file://touchscreen.rules \
> -           file://modprobe.rules \
> -           file://var-run.conf \
> -           ${UCLIBCPATCHES} \
> -          "
> -UCLIBCPATCHES =3D ""
> -UCLIBCPATCHES_libc-uclibc =3D "file://systemd-pam-configure-check-uclibc=
=2Epatch \
> -                             file://systemd-pam-fix-execvpe.patch \
> -                             file://systemd-pam-fix-fallocate.patch \
> -                             file://systemd-pam-fix-getty-unit.patch \
> -                             file://systemd-pam-fix-mkostemp.patch \
> -                             file://systemd-pam-fix-msformat.patch \
> -                             file://optional_secure_getenv.patch \
> -                            "
> -LDFLAGS_libc-uclibc_append =3D " -lrt"
> -
> -S =3D "${WORKDIR}/git"
> -
> -SYSTEMDDISTRO ?=3D "debian"
> -SYSTEMDDISTRO_angstrom =3D "angstrom"
> -
> -CACHED_CONFIGUREVARS =3D "ac_cv_file__usr_share_pci_ids=3Dno \
> -			ac_cv_file__usr_share_hwdata_pci_ids=3Dno \
> -			ac_cv_file__usr_share_misc_pci_ids=3Dyes"
> -# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
> -EXTRA_OECONF =3D " --with-distro=3D${SYSTEMDDISTRO} \
> -                 --with-rootprefix=3D${base_prefix} \
> -                 --with-rootlibdir=3D${base_libdir} \
> -                 --sbindir=3D${base_sbindir} \
> -                 --libexecdir=3D${base_libdir} \
> -                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pa=
m', '--disable-pam', d)} \
> -                 --enable-xz \
> -                 --disable-manpages \
> -                 --disable-coredump \
> -                 --disable-introspection \
> -                 --with-pci-ids-path=3D/usr/share/misc \
> -                 --disable-gtk-doc-html \=20
> -                 --disable-tcpwrap \
> -                 --enable-split-usr \
> -                 --disable-microhttpd \
> -                 --with-python \
> -               "
> -
> -# There's no docbook-xsl-native, so for the xsltproc check to false
> -do_configure_prepend() {
> -	export CPP=3D"${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
> -	sed -i /xsltproc/d configure.ac
> -
> -	cp ${WORKDIR}/gtk-doc.make ${S}/docs/
> -
> -	# we only have /home/root, not /root
> -	sed -i -e 's:=3D/root:=3D/home/root:g' units/*.service*
> -}
> -
> -do_install() {
> -	autotools_do_install
> -	install -d ${D}${base_sbindir}
> -	# provided by a seperate recipe
> -	rm ${D}${systemd_unitdir}/system/serial-getty* -f
> -
> -	# provide support for initramfs
> -	ln -s ${systemd_unitdir}/systemd ${D}/init
> -
> -	# create dir for journal
> -	install -d ${D}${localstatedir}/log/journal
> -	# udevd is needed in initramfs which was provided by udev in OE-Core
> -	# so we need to provide that otherwise it pulls in both systemd and
> -	# udev
> -	ln -s ${systemd_unitdir}/systemd-udevd ${D}${base_sbindir}/udevd
> -	# create machine-id
> -	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machi=
ne-id-setup at install time, b) have / read-only and an empty file there (f=
or stateless) and c) boot with / writable
> -	touch ${D}${sysconfdir}/machine-id
> -
> -	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
> -
> -	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
> -}
> -
> -python populate_packages_prepend (){
> -    systemdlibdir =3D d.getVar("base_libdir", True)
> -    do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Sys=
temd %s library', extra_depends=3D'', allow_links=3DTrue)
> -}
> -PACKAGES_DYNAMIC +=3D "^lib(udev|gudev|systemd).*"
> -
> -PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-anal=
yze python-${PN}-journal"
> -
> -USERADD_PACKAGES =3D "${PN}"
> -GROUPADD_PARAM_${PN} =3D "-r lock"
> -
> -FILES_${PN}-analyze =3D "${bindir}/systemd-analyze"
> -RDEPENDS_${PN}-analyze =3D "python-dbus python-argparse python-textutils"
> -RRECOMMENDS_${PN}-analyze =3D "python-pycairo"
> -
> -FILES_python-${PN}-journal =3D "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py*=
 ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
> -RDEPENDS_python-${PN}-journal =3D "python-core"
> -
> -FILES_${PN}-initramfs =3D "/init"
> -RDEPENDS_${PN}-initramfs =3D "${PN}"
> -
> -FILES_${PN}-gui =3D "${bindir}/systemadm"
> -
> -FILES_${PN}-vconsole-setup =3D "${systemd_unitdir}/systemd-vconsole-setu=
p \
> -                              ${systemd_unitdir}/system/systemd-vconsole=
-setup.service \
> -                              ${systemd_unitdir}/system/sysinit.target.w=
ants/systemd-vconsole-setup.service"
> -
> -RRECOMMENDS_${PN}-vconsole-setup =3D "kbd kbd-consolefonts"
> -
> -CONFFILES_${PN} =3D "${sysconfdir}/systemd/journald.conf \
> -                ${sysconfdir}/systemd/logind.conf \
> -                ${sysconfdir}/systemd/system.conf \
> -                ${sysconfdir}/systemd/user.conf"
> -
> -FILES_${PN} =3D " ${base_bindir}/* \
> -                ${datadir}/dbus-1/services \
> -                ${datadir}/dbus-1/system-services \
> -                ${datadir}/polkit-1 \
> -                ${datadir}/${PN} \
> -                ${sysconfdir}/bash_completion.d/ \
> -                ${sysconfdir}/binfmt.d/ \
> -                ${sysconfdir}/dbus-1/ \
> -                ${sysconfdir}/machine-id \
> -                ${sysconfdir}/modules-load.d/ \
> -                ${sysconfdir}/sysctl.d/ \
> -                ${sysconfdir}/systemd/ \
> -                ${sysconfdir}/tmpfiles.d/ \
> -                ${sysconfdir}/xdg/ \
> -                ${sysconfdir}/init.d/README \
> -                ${systemd_unitdir}/* \
> -                ${systemd_unitdir}/system/* \
> -                /lib/udev/rules.d/99-systemd.rules \
> -                ${base_libdir}/security/*.so \
> -                /cgroup \
> -                ${bindir}/systemd* \
> -                ${bindir}/localectl \
> -                ${bindir}/hostnamectl \
> -                ${bindir}/timedatectl \
> -                ${exec_prefix}/lib/tmpfiles.d/*.conf \
> -                ${exec_prefix}/lib/systemd \
> -                ${exec_prefix}/lib/binfmt.d \
> -                ${exec_prefix}/lib/modules-load.d \
> -                ${exec_prefix}/lib/sysctl.d \
> -                ${localstatedir} \
> -                ${libexecdir} \
> -                /lib/udev/rules.d/70-uaccess.rules \
> -                /lib/udev/rules.d/71-seat.rules \
> -                /lib/udev/rules.d/73-seat-late.rules \
> -                /lib/udev/rules.d/99-systemd.rules \
> -               "
> -FILES_${PN}-dbg +=3D "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.de=
bug ${base_libdir}/security/.debug/ ${PYTHON_SITEPACKAGES_DIR}/systemd/.deb=
ug/"
> -FILES_${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/int=
erfaces/ ${sysconfdir}/rpm/macros.systemd ${PYTHON_SITEPACKAGES_DIR}/system=
d/*.la"
> -
> -RDEPENDS_${PN} +=3D "udev-systemd"
> -
> -# kbd -> loadkeys,setfont
> -# systemd calls 'modprobe -sab --', which busybox doesn't support due to=
 lack=20
> -# of blacklist support, so use proper modprobe from module-init-tools
> -# And pull in the kernel modules mentioned in INSTALL
> -# swapon -p is also not supported by busybox
> -# busybox mount is broken
> -RRECOMMENDS_${PN} +=3D "systemd-serialgetty \
> -                      util-linux-agetty \
> -                      util-linux-swaponoff \
> -                      util-linux-fsck e2fsprogs-e2fsck \
> -                      module-init-tools \
> -                      util-linux-mount util-linux-umount \
> -                      kernel-module-autofs4 kernel-module-unix kernel-mo=
dule-ipv6 \
> -"
> -
> -PACKAGES =3D+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
> -
> -FILES_udev-dbg +=3D "/lib/udev/.debug"
> -
> -RDEPENDS_udev +=3D "udev-utils"
> -RPROVIDES_udev =3D "hotplug"
> -
> -FILES_udev +=3D "${base_sbindir}/udevd \
> -               /lib/udev/udevd \
> -               /lib/systemd/systemd-udevd \
> -               /lib/udev/accelerometer \
> -               /lib/udev/ata_id \
> -               /lib/udev/cdrom_id \
> -               /lib/udev/collect \
> -               /lib/udev/findkeyboards \
> -               /lib/udev/keyboard-force-release.sh \
> -               /lib/udev/keymap \
> -               /lib/udev/mtd_probe \
> -               /lib/udev/scsi_id \
> -               /lib/udev/v4l_id \
> -               /lib/udev/keymaps \
> -               /lib/udev/rules.d/4*.rules \
> -               /lib/udev/rules.d/5*.rules \
> -               /lib/udev/rules.d/6*.rules \
> -               /lib/udev/rules.d/70-power-switch.rules \
> -               /lib/udev/rules.d/75*.rules \
> -               /lib/udev/rules.d/78*.rules \
> -               /lib/udev/rules.d/8*.rules \
> -               /lib/udev/rules.d/95*.rules \
> -               /lib/udev/hwdb.d \
> -               ${sysconfdir}/udev \
> -              "
> -
> -FILES_udev-consolekit +=3D "/lib/ConsoleKit"
> -RDEPENDS_udev-consolekit +=3D "${@base_contains('DISTRO_FEATURES', 'x11'=
, 'consolekit', '', d)}"
> -
> -FILES_udev-utils =3D "${bindir}/udevadm"
> -
> -FILES_udev-systemd =3D "${systemd_unitdir}/system/*udev* ${systemd_unitd=
ir}/system/*.wants/*udev*"
> -RDEPENDS_udev-systemd =3D "udev"
> -
> -# TODO:
> -# u-a for runlevel and telinit
> -
> -pkg_postinst_systemd () {
> -update-alternatives --install ${base_sbindir}/init init ${systemd_unitdi=
r}/systemd 300
> -update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/s=
ystemctl 300
> -update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindi=
r}/systemctl 300
> -update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_b=
indir}/systemctl 300
> -update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_b=
indir}/systemctl 300
> -}
> -
> -pkg_prerm_systemd () {
> -update-alternatives --remove init ${systemd_unitdir}/systemd
> -update-alternatives --remove halt ${base_bindir}/systemctl
> -update-alternatives --remove reboot ${base_bindir}/systemctl
> -update-alternatives --remove shutdown ${base_bindir}/systemctl
> -update-alternatives --remove poweroff ${base_bindir}/systemctl
> -}
> --=20
> 1.7.6.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--95nVhCDQCgPWiQqT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEGuToACgkQN1Ujt2V2gBxvKgCeLLmi/K+4tBp2D5Wy1VudQ1y3
4VkAn3+j4ZX5w2uPfT4EhUAZ11n5Vr/x
=SMhA
-----END PGP SIGNATURE-----

--95nVhCDQCgPWiQqT--
