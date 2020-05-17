Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.28053.1589741819376441944
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2020 11:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yu8gZmUT;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id g9so6562605edw.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2020 11:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3R7cGkTVeGqjjTFJrvz/kBHjqWnBJ0P+q37DjfMWsUo=;
        b=Yu8gZmUTTjk+oRJ8TOGZhIRWKP7bwix2eUjxKJpO6Lv3CTibiwR5YFZNZ0jzMlA0Gc
         rs8MdPz+d2DpfVth7RX6O+LI66SIVoXwO+u9dhV41kI5cRsnEwKpQkbz5N45Mqw9y9OW
         TGdVmLKiLC7/4RCFnufVpLcABztxU5A1J0WVCczaZJWH5gZr5+fimN3TFMc+F5tZb+sW
         nCxHD373aSpx7zDaZpWGMg2+FH2jeohL/jJD+eKjULzwl+ZUbqh3hgrJavNSlRmE56iO
         F47TuaC3lPqBXKSVgnLYlNcNC9Wb9nk0hGYqAVOpIe0HYLcxBssK8LIcEKcy48n/PiQD
         LaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3R7cGkTVeGqjjTFJrvz/kBHjqWnBJ0P+q37DjfMWsUo=;
        b=CYSFh2SDLV117lafTPL+odKtaizDxa/gcfgegzWDE0SSKheX1c+/GASMdkz2tNWXtk
         g05lEmbxmarVZQBKRf5rT/+m+c/9+nQ548ALBRxg2SyRkEniDEkpnEAncNrmzx4PXq4Q
         8fttZhnrjPVUQCAI9Iyf2/KHO/aBV5n6vNfNhddFapz/kZC/rV3aXE3RO3pV5sooqf2Y
         b/wCN/g091BK87NH+JRM4/YyLvf8xPEWbii0lmIgVhz/w9R7qSUnflOfr9TjybrlgVLf
         XAWVkpOPSouE8wTMFDPQmdXUjC0CJROYfLnbhwnJtFu+eVI4RKOHMOcKUibbaQG0Ar4h
         MLew==
X-Gm-Message-State: AOAM533rFhq8AKR7BIQXLmEhtQ3VA4U46NADPORmjLpuUrn0lZUhuLRU
	lmjH//F6Vpz+kP3LvTi4ixRFuV/HHHMmeSxAhjI=
X-Google-Smtp-Source: ABdhPJwXToM0dZ+N3+/+FqiixhV2of0VcjhnlESQ+9dzjdLuxEItN9pyyLy1E5aBoB9Zr2FGpwwWQr1fw1zOzxF1UZw=
X-Received: by 2002:a50:eb8e:: with SMTP id y14mr10640833edr.270.1589741817801;
 Sun, 17 May 2020 11:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200515121436.2078760-1-sean@geanix.com> <CAP71Wjw91K67Z2fV9AyySsapyjmg20WE4c3JY84kr5+i0=u-Og@mail.gmail.com>
 <CA+chaQeKWuojLcT8Hq+CwycKS9Apgf2kwwmTP+6R4Zwb9OqY1Q@mail.gmail.com>
 <ee978f33-6598-d425-2ae9-1784690b7ec3@gmail.com> <221fd505-64c2-bd32-31e7-54f4302da760@geanix.com>
In-Reply-To: <221fd505-64c2-bd32-31e7-54f4302da760@geanix.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 17 May 2020 20:56:46 +0200
Message-ID: <CA+chaQfAJuh+8u8rz9ToPAjbhbe5MTh7jNSc4CF9_g4Wkm6hfw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] gpsd: fix build on aarch64
To: Sean Nyekjaer <sean@geanix.com>
Cc: Khem Raj <raj.khem@gmail.com>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000055b02605a5dc9c1c"

--00000000000055b02605a5dc9c1c
Content-Type: text/plain; charset="UTF-8"

It looks like an issue when re-configuring in the same WORKDIR.

Looking at config.log in failing build I see:
file
BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/gpsd-3.20/SConstruct,line
669:
        Configure(confdir = .sconf_temp)
scons: Configure: Checking whether the C compiler works...
scons: Configure: ".sconf_temp/conftest_0.c" is up to date.
scons: Configure: The original builder output was:
  |.sconf_temp/conftest_0.c <-
  |  |
  |  |int main(void)
  |  |{
  |  |    return 0;
  |  |}
  |  |
  |
arm-webos-linux-gnueabi-gcc -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard
-mcpu=cortex-a7 -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security -Werror=return-type
--sysroot=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot
-o .sconf_temp/conftest_0.o -c
--sysroot=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot
-O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0=/usr/src/debug/gpsd/3.20-r0
-fdebug-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0=/usr/src/debug/gpsd/3.20-r0
-fdebug-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=
-fdebug-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot-native=
-fvisibility-inlines-hidden -fstack-protector-strong -O2
.sconf_temp/conftest_0.c
arm-webos-linux-gnueabi-gcc: error: .sconf_temp/conftest_0.c: No such file
or directory
arm-webos-linux-gnueabi-gcc: fatal error: no input files
compilation terminated.
scons: Configure: no

scons: Configure: Checking if compiler accepts -pthread...
scons: Configure: ".sconf_temp/conftest_1.c" is up to date.
scons: Configure: The original builder output was:
  |.sconf_temp/conftest_1.c <-
  |  |
  |  |        int main(int argc, char **argv) {
  |  |            (void) argc; (void) argv;
  |  |            return 0;
  |  |        }
  |  |
  |
arm-webos-linux-gnueabi-gcc -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard
-mcpu=cortex-a7 -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security -Werror=return-type
--sysroot=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot
-o .sconf_temp/conftest_1.o -c
--sysroot=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot
-pthread -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0=/usr/src/debug/gpsd/3.20-r0
-fdebug-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0=/usr/src/debug/gpsd/3.20-r0
-fdebug-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=
-fdebug-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot-native=
-fvisibility-inlines-hidden -fstack-protector-strong -O2
.sconf_temp/conftest_1.c
arm-webos-linux-gnueabi-gcc: error: .sconf_temp/conftest_1.c: No such file
or directory
arm-webos-linux-gnueabi-gcc: fatal error: no input files
compilation terminated.
scons: Configure: no

If I clean it first with:
bitbake -c cleansstate gpsd; bitbake -c compile gpsd
then config.log looks OK and gpsd builds OK

file
BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/gpsd-3.20/SConstruct,line
669:
        Configure(confdir = .sconf_temp)
scons: Configure: Checking whether the C compiler works...
.sconf_temp/conftest_0.c <-
  |
  |int main(void)
  |{
  |    return 0;
  |}
  |
arm-webos-linux-gnueabi-gcc -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard
-mcpu=cortex-a7 -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security -Werror=return-type
--sysroot=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot
-o .sconf_temp/conftest_0.o -c
--sysroot=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot
-O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0=/usr/src/debug/gpsd/3.20-r0
-fdebug-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0=/usr/src/debug/gpsd/3.20-r0
-fdebug-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=
-fdebug-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot-native=
-fvisibility-inlines-hidden -fstack-protector-strong -O2
.sconf_temp/conftest_0.c
cc1: warning: command-line option '-fvisibility-inlines-hidden' is valid
for C++/ObjC++ but not for C
scons: Configure: yes

scons: Configure: Checking if compiler accepts -pthread...
.sconf_temp/conftest_1.c <-
  |
  |        int main(int argc, char **argv) {
  |            (void) argc; (void) argv;
  |            return 0;
  |        }
  |
arm-webos-linux-gnueabi-gcc -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard
-mcpu=cortex-a7 -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security -Werror=return-type
--sysroot=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot
-o .sconf_temp/conftest_1.o -c
--sysroot=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot
-pthread -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0=/usr/src/debug/gpsd/3.20-r0
-fdebug-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0=/usr/src/debug/gpsd/3.20-r0
-fdebug-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=
-fdebug-prefix-map=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot-native=
-fvisibility-inlines-hidden -fstack-protector-strong -O2
.sconf_temp/conftest_1.c
cc1: warning: command-line option '-fvisibility-inlines-hidden' is valid
for C++/ObjC++ but not for C
arm-webos-linux-gnueabi-gcc -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard
-mcpu=cortex-a7 -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security -Werror=return-type
--sysroot=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot
-o .sconf_temp/conftest_1 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
-Wl,-z,relro,-z,now
--sysroot=BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot
.sconf_temp/conftest_1.o -L.
-LBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot/usr/lib
scons: Configure: yes

On Sun, May 17, 2020 at 4:13 PM Sean Nyekjaer <sean@geanix.com> wrote:

>
>
> On 15/05/2020 17.22, Khem Raj wrote:
> >
> >
> > On 5/15/20 8:07 AM, Martin Jansa wrote:
> >> I was seeing this issue also on arm (raspberrypi4), so it's not
> >> specific to aarch64 as subject says.
> >>
> >> With this fix I'm still seeing build failure:
> >> | ppsthread.c:1281: error: undefined reference to 'pthread_create'
> >>
> >
> > Perhaps also set LDFLAGS = "-pthread"
> >
>
> Seems fine in my builds:
>
> arm-oe-linux-gnueabi-gcc -mthumb -mfpu=neon -mfloat-abi=hard
> -mcpu=cortex-a7
> --sysroot=/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot
>
> -o ppsthread.o -c
> --sysroot=/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot
>
> -pthread -Wall -Wcast-align -Wextra -Wimplicit-fallthrough
> -Wmissing-declarations -Wmissing-prototypes
> -Wno-missing-field-initializers -Wno-uninitialized -Wpointer-arith
> -Wreturn-type -Wstrict-prototypes -Wvla -pipe -g
> -feliminate-unused-debug-types
> -fmacro-prefix-map=/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0=/usr/src/debug/gpsd/3.20-r0
>
> -fdebug-prefix-map=/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0=/usr/src/debug/gpsd/3.20-r0
>
> -fdebug-prefix-map=/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=
>
> -fdebug-prefix-map=/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot-native=
>
> -fvisibility-inlines-hidden -O2 -pthread
> -I/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot/usr/include/dbus-1.0
>
> -I/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot/usr/lib/dbus-1.0/include
>
> -I/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot/usr/include/libusb-1.0
>
> ppsthread.c
>
> and
>
> aarch64-oe-linux-gcc -march=armv8-a+crc
> --sysroot=/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot
>
> -o ppsthread.o -c
> --sysroot=/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot
>
> -pthread -Wall -Wcast-align -Wextra -Wimplicit-fallthrough
> -Wmissing-declarations -Wmissing-prototypes
> -Wno-missing-field-initializers -Wno-uninitialized -Wpointer-arith
> -Wreturn-type -Wstrict-prototypes -Wvla -pipe -g
> -feliminate-unused-debug-types
> -fmacro-prefix-map=/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0=/usr/src/debug/gpsd/3.20-r0
>
> -fdebug-prefix-map=/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0=/usr/src/debug/gpsd/3.20-r0
>
> -fdebug-prefix-map=/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot=
>
> -fdebug-prefix-map=/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot-native=
>
> -fvisibility-inlines-hidden -O2 -pthread
> -I/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot/usr/include/dbus-1.0
>
> -I/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot/usr/lib/dbus-1.0/include
>
> -I/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot/usr/include/libusb-1.0
>
> ppsthread.c
>
> By now, Scons is my favorite build system :-D
>
> /Sean
>

--00000000000055b02605a5dc9c1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It looks like an issue when re-configuring in the same WOR=
KDIR.<div><br></div><div>Looking at config.log in failing build I see:</div=
><div>file BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-=
r0/gpsd-3.20/SConstruct,line 669:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Configure(=
confdir =3D .sconf_temp)<br>scons: Configure: Checking whether the C compil=
er works... <br>scons: Configure: &quot;.sconf_temp/conftest_0.c&quot; is u=
p to date.<br>scons: Configure: The original builder output was:<br>=C2=A0 =
|.sconf_temp/conftest_0.c &lt;-<br>=C2=A0 | =C2=A0|<br>=C2=A0 | =C2=A0|int =
main(void)<br>=C2=A0 | =C2=A0|{<br>=C2=A0 | =C2=A0| =C2=A0 =C2=A0return 0;<=
br>=C2=A0 | =C2=A0|}<br>=C2=A0 | =C2=A0|<br>=C2=A0 |<br>arm-webos-linux-gnu=
eabi-gcc -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 -f=
stack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -We=
rror=3Dformat-security -Werror=3Dreturn-type --sysroot=3DBUILD/tmp-glibc/wo=
rk/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot -o .sconf_t=
emp/conftest_0.o -c --sysroot=3DBUILD/tmp-glibc/work/raspberrypi4-webos-lin=
ux-gnueabi/gpsd/3.20-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debu=
g-types -fmacro-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-=
gnueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0 -fdebug-prefix-map=3DBUI=
LD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0=3D/usr/src/=
debug/gpsd/3.20-r0 -fdebug-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-w=
ebos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=3D -fdebug-prefix-map=3DBUIL=
D/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysro=
ot-native=3D -fvisibility-inlines-hidden -fstack-protector-strong -O2 .scon=
f_temp/conftest_0.c<br>arm-webos-linux-gnueabi-gcc: error: .sconf_temp/conf=
test_0.c: No such file or directory<br>arm-webos-linux-gnueabi-gcc: fatal e=
rror: no input files<br>compilation terminated.<br>scons: Configure: no<br>=
<br>scons: Configure: Checking if compiler accepts -pthread... <br>scons: C=
onfigure: &quot;.sconf_temp/conftest_1.c&quot; is up to date.<br>scons: Con=
figure: The original builder output was:<br>=C2=A0 |.sconf_temp/conftest_1.=
c &lt;-<br>=C2=A0 | =C2=A0|<br>=C2=A0 | =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int main(int argc, char **argv) {<br>=C2=A0 | =C2=A0| =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(void) argc; (void) argv;<br>=C2=A0 | =C2=A0| =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>=C2=A0 | =C2=A0| =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>=C2=A0 | =C2=A0| =C2=A0 =C2=A0<br>=C2=A0 |<br>arm-web=
os-linux-gnueabi-gcc -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=3D=
cortex-a7 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-=
security -Werror=3Dformat-security -Werror=3Dreturn-type --sysroot=3DBUILD/=
tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=
 -o .sconf_temp/conftest_1.o -c --sysroot=3DBUILD/tmp-glibc/work/raspberryp=
i4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot -pthread -O2 -pipe -g -f=
eliminate-unused-debug-types -fmacro-prefix-map=3DBUILD/tmp-glibc/work/rasp=
berrypi4-webos-linux-gnueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0 -fd=
ebug-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gps=
d/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0 -fdebug-prefix-map=3DBUILD/tmp-glib=
c/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=3D -fde=
bug-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd=
/3.20-r0/recipe-sysroot-native=3D -fvisibility-inlines-hidden -fstack-prote=
ctor-strong -O2 .sconf_temp/conftest_1.c<br>arm-webos-linux-gnueabi-gcc: er=
ror: .sconf_temp/conftest_1.c: No such file or directory<br>arm-webos-linux=
-gnueabi-gcc: fatal error: no input files<br>compilation terminated.<br>sco=
ns: Configure: no<br></div><div><br></div><div>If I clean it first with:</d=
iv><div>bitbake -c cleansstate gpsd; bitbake -c compile gpsd<br></div><div>=
then config.log looks OK and gpsd builds OK</div><div><br></div><div>file B=
UILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/gpsd-3.20=
/SConstruct,line 669:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Configure(confdir =3D =
.sconf_temp)<br>scons: Configure: Checking whether the C compiler works... =
<br>.sconf_temp/conftest_0.c &lt;-<br>=C2=A0 |<br>=C2=A0 |int main(void)<br=
>=C2=A0 |{<br>=C2=A0 | =C2=A0 =C2=A0return 0;<br>=C2=A0 |}<br>=C2=A0 |<br>a=
rm-webos-linux-gnueabi-gcc -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -m=
cpu=3Dcortex-a7 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat -Wf=
ormat-security -Werror=3Dformat-security -Werror=3Dreturn-type --sysroot=3D=
BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-s=
ysroot -o .sconf_temp/conftest_0.o -c --sysroot=3DBUILD/tmp-glibc/work/rasp=
berrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot -O2 -pipe -g -feli=
minate-unused-debug-types -fmacro-prefix-map=3DBUILD/tmp-glibc/work/raspber=
rypi4-webos-linux-gnueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0 -fdebu=
g-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3=
.20-r0=3D/usr/src/debug/gpsd/3.20-r0 -fdebug-prefix-map=3DBUILD/tmp-glibc/w=
ork/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=3D -fdebug=
-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.=
20-r0/recipe-sysroot-native=3D -fvisibility-inlines-hidden -fstack-protecto=
r-strong -O2 .sconf_temp/conftest_0.c<br>cc1: warning: command-line option =
&#39;-fvisibility-inlines-hidden&#39; is valid for C++/ObjC++ but not for C=
<br>scons: Configure: yes<br><br>scons: Configure: Checking if compiler acc=
epts -pthread... <br>.sconf_temp/conftest_1.c &lt;-<br>=C2=A0 |<br>=C2=A0 |=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0int main(int argc, char **argv) {<br>=C2=A0 | =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) argc; (void) argv;<br>=C2=
=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>=C2=A0 | =C2=A0=
 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 | =C2=A0 =C2=A0<br>arm-webos-linux-gnueabi=
-gcc -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 -fstac=
k-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=
=3Dformat-security -Werror=3Dreturn-type --sysroot=3DBUILD/tmp-glibc/work/r=
aspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot -o .sconf_temp/=
conftest_1.o -c --sysroot=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-g=
nueabi/gpsd/3.20-r0/recipe-sysroot -pthread -O2 -pipe -g -feliminate-unused=
-debug-types -fmacro-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-webos-l=
inux-gnueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0 -fdebug-prefix-map=
=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0=3D/us=
r/src/debug/gpsd/3.20-r0 -fdebug-prefix-map=3DBUILD/tmp-glibc/work/raspberr=
ypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=3D -fdebug-prefix-map=
=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recip=
e-sysroot-native=3D -fvisibility-inlines-hidden -fstack-protector-strong -O=
2 .sconf_temp/conftest_1.c<br>cc1: warning: command-line option &#39;-fvisi=
bility-inlines-hidden&#39; is valid for C++/ObjC++ but not for C<br>arm-web=
os-linux-gnueabi-gcc -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=3D=
cortex-a7 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-=
security -Werror=3Dformat-security -Werror=3Dreturn-type --sysroot=3DBUILD/=
tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=
 -o .sconf_temp/conftest_1 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
Wl,-z,relro,-z,now --sysroot=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linu=
x-gnueabi/gpsd/3.20-r0/recipe-sysroot .sconf_temp/conftest_1.o -L. -LBUILD/=
tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=
/usr/lib<br>scons: Configure: yes<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, May 17, 2020 at 4:13 PM =
Sean Nyekjaer &lt;<a href=3D"mailto:sean@geanix.com">sean@geanix.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 15/05/2020 17.22, Khem Raj wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 5/15/20 8:07 AM, Martin Jansa wrote:<br>
&gt;&gt; I was seeing this issue also on arm (raspberrypi4), so it&#39;s no=
t <br>
&gt;&gt; specific to aarch64 as subject says.<br>
&gt;&gt;<br>
&gt;&gt; With this fix I&#39;m still seeing=C2=A0build failure:<br>
&gt;&gt; | ppsthread.c:1281: error: undefined reference to &#39;pthread_cre=
ate&#39;<br>
&gt;&gt;<br>
&gt; <br>
&gt; Perhaps also set LDFLAGS =3D &quot;-pthread&quot;<br>
&gt;<br>
<br>
Seems fine in my builds:<br>
<br>
arm-oe-linux-gnueabi-gcc -mthumb -mfpu=3Dneon -mfloat-abi=3Dhard <br>
-mcpu=3Dcortex-a7 <br>
--sysroot=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2h=
f-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot <br>
-o ppsthread.o -c <br>
--sysroot=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2h=
f-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot <br>
-pthread -Wall -Wcast-align -Wextra -Wimplicit-fallthrough <br>
-Wmissing-declarations -Wmissing-prototypes <br>
-Wno-missing-field-initializers -Wno-uninitialized -Wpointer-arith <br>
-Wreturn-type -Wstrict-prototypes -Wvla -pipe -g <br>
-feliminate-unused-debug-types <br>
-fmacro-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/co=
rtexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0=
 <br>
-fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/co=
rtexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0=
 <br>
-fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/co=
rtexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=3D <br>
-fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/co=
rtexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot-native=3D <br>
-fvisibility-inlines-hidden -O2 -pthread <br>
-I/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-oe-=
linux-gnueabi/gpsd/3.20-r0/recipe-sysroot/usr/include/dbus-1.0 <br>
-I/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-oe-=
linux-gnueabi/gpsd/3.20-r0/recipe-sysroot/usr/lib/dbus-1.0/include <br>
-I/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-oe-=
linux-gnueabi/gpsd/3.20-r0/recipe-sysroot/usr/include/libusb-1.0 <br>
ppsthread.c<br>
<br>
and<br>
<br>
aarch64-oe-linux-gcc -march=3Darmv8-a+crc <br>
--sysroot=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-=
linux/gpsd/3.20-r0/recipe-sysroot <br>
-o ppsthread.o -c <br>
--sysroot=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-=
linux/gpsd/3.20-r0/recipe-sysroot <br>
-pthread -Wall -Wcast-align -Wextra -Wimplicit-fallthrough <br>
-Wmissing-declarations -Wmissing-prototypes <br>
-Wno-missing-field-initializers -Wno-uninitialized -Wpointer-arith <br>
-Wreturn-type -Wstrict-prototypes -Wvla -pipe -g <br>
-feliminate-unused-debug-types <br>
-fmacro-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/aa=
rch64-oe-linux/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0 <br>
-fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/aa=
rch64-oe-linux/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0 <br>
-fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/aa=
rch64-oe-linux/gpsd/3.20-r0/recipe-sysroot=3D <br>
-fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/aa=
rch64-oe-linux/gpsd/3.20-r0/recipe-sysroot-native=3D <br>
-fvisibility-inlines-hidden -O2 -pthread <br>
-I/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gpsd=
/3.20-r0/recipe-sysroot/usr/include/dbus-1.0 <br>
-I/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gpsd=
/3.20-r0/recipe-sysroot/usr/lib/dbus-1.0/include <br>
-I/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gpsd=
/3.20-r0/recipe-sysroot/usr/include/libusb-1.0 <br>
ppsthread.c<br>
<br>
By now, Scons is my favorite build system :-D<br>
<br>
/Sean<br>
</blockquote></div>

--00000000000055b02605a5dc9c1c--
