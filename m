Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28ECEFF885E
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 09:09:46 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39284.1777280981545896338
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2026 02:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BDTtZUAi;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38ccde812ecso97768411fa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 02:09:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777280979; cv=none;
        d=google.com; s=arc-20240605;
        b=EmuJ0jQ1DwT2lJuLNVfVoJUt6dy5rxkS/E9IzX+pmWeSCJsB4Iv1LzBZUh0xz9eAcw
         9l6I+o+5QF3CtmkrHOecH4PyrpTRfUn2Cg9TozE0krXaVlcITiaVuWULW1NB+7mUOnVG
         H42Kx1CzHVXgnH881hMR1knPUC3qBCMr3na+ItZnW+Wq/ogO9qjY0YwurE012uXnUePD
         UrDvV8qjx4SxVGo4chWjYYeaPrLBwMrYndXd+dpUvJTSr9S4w/7HHC9oKR+jXTspPP2b
         0mn5feAxsJhpUb3X29pvTiqUCS/9weHoPEW8pyHx7dnAI3qboUyykXQK3DWYFCCWA/FY
         sheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F9QDSYk2Wtpx35EAt+6wDuxRljG/gUIUgnJAjUR8Wvw=;
        fh=SUGY7yLZqIQ/c91I9tXXWNSvr5MpgyR2fxnkq+e2GEo=;
        b=Nu3Kpqj/ggE+E7noDdHoUWjsHj9tOrfeKfr7U+Wxl6GiBGrIvJ4uEhsrIOxMRE2tHu
         Nn24J+AqY5wvRqOs/4Oih+bHaiPeaYLtxFpn937fl+e8pYPGSfFHEJ5GRrZav0DZEPcN
         BquLO3g4Q1PNj1195odLY2/Mq5jMFcK5Gpjkq1ZsShsYCOx3crakJd7fJWOJuhLdAo9r
         2duxdUg7oT4q43XjMnZCaaLZ+43nJFMNgZ0AInrl6OxefUAzX0+hE8696jNZR/3YRs3z
         1q4q/gkOMgPKORnV/56d5QnbcjXd8zyRBl3QB3ckgMEG7WCReGsJ5K/aB2asjpzmfhFJ
         /mZQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777280979; x=1777885779; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9QDSYk2Wtpx35EAt+6wDuxRljG/gUIUgnJAjUR8Wvw=;
        b=BDTtZUAireYPyJ3nlsYYadaWYlbUdg+/RgujLtaG0crompk9YKUA38lWYk55XcMGNY
         ZO/3SmUlpB3IuWm50z4tS+qLEFtIvMDjLho+gWMR22+KKjpzRSgp8gF3oM1DTdNEsTRw
         gzyjwYxZSF6Eg5MQmyQ2xCv3uxOv81RvzKlZRNrMkGkBAl3Aa9bOA2d2hkmygn9V+Jnn
         aJalx1Sr/QuwXtP2PrSOQBUAwplm1t7d4GZTkw+LDJq5dJANLAPWtQK3hCrt+RcqWPgq
         xFtsOxNfzq5HaZPOXQpExFZCwSDlCZ1Jr5bImQLE3akR6epGCfF84I6gdXsI3BLUCodV
         6FhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777280979; x=1777885779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F9QDSYk2Wtpx35EAt+6wDuxRljG/gUIUgnJAjUR8Wvw=;
        b=SB+zBiJz25bE2m92ZeBOX7u+uH4XtqioK6L0OFVWckdGMM8+s88E98zTgx7mpjfRBF
         b5NlJ79jS3tq1GBAhkRH/5In3rMmMwlh6CgVfb/JYBIomCq+qC8oXhE9KVGx9wipQSd9
         YxGuRmVFctNJh91fUtj0oxzx1+Qj+xqEKJQ+a8avv89Pdb4y6DdQfIyVkKqP+yBm41Us
         7v2rBdAoe2Wvl0ZwKp948XICpJxR+r/ys+K4xGl5NxyoiQm7c10lRm/j3SvzzScVmR6b
         ZfFK98NFZaPUfFsN6iWgyTYcn2hp/3cnscXJV21gkO/2gNcPqds1Oq8yZl5EDcn1Wf5f
         RJhg==
X-Forwarded-Encrypted: i=1; AFNElJ82UuIhWcBURZ8xrs4795wpFTP7BsQkDF4L3pGxK+ss3PC8kCwrymCMxJhjNAStaVZjH7HZomjrewmzIlRgpBHy1jw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwG2rFYvY67qpHTW1LQUqiA9K0hMHEpK3CXA5atsVbOWvZnvfrB
	nJtOGksI/8DkgyJf4GCQAAhsMuxIoHOWgnWjNGLzco5nBfG7gQ16FTeEeo4+oUO2jMuIdb4PQS6
	eUkIjMP8YbGOi06fN4q5IBUwwS8dZrcs=
X-Gm-Gg: AeBDievTznyzyglUHX5uFi9irrDfrI/6UIM5kvzPp1H/Gy02gu6hY/8U6YwHOylJxXO
	/lGemppPYz4iQOmLByTr+VsHY6hxID0zGWL68LfHSjOW4e96h+zXIx2Xu5YAztRA7/ZXGDKeEx8
	RU4QlRcbJFhWWTOXcws2a0X6jDTU6+vZQp1NS1LFWVE+iOba8IBM3tgG4rRV6uD9b0zVNwbcpgS
	VsFKRfvleNK09duxAv3RpTa/QbocI6Gcn5gtCL4y0F+zUUiyyZwLNdJ7WsUQvo3AGq2sBaFvslF
	nbw8+KOCfESj1+I/
X-Received: by 2002:a2e:a006:0:b0:38e:8558:5d0b with SMTP id
 38308e7fff4ca-38ec8fb24c4mr77554511fa.1.1777280979094; Mon, 27 Apr 2026
 02:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260424064603.728430-1-skandigraun@gmail.com>
 <CAMKF1sp4hCeyML8MMaOne2t2p_1+oKH37mvJUjF4M-soB2U_6A@mail.gmail.com>
 <CAMKF1so9vPsqk7eTi_ypsr-TiTJSeZFNPgri1KvvKzaT+yinug@mail.gmail.com> <18A9E5089EA766DA.2188217@lists.openembedded.org>
In-Reply-To: <18A9E5089EA766DA.2188217@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 27 Apr 2026 10:09:27 +0100
X-Gm-Features: AVHnY4JUfsq2NuxH07JsOyfaFT34HmTTMNVjdg4qRfeUBJ09hqID8PNOsnkwyvc
Message-ID: <CAO5Uq5TarogKhyRTSZeYaZmSPPhJb0k2bKCJhSG3hev-Wf9m-g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] mbedtls: add recipe for v4.1.0
To: alex.kiernan@gmail.com
Cc: raj.khem@gmail.com, skandigraun@gmail.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 09:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126637

On Sun, Apr 26, 2026 at 12:35=E2=80=AFPM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Just dropping mbedtls/ecp.h looks like it might be sufficient for mdns
> (untested because of the mbedtls build failure around qemuwrapper):
>
> diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
> index 6726ef9b9145..c2e47ba232a5 100644
> --- a/mDNSPosix/mbedtls.c
> +++ b/mDNSPosix/mbedtls.c
> @@ -31,7 +31,6 @@
>
>  #include <mbedtls/error.h>
>  #include <mbedtls/pk.h>
> -#include <mbedtls/ecp.h>
>  #include <mbedtls/ecdsa.h>
>  #include <mbedtls/entropy.h>
>  #include <mbedtls/ctr_drbg.h>
>

Scratch that... the changes needed are much more than simple header removal=
.

>
> On Sat, Apr 25, 2026 at 2:35=E2=80=AFAM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > and knock on effects perhaps see.
> >
> > https://errors.yoctoproject.org/Errors/Build/237188/
> >
> > On Fri, Apr 24, 2026 at 6:33=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> >>
> >> here is next error
> >>
> >> | *** stack smashing detected ***: terminated
> >> | qemu: uncaught target signal 6 (Aborted) - core dumped
> >> | Aborted
> >> | Traceback (most recent call last):
> >> |   File "/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86=
-64-v3-poky-linux/mbedtls/4.1.0/sources/mbedtls-4.1.0/tf-psa-crypto/framewo=
rk/scripts/generate_psa_tests.py", line 870, in <module>
> >> |     test_data_generation.main(sys.argv[1:], __doc__, PSATestGenerato=
r)
> >> |     ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^
> >>
> >> Detailed error log
> >>
> >> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/6511632/raw_=
inline
> >>
> >> On Thu, Apr 23, 2026 at 11:46=E2=80=AFPM Gyorgy Sarvari via lists.open=
embedded.org <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
> >>>
> >>> This is the current LTS version for mbedtls, add it next to the exist=
ing recipe
> >>> for v3.6. This new version will be supported longer than v3.6, but th=
ere are
> >>> some incompatibilities between the two (see migration guide[1] and ch=
angelog[2]).
> >>>
> >>> This recipe is based on the v3.6 recipe. psa PACKAGECONFIG was droppe=
d, as it is
> >>> now the regular behavior, without an option to turn it off. update-al=
ternatives
> >>> class is also removed - it was required due to a sample program calle=
d "hello",
> >>> which has been removed from this release.
> >>>
> >>> Added two small patches:
> >>> - one to handle the CC env var correctly from Python. This is submitt=
ed for upstream.
> >>> - one to use qemu to run cross-compiled binaries instead of running t=
hem as they are.
> >>>   This is not upstreamed, as it is OE specific.
> >>>
> >>> Ptests passed successfully:
> >>>
> >>> root@qemux86-64:~# ptest-runner
> >>> START: ptest-runner
> >>> 2026-04-23T07:29
> >>> BEGIN: /usr/lib/mbedtls/ptest
> >>> PASS: test_suite_config.mbedtls_boolean
> >>> PASS: test_suite_config.tls_combinations
> >>> PASS: test_suite_constant_time_hmac
> >>> PASS: test_suite_debug
> >>> PASS: test_suite_error
> >>> PASS: test_suite_mps
> >>> PASS: test_suite_net
> >>> PASS: test_suite_pkcs7
> >>> PASS: test_suite_ssl
> >>> PASS: test_suite_ssl.records
> >>> PASS: test_suite_ssl.tls-defrag
> >>> PASS: test_suite_ssl_decrypt.misc
> >>> PASS: test_suite_test_helpers
> >>> PASS: test_suite_timing
> >>> PASS: test_suite_version
> >>> PASS: test_suite_x509_oid
> >>> PASS: test_suite_x509parse
> >>> PASS: test_suite_x509write
> >>> DURATION: 7
> >>> END: /usr/lib/mbedtls/ptest
> >>> 2026-04-23T07:29
> >>> STOP: ptest-runner
> >>> TOTAL: 1 FAIL: 0
> >>>
> >>> [1]: https://github.com/Mbed-TLS/mbedtls/blob/development/docs/4.0-mi=
gration-guide.md
> >>> [2]: https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-4.1.0
> >>>
> >>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >>> ---
> >>>
> >>> v2: Inherit python3native, because some native python modules need to=
 be used. When using the
> >>>     system python, PYTHONPATH gets mixed with build host and sysroot =
modules, which is incorrect.
> >>>     When using python3native class, the module search path is confine=
d to the sysroot, so it
> >>>     can be better controlled. Also, add python3-jsonschema-native as =
a build dependency (in v1
> >>>     the recipe took this dependency from my build host)
> >>>
> >>>  ...c_build_helper-Split-cc-command-line.patch | 33 +++++++
> >>>  ...wrapper-to-run-cross-compiled-binary.patch | 29 ++++++
> >>>  .../mbedtls/mbedtls_4.1.0.bb                  | 88 +++++++++++++++++=
++
> >>>  3 files changed, 150 insertions(+)
> >>>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbed=
tls/0001-c_build_helper-Split-cc-command-line.patch
> >>>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbed=
tls/0001-use-qemuwrapper-to-run-cross-compiled-binary.patch
> >>>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbed=
tls_4.1.0.bb
> >>>
> >>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/000=
1-c_build_helper-Split-cc-command-line.patch b/meta-networking/recipes-conn=
ectivity/mbedtls/mbedtls/0001-c_build_helper-Split-cc-command-line.patch
> >>> new file mode 100644
> >>> index 0000000000..adddb7ad8e
> >>> --- /dev/null
> >>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_bui=
ld_helper-Split-cc-command-line.patch
> >>> @@ -0,0 +1,33 @@
> >>> +From 178e089683bf42097ac6d27522820d07483bc6bd Mon Sep 17 00:00:00 20=
01
> >>> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> >>> +Date: Thu, 23 Apr 2026 08:54:02 +0200
> >>> +Subject: [PATCH] c_build_helper: Split cc command line
> >>> +
> >>> +Optionally the CC/HOSTCC environment variable can hold the command t=
o
> >>> +invoke the C compiler, however this command can also contain extra
> >>> +arguments, not only the binary name. In this particular case Python
> >>> +was treating the whole value as a single binary name, and was trying
> >>> +to execute as such (e.g. "cc -arg1 -arg2" instead of "cc" and the ar=
guments
> >>> +separately), which results in failure.
> >>> +
> >>> +Split the compiler command into its components to invoke it correctl=
y.
> >>> +
> >>> +Upstream-Status: Submitted [https://github.com/Mbed-TLS/mbedtls-fram=
ework/pull/301]
> >>> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >>> +---
> >>> + scripts/mbedtls_framework/c_build_helper.py | 2 +-
> >>> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/scripts/mbedtls_framework/c_build_helper.py b/scripts/m=
bedtls_framework/c_build_helper.py
> >>> +index 59bb326e2..85dbb628f 100644
> >>> +--- a/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_help=
er.py
> >>> ++++ b/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_help=
er.py
> >>> +@@ -98,7 +98,7 @@ def compile_c_file(c_filename, exe_filename, inclu=
de_dirs):
> >>> +     cc =3D os.getenv('HOSTCC', None)
> >>> +     if cc is None:
> >>> +         cc =3D os.getenv('CC', 'cc')
> >>> +-    cmd =3D [cc]
> >>> ++    cmd =3D cc.split()
> >>> +
> >>> +     proc =3D subprocess.Popen(cmd,
> >>> +                             stdout=3Dsubprocess.DEVNULL,
> >>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/000=
1-use-qemuwrapper-to-run-cross-compiled-binary.patch b/meta-networking/reci=
pes-connectivity/mbedtls/mbedtls/0001-use-qemuwrapper-to-run-cross-compiled=
-binary.patch
> >>> new file mode 100644
> >>> index 0000000000..a9e8bb2ed9
> >>> --- /dev/null
> >>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-q=
emuwrapper-to-run-cross-compiled-binary.patch
> >>> @@ -0,0 +1,29 @@
> >>> +From 46f0ea3eb35e8d0d33e88298a9e7c3dbdd49ec17 Mon Sep 17 00:00:00 20=
01
> >>> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> >>> +Date: Thu, 23 Apr 2026 09:14:40 +0200
> >>> +Subject: [PATCH] use qemuwrapper to run cross-compiled binary
> >>> +
> >>> +The build process executes a compiled binary to get some details,
> >>> +however this results in a failure in case of cross-compiling.
> >>> +
> >>> +Run it with qemuwrapper, that is created in the recipe.
> >>> +
> >>> +Upstream-Status: Inappropriate [cross-compile specific]
> >>> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >>> +---
> >>> + scripts/mbedtls_framework/c_build_helper.py | 2 +-
> >>> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/scripts/mbedtls_framework/c_build_helper.py b/scripts/m=
bedtls_framework/c_build_helper.py
> >>> +index 59bb326e2..5c4c211ee 100644
> >>> +--- a/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_help=
er.py
> >>> ++++ b/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_help=
er.py
> >>> +@@ -169,7 +169,7 @@ def get_c_expression_values(
> >>> +                              .format(caller, c_name))
> >>> +         else:
> >>> +             os.remove(c_name)
> >>> +-        output =3D subprocess.check_output([exe_name])
> >>> ++        output =3D subprocess.check_output(['../../../qemuwrapper',=
 exe_name])
> >>> +         return output.decode('ascii').strip().split('\n')
> >>> +     finally:
> >>> +         remove_file_if_exists(exe_name)
> >>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1=
.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb
> >>> new file mode 100644
> >>> index 0000000000..614016b0f1
> >>> --- /dev/null
> >>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb
> >>> @@ -0,0 +1,88 @@
> >>> +SUMMARY =3D "Lightweight crypto and SSL/TLS library"
> >>> +DESCRIPTION =3D "mbedtls is a lean open source crypto library       =
   \
> >>> +for providing SSL and TLS support in your programs. It offers       =
 \
> >>> +an intuitive API and documented header files, so you can actually   =
 \
> >>> +understand what the code does. It features:                         =
 \
> >>> +                                                                    =
 \
> >>> + - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4, =
 \
> >>> +   Camellia and XTEA                                                =
 \
> >>> + - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5           =
 \
> >>> + - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG  =
 \
> >>> + - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman,=
 \
> >>> +   ECDSA and ECDH                                                   =
 \
> >>> + - SSL v3 and TLS 1.0, 1.1 and 1.2                                  =
 \
> >>> + - Abstraction layers for ciphers, hashes, public key operations,   =
 \
> >>> +   platform abstraction and threading                               =
 \
> >>> +"
> >>> +
> >>> +HOMEPAGE =3D "https://www.trustedfirmware.org/projects/mbed-tls/"
> >>> +BUGTRACKER =3D "https://github.com/Mbed-TLS/mbedtls/issues"
> >>> +
> >>> +LICENSE =3D "Apache-2.0 | GPL-2.0-or-later"
> >>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D379d5819937a6c2f1ef1630d3=
41e026d"
> >>> +
> >>> +SECTION =3D "libs"
> >>> +
> >>> +SRC_URI =3D "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttp=
s;branch=3Dmbedtls-4.1;tag=3Dv${PV} \
> >>> +           file://run-ptest \
> >>> +           file://0001-c_build_helper-Split-cc-command-line.patch \
> >>> +           "
> >>> +
> >>> +SRC_URI:append:class-target =3D " file://0001-use-qemuwrapper-to-run=
-cross-compiled-binary.patch"
> >>> +
> >>> +SRCREV =3D "0fe989b6b514192783c469039edd325fd0989806"
> >>> +
> >>> +DEPENDS +=3D "python3-jinja2-native python3-jsonschema-native qemu-n=
ative"
> >>> +
> >>> +UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> >>> +
> >>> +inherit cmake ptest python3native qemu
> >>> +
> >>> +PACKAGECONFIG ??=3D "shared-libs programs ${@bb.utils.contains('PTES=
T_ENABLED', '1', 'tests', '', d)}"
> >>> +PACKAGECONFIG[shared-libs] =3D "-DUSE_SHARED_MBEDTLS_LIBRARY=3DON,-D=
USE_SHARED_MBEDTLS_LIBRARY=3DOFF"
> >>> +PACKAGECONFIG[programs] =3D "-DENABLE_PROGRAMS=3DON,-DENABLE_PROGRAM=
S=3DOFF"
> >>> +PACKAGECONFIG[werror] =3D "-DMBEDTLS_FATAL_WARNINGS=3DON,-DMBEDTLS_F=
ATAL_WARNINGS=3DOFF"
> >>> +PACKAGECONFIG[tests] =3D "-DENABLE_TESTING=3DON,-DENABLE_TESTING=3DO=
FF"
> >>> +
> >>> +PROVIDES +=3D "polarssl"
> >>> +RPROVIDES:${PN} =3D "polarssl"
> >>> +
> >>> +PACKAGES =3D+ "${PN}-programs"
> >>> +FILES:${PN}-programs =3D "${bindir}/"
> >>> +
> >>> +BBCLASSEXTEND =3D "native nativesdk"
> >>> +
> >>> +CVE_PRODUCT =3D "mbed_tls"
> >>> +
> >>> +do_configure:prepend() {
> >>> +       # during building tf-psa-crypto/framework/scripts/mbedtls_fra=
mework/c_build_helper.py
> >>> +       # runs some of the cross-compiled binaries.
> >>> +
> >>> +       qemu_binary=3D"${@qemu_wrapper_cmdline(d, d.getVar('STAGING_D=
IR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_LI=
BDIR}')])}"
> >>> +       cat > ${WORKDIR}/qemuwrapper << EOF
> >>> +#!/bin/sh
> >>> +$qemu_binary "\$@"
> >>> +EOF
> >>> +
> >>> +       chmod +x ${WORKDIR}/qemuwrapper
> >>> +}
> >>> +
> >>> +# Strip host paths from autogenerated test files
> >>> +do_compile:append() {
> >>> +       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
> >>> +       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
> >>> +}
> >>> +
> >>> +# Export source files/headers needed by Arm Trusted Firmware
> >>> +sysroot_stage_all:append() {
> >>> +       sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/shar=
e/mbedtls-source/library"
> >>> +       sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/shar=
e/mbedtls-source/include"
> >>> +}
> >>> +
> >>> +do_install_ptest () {
> >>> +       install -d ${D}${PTEST_PATH}/tests
> >>> +       install -d ${D}${PTEST_PATH}/framework
> >>> +       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
> >>> +       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
> >>> +       cp -fR ${S}/framework/data_files ${D}${PTEST_PATH}/framework/
> >>> +}
> >>>
> >>>
> >>>
> >
> >
> >
>
>
> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126614): https://lists.openembedded.org/g/openembedde=
d-devel/message/126614
> Mute This Topic: https://lists.openembedded.org/mt/118983952/3618097
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

