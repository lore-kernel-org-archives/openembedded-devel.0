Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id D02607E6F8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 04:27:18 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id u190so1285605qkh.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2019 21:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1xQU8oCXnIAWyeMpvI7u9qMK62tNDKg0Y6wMrcuGvD4=;
	b=s9IdBnL4FvoV3MjlQ9Or/v0ZczG3+oZyULQu4BAP8nlS4aRqEVH5j0cbVELu1AmW7+
	3L8vnJIRkZkWjMARCl2LCML9ZvG1YvcCMZPi7UuaEfBNxTFzwfMiVxto/khKw8CxisXV
	xw/5CB21kLIoIcMrNszgwSfEGC+4uPKpFgSX95ZxVd1/xajdjMcv+KgZCiQ43c9BYieD
	dTWPhFbTSSTOoqw7Vln92R9nHh8Kmy7Wx/N/ACIHHuU1tZhOAficRqjRq2evTBIj3mAj
	usH+KzIGpJxJV59JPEdIEiKyI3WsqEtiRqcCNRqCVN5Yyh6i3a2kksdbH2zJh6Ak1LTj
	5cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1xQU8oCXnIAWyeMpvI7u9qMK62tNDKg0Y6wMrcuGvD4=;
	b=CyLsTv1s0VAirptAEZZ6uMtuKEDgC33DY/4XUsxKp3RP5NCpiPxyNSTPHHGGz5fQcO
	9XroJ/auOooxXktXmx97i5TjQRDqh3citelrohpT4TsU9+f44mbZnITAVGMru/bxCH2V
	Rl6XVR33JkBEHqtXKqj7XF9L9q0PdyaBI+TXRaSoGjJWw5U+G0DOTAHXQunUuPQEL8Cl
	f2c2Lm/SQ4x4P1GxIOd2umkMeDkm9ji3wKbsI2Aa7gpNz+6h4vtxzQ3q7isG5pbQadbA
	zJZ/ap2PItaMOuFUHLPbW/6zN3tGlGGOwhXePx7CZxDUIa46so/qxtduToqxk7PVMhtf
	j54Q==
X-Gm-Message-State: APjAAAXAcyJEVzbqeq2SAFWDsbF0UroteqMyckAGRY8sXfnAVlZY1erL
	dbvM/x+d/h9OoFtX4QfB23FNP5u3i7u4ztK5PAk=
X-Google-Smtp-Source: APXvYqy/XV1w96hlBN/7RwQRZfhsFMuvfTY5fYQ69HOcPyftFKOPuaNN7u6UbOaRqb1kgBImirUGnmIiqzN6oamrXIk=
X-Received: by 2002:a37:ef1a:: with SMTP id j26mr2102709qkk.474.1566966439309; 
	Tue, 27 Aug 2019 21:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190828034307.182169-1-kai.kang@windriver.com>
In-Reply-To: <20190828034307.182169-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Aug 2019 21:27:02 -0700
Message-ID: <CAMKF1sroS6zWjdRmh2GLbCF62Hnmifzdr282t8JZBB-ONzd82Q@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][RFC PATCH 0/1] Failed to compile networkmanager with musl
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
X-List-Received-Date: Wed, 28 Aug 2019 04:27:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2019 at 8:43 PM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Hi Khem,
>
> I am updating networkmanager to 1.20. But I meet a problem with musl
> that "error: redefinition of 'struct ethhdr'". I find a patch for kernel
> which is created in Jan 2018. The musl part has been merged in musl:
>
> commit b583c5d3b4cc2c54c68eef5eb7855ecfacee8bfc
> Author: Hauke Mehrtens <hauke@hauke-m.de>
> Date:   Sat Jan 6 23:32:52 2018 +0100
>
>     add additional uapi guards for Linux kernel header files
>
>     With Linux kernel 4.16 it will be possible to guard more parts of the
>     Linux header files from a libc. Make use of this in musl to guard all
>     the structures and other definitions from the Linux header files whic=
h
>     are also defined by the header files provided by musl. This will make
>     it possible to compile source files which include both the libc
>     headers and the kernel userspace headers.
>
>     This extends the definitions done in commit 04983f227238 ("make
>     netinet/in.h suppress clashing definitions from kernel headers")
>
> But the kernel part doesn't exist in current kernel source.
> It should not be networkmanager specified.
>
> Do you have any suggestion to fix this error? Thanks.

the kernel patch should be applied to linux-libc-headers

>
>
> PS: detailed error messages:
>
> x86_64-poky-linux-musl-gcc -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfp=
math=3Dsse -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat=
-security -Werror=3Dformat-security --sysroot=3D/home/kkang/buildarea/222-Y=
octo/build-xfce-x86-64/tmp/work/core2-64-poky-linux-musl/networkmanager/1.2=
0.0-r0/recipe-sysroot -Isrc/25a6634@@NetworkManager@sta -Isrc -I../NetworkM=
anager-1.20.0/src -Ilibnm-core -I../NetworkManager-1.20.0/libnm-core -I. -I=
../NetworkManager-1.20.0/ -Ishared -I../NetworkManager-1.20.0/shared -I../N=
etworkManager-1.20.0/shared/systemd/sd-adapt-shared -I../NetworkManager-1.2=
0.0/shared/systemd/src/basic -I../NetworkManager-1.20.0/shared/systemd/src/=
shared -I/home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-6=
4-poky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/gio-u=
nix-2.0 -I/home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-=
64-poky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/glib=
-2.0 -I/home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-=
poky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/lib/glib-2.0/in=
clude -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -std=3Dgn=
u11 -fdata-sections -ffunction-sections -O2 -g -feliminate-unused-debug-typ=
es -fmacro-prefix-map=3D/home/kkang/buildarea/222-Yocto/build-xfce-x86-64/t=
mp/work/core2-64-poky-linux-musl/networkmanager/1.20.0-r0=3D/usr/src/debug/=
networkmanager/1.20.0-r0 -fdebug-prefix-map=3D/home/kkang/buildarea/222-Yoc=
to/build-xfce-x86-64/tmp/work/core2-64-poky-linux-musl/networkmanager/1.20.=
0-r0=3D/usr/src/debug/networkmanager/1.20.0-r0 -fdebug-prefix-map=3D/home/k=
kang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-linux-mus=
l/networkmanager/1.20.0-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/home/kka=
ng/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-linux-musl/=
networkmanager/1.20.0-r0/recipe-sysroot-native=3D -DRTLD_DEEPBIND=3D0 -fPIC=
 -pthread -DGLIB_VERSION_MIN_REQUIRED=3DGLIB_VERSION_2_40 -DGLIB_VERSION_MA=
X_ALLOWED=3DGLIB_VERSION_2_40 -DNETWORKMANAGER_COMPILATION=3DNM_NETWORKMANA=
GER_COMPILATION_DAEMON -MD -MQ 'src/25a6634@@NetworkManager@sta/devices_nm-=
device.c.o' -MF 'src/25a6634@@NetworkManager@sta/devices_nm-device.c.o.d' -=
o 'src/25a6634@@NetworkManager@sta/devices_nm-device.c.o' -c ../NetworkMana=
ger-1.20.0/src/devices/nm-device.c
> In file included from /home/kkang/buildarea/222-Yocto/build-xfce-x86-64/t=
mp/work/core2-64-poky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/us=
r/include/net/ethernet.h:10,
>                  from ../NetworkManager-1.20.0/src/systemd/src/systemd/sd=
-dhcp-client.h:23,
>                  from ../NetworkManager-1.20.0/src/systemd/nm-sd.h:21,
>                  from ../NetworkManager-1.20.0/src/devices/nm-device.c:76=
:
> /home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-=
linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/netinet/if_e=
ther.h:111:8: error: redefinition of 'struct ethhdr'
>   111 | struct ethhdr {
>       |        ^~~~~~
> In file included from ../NetworkManager-1.20.0/libnm-core/nm-utils.h:32,
>                  from ../NetworkManager-1.20.0/libnm-core/nm-setting-ip-c=
onfig.h:29,
>                  from ../NetworkManager-1.20.0/src/NetworkManagerUtils.h:=
26,
>                  from ../NetworkManager-1.20.0/src/devices/nm-device.h:31=
,
>                  from ../NetworkManager-1.20.0/src/devices/nm-device.c:23=
:
> /home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-=
linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/linux/if_eth=
er.h:167:8: note: originally defined here
>   167 | struct ethhdr {
>       |        ^~~~~~
> In file included from /home/kkang/buildarea/222-Yocto/build-xfce-x86-64/t=
mp/work/core2-64-poky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/us=
r/include/netinet/if_ether.h:118,
>                  from /home/kkang/buildarea/222-Yocto/build-xfce-x86-64/t=
mp/work/core2-64-poky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/us=
r/include/net/ethernet.h:10,
>                  from ../NetworkManager-1.20.0/src/systemd/src/systemd/sd=
-dhcp-client.h:23,
>                  from ../NetworkManager-1.20.0/src/systemd/nm-sd.h:21,
>                  from ../NetworkManager-1.20.0/src/devices/nm-device.c:76=
:
> /home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-=
linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/net/if_arp.h=
:22:8: error: redefinition of 'struct arphdr'
>    22 | struct arphdr {
>       |        ^~~~~~
> In file included from ../NetworkManager-1.20.0/src/devices/nm-device.c:34=
:
> /home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-=
linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/linux/if_arp=
.h:144:8: note: originally defined here
>   144 | struct arphdr {
>       |        ^~~~~~
>
>
> Regards,
> Kai
>
>
>
>
> Kai Kang (1):
>   networkmanager: 1.18.2 -> 1.20.0
>
>  ...e.ac-Fix-pkgconfig-sysroot-locations.patch |  22 ---
>  ...ttings-settings-property-documentati.patch |  71 ---------
>  ...on.build-pkgconfig-sysroot-locations.patch |  23 +++
>  ...eate-settings-property-documentation.patch | 146 ++++++++++++++++++
>  ...Fix-build-with-musl-systemd-specific.patch |  10 +-
>  .../musl/0002-Fix-build-with-musl.patch       |  12 +-
>  .../musl/0003-Fix-mrand48_r-with-musl.patch   |  47 ++++++
>  ...ger_1.18.2.bb =3D> networkmanager_1.20.0.bb} |  72 +++++----
>  8 files changed, 262 insertions(+), 141 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager/0002-Do-not-create-settings-settings-property-documentati.pat=
ch
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager/fix-meson.build-pkgconfig-sysroot-locations.patch
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager/meson-do-not-create-settings-property-documentation.patch
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager/musl/0003-Fix-mrand48_r-with-musl.patch
>  rename meta-networking/recipes-connectivity/networkmanager/{networkmanag=
er_1.18.2.bb =3D> networkmanager_1.20.0.bb} (62%)
>
> --
> 2.20.0
>

