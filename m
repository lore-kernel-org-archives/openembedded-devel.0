Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E166FF885A
	for <webhook@archiver.kernel.org>; Sat, 25 Apr 2026 01:33:45 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3826.1777080817486851686
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2026 18:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QSMxECQw;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65492d097acso2087444d50.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 18:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777080816; cv=none;
        d=google.com; s=arc-20240605;
        b=JCsT5p2n9lrdzgyfYjjSciE1XWJizmEQpgD7QA6zI8AeT0ZjGl+X/FzMJLkavl/VJO
         JHkyXtOohuTYHx/pixmwBWDUjJXCXc33DdoZ/4sjPebhhEOhABidnm1qGiUxYYkmIaWd
         8BJ9LUZuiFxU8O71Z/E5EROa0XbFSdtl8BMoEznxdiLLJdqRUrKOeIpa+ZapIv+ZMRIZ
         0sFBImbseRu4SbG13MlrTIkV/RJ6VOjD6GbH53sLtOlIwpPMu7Z/NyK8Kv7w6JsMcy1q
         8FUhLfnKefi2y++wxlJRnc+WDeF+M9hU8Dv73SuwbjereYgoC8rD1DwYVfZdfcARJwEF
         bpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nFIDtMl3oZmmGlMKYbjxo48cHNSiAaFq7Ol+8QI+Ofc=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=T+DsoYsf8Kjuj9j2O4BtoXoKf9Ze39lzWlknKWmPJwr3CLvt1ItOQ3tty/+TztDYmP
         3HURbh3Z5Tz57NvS4WJQgZWBDGaRSZYmT+BU7swjdPvSX4TSn3q92+T5Xp0SQFjfvPRl
         +JAbIDAru7LWdI6922bA6Rt/GevsFK0iKaJbYzo8UmdMVfq6z4XYEBZYaYRHr85qNALt
         gwJGTytcROvc6NtB1De8GY4LSnSmPh8UWHPAS+0Ht8fh4Q3WX1z5CAucCMldrZUXjGyG
         sCjaXzpOXDCAk2NxWR6HECH8ot3iJRV67bOWpo+u8Hw41Af5W0wLYR2jJbciTh4grfaw
         fEuQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777080816; x=1777685616; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nFIDtMl3oZmmGlMKYbjxo48cHNSiAaFq7Ol+8QI+Ofc=;
        b=QSMxECQwIfoz6mHm3mIfHbHIr9h44ayUD5iX+RwKFLHPtEC+747C9h6xj8v8eltx5e
         TYRLlTQt6mvhIgfsvrNFYEPqufF+07ANs1IrmT7uBo5jo4r9sUyCeOblCbIvggXwpmx/
         vjwQjDz47xTKpTYjRHH19Ceh7f/l0dUI7DMg9j/4aoXmZw3xVjA5GG6cXuGQlZIESdu3
         7sGZpaUT4xzekfjMJGa982ooLwGuTDzCPSZPFhrirRU6HfJ+Tu6tBt7klt0o6cdP8zi0
         UCwIJ6DoAu72a9eZS/R/rmNvrLcdWj2i7HK6xmLVGqHbxDunpTiHMWDlPEcSeCCgpzYX
         bgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777080816; x=1777685616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFIDtMl3oZmmGlMKYbjxo48cHNSiAaFq7Ol+8QI+Ofc=;
        b=Eb9zDrxEXTGsWU512kp1IAUBpkN2zX3AykOelcoEgONWAiRVLJUjwGJMzO9CNXj89Y
         UchWJLu1vKo78ARIPrZpAkyp2mE141POiR786FjLw0tEMcArxtaURqlwBZVQjPaxYOOl
         oxSHPWzn8mS9/VSWjOc15L6zOUXabNjntqjBaIPmxhMmG/8RZFsbmV3qWjOyO8l12uaz
         SY5nnbFUjHoipCTyOYK1Dv3vtCXwsbMJYV/g6bihaU0cobo1zaxOOoaWpnvNjxbCo+b9
         j91ue4dyhLW6JbnCkMGDPa9twQrvsVvyw7HGDo6kCRZYrzNNIz8gJkiAzQIVeF/TJRj3
         f2Ow==
X-Gm-Message-State: AOJu0YxIG/mOIw8oY3l1FEZ3oHvIkGwe5wdJOSCXv2cIPZC/Y8oX/k7l
	OrH4xgIISFoSgIZmU/Nm3M4t1K8uyXtR1oVYVQvVFZAtfTqKGFqsN22cZvzkCE4EbbCdEtA0X0U
	hGd3xcJePmB9iyMYBpFRONAjtZihrTw8=
X-Gm-Gg: AeBDietUlHGl/zmaH2paKLYzNFQZBQdjay4Hu2nfvWGzF4wNC/Cl27QauShrudNeoRQ
	NizhlzeOAIXjayuY/PDht0ECdVlsLtK6LlxhaOpV8Z0IAeBHZyGcd+awHZJ0CxpciqDWtuL9Vpl
	AuDLfksd6W1Nvdme5ju1OfO0g1Z7WwCjmt78MB503NsuQCPuFJ/3WTnoEqDjBM4TZvxIglf7Ftl
	/G49uK+Hsl7loGg3SrytezVy6+S/j5Yk++WBHWUnVMhxLeVV2cU9wKw82IrBEzfq6uandbPXLzi
	PG2bpE+2P7USJMjcd1JE0plHzonOkuY4j9FWQ2P+JroXX8zzI10AxWAyChViQSLtU7ImEkZsnnm
	vyleseGSXk8KooEb0aioSbsBqLbKWRU0pYPPkQcZ/3sPD7cwt/zsYqZBMAcJ+CUVL5pRdO9NyBI
	j0KIjaHm/EV8d3KZ0=
X-Received: by 2002:a05:690e:d43:b0:651:c41c:80d1 with SMTP id
 956f58d0204a3-653108380dbmr26057674d50.15.1777080816358; Fri, 24 Apr 2026
 18:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260424064603.728430-1-skandigraun@gmail.com>
In-Reply-To: <20260424064603.728430-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Apr 2026 18:33:09 -0700
X-Gm-Features: AQROBzC0vWWI1BhEPkE0fZAyRnred5CMU09KrFqC1iE6Yv5wqvMiEpbT4FfvA8Y
Message-ID: <CAMKF1sp4hCeyML8MMaOne2t2p_1+oKH37mvJUjF4M-soB2U_6A@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] mbedtls: add recipe for v4.1.0
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cbd8d806503ede67"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2026 01:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126609

--000000000000cbd8d806503ede67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

here is next error

| *** stack smashing detected ***: terminated
| qemu: uncaught target signal 6 (Aborted) - core dumped
| Aborted
| Traceback (most recent call last):
|   File
"/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-li=
nux/mbedtls/4.1.0/sources/mbedtls-4.1.0/tf-psa-crypto/framework/scripts/gen=
erate_psa_tests.py",
line 870, in <module>
|     test_data_generation.main(sys.argv[1:], __doc__, PSATestGenerator)
|     ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Detailed error log

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/6511632/raw_inlin=
e

On Thu, Apr 23, 2026 at 11:46=E2=80=AFPM Gyorgy Sarvari via lists.openembed=
ded.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> This is the current LTS version for mbedtls, add it next to the existing
> recipe
> for v3.6. This new version will be supported longer than v3.6, but there
> are
> some incompatibilities between the two (see migration guide[1] and
> changelog[2]).
>
> This recipe is based on the v3.6 recipe. psa PACKAGECONFIG was dropped, a=
s
> it is
> now the regular behavior, without an option to turn it off.
> update-alternatives
> class is also removed - it was required due to a sample program called
> "hello",
> which has been removed from this release.
>
> Added two small patches:
> - one to handle the CC env var correctly from Python. This is submitted
> for upstream.
> - one to use qemu to run cross-compiled binaries instead of running them
> as they are.
>   This is not upstreamed, as it is OE specific.
>
> Ptests passed successfully:
>
> root@qemux86-64:~# ptest-runner
> START: ptest-runner
> 2026-04-23T07:29
> BEGIN: /usr/lib/mbedtls/ptest
> PASS: test_suite_config.mbedtls_boolean
> PASS: test_suite_config.tls_combinations
> PASS: test_suite_constant_time_hmac
> PASS: test_suite_debug
> PASS: test_suite_error
> PASS: test_suite_mps
> PASS: test_suite_net
> PASS: test_suite_pkcs7
> PASS: test_suite_ssl
> PASS: test_suite_ssl.records
> PASS: test_suite_ssl.tls-defrag
> PASS: test_suite_ssl_decrypt.misc
> PASS: test_suite_test_helpers
> PASS: test_suite_timing
> PASS: test_suite_version
> PASS: test_suite_x509_oid
> PASS: test_suite_x509parse
> PASS: test_suite_x509write
> DURATION: 7
> END: /usr/lib/mbedtls/ptest
> 2026-04-23T07:29
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> [1]:
> https://github.com/Mbed-TLS/mbedtls/blob/development/docs/4.0-migration-g=
uide.md
> [2]: https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-4.1.0
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>
> v2: Inherit python3native, because some native python modules need to be
> used. When using the
>     system python, PYTHONPATH gets mixed with build host and sysroot
> modules, which is incorrect.
>     When using python3native class, the module search path is confined to
> the sysroot, so it
>     can be better controlled. Also, add python3-jsonschema-native as a
> build dependency (in v1
>     the recipe took this dependency from my build host)
>
>  ...c_build_helper-Split-cc-command-line.patch | 33 +++++++
>  ...wrapper-to-run-cross-compiled-binary.patch | 29 ++++++
>  .../mbedtls/mbedtls_4.1.0.bb                  | 88 +++++++++++++++++++
>  3 files changed, 150 insertions(+)
>  create mode 100644
> meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_build_helper-=
Split-cc-command-line.patch
>  create mode 100644
> meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-qemuwrapper=
-to-run-cross-compiled-binary.patch
>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/
> mbedtls_4.1.0.bb
>
> diff --git
> a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_build_helpe=
r-Split-cc-command-line.patch
> b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_build_helpe=
r-Split-cc-command-line.patch
> new file mode 100644
> index 0000000000..adddb7ad8e
> --- /dev/null
> +++
> b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_build_helpe=
r-Split-cc-command-line.patch
> @@ -0,0 +1,33 @@
> +From 178e089683bf42097ac6d27522820d07483bc6bd Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Thu, 23 Apr 2026 08:54:02 +0200
> +Subject: [PATCH] c_build_helper: Split cc command line
> +
> +Optionally the CC/HOSTCC environment variable can hold the command to
> +invoke the C compiler, however this command can also contain extra
> +arguments, not only the binary name. In this particular case Python
> +was treating the whole value as a single binary name, and was trying
> +to execute as such (e.g. "cc -arg1 -arg2" instead of "cc" and the
> arguments
> +separately), which results in failure.
> +
> +Split the compiler command into its components to invoke it correctly.
> +
> +Upstream-Status: Submitted [
> https://github.com/Mbed-TLS/mbedtls-framework/pull/301]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + scripts/mbedtls_framework/c_build_helper.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/scripts/mbedtls_framework/c_build_helper.py
> b/scripts/mbedtls_framework/c_build_helper.py
> +index 59bb326e2..85dbb628f 100644
> +--- a/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.p=
y
> ++++ b/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.p=
y
> +@@ -98,7 +98,7 @@ def compile_c_file(c_filename, exe_filename,
> include_dirs):
> +     cc =3D os.getenv('HOSTCC', None)
> +     if cc is None:
> +         cc =3D os.getenv('CC', 'cc')
> +-    cmd =3D [cc]
> ++    cmd =3D cc.split()
> +
> +     proc =3D subprocess.Popen(cmd,
> +                             stdout=3Dsubprocess.DEVNULL,
> diff --git
> a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-qemuwrapp=
er-to-run-cross-compiled-binary.patch
> b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-qemuwrapp=
er-to-run-cross-compiled-binary.patch
> new file mode 100644
> index 0000000000..a9e8bb2ed9
> --- /dev/null
> +++
> b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-qemuwrapp=
er-to-run-cross-compiled-binary.patch
> @@ -0,0 +1,29 @@
> +From 46f0ea3eb35e8d0d33e88298a9e7c3dbdd49ec17 Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Thu, 23 Apr 2026 09:14:40 +0200
> +Subject: [PATCH] use qemuwrapper to run cross-compiled binary
> +
> +The build process executes a compiled binary to get some details,
> +however this results in a failure in case of cross-compiling.
> +
> +Run it with qemuwrapper, that is created in the recipe.
> +
> +Upstream-Status: Inappropriate [cross-compile specific]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + scripts/mbedtls_framework/c_build_helper.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/scripts/mbedtls_framework/c_build_helper.py
> b/scripts/mbedtls_framework/c_build_helper.py
> +index 59bb326e2..5c4c211ee 100644
> +--- a/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.p=
y
> ++++ b/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.p=
y
> +@@ -169,7 +169,7 @@ def get_c_expression_values(
> +                              .format(caller, c_name))
> +         else:
> +             os.remove(c_name)
> +-        output =3D subprocess.check_output([exe_name])
> ++        output =3D subprocess.check_output(['../../../qemuwrapper',
> exe_name])
> +         return output.decode('ascii').strip().split('\n')
> +     finally:
> +         remove_file_if_exists(exe_name)
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.b=
b
> b/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb
> new file mode 100644
> index 0000000000..614016b0f1
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb
> @@ -0,0 +1,88 @@
> +SUMMARY =3D "Lightweight crypto and SSL/TLS library"
> +DESCRIPTION =3D "mbedtls is a lean open source crypto library          \
> +for providing SSL and TLS support in your programs. It offers        \
> +an intuitive API and documented header files, so you can actually    \
> +understand what the code does. It features:                          \
> +                                                                     \
> + - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
> +   Camellia and XTEA                                                 \
> + - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
> + - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
> + - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
> +   ECDSA and ECDH                                                    \
> + - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
> + - Abstraction layers for ciphers, hashes, public key operations,    \
> +   platform abstraction and threading                                \
> +"
> +
> +HOMEPAGE =3D "https://www.trustedfirmware.org/projects/mbed-tls/"
> +BUGTRACKER =3D "https://github.com/Mbed-TLS/mbedtls/issues"
> +
> +LICENSE =3D "Apache-2.0 | GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D379d5819937a6c2f1ef1630d341e0=
26d"
> +
> +SECTION =3D "libs"
> +
> +SRC_URI =3D "gitsm://
> github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;branch=3Dmbedtls-4.1;tag=
=3Dv${PV}
> <http://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;branch=3Dmbedtls=
-4.1;tag=3Dv$%7BPV%7D>
> \
> +           file://run-ptest \
> +           file://0001-c_build_helper-Split-cc-command-line.patch \
> +           "
> +
> +SRC_URI:append:class-target =3D "
> file://0001-use-qemuwrapper-to-run-cross-compiled-binary.patch"
> +
> +SRCREV =3D "0fe989b6b514192783c469039edd325fd0989806"
> +
> +DEPENDS +=3D "python3-jinja2-native python3-jsonschema-native qemu-nativ=
e"
> +
> +UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> +
> +inherit cmake ptest python3native qemu
> +
> +PACKAGECONFIG ??=3D "shared-libs programs
> ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
> +PACKAGECONFIG[shared-libs] =3D
> "-DUSE_SHARED_MBEDTLS_LIBRARY=3DON,-DUSE_SHARED_MBEDTLS_LIBRARY=3DOFF"
> +PACKAGECONFIG[programs] =3D "-DENABLE_PROGRAMS=3DON,-DENABLE_PROGRAMS=3D=
OFF"
> +PACKAGECONFIG[werror] =3D
> "-DMBEDTLS_FATAL_WARNINGS=3DON,-DMBEDTLS_FATAL_WARNINGS=3DOFF"
> +PACKAGECONFIG[tests] =3D "-DENABLE_TESTING=3DON,-DENABLE_TESTING=3DOFF"
> +
> +PROVIDES +=3D "polarssl"
> +RPROVIDES:${PN} =3D "polarssl"
> +
> +PACKAGES =3D+ "${PN}-programs"
> +FILES:${PN}-programs =3D "${bindir}/"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +CVE_PRODUCT =3D "mbed_tls"
> +
> +do_configure:prepend() {
> +       # during building
> tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py
> +       # runs some of the cross-compiled binaries.
> +
> +       qemu_binary=3D"${@qemu_wrapper_cmdline(d,
> d.getVar('STAGING_DIR_HOST'),
> [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_LIBDIR}')])=
}"
> +       cat > ${WORKDIR}/qemuwrapper << EOF
> +#!/bin/sh
> +$qemu_binary "\$@"
> +EOF
> +
> +       chmod +x ${WORKDIR}/qemuwrapper
> +}
> +
> +# Strip host paths from autogenerated test files
> +do_compile:append() {
> +       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
> +       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
> +}
> +
> +# Export source files/headers needed by Arm Trusted Firmware
> +sysroot_stage_all:append() {
> +       sysroot_stage_dir "${S}/library"
> "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library"
> +       sysroot_stage_dir "${S}/include"
> "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include"
> +}
> +
> +do_install_ptest () {
> +       install -d ${D}${PTEST_PATH}/tests
> +       install -d ${D}${PTEST_PATH}/framework
> +       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
> +       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
> +       cp -fR ${S}/framework/data_files ${D}${PTEST_PATH}/framework/
> +}
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126602):
> https://lists.openembedded.org/g/openembedded-devel/message/126602
> Mute This Topic: https://lists.openembedded.org/mt/118983952/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cbd8d806503ede67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">here is next error<div><br></div><div>| *** stack smashing=
 detected ***: terminated<br>| qemu: uncaught target signal 6 (Aborted) - c=
ore dumped<br>| Aborted<br>| Traceback (most recent call last):<br>| =C2=A0=
 File &quot;/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64=
-v3-poky-linux/mbedtls/4.1.0/sources/mbedtls-4.1.0/tf-psa-crypto/framework/=
scripts/generate_psa_tests.py&quot;, line 870, in &lt;module&gt;<br>| =C2=
=A0 =C2=A0 test_data_generation.main(sys.argv[1:], __doc__, PSATestGenerato=
r)<br>| =C2=A0 =C2=A0 ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^</div><div><br></div><div>Detailed error log</div><div><br></d=
iv><div><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/log=
s/6511632/raw_inline">https://autobuilder.yoctoproject.org/valkyrie/api/v2/=
logs/6511632/raw_inline</a></div></div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 23, 2026=
 at 11:46=E2=80=AFPM Gyorgy Sarvari via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail=
.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is the cu=
rrent LTS version for mbedtls, add it next to the existing recipe<br>
for v3.6. This new version will be supported longer than v3.6, but there ar=
e<br>
some incompatibilities between the two (see migration guide[1] and changelo=
g[2]).<br>
<br>
This recipe is based on the v3.6 recipe. psa PACKAGECONFIG was dropped, as =
it is<br>
now the regular behavior, without an option to turn it off. update-alternat=
ives<br>
class is also removed - it was required due to a sample program called &quo=
t;hello&quot;,<br>
which has been removed from this release.<br>
<br>
Added two small patches:<br>
- one to handle the CC env var correctly from Python. This is submitted for=
 upstream.<br>
- one to use qemu to run cross-compiled binaries instead of running them as=
 they are.<br>
=C2=A0 This is not upstreamed, as it is OE specific.<br>
<br>
Ptests passed successfully:<br>
<br>
root@qemux86-64:~# ptest-runner<br>
START: ptest-runner<br>
2026-04-23T07:29<br>
BEGIN: /usr/lib/mbedtls/ptest<br>
PASS: test_suite_config.mbedtls_boolean<br>
PASS: test_suite_config.tls_combinations<br>
PASS: test_suite_constant_time_hmac<br>
PASS: test_suite_debug<br>
PASS: test_suite_error<br>
PASS: test_suite_mps<br>
PASS: test_suite_net<br>
PASS: test_suite_pkcs7<br>
PASS: test_suite_ssl<br>
PASS: test_suite_ssl.records<br>
PASS: test_suite_ssl.tls-defrag<br>
PASS: test_suite_ssl_decrypt.misc<br>
PASS: test_suite_test_helpers<br>
PASS: test_suite_timing<br>
PASS: test_suite_version<br>
PASS: test_suite_x509_oid<br>
PASS: test_suite_x509parse<br>
PASS: test_suite_x509write<br>
DURATION: 7<br>
END: /usr/lib/mbedtls/ptest<br>
2026-04-23T07:29<br>
STOP: ptest-runner<br>
TOTAL: 1 FAIL: 0<br>
<br>
[1]: <a href=3D"https://github.com/Mbed-TLS/mbedtls/blob/development/docs/4=
.0-migration-guide.md" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/Mbed-TLS/mbedtls/blob/development/docs/4.0-migration-guide.md</a><br>
[2]: <a href=3D"https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-4.=
1.0" rel=3D"noreferrer" target=3D"_blank">https://github.com/Mbed-TLS/mbedt=
ls/releases/tag/mbedtls-4.1.0</a><br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
<br>
v2: Inherit python3native, because some native python modules need to be us=
ed. When using the<br>
=C2=A0 =C2=A0 system python, PYTHONPATH gets mixed with build host and sysr=
oot modules, which is incorrect.<br>
=C2=A0 =C2=A0 When using python3native class, the module search path is con=
fined to the sysroot, so it<br>
=C2=A0 =C2=A0 can be better controlled. Also, add python3-jsonschema-native=
 as a build dependency (in v1<br>
=C2=A0 =C2=A0 the recipe took this dependency from my build host)<br>
<br>
=C2=A0...c_build_helper-Split-cc-command-line.patch | 33 +++++++<br>
=C2=A0...wrapper-to-run-cross-compiled-binary.patch | 29 ++++++<br>
=C2=A0.../mbedtls/<a href=3D"http://mbedtls_4.1.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mbedtls_4.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 88 +++++++++++++++++++<br>
=C2=A03 files changed, 150 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedt=
ls/0001-c_build_helper-Split-cc-command-line.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedt=
ls/0001-use-qemuwrapper-to-run-cross-compiled-binary.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/mbedtls/<a hr=
ef=3D"http://mbedtls_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls=
_4.1.0.bb</a><br>
<br>
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_bu=
ild_helper-Split-cc-command-line.patch b/meta-networking/recipes-connectivi=
ty/mbedtls/mbedtls/0001-c_build_helper-Split-cc-command-line.patch<br>
new file mode 100644<br>
index 0000000000..adddb7ad8e<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_build_hel=
per-Split-cc-command-line.patch<br>
@@ -0,0 +1,33 @@<br>
+From 178e089683bf42097ac6d27522820d07483bc6bd Mon Sep 17 00:00:00 2001<br>
+From: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" target=
=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+Date: Thu, 23 Apr 2026 08:54:02 +0200<br>
+Subject: [PATCH] c_build_helper: Split cc command line<br>
+<br>
+Optionally the CC/HOSTCC environment variable can hold the command to<br>
+invoke the C compiler, however this command can also contain extra<br>
+arguments, not only the binary name. In this particular case Python<br>
+was treating the whole value as a single binary name, and was trying<br>
+to execute as such (e.g. &quot;cc -arg1 -arg2&quot; instead of &quot;cc&qu=
ot; and the arguments<br>
+separately), which results in failure.<br>
+<br>
+Split the compiler command into its components to invoke it correctly.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/Mbed-TLS/mbedtls=
-framework/pull/301" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/Mbed-TLS/mbedtls-framework/pull/301</a>]<br>
+Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+---<br>
+ scripts/mbedtls_framework/c_build_helper.py | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/scripts/mbedtls_framework/c_build_helper.py b/scripts/mbedtls=
_framework/c_build_helper.py<br>
+index 59bb326e2..85dbb628f 100644<br>
+--- a/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py<=
br>
++++ b/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py<=
br>
+@@ -98,7 +98,7 @@ def compile_c_file(c_filename, exe_filename, include_dir=
s):<br>
+=C2=A0 =C2=A0 =C2=A0cc =3D os.getenv(&#39;HOSTCC&#39;, None)<br>
+=C2=A0 =C2=A0 =C2=A0if cc is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc =3D os.getenv(&#39;CC&#39;, &#39;cc&#=
39;)<br>
+-=C2=A0 =C2=A0 cmd =3D [cc]<br>
++=C2=A0 =C2=A0 cmd =3D cc.split()<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0proc =3D subprocess.Popen(cmd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout=3Dsubprocess.DEVNULL,<br>
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-=
qemuwrapper-to-run-cross-compiled-binary.patch b/meta-networking/recipes-co=
nnectivity/mbedtls/mbedtls/0001-use-qemuwrapper-to-run-cross-compiled-binar=
y.patch<br>
new file mode 100644<br>
index 0000000000..a9e8bb2ed9<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-qemuwra=
pper-to-run-cross-compiled-binary.patch<br>
@@ -0,0 +1,29 @@<br>
+From 46f0ea3eb35e8d0d33e88298a9e7c3dbdd49ec17 Mon Sep 17 00:00:00 2001<br>
+From: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" target=
=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+Date: Thu, 23 Apr 2026 09:14:40 +0200<br>
+Subject: [PATCH] use qemuwrapper to run cross-compiled binary<br>
+<br>
+The build process executes a compiled binary to get some details,<br>
+however this results in a failure in case of cross-compiling.<br>
+<br>
+Run it with qemuwrapper, that is created in the recipe.<br>
+<br>
+Upstream-Status: Inappropriate [cross-compile specific]<br>
+Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+---<br>
+ scripts/mbedtls_framework/c_build_helper.py | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/scripts/mbedtls_framework/c_build_helper.py b/scripts/mbedtls=
_framework/c_build_helper.py<br>
+index 59bb326e2..5c4c211ee 100644<br>
+--- a/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py<=
br>
++++ b/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py<=
br>
+@@ -169,7 +169,7 @@ def get_c_expression_values(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .format(caller, c_name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.remove(c_name)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D subprocess.check_output([exe_name]=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D subprocess.check_output([&#39;../.=
./../qemuwrapper&#39;, exe_name])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return output.decode(&#39;ascii&#39;).st=
rip().split(&#39;\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0finally:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remove_file_if_exists(exe_name)<br>
diff --git a/meta-networking/recipes-connectivity/mbedtls/<a href=3D"http:/=
/mbedtls_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_4.1.0.bb</a=
> b/meta-networking/recipes-connectivity/mbedtls/<a href=3D"http://mbedtls_=
4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_4.1.0.bb</a><br>
new file mode 100644<br>
index 0000000000..614016b0f1<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/mbedtls/<a href=3D"http://mbedtl=
s_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_4.1.0.bb</a><br>
@@ -0,0 +1,88 @@<br>
+SUMMARY =3D &quot;Lightweight crypto and SSL/TLS library&quot;<br>
+DESCRIPTION =3D &quot;mbedtls is a lean open source crypto library=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+for providing SSL and TLS support in your programs. It offers=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 \<br>
+an intuitive API and documented header files, so you can actually=C2=A0 =
=C2=A0 \<br>
+understand what the code does. It features:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+ - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,=C2=A0 =
\<br>
+=C2=A0 =C2=A0Camellia and XTEA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+ - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+ - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG=C2=A0 =
=C2=A0\<br>
+ - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \<br>
+=C2=A0 =C2=A0ECDSA and ECDH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+ - SSL v3 and TLS 1.0, 1.1 and 1.2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
+ - Abstraction layers for ciphers, hashes, public key operations,=C2=A0 =
=C2=A0 \<br>
+=C2=A0 =C2=A0platform abstraction and threading=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
+&quot;<br>
+<br>
+HOMEPAGE =3D &quot;<a href=3D"https://www.trustedfirmware.org/projects/mbe=
d-tls/" rel=3D"noreferrer" target=3D"_blank">https://www.trustedfirmware.or=
g/projects/mbed-tls/</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/Mbed-TLS/mbedtls/issues=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/Mbed-TLS/mbedtls/=
issues</a>&quot;<br>
+<br>
+LICENSE =3D &quot;Apache-2.0 | GPL-2.0-or-later&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D379d5819937a6c2f1ef1630d34=
1e026d&quot;<br>
+<br>
+SECTION =3D &quot;libs&quot;<br>
+<br>
+SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/Mbed-TLS/mbedtls.gi=
t;protocol=3Dhttps;branch=3Dmbedtls-4.1;tag=3Dv$%7BPV%7D" rel=3D"noreferrer=
" target=3D"_blank">github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;branch=
=3Dmbedtls-4.1;tag=3Dv${PV}</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-c_build_helper-Split-=
cc-command-line.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+SRC_URI:append:class-target =3D &quot; file://0001-use-qemuwrapper-to-run-=
cross-compiled-binary.patch&quot;<br>
+<br>
+SRCREV =3D &quot;0fe989b6b514192783c469039edd325fd0989806&quot;<br>
+<br>
+DEPENDS +=3D &quot;python3-jinja2-native python3-jsonschema-native qemu-na=
tive&quot;<br>
+<br>
+UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)&quot;<br=
>
+<br>
+inherit cmake ptest python3native qemu<br>
+<br>
+PACKAGECONFIG ??=3D &quot;shared-libs programs ${@bb.utils.contains(&#39;P=
TEST_ENABLED&#39;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)}&quot;<br>
+PACKAGECONFIG[shared-libs] =3D &quot;-DUSE_SHARED_MBEDTLS_LIBRARY=3DON,-DU=
SE_SHARED_MBEDTLS_LIBRARY=3DOFF&quot;<br>
+PACKAGECONFIG[programs] =3D &quot;-DENABLE_PROGRAMS=3DON,-DENABLE_PROGRAMS=
=3DOFF&quot;<br>
+PACKAGECONFIG[werror] =3D &quot;-DMBEDTLS_FATAL_WARNINGS=3DON,-DMBEDTLS_FA=
TAL_WARNINGS=3DOFF&quot;<br>
+PACKAGECONFIG[tests] =3D &quot;-DENABLE_TESTING=3DON,-DENABLE_TESTING=3DOF=
F&quot;<br>
+<br>
+PROVIDES +=3D &quot;polarssl&quot;<br>
+RPROVIDES:${PN} =3D &quot;polarssl&quot;<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-programs&quot;<br>
+FILES:${PN}-programs =3D &quot;${bindir}/&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+CVE_PRODUCT =3D &quot;mbed_tls&quot;<br>
+<br>
+do_configure:prepend() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# during building tf-psa-crypto/framework/scrip=
ts/mbedtls_framework/c_build_helper.py<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# runs some of the cross-compiled binaries.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_binary=3D&quot;${@qemu_wrapper_cmdline(d, =
d.getVar(&#39;STAGING_DIR_HOST&#39;), [d.expand(&#39;${STAGING_DIR_HOST}${l=
ibdir}&#39;),d.expand(&#39;${STAGING_LIBDIR}&#39;)])}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cat &gt; ${WORKDIR}/qemuwrapper &lt;&lt; EOF<br=
>
+#!/bin/sh<br>
+$qemu_binary &quot;\$@&quot;<br>
+EOF<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod +x ${WORKDIR}/qemuwrapper<br>
+}<br>
+<br>
+# Strip host paths from autogenerated test files<br>
+do_compile:append() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s+${S}/++g&#39; ${B}/tests/*.c 2&gt=
;/dev/null || :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s+${B}/++g&#39; ${B}/tests/*.c 2&gt=
;/dev/null || :<br>
+}<br>
+<br>
+# Export source files/headers needed by Arm Trusted Firmware<br>
+sysroot_stage_all:append() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sysroot_stage_dir &quot;${S}/library&quot; &quo=
t;${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sysroot_stage_dir &quot;${S}/include&quot; &quo=
t;${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include&quot;<br>
+}<br>
+<br>
+do_install_ptest () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/framework<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}=
/tests/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${PTEST_PATH}/tests/ -type f -name &qu=
ot;*.c&quot; -delete<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -fR ${S}/framework/data_files ${D}${PTEST_PA=
TH}/framework/<br>
+}<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126602): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126602" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126602</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118983952/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118983952/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cbd8d806503ede67--

