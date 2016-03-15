Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1DAD16B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2016 22:52:21 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id e185so40510452vkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2016 15:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=AozZpudHT8Q0uXr/ejvTChKaGkGZ1yBPfshnBOeWQEE=;
	b=znhpzxFSbKtM+2mCpf0R3U/p3vgNsON7ZW1kx27MORVzna8P6v/sm16UR9NinBrq/A
	JrChzOFQSo9UwJvfp20YgGvn3Ttjf88dOUUpKTVruhKz7oYCjJude3k727Z1zmD15yyx
	NuCgaTLMGerdv1EW604/JyklysN3zg9E0HFAJAnfzU8zzZc3uSr/loQGsStCVmOO2nf3
	6lC9B/qfNkOyThRbyh2cRooh9ZjTDL1YtWAgh+vln+jSJSvYO+ZYoB1GKfS3iYQAyt2e
	j9B3X+uU8vr8tlHPcyUAIVp/UHiI/Sp7wRDLOS+1ngZDe9X3X6CNew7RO/V4w9dfNzpt
	Whsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=AozZpudHT8Q0uXr/ejvTChKaGkGZ1yBPfshnBOeWQEE=;
	b=EL74YuY2xz8SlOzaIx0gdoZEuy39NCPGcI7OvnpdkdvR3F3yEPTLiJ53gI0+YnrFog
	2fynTLK2Yen2DJRNsn7T5QG1dnkVUdc+IK8pp4pKdygOJe3GHof5wQ1kqw8oL1okdlsd
	3TmLR/+p/LtvMzp+dVCnp6q7JCBVPoCGSR17f1Xy6z8eDnDMIfVFVImaoYWZReG/8NZ1
	/9ivtc6x2bX6uugFK+8PcZp8TIbwN6c6sCdbJlo85cuDJPnYaEY/tYjCbLUwHyLL7Zm/
	6KWrrLeltaq/FyhR5+eoq8qPuIUOPucSDfoyA7dnSxeNKpxH/sRuT42c9Zg/kkN86tOx
	lceA==
X-Gm-Message-State: AD7BkJL+TEnEhGq6egYsToq0y/EV50TL34qEmZq3rSpfwHELmUWgK6Qdikg/mIOsimf403gyTO66GokkflHLLQ==
MIME-Version: 1.0
X-Received: by 10.31.162.82 with SMTP id l79mr715757vke.76.1458082342163; Tue,
	15 Mar 2016 15:52:22 -0700 (PDT)
Received: by 10.159.35.45 with HTTP; Tue, 15 Mar 2016 15:52:22 -0700 (PDT)
Date: Tue, 15 Mar 2016 23:52:22 +0100
Message-ID: <CALbNGRQ+Yw-Gw7OZLQyjPUtCUKaanhu4-Zs_ympD8SVu=K7FXg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Strange and annoying bug with gstreamer: 0.10
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
X-List-Received-Date: Tue, 15 Mar 2016 22:52:22 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I know I have seen it already with jethro:

In case huge parts are rebuild for some changes gstreamer_0.10 fails
to build with

| cat lex.priv_gst_parse_yy_tmp.c >> lex.priv_gst_parse_yy_tmp2.c && \
| rm lex.priv_gst_parse_yy_tmp.c && \
| mv lex.priv_gst_parse_yy_tmp2.c lex.priv_gst_parse_yy.c
| ../../arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=compile
arm-angstrom-linux-gnueabi-gcc  -march=armv7ve -mthumb
-mfpu=neon-vfpv4  -mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
-DHAVE_CONFIG_H -I. -I../../../gstreamer-0.10.36/gst/parse -I../..
-I../../../gstreamer-0.10.36 -I../.. -pthread line
/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/include/glib-2.0
-I/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/lib/glib-2.0/include
-I/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/include/libxml2
-Wall -Wdeclaration-after-statement -Wvla -Wpointer-arith
-Wmissing-declarations -Wmissing-prototypes -Wredundant-decls -Wundef
-Wwrite-strings -Wformat-nonliteral -Wformat-security
-Wold-style-definition -Winit-self -Wmissing-include-dirs -Waddress
-Waggregate-return -Wno-multichar -Wnested-externs      -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/gstreamer/0.10.36-r2/build=/usr/src/gstreamer
-fdebug-prefix-map=/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/gstreamer/0.10.36-r2/gstreamer-0.10.36=/usr/src/gstreamer
-fdebug-prefix-map=/home/superandy/tmp/oe-core-glibc/sysroots/x86_64-linux=
-fdebug-prefix-map=/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2=
 -c -o libgstparse_la-lex.priv_gst_parse_yy.lo `test -f
'lex.priv_gst_parse_yy.c' || echo
'../../../gstreamer-0.10.36/gst/parse/'`lex.priv_gst_parse_yy.c
| arm-angstrom-linux-gnueabi-libtool: compile:
arm-angstrom-linux-gnueabi-gcc -march=armv7ve -mthumb -mfpu=neon-vfpv4
-mfloat-abi=hard -mcpu=cortex-a7
--sysroot=/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
-DHAVE_CONFIG_H -I. -I../../../gstreamer-0.10.36/gst/parse -I../..
-I../../../gstreamer-0.10.36 -I../.. -pthread line
/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/include/glib-2.0
-I/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/lib/glib-2.0/include
-I/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/include/libxml2
-Wall -Wdeclaration-after-statement -Wvla -Wpointer-arith
-Wmissing-declarations -Wmissing-prototypes -Wredundant-decls -Wundef
-Wwrite-strings -Wformat-nonliteral -Wformat-security
-Wold-style-definition -Winit-self -Wmissing-include-dirs -Waddress
-Waggregate-return -Wno-multichar -Wnested-externs -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/gstreamer/0.10.36-r2/build=/usr/src/gstreamer
-fdebug-prefix-map=/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/gstreamer/0.10.36-r2/gstreamer-0.10.36=/usr/src/gstreamer
-fdebug-prefix-map=/home/superandy/tmp/oe-core-glibc/sysroots/x86_64-linux=
-fdebug-prefix-map=/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2=
-c lex.priv_gst_parse_yy.c  -fPIC -DPIC -o
.libs/libgstparse_la-lex.priv_gst_parse_yy.o
| arm-angstrom-linux-gnueabi-gcc: error: line: No such file or directory
| Makefile:585: recipe for target
'libgstparse_la-lex.priv_gst_parse_yy.lo' failed
| make[4]: *** [libgstparse_la-lex.priv_gst_parse_yy.lo] Error 1
| make[4]: Leaving directory
'/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/gstreamer/0.10.36-r2/build/gst/parse'
| Makefile:1499: recipe for target 'all-recursive' failed
| make[3]: *** [all-recursive] Error 1
| make[3]: Leaving directory
'/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/gstreamer/0.10.36-r2/build/gst'
| Makefile:842: recipe for target 'all' failed
| make[2]: *** [all] Error 2
| make[2]: Leaving directory
'/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/gstreamer/0.10.36-r2/build/gst'
| Makefile:742: recipe for target 'all-recursive' failed
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
'/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/gstreamer/0.10.36-r2/build'
| Makefile:646: recipe for target 'all' failed
| make: *** [all] Error 2
| WARNING: /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/gstreamer/0.10.36-r2/temp/run.do_compile.14948:1
exit 1 from 'exit 1'
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at
/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/gstreamer/0.10.36-r2/temp/log.do_compile.14948)

Cleaning sstate does not help - the only way out is building from
scratch. Has anybody else seen this - or better good ideas how to
solve?

Andreas

