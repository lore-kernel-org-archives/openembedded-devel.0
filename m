Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SBkcu-0003lO-Ln
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Mar 2012 12:24:44 +0200
Received: by iaag37 with SMTP id g37so7023676iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2012 03:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=x05NexcEuBtOg7/5pZluE1UPJRkOnGs+QaObg/J5Xiw=;
	b=DyoHpOllBbxlO4dS6GcBttOC7QJxdgbvUn2j5c9MIH4jkONI9e/DuZ/I+eW1fbMeFW
	R7I4SUdt9j7A5+C/ZcccufynZyOyQtiqaiRNKlDHXSLaJU0/odz0IvAxqTNOSWakbY7M
	+4w0FVMkZFl6T7KRMTUVncccbxP98vT51mjHuU0sAaxZpcB6YvL+f3raPNVeYsw8sNzY
	+3fAfvTMZxxd3vVBb07v6qmB4v35AIcn4sydXJJyqSe1838ZSxSiaG7T83dpmojoNNnI
	VNMq7jFLJRLUdj/9EJeG6bdLh7100ZWfgHc8oLMQOTLsqhg+iDSSPuArKJvVsFb9pAtH
	/TGg==
MIME-Version: 1.0
Received: by 10.50.222.162 with SMTP id qn2mr3046388igc.65.1332670545584; Sun,
	25 Mar 2012 03:15:45 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Sun, 25 Mar 2012 03:15:45 -0700 (PDT)
In-Reply-To: <1332263919-19283-3-git-send-email-koen@dominion.thruhere.net>
References: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
	<1332263919-19283-3-git-send-email-koen@dominion.thruhere.net>
Date: Sun, 25 Mar 2012 12:15:45 +0200
Message-ID: <CALbNGRQpfgBgu-nSax+5r9ucXLKsQYZr+QJOGx2JLjZR3zTUpg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 3/4] udev: remove 173
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
X-List-Received-Date: Sun, 25 Mar 2012 10:24:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2012 at 6:18 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> =A0meta-oe/recipes-core/udev/udev_173.bb | =A0116 -----------------------=
----------
> =A01 files changed, 0 insertions(+), 116 deletions(-)
> =A0delete mode 100644 meta-oe/recipes-core/udev/udev_173.bb
>
> diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core=
/udev/udev_173.bb
> deleted file mode 100644
> index b7d7ed3..0000000
> --- a/meta-oe/recipes-core/udev/udev_173.bb
> +++ /dev/null
> @@ -1,116 +0,0 @@
> -DESCRIPTION =3D "udev is a daemon which dynamically creates and removes =
device nodes from \
> -/dev/, handles hotplug events and loads drivers at boot time. It replace=
s \
> -the hotplug package and requires a kernel not older than 2.6.27."
> -
> -# udev 169 and up require kernel 2.6.36 for ARM:
> -# http://git.kernel.org/?p=3Dlinux/hotplug/udev.git;a=3Dcommit;h=3D67a77=
c8bf299f6264f001677becd056316ebce2f
> -
> -LICENSE =3D "GPLv2+ & LGPLv2.1+"
> -LICENSE_${PN} =3D "GPLv2+"
> -LICENSE_libudev =3D "LGPLv2.1+"
> -LICENSE_libgudev =3D "LGPLv2.1+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://libudev/COPYING;md5=3Da6f=
89e2100d9b6cdffcea4f398e37343 \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://extras/gudev/COPYING;md5=
=3Da6f89e2100d9b6cdffcea4f398e37343"
> -
> -# Needed for udev-extras
> -DEPENDS =3D "gperf-native usbutils acl glib-2.0"
> -
> -PR =3D "r4"
> -
> -# version specific SRC_URI
> -SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.t=
ar.gz \
> - =A0 =A0 =A0 =A0 =A0 file://0001-rip-put-doc-generation-it-depends-on-a-=
working-docto.patch \
> - =A0 =A0 =A0 =A0 =A0 file://gtk-doc.make"
> -
> -# generic SRC_URI
> -SRC_URI +=3D " \
> - =A0 =A0 =A0 file://touchscreen.rules \
> - =A0 =A0 =A0 file://modprobe.rules \
> - =A0 =A0 =A0 file://default \
> - =A0 =A0 =A0 file://init \
> - =A0 =A0 =A0 file://cache \
> -"
> -
> -SRC_URI[md5sum] =3D "2afd20ee1c790eac6d7abe0498ebb414"
> -SRC_URI[sha256sum] =3D "0f753ad9c3022a074d1c052bcee9139581db825283771ac7=
8c0be0d1de109d0c"
> -
> -# Machine specific udev rules should be in their own recipe that ${PN} c=
an add to RRECOMMENDS
> -
> -inherit update-rc.d autotools
> -
> -EXTRA_OECONF +=3D " \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-introspection \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-pci-ids-path=3D/usr/share/mis=
c \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_share_pci_ids=3Dno \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_share_hwdata_pci_ids=
=3Dno \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_share_misc_pci_ids=
=3Dyes \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--sbindir=3D${base_sbindir} \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--libexecdir=3D${base_libdir}/udev \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-rootlibdir=3D${base_libdir} \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-gtk-doc-html \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-systemdsystemunitdir=3D${base=
_libdir}/systemd/system/ \
> -"
> -
> -do_configure_prepend() {
> - =A0 =A0 =A0 cp ${WORKDIR}/gtk-doc.make ${S}
> -}
> -
> -INITSCRIPT_NAME =3D "udev"
> -INITSCRIPT_PARAMS =3D "start 04 S ."
> -
> -PACKAGES =3D+ "${PN}-systemd libudev libgudev udev-utils udev-consolekit=
"
> -
> -FILES_${PN}-systemd =3D "${base_libdir}/systemd"
> -RDEPENDS_${PN}-systemd +=3D "udev"
> -
> -FILES_libudev =3D "${base_libdir}/libudev.so.*"
> -FILES_libgudev =3D "${base_libdir}/libgudev*.so.*"
> -
> -FILES_udev-utils =3D "${bindir}/udevinfo ${bindir}/udevtest ${base_sbind=
ir}/udevadm"
> -
> -RPROVIDES_${PN} =3D "hotplug"
> -FILES_${PN} +=3D "${usrbindir}/* ${usrsbindir}/udevd"
> -FILES_${PN}-dbg +=3D "${usrbindir}/.debug ${usrsbindir}/.debug"
> -RDEPENDS_${PN} +=3D "module-init-tools-depmod udev-utils"
> -RRECOMMENDS_${PN} +=3D "util-linux-blkid"
> -
> -# udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir=
}
> -# is ${prefix}/lib64
> -FILES_${PN} +=3D "/lib/udev*"
> -FILES_${PN}-dbg +=3D "/lib/udev/.debug"
> -
> -FILES_${PN}-consolekit +=3D "${libdir}/ConsoleKit"
> -RDEPENDS_${PN}-consolekit +=3D "${@base_contains('DISTRO_FEATURES', 'x11=
', 'consolekit', '', d)}"
> -
> -do_install () {
> - =A0 =A0 =A0 install -d ${D}${usrsbindir} \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${D}${sbindir}
> - =A0 =A0 =A0 oe_runmake 'DESTDIR=3D${D}' INSTALL=3Dinstall install
> - =A0 =A0 =A0 install -d ${D}${sysconfdir}/init.d
> - =A0 =A0 =A0 install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/ud=
ev
> - =A0 =A0 =A0 install -m 0755 ${WORKDIR}/cache ${D}${sysconfdir}/init.d/u=
dev-cache
> -
> - =A0 =A0 =A0 install -d ${D}${sysconfdir}/default
> - =A0 =A0 =A0 install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/defaul=
t/udev
> -
> - =A0 =A0 =A0 install -m 0644 ${WORKDIR}/*.rules =A0 =A0 =A0 =A0 ${D}${sy=
sconfdir}/udev/rules.d/
> -
> - =A0 =A0 =A0 touch ${D}${sysconfdir}/udev/saved.uname
> - =A0 =A0 =A0 touch ${D}${sysconfdir}/udev/saved.cmdline
> - =A0 =A0 =A0 touch ${D}${sysconfdir}/udev/saved.devices
> - =A0 =A0 =A0 touch ${D}${sysconfdir}/udev/saved.atags
> -
> - =A0 =A0 =A0 # disable udev-cache sysv script on systemd installs
> - =A0 =A0 =A0 ln -sf /dev/null ${D}/${base_libdir}/systemd/system/udev-ca=
che.service
> -}
> -
> -# Create the cache after checkroot has run
> -pkg_postinst_udev_append() {
> - =A0 =A0 =A0 if test "x$D" !=3D "x"; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OPT=3D"-r $D"
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OPT=3D"-s"
> - =A0 =A0 =A0 fi
> - =A0 =A0 =A0 update-rc.d $OPT udev-cache start 36 S .
> -}
> --
> 1.7.2.5
Acked-by: Koen Kooi <schnitzeltony@googlemail.com>


