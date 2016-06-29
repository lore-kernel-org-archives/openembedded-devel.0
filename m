Return-Path: <schaefer.hutter@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id E628E60107
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 08:28:58 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id v6so5418627vkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 01:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=5wRNiNhUI60scXpHvgne/gEfJo0JDM172G7PJ2ghses=;
	b=UcmQh5Rb6I/k/m8jXBQIra03O7huMMlOGs8Qm3TKFuhbpOhXOylyx94ALB5QwUv41g
	YUIzotci19cCwWj7KOlHZmLi5Mj6NDWfNi2ZbyXAYrihq5vEVFO75m+fYlDtpnXN5Sd7
	56UFO+Qm2QqZ6jUjc37Kn7nSHKs+/W7rNdqnXewvVtAVvd5wOpDfF8WLctqUdIotdzty
	sf5C6Ft2KRax7cnRTvU6/M2/kwczGrVhWf/RemajdeTKpqaQ/ECjl9FYhcoevh8sp8fJ
	TXuNxjvUh6EV/yiMvJ85iIKV08ZXAVZd3pCYt/SQl+EVPwhZDDztMA5n5mG4SNxeZ8Sj
	cB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=5wRNiNhUI60scXpHvgne/gEfJo0JDM172G7PJ2ghses=;
	b=XIafFAW+Kpi9JzxLpNc4rJESqA4G74R1M87OKPILVm0xkyzJXN//IDDv9h/fhAQEQF
	oR8npXGQQo4Jzj+XHxPIjRkPzYcqwKSxD9JbDVu/GQinG0qmlsM9AzKeEAKLqWPEaVa1
	NIwIGoGE4CkfzIyC/gmP4+spAfi3rBHbaEMwsS8fT/G5QPKdjorkH8+AMzOseKPo/5m+
	FVYMgEZzxFhKG7VG9YdGySgbyntUAmDuPl8a/RR8fUUH2sE2YkSWFTQDZqqPKv8VNrBx
	12dA2SOQ0eDCyjKoxbxWGGAybZDm910Z6Vd5dgJajbIxAXb1JZ7f0MG9V7Mr/7vgZdUw
	vL4Q==
X-Gm-Message-State: ALyK8tLqI6OhGPRdf8DuJwY4bNeo3zm6F4CJuHXG+6qCMbDW1x5Lmlx2WPRmPPHhdQVRjaiI2F6rEN+VCgcvbQ==
X-Received: by 10.31.80.199 with SMTP id e190mr3025099vkb.124.1467188938850;
	Wed, 29 Jun 2016 01:28:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.77 with HTTP; Wed, 29 Jun 2016 01:28:58 -0700 (PDT)
In-Reply-To: <CAK7uLydzisVkd4Tc+qNYZV3o1CeyXcbBjKpNu2eXE3TOANncEQ@mail.gmail.com>
References: <CAK7uLydzisVkd4Tc+qNYZV3o1CeyXcbBjKpNu2eXE3TOANncEQ@mail.gmail.com>
From: =?UTF-8?B?U2Now6RmZXItSHV0dGVy?= <schaefer.hutter@gmail.com>
Date: Wed, 29 Jun 2016 10:28:58 +0200
Message-ID: <CAK7uLydsVp1H4n2dkN+zWzyqduw=zRLjtbmhwYhUB1BzkOc1=Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] gpsd fails to compile due to scons-generated malformed command line
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
X-List-Received-Date: Wed, 29 Jun 2016 08:28:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

FYI:

I had to patch the SConstruct file of gpsd like follows.

The first fix avoids double-quoting of the CPPFLAGS and the second
avoids calling ncurses5-config since that will end-up trying to link
the native x86-version of the ncurses library with cross-compiled
binaries.

--- a/SConstruct    2016-06-28 18:33:37.404158765 +0200
+++ b/SConstruct    2016-06-28 19:48:53.596024256 +0200
@@ -236,7 +236,7 @@
             env.Replace(**{j: os.getenv(i)})
 for flags in ["LDFLAGS", "LINKFLAGS", "SHLINKFLAGS", "CPPFLAGS"]:
     if os.environ.has_key(flags):
-        env.MergeFlags({flags : [os.getenv(flags)]})
+        env.MergeFlags({flags : [Split(os.getenv(flags))]})

 # Keep scan-build options in the environment
 for key, value in os.environ.iteritems():
@@ -455,7 +454,7 @@
     if config.CheckPKG('ncurses'):
         ncurseslibs =3D pkg_config('ncurses')
     elif config.CheckExecutable('ncurses5-config --version',
'ncurses5-config'):
-        ncurseslibs =3D ['!ncurses5-config --libs --cflags']
+        ncurseslibs =3D ['-lncurses']
     elif sys.platform.startswith('freebsd'):
         ncurseslibs=3D [ '-lncurses' ]
     elif sys.platform.startswith('openbsd'):


2016-06-15 11:47 GMT+02:00 Sch=C3=A4fer-Hutter <schaefer.hutter@gmail.com>:
> Hi there,
>
> I'm getting the following error when trying to compile gpsd:
>
> | arm-linux-gnueabihf-gcc -march=3Darmv7-a -marm -mthumb-interwork
> -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15
> --sysroot=3D/home/ashaepe/yocto/tmn2000/build/arago-tmp-external-linaro-t=
oolchain/sysroots/k2l-evm
> -o bits.os -c -isystem/opt/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-201=
30313_linux/arm-linux-gnueabihf/include
> -Wno-error=3Dunused-value -fstack-protector -O2 -pipe -g
> -feliminate-unused-debug-types -D_GNU_SOURCE
> --sysroot=3D/home/ashaepe/yocto/tmn2000/build/arago-tmp-external-linaro-t=
oolchain/sysroots/k2l-evm
> -Wextra -Wall -Wno-uninitialized -Wno-missing-field-initializers
> -Wcast-align -Wmissing-declarations -Wmissing-prototypes
> -Wstrict-prototypes -Wpointer-arith -Wreturn-type -g -O0 -fPIC "
> -isystem/opt/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/ar=
m-linux-gnueabihf/include
> -Wno-error=3Dunused-value -fstack-protector" bits.c
> | arm-linux-gnueabihf-gcc: error:
> -isystem/opt/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/ar=
m-linux-gnueabihf/include
> -Wno-error=3Dunused-value -fstack-protector: No such file or directory
> | scons: *** [bits.os] Error 1
>
> Obviously the command line part in double quotes ("
> -isystem/opt/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/ar=
m-linux-gnueabihf/include
> -Wno-error=3Dunused-value -fstack-protector") is wrongly placed/repeated
> by SCons.
>
> But I'm lost finding a reason for this behaviour? Any hint would be
> appreciated greatly...
>
> Regards,
>   Peter

