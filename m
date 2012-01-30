Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rrv8a-0002YQ-6R
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 18:35:29 +0100
Received: by lahc1 with SMTP id c1so2274272lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 09:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Oqnf4upfsNW9JBuH12KDk2Tcdea4wvHwxy5AgV5hS+Q=;
	b=I3IKJr2WPB9PXDOZeqHhTViYkOJZifZ+PN74j3TtZEt3WgvQu9OdtmfvTlC7FM+dpm
	dJepaa9hHplbrQkztyXtUxfgwcE+IMg5iX5pZiZLvAwuGR893dJfbgmVNYCuHN0MIfBW
	dfOcplyZu6IS9lSJI043apgNYIGuwT1nKMh3Q=
Received: by 10.112.99.136 with SMTP id eq8mr4706643lbb.42.1327944106254; Mon,
	30 Jan 2012 09:21:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 30 Jan 2012 09:21:16 -0800 (PST)
In-Reply-To: <1327932996-3624-1-git-send-email-koen@dominion.thruhere.net>
References: <1327932996-3624-1-git-send-email-koen@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jan 2012 09:21:16 -0800
Message-ID: <CAMKF1spGDNv8GdtO=L4X6X1PVxffrv4PwhPMYZ7VWuFjzZeNhQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH v2] udev: add 180
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
X-List-Received-Date: Mon, 30 Jan 2012 17:35:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 6:16 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> * 'blkid' isn't needed anymore, since 176 udev links against libblkid
> * 'modprobe' and 'depmod' aren't needed anymore, udev now links against l=
ibkmod
> * The entire source including the license files were re-indented hence th=
e LIC_FILES_CHKSUM changes
>
> Runtime tested on beagleboard/angstrom
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> =C2=A0meta-oe/recipes-core/udev/udev_180.bb | =C2=A0 89 +++++++++++++++++=
++++++++++++++++
> =C2=A01 files changed, 89 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta-oe/recipes-core/udev/udev_180.bb
>
> diff --git a/meta-oe/recipes-core/udev/udev_180.bb b/meta-oe/recipes-core=
/udev/udev_180.bb
> new file mode 100644
> index 0000000..4d3b0ed
> --- /dev/null
> +++ b/meta-oe/recipes-core/udev/udev_180.bb
> @@ -0,0 +1,89 @@
> +DESCRIPTION =3D "udev is a daemon which dynamically creates and removes =
device nodes from \
> +/dev/, handles hotplug events and loads drivers at boot time."
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +# udev 169 and up require kernel 2.6.36 for ARM:
> +# http://git.kernel.org/?p=3Dlinux/hotplug/udev.git;a=3Dcommit;h=3D67a77=
c8bf299f6264f001677becd056316ebce2f
> +
> +LICENSE =3D "GPLv2+ & LGPLv2.1+"
> +LICENSE_${PN} =3D "GPLv2+"
> +LICENSE_libudev =3D "LGPLv2.1+"
> +LICENSE_libgudev =3D "LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://src/COPYING;md5=3D17c4e5fb495e6707ac92a3864926f979 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://src/extras/gudev/COPYING;md5=3Dfb494485a7d0505308cb68e4997cc266"
> +
> +# glib-2.0: Needed for udev-extras
> +# util-linux: Needed for libblkid
> +# kmod: needed for libkmod
> +DEPENDS =3D "gperf-native usbutils acl glib-2.0 util-linux kmod"
> +
> +# f13289ffdf077f75c8710e977ffe538b66885762 -> 180 tag
> +SRCREV =3D "f13289ffdf077f75c8710e977ffe538b66885762"
> +
> +# version specific SRC_URI
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/hotplug/udev.git;protoco=
l=3Dgit \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gtk-doc.make"
> +
> +# generic SRC_URI
> +SRC_URI +=3D " \
> + =C2=A0 =C2=A0 =C2=A0 file://touchscreen.rules \
> + =C2=A0 =C2=A0 =C2=A0 file://modprobe.rules \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +# Machine specific udev rules should be in their own recipe that ${PN} c=
an add to RRECOMMENDS
> +
> +inherit autotools
> +
> +EXTRA_OECONF +=3D " \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable=
-introspection \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-pc=
i-ids-path=3D/usr/share/misc \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_fil=
e__usr_share_pci_ids=3Dno \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_fil=
e__usr_share_hwdata_pci_ids=3Dno \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_fil=
e__usr_share_misc_pci_ids=3Dyes \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--sbindir=
=3D${base_sbindir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--libexec=
dir=3D${base_libdir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-ro=
otlibdir=3D${base_libdir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-ro=
otprefix=3D \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable=
-gtk-doc-html \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-sy=
stemdsystemunitdir=3D${base_libdir}/systemd/system/ \
> +"

Do you get the above cached vars correctly set in config.log ?

> +
> +do_configure_prepend() {
> + =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/gtk-doc.make ${S}
> +}
> +
> +PACKAGES =3D+ "${PN}-systemd libudev libgudev udev-consolekit udev-utils=
"
> +
> +FILES_${PN}-systemd =3D "${base_libdir}/systemd"
> +RDEPENDS_${PN}-systemd +=3D "udev"
> +
> +FILES_libudev =3D "${base_libdir}/libudev.so.*"
> +FILES_libgudev =3D "${base_libdir}/libgudev*.so.*"
> +
> +RDEPENDS_${PN} +=3D "udev-utils"
> +RPROVIDES_${PN} =3D "hotplug"
> +FILES_${PN} +=3D "${usrbindir}/* ${usrsbindir}/udevd"
> +FILES_${PN}-dbg +=3D "${usrbindir}/.debug ${usrsbindir}/.debug"
> +
> +# udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir=
}
> +# is ${prefix}/lib64
> +FILES_${PN} +=3D "/lib/udev*"

Does this also mean that /lib/udev/ directory gets pulled in
as well.

> +FILES_${PN}-dbg +=3D "/lib/udev/.debug"
> +
> +FILES_${PN}-consolekit +=3D "${libdir}/ConsoleKit"
> +RDEPENDS_${PN}-consolekit +=3D "consolekit"
> +
> +FILES_udev-utils =3D "${bindir}/udevadm"
> +
> +do_install () {
> + =C2=A0 =C2=A0 =C2=A0 install -d ${D}${usrsbindir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${sbi=
ndir}
> + =C2=A0 =C2=A0 =C2=A0 oe_runmake 'DESTDIR=3D${D}' INSTALL=3Dinstall inst=
all
> +
> + =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/*.rules =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ${D}${sysconfdir}/udev/rules.d/
> +}
> +
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


