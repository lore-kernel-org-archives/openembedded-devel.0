Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tssyl-0004Sj-RQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 11:33:59 +0100
Received: by mail-da0-f48.google.com with SMTP id k18so677076dae.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 02:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lZFzwNsz++0jtvHkKyPfzSnP4crYKU7ADS0SqAfQ//0=;
	b=ZTZAwG9VCAibjr9fwjW+X51tE69Z7NvWknQKC5sQDpEwPbYI1A0h9uBvb3/WD/5O5x
	0knyc16IdB4oMIKId7FMeH0VU4lHaxEvunuPNQFVnY5ZlWcSRfWg5RwWofSGMQ9ihwf7
	oYvB71Q0Xbbm11I1ilkSMRGmGsj38jfW2cmLByXWDJOocENj8g7zAxV81WgHz510tKrv
	Hb7IOtvU87/ktrxpR4KRiYreBA2CrW77PDskbFNOjr3cLl0l2ms+t4/z78fXrXIGZ9qL
	ZozhatBCC4V127cG4bBd+bOTcf3PsrjldpnzcmX1HMWxWYZNky80sZAjh25ABoQlv06T
	OLxA==
X-Received: by 10.66.76.41 with SMTP id h9mr188303657paw.1.1357726719163;
	Wed, 09 Jan 2013 02:18:39 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gv9sm41392203pbc.21.2013.01.09.02.18.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 02:18:38 -0800 (PST)
Date: Wed, 9 Jan 2013 11:18:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130109101842.GE3722@jama.palm1.palmone.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
	<1357463568-26241-18-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1357463568-26241-18-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH V2 18/25] systemd: Fix build when base_libdir is not /lib
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
X-List-Received-Date: Wed, 09 Jan 2013 10:34:22 -0000
X-Groupsio-MsgNum: 42589
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Content-Disposition: inline

--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 06, 2013 at 01:12:41AM -0800, Khem Raj wrote:
> we were carrying a wrong patch to fix rootlibdir
> to adapt systemd to OE's notion of base_libdir
> but thats not right and the units dont get initialised
> properly when we have base_libdir which is not /lib
>=20
> This patch fixes the use of base_libdir where
> it should have been catering to notions of systemd/udev
> for putting unit files and init scripts in /lib
> and not in base_libdir
>=20
> It also ignores the lib32-* packages so that systemd
> build works for multilib enabled systems.
>=20
> Adapt to nativesdk renaming

Whole V3 merged today, bitbake world has some new build issues but none
of them is caused by those changes.

Thanks khem!

Please double check that your systemd changes are also merged to oe-core
at some point (I don't think "[OE-core] [PATCH 00/21][RFC v3] systemd
Integration" have them all now).

Cheers,

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-systemd/classes/systemd.bbclass             |    7 +-
>  meta-systemd/recipes-core/systemd/systemd_git.bb |   77 ++++++++++++----=
------
>  2 files changed, 45 insertions(+), 39 deletions(-)
>=20
> diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/=
systemd.bbclass
> index f26c6d1..9582492 100644
> --- a/meta-systemd/classes/systemd.bbclass
> +++ b/meta-systemd/classes/systemd.bbclass
> @@ -70,7 +70,8 @@ def systemd_after_parse(d):
>      bpn =3D d.getVar('BPN', 1)
>      if bpn + "-native" !=3D d.getVar('PN', 1) and \
>              bpn + "-cross" !=3D d.getVar('PN', 1) and \
> -            bpn + "-nativesdk" !=3D d.getVar('PN', 1):
> +            not d.getVar('MLPREFIX', 1) and \
> +            "nativesdk-" + bpn !=3D d.getVar('PN', 1):
>          systemd_check_vars()
>          for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
>              systemd_create_package(pkg_systemd)
> @@ -158,8 +159,8 @@ python populate_packages_prepend () {
>      def systemd_check_services():
>          base_libdir =3D d.getVar('base_libdir', 1)
>          searchpaths =3D '/etc/systemd/system/' + ' '
> -        searchpaths +=3D d.getVar('base_libdir', 1) + '/systemd/system/'=
 + ' '
> -        searchpaths +=3D d.getVar('libdir', 1) + '/systemd/system/' + ' '
> +        searchpaths +=3D '/lib/systemd/system/' + ' '
> +        searchpaths +=3D '/usr/lib/systemd/system/' + ' '
>          systemd_packages =3D d.getVar('SYSTEMD_PACKAGES', 1)
>          has_exactly_one_service =3D len(systemd_packages.split()) =3D=3D=
 1
>          if has_exactly_one_service:
> diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-syst=
emd/recipes-core/systemd/systemd_git.bb
> index 7fa7ac6..5722d35 100644
> --- a/meta-systemd/recipes-core/systemd/systemd_git.bb
> +++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
> @@ -90,6 +90,7 @@ do_configure_prepend() {
> =20
>  do_install() {
>  	autotools_do_install
> +	install -d ${D}${base_sbindir}
>  	# provided by a seperate recipe
>  	rm ${D}${systemd_unitdir}/system/serial-getty* -f
> =20
> @@ -98,7 +99,10 @@ do_install() {
> =20
>  	# create dir for journal
>  	install -d ${D}${localstatedir}/log/journal
> -
> +	# udevd is needed in initramfs which was provided by udev in OE-Core
> +	# so we need to provide that otherwise it pulls in both systemd and
> +	# udev
> +	ln -s ${systemd_unitdir}/systemd-udevd ${D}${base_sbindir}/udevd
>  	# create machine-id
>  	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machi=
ne-id-setup at install time, b) have / read-only and an empty file there (f=
or stateless) and c) boot with / writable
>  	touch ${D}${sysconfdir}/machine-id
> @@ -159,24 +163,24 @@ FILES_${PN} =3D " ${base_bindir}/* \
>                  ${sysconfdir}/init.d/README \
>                  ${systemd_unitdir}/* \
>                  ${systemd_unitdir}/system/* \
> -                ${base_libdir}/udev/rules.d/99-systemd.rules \
> +                /lib/udev/rules.d/99-systemd.rules \
>                  ${base_libdir}/security/*.so \
>                  /cgroup \
>                  ${bindir}/systemd* \
>                  ${bindir}/localectl \
>                  ${bindir}/hostnamectl \
>                  ${bindir}/timedatectl \
> -                ${libdir}/tmpfiles.d/*.conf \
> -                ${libdir}/systemd \
> -                ${libdir}/binfmt.d \
> -                ${libdir}/modules-load.d \
> -                ${libdir}/sysctl.d \
> +                ${exec_prefix}/lib/tmpfiles.d/*.conf \
> +                ${exec_prefix}/lib/systemd \
> +                ${exec_prefix}/lib/binfmt.d \
> +                ${exec_prefix}/lib/modules-load.d \
> +                ${exec_prefix}/lib/sysctl.d \
>                  ${localstatedir} \
>                  ${libexecdir} \
> -                ${base_libdir}/udev/rules.d/70-uaccess.rules \
> -                ${base_libdir}/udev/rules.d/71-seat.rules \
> -                ${base_libdir}/udev/rules.d/73-seat-late.rules \
> -                ${base_libdir}/udev/rules.d/99-systemd.rules \
> +                /lib/udev/rules.d/70-uaccess.rules \
> +                /lib/udev/rules.d/71-seat.rules \
> +                /lib/udev/rules.d/73-seat-late.rules \
> +                /lib/udev/rules.d/99-systemd.rules \
>                 "
>  FILES_${PN}-dbg +=3D "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.de=
bug ${base_libdir}/security/.debug/ ${PYTHON_SITEPACKAGES_DIR}/systemd/.deb=
ug/"
>  FILES_${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/int=
erfaces/ ${sysconfdir}/rpm/macros.systemd ${PYTHON_SITEPACKAGES_DIR}/system=
d/*.la"
> @@ -200,42 +204,43 @@ RRECOMMENDS_${PN} +=3D "systemd-serialgetty \
> =20
>  PACKAGES =3D+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
> =20
> -FILES_udev-dbg +=3D "${base_libdir}/udev/.debug"
> +FILES_udev-dbg +=3D "/lib/udev/.debug"
> =20
>  RDEPENDS_udev +=3D "udev-utils"
>  RPROVIDES_udev =3D "hotplug"
> =20
> -FILES_udev +=3D "${base_libdir}/udev/udevd \
> -               ${base_libdir}/systemd/systemd-udevd \
> -               ${base_libdir}/udev/accelerometer \
> -               ${base_libdir}/udev/ata_id \
> -               ${base_libdir}/udev/cdrom_id \
> -               ${base_libdir}/udev/collect \
> -               ${base_libdir}/udev/findkeyboards \
> -               ${base_libdir}/udev/keyboard-force-release.sh \
> -               ${base_libdir}/udev/keymap \
> -               ${base_libdir}/udev/mtd_probe \
> -               ${base_libdir}/udev/scsi_id \
> -               ${base_libdir}/udev/v4l_id \
> -               ${base_libdir}/udev/keymaps \
> -               ${base_libdir}/udev/rules.d/4*.rules \
> -               ${base_libdir}/udev/rules.d/5*.rules \
> -               ${base_libdir}/udev/rules.d/6*.rules \
> -               ${base_libdir}/udev/rules.d/70-power-switch.rules \
> -               ${base_libdir}/udev/rules.d/75*.rules \
> -               ${base_libdir}/udev/rules.d/78*.rules \
> -               ${base_libdir}/udev/rules.d/8*.rules \
> -               ${base_libdir}/udev/rules.d/95*.rules \
> -               ${base_libdir}/udev/hwdb.d \
> +FILES_udev +=3D "${base_sbindir}/udevd \
> +               /lib/udev/udevd \
> +               /lib/systemd/systemd-udevd \
> +               /lib/udev/accelerometer \
> +               /lib/udev/ata_id \
> +               /lib/udev/cdrom_id \
> +               /lib/udev/collect \
> +               /lib/udev/findkeyboards \
> +               /lib/udev/keyboard-force-release.sh \
> +               /lib/udev/keymap \
> +               /lib/udev/mtd_probe \
> +               /lib/udev/scsi_id \
> +               /lib/udev/v4l_id \
> +               /lib/udev/keymaps \
> +               /lib/udev/rules.d/4*.rules \
> +               /lib/udev/rules.d/5*.rules \
> +               /lib/udev/rules.d/6*.rules \
> +               /lib/udev/rules.d/70-power-switch.rules \
> +               /lib/udev/rules.d/75*.rules \
> +               /lib/udev/rules.d/78*.rules \
> +               /lib/udev/rules.d/8*.rules \
> +               /lib/udev/rules.d/95*.rules \
> +               /lib/udev/hwdb.d \
>                 ${sysconfdir}/udev \
>                "
> =20
> -FILES_udev-consolekit +=3D "${libdir}/ConsoleKit"
> +FILES_udev-consolekit +=3D "/lib/ConsoleKit"
>  RDEPENDS_udev-consolekit +=3D "${@base_contains('DISTRO_FEATURES', 'x11'=
, 'consolekit', '', d)}"
> =20
>  FILES_udev-utils =3D "${bindir}/udevadm"
> =20
> -FILES_udev-systemd =3D "${base_libdir}/systemd/system/*udev* ${base_libd=
ir}/systemd/system/*.wants/*udev*"
> +FILES_udev-systemd =3D "${systemd_unitdir}/system/*udev* ${systemd_unitd=
ir}/system/*.wants/*udev*"
>  RDEPENDS_udev-systemd =3D "udev"
> =20
>  # TODO:
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDtRAIACgkQN1Ujt2V2gBw4/wCglCI8Np0/jUYrbfednNoRvUYQ
BzwAn3sQYwIa9bgX0DiJ6q5FlSD1Swfw
=Ox+V
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--
