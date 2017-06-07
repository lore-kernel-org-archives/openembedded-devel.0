Return-Path: <mathieu.audat@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 73A71780D6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jun 2017 12:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6FBF39C283D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jun 2017 08:46:53 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id 07spJSCCMFFa; Wed,  7 Jun 2017 08:46:49 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 797CE9C2859;
	Wed,  7 Jun 2017 08:46:49 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id SVgs_MpX9Ala; Wed,  7 Jun 2017 08:46:49 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4C4149C283D;
	Wed,  7 Jun 2017 08:46:49 -0400 (EDT)
Date: Wed, 7 Jun 2017 08:46:49 -0400 (EDT)
From: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <1251056947.40902.1496839609176.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
X-Mailer: Zimbra 8.6.0_GA_1153 (ZimbraWebClient - FF50 (Linux)/8.6.0_GA_1153)
Thread-Topic: protobuf-c: arm-linux-gnueabi-libtool error: cannot find library
Thread-Index: YBMiIdwngl5AUbBpo/QDp0g/qQifkA==
Cc: Ash Charles <ash.charles@savoirfairelinux.com>
Subject: protobuf-c: arm-linux-gnueabi-libtool error: cannot find library
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
X-List-Received-Date: Wed, 07 Jun 2017 12:46:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I'm currently trying to build protobuf-c from meta-openembedded using the r=
ecommended Linaro toolchain 6.2 (http://arago-project.org/wiki/index.php/Se=
tting_Up_Build_Environment#Cross-compile_toolchain)

The result fails with arm-linux-gnueabi-libtool trying to look for libstdc+=
+.la and fails to find it.
With the current toolchain installation, this lib is located in /opt/linaro=
/arm-linux-gnueabihf/lib/ but arm-linux-gnueabi-libtool can't seem to find.

The command failing is:
protobuf-c-1.2.1-r0 do_compile: ./arm-linux-gnueabi-libtool  --tag=3DCXX   =
--mode=3Dlink arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon =
 -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1  -pthre=
ad -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -feliminat=
e-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/work/armv7a=
hf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobuf-c/1.2.1=
-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-linux=3D -fd=
ebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D   -L/opt/linaro/ar=
m-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro/arm-linux-gnueabihf/lib -=
Wl,-O1 -Wl,--hash-style=3Dgnu -o protoc-c/protoc-c protoc-c/protoc_c_protoc=
_c-c_bytes_field.o protoc-c/protoc_c_protoc_c-c_enum.o protoc-c/protoc_c_pr=
otoc_c-c_enum_field.o protoc-c/protoc_c_protoc_c-c_extension.o protoc-c/pro=
toc_c_protoc_c-c_field.o protoc-c/protoc_c_protoc_c-c_file.o protoc-c/proto=
c_c_protoc_c-c_generator.o protoc-c/protoc_c_protoc_c-c_helpers.o protoc-c/=
protoc_c_protoc_c-c_message.o protoc-c/protoc_c_protoc_c-c_message_field.o =
protoc-c/protoc_c_protoc_c-c_primitive_field.o protoc-c/protoc_c_protoc_c-c=
_service.o protoc-c/protoc_c_protoc_c-c_string_field.o protoc-c/protoc_c_pr=
otoc_c-main.o -lprotobuf -pthread -lpthread -lprotoc

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabi-libtool:   error: cannot =
find the library '/build/yocto/bb-baked/sysroots/pct1/home/tcwg-buildslave/=
workspace/tcwg-make-release/label/docker-trusty-amd64-tcwg-build/target/arm=
-linux-gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu/arm-linux-g=
nueabihf/lib/libstdc++.la' or unhandled argument '=3D/home/tcwg-buildslave/=
workspace/tcwg-make-release/label/docker-trusty-amd64-tcwg-build/target/arm=
-linux-gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu/arm-linux-g=
nueabihf/lib/libstdc++.la'

Any ideas how to tackle this? Something looks wrong in the library inclusio=
n.

The following output is the result of cross-compiling protobuf-c on a machi=
ne close to a beaglebone white.

Build Configuration:
BB_VERSION        =3D "1.32.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-14.04"
TARGET_SYS        =3D "arm-linux-gnueabi"
DISTRO_VERSION    =3D "4.0"
TUNE_FEATURES     =3D "arm armv7a vfp thumb neon       callconvention-hard"
TARGET_FPU        =3D "hard"
meta-arago-distro=20
meta-arago-extras =3D "morty:5789d36b60567311a31d423d397b63e4f69e42c5"
meta-qt5          =3D "morty:3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1"
meta-networking  =20
meta-ruby        =20
meta-oe          =20
meta-python       =3D "morty:fe5c83312de11e80b85680ef237f8acb04b4b26e"
meta-ti           =3D "morty:913e05e19b1bd342e6d03457ed8485a4b5942dcf"
meta-linaro-toolchain=20
meta-optee        =3D "morty:c44bd0ebc8ca2e6201996ef7cba8b71421d3aff7"
meta              =3D "morty:ddf907ca95a19f54785079b4396935273b3747f6"

[...]

protobuf-c-1.2.1-r0 do_compile: + cd /build/yocto/bb-baked/work/armv7ahf-ne=
on-linux-gnueabi/protobuf-c/1.2.1-r0/build

protobuf-c-1.2.1-r0 do_compile: + do_compile
+ autotools_do_compile
+ oe_runmake
+ oe_runmake_call
+ bbnote make -j 8
+ '[' -p /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/=
1.2.1-r0/temp/fifo.6484 ']'
+ printf '%b\0' 'bbnote make -j 8'
+ make -j 8

NOTE: protobuf-c-1.2.1-r0 do_compile: make -j 8
protobuf-c-1.2.1-r0 do_compile: make  all-am

protobuf-c-1.2.1-r0 do_compile: make[1]: Entering directory `/build/yocto/b=
b-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0/build'

protobuf-c-1.2.1-r0 do_compile: ./arm-linux-gnueabi-libtool  --tag=3DCC   -=
-mode=3Dcompile arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mfpu=3Dneo=
n  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAV=
E_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1=
.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnu=
eabihf/include    -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pip=
e -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/p=
rotobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_=
64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c=
 -o protobuf-c/protobuf-c.lo ../protobuf-c-1.2.1/protobuf-c/protobuf-c.c

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabihf-g++  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sys=
roots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -=
I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/lina=
ro/arm-linux-gnueabihf/include   -pthread -isystem/opt/linaro/arm-linux-gnu=
eabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2=
.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/sysroots/pct1=3D  -c -o protoc-c/protoc_c_protoc_c-c_bytes_field.o `tes=
t -f 'protoc-c/c_bytes_field.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_=
bytes_field.cc

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabihf-g++  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sys=
roots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -=
I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/lina=
ro/arm-linux-gnueabihf/include   -pthread -isystem/opt/linaro/arm-linux-gnu=
eabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2=
.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/sysroots/pct1=3D  -c -o protoc-c/protoc_c_protoc_c-c_enum.o `test -f 'p=
rotoc-c/c_enum.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_enum.cc

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabihf-g++  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sys=
roots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -=
I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/lina=
ro/arm-linux-gnueabihf/include   -pthread -isystem/opt/linaro/arm-linux-gnu=
eabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2=
.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/sysroots/pct1=3D  -c -o protoc-c/protoc_c_protoc_c-c_enum_field.o `test=
 -f 'protoc-c/c_enum_field.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_en=
um_field.cc

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabihf-g++  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sys=
roots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -=
I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/lina=
ro/arm-linux-gnueabihf/include   -pthread -isystem/opt/linaro/arm-linux-gnu=
eabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2=
.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/sysroots/pct1=3D  -c -o protoc-c/protoc_c_protoc_c-c_extension.o `test =
-f 'protoc-c/c_extension.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_exte=
nsion.cc

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabihf-g++  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sys=
roots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -=
I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/lina=
ro/arm-linux-gnueabihf/include   -pthread -isystem/opt/linaro/arm-linux-gnu=
eabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2=
.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/sysroots/pct1=3D  -c -o protoc-c/protoc_c_protoc_c-c_field.o `test -f '=
protoc-c/c_field.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_field.cc

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabihf-g++  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sys=
roots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -=
I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/lina=
ro/arm-linux-gnueabihf/include   -pthread -isystem/opt/linaro/arm-linux-gnu=
eabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2=
.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/sysroots/pct1=3D  -c -o protoc-c/protoc_c_protoc_c-c_file.o `test -f 'p=
rotoc-c/c_file.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_file.cc

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabihf-g++  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sys=
roots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -=
I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/lina=
ro/arm-linux-gnueabihf/include   -pthread -isystem/opt/linaro/arm-linux-gnu=
eabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2=
.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/sysroots/pct1=3D  -c -o protoc-c/protoc_c_protoc_c-c_generator.o `test =
-f 'protoc-c/c_generator.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_gene=
rator.cc

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabi-libtool: compile:  arm-li=
nux-gnueabihf-gcc -march=3Darmv7-a -marm -mfpu=3Dneon -mfloat-abi=3Dhard --=
sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I. -I../prot=
obuf-c-1.2.1 -include ./config.h -I../protobuf-c-1.2.1/protobuf-c -I. -I../=
protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include -isystem/o=
pt/linaro/arm-linux-gnueabihf/include -O2 -pipe -g -feliminate-unused-debug=
-types -fdebug-prefix-map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-=
gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-pr=
efix-map=3D/build/yocto/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-ma=
p=3D/build/yocto/bb-baked/sysroots/pct1=3D -c ../protobuf-c-1.2.1/protobuf-=
c/protobuf-c.c  -fPIC -DPIC -o protobuf-c/.libs/protobuf-c.o

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabi-libtool: compile:  arm-li=
nux-gnueabihf-gcc -march=3Darmv7-a -marm -mfpu=3Dneon -mfloat-abi=3Dhard --=
sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I. -I../prot=
obuf-c-1.2.1 -include ./config.h -I../protobuf-c-1.2.1/protobuf-c -I. -I../=
protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include -isystem/o=
pt/linaro/arm-linux-gnueabihf/include -O2 -pipe -g -feliminate-unused-debug=
-types -fdebug-prefix-map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-=
gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-pr=
efix-map=3D/build/yocto/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-ma=
p=3D/build/yocto/bb-baked/sysroots/pct1=3D -c ../protobuf-c-1.2.1/protobuf-=
c/protobuf-c.c -o protobuf-c/protobuf-c.o >/dev/null 2>&1

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabihf-g++  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sys=
roots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -=
I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/lina=
ro/arm-linux-gnueabihf/include   -pthread -isystem/opt/linaro/arm-linux-gnu=
eabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2=
.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/sysroots/pct1=3D  -c -o protoc-c/protoc_c_protoc_c-c_helpers.o `test -f=
 'protoc-c/c_helpers.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_helpers.=
cc

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabihf-g++  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sys=
roots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -=
I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/lina=
ro/arm-linux-gnueabihf/include   -pthread -isystem/opt/linaro/arm-linux-gnu=
eabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2=
.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/sysroots/pct1=3D  -c -o protoc-c/protoc_c_protoc_c-c_message.o `test -f=
 'protoc-c/c_message.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_message.=
cc

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabihf-g++  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sys=
roots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -=
I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/lina=
ro/arm-linux-gnueabihf/include   -pthread -isystem/opt/linaro/arm-linux-gnu=
eabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2=
.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/sysroots/pct1=3D  -c -o protoc-c/protoc_c_protoc_c-c_message_field.o `t=
est -f 'protoc-c/c_message_field.cc' || echo '../protobuf-c-1.2.1/'`protoc-=
c/c_message_field.cc

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabihf-g++  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sys=
roots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -=
I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/lina=
ro/arm-linux-gnueabihf/include   -pthread -isystem/opt/linaro/arm-linux-gnu=
eabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2=
.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/sysroots/pct1=3D  -c -o protoc-c/protoc_c_protoc_c-c_primitive_field.o =
`test -f 'protoc-c/c_primitive_field.cc' || echo '../protobuf-c-1.2.1/'`pro=
toc-c/c_primitive_field.cc

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabihf-g++  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sys=
roots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -=
I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/lina=
ro/arm-linux-gnueabihf/include   -pthread -isystem/opt/linaro/arm-linux-gnu=
eabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2=
.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/sysroots/pct1=3D  -c -o protoc-c/protoc_c_protoc_c-c_service.o `test -f=
 'protoc-c/c_service.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_service.=
cc

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabihf-g++  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sys=
roots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -=
I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/lina=
ro/arm-linux-gnueabihf/include   -pthread -isystem/opt/linaro/arm-linux-gnu=
eabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2=
.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/sysroots/pct1=3D  -c -o protoc-c/protoc_c_protoc_c-c_string_field.o `te=
st -f 'protoc-c/c_string_field.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/=
c_string_field.cc

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabihf-g++  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sys=
roots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1  -include ./config.h -=
I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/lina=
ro/arm-linux-gnueabihf/include   -pthread -isystem/opt/linaro/arm-linux-gnu=
eabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2=
.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-ba=
ked/sysroots/pct1=3D  -c -o protoc-c/protoc_c_protoc_c-main.o `test -f 'pro=
toc-c/main.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/main.cc

protobuf-c-1.2.1-r0 do_compile: ./arm-linux-gnueabi-libtool  --tag=3DCC   -=
-mode=3Dlink arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mfpu=3Dneon  =
-mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1   -isyst=
em/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -feliminate-unused-=
debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/work/armv7ahf-neon-l=
inux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdeb=
ug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-linux=3D -fdebug-pref=
ix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D   -version-info 1:0:0 -no-u=
ndefined -Wl,--version-script=3D../protobuf-c-1.2.1/protobuf-c/libprotobuf-=
c.sym  -L/opt/linaro/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro/ar=
m-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -o protobuf-c/libproto=
buf-c.la -rpath /usr/lib protobuf-c/protobuf-c.lo =20

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabi-libtool: link: arm-linux-=
gnueabihf-gcc  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sy=
sroot=3D/build/yocto/bb-baked/sysroots/pct1 -shared  -fPIC -DPIC  protobuf-=
c/.libs/protobuf-c.o   -L/opt/linaro/arm-linux-gnueabihf/lib  -march=3Darmv=
7-a -marm -mfpu=3Dneon -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked=
/sysroots/pct1 -O2 -g -Wl,--version-script=3D../protobuf-c-1.2.1/protobuf-c=
/libprotobuf-c.sym -Wl,-rpath-link -Wl,/opt/linaro/arm-linux-gnueabihf/lib =
-Wl,-O1 -Wl,--hash-style=3Dgnu   -Wl,-soname -Wl,libprotobuf-c.so.1 -o prot=
obuf-c/.libs/libprotobuf-c.so.1.0.0

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabi-libtool: link: (cd "proto=
buf-c/.libs" && rm -f "libprotobuf-c.so.1" && ln -s "libprotobuf-c.so.1.0.0=
" "libprotobuf-c.so.1")

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabi-libtool: link: (cd "proto=
buf-c/.libs" && rm -f "libprotobuf-c.so" && ln -s "libprotobuf-c.so.1.0.0" =
"libprotobuf-c.so")

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabi-libtool: link: arm-linux-=
gnueabihf-ar cru protobuf-c/.libs/libprotobuf-c.a  protobuf-c/protobuf-c.o

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabi-libtool: link: arm-linux-=
gnueabihf-ranlib protobuf-c/.libs/libprotobuf-c.a

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabi-libtool: link: ( cd "prot=
obuf-c/.libs" && rm -f "libprotobuf-c.la" && ln -s "../libprotobuf-c.la" "l=
ibprotobuf-c.la" )

protobuf-c-1.2.1-r0 do_compile: ./arm-linux-gnueabi-libtool  --tag=3DCXX   =
--mode=3Dlink arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon =
 -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1  -pthre=
ad -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -feliminat=
e-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/work/armv7a=
hf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobuf-c/1.2.1=
-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-linux=3D -fd=
ebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D   -L/opt/linaro/ar=
m-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro/arm-linux-gnueabihf/lib -=
Wl,-O1 -Wl,--hash-style=3Dgnu -o protoc-c/protoc-c protoc-c/protoc_c_protoc=
_c-c_bytes_field.o protoc-c/protoc_c_protoc_c-c_enum.o protoc-c/protoc_c_pr=
otoc_c-c_enum_field.o protoc-c/protoc_c_protoc_c-c_extension.o protoc-c/pro=
toc_c_protoc_c-c_field.o protoc-c/protoc_c_protoc_c-c_file.o protoc-c/proto=
c_c_protoc_c-c_generator.o protoc-c/protoc_c_protoc_c-c_helpers.o protoc-c/=
protoc_c_protoc_c-c_message.o protoc-c/protoc_c_protoc_c-c_message_field.o =
protoc-c/protoc_c_protoc_c-c_primitive_field.o protoc-c/protoc_c_protoc_c-c=
_service.o protoc-c/protoc_c_protoc_c-c_string_field.o protoc-c/protoc_c_pr=
otoc_c-main.o -lprotobuf -pthread -lpthread -lprotoc=20

protobuf-c-1.2.1-r0 do_compile: arm-linux-gnueabi-libtool:   error: cannot =
find the library '/build/yocto/bb-baked/sysroots/pct1/home/tcwg-buildslave/=
workspace/tcwg-make-release/label/docker-trusty-amd64-tcwg-build/target/arm=
-linux-gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu/arm-linux-g=
nueabihf/lib/libstdc++.la' or unhandled argument '=3D/home/tcwg-buildslave/=
workspace/tcwg-make-release/label/docker-trusty-amd64-tcwg-build/target/arm=
-linux-gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu/arm-linux-g=
nueabihf/lib/libstdc++.la'

protobuf-c-1.2.1-r0 do_compile: make[1]: *** [protoc-c/protoc-c] Error 1

protobuf-c-1.2.1-r0 do_compile: make[1]: Leaving directory `/build/yocto/bb=
-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0/build'

protobuf-c-1.2.1-r0 do_compile: make: *** [all] Error 2

protobuf-c-1.2.1-r0 do_compile: + die 'oe_runmake failed'

protobuf-c-1.2.1-r0 do_compile: + bbfatal_log 'oe_runmake failed'
+ '[' -p /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/=
1.2.1-r0/temp/fifo.6484 ']'
+ printf '%b\0' 'bbfatal_log oe_runmake failed'

protobuf-c-1.2.1-r0 do_compile: + exit 1
+ bb_exit_handler

ERROR: protobuf-c-1.2.1-r0 do_compile: oe_runmake failed
protobuf-c-1.2.1-r0 do_compile: + ret=3D1
+ case $ret in
+ case $BASH_VERSION in
+ echo 'WARNING: /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/pro=
tobuf-c/1.2.1-r0/temp/run.do_compile.6484:1 exit 1 from '\''exit 1'\'''
WARNING: /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/=
1.2.1-r0/temp/run.do_compile.6484:1 exit 1 from 'exit 1'
+ exit 1

ERROR: protobuf-c-1.2.1-r0 do_compile: Function failed: do_compile (log fil=
e is located at /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/prot=
obuf-c/1.2.1-r0/temp/log.do_compile.6484)
ERROR: Logfile of failure stored in: /build/yocto/bb-baked/work/armv7ahf-ne=
on-linux-gnueabi/protobuf-c/1.2.1-r0/temp/log.do_compile.6484
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32', 'co=
mmon-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_compile
| + cd /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.=
2.1-r0/build
|=20
| + do_compile
| + autotools_do_compile
| + oe_runmake
| + oe_runmake_call
| + bbnote make -j 8
| + '[' -p /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-=
c/1.2.1-r0/temp/fifo.6484 ']'
| + printf '%b\0' 'bbnote make -j 8'
| + make -j 8
|=20
| NOTE: make -j 8
| make  all-am
|=20
| make[1]: Entering directory `/build/yocto/bb-baked/work/armv7ahf-neon-lin=
ux-gnueabi/protobuf-c/1.2.1-r0/build'
|=20
| ./arm-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompile arm-linux-gnue=
abihf-gcc  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroo=
t=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c=
-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-c -I. -I../proto=
buf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include    -isystem/opt=
/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -feliminate-unused-debug-=
types -fdebug-prefix-map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-g=
nueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-pre=
fix-map=3D/build/yocto/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=
=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o protobuf-c/protobuf-c.lo .=
./protobuf-c-1.2.1/protobuf-c/protobuf-c.c
|=20
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_bytes_field.o `test -f 'protoc-c/c_bytes_field.c=
c' || echo '../protobuf-c-1.2.1/'`protoc-c/c_bytes_field.cc
|=20
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_enum.o `test -f 'protoc-c/c_enum.cc' || echo '..=
/protobuf-c-1.2.1/'`protoc-c/c_enum.cc
|=20
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_enum_field.o `test -f 'protoc-c/c_enum_field.cc'=
 || echo '../protobuf-c-1.2.1/'`protoc-c/c_enum_field.cc
|=20
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_extension.o `test -f 'protoc-c/c_extension.cc' |=
| echo '../protobuf-c-1.2.1/'`protoc-c/c_extension.cc
|=20
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_field.o `test -f 'protoc-c/c_field.cc' || echo '=
../protobuf-c-1.2.1/'`protoc-c/c_field.cc
|=20
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_file.o `test -f 'protoc-c/c_file.cc' || echo '..=
/protobuf-c-1.2.1/'`protoc-c/c_file.cc
|=20
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_generator.o `test -f 'protoc-c/c_generator.cc' |=
| echo '../protobuf-c-1.2.1/'`protoc-c/c_generator.cc
|=20
| arm-linux-gnueabi-libtool: compile:  arm-linux-gnueabihf-gcc -march=3Darm=
v7-a -marm -mfpu=3Dneon -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-bake=
d/sysroots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1 -include ./config=
.h -I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/=
linaro/arm-linux-gnueabihf/include -isystem/opt/linaro/arm-linux-gnueabihf/=
include -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/b=
uild/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D=
/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-bak=
ed/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysr=
oots/pct1=3D -c ../protobuf-c-1.2.1/protobuf-c/protobuf-c.c  -fPIC -DPIC -o=
 protobuf-c/.libs/protobuf-c.o
|=20
| arm-linux-gnueabi-libtool: compile:  arm-linux-gnueabihf-gcc -march=3Darm=
v7-a -marm -mfpu=3Dneon -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-bake=
d/sysroots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1 -include ./config=
.h -I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/=
linaro/arm-linux-gnueabihf/include -isystem/opt/linaro/arm-linux-gnueabihf/=
include -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/b=
uild/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D=
/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-bak=
ed/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysr=
oots/pct1=3D -c ../protobuf-c-1.2.1/protobuf-c/protobuf-c.c -o protobuf-c/p=
rotobuf-c.o >/dev/null 2>&1
|=20
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_helpers.o `test -f 'protoc-c/c_helpers.cc' || ec=
ho '../protobuf-c-1.2.1/'`protoc-c/c_helpers.cc
|=20
| + cd /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.=
2.1-r0/build
| + do_compile
| + autotools_do_compile
| + oe_runmake
| + oe_runmake_call
| + bbnote make -j 8
| + '[' -p /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-=
c/1.2.1-r0/temp/fifo.6484 ']'
| + printf '%b\0' 'bbnote make -j 8'
| + make -j 8
| make  all-am
| make[1]: Entering directory `/build/yocto/bb-baked/work/armv7ahf-neon-lin=
ux-gnueabi/protobuf-c/1.2.1-r0/build'
| ./arm-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompile arm-linux-gnue=
abihf-gcc  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroo=
t=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c=
-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-c -I. -I../proto=
buf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include    -isystem/opt=
/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -feliminate-unused-debug-=
types -fdebug-prefix-map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-g=
nueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-pre=
fix-map=3D/build/yocto/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=
=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o protobuf-c/protobuf-c.lo .=
./protobuf-c-1.2.1/protobuf-c/protobuf-c.c
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_bytes_field.o `test -f 'protoc-c/c_bytes_field.c=
c' || echo '../protobuf-c-1.2.1/'`protoc-c/c_bytes_field.cc
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_enum.o `test -f 'protoc-c/c_enum.cc' || echo '..=
/protobuf-c-1.2.1/'`protoc-c/c_enum.cc
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_enum_field.o `test -f 'protoc-c/c_enum_field.cc'=
 || echo '../protobuf-c-1.2.1/'`protoc-c/c_enum_field.cc
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_extension.o `test -f 'protoc-c/c_extension.cc' |=
| echo '../protobuf-c-1.2.1/'`protoc-c/c_extension.cc
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_field.o `test -f 'protoc-c/c_field.cc' || echo '=
../protobuf-c-1.2.1/'`protoc-c/c_field.cc
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_file.o `test -f 'protoc-c/c_file.cc' || echo '..=
/protobuf-c-1.2.1/'`protoc-c/c_file.cc
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_generator.o `test -f 'protoc-c/c_generator.cc' |=
| echo '../protobuf-c-1.2.1/'`protoc-c/c_generator.cc
| arm-linux-gnueabi-libtool: compile:  arm-linux-gnueabihf-gcc -march=3Darm=
v7-a -marm -mfpu=3Dneon -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-bake=
d/sysroots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1 -include ./config=
.h -I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/=
linaro/arm-linux-gnueabihf/include -isystem/opt/linaro/arm-linux-gnueabihf/=
include -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/b=
uild/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D=
/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-bak=
ed/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysr=
oots/pct1=3D -c ../protobuf-c-1.2.1/protobuf-c/protobuf-c.c  -fPIC -DPIC -o=
 protobuf-c/.libs/protobuf-c.o
| arm-linux-gnueabi-libtool: compile:  arm-linux-gnueabihf-gcc -march=3Darm=
v7-a -marm -mfpu=3Dneon -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-bake=
d/sysroots/pct1 -DHAVE_CONFIG_H -I. -I../protobuf-c-1.2.1 -include ./config=
.h -I../protobuf-c-1.2.1/protobuf-c -I. -I../protobuf-c-1.2.1 -isystem/opt/=
linaro/arm-linux-gnueabihf/include -isystem/opt/linaro/arm-linux-gnueabihf/=
include -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/b=
uild/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D=
/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-bak=
ed/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysr=
oots/pct1=3D -c ../protobuf-c-1.2.1/protobuf-c/protobuf-c.c -o protobuf-c/p=
rotobuf-c.o >/dev/null 2>&1
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_helpers.o `test -f 'protoc-c/c_helpers.cc' || ec=
ho '../protobuf-c-1.2.1/'`protoc-c/c_helpers.cc
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_message.o `test -f 'protoc-c/c_message.cc' || ec=
ho '../protobuf-c-1.2.1/'`protoc-c/c_message.cc
|=20
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_message_field.o `test -f 'protoc-c/c_message_fie=
ld.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_message_field.cc
|=20
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_primitive_field.o `test -f 'protoc-c/c_primitive=
_field.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_primitive_field.cc
|=20
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_service.o `test -f 'protoc-c/c_service.cc' || ec=
ho '../protobuf-c-1.2.1/'`protoc-c/c_service.cc
|=20
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_string_field.o `test -f 'protoc-c/c_string_field=
.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_string_field.cc
|=20
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-main.o `test -f 'protoc-c/main.cc' || echo '../pro=
tobuf-c-1.2.1/'`protoc-c/main.cc
|=20
| ./arm-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dlink arm-linux-gnueabi=
hf-gcc  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=
=3D/build/yocto/bb-baked/sysroots/pct1   -isystem/opt/linaro/arm-linux-gnue=
abihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-m=
ap=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.=
1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto=
/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-bak=
ed/sysroots/pct1=3D   -version-info 1:0:0 -no-undefined -Wl,--version-scrip=
t=3D../protobuf-c-1.2.1/protobuf-c/libprotobuf-c.sym  -L/opt/linaro/arm-lin=
ux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro/arm-linux-gnueabihf/lib -Wl,-O=
1 -Wl,--hash-style=3Dgnu -o protobuf-c/libprotobuf-c.la -rpath /usr/lib pro=
tobuf-c/protobuf-c.lo
|=20
| arm-linux-gnueabi-libtool: link: arm-linux-gnueabihf-gcc  -march=3Darmv7-=
a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/=
sysroots/pct1 -shared  -fPIC -DPIC  protobuf-c/.libs/protobuf-c.o   -L/opt/=
linaro/arm-linux-gnueabihf/lib  -march=3Darmv7-a -marm -mfpu=3Dneon -mfloat=
-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -O2 -g -Wl,--ve=
rsion-script=3D../protobuf-c-1.2.1/protobuf-c/libprotobuf-c.sym -Wl,-rpath-=
link -Wl,/opt/linaro/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu=
   -Wl,-soname -Wl,libprotobuf-c.so.1 -o protobuf-c/.libs/libprotobuf-c.so.=
1.0.0
|=20
| arm-linux-gnueabi-libtool: link: (cd "protobuf-c/.libs" && rm -f "libprot=
obuf-c.so.1" && ln -s "libprotobuf-c.so.1.0.0" "libprotobuf-c.so.1")
|=20
| arm-linux-gnueabi-libtool: link: (cd "protobuf-c/.libs" && rm -f "libprot=
obuf-c.so" && ln -s "libprotobuf-c.so.1.0.0" "libprotobuf-c.so")
|=20
| arm-linux-gnueabi-libtool: link: arm-linux-gnueabihf-ar cru protobuf-c/.l=
ibs/libprotobuf-c.a  protobuf-c/protobuf-c.o
|=20
| arm-linux-gnueabi-libtool: link: arm-linux-gnueabihf-ranlib protobuf-c/.l=
ibs/libprotobuf-c.a
|=20
| arm-linux-gnueabi-libtool: link: ( cd "protobuf-c/.libs" && rm -f "libpro=
tobuf-c.la" && ln -s "../libprotobuf-c.la" "libprotobuf-c.la" )
|=20
| ./arm-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dlink arm-linux-gnueab=
ihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=
=3D/build/yocto/bb-baked/sysroots/pct1  -pthread -isystem/opt/linaro/arm-li=
nux-gnueabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-=
prefix-map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobu=
f-c/1.2.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/bui=
ld/yocto/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/pct1=3D   -L/opt/linaro/arm-linux-gnueabihf/lib -Wl,-rp=
ath-link,/opt/linaro/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -o protoc-c/protoc-c protoc-c/protoc_c_protoc_c-c_bytes_field.o protoc-c/p=
rotoc_c_protoc_c-c_enum.o protoc-c/protoc_c_protoc_c-c_enum_field.o protoc-=
c/protoc_c_protoc_c-c_extension.o protoc-c/protoc_c_protoc_c-c_field.o prot=
oc-c/protoc_c_protoc_c-c_file.o protoc-c/protoc_c_protoc_c-c_generator.o pr=
otoc-c/protoc_c_protoc_c-c_helpers.o protoc-c/protoc_c_protoc_c-c_message.o=
 protoc-c/protoc_c_protoc_c-c_message_field.o protoc-c/protoc_c_protoc_c-c_=
primitive_field.o protoc-c/protoc_c_protoc_c-c_service.o protoc-c/protoc_c_=
protoc_c-c_string_field.o protoc-c/protoc_c_protoc_c-main.o -lprotobuf -pth=
read -lpthread -lprotoc
|=20
| arm-linux-gnueabi-libtool:   error: cannot find the library '/build/yocto=
/bb-baked/sysroots/pct1/home/tcwg-buildslave/workspace/tcwg-make-release/la=
bel/docker-trusty-amd64-tcwg-build/target/arm-linux-gnueabihf/_build/builds=
/destdir/x86_64-unknown-linux-gnu/arm-linux-gnueabihf/lib/libstdc++.la' or =
unhandled argument '=3D/home/tcwg-buildslave/workspace/tcwg-make-release/la=
bel/docker-trusty-amd64-tcwg-build/target/arm-linux-gnueabihf/_build/builds=
/destdir/x86_64-unknown-linux-gnu/arm-linux-gnueabihf/lib/libstdc++.la'
|=20
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_message.o `test -f 'protoc-c/c_message.cc' || ec=
ho '../protobuf-c-1.2.1/'`protoc-c/c_message.cc
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_message_field.o `test -f 'protoc-c/c_message_fie=
ld.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_message_field.cc
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_primitive_field.o `test -f 'protoc-c/c_primitive=
_field.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_primitive_field.cc
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_service.o `test -f 'protoc-c/c_service.cc' || ec=
ho '../protobuf-c-1.2.1/'`protoc-c/c_service.cc
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-c_string_field.o `test -f 'protoc-c/c_string_field=
.cc' || echo '../protobuf-c-1.2.1/'`protoc-c/c_string_field.cc
| arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=
=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -DHAVE_CONFIG_H -I.=
 -I../protobuf-c-1.2.1  -include ./config.h -I../protobuf-c-1.2.1/protobuf-=
c -I. -I../protobuf-c-1.2.1 -isystem/opt/linaro/arm-linux-gnueabihf/include=
   -pthread -isystem/opt/linaro/arm-linux-gnueabihf/include  -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/build/yocto/bb-baked/wo=
rk/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0=3D/usr/src/debug/protobu=
f-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/x86_64-lin=
ux=3D -fdebug-prefix-map=3D/build/yocto/bb-baked/sysroots/pct1=3D  -c -o pr=
otoc-c/protoc_c_protoc_c-main.o `test -f 'protoc-c/main.cc' || echo '../pro=
tobuf-c-1.2.1/'`protoc-c/main.cc
| ./arm-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dlink arm-linux-gnueabi=
hf-gcc  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=
=3D/build/yocto/bb-baked/sysroots/pct1   -isystem/opt/linaro/arm-linux-gnue=
abihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-m=
ap=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.=
1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/build/yocto=
/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yocto/bb-bak=
ed/sysroots/pct1=3D   -version-info 1:0:0 -no-undefined -Wl,--version-scrip=
t=3D../protobuf-c-1.2.1/protobuf-c/libprotobuf-c.sym  -L/opt/linaro/arm-lin=
ux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro/arm-linux-gnueabihf/lib -Wl,-O=
1 -Wl,--hash-style=3Dgnu -o protobuf-c/libprotobuf-c.la -rpath /usr/lib pro=
tobuf-c/protobuf-c.lo
| arm-linux-gnueabi-libtool: link: arm-linux-gnueabihf-gcc  -march=3Darmv7-=
a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/=
sysroots/pct1 -shared  -fPIC -DPIC  protobuf-c/.libs/protobuf-c.o   -L/opt/=
linaro/arm-linux-gnueabihf/lib  -march=3Darmv7-a -marm -mfpu=3Dneon -mfloat=
-abi=3Dhard --sysroot=3D/build/yocto/bb-baked/sysroots/pct1 -O2 -g -Wl,--ve=
rsion-script=3D../protobuf-c-1.2.1/protobuf-c/libprotobuf-c.sym -Wl,-rpath-=
link -Wl,/opt/linaro/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu=
   -Wl,-soname -Wl,libprotobuf-c.so.1 -o protobuf-c/.libs/libprotobuf-c.so.=
1.0.0
| arm-linux-gnueabi-libtool: link: (cd "protobuf-c/.libs" && rm -f "libprot=
obuf-c.so.1" && ln -s "libprotobuf-c.so.1.0.0" "libprotobuf-c.so.1")
| arm-linux-gnueabi-libtool: link: (cd "protobuf-c/.libs" && rm -f "libprot=
obuf-c.so" && ln -s "libprotobuf-c.so.1.0.0" "libprotobuf-c.so")
| arm-linux-gnueabi-libtool: link: arm-linux-gnueabihf-ar cru protobuf-c/.l=
ibs/libprotobuf-c.a  protobuf-c/protobuf-c.o
| arm-linux-gnueabi-libtool: link: arm-linux-gnueabihf-ranlib protobuf-c/.l=
ibs/libprotobuf-c.a
| arm-linux-gnueabi-libtool: link: ( cd "protobuf-c/.libs" && rm -f "libpro=
tobuf-c.la" && ln -s "../libprotobuf-c.la" "libprotobuf-c.la" )
| ./arm-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dlink arm-linux-gnueab=
ihf-g++  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard --sysroot=
=3D/build/yocto/bb-baked/sysroots/pct1  -pthread -isystem/opt/linaro/arm-li=
nux-gnueabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-=
prefix-map=3D/build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobu=
f-c/1.2.1-r0=3D/usr/src/debug/protobuf-c/1.2.1-r0 -fdebug-prefix-map=3D/bui=
ld/yocto/bb-baked/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/build/yoct=
o/bb-baked/sysroots/pct1=3D   -L/opt/linaro/arm-linux-gnueabihf/lib -Wl,-rp=
ath-link,/opt/linaro/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -o protoc-c/protoc-c protoc-c/protoc_c_protoc_c-c_bytes_field.o protoc-c/p=
rotoc_c_protoc_c-c_enum.o protoc-c/protoc_c_protoc_c-c_enum_field.o protoc-=
c/protoc_c_protoc_c-c_extension.o protoc-c/protoc_c_protoc_c-c_field.o prot=
oc-c/protoc_c_protoc_c-c_file.o protoc-c/protoc_c_protoc_c-c_generator.o pr=
otoc-c/protoc_c_protoc_c-c_helpers.o protoc-c/protoc_c_protoc_c-c_message.o=
 protoc-c/protoc_c_protoc_c-c_message_field.o protoc-c/protoc_c_protoc_c-c_=
primitive_field.o protoc-c/protoc_c_protoc_c-c_service.o protoc-c/protoc_c_=
protoc_c-c_string_field.o protoc-c/protoc_c_protoc_c-main.o -lprotobuf -pth=
read -lpthread -lprotoc
| arm-linux-gnueabi-libtool:   error: cannot find the library '/build/yocto=
/bb-baked/sysroots/pct1/home/tcwg-buildslave/workspace/tcwg-make-release/la=
bel/docker-trusty-amd64-tcwg-build/target/arm-linux-gnueabihf/_build/builds=
/destdir/x86_64-unknown-linux-gnu/arm-linux-gnueabihf/lib/libstdc++.la' or =
unhandled argument '=3D/home/tcwg-buildslave/workspace/tcwg-make-release/la=
bel/docker-trusty-amd64-tcwg-build/target/arm-linux-gnueabihf/_build/builds=
/destdir/x86_64-unknown-linux-gnu/arm-linux-gnueabihf/lib/libstdc++.la'
| make[1]: *** [protoc-c/protoc-c] Error 1
|=20
| make[1]: Leaving directory `/build/yocto/bb-baked/work/armv7ahf-neon-linu=
x-gnueabi/protobuf-c/1.2.1-r0/build'
|=20
| make: *** [all] Error 2
|=20
| + die 'oe_runmake failed'
|=20
| + bbfatal_log 'oe_runmake failed'
| + '[' -p /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-=
c/1.2.1-r0/temp/fifo.6484 ']'
| + printf '%b\0' 'bbfatal_log oe_runmake failed'
|=20
| + exit 1
| + bb_exit_handler
|=20
| ERROR: oe_runmake failed
| + ret=3D1
| + case $ret in
| + case $BASH_VERSION in
| + echo 'WARNING: /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/p=
rotobuf-c/1.2.1-r0/temp/run.do_compile.6484:1 exit 1 from '\''exit 1'\'''
| WARNING: /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-=
c/1.2.1-r0/temp/run.do_compile.6484:1 exit 1 from 'exit 1'
| + exit 1
|=20
| make[1]: *** [protoc-c/protoc-c] Error 1
| make[1]: Leaving directory `/build/yocto/bb-baked/work/armv7ahf-neon-linu=
x-gnueabi/protobuf-c/1.2.1-r0/build'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + bbfatal_log 'oe_runmake failed'
| + '[' -p /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-=
c/1.2.1-r0/temp/fifo.6484 ']'
| + printf '%b\0' 'bbfatal_log oe_runmake failed'
| + exit 1
| + bb_exit_handler
| + ret=3D1
| + case $ret in
| + case $BASH_VERSION in
| + echo 'WARNING: /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/p=
rotobuf-c/1.2.1-r0/temp/run.do_compile.6484:1 exit 1 from '\''exit 1'\'''
| WARNING: /build/yocto/bb-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-=
c/1.2.1-r0/temp/run.do_compile.6484:1 exit 1 from 'exit 1'
| + exit 1
| ERROR: Function failed: do_compile (log file is located at /build/yocto/b=
b-baked/work/armv7ahf-neon-linux-gnueabi/protobuf-c/1.2.1-r0/temp/log.do_co=
mpile.6484)
ERROR: Task (/build/yocto/sources/meta-openembedded/meta-oe/recipes-devtool=
s/protobuf/protobuf-c_1.2.1.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 408 tasks of which 401 didn't need to be rer=
un and 1 failed.

Summary: 1 task failed:
  /build/yocto/sources/meta-openembedded/meta-oe/recipes-devtools/protobuf/=
protobuf-c_1.2.1.bb:do_compile
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.



--=20
Mathieu Audat
Consultant en logiciel libre | Montr=C3=A9al, Qc
Savoir-Faire Linux
Bureau: (+1) 514-276-5468 # 356

