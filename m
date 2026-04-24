Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE584FDEE59
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 00:07:03 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10731.1776989217824612439
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 17:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m8VEwoo+;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79db5e18ac6so87505727b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 17:06:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776989217; cv=none;
        d=google.com; s=arc-20240605;
        b=ZYZeXasJZSglh8cf2zwlZ1Xtmq8yc24gfbWNk+8Qp8dnWP1t4vxylEzoW3md03WuBE
         ryxSUKI8eGk/kirx8sJ+/j7/rc+B2xLRSPl8fyWwIQo2sebLsjYzt7EgNH8IzFsud4QD
         V62drAh36IBtmwC34+bsJgoJ5XCoZW798vCLaK8d//ujEuLTVUsxeh6zpWHdPymMHTNQ
         jOVder4GWPl5xuIuQOSXuDya0Nj0j/dV/w/83nvRRWWhfuCm0574jFm3BOrQihrlFVFM
         6OLNzGYj0C6YcV6IElNtWI/Do+jIMTaEXvgghE5iIrXexoaEITRqt6spFuYQZCCEjAUM
         VtVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cyi+camsxH8Z7M9IrjNhFubvmlO3z2KQdzP1vZSzBZA=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=ApLa/gm/Kqgc3LyE4fmZ0LvFGQgpf29pr2l/ohIuctndae3tvmpWZi/cITu1bP/Zvq
         S3XsZwWXnMLS6teH6Wy5Kd4Dfb3L7wSjDD9LObDl0yxb6l1GIykF1TN3AHItALpDPkrM
         szQSzLFWp+duLxvak79CCNjKrPScjFJrG5HPsYQFykuzV1/7hi+a4rHQpyfp4TDyL2v/
         YzMVnesscOZlgPDuD/ENGpBiDnHz8Tz7eczGp7Ddhksv9O8xT9xDtk3MysIhsGe6SsFS
         jq514f2h6+5qZ9EFVj3/dmTpyQoMTPLfT9EwpHLHpKXCq68QcT0h/EldqbP9UlR79ShW
         7VKw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776989217; x=1777594017; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cyi+camsxH8Z7M9IrjNhFubvmlO3z2KQdzP1vZSzBZA=;
        b=m8VEwoo+uRiXnUBkSRI0CDEPamNFA+lAcraE6DmXKhXSYgjQffOk7rY32KynfGTgFD
         0Au/wBkdDqBOo4KyXSh+VWcGbr+fr+gH112RhawL879AVpcsnxNVvCtGSx2IBrP3Q8Q7
         zHEFCA3ETpG+M4QJdWlZ3IQaobsxFrt1LIRkaze6Lvoyh7LrCir8WYLKoaaCzeKTqEU8
         B/hmpL0F6BHMqF1Xa76ZeCr3KXJ8KIrPqoocOKphTVITuNpcbHlDFASTNCtqKiGovm/W
         WEO4H/9rQs17hDjzkSI0M8weYdEqNho1Ia8iP87jt+3EyeUAuWDsDrYIm6VaIrTXT6yG
         c/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776989217; x=1777594017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cyi+camsxH8Z7M9IrjNhFubvmlO3z2KQdzP1vZSzBZA=;
        b=tGB5jkuNwxhsueeILcKbvQ2gxHmK96X8Bghf6gBeWIyQmRMH+VAA0bMHoabvDwwN/+
         qwYvNkXQLsLH7AcURBarKXeJXy8G56eVLzJvtmblSr6iBZjVcIkUX2GSk4GZBpXVPvm6
         S126AS2nD6VkrvHWBREpl2U4+lPKIRF1YaZfctGh8PGvYu6oexG4DHAaxT/JYahVZQoO
         t7cgobpUH4Mv9Lb+WyQ+Uq5VWiCApuNSlUjcJneu0cUZrYrxErgV33RkAqOKQiviXsBD
         1HHMGYBsiEWjIailY0gJuyo5eJReYa5q8QYv1zbm+Hz1RK56j3+u2Zb3+7syzX96Qg3c
         fYVQ==
X-Gm-Message-State: AOJu0Yz8FgkQq4aTvgBvaWdWQB6quJ/ddaQAVJ+8zwdzUfFOyf95/I8t
	G0bK3YyXgfvPtGDqLiXCAchwR5Qjg8BDdzQkos9BUAh/2b7gQr0GwMgDbqgHGYrYsQJ2dEyGDaJ
	JcEwI6yc6IQmBOI8WhN4os1bJYOjtRIY=
X-Gm-Gg: AeBDieuwCsBP8WDAcZals7+X9SurbEjt4khBVbZd0MbqDNpjTe3xqT3JTA+L89+R6Ra
	XoD2bQU6PUoBBnbn+9E/dHnEPrOV406XLgX4b53ojZdu12QoBkuEdXS3YN/symAr847lP1T3ugO
	PeKmHGdYmiFmBaceh1Pa1fH2bkzp31pK6vYQkeFm1adgY0mqeM89/UJ2q/0NI+r8PO6FSMiMmXW
	cbRWiKFFiiJRwE2iV1Sn3cqs+GXdlb4iT9Gjg34Qiw2T3gd4EINDhcekRj9FUPUHivlqKIT5WuE
	V0pLAypSjUj3tSVlhmllhvfI8Y9kHm1QmLMkKD3aTAA415xNSAQKXP1mDBtxE8ASLPd1VjIIhwk
	j61EN5fu7FNdKEBOYKO9W1UdZwZpCQICX00euP+LIjHY3lqb9cXdpWGBXqQzv8GAZQTwUeZbvMS
	n/iN1RYdCE9G//n3okvQyArmsKHjXx
X-Received: by 2002:a05:690e:1914:b0:650:1592:dd32 with SMTP id
 956f58d0204a3-65311989a45mr21841159d50.18.1776989216769; Thu, 23 Apr 2026
 17:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260423105654.3659814-1-skandigraun@gmail.com>
In-Reply-To: <20260423105654.3659814-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Apr 2026 17:06:30 -0700
X-Gm-Features: AQROBzB2suZeR8WLSGz5840py2DErbWEPhBldXoxgtULUwU9E153AmepLzDcl_Y
Message-ID: <CAMKF1so8dNhiYQoGBHBYO8K886PEA6oEoSQmN0nKcecOkVpxsw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mbedtls: add recipe for v4.1.0
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000090abf0650298bb8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 00:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126597

--000000000000090abf0650298bb8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Errors out on AB with below error

ERROR: Logfile of failure stored in:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/mbedtls/4.1.0/temp/log.do_compile.2783809
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=3D1 cmake --build
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/mbedtls/4.1.0/build
--target all --
| Change Dir:
'/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-li=
nux/mbedtls/4.1.0/build'
|
| Run Build Command(s): ninja -v -j 16 all
| [1/846] cd
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/mbedtls/4.1.0/build/tf-psa-crypto/core
&& /srv/pokybuild/buildbot-venv/bin/python3
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/mbedtls/4.1.0/sources/mbedtls-4.1.0/tf-psa-crypto/scripts/generate_drive=
r_wrappers.py
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/mbedtls/4.1.0/build/tf-psa-crypto/core
| FAILED: [code=3D1] tf-psa-crypto/core/psa_crypto_driver_wrappers.h
tf-psa-crypto/core/psa_crypto_driver_wrappers_no_static.c
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/mbedtls/4.1.0/build/tf-psa-crypto/core/psa_crypto_driver_wrappers.h
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/mbedtls/4.1.0/build/tf-psa-crypto/core/psa_crypto_driver_wrappers_no_sta=
tic.c
| cd
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/mbedtls/4.1.0/build/tf-psa-crypto/core
&& /srv/pokybuild/buildbot-venv/bin/python3
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/mbedtls/4.1.0/sources/mbedtls-4.1.0/tf-psa-crypto/scripts/generate_drive=
r_wrappers.py
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/mbedtls/4.1.0/build/tf-psa-crypto/core
| Traceback (most recent call last):
|   File
"/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-li=
nux/mbedtls/4.1.0/sources/mbedtls-4.1.0/tf-psa-crypto/scripts/generate_driv=
er_wrappers.py",
line 18, in <module>
|     import jsonschema
| ModuleNotFoundError: No module named 'jsonschema'

Full log
autobuilder.yoctoproject.org/valkyrie/api/v2/logs/6493294/raw_inline


On Thu, Apr 23, 2026 at 3:56=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
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
>  ...c_build_helper-Split-cc-command-line.patch | 33 +++++++
>  ...wrapper-to-run-cross-compiled-binary.patch | 29 ++++++
>  .../mbedtls/mbedtls_4.1.0.bb                  | 93 +++++++++++++++++++
>  3 files changed, 155 insertions(+)
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
> index 0000000000..aa637db776
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb
> @@ -0,0 +1,93 @@
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
> +DEPENDS +=3D "python3-jinja2-native qemu-native"
> +
> +UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> +
> +inherit cmake ptest python3-dir qemu
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
> +PYTHONPATH:class-target =3D
> "${RECIPE_SYSROOT_NATIVE}${PYTHON_SITEPACKAGES_DIR}"
> +PYTHONPATH:class-native =3D "${PYTHON_SITEPACKAGES_DIR}"
> +export PYTHONPATH
> +
> +do_configure:prepend() {
> +       # during building
> tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py
> +        # runs some of the cross-compiled binaries.
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
> +
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
> View/Reply Online (#126573):
> https://lists.openembedded.org/g/openembedded-devel/message/126573
> Mute This Topic: https://lists.openembedded.org/mt/118969482/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000090abf0650298bb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Errors out on AB with below error<div><br></div><div>ERROR=
: Logfile of failure stored in: /srv/pokybuild/yocto-worker/meta-oe/build/b=
uild/tmp/work/x86-64-v3-poky-linux/mbedtls/4.1.0/temp/log.do_compile.278380=
9<br>Log data follows:<br>| DEBUG: Executing shell function do_compile<br>|=
 NOTE: VERBOSE=3D1 cmake --build /srv/pokybuild/yocto-worker/meta-oe/build/=
build/tmp/work/x86-64-v3-poky-linux/mbedtls/4.1.0/build --target all --<br>=
| Change Dir: &#39;/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/x86-64-v3-poky-linux/mbedtls/4.1.0/build&#39;<br>| <br>| Run Build Command=
(s): ninja -v -j 16 all<br>| [1/846] cd /srv/pokybuild/yocto-worker/meta-oe=
/build/build/tmp/work/x86-64-v3-poky-linux/mbedtls/4.1.0/build/tf-psa-crypt=
o/core &amp;&amp; /srv/pokybuild/buildbot-venv/bin/python3 /srv/pokybuild/y=
octo-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/mbedtls/4.1.0=
/sources/mbedtls-4.1.0/tf-psa-crypto/scripts/generate_driver_wrappers.py /s=
rv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux=
/mbedtls/4.1.0/build/tf-psa-crypto/core<br>| FAILED: [code=3D1] tf-psa-cryp=
to/core/psa_crypto_driver_wrappers.h tf-psa-crypto/core/psa_crypto_driver_w=
rappers_no_static.c /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/wor=
k/x86-64-v3-poky-linux/mbedtls/4.1.0/build/tf-psa-crypto/core/psa_crypto_dr=
iver_wrappers.h /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x8=
6-64-v3-poky-linux/mbedtls/4.1.0/build/tf-psa-crypto/core/psa_crypto_driver=
_wrappers_no_static.c<br>| cd /srv/pokybuild/yocto-worker/meta-oe/build/bui=
ld/tmp/work/x86-64-v3-poky-linux/mbedtls/4.1.0/build/tf-psa-crypto/core &am=
p;&amp; /srv/pokybuild/buildbot-venv/bin/python3 /srv/pokybuild/yocto-worke=
r/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/mbedtls/4.1.0/sources/m=
bedtls-4.1.0/tf-psa-crypto/scripts/generate_driver_wrappers.py /srv/pokybui=
ld/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/mbedtls/4=
.1.0/build/tf-psa-crypto/core<br>| Traceback (most recent call last):<br>| =
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/=
x86-64-v3-poky-linux/mbedtls/4.1.0/sources/mbedtls-4.1.0/tf-psa-crypto/scri=
pts/generate_driver_wrappers.py&quot;, line 18, in &lt;module&gt;<br>| =C2=
=A0 =C2=A0 import jsonschema<br>| ModuleNotFoundError: No module named &#39=
;jsonschema&#39;<br></div><div><br></div><div>Full log</div><div><a href=3D=
"https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/6493294/raw_inli=
ne">autobuilder.yoctoproject.org/valkyrie/api/v2/logs/6493294/raw_inline</a=
></div><div><br></div></div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 23, 2026 at 3:56=E2=
=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.o=
penembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">This is the current LTS ve=
rsion for mbedtls, add it next to the existing recipe<br>
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
=C2=A0...c_build_helper-Split-cc-command-line.patch | 33 +++++++<br>
=C2=A0...wrapper-to-run-cross-compiled-binary.patch | 29 ++++++<br>
=C2=A0.../mbedtls/<a href=3D"http://mbedtls_4.1.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mbedtls_4.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 93 +++++++++++++++++++<br>
=C2=A03 files changed, 155 insertions(+)<br>
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
index 0000000000..aa637db776<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/mbedtls/<a href=3D"http://mbedtl=
s_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_4.1.0.bb</a><br>
@@ -0,0 +1,93 @@<br>
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
+DEPENDS +=3D &quot;python3-jinja2-native qemu-native&quot;<br>
+<br>
+UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)&quot;<br=
>
+<br>
+inherit cmake ptest python3-dir qemu<br>
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
+PYTHONPATH:class-target =3D &quot;${RECIPE_SYSROOT_NATIVE}${PYTHON_SITEPAC=
KAGES_DIR}&quot;<br>
+PYTHONPATH:class-native =3D &quot;${PYTHON_SITEPACKAGES_DIR}&quot;<br>
+export PYTHONPATH<br>
+<br>
+do_configure:prepend() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# during building tf-psa-crypto/framework/scrip=
ts/mbedtls_framework/c_build_helper.py<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # runs some of the cross-compiled binaries.<br=
>
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
+<br>
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
View/Reply Online (#126573): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126573" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126573</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118969482/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118969482/1997914</a><br>
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

--000000000000090abf0650298bb8--

