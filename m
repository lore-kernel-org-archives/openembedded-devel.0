Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web12.22668.1589724819510533205
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2020 07:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com header.s=first header.b=YdbOuJVm;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from [192.168.100.99] (xb90f4a16.cust.hiper.dk [185.15.74.22])
	by first.geanix.com (Postfix) with ESMTPSA id 1665020224C4;
	Sun, 17 May 2020 14:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1589724816; bh=dypkoO6gm3fhRO3QpdrNSlDbn/l8hbX2hoRPMO7h25c=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=YdbOuJVmlnLWITXgUrhp0PO9N8tZx79VhySy1ZFCBSUBSpbnDuCd87+ZucWmRVxZC
	 2ASKmplqQvRZsbWQbknyBm4m9oOlocncTe4DaG+OrdYMJOdlExUANCJIJJA91iHDLT
	 rrUB0jXbx87OB80gB36Rt/hJ/zv2L4B70buubrWmIRg+Jxofb1ybW/WcYKewXFyy4M
	 /FNIjf9LwUMjbMLO2IJMja8Z5w/qFBbfpbO2x0e5JuBeqi1MEq7jJRt0kU2OeCFR15
	 K3Hwl2zSBs+/7Tz78shT6bdxt3Of0bwxPuLWsRCtnblljj7ANgf+rjWmjCbm6aRkst
	 gFUtJQhJFNlAg==
Subject: Re: [oe] [meta-oe] [PATCH] gpsd: fix build on aarch64
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
 Alistair Francis <alistair23@gmail.com>
References: <20200515121436.2078760-1-sean@geanix.com>
 <CAP71Wjw91K67Z2fV9AyySsapyjmg20WE4c3JY84kr5+i0=u-Og@mail.gmail.com>
 <CA+chaQeKWuojLcT8Hq+CwycKS9Apgf2kwwmTP+6R4Zwb9OqY1Q@mail.gmail.com>
 <ee978f33-6598-d425-2ae9-1784690b7ec3@gmail.com>
From: "Sean Nyekjaer" <sean@geanix.com>
Message-ID: <221fd505-64c2-bd32-31e7-54f4302da760@geanix.com>
Date: Sun, 17 May 2020 16:13:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ee978f33-6598-d425-2ae9-1784690b7ec3@gmail.com>
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on fdf6823a942a
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable



On 15/05/2020 17.22, Khem Raj wrote:
>=20
>=20
> On 5/15/20 8:07 AM, Martin Jansa wrote:
>> I was seeing this issue also on arm (raspberrypi4), so it's not=20
>> specific to aarch64 as subject says.
>>
>> With this fix I'm still seeing=C2=A0build failure:
>> | ppsthread.c:1281: error: undefined reference to 'pthread_create'
>>
>=20
> Perhaps also set LDFLAGS =3D "-pthread"
>

Seems fine in my builds:

arm-oe-linux-gnueabi-gcc -mthumb -mfpu=3Dneon -mfloat-abi=3Dhard=20
-mcpu=3Dcortex-a7=20
--sysroot=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t=
2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=20
-o ppsthread.o -c=20
--sysroot=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t=
2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=20
-pthread -Wall -Wcast-align -Wextra -Wimplicit-fallthrough=20
-Wmissing-declarations -Wmissing-prototypes=20
-Wno-missing-field-initializers -Wno-uninitialized -Wpointer-arith=20
-Wreturn-type -Wstrict-prototypes -Wvla -pipe -g=20
-feliminate-unused-debug-types=20
-fmacro-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/=
cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.2=
0-r0=20
-fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/=
cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.2=
0-r0=20
-fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/=
cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot=3D=20
-fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/=
cortexa7t2hf-neon-oe-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot-native=3D=20
-fvisibility-inlines-hidden -O2 -pthread=20
-I/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-o=
e-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot/usr/include/dbus-1.0=20
-I/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-o=
e-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot/usr/lib/dbus-1.0/include=20
-I/home/sean/development/cc/yoctobuild/tmp-glibc/work/cortexa7t2hf-neon-o=
e-linux-gnueabi/gpsd/3.20-r0/recipe-sysroot/usr/include/libusb-1.0=20
ppsthread.c

and

aarch64-oe-linux-gcc -march=3Darmv8-a+crc=20
--sysroot=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-o=
e-linux/gpsd/3.20-r0/recipe-sysroot=20
-o ppsthread.o -c=20
--sysroot=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-o=
e-linux/gpsd/3.20-r0/recipe-sysroot=20
-pthread -Wall -Wcast-align -Wextra -Wimplicit-fallthrough=20
-Wmissing-declarations -Wmissing-prototypes=20
-Wno-missing-field-initializers -Wno-uninitialized -Wpointer-arith=20
-Wreturn-type -Wstrict-prototypes -Wvla -pipe -g=20
-feliminate-unused-debug-types=20
-fmacro-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/=
aarch64-oe-linux/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0=20
-fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/=
aarch64-oe-linux/gpsd/3.20-r0=3D/usr/src/debug/gpsd/3.20-r0=20
-fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/=
aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot=3D=20
-fdebug-prefix-map=3D/home/sean/development/cc/yoctobuild/tmp-glibc/work/=
aarch64-oe-linux/gpsd/3.20-r0/recipe-sysroot-native=3D=20
-fvisibility-inlines-hidden -O2 -pthread=20
-I/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gp=
sd/3.20-r0/recipe-sysroot/usr/include/dbus-1.0=20
-I/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gp=
sd/3.20-r0/recipe-sysroot/usr/lib/dbus-1.0/include=20
-I/home/sean/development/cc/yoctobuild/tmp-glibc/work/aarch64-oe-linux/gp=
sd/3.20-r0/recipe-sysroot/usr/include/libusb-1.0=20
ppsthread.c

By now, Scons is my favorite build system :-D

/Sean
