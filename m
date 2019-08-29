Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C78317ECB9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 01:40:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7T1eq6F011391
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Aug 2019 18:40:52 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 28 Aug 2019 18:40:51 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20190828034307.182169-1-kai.kang@windriver.com>
	<CAMKF1sroS6zWjdRmh2GLbCF62Hnmifzdr282t8JZBB-ONzd82Q@mail.gmail.com>
	<CADkTA4MfM16A=+joFJnG6uv-u7Zw73TqzbubsPxzhKuqzeio5Q@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <0e5c77d6-803f-152d-e815-5d77be50798a@windriver.com>
Date: Thu, 29 Aug 2019 09:39:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4MfM16A=+joFJnG6uv-u7Zw73TqzbubsPxzhKuqzeio5Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Aug 2019 01:40:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 2019/8/28 =E4=B8=8B=E5=8D=888:33, Bruce Ashfield wrote:
> On Wed, Aug 28, 2019 at 12:27 AM Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Aug 27, 2019 at 8:43 PM <kai.kang@windriver.com> wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> Hi Khem,
>>>
>>> I am updating networkmanager to 1.20. But I meet a problem with musl
>>> that "error: redefinition of 'struct ethhdr'". I find a patch for ker=
nel
>>> which is created in Jan 2018. The musl part has been merged in musl:
>>>
>>> commit b583c5d3b4cc2c54c68eef5eb7855ecfacee8bfc
>>> Author: Hauke Mehrtens <hauke@hauke-m.de>
>>> Date:   Sat Jan 6 23:32:52 2018 +0100
>>>
>>>      add additional uapi guards for Linux kernel header files
>>>
>>>      With Linux kernel 4.16 it will be possible to guard more parts o=
f the
>>>      Linux header files from a libc. Make use of this in musl to guar=
d all
>>>      the structures and other definitions from the Linux header files=
 which
>>>      are also defined by the header files provided by musl. This will=
 make
>>>      it possible to compile source files which include both the libc
>>>      headers and the kernel userspace headers.
>>>
>>>      This extends the definitions done in commit 04983f227238 ("make
>>>      netinet/in.h suppress clashing definitions from kernel headers")=

>>>
>>> But the kernel part doesn't exist in current kernel source.
>>> It should not be networkmanager specified.
>>>
>>> Do you have any suggestion to fix this error? Thanks.
>> the kernel patch should be applied to linux-libc-headers
> .. and please wait a day or so before sending it, since I'm about to
> bump the reference headers to 5.2

It seems musl's fault that there is already a patch for the header=20
files. I update the patch and can fix this issue. If no big change
in linux headers 5.2, then networkmanger 1.20 won't be affected.

Thanks.

Kai



>
> Cheers,
>
> Bruce
>
>>>
>>> PS: detailed error messages:
>>>
>>> x86_64-poky-linux-musl-gcc -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 =
-mfpmath=3Dsse -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat -W=
format-security -Werror=3Dformat-security --sysroot=3D/home/kkang/buildar=
ea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-linux-musl/networkm=
anager/1.20.0-r0/recipe-sysroot -Isrc/25a6634@@NetworkManager@sta -Isrc -=
I../NetworkManager-1.20.0/src -Ilibnm-core -I../NetworkManager-1.20.0/lib=
nm-core -I. -I../NetworkManager-1.20.0/ -Ishared -I../NetworkManager-1.20=
=2E0/shared -I../NetworkManager-1.20.0/shared/systemd/sd-adapt-shared -I.=
=2E/NetworkManager-1.20.0/shared/systemd/src/basic -I../NetworkManager-1.=
20.0/shared/systemd/src/shared -I/home/kkang/buildarea/222-Yocto/build-xf=
ce-x86-64/tmp/work/core2-64-poky-linux-musl/networkmanager/1.20.0-r0/reci=
pe-sysroot/usr/include/gio-unix-2.0 -I/home/kkang/buildarea/222-Yocto/bui=
ld-xfce-x86-64/tmp/work/core2-64-poky-linux-musl/networkmanager/1.20.0-r0=
/recipe-sysroot/usr/include/glib-2.0 -I/home/kkang/buildare
>>   a/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-linux-musl/netw=
orkmanager/1.20.0-r0/recipe-sysroot/usr/lib/glib-2.0/include -fdiagnostic=
s-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -std=3Dgnu11 -fdata-secti=
ons -ffunction-sections -O2 -g -feliminate-unused-debug-types -fmacro-pre=
fix-map=3D/home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core=
2-64-poky-linux-musl/networkmanager/1.20.0-r0=3D/usr/src/debug/networkman=
ager/1.20.0-r0 -fdebug-prefix-map=3D/home/kkang/buildarea/222-Yocto/build=
-xfce-x86-64/tmp/work/core2-64-poky-linux-musl/networkmanager/1.20.0-r0=3D=
/usr/src/debug/networkmanager/1.20.0-r0 -fdebug-prefix-map=3D/home/kkang/=
buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-linux-musl/n=
etworkmanager/1.20.0-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/home/kkan=
g/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-poky-linux-musl=
/networkmanager/1.20.0-r0/recipe-sysroot-native=3D -DRTLD_DEEPBIND=3D0 -f=
PIC -pthread -DGLIB_VERSION_MIN_REQUIRED=3DGLIB_VERSION_2_40 -DGLIB_VE
>>   RSION_MAX_ALLOWED=3DGLIB_VERSION_2_40 -DNETWORKMANAGER_COMPILATION=3D=
NM_NETWORKMANAGER_COMPILATION_DAEMON -MD -MQ 'src/25a6634@@NetworkManager=
@sta/devices_nm-device.c.o' -MF 'src/25a6634@@NetworkManager@sta/devices_=
nm-device.c.o.d' -o 'src/25a6634@@NetworkManager@sta/devices_nm-device.c.=
o' -c ../NetworkManager-1.20.0/src/devices/nm-device.c
>>> In file included from /home/kkang/buildarea/222-Yocto/build-xfce-x86-=
64/tmp/work/core2-64-poky-linux-musl/networkmanager/1.20.0-r0/recipe-sysr=
oot/usr/include/net/ethernet.h:10,
>>>                   from ../NetworkManager-1.20.0/src/systemd/src/syste=
md/sd-dhcp-client.h:23,
>>>                   from ../NetworkManager-1.20.0/src/systemd/nm-sd.h:2=
1,
>>>                   from ../NetworkManager-1.20.0/src/devices/nm-device=
=2Ec:76:
>>> /home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-p=
oky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/netine=
t/if_ether.h:111:8: error: redefinition of 'struct ethhdr'
>>>    111 | struct ethhdr {
>>>        |        ^~~~~~
>>> In file included from ../NetworkManager-1.20.0/libnm-core/nm-utils.h:=
32,
>>>                   from ../NetworkManager-1.20.0/libnm-core/nm-setting=
-ip-config.h:29,
>>>                   from ../NetworkManager-1.20.0/src/NetworkManagerUti=
ls.h:26,
>>>                   from ../NetworkManager-1.20.0/src/devices/nm-device=
=2Eh:31,
>>>                   from ../NetworkManager-1.20.0/src/devices/nm-device=
=2Ec:23:
>>> /home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-p=
oky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/linux/=
if_ether.h:167:8: note: originally defined here
>>>    167 | struct ethhdr {
>>>        |        ^~~~~~
>>> In file included from /home/kkang/buildarea/222-Yocto/build-xfce-x86-=
64/tmp/work/core2-64-poky-linux-musl/networkmanager/1.20.0-r0/recipe-sysr=
oot/usr/include/netinet/if_ether.h:118,
>>>                   from /home/kkang/buildarea/222-Yocto/build-xfce-x86=
-64/tmp/work/core2-64-poky-linux-musl/networkmanager/1.20.0-r0/recipe-sys=
root/usr/include/net/ethernet.h:10,
>>>                   from ../NetworkManager-1.20.0/src/systemd/src/syste=
md/sd-dhcp-client.h:23,
>>>                   from ../NetworkManager-1.20.0/src/systemd/nm-sd.h:2=
1,
>>>                   from ../NetworkManager-1.20.0/src/devices/nm-device=
=2Ec:76:
>>> /home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-p=
oky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/net/if=
_arp.h:22:8: error: redefinition of 'struct arphdr'
>>>     22 | struct arphdr {
>>>        |        ^~~~~~
>>> In file included from ../NetworkManager-1.20.0/src/devices/nm-device.=
c:34:
>>> /home/kkang/buildarea/222-Yocto/build-xfce-x86-64/tmp/work/core2-64-p=
oky-linux-musl/networkmanager/1.20.0-r0/recipe-sysroot/usr/include/linux/=
if_arp.h:144:8: note: originally defined here
>>>    144 | struct arphdr {
>>>        |        ^~~~~~
>>>
>>>
>>> Regards,
>>> Kai
>>>
>>>
>>>
>>>
>>> Kai Kang (1):
>>>    networkmanager: 1.18.2 -> 1.20.0
>>>
>>>   ...e.ac-Fix-pkgconfig-sysroot-locations.patch |  22 ---
>>>   ...ttings-settings-property-documentati.patch |  71 ---------
>>>   ...on.build-pkgconfig-sysroot-locations.patch |  23 +++
>>>   ...eate-settings-property-documentation.patch | 146 +++++++++++++++=
+++
>>>   ...Fix-build-with-musl-systemd-specific.patch |  10 +-
>>>   .../musl/0002-Fix-build-with-musl.patch       |  12 +-
>>>   .../musl/0003-Fix-mrand48_r-with-musl.patch   |  47 ++++++
>>>   ...ger_1.18.2.bb =3D> networkmanager_1.20.0.bb} |  72 +++++----
>>>   8 files changed, 262 insertions(+), 141 deletions(-)
>>>   delete mode 100644 meta-networking/recipes-connectivity/networkmana=
ger/networkmanager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-location=
s.patch
>>>   delete mode 100644 meta-networking/recipes-connectivity/networkmana=
ger/networkmanager/0002-Do-not-create-settings-settings-property-document=
ati.patch
>>>   create mode 100644 meta-networking/recipes-connectivity/networkmana=
ger/networkmanager/fix-meson.build-pkgconfig-sysroot-locations.patch
>>>   create mode 100644 meta-networking/recipes-connectivity/networkmana=
ger/networkmanager/meson-do-not-create-settings-property-documentation.pa=
tch
>>>   create mode 100644 meta-networking/recipes-connectivity/networkmana=
ger/networkmanager/musl/0003-Fix-mrand48_r-with-musl.patch
>>>   rename meta-networking/recipes-connectivity/networkmanager/{network=
manager_1.18.2.bb =3D> networkmanager_1.20.0.bb} (62%)
>>>
>>> --
>>> 2.20.0
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

--=20
Kai Kang



