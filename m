Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A89CD4851
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 10:23:51 +0000 (UTC)
Subject: Re: [meta-oe][PATCH v3 0/3] android-tools: migration and cleanup
To: openembedded-devel@lists.openembedded.org
From: "AshishKumar Mishra" <ashishkumar.mishra@bmwtechworks.in>
X-Originating-Location: Bengaluru, Karnataka, IN (49.207.56.113)
X-Originating-Platform: Windows Edge 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 15 May 2026 03:23:46 -0700
References: <20260505150634.192651-1-emailaddress.ashish@gmail.com> <2022222.1778130561122567168@lists.openembedded.org> <2115555.1778654861364723634@lists.openembedded.org> <6a719287-ab7f-486b-a9c4-ec5801e9e8af@gmail.com> <CAMKF1sp=Ae3MHJYK7fbAXokwEhayigWkOPjpzw+H4Mp3W3Bjow@mail.gmail.com> <PN0P287MB0358EC7112FFB28C9B6157C089062@PN0P287MB0358.INDP287.PROD.OUTLOOK.COM> <CAMKF1spvQfLjaAWu4_QJwU+_QPivKEw7SjTvxMzcc4+dieAmqA@mail.gmail.com> <1575450.1778745762950591364@lists.openembedded.org>
In-Reply-To: <1575450.1778745762950591364@lists.openembedded.org>
Message-ID: <1575450.1778840626136865406@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1aDKkox5pIhkmcfBGxlf"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 10:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127004

--1aDKkox5pIhkmcfBGxlf
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem / Team ,

Able to reproduce the build error with CLANG
Brought meta-clang and tweaked the toolchain / cc / cxx provider as clang
Will work to fix this and share the observation

Sharing the error log to get an feedback just to avoid any gap's in customi=
zation

Below is the error :
bake-builds/poky-master/build/tmp/work/cortexa57-oe-linux/android-tools/29.=
0.6.r14/android-tools=3D/usr/src/debug/android-tools/29.0.6.r14 =C2=A0-ffil=
e-prefix-map=3D/home/bti-001003/upstream/bitbake-builds/poky-master/build/t=
mp/work/cortexa57-oe-linux/android-tools/29.0.6.r14/recipe-sysroot=3D =C2=
=A0-ffile-prefix-map=3D/home/bti-001003/upstream/bitbake-builds/poky-master=
/build/tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14/recipe-sysroot-=
native=3D =C2=A0-pipe -fvisibility-inlines-hidden -std=3Dgnu++20 -UADB_HOST=
 -DADB_HOST=3D0 -DALLOW_ADBD_DISABLE_VERITY -DALLOW_ADBD_NO_AUTH -DPLATFORM=
_TOOLS_VERSION=3D'"28.0.2"' =C2=A0-Isystem/core/diagnose_usb/include =C2=A0=
-Isystem/core/adb/daemon/include -Isystem/core/adb/adbconnection/include -I=
system/core/libasyncio/include -Isystem/core/libcutils/include -Isystem/cor=
e/libcrypto_utils/include -Isystem/core/liblog/include/ -Isystem/core/libut=
ils/include -Iframeworks/native/libs/adbd_auth/include -Wno-c++11-narrowing=
 =C2=A0-DPAGE_SIZE=3D4096 -fPIC -Isystem/coreinclude -Isystem/core/adb -Isy=
stem/core/base/include =C2=A0-Idebian/out/system/core -Isystem/tools/mkboot=
img/include/bootimg -Isystem/core/fs_mgr/include -Isystem/core/fs_mgr/inclu=
de_fstab -DADB_VERSION=3D'""' -D_GNU_SOURCE -Wl,-O1 -Wl,--hash-style=3Dgnu =
-Wl,--as-needed -Wl,-z,relro,-z,now -Wl,-rpath=3D'$ORIGIN/../lib/android' -=
Wl,-rpath-link=3D'$ORIGIN/../lib/android' -lpthread -Ldebian/out/system/cor=
e -Ldebian/out/external/boringssl -lbase -lcrypto_utils -l:libcrypto.a -lcu=
tils -llog -lresolv
| aarch64-oe-linux-clang++: warning: treating 'c-header' input as 'c++-head=
er' when in C++ mode, this behavior is deprecated [-Wdeprecated]
| aarch64-oe-linux-clang++: warning: treating 'c-header' input as 'c++-head=
er' when in C++ mode, this behavior is deprecated [-Wdeprecated]
| aarch64-oe-linux-clang++: warning: treating 'c-header' input as 'c++-head=
er' when in C++ mode, this behavior is deprecated [-Wdeprecated]
| aarch64-oe-linux-clang++: warning: treating 'c-header' input as 'c++-head=
er' when in C++ mode, this behavior is deprecated [-Wdeprecated]
| aarch64-oe-linux-clang++: error: cannot specify -o when generating multip=
le output files
| make: *** [/home/bti-001003/upstream/bitbake-builds/poky-master/build/tmp=
/work/cortexa57-oe-linux/android-tools/29.0.6.r14/sources/android-tools-29.=
0.6.r14/debian/system/core/adbd.mk:84: build] Error 1
| make: Leaving directory '/home/bti-001003/upstream/bitbake-builds/poky-ma=
ster/build/tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14/sources/and=
roid-tools-29.0.6.r14'
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
ERROR: Task (/home/bti-001003/upstream/bitbake-builds/poky-master/layers/me=
ta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6=
.r14.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1685 tasks of which 275 didn't need to be re=
run and 1 failed.
Summary: 1 task failed:
/home/bti-001003/upstream/bitbake-builds/poky-master/layers/meta-openembedd=
ed/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb:do_co=
mpile
log: /home/bti-001003/upstream/bitbake-builds/poky-master/build/tmp/work/co=
rtexa57-oe-linux/android-tools/29.0.6.r14/temp/log.do_compile.1623961
Summary: There were 12 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
~/upstream/bitbake-builds/poky-master/build :
~/upstream/bitbake-builds/poky-master/build :

--1aDKkox5pIhkmcfBGxlf
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Khem / Team ,&nbsp;<br /><br />Able to reproduce the build error wi=
th CLANG&nbsp;<br />Brought meta-clang and tweaked the toolchain / cc / cxx=
 provider as clang&nbsp;</div>
<div>Will work to fix this and share the observation&nbsp;</div>
<div><br />Sharing the error log to get an feedback just to avoid any gap's=
 in customization<br /><br />Below is the error :<br />
<div>bake-builds/poky-master/build/tmp/work/cortexa57-oe-linux/android-tool=
s/29.0.6.r14/android-tools=3D/usr/src/debug/android-tools/29.0.6.r14 &nbsp;=
-ffile-prefix-map=3D/home/bti-001003/upstream/bitbake-builds/poky-master/bu=
ild/tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14/recipe-sysroot=3D =
&nbsp;-ffile-prefix-map=3D/home/bti-001003/upstream/bitbake-builds/poky-mas=
ter/build/tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r14/recipe-sysro=
ot-native=3D &nbsp;-pipe -fvisibility-inlines-hidden -std=3Dgnu++20 -UADB_H=
OST -DADB_HOST=3D0 -DALLOW_ADBD_DISABLE_VERITY -DALLOW_ADBD_NO_AUTH -DPLATF=
ORM_TOOLS_VERSION=3D'"28.0.2"' &nbsp;-Isystem/core/diagnose_usb/include &nb=
sp;-Isystem/core/adb/daemon/include -Isystem/core/adb/adbconnection/include=
 -Isystem/core/libasyncio/include -Isystem/core/libcutils/include -Isystem/=
core/libcrypto_utils/include -Isystem/core/liblog/include/ -Isystem/core/li=
butils/include -Iframeworks/native/libs/adbd_auth/include -Wno-c++11-narrow=
ing &nbsp;-DPAGE_SIZE=3D4096 -fPIC -Isystem/coreinclude -Isystem/core/adb -=
Isystem/core/base/include &nbsp;-Idebian/out/system/core -Isystem/tools/mkb=
ootimg/include/bootimg -Isystem/core/fs_mgr/include -Isystem/core/fs_mgr/in=
clude_fstab -DADB_VERSION=3D'""' -D_GNU_SOURCE -Wl,-O1 -Wl,--hash-style=3Dg=
nu -Wl,--as-needed -Wl,-z,relro,-z,now -Wl,-rpath=3D'$ORIGIN/../lib/android=
' -Wl,-rpath-link=3D'$ORIGIN/../lib/android' -lpthread -Ldebian/out/system/=
core -Ldebian/out/external/boringssl -lbase -lcrypto_utils -l:libcrypto.a -=
lcutils -llog -lresolv<br />| aarch64-oe-linux-clang++: warning: treating '=
c-header' input as 'c++-header' when in C++ mode, this behavior is deprecat=
ed [-Wdeprecated]<br />| aarch64-oe-linux-clang++: warning: treating 'c-hea=
der' input as 'c++-header' when in C++ mode, this behavior is deprecated [-=
Wdeprecated]<br />| aarch64-oe-linux-clang++: warning: treating 'c-header' =
input as 'c++-header' when in C++ mode, this behavior is deprecated [-Wdepr=
ecated]<br />| aarch64-oe-linux-clang++: warning: treating 'c-header' input=
 as 'c++-header' when in C++ mode, this behavior is deprecated [-Wdeprecate=
d]<br />| aarch64-oe-linux-clang++: error: cannot specify -o when generatin=
g multiple output files<br />| make: *** [/home/bti-001003/upstream/bitbake=
-builds/poky-master/build/tmp/work/cortexa57-oe-linux/android-tools/29.0.6.=
r14/sources/android-tools-29.0.6.r14/debian/system/core/adbd.mk:84: build] =
Error 1<br />| make: Leaving directory '/home/bti-001003/upstream/bitbake-b=
uilds/poky-master/build/tmp/work/cortexa57-oe-linux/android-tools/29.0.6.r1=
4/sources/android-tools-29.0.6.r14'<br />| ERROR: oe_runmake failed<br />| =
WARNING: exit code 1 from a shell command.<br />ERROR: Task (/home/bti-0010=
03/upstream/bitbake-builds/poky-master/layers/meta-openembedded/meta-oe/rec=
ipes-devtools/android-tools/android-tools_29.0.6.r14.bb:do_compile) failed =
with exit code '1'<br />NOTE: Tasks Summary: Attempted 1685 tasks of which =
275 didn't need to be rerun and 1 failed.</div>
<div>Summary: 1 task failed:<br />&nbsp; /home/bti-001003/upstream/bitbake-=
builds/poky-master/layers/meta-openembedded/meta-oe/recipes-devtools/androi=
d-tools/android-tools_29.0.6.r14.bb:do_compile<br />&nbsp; &nbsp; log: /hom=
e/bti-001003/upstream/bitbake-builds/poky-master/build/tmp/work/cortexa57-o=
e-linux/android-tools/29.0.6.r14/temp/log.do_compile.1623961<br />Summary: =
There were 12 WARNING messages.<br />Summary: There were 2 ERROR messages, =
returning a non-zero exit code.<br />&nbsp;~/upstream/bitbake-builds/poky-m=
aster/build :<br />&nbsp;~/upstream/bitbake-builds/poky-master/build :&nbsp=
;</div>
</div>

--1aDKkox5pIhkmcfBGxlf--

