Return-Path: <gabriel.pickl@posteo.net>
X-Greylist: delayed 406 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 Jan 2018 16:27:26 UTC
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	by mail.openembedded.org (Postfix) with ESMTP id E49A778235
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 16:27:26 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
	by mout01.posteo.de (Postfix) with ESMTPS id C475E20F18
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 17:20:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1515428440; bh=yv3lMwoswbT6GFFfr8rbPAyhe+Mr4GhVnGYWrp3ibeE=;
	h=From:Subject:Date:To:From;
	b=A8Y/R3VzZOkACeYQiyAT2fc+4DiDrp4J4B8CHrJg9IDu9KI563stCFbZZTHioOT2a
	O0A/VcZBjZuuSAfEZ+61vpn+oDQuM4N68XScfT0t6RPBc+yyeHIyL8jCFo0kgHUY8M
	ieuxvxY4eZ+yOpvKcmTijveaLd7l2QByqEzRsLovd2kOdF4p1GXr/mYOX7D2MqBpkS
	p8Zx3hMQY0NqrTGgufpm/l/PJA096uJSJVLkbbIs1OVkXRVg/MNxFXY5fco5CIpSog
	91SBUvoc9fEm/RrAjYSm57tLTYape54GIy/u+YwW7VkUF25nk2f6X31vJ+plmXGm1D
	V6acNzN+pL0ZQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 3zFgRl0XxMz9s2m
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 17:18:10 +0100 (CET)
From: Gabriel Pickl <gabriel.pickl@posteo.net>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Message-Id: <82ECBD09-34B5-4DD0-8636-6217B491E383@posteo.net>
Date: Mon, 8 Jan 2018 17:18:06 +0100
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3445.5.20)
Subject: [meta-oe] python-opencv cannot be built
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
X-List-Received-Date: Mon, 08 Jan 2018 16:27:27 -0000
X-Groupsio-MsgNum: 70236
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_C502CD3F-3DF0-4EF8-BE95-F8704DC92699"

--Apple-Mail=_C502CD3F-3DF0-4EF8-BE95-F8704DC92699
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello everyone,

I am experiencing a slight problem with the opencv recipe. Depending on =
python3-opencv works fine, but when i try adding

```
PACKAGECONFIG_append =3D =E2=80=9C python2=E2=80=9D
```

and depend on the package python-opencv, the build fails with the =
messages in python2.log.

This seems like a conflict between python2 and python3 (the code in the =
recipes seems to suggest only one will be built at a time), so I =
manually removed the python3 feature with

```
PACKAGECONFIG_remove =3D =E2=80=9Cpython3=E2=80=9D
```

With this, the package build seems to succeed, but when building the =
rootfs, python-opencv does not seem to exist in the packages, as seen in =
python2-no-python3.log

I=E2=80=99m not sure what is happening here. Am i using the recipe =
wrong?

I am using the rocko branch of meta-oe and building for arm.

Thanks for taking your time reading this and possibly helping me find a =
solution :)

Regards,

Gabriel.

--Apple-Mail=_C502CD3F-3DF0-4EF8-BE95-F8704DC92699
Content-Disposition: attachment;
	filename=python2.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="python2.log"
Content-Transfer-Encoding: quoted-printable

DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are ['virtual:native:/home/ubuntu/qinematiq-new/p=
oky/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb:do_populate_sysroot', =
'virtual:native:/home/ubuntu/qinematiq-new/poky/meta/recipes-core/update-rc=
.d/update-rc.d_0.7.bb:do_populate_sysroot', 'virtual:native:/home/ubuntu/qi=
nematiq-new/poky/meta/recipes-devtools/rpm/rpm_git.bb:do_populate_sysroot',=
 '/home/ubuntu/qinematiq-new/poky/meta/recipes-core/glibc/ldconfig-native_2=
.12.1.bb:do_populate_sysroot', 'virtual:native:/home/ubuntu/qinematiq-new/p=
oky/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb:do_populate_sysr=
oot', 'virtual:native:/home/ubuntu/qinematiq-new/poky/meta/recipes-devtools=
/opkg-utils/opkg-utils_0.3.5.bb:do_populate_sysroot', '/home/ubuntu/qinemat=
iq-new/poky/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate=
_sysroot', '/home/ubuntu/qinematiq-new/poky/meta/recipes-kernel/kmod/depmod=
wrapper-cross_1.0.bb:do_populate_sysroot', 'virtual:native:/home/ubuntu/qin=
ematiq-new/poky/meta/recipes-devtools/opkg/opkg_0.3.5.bb:do_populate_sysroo=
t', 'virtual:native:/home/ubuntu/qinematiq-new/poky/meta/recipes-devtools/p=
relink/prelink_git.bb:do_populate_sysroot', 'virtual:native:/home/ubuntu/qi=
nematiq-new/poky/meta/recipes-extended/pigz/pigz_2.3.4.bb:do_populate_sysro=
ot', 'virtual:native:/home/ubuntu/qinematiq-new/poky/meta/recipes-devtools/=
dnf/dnf_2.6.3.bb:do_populate_sysroot', '/home/ubuntu/qinematiq-new/poky/met=
a/recipes-devtools/mklibs/mklibs-native_0.1.43.bb:do_populate_sysroot', 'vi=
rtual:native:/home/ubuntu/qinematiq-new/poky/meta/recipes-devtools/pseudo/p=
seudo_1.8.2.bb:do_populate_sysroot']
NOTE: Installed into sysroot: []
NOTE: Skipping as already exists in sysroot: ['makedevs-native', 'update-rc=
.d-native', 'rpm-native', 'ldconfig-native', 'createrepo-c-native', 'opkg-u=
tils-native', 'qemuwrapper-cross', 'depmodwrapper-cross', 'opkg-native', 'p=
relink-native', 'pigz-native', 'dnf-native', 'mklibs-native', 'pseudo-nativ=
e', 'quilt-native', 'kmod-native', 'qemu-native', 'shadow-native', 'nss-nat=
ive', 'gnu-config-native', 'dbus-native', 'libtool-native', 'xz-native', 'b=
zip2-native', 'pkgconfig-native', 'libarchive-native', 'popt-native', 'elfu=
tils-native', 'python3-native', 'gettext-minimal-native', 'automake-native'=
, 'file-native', 'autoconf-native', 'db-native', 'cmake-native', 'curl-nati=
ve', 'expat-native', 'zlib-native', 'glib-2.0-native', 'sqlite3-native', 'o=
penssl-native', 'libxml2-native', 'gtk-icon-utils-native', 'gdk-pixbuf-nati=
ve', 'debianutils-native', 'libsolv-native', 'binutils-native', 'librepo-na=
tive', 'libdnf-native', 'python3-iniparse-native', 'libcomps-native', 'gtk-=
doc-native', 'dtc-native', 'libsdl-native', 'pixman-native', 'alsa-lib-nati=
ve', 'nspr-native', 'texinfo-dummy-native', 'e2fsprogs-native', 'readline-n=
ative', 'm4-native', 'libffi-native', 'gettext-native', 'libpcre-native', '=
util-linux-native', 'cryptodev-linux-native', 'makedepend-native', 'librsvg=
-native', 'shared-mime-info-native', 'libjpeg-turbo-native', 'gobject-intro=
spection-native', 'libpng-native', 'flex-native', 'bison-native', 'attr-nat=
ive', 'gpgme-native', 'libcheck-native', 'python3-six-native', 'libxrandr-n=
ative', 'libxrender-native', 'libxext-native', 'libx11-native', 'util-macro=
s-native', 'ncurses-native', 'lzo-native', 'xproto-native', 'libcroco-nativ=
e', 'cairo-native', 'pango-native', 'intltool-native', 'libgpg-error-native=
', 'libassuan-native', 'swig-native', 'python3-setuptools-native', 'randrpr=
oto-native', 'renderproto-native', 'xextproto-native', 'kbproto-native', 'l=
ibxcb-native', 'xtrans-native', 'inputproto-native', 'libsm-native', 'fontc=
onfig-native', 'libxft-native', 'freetype-native', 'harfbuzz-native', 'libx=
ml-parser-perl-native', 'unzip-native', 'libxdmcp-native', 'libpthread-stub=
s-native', 'xcb-proto-native', 'libxau-native', 'libice-native', 'gperf-nat=
ive', 'icu-native', 'perl-native', 'gdbm-native']
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing python function do_rootfs
NOTE: ###### Generate rootfs #######
NOTE: Executing '/home/ubuntu/qinematiq-new/poky/build/tmp/work/elphel393-p=
oky-linux-gnueabi/core-image-imu/1.0-r0/recipe-sysroot-native/usr/bin/creat=
erepo_c --update -q /home/ubuntu/qinematiq-new/poky/build/tmp/work/elphel39=
3-poky-linux-gnueabi/core-image-imu/1.0-r0/oe-rootfs-repo' ...
NOTE: Added oe-repo repo from /home/ubuntu/qinematiq-new/poky/build/tmp/wor=
k/elphel393-poky-linux-gnueabi/core-image-imu/1.0-r0/oe-rootfs-repo
oe-repo                                         220 MB/s | 1.6 MB     00:00=
   =20
Last metadata expiration check: 0:00:00 ago on Mon 08 Jan 2018 03:52:30 PM =
UTC.
Metadata cache created.

ERROR: Could not invoke dnf. Command '/home/ubuntu/qinematiq-new/poky/build=
/tmp/work/elphel393-poky-linux-gnueabi/core-image-imu/1.0-r0/recipe-sysroot=
-native/usr/bin/dnf -y -c /home/ubuntu/qinematiq-new/poky/build/tmp/work/el=
phel393-poky-linux-gnueabi/core-image-imu/1.0-r0/rootfs/etc/dnf/dnf.conf --=
setopt=3Dreposdir=3D/home/ubuntu/qinematiq-new/poky/build/tmp/work/elphel39=
3-poky-linux-gnueabi/core-image-imu/1.0-r0/rootfs/etc/yum.repos.d --repofro=
mpath=3Doe-repo,/home/ubuntu/qinematiq-new/poky/build/tmp/work/elphel393-po=
ky-linux-gnueabi/core-image-imu/1.0-r0/oe-rootfs-repo --installroot=3D/home=
/ubuntu/qinematiq-new/poky/build/tmp/work/elphel393-poky-linux-gnueabi/core=
-image-imu/1.0-r0/rootfs --setopt=3Dlogdir=3D/home/ubuntu/qinematiq-new/pok=
y/build/tmp/work/elphel393-poky-linux-gnueabi/core-image-imu/1.0-r0/temp --=
nogpgcheck install perl nfs-utils-client e2fsprogs hdparm packagegroup-core=
-boot udev-rules dhcp-client elphel-python-extensions sudo fpga-x393 zip in=
it openssh lighttpd apps-histograms opencv-dev mtd-utils-ubifs libopencv-ob=
jdetect-dev apps-autocampars fpga-x393sata nano php-cgi apps-gps mtd-utils-=
misc libopencv-core-dev fpga-x359 libopencv-ml-dev apache2 python-opencv sh=
adow php-cli web-393 iw run-postinsts lighttpd-module-setenv gstreamer1.0 p=
arted python-pyzmq lighttpd-module-cgi smartmontools python-pyyaml linux-fi=
rmware-rtl8192cu tree sntp kernel-module-ahci-elphel ethtool gcc dhcpcd dos=
fstools apps-editconf opencv-apps python3 coreutils wget apps-astreamer mtd=
-utils rsync python-core lighttpd-module-fastcgi base-passwd ntpdate alsa-u=
tils python-json u-boot-ezynq libsjs python-argparse i2c-tools libopencv-hi=
ghgui-dev wpa-supplicant net-tools web-camvc ntp htop web-hwmon apps-camogm=
 apps-autoexposure apps-imgsrv python-xml python-numpy libopencv-imgproc-de=
v overlay-sync opencv python-modules apps-tempmon' returned 1:
Added oe-repo repo from /home/ubuntu/qinematiq-new/poky/build/tmp/work/elph=
el393-poky-linux-gnueabi/core-image-imu/1.0-r0/oe-rootfs-repo
Last metadata expiration check: 0:00:00 ago on Mon 08 Jan 2018 03:52:30 PM =
UTC.
Error:=20
 Problem 1: conflicting requests
  - nothing provides python3-opencv needed by opencv-3.3+git0+87c27a074d_2a=
9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.cortexa9_neon
 Problem 2: package opencv-dev-3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34=
e4206aef_fccf7cd6a4-r0.cortexa9_neon requires opencv =3D 3.3+git0+87c27a074=
d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0, but none of the providers=
 can be installed
  - conflicting requests
  - nothing provides python3-opencv needed by opencv-3.3+git0+87c27a074d_2a=
9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.cortexa9_neon
 Problem 3: package libopencv-objdetect-dev-3.3+git0+87c27a074d_2a9d1b22ed_=
a62e20676a_34e4206aef_fccf7cd6a4-r0.cortexa9_neon requires opencv-dev, but =
none of the providers can be installed
  - package opencv-dev-3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef=
_fccf7cd6a4-r0.cortexa9_neon requires opencv =3D 3.3+git0+87c27a074d_2a9d1b=
22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0, but none of the providers can be =
installed
  - conflicting requests
  - nothing provides python3-opencv needed by opencv-3.3+git0+87c27a074d_2a=
9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.cortexa9_neon
 Problem 4: package libopencv-core-dev-3.3+git0+87c27a074d_2a9d1b22ed_a62e2=
0676a_34e4206aef_fccf7cd6a4-r0.cortexa9_neon requires opencv-dev, but none =
of the providers can be installed
  - package opencv-dev-3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef=
_fccf7cd6a4-r0.cortexa9_neon requires opencv =3D 3.3+git0+87c27a074d_2a9d1b=
22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0, but none of the providers can be =
installed
  - conflicting requests
  - nothing provides python3-opencv needed by opencv-3.3+git0+87c27a074d_2a=
9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.cortexa9_neon
 Problem 5: package libopencv-ml-dev-3.3+git0+87c27a074d_2a9d1b22ed_a62e206=
76a_34e4206aef_fccf7cd6a4-r0.cortexa9_neon requires opencv-dev, but none of=
 the providers can be installed
  - package opencv-dev-3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef=
_fccf7cd6a4-r0.cortexa9_neon requires opencv =3D 3.3+git0+87c27a074d_2a9d1b=
22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0, but none of the providers can be =
installed
  - conflicting requests
  - nothing provides python3-opencv needed by opencv-3.3+git0+87c27a074d_2a=
9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.cortexa9_neon
 Problem 6: package libopencv-highgui-dev-3.3+git0+87c27a074d_2a9d1b22ed_a6=
2e20676a_34e4206aef_fccf7cd6a4-r0.cortexa9_neon requires opencv-dev, but no=
ne of the providers can be installed
  - package opencv-dev-3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef=
_fccf7cd6a4-r0.cortexa9_neon requires opencv =3D 3.3+git0+87c27a074d_2a9d1b=
22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0, but none of the providers can be =
installed
  - conflicting requests
  - nothing provides python3-opencv needed by opencv-3.3+git0+87c27a074d_2a=
9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.cortexa9_neon
 Problem 7: package libopencv-imgproc-dev-3.3+git0+87c27a074d_2a9d1b22ed_a6=
2e20676a_34e4206aef_fccf7cd6a4-r0.cortexa9_neon requires opencv-dev, but no=
ne of the providers can be installed
  - package opencv-dev-3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef=
_fccf7cd6a4-r0.cortexa9_neon requires opencv =3D 3.3+git0+87c27a074d_2a9d1b=
22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0, but none of the providers can be =
installed
  - conflicting requests
  - nothing provides python3-opencv needed by opencv-3.3+git0+87c27a074d_2a=
9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.cortexa9_neon

DEBUG: Python function do_rootfs finished
ERROR: Function failed: do_rootfs

--Apple-Mail=_C502CD3F-3DF0-4EF8-BE95-F8704DC92699
Content-Disposition: attachment;
	filename=python2-no-python3.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="python2-no-python3.log"
Content-Transfer-Encoding: quoted-printable

DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are ['virtual:native:/home/ubuntu/qinematiq-new/p=
oky/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb:do_populate_sysr=
oot', '/home/ubuntu/qinematiq-new/poky/meta/recipes-devtools/qemu/qemuwrapp=
er-cross_1.0.bb:do_populate_sysroot', 'virtual:native:/home/ubuntu/qinemati=
q-new/poky/meta/recipes-devtools/dnf/dnf_2.6.3.bb:do_populate_sysroot', '/h=
ome/ubuntu/qinematiq-new/poky/meta/recipes-devtools/mklibs/mklibs-native_0.=
1.43.bb:do_populate_sysroot', 'virtual:native:/home/ubuntu/qinematiq-new/po=
ky/meta/recipes-devtools/rpm/rpm_git.bb:do_populate_sysroot', 'virtual:nati=
ve:/home/ubuntu/qinematiq-new/poky/meta/recipes-devtools/makedevs/makedevs_=
1.0.1.bb:do_populate_sysroot', '/home/ubuntu/qinematiq-new/poky/meta/recipe=
s-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot', 'virtual:nat=
ive:/home/ubuntu/qinematiq-new/poky/meta/recipes-devtools/pseudo/pseudo_1.8=
.2.bb:do_populate_sysroot', 'virtual:native:/home/ubuntu/qinematiq-new/poky=
/meta/recipes-devtools/opkg/opkg_0.3.5.bb:do_populate_sysroot', 'virtual:na=
tive:/home/ubuntu/qinematiq-new/poky/meta/recipes-core/update-rc.d/update-r=
c.d_0.7.bb:do_populate_sysroot', 'virtual:native:/home/ubuntu/qinematiq-new=
/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_populate_sysroot', 'v=
irtual:native:/home/ubuntu/qinematiq-new/poky/meta/recipes-extended/pigz/pi=
gz_2.3.4.bb:do_populate_sysroot', '/home/ubuntu/qinematiq-new/poky/meta/rec=
ipes-core/glibc/ldconfig-native_2.12.1.bb:do_populate_sysroot', 'virtual:na=
tive:/home/ubuntu/qinematiq-new/poky/meta/recipes-devtools/opkg-utils/opkg-=
utils_0.3.5.bb:do_populate_sysroot']
NOTE: Installed into sysroot: []
NOTE: Skipping as already exists in sysroot: ['createrepo-c-native', 'qemuw=
rapper-cross', 'dnf-native', 'mklibs-native', 'rpm-native', 'makedevs-nativ=
e', 'depmodwrapper-cross', 'pseudo-native', 'opkg-native', 'update-rc.d-nat=
ive', 'prelink-native', 'pigz-native', 'ldconfig-native', 'opkg-utils-nativ=
e', 'shadow-native', 'gdk-pixbuf-native', 'qemu-native', 'curl-native', 'op=
enssl-native', 'expat-native', 'libxml2-native', 'python3-native', 'file-na=
tive', 'sqlite3-native', 'glib-2.0-native', 'cmake-native', 'zlib-native', =
'pkgconfig-native', 'quilt-native', 'xz-native', 'gettext-minimal-native', =
'python3-iniparse-native', 'librepo-native', 'libdnf-native', 'libcomps-nat=
ive', 'gnu-config-native', 'autoconf-native', 'automake-native', 'libtool-n=
ative', 'nss-native', 'popt-native', 'dbus-native', 'bzip2-native', 'libarc=
hive-native', 'db-native', 'elfutils-native', 'kmod-native', 'libsolv-nativ=
e', 'binutils-native', 'gtk-icon-utils-native', 'debianutils-native', 'libj=
peg-turbo-native', 'gtk-doc-native', 'libpng-native', 'gobject-introspectio=
n-native', 'shared-mime-info-native', 'pixman-native', 'dtc-native', 'alsa-=
lib-native', 'libsdl-native', 'makedepend-native', 'cryptodev-linux-native'=
, 'readline-native', 'util-linux-native', 'libpcre-native', 'gettext-native=
', 'libffi-native', 'python3-six-native', 'attr-native', 'gpgme-native', 'l=
ibcheck-native', 'm4-native', 'texinfo-dummy-native', 'nspr-native', 'e2fsp=
rogs-native', 'flex-native', 'bison-native', 'librsvg-native', 'intltool-na=
tive', 'util-macros-native', 'libx11-native', 'libxrandr-native', 'libxrend=
er-native', 'libxext-native', 'xproto-native', 'ncurses-native', 'lzo-nativ=
e', 'python3-setuptools-native', 'libassuan-native', 'libgpg-error-native',=
 'swig-native', 'cairo-native', 'pango-native', 'libcroco-native', 'libxml-=
parser-perl-native', 'kbproto-native', 'xextproto-native', 'libxcb-native',=
 'inputproto-native', 'xtrans-native', 'randrproto-native', 'renderproto-na=
tive', 'unzip-native', 'fontconfig-native', 'libsm-native', 'harfbuzz-nativ=
e', 'libxft-native', 'freetype-native', 'perl-native', 'xcb-proto-native', =
'libxau-native', 'libpthread-stubs-native', 'libxdmcp-native', 'gperf-nativ=
e', 'libice-native', 'icu-native', 'gdbm-native']
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing python function do_rootfs
NOTE: ###### Generate rootfs #######
NOTE: Executing '/home/ubuntu/qinematiq-new/poky/build/tmp/work/elphel393-p=
oky-linux-gnueabi/core-image-imu/1.0-r0/recipe-sysroot-native/usr/bin/creat=
erepo_c --update -q /home/ubuntu/qinematiq-new/poky/build/tmp/work/elphel39=
3-poky-linux-gnueabi/core-image-imu/1.0-r0/oe-rootfs-repo' ...
NOTE: Added oe-repo repo from /home/ubuntu/qinematiq-new/poky/build/tmp/wor=
k/elphel393-poky-linux-gnueabi/core-image-imu/1.0-r0/oe-rootfs-repo
oe-repo                                         204 MB/s | 1.6 MB     00:00=
   =20
Last metadata expiration check: 0:00:00 ago on Mon 08 Jan 2018 04:10:11 PM =
UTC.
Metadata cache created.

ERROR: Could not invoke dnf. Command '/home/ubuntu/qinematiq-new/poky/build=
/tmp/work/elphel393-poky-linux-gnueabi/core-image-imu/1.0-r0/recipe-sysroot=
-native/usr/bin/dnf -y -c /home/ubuntu/qinematiq-new/poky/build/tmp/work/el=
phel393-poky-linux-gnueabi/core-image-imu/1.0-r0/rootfs/etc/dnf/dnf.conf --=
setopt=3Dreposdir=3D/home/ubuntu/qinematiq-new/poky/build/tmp/work/elphel39=
3-poky-linux-gnueabi/core-image-imu/1.0-r0/rootfs/etc/yum.repos.d --repofro=
mpath=3Doe-repo,/home/ubuntu/qinematiq-new/poky/build/tmp/work/elphel393-po=
ky-linux-gnueabi/core-image-imu/1.0-r0/oe-rootfs-repo --installroot=3D/home=
/ubuntu/qinematiq-new/poky/build/tmp/work/elphel393-poky-linux-gnueabi/core=
-image-imu/1.0-r0/rootfs --setopt=3Dlogdir=3D/home/ubuntu/qinematiq-new/pok=
y/build/tmp/work/elphel393-poky-linux-gnueabi/core-image-imu/1.0-r0/temp --=
nogpgcheck install sntp alsa-utils smartmontools apps-imgsrv libopencv-core=
-dev python-numpy apps-autoexposure opencv libopencv-objdetect-dev nfs-util=
s-client fpga-x359 e2fsprogs i2c-tools run-postinsts ethtool overlay-sync p=
hp-cli ntp apps-editconf base-passwd opencv-apps rsync libopencv-highgui-de=
v wget packagegroup-core-boot libopencv-imgproc-dev dhcpcd web-hwmon libope=
ncv-ml-dev python-pyzmq openssh gstreamer1.0 kernel-module-ahci-elphel ligh=
ttpd-module-fastcgi htop apps-histograms sudo php-cgi apps-autocampars apps=
-camogm elphel-python-extensions linux-firmware-rtl8192cu python-argparse l=
ighttpd-module-setenv parted python-pyyaml python-json wpa-supplicant dhcp-=
client apps-astreamer coreutils apache2 dosfstools fpga-x393 python-opencv =
zip opencv-dev lighttpd-module-cgi fpga-x393sata libsjs tree iw web-camvc n=
ano apps-gps gcc apps-tempmon lighttpd mtd-utils python-xml web-393 python-=
modules u-boot-ezynq mtd-utils-misc ntpdate net-tools python3 python-core i=
nit udev-rules shadow hdparm perl mtd-utils-ubifs' returned 1:
Added oe-repo repo from /home/ubuntu/qinematiq-new/poky/build/tmp/work/elph=
el393-poky-linux-gnueabi/core-image-imu/1.0-r0/oe-rootfs-repo
Last metadata expiration check: 0:00:00 ago on Mon 08 Jan 2018 04:10:11 PM =
UTC.
No package python-opencv available.
Error: Unable to find a match

DEBUG: Python function do_rootfs finished
ERROR: Function failed: do_rootfs

--Apple-Mail=_C502CD3F-3DF0-4EF8-BE95-F8704DC92699--
