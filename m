Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.28508.1589744437182346872
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2020 12:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GNMgDdYp;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id g185so8101568qke.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2020 12:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Vdq8Ycp2OugdRSfjMbrs88BFjndSub8c04lI6fflRoE=;
        b=GNMgDdYphe0j1PRCaDbSLLkab3nDv4r0Nl2c5ec5I1XAyrOzu4hDnTkZb9jdnx6j2b
         KkemVuygAue6JzgQpAbh028GVh2NvpmrEHDs0qdInerP93yMK7E5GgLYWqqMl8VYBguH
         pYILDma476C4ZTfMN002+2xiF5Ovnug5u15+QDT/E1t/rw7Z7A8ldJc6bqc4Iy1rP+TZ
         MVAggUiXvBzslO07eTEcsD/hC/GVGI11McRK2DdE+ux7t7/P7JVJHiT8ypyN+SvYH9WI
         gMqc/fu/PYX+KaDivS+v71+t2CBwF0glep5gReGYzGGgYZh8+Crm96yph9iVhk85E5sB
         4GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Vdq8Ycp2OugdRSfjMbrs88BFjndSub8c04lI6fflRoE=;
        b=Odub8uvgfaBmGcNbhx214zQbELXFzqxXXI95B8Cl4mi3D4oHSsH1JTAngps2kbcmVM
         5IRIyNsM+umuWDEd2DoLbHC+AjYrTAMVQRZhs9eusQRcTlZzHD9fgat/o5LHobxWZXIq
         fvR65m1QFemBogZ2P7Z0DWPhKYbSs3ZwW1To+gVykYlaclb94hWa38fw90sfkYX4YGvx
         pkMWb0BqkM1ngr8KmYEKZUdwfbUaQTzVkot3qs1ZupHRF1IyDx06sEeSVcmNYUWwg+Ec
         mgzrmFZYb2wgw/EneDJhXJLxotU1Nx/hfCaSFiD6f5wWkQh3FESVms0JG5U/Vvkyw5HV
         x5MQ==
X-Gm-Message-State: AOAM5314eyrZj6kOpVsLm4iMA5UQ3bUuRuyc21r+IzJU8+BB4pobfo0d
	oYuqdWeaCDRUMzp2qG2hJxDDUYeIpzjwak9TfBU=
X-Google-Smtp-Source: ABdhPJwyF6uVKVtUCT0EGmxB+YSQ857VFAXQeLyvmjYBZ5ZkDY51jlNnr7+Ug4XHxZJx/FNx1nTfFssWgF4EbOiSvu0=
X-Received: by 2002:ae9:dc47:: with SMTP id q68mr12060926qkf.17.1589744436095;
 Sun, 17 May 2020 12:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200515121436.2078760-1-sean@geanix.com> <CAP71Wjw91K67Z2fV9AyySsapyjmg20WE4c3JY84kr5+i0=u-Og@mail.gmail.com>
 <CA+chaQeKWuojLcT8Hq+CwycKS9Apgf2kwwmTP+6R4Zwb9OqY1Q@mail.gmail.com>
 <ee978f33-6598-d425-2ae9-1784690b7ec3@gmail.com> <221fd505-64c2-bd32-31e7-54f4302da760@geanix.com>
 <CA+chaQfAJuh+8u8rz9ToPAjbhbe5MTh7jNSc4CF9_g4Wkm6hfw@mail.gmail.com>
In-Reply-To: <CA+chaQfAJuh+8u8rz9ToPAjbhbe5MTh7jNSc4CF9_g4Wkm6hfw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 17 May 2020 12:40:10 -0700
Message-ID: <CAMKF1soMYApEWGqSnNakWjva1BxdhfvmCKMFJuR9yAd15EMvvQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] gpsd: fix build on aarch64
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2020 at 11:56 AM Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>
> It looks like an issue when re-configuring in the same WORKDIR.
>

Mark it CLEANBROKEN =3D "1"

> Looking at config.log in failing build I see:
> file BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/g=
psd-3.20/SConstruct,line 669:
>         Configure(confdir =3D .sconf_temp)
> scons: Configure: Checking whether the C compiler works...
> scons: Configure: ".sconf_temp/conftest_0.c" is up to date.
> scons: Configure: The original builder output was:
>   |.sconf_temp/conftest_0.c <-
>   |  |
>   |  |int main(void)
>   |  |{
>   |  |    return 0;
>   |  |}
>   |  |
>   |
> arm-webos-linux-gnueabi-gcc -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard=
 -mcpu=3Dcortex-a7 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat =
-Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type --sysroot=
=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recip=
e-sysroot -o .sconf_temp/conftest_0.o -c --sysroot=3DBUILD/tmp-glibc/work/r=
aspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot -O2 -pipe -g -f=
eliminate-unused-debug-types -fmacro-prefix-map=3DBUILD/tmp-glibc/work/rasp=
berrypi4-webos-linux-gnueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0 -fd=
ebug-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gps=
d/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0 -fdebug-prefix-map=3DBUILD/tmp-glib=
c/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=3D -fde=
bug-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd=
/3.20-r0/recipe-sysroot-native=3D -fvisibility-inlines-hidden -fstack-prote=
ctor-strong -O2 .sconf_temp/conftest_0.c
> arm-webos-linux-gnueabi-gcc: error: .sconf_temp/conftest_0.c: No such fil=
e or directory
> arm-webos-linux-gnueabi-gcc: fatal error: no input files
> compilation terminated.
> scons: Configure: no
>
> scons: Configure: Checking if compiler accepts -pthread...
> scons: Configure: ".sconf_temp/conftest_1.c" is up to date.
> scons: Configure: The original builder output was:
>   |.sconf_temp/conftest_1.c <-
>   |  |
>   |  |        int main(int argc, char **argv) {
>   |  |            (void) argc; (void) argv;
>   |  |            return 0;
>   |  |        }
>   |  |
>   |
> arm-webos-linux-gnueabi-gcc -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard=
 -mcpu=3Dcortex-a7 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat =
-Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type --sysroot=
=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recip=
e-sysroot -o .sconf_temp/conftest_1.o -c --sysroot=3DBUILD/tmp-glibc/work/r=
aspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot -pthread -O2 -p=
ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=3DBUILD/tmp-glibc/=
work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.=
20-r0 -fdebug-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gn=
ueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0 -fdebug-prefix-map=3DBUILD=
/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroo=
t=3D -fdebug-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnu=
eabi/gpsd/3.20-r0/recipe-sysroot-native=3D -fvisibility-inlines-hidden -fst=
ack-protector-strong -O2 .sconf_temp/conftest_1.c
> arm-webos-linux-gnueabi-gcc: error: .sconf_temp/conftest_1.c: No such fil=
e or directory
> arm-webos-linux-gnueabi-gcc: fatal error: no input files
> compilation terminated.
> scons: Configure: no
>
> If I clean it first with:
> bitbake -c cleansstate gpsd; bitbake -c compile gpsd
> then config.log looks OK and gpsd builds OK
>
> file BUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/g=
psd-3.20/SConstruct,line 669:
>         Configure(confdir =3D .sconf_temp)
> scons: Configure: Checking whether the C compiler works...
> .sconf_temp/conftest_0.c <-
>   |
>   |int main(void)
>   |{
>   |    return 0;
>   |}
>   |
> arm-webos-linux-gnueabi-gcc -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard=
 -mcpu=3Dcortex-a7 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat =
-Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type --sysroot=
=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recip=
e-sysroot -o .sconf_temp/conftest_0.o -c --sysroot=3DBUILD/tmp-glibc/work/r=
aspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot -O2 -pipe -g -f=
eliminate-unused-debug-types -fmacro-prefix-map=3DBUILD/tmp-glibc/work/rasp=
berrypi4-webos-linux-gnueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0 -fd=
ebug-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gps=
d/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0 -fdebug-prefix-map=3DBUILD/tmp-glib=
c/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=3D -fde=
bug-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd=
/3.20-r0/recipe-sysroot-native=3D -fvisibility-inlines-hidden -fstack-prote=
ctor-strong -O2 .sconf_temp/conftest_0.c
> cc1: warning: command-line option '-fvisibility-inlines-hidden' is valid =
for C++/ObjC++ but not for C
> scons: Configure: yes
>
> scons: Configure: Checking if compiler accepts -pthread...
> .sconf_temp/conftest_1.c <-
>   |
>   |        int main(int argc, char **argv) {
>   |            (void) argc; (void) argv;
>   |            return 0;
>   |        }
>   |
> arm-webos-linux-gnueabi-gcc -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard=
 -mcpu=3Dcortex-a7 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat =
-Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type --sysroot=
=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recip=
e-sysroot -o .sconf_temp/conftest_1.o -c --sysroot=3DBUILD/tmp-glibc/work/r=
aspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot -pthread -O2 -p=
ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=3DBUILD/tmp-glibc/=
work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.=
20-r0 -fdebug-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gn=
ueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0 -fdebug-prefix-map=3DBUILD=
/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroo=
t=3D -fdebug-prefix-map=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnu=
eabi/gpsd/3.20-r0/recipe-sysroot-native=3D -fvisibility-inlines-hidden -fst=
ack-protector-strong -O2 .sconf_temp/conftest_1.c
> cc1: warning: command-line option '-fvisibility-inlines-hidden' is valid =
for C++/ObjC++ but not for C
> arm-webos-linux-gnueabi-gcc -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard=
 -mcpu=3Dcortex-a7 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wformat =
-Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type --sysroot=
=3DBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recip=
e-sysroot -o .sconf_temp/conftest_1 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as=
-needed -Wl,-z,relro,-z,now --sysroot=3DBUILD/tmp-glibc/work/raspberrypi4-w=
ebos-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot .sconf_temp/conftest_1.o -L.=
 -LBUILD/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/gpsd/3.20-r0/recip=
e-sysroot/usr/lib
> scons: Configure: yes
>
> On Sun, May 17, 2020 at 4:13 PM Sean Nyekjaer <sean@geanix.com> wrote:
>>
>>
>>
>> On 15/05/2020 17.22, Khem Raj wrote:
>> >
>> >
>> > On 5/15/20 8:07 AM, Martin Jansa wrote:
>> >> I was seeing this issue also on arm (raspberrypi4), so it's not
>> >> specific to aarch64 as subject says.
>> >>
>> >> With this fix I'm still seeing build failure:
>> >> | ppsthread.c:1281: error: undefined reference to 'pthread_create'
>> >>
>> >
>> > Perhaps also set LDFLAGS =3D "-pthread"
>> >
>>
>> Seems fine in my builds:
>>
>> arm-oe-linux-gnueabi-gcc -mthumb -mfpu=3Dneon -mfloat-abi=3Dhard
>> -mcpu=3Dcortex-a7
>> --sysroot=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7=
t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot
>> -o ppsthread.o -c
>> --sysroot=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7=
t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot
>> -pthread -Wall -Wcast-align -Wextra -Wimplicit-fallthrough
>> -Wmissing-declarations -Wmissing-prototypes
>> -Wno-missing-field-initializers -Wno-uninitialized -Wpointer-arith
>> -Wreturn-type -Wstrict-prototypes -Wvla -pipe -g
>> -feliminate-unused-debug-types
>> -fmacro-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work=
/cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20=
-r0
>> -fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work=
/cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20=
-r0
>> -fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work=
/cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=3D
>> -fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work=
/cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot-native=3D
>> -fvisibility-inlines-hidden -O2 -pthread
>> -I/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-=
oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot/usr/include/dbus-1.0
>> -I/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-=
oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot/usr/lib/dbus-1.0/include
>> -I/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-=
oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot/usr/include/libusb-1.0
>> ppsthread.c
>>
>> and
>>
>> aarch64-oe-linux-gcc -march=3Darmv8-a+crc
>> --sysroot=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-=
oe-linux/gpsd/3.20-r0/recipe-sysroot
>> -o ppsthread.o -c
>> --sysroot=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-=
oe-linux/gpsd/3.20-r0/recipe-sysroot
>> -pthread -Wall -Wcast-align -Wextra -Wimplicit-fallthrough
>> -Wmissing-declarations -Wmissing-prototypes
>> -Wno-missing-field-initializers -Wno-uninitialized -Wpointer-arith
>> -Wreturn-type -Wstrict-prototypes -Wvla -pipe -g
>> -feliminate-unused-debug-types
>> -fmacro-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work=
/aarch64-oe-linux/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0
>> -fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work=
/aarch64-oe-linux/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0
>> -fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work=
/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot=3D
>> -fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work=
/aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot-native=3D
>> -fvisibility-inlines-hidden -O2 -pthread
>> -I/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/g=
psd/3.20-r0/recipe-sysroot/usr/include/dbus-1.0
>> -I/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/g=
psd/3.20-r0/recipe-sysroot/usr/lib/dbus-1.0/include
>> -I/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/g=
psd/3.20-r0/recipe-sysroot/usr/include/libusb-1.0
>> ppsthread.c
>>
>> By now, Scons is my favorite build system :-D
>>
>> /Sean
