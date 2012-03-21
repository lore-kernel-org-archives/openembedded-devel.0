Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAGQl-0002Hb-5a
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 08:58:03 +0100
Received: by iaag37 with SMTP id g37so1253389iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 00:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=M1e0hBvhZ3N2j0Mbxq8bleWYrDxK6OPS284WAfMqKS0=;
	b=Lk8hACuO1LZ+dWfQcCBkXumjonFzkfgRqXqhCdeboCmwpr+uMaD+P4bghOJre+pkJV
	0JZOuOGJn7BAES/ZGnX5xt6BCC2AMXEFkRZ0BxI37FzBET/gf9JWhIRrwDwJ42q3Zp7R
	jox+7LDrcwvVkIiRu9AptE2L/Iozr3BzmDFGk21aknDOdmaCH02aNKPAkfqbhFJog+YK
	vKL/MNq46C7HNaaE4JJ0t6sszurerhSuQWtqPJM0XAYMKNs6UY5/MC4rWjJhFNxSanJD
	1G8oyQGgvpQ9vU/rytqUHyNSgFIwhTwWtJPZdG/XTj/kJBMHeffy3jTeJZtKEC4HQE2o
	1SFw==
MIME-Version: 1.0
Received: by 10.50.222.131 with SMTP id qm3mr1877702igc.66.1332316149025; Wed,
	21 Mar 2012 00:49:09 -0700 (PDT)
Received: by 10.42.75.137 with HTTP; Wed, 21 Mar 2012 00:49:08 -0700 (PDT)
In-Reply-To: <1332263919-19283-4-git-send-email-koen@dominion.thruhere.net>
References: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
	<1332263919-19283-4-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 21 Mar 2012 08:49:08 +0100
Message-ID: <CALbNGRRwoJ7MqVFdoCWQC5bmf+HgZD_QV1jUj2Q1nR-jXZWXfg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 4/4] udev: remove 175
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
X-List-Received-Date: Wed, 21 Mar 2012 07:58:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2012 at 6:18 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> =A0meta-oe/recipes-core/udev/udev_175.bb | =A0 91 -----------------------=
----------
> =A01 files changed, 0 insertions(+), 91 deletions(-)
> =A0delete mode 100644 meta-oe/recipes-core/udev/udev_175.bb
>
> diff --git a/meta-oe/recipes-core/udev/udev_175.bb b/meta-oe/recipes-core=
/udev/udev_175.bb
> deleted file mode 100644
> index e14dde2..0000000
> --- a/meta-oe/recipes-core/udev/udev_175.bb
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -DESCRIPTION =3D "udev is a daemon which dynamically creates and removes =
device nodes from \
> -/dev/, handles hotplug events and loads drivers at boot time. It replace=
s \
> -the hotplug package and requires a kernel not older than 2.6.27."
> -
> -DEFAULT_PREFERENCE =3D "-1"
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
> -PR =3D "r1"
> -
> -# 6f410b81aa6d588b03ae795c9b76468591ef7efa -> 175 tag
> -SRCREV =3D "6f410b81aa6d588b03ae795c9b76468591ef7efa"
> -
> -# version specific SRC_URI
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/hotplug/udev.git;protoco=
l=3Dgit \
> - =A0 =A0 =A0 =A0 =A0 file://0001-rip-put-doc-generation-it-depends-on-a-=
working-docto.patch \
> - =A0 =A0 =A0 =A0 =A0 file://gtk-doc.make"
> -
> -# generic SRC_URI
> -SRC_URI +=3D " \
> - =A0 =A0 =A0 file://touchscreen.rules \
> - =A0 =A0 =A0 file://modprobe.rules \
> -"
> -
> -S =3D "${WORKDIR}/git"
> -
> -# Machine specific udev rules should be in their own recipe that ${PN} c=
an add to RRECOMMENDS
> -
> -inherit autotools
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
> -
> - =A0 =A0 =A0 install -m 0644 ${WORKDIR}/*.rules =A0 =A0 =A0 =A0 ${D}${sy=
sconfdir}/udev/rules.d/
> -}
> -
Could we wait with this until libertas works with udev >=3D 177 [1]?

Andreas

[1] http://www.spinics.net/lists/linux-wireless/msg85541.html


