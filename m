Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.10728.1597373913935757498
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 19:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WTRGglvW;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id t6so3732375qvw.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 19:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VsxBf7LhpRDxhJ29GSAp6N/ycha2/QxPwCedEqiXtQQ=;
        b=WTRGglvW9i2w09kKm8y9u1Ch2uYmA2BRU+d/C7uW3wouSvDam2mkZ/xmyeLQIs6Hza
         xvyIzUjZFfPPeYICKNT8lr9ZslXM8/CtsXNwbjCl4qvJlbA+NVwGOfqZHW8gRVz/zTXb
         E+V0LFXjBN0egC6t5efF8tEOTD4H349PBdF2EOHJxcqvVcYcjOfH/2GBdQ1c5iATvYd6
         KY27BuTWrA8Mb31oMFghpzomMSSPKp0xJvTwx3kvVlU6mk48kFhzlhNOb+KNo7evakhC
         hZC3LFy6Rx1lNRY31Kg1ZJ3wYrADq/3kG24Pp9Wb1VCOGD9sQECwA16pCbboT81eWuDK
         u2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VsxBf7LhpRDxhJ29GSAp6N/ycha2/QxPwCedEqiXtQQ=;
        b=kYm8jnU3eH9F1/Jvqx0CAsp5RJOtpf+GIs99JgOLPG2DHJMUX+4uF+U8BRIVKugTkq
         XBXdIuomnpxmUaUMto1mru/AFSKO+Z90AruzkDLU7aemU5xNYyPPiWXrAeIVsD3ONT4d
         w+fhqm347hmyKi59fbRQD8Z/v1OqFwXtwVc123WZq+Zl1xrWp476nJbALtl0giX760Kp
         6mYcueDulkNilfeWz/3iow/djfn/g+Bq+HNvZmO9xId3EPaoY+ZND8AS3SJRwaxpPwkx
         a4cSxprO5vcADr2R5kG4aGG49PcR8eOHsQLYiNFLKXXYO25z1TgUf9v1dbaVpc4rxxaQ
         eHjw==
X-Gm-Message-State: AOAM531fA0mbs6Nvwfz0DZMvi3ejbx5iOBIwP5VBErT8bcGBbb26gUZh
	klnaZ7y4xXSaTYdOuR49ndC8Cd0hmoZ4T+xh4cQ=
X-Google-Smtp-Source: ABdhPJyzaTpNFBzujsnISVKlZL3SDZKijJaOP2aRFQxGl08n7vpbNwdczpqHyajAw/UpDajRudhFkW3XYh6EQdYqkp4=
X-Received: by 2002:a0c:fbd1:: with SMTP id n17mr919583qvp.4.1597373912910;
 Thu, 13 Aug 2020 19:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200813155006.13934-1-sno@netbsd.org>
In-Reply-To: <20200813155006.13934-1-sno@netbsd.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 13 Aug 2020 19:58:07 -0700
Message-ID: <CAMKF1srvHMBigd7UbCtjbF4QG+GhnPr_x0BWEwfaJZruunsO9A@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] bearssl: add new recipe
To: Jens Rehsack <sno@netbsd.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fails with

| /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-l=
inux/bearssl/0.6-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../l=
ibexec/x86_64-poky-linux/gcc/x86_64-poky-linux/10.1.0/ld:
build/obj/rsa_i62_pub.o: warning: relocation against
`br_rsa_i62_public' in read-only section `.text'
| /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-l=
inux/bearssl/0.6-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../l=
ibexec/x86_64-poky-linux/gcc/x86_64-poky-linux/10.1.0/ld:
build/obj/ec_prime_i15.o: relocation R_X86_64_PC32 against symbol
`br_secp521r1' can not be used when making a shared object; recompile
with -fPIC
| /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-l=
inux/bearssl/0.6-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../l=
ibexec/x86_64-poky-linux/gcc/x86_64-poky-linux/10.1.0/ld:
final link failed: bad value
| collect2: error: ld returned 1 exit status
| make: *** [mk/Rules.mk:347: build/libbearssl.so] Error 1


see https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/507

On Thu, Aug 13, 2020 at 8:50 AM Jens Rehsack <sno@netbsd.org> wrote:
>
> Add recipe for BearSSL - an an implementation of the SSL/TLS protocol wit=
h
> the approach of:
> * Be correct and secure.
> * Be small
> * Be highly portable
> * Be feature-rich and extensible
>
> See https://bearssl.org for more details.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  ....mk-remove-fixed-command-definitions.patch | 57 +++++++++++++++++++
>  ..._x509.c-fix-potential-overflow-issue.patch | 41 +++++++++++++
>  .../bearssl/bearssl_0.6.bb                    | 31 ++++++++++
>  3 files changed, 129 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/bearssl/bearssl/=
0001-conf-Unix.mk-remove-fixed-command-definitions.patch
>  create mode 100644 meta-networking/recipes-connectivity/bearssl/bearssl/=
0002-test-test_x509.c-fix-potential-overflow-issue.patch
>  create mode 100644 meta-networking/recipes-connectivity/bearssl/bearssl_=
0.6.bb
>
> diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl/0001-co=
nf-Unix.mk-remove-fixed-command-definitions.patch b/meta-networking/recipes=
-connectivity/bearssl/bearssl/0001-conf-Unix.mk-remove-fixed-command-defini=
tions.patch
> new file mode 100644
> index 000000000..00be22499
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/bearssl/bearssl/0001-conf-Unix=
.mk-remove-fixed-command-definitions.patch
> @@ -0,0 +1,57 @@
> +From 4ba61c59d3488c263d106d486b656854a57ad79f Mon Sep 17 00:00:00 2001
> +From: Jens Rehsack <sno@netbsd.org>
> +Date: Thu, 13 Aug 2020 15:26:30 +0200
> +Subject: [PATCH 1/2] conf/Unix.mk: remove fixed command definitions
> +
> +For cross compiling in Yocto or with appropriate SDKs, commands like
> +`$CC` are reasonably predefined.
> +
> +Upstream-Status: Inappropriate
> +
> +Signed-off-by: Jens Rehsack <sno@netbsd.org>
> +---
> + conf/Unix.mk | 10 +++-------
> + 1 file changed, 3 insertions(+), 7 deletions(-)
> +
> +diff --git a/conf/Unix.mk b/conf/Unix.mk
> +index 02f2b2b..05979fc 100644
> +--- a/conf/Unix.mk
> ++++ b/conf/Unix.mk
> +@@ -37,23 +37,19 @@ RM =3D rm -f
> + MKDIR =3D mkdir -p
> +
> + # C compiler and flags.
> +-CC =3D cc
> +-CFLAGS =3D -W -Wall -Os -fPIC
> + CCOUT =3D -c -o
> +
> + # Static library building tool.
> +-AR =3D ar
> + ARFLAGS =3D -rcs
> + AROUT =3D
> +
> + # DLL building tool.
> +-LDDLL =3D cc
> ++LDDLL =3D $(CCLD)
> + LDDLLFLAGS =3D -shared
> + LDDLLOUT =3D -o
> +
> + # Static linker.
> +-LD =3D cc
> +-LDFLAGS =3D
> ++LD =3D $(CCLD)
> + LDOUT =3D -o
> +
> + # C# compiler; we assume usage of Mono.
> +@@ -63,7 +59,7 @@ RUNT0COMP =3D mono T0Comp.exe
> + # Set the values to 'no' to disable building of the corresponding eleme=
nt
> + # by default. Building can still be invoked with an explicit target cal=
l
> + # (e.g. 'make dll' to force build the DLL).
> +-#STATICLIB =3D no
> ++STATICLIB =3D no
> + #DLL =3D no
> + #TOOLS =3D no
> + #TESTS =3D no
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl/0002-te=
st-test_x509.c-fix-potential-overflow-issue.patch b/meta-networking/recipes=
-connectivity/bearssl/bearssl/0002-test-test_x509.c-fix-potential-overflow-=
issue.patch
> new file mode 100644
> index 000000000..94abd27fa
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/bearssl/bearssl/0002-test-test=
_x509.c-fix-potential-overflow-issue.patch
> @@ -0,0 +1,41 @@
> +From 542380a13f178d97851751b57054a6b5be555d1c Mon Sep 17 00:00:00 2001
> +From: Jens Rehsack <sno@netbsd.org>
> +Date: Thu, 13 Aug 2020 16:16:44 +0200
> +Subject: [PATCH 2/2] test/test_x509.c: fix potential overflow issue
> +
> +Instead of doing a memcpy() which does static overflow checking, use
> +snprintf() for string copying which does the check dynamically.
> +
> +Fixes:
> +| In file included from .../recipe-sysroot/usr/include/string.h:519,
> +|                  from test/test_x509.c:27:
> +| In function 'memcpy',
> +|     inlined from 'parse_keyvalue' at test/test_x509.c:845:2,
> +|     inlined from 'process_conf_file' at test/test_x509.c:1360:7,
> +|     inlined from 'main' at test/test_x509.c:2038:2:
> +| .../recipe-sysroot/usr/include/bits/string_fortified.h:34:10: warning:=
 '__builtin_memcpy' specified bound 4294967295 exceeds maximum object size =
2147483647 [-Wstringop-overflow=3D]
> +|    34 |   return __builtin___memcpy_chk (__dest, __src, __len, __bos0 =
(__dest));
> +|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
> +
> +Signed-off-by: Jens Rehsack <sno@netbsd.org>
> +---
> + test/test_x509.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/test/test_x509.c b/test/test_x509.c
> +index 2c61cf5..76f6ab9 100644
> +--- a/test/test_x509.c
> ++++ b/test/test_x509.c
> +@@ -842,8 +842,7 @@ parse_keyvalue(HT *d)
> +               return -1;
> +       }
> +       name =3D xmalloc(u + 1);
> +-      memcpy(name, buf, u);
> +-      name[u] =3D 0;
> ++      snprintf(name, u, "%s", buf);
> +       if (HT_get(d, name) !=3D NULL) {
> +               xfree(name);
> +               return -1;
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb =
b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> new file mode 100644
> index 000000000..7bd0e549d
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> @@ -0,0 +1,31 @@
> +SUMMARY =3D "BearSSL is an implementation of the SSL/TLS protocol (RFC 5=
246) written in C"
> +DESCRIPTION =3D "BearSSL is an implementation of the SSL/TLS protocol (R=
FC \
> +5246) written in C. It aims at offering the following features: \
> +  * Be correct and secure. In particular, insecure protocol versions and=
 \
> +    choices of algorithms are not supported, by design; cryptographic \
> +    algorithm implementations are constant-time by default. \
> +  * Be small, both in RAM and code footprint. For instance, a minimal \
> +    server implementation may fit in about 20 kilobytes of compiled code=
 \
> +    and 25 kilobytes of RAM. \
> +  * Be highly portable. BearSSL targets not only =E2=80=9Cbig=E2=80=9D o=
perating systems \
> +    like Linux and Windows, but also small embedded systems and even spe=
cial \
> +    contexts like bootstrap code. \
> +  * Be feature-rich and extensible. SSL/TLS has many defined cipher suit=
es \
> +    and extensions; BearSSL should implement most of them, and allow ext=
ra \
> +    algorithm implementations to be added afterwards, possibly from thir=
d \
> +    parties."
> +HOMEPAGE =3D "https://bearssl.org"
> +
> +SECTION =3D "libs"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D1fc37e1037ae673975fbcb96a=
98f7191"
> +
> +SRCREV =3D "8ef7680081c61b486622f2d983c0d3d21e83caad"
> +SRC_URI =3D "git://www.bearssl.org/git/BearSSL;protocol=3Dhttps;nobranch=
=3D1 \
> +          file://0001-conf-Unix.mk-remove-fixed-command-definitions.patc=
h \
> +          file://0002-test-test_x509.c-fix-potential-overflow-issue.patc=
h \
> +          "
> +
> +S =3D "${WORKDIR}/git"
> +B =3D "${S}"
> --
> 2.17.1
>
