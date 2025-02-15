Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08295C021A0
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 04:25:48 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.3553.1739593545050317572
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 20:25:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XCwTzDHl;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-726fd9257f7so1434573a34.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 20:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739593544; x=1740198344; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZADNND/Nb4LjY9vAk7idUg3iBEmhyS4HVtEt7FeuocY=;
        b=XCwTzDHlgkKTI+RTOrTwyiVwZOzTdASb9kh/MrRm7q3oK28P2sugZ64837KB+40Z8Q
         /flPs5rY11vBQJ6gjmJCEV7xbssVbPz3O9a05YrbdHCBtxszkIwlpdRQD4ci4CQDyqfK
         PfMk1ufBG9OKj5e726p8LavIITYBGOnUuD+Xo0SCRTBUzhNJay/a3CpPgZKMMCL7Xqqy
         coRamRO+jkI9Xun5Ut70Vh79UFX0jMUm8rVRdM7h/ElIrgOtns4fSL1gPa1xHfUzCcWP
         20pKXPqlqka7jj3TspZbk6gPCRne1WU0utMjmC8K8nC7Rys7xe4ziMJ+xUlIlKju6vBD
         gRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739593544; x=1740198344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZADNND/Nb4LjY9vAk7idUg3iBEmhyS4HVtEt7FeuocY=;
        b=ZXi86nbaS1XmdD5qi9srnSwbaONDkhgZ5D+JccVywUqK1e+I9rDjxHR77tM02H9SgY
         K0RnTVmjbtkWTijanPd5AhBawP/qjsDQbkS+ChAJEGIQxnOVpoCOGMMl4H2WG3HhB719
         qkCPceI1LFYIuL6YESRjwYTLSCw4T5rIfJHNgu/Sdt36gyajuJnsqDktwOZGDUM7PreN
         eXALiDaplD+GU6aVixJLRehNRncyWo6nWpXfdMRWI6OwOiaRC4W67GvLC2SymzHX0I7E
         gvmODX+Px3KnSDQtSPBeYaDSECln+MlOqBXR5u9pGEPaw1Gsq+yHt27auez8Sw0hx/O0
         jXcw==
X-Gm-Message-State: AOJu0Yw0GEsqf+FMXhmkL13YSIKQA7zPWCIrXEBsjuAMwomHEFMctJPA
	aY1wgviV9ZOUrOrJ95Wpz7rm73SSM8u5dWTzBjlYO37A6yaQMLl4ucTWNEEYhX+QEf5Z0lm4lcC
	qwNfJYc8kfVKfHGZLMUM6SmPwcG0KV007voM=
X-Gm-Gg: ASbGnctacP0iYKP836kwHy4Osk33fP9mq8faYWFGMMYHPx7chPISVkQVpRC6CqhJEME
	zYl8Eujeh/oYUkcWb4n+AS+CC2//myeeXGJdXNk6G8mWmMIWCIz91mFMjgpfsIhrs7FC6b74=
X-Google-Smtp-Source: AGHT+IFot128Z5b3I4Cm2r/sdYlOlHZYr4w2J+AIxt76mqAC02DaIy8694ikhj5HbJK1FuEKKU8F4fWGorRtRkE9Uak=
X-Received: by 2002:a05:6830:6f47:b0:727:f9a:8ae6 with SMTP id
 46e09a7af769-72712036666mr1130699a34.5.1739593544064; Fri, 14 Feb 2025
 20:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20250214085152.1273827-1-ravi@prevas.dk>
In-Reply-To: <20250214085152.1273827-1-ravi@prevas.dk>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Feb 2025 20:25:18 -0800
X-Gm-Features: AWEUYZnFBdNUlyF4FXiZRoyPxspm05dvytVdFkq8d9H7bpjQMqeISqN1wYQDFhM
Message-ID: <CAMKF1sqpSNU4qOkmxDjh_pkPSvfQtPZP-QxOdQ8_i-ho+DijtQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] systemd-netlogd: new recipe
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Feb 2025 04:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115492

it fails on musl

| FAILED: systemd-netlogd.p/src_netlog_netlog-network.c.o
   | x86_64-yoe-linux-musl-clang -target x86_64-yoe-linux-musl -m64
-march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -mlittle-endian
--dyld-prefix=3D/usr -Qunused-arguments -fstack-protector-
   =E2=86=AA strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security
-Werror=3Dformat-security
--sysroot=3D/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux-musl/systemd=
-netlogd/1.4.4/recipe-sysroot
-
   =E2=86=AA Isystemd-netlogd.p -I. -I../git -I../git/src/share
-I../git/src/netlog -Isrc -fdiagnostics-color=3Dalways
-D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11
-Werror=3Dundef -
   =E2=86=AA Werror=3Dformat=3D2 -Wformat-security -Wformat-nonliteral
-Wmissing-include-dirs -Werror=3Dold-style-definition
-Werror=3Dpointer-arith -Winit-self -Wdeclaration-after-statement
-Wfloat-equal -
   =E2=86=AA Werror=3Dmissing-prototypes -Werror=3Dimplicit-function-declar=
ation
-Werror=3Dmissing-declarations -Werror=3Dreturn-type
-Werror=3Dincompatible-pointer-types -Werror=3Dshadow -Wstrict-prototypes
-
   =E2=86=AA Wredundant-decls -Wmissing-noreturn -Wendif-labels
-Wstrict-aliasing=3D2 -Wwrite-strings -Wno-unused-parameter
-Wno-missing-field-initializers -Wno-unused-result -Werror=3Doverflow
-Werror=3D
   =E2=86=AA sign-compare -Wdate-time -Wnested-externs -ffast-math -fno-com=
mon
-fdiagnostics-show-option -fno-strict-aliasing -fvisibility=3Dhidden
-fstack-protector -fstack-protector-strong -fPIE --
   =E2=86=AA param=3Dssp-buffer-size=3D4 -include config.h -O2 -g
-fmacro-prefix-map=3D/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux-mus=
l/systemd-netlogd/1.4.4/git=3D/usr/src/debug/systemd-netlogd/1.4.4
   =E2=86=AA -fdebug-prefix-map=3D/home/kraj01/yoe/build/tmp/work/core2-64-=
yoe-linux-musl/systemd-netlogd/1.4.4/git=3D/usr/src/debug/systemd-netlogd/1=
.4.4
-fmacro-prefix-map=3D/home/kraj01/yoe/build/tmp/
   =E2=86=AA work/core2-64-yoe-linux-musl/systemd-netlogd/1.4.4/build=3D/us=
r/src/debug/systemd-netlogd/1.4.4
-fdebug-prefix-map=3D/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux-mus=
l/systemd-netlogd/1.
   =E2=86=AA 4.4/build=3D/usr/src/debug/systemd-netlogd/1.4.4
-fdebug-prefix-map=3D/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux-mus=
l/systemd-netlogd/1.4.4/recipe-sysroot=3D
-fmacro-prefix-map=3D/home/
   =E2=86=AA kraj01/yoe/build/tmp/work/core2-64-yoe-linux-musl/systemd-netl=
ogd/1.4.4/recipe-sysroot=3D
-fdebug-prefix-map=3D/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux-mus=
l/systemd-netlogd/1.4.4/
   =E2=86=AA recipe-sysroot-native=3D
-fmacro-prefix-map=3D/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux-mus=
l/systemd-netlogd/1.4.4/recipe-sysroot-native=3D
-pipe -MD -MQ systemd-netlogd.p/
   =E2=86=AA src_netlog_netlog-network.c.o -MF
systemd-netlogd.p/src_netlog_netlog-network.c.o.d -o
systemd-netlogd.p/src_netlog_netlog-network.c.o -c
../git/src/netlog/netlog-network.c
   | In file included from ../git/src/netlog/netlog-network.c:11:
   | In file included from ../git/src/netlog/netlog-manager.h:7:
   | In file included from ../git/src/netlog/netlog-dtls.h:7:
   | In file included from ../git/src/share/socket-util.h:16:
   | ../git/src/share/util.h:65:70: error: unknown type name 'comparison_fn=
_t'
   |    65 | static inline void qsort_safe(void *base, size_t nmemb,
size_t size, comparison_fn_t compar) {
   |       |
           ^
   | 1 error generated.

On Fri, Feb 14, 2025 at 12:52=E2=80=AFAM Rasmus Villemoes <ravi@prevas.dk> =
wrote:
>
> From: Rasmus Villemoes <ravi@prevas.dk>
>
> In some deployments, the log aggregator collects log messages in the
> syslog format, so systemd-journal-upload and friends can not be
> used.
>
> systemd-netlogd is a daemon for filling that gap.
>
> Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
> ---
> v2: add systemd as required distro feature
> v3: also inherit the features_check class to make that have effect
>
>  .../systemd-netlogd/systemd-netlogd_1.4.4.bb  | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-oe/recipes-support/systemd-netlogd/systemd-netlo=
gd_1.4.4.bb
>
> diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.=
4.bb b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
> new file mode 100644
> index 0000000000..f95cfdb418
> --- /dev/null
> +++ b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "Forwards messages from the journal to other hosts over the =
network using the Syslog Protocol"
> +
> +LICENSE =3D "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079=
008b364516c"
> +
> +SRC_URI =3D "git://github.com/systemd/systemd-netlogd.git;protocol=3Dhtt=
ps;branch=3Dmain"
> +SRCREV =3D "b03cc3b1a75048c7cf19467d8918a4b7320767e6"
> +
> +inherit meson systemd pkgconfig useradd features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "systemd"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS +=3D "systemd"
> +DEPENDS +=3D "openssl"
> +DEPENDS +=3D "gperf-native"
> +DEPENDS +=3D "python3-sphinx-native"
> +
> +# systemd-netlogd uses prefix and sysconfdir in a weird way.
> +EXTRA_OEMESON +=3D "--prefix ${libdir}/systemd --sysconfdir ${sysconfdir=
}/systemd"
> +
> +FILES:${PN} +=3D "${libdir}"
> +
> +USERADD_PACKAGES =3D "${PN}"
> +GROUPADD_PARAM:${PN} =3D "-r systemd-journal"
> +USERADD_PARAM:${PN} =3D "--system -d / -M --shell /sbin/nologin -g syste=
md-journal systemd-journal-netlog"
> --
> 2.48.1
>

