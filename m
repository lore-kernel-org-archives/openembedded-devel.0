Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rrw9i-0004db-6Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 19:40:42 +0100
Received: by werc1 with SMTP id c1so3727285wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 10:32:49 -0800 (PST)
Received: by 10.216.132.19 with SMTP id n19mr7667093wei.31.1327944693098;
	Mon, 30 Jan 2012 09:31:33 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y1sm2720174wiw.6.2012.01.30.09.31.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 09:31:29 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAMKF1spGDNv8GdtO=L4X6X1PVxffrv4PwhPMYZ7VWuFjzZeNhQ@mail.gmail.com>
Date: Mon, 30 Jan 2012 18:31:22 +0100
Message-Id: <7EE61642-664D-41E2-BDB9-95E4C889A6C4@dominion.thruhere.net>
References: <1327932996-3624-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1spGDNv8GdtO=L4X6X1PVxffrv4PwhPMYZ7VWuFjzZeNhQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 30 Jan 2012 18:40:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 jan. 2012, om 18:21 heeft Khem Raj het volgende geschreven:

> On Mon, Jan 30, 2012 at 6:16 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> * 'blkid' isn't needed anymore, since 176 udev links against libblkid
>> * 'modprobe' and 'depmod' aren't needed anymore, udev now links =
against libkmod
>> * The entire source including the license files were re-indented =
hence the LIC_FILES_CHKSUM changes
>>=20
>> Runtime tested on beagleboard/angstrom
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>  meta-oe/recipes-core/udev/udev_180.bb |   89 =
+++++++++++++++++++++++++++++++++
>>  1 files changed, 89 insertions(+), 0 deletions(-)
>>  create mode 100644 meta-oe/recipes-core/udev/udev_180.bb
>>=20
>> diff --git a/meta-oe/recipes-core/udev/udev_180.bb =
b/meta-oe/recipes-core/udev/udev_180.bb
>> new file mode 100644
>> index 0000000..4d3b0ed
>> --- /dev/null
>> +++ b/meta-oe/recipes-core/udev/udev_180.bb
>> @@ -0,0 +1,89 @@
>> +DESCRIPTION =3D "udev is a daemon which dynamically creates and =
removes device nodes from \
>> +/dev/, handles hotplug events and loads drivers at boot time."
>> +
>> +DEFAULT_PREFERENCE =3D "-1"
>> +
>> +# udev 169 and up require kernel 2.6.36 for ARM:
>> +# =
http://git.kernel.org/?p=3Dlinux/hotplug/udev.git;a=3Dcommit;h=3D67a77c8bf=
299f6264f001677becd056316ebce2f
>> +
>> +LICENSE =3D "GPLv2+ & LGPLv2.1+"
>> +LICENSE_${PN} =3D "GPLv2+"
>> +LICENSE_libudev =3D "LGPLv2.1+"
>> +LICENSE_libgudev =3D "LGPLv2.1+"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>> +                    =
file://src/COPYING;md5=3D17c4e5fb495e6707ac92a3864926f979 \
>> +                    =
file://src/extras/gudev/COPYING;md5=3Dfb494485a7d0505308cb68e4997cc266"
>> +
>> +# glib-2.0: Needed for udev-extras
>> +# util-linux: Needed for libblkid
>> +# kmod: needed for libkmod
>> +DEPENDS =3D "gperf-native usbutils acl glib-2.0 util-linux kmod"
>> +
>> +# f13289ffdf077f75c8710e977ffe538b66885762 -> 180 tag
>> +SRCREV =3D "f13289ffdf077f75c8710e977ffe538b66885762"
>> +
>> +# version specific SRC_URI
>> +SRC_URI =3D =
"git://git.kernel.org/pub/scm/linux/hotplug/udev.git;protocol=3Dgit \
>> +           file://gtk-doc.make"
>> +
>> +# generic SRC_URI
>> +SRC_URI +=3D " \
>> +       file://touchscreen.rules \
>> +       file://modprobe.rules \
>> +"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +# Machine specific udev rules should be in their own recipe that =
${PN} can add to RRECOMMENDS
>> +
>> +inherit autotools
>> +
>> +EXTRA_OECONF +=3D " \
>> +                  --disable-introspection \
>> +                  --with-pci-ids-path=3D/usr/share/misc \
>> +                  ac_cv_file__usr_share_pci_ids=3Dno \
>> +                  ac_cv_file__usr_share_hwdata_pci_ids=3Dno \
>> +                  ac_cv_file__usr_share_misc_pci_ids=3Dyes \
>> +                  --sbindir=3D${base_sbindir} \
>> +                  --libexecdir=3D${base_libdir} \
>> +                  --with-rootlibdir=3D${base_libdir} \
>> +                  --with-rootprefix=3D \
>> +                  --disable-gtk-doc-html \
>> +                  =
--with-systemdsystemunitdir=3D${base_libdir}/systemd/system/ \
>> +"
>=20
> Do you get the above cached vars correctly set in config.log ?

I didn't directly check, but configure would abort if they didn't work =
:)

>=20
>> +
>> +do_configure_prepend() {
>> +       cp ${WORKDIR}/gtk-doc.make ${S}
>> +}
>> +
>> +PACKAGES =3D+ "${PN}-systemd libudev libgudev udev-consolekit =
udev-utils"
>> +
>> +FILES_${PN}-systemd =3D "${base_libdir}/systemd"
>> +RDEPENDS_${PN}-systemd +=3D "udev"
>> +
>> +FILES_libudev =3D "${base_libdir}/libudev.so.*"
>> +FILES_libgudev =3D "${base_libdir}/libgudev*.so.*"
>> +
>> +RDEPENDS_${PN} +=3D "udev-utils"
>> +RPROVIDES_${PN} =3D "hotplug"
>> +FILES_${PN} +=3D "${usrbindir}/* ${usrsbindir}/udevd"
>> +FILES_${PN}-dbg +=3D "${usrbindir}/.debug ${usrsbindir}/.debug"
>> +
>> +# udev installs binaries under $(udev_prefix)/lib/udev, even if =
${libdir}
>> +# is ${prefix}/lib64
>> +FILES_${PN} +=3D "/lib/udev*"
>=20
> Does this also mean that /lib/udev/ directory gets pulled in
> as well.

Yes, we need the rules as well


regards,

Koen=


