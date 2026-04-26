Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA02FF885E
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 15:18:53 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20964.1777216729549879393
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 08:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rASeseVe;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-678e678970fso1983755a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 08:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777216728; x=1777821528; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n9IFD/erxFV0kEDN57TXEsAjLxi84xM0iWk/tDcjXXs=;
        b=rASeseVellHSVV2xo8w5JmAO/hN/ZaM/qWoILfjd+As6xRyKbQvYGI8ZINgbojnGgH
         j8Mr7Qohi9vnqJCsWkRhUULL0NxST6n+gFGbkZ2vao0zFfflCBXPF1WuXNAF2SH7DXi1
         UEt6ci2Y0TShPYQ8HCbNDUKxey2VXNjaaU/bDOK2kNp5AktAgkJ7HAqhjkhNxMmI6FE9
         yB7XdtJlNBYdIeE/K8YmeqjEjhTjbahOWXLr8oeyM5T2wDEyKDlsMkVnMcV4cMyrXwmM
         LuIPBOg9I+/vOvMSiceV6dJa3H3nBdSgsWI9KsTnVzg7DTNJ0od1/VSrGKoAXkgWjZ55
         72UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777216728; x=1777821528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9IFD/erxFV0kEDN57TXEsAjLxi84xM0iWk/tDcjXXs=;
        b=gKxEQ2u6V6rF8QmOOr2g66bt7bi9ujYOk+IDC+h3lXKHgHimT+Yu+vbSNgxVhC//LW
         750pzoR7PFFgwLdeVsZ1l3teNNhGYPIXXrpCHTUl9Ap3WslKZ0518mlptu+aXCYCJbVw
         rXF0y59kPiC1h5JxUfmFSTCH/vzSlRwQMF30S9icGYwXN7mFbbgo8rwDu2BQoJ1IxDLj
         CPAlB5+bWKeifAZJJff17Zw8yLABhWUdBsNRNIberP8nyL6mGDITMiWK0jYvC8yY34Ji
         CH1GfkyTeQmheuyggKpkQhEzfbZTe4yK6IhXW/Y8ZK6IUTElmE3753HnAPx77UbSEL4H
         jddA==
X-Gm-Message-State: AOJu0Yw3HX5+C30BhtD5RygLXVoo3qhiwqwo1b+lJ2WJZ43FmbE6+GBo
	3u8+aWAwiqCQiv9+B6byj1NCWDAAuQ+wtpJgT3L7xug8IEyWdR0gBzje
X-Gm-Gg: AeBDietn+gjFi8PQkynJlWBDJeJXRLitfTH4IYqzo2PDeotDAtJLSvWttgRiimpxv2b
	NOx4+/E5D0qNmgEOGrKzHBdNfSlHupmXVIqCw+GsEQNs99vYrBxf9Xzy24APkJtB9fbcEjRIqVD
	EjUuty9KglxlP4iXPbHNZAGVEquxz8e12Mq+P+P3lmmx/wkvtiUFfQz0FXn6ka9ezeqjtISRruz
	5W6B0QS9YdRgeLEV6uIWb1WjMK3yA07p5uIxvw6lT26D3fwsSf1fk2UnZa+ceZIi8tVNfglWXSx
	pKTJe/OShkrDGYzwoc5QXUOwro15nVEy+TqyVNdpzItfmixlg3CBPRZFr1k7uzrlphQ4g3faIur
	k0GNPgkopQhj8oYc+Qu4ydJfYy8F+uyaOaJhfjWZhVVi+Y/R6wIkIh41cIHf4arzcIJ8FYQpwto
	kU2xkH8SJTFisAEaSscArAfDqfU09HzfOVFBPMF/hdBQ==
X-Received: by 2002:a05:6402:e9c:b0:672:523f:1bf4 with SMTP id 4fb4d7f45d1cf-672bfd999d1mr15611821a12.10.1777216727581;
        Sun, 26 Apr 2026 08:18:47 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d508e7sm5990415a12.20.2026.04.26.08.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 08:18:46 -0700 (PDT)
Message-ID: <962fd041-c7cb-4a9d-8f1a-e616e8f044da@gmail.com>
Date: Sun, 26 Apr 2026 17:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH v2] mbedtls: add recipe for v4.1.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, alex.kiernan@gmail.com
References: <20260424064603.728430-1-skandigraun@gmail.com>
 <CAMKF1sp4hCeyML8MMaOne2t2p_1+oKH37mvJUjF4M-soB2U_6A@mail.gmail.com>
 <CAMKF1so9vPsqk7eTi_ypsr-TiTJSeZFNPgri1KvvKzaT+yinug@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1so9vPsqk7eTi_ypsr-TiTJSeZFNPgri1KvvKzaT+yinug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 15:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126627



On 4/25/26 03:35, Khem Raj wrote:
> and knock on effects perhaps see.
> 
> https://errors.yoctoproject.org/Errors/Build/237188/ <https://
> errors.yoctoproject.org/Errors/Build/237188/>
> 
> On Fri, Apr 24, 2026 at 6:33 PM Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     here is next error
> 
>     | *** stack smashing detected ***: terminated


Ugh, this seems to happen when sysvinit is set as the init system
(usually I just use nodistro, that currently defaults to systemd, which
is why I haven't seen this. But poky distro is sysvinit).

Will try to stare at it soonish.


>     | qemu: uncaught target signal 6 (Aborted) - core dumped
>     | Aborted
>     | Traceback (most recent call last):
>     |   File "/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/
>     x86-64-v3-poky-linux/mbedtls/4.1.0/sources/mbedtls-4.1.0/tf-psa-
>     crypto/framework/scripts/generate_psa_tests.py", line 870, in <module>
>     |     test_data_generation.main(sys.argv[1:], __doc__, PSATestGenerator)
>     |     ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>     Detailed error log
> 
>     https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/6511632/
>     raw_inline <https://autobuilder.yoctoproject.org/valkyrie/api/v2/
>     logs/6511632/raw_inline>
> 
>     On Thu, Apr 23, 2026 at 11:46 PM Gyorgy Sarvari via
>     lists.openembedded.org <http://lists.openembedded.org>
>     <skandigraun=gmail.com@lists.openembedded.org
>     <mailto:gmail.com@lists.openembedded.org>> wrote:
> 
>         This is the current LTS version for mbedtls, add it next to the
>         existing recipe
>         for v3.6. This new version will be supported longer than v3.6,
>         but there are
>         some incompatibilities between the two (see migration guide[1]
>         and changelog[2]).
> 
>         This recipe is based on the v3.6 recipe. psa PACKAGECONFIG was
>         dropped, as it is
>         now the regular behavior, without an option to turn it off.
>         update-alternatives
>         class is also removed - it was required due to a sample program
>         called "hello",
>         which has been removed from this release.
> 
>         Added two small patches:
>         - one to handle the CC env var correctly from Python. This is
>         submitted for upstream.
>         - one to use qemu to run cross-compiled binaries instead of
>         running them as they are.
>           This is not upstreamed, as it is OE specific.
> 
>         Ptests passed successfully:
> 
>         root@qemux86-64:~# ptest-runner
>         START: ptest-runner
>         2026-04-23T07:29
>         BEGIN: /usr/lib/mbedtls/ptest
>         PASS: test_suite_config.mbedtls_boolean
>         PASS: test_suite_config.tls_combinations
>         PASS: test_suite_constant_time_hmac
>         PASS: test_suite_debug
>         PASS: test_suite_error
>         PASS: test_suite_mps
>         PASS: test_suite_net
>         PASS: test_suite_pkcs7
>         PASS: test_suite_ssl
>         PASS: test_suite_ssl.records
>         PASS: test_suite_ssl.tls-defrag
>         PASS: test_suite_ssl_decrypt.misc
>         PASS: test_suite_test_helpers
>         PASS: test_suite_timing
>         PASS: test_suite_version
>         PASS: test_suite_x509_oid
>         PASS: test_suite_x509parse
>         PASS: test_suite_x509write
>         DURATION: 7
>         END: /usr/lib/mbedtls/ptest
>         2026-04-23T07:29
>         STOP: ptest-runner
>         TOTAL: 1 FAIL: 0
> 
>         [1]: https://github.com/Mbed-TLS/mbedtls/blob/development/
>         docs/4.0-migration-guide.md <https://github.com/Mbed-TLS/
>         mbedtls/blob/development/docs/4.0-migration-guide.md>
>         [2]: https://github.com/Mbed-TLS/mbedtls/releases/tag/
>         mbedtls-4.1.0 <https://github.com/Mbed-TLS/mbedtls/releases/tag/
>         mbedtls-4.1.0>
> 
>         Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com
>         <mailto:skandigraun@gmail.com>>
>         ---
> 
>         v2: Inherit python3native, because some native python modules
>         need to be used. When using the
>             system python, PYTHONPATH gets mixed with build host and
>         sysroot modules, which is incorrect.
>             When using python3native class, the module search path is
>         confined to the sysroot, so it
>             can be better controlled. Also, add python3-jsonschema-
>         native as a build dependency (in v1
>             the recipe took this dependency from my build host)
> 
>          ...c_build_helper-Split-cc-command-line.patch | 33 +++++++
>          ...wrapper-to-run-cross-compiled-binary.patch | 29 ++++++
>          .../mbedtls/mbedtls_4.1.0.bb <http://mbedtls_4.1.0.bb>         
>                 | 88 +++++++++++++++++++
>          3 files changed, 150 insertions(+)
>          create mode 100644 meta-networking/recipes-connectivity/
>         mbedtls/mbedtls/0001-c_build_helper-Split-cc-command-line.patch
>          create mode 100644 meta-networking/recipes-connectivity/
>         mbedtls/mbedtls/0001-use-qemuwrapper-to-run-cross-compiled-
>         binary.patch
>          create mode 100644 meta-networking/recipes-connectivity/
>         mbedtls/mbedtls_4.1.0.bb <http://mbedtls_4.1.0.bb>
> 
>         diff --git a/meta-networking/recipes-connectivity/mbedtls/
>         mbedtls/0001-c_build_helper-Split-cc-command-line.patch b/meta-
>         networking/recipes-connectivity/mbedtls/mbedtls/0001-
>         c_build_helper-Split-cc-command-line.patch
>         new file mode 100644
>         index 0000000000..adddb7ad8e
>         --- /dev/null
>         +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-
>         c_build_helper-Split-cc-command-line.patch
>         @@ -0,0 +1,33 @@
>         +From 178e089683bf42097ac6d27522820d07483bc6bd Mon Sep 17
>         00:00:00 2001
>         +From: Gyorgy Sarvari <skandigraun@gmail.com
>         <mailto:skandigraun@gmail.com>>
>         +Date: Thu, 23 Apr 2026 08:54:02 +0200
>         +Subject: [PATCH] c_build_helper: Split cc command line
>         +
>         +Optionally the CC/HOSTCC environment variable can hold the
>         command to
>         +invoke the C compiler, however this command can also contain extra
>         +arguments, not only the binary name. In this particular case Python
>         +was treating the whole value as a single binary name, and was
>         trying
>         +to execute as such (e.g. "cc -arg1 -arg2" instead of "cc" and
>         the arguments
>         +separately), which results in failure.
>         +
>         +Split the compiler command into its components to invoke it
>         correctly.
>         +
>         +Upstream-Status: Submitted [https://github.com/Mbed-TLS/
>         mbedtls-framework/pull/301 <https://github.com/Mbed-TLS/mbedtls-
>         framework/pull/301>]
>         +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com
>         <mailto:skandigraun@gmail.com>>
>         +---
>         + scripts/mbedtls_framework/c_build_helper.py | 2 +-
>         + 1 file changed, 1 insertion(+), 1 deletion(-)
>         +
>         +diff --git a/scripts/mbedtls_framework/c_build_helper.py b/
>         scripts/mbedtls_framework/c_build_helper.py
>         +index 59bb326e2..85dbb628f 100644
>         +--- a/tf-psa-crypto/framework/scripts/mbedtls_framework/
>         c_build_helper.py
>         ++++ b/tf-psa-crypto/framework/scripts/mbedtls_framework/
>         c_build_helper.py
>         +@@ -98,7 +98,7 @@ def compile_c_file(c_filename, exe_filename,
>         include_dirs):
>         +     cc = os.getenv('HOSTCC', None)
>         +     if cc is None:
>         +         cc = os.getenv('CC', 'cc')
>         +-    cmd = [cc]
>         ++    cmd = cc.split()
>         +
>         +     proc = subprocess.Popen(cmd,
>         +                             stdout=subprocess.DEVNULL,
>         diff --git a/meta-networking/recipes-connectivity/mbedtls/
>         mbedtls/0001-use-qemuwrapper-to-run-cross-compiled-binary.patch
>         b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-
>         qemuwrapper-to-run-cross-compiled-binary.patch
>         new file mode 100644
>         index 0000000000..a9e8bb2ed9
>         --- /dev/null
>         +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-
>         use-qemuwrapper-to-run-cross-compiled-binary.patch
>         @@ -0,0 +1,29 @@
>         +From 46f0ea3eb35e8d0d33e88298a9e7c3dbdd49ec17 Mon Sep 17
>         00:00:00 2001
>         +From: Gyorgy Sarvari <skandigraun@gmail.com
>         <mailto:skandigraun@gmail.com>>
>         +Date: Thu, 23 Apr 2026 09:14:40 +0200
>         +Subject: [PATCH] use qemuwrapper to run cross-compiled binary
>         +
>         +The build process executes a compiled binary to get some details,
>         +however this results in a failure in case of cross-compiling.
>         +
>         +Run it with qemuwrapper, that is created in the recipe.
>         +
>         +Upstream-Status: Inappropriate [cross-compile specific]
>         +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com
>         <mailto:skandigraun@gmail.com>>
>         +---
>         + scripts/mbedtls_framework/c_build_helper.py | 2 +-
>         + 1 file changed, 1 insertion(+), 1 deletion(-)
>         +
>         +diff --git a/scripts/mbedtls_framework/c_build_helper.py b/
>         scripts/mbedtls_framework/c_build_helper.py
>         +index 59bb326e2..5c4c211ee 100644
>         +--- a/tf-psa-crypto/framework/scripts/mbedtls_framework/
>         c_build_helper.py
>         ++++ b/tf-psa-crypto/framework/scripts/mbedtls_framework/
>         c_build_helper.py
>         +@@ -169,7 +169,7 @@ def get_c_expression_values(
>         +                              .format(caller, c_name))
>         +         else:
>         +             os.remove(c_name)
>         +-        output = subprocess.check_output([exe_name])
>         ++        output = subprocess.check_output(['../../../
>         qemuwrapper', exe_name])
>         +         return output.decode('ascii').strip().split('\n')
>         +     finally:
>         +         remove_file_if_exists(exe_name)
>         diff --git a/meta-networking/recipes-connectivity/mbedtls/
>         mbedtls_4.1.0.bb <http://mbedtls_4.1.0.bb> b/meta-networking/
>         recipes-connectivity/mbedtls/mbedtls_4.1.0.bb <http://
>         mbedtls_4.1.0.bb>
>         new file mode 100644
>         index 0000000000..614016b0f1
>         --- /dev/null
>         +++ b/meta-networking/recipes-connectivity/mbedtls/
>         mbedtls_4.1.0.bb <http://mbedtls_4.1.0.bb>
>         @@ -0,0 +1,88 @@
>         +SUMMARY = "Lightweight crypto and SSL/TLS library"
>         +DESCRIPTION = "mbedtls is a lean open source crypto library   
>               \
>         +for providing SSL and TLS support in your programs. It offers 
>               \
>         +an intuitive API and documented header files, so you can
>         actually    \
>         +understand what the code does. It features:                   
>               \
>         +                                                               
>              \
>         + - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES,
>         ARC4,  \
>         +   Camellia and XTEA                                           
>              \
>         + - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5     
>               \
>         + - Entropy pool and random generators, like CTR-DRBG and HMAC-
>         DRBG   \
>         + - Public key algorithms, like RSA, Elliptic Curves, Diffie-
>         Hellman, \
>         +   ECDSA and ECDH                                             
>               \
>         + - SSL v3 and TLS 1.0, 1.1 and 1.2                             
>              \
>         + - Abstraction layers for ciphers, hashes, public key
>         operations,    \
>         +   platform abstraction and threading                         
>               \
>         +"
>         +
>         +HOMEPAGE = "https://www.trustedfirmware.org/projects/mbed-tls/
>         <https://www.trustedfirmware.org/projects/mbed-tls/>"
>         +BUGTRACKER = "https://github.com/Mbed-TLS/mbedtls/issues
>         <https://github.com/Mbed-TLS/mbedtls/issues>"
>         +
>         +LICENSE = "Apache-2.0 | GPL-2.0-or-later"
>         +LIC_FILES_CHKSUM = "file://
>         LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
>         +
>         +SECTION = "libs"
>         +
>         +SRC_URI = "gitsm://github.com/Mbed-TLS/
>         mbedtls.git;protocol=https;branch=mbedtls-4.1;tag=v${PV}
>         <http://github.com/Mbed-TLS/
>         mbedtls.git;protocol=https;branch=mbedtls-4.1;tag=v$%7BPV%7D> \
>         +           file://run-ptest \
>         +           file://0001-c_build_helper-Split-cc-command-line.patch \
>         +           "
>         +
>         +SRC_URI:append:class-target = " file://0001-use-qemuwrapper-to-
>         run-cross-compiled-binary.patch"
>         +
>         +SRCREV = "0fe989b6b514192783c469039edd325fd0989806"
>         +
>         +DEPENDS += "python3-jinja2-native python3-jsonschema-native
>         qemu-native"
>         +
>         +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>         +
>         +inherit cmake ptest python3native qemu
>         +
>         +PACKAGECONFIG ??= "shared-libs programs
>         ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
>         +PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-
>         DUSE_SHARED_MBEDTLS_LIBRARY=OFF"
>         +PACKAGECONFIG[programs] = "-DENABLE_PROGRAMS=ON,-
>         DENABLE_PROGRAMS=OFF"
>         +PACKAGECONFIG[werror] = "-DMBEDTLS_FATAL_WARNINGS=ON,-
>         DMBEDTLS_FATAL_WARNINGS=OFF"
>         +PACKAGECONFIG[tests] = "-DENABLE_TESTING=ON,-DENABLE_TESTING=OFF"
>         +
>         +PROVIDES += "polarssl"
>         +RPROVIDES:${PN} = "polarssl"
>         +
>         +PACKAGES =+ "${PN}-programs"
>         +FILES:${PN}-programs = "${bindir}/"
>         +
>         +BBCLASSEXTEND = "native nativesdk"
>         +
>         +CVE_PRODUCT = "mbed_tls"
>         +
>         +do_configure:prepend() {
>         +       # during building tf-psa-crypto/framework/scripts/
>         mbedtls_framework/c_build_helper.py
>         +       # runs some of the cross-compiled binaries.
>         +
>         +       qemu_binary="${@qemu_wrapper_cmdline(d,
>         d.getVar('STAGING_DIR_HOST'),
>         [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_LIBDIR}')])}"
>         +       cat > ${WORKDIR}/qemuwrapper << EOF
>         +#!/bin/sh
>         +$qemu_binary "\$@"
>         +EOF
>         +
>         +       chmod +x ${WORKDIR}/qemuwrapper
>         +}
>         +
>         +# Strip host paths from autogenerated test files
>         +do_compile:append() {
>         +       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
>         +       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
>         +}
>         +
>         +# Export source files/headers needed by Arm Trusted Firmware
>         +sysroot_stage_all:append() {
>         +       sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/
>         usr/share/mbedtls-source/library"
>         +       sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/
>         usr/share/mbedtls-source/include"
>         +}
>         +
>         +do_install_ptest () {
>         +       install -d ${D}${PTEST_PATH}/tests
>         +       install -d ${D}${PTEST_PATH}/framework
>         +       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
>         +       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
>         +       cp -fR ${S}/framework/data_files ${D}${PTEST_PATH}/
>         framework/
>         +}
> 
>         -=-=-=-=-=-=-=-=-=-=-=-
>         Links: You receive all messages sent to this group.
>         View/Reply Online (#126602): https://lists.openembedded.org/g/
>         openembedded-devel/message/126602 <https://
>         lists.openembedded.org/g/openembedded-devel/message/126602>
>         Mute This Topic: https://lists.openembedded.org/
>         mt/118983952/1997914 <https://lists.openembedded.org/
>         mt/118983952/1997914>
>         Group Owner: openembedded-devel+owner@lists.openembedded.org
>         <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>         Unsubscribe: https://lists.openembedded.org/g/openembedded-
>         devel/unsub <https://lists.openembedded.org/g/openembedded-
>         devel/unsub> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>         -=-=-=-=-=-=-=-=-=-=-=-
> 


