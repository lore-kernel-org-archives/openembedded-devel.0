Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4BE057E684
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 03:43:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7S3hAUn011645
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Aug 2019 20:43:10 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 27 Aug 2019 20:43:09 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 27 Aug 2019 23:43:06 -0400
Message-ID: <20190828034307.182169-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][RFC PATCH 0/1] Failed to compile networkmanager with musl
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
X-List-Received-Date: Wed, 28 Aug 2019 03:43:10 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Hi Khem,

I am updating networkmanager to 1.20. But I meet a problem with musl
that "error: redefinition of 'struct ethhdr'". I find a patch for kernel
which is created in Jan 2018. The musl part has been merged in musl:

commit b583c5d3b4cc2c54c68eef5eb7855ecfacee8bfc
Author: Hauke Mehrtens <hauke@hauke-m.de>
Date:   Sat Jan 6 23:32:52 2018 +0100

    add additional uapi guards for Linux kernel header files
=20=20=20=20
    With Linux kernel 4.16 it will be possible to guard more parts of the
    Linux header files from a libc. Make use of this in musl to guard all
    the structures and other definitions from the Linux header files which
    are also defined by the header files provided by musl. This will make
    it possible to compile source files which include both the libc
    headers and the kernel userspace headers.
=20=20=20=20
    This extends the definitions done in commit 04983f227238 ("make
    netinet/in.h suppress clashing definitions from kernel headers")

But the kernel part doesn't exist in current kernel source.
It should not be networkmanager specified.

Do you have any suggestion to fix this error? Thanks.


PS: detailed error messages:

x86_64-poky-linux-musl-gcc -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpma=
th=3Dsse -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-s=
ecurity -Werror=3Dformat-security --sysroot=3D/home/kkang/buildarea/222-Yoc=
to/build-xfce-x86-64/tmp/work/core2-64-poky-linux-musl/networkmanager/1.20.=
0-r0/recipe-sysroot -Isrc/25a6634@@NetworkManager@sta -Isrc -I../NetworkMan=
ager-1.20.0/src -Ilibnm-core -I../NetworkManager-1.20.0/libnm-core -I. -I..=
/NetworkManager-1.20.0/ -Ishared -I../NetworkManager-1.20.0/shared -I../Net=
workManager-1.20.0/shared/systemd/sd-adapt-shared -I../NetworkManager-1.20.=
0/shared/systemd/src/basic -I../NetworkManager-1.20.0/shared/systemd/src/sh=
ared -I/home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-=
poky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/gio-uni=
x-2.0 -I/home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64=
-poky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/glib-2=
.0 -I/home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-po=
ky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/lib/glib-2.0/incl=
ude -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -std=3Dgnu1=
1 -fdata-sections -ffunction-sections -O2 -g -feliminate-unused-debug-types=
 -fmacro-prefix-map=3D/home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp=
/work/core2-64-poky-linux-musl/networkmanager/1.20.0-r0=3D/usr/src/debug/ne=
tworkmanager/1.20.0-r0 -fdebug-prefix-map=3D/home/kkang/buildarea/222-Yocto=
/build-xfce-x86-64/tmp/work/core2-64-poky-linux-musl/networkmanager/1.20.0-=
r0=3D/usr/src/debug/networkmanager/1.20.0-r0 -fdebug-prefix-map=3D/home/kka=
ng/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-linux-musl/=
networkmanager/1.20.0-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/home/kkang=
/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-linux-musl/ne=
tworkmanager/1.20.0-r0/recipe-sysroot-native=3D -DRTLD_DEEPBIND=3D0 -fPIC -=
pthread -DGLIB_VERSION_MIN_REQUIRED=3DGLIB_VERSION_2_40 -DGLIB_VERSION_MAX_=
ALLOWED=3DGLIB_VERSION_2_40 -DNETWORKMANAGER_COMPILATION=3DNM_NETWORKMANAGE=
R_COMPILATION_DAEMON -MD -MQ 'src/25a6634@@NetworkManager@sta/devices_nm-de=
vice.c.o' -MF 'src/25a6634@@NetworkManager@sta/devices_nm-device.c.o.d' -o =
'src/25a6634@@NetworkManager@sta/devices_nm-device.c.o' -c ../NetworkManage=
r-1.20.0/src/devices/nm-device.c=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
In file included from /home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp=
/work/core2-64-poky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/=
include/net/ethernet.h:10,
                 from ../NetworkManager-1.20.0/src/systemd/src/systemd/sd-d=
hcp-client.h:23,
                 from ../NetworkManager-1.20.0/src/systemd/nm-sd.h:21,
                 from ../NetworkManager-1.20.0/src/devices/nm-device.c:76:
/home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-li=
nux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/netinet/if_eth=
er.h:111:8: error: redefinition of 'struct ethhdr'
  111 | struct ethhdr {
      |        ^~~~~~
In file included from ../NetworkManager-1.20.0/libnm-core/nm-utils.h:32,
                 from ../NetworkManager-1.20.0/libnm-core/nm-setting-ip-con=
fig.h:29,
                 from ../NetworkManager-1.20.0/src/NetworkManagerUtils.h:26,
                 from ../NetworkManager-1.20.0/src/devices/nm-device.h:31,
                 from ../NetworkManager-1.20.0/src/devices/nm-device.c:23:
/home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-li=
nux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/linux/if_ether=
.h:167:8: note: originally defined here
  167 | struct ethhdr {
      |        ^~~~~~
In file included from /home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp=
/work/core2-64-poky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/=
include/netinet/if_ether.h:118,
                 from /home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp=
/work/core2-64-poky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/=
include/net/ethernet.h:10,
                 from ../NetworkManager-1.20.0/src/systemd/src/systemd/sd-d=
hcp-client.h:23,
                 from ../NetworkManager-1.20.0/src/systemd/nm-sd.h:21,
                 from ../NetworkManager-1.20.0/src/devices/nm-device.c:76:
/home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-li=
nux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/net/if_arp.h:2=
2:8: error: redefinition of 'struct arphdr'
   22 | struct arphdr {
      |        ^~~~~~
In file included from ../NetworkManager-1.20.0/src/devices/nm-device.c:34:
/home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-li=
nux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/linux/if_arp.h=
:144:8: note: originally defined here
  144 | struct arphdr {
      |        ^~~~~~


Regards,
Kai




Kai Kang (1):
  networkmanager: 1.18.2 -> 1.20.0

 ...e.ac-Fix-pkgconfig-sysroot-locations.patch |  22 ---
 ...ttings-settings-property-documentati.patch |  71 ---------
 ...on.build-pkgconfig-sysroot-locations.patch |  23 +++
 ...eate-settings-property-documentation.patch | 146 ++++++++++++++++++
 ...Fix-build-with-musl-systemd-specific.patch |  10 +-
 .../musl/0002-Fix-build-with-musl.patch       |  12 +-
 .../musl/0003-Fix-mrand48_r-with-musl.patch   |  47 ++++++
 ...ger_1.18.2.bb =3D> networkmanager_1.20.0.bb} |  72 +++++----
 8 files changed, 262 insertions(+), 141 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/net=
workmanager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/net=
workmanager/0002-Do-not-create-settings-settings-property-documentati.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/net=
workmanager/fix-meson.build-pkgconfig-sysroot-locations.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/net=
workmanager/meson-do-not-create-settings-property-documentation.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/net=
workmanager/musl/0003-Fix-mrand48_r-with-musl.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager=
_1.18.2.bb =3D> networkmanager_1.20.0.bb} (62%)

--=20
2.20.0


