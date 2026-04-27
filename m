Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A68FF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 14:08:36 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46152.1777298913982868917
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2026 07:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=doQfJRv3;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4890098abbaso81661435e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 07:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777298912; x=1777903712; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOURSfx4KShkA8LvC0LB04mZLRHaxtU2UuWTjdQMDD8=;
        b=doQfJRv31R/7Gvj9F56PsrEAeBVXRez1nTGMqlZWsQcNOvOx1x0z6pYVA+fjfZBa7Z
         dgwywmdSYDtlZBqCtkO8C5OBprX2hjUB3j362dY01WZeqI0H2rBObTZQlP6rHhqwmrGB
         Qcpbz4CwoeeOMakz0S2XvOYRgviYPsUWBC3wCIk4JQwL7haH7EDyHmOGSeQPyfJtxLFU
         +CKrDO0c5Ys8p3LLIdNcjyMI0KDQe+9wGDGbpPwv90OjUAGeGvdjkrR3PEmbT1xlPsOi
         phJK8pA9kDU0pPxEHptV6Kff0PMJrtGT7hpR9Rmb1BHHefvFpd7WjSy3Gz0A/9mC7s44
         l9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298912; x=1777903712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOURSfx4KShkA8LvC0LB04mZLRHaxtU2UuWTjdQMDD8=;
        b=M5zmjTYsGMWIuuRN9MWZK8kGa1OQTf5LIJfa6opmtsOJWpd30LuEdrX3Kpj4nMlmYu
         D/iSwBNAxF0DghArOfeJv1L7vrmXMvZGYRi6c43WEa9+Z602x45JVsOlG0cv7t7s30uw
         1doP966DJ/Wk5kCGQq7wmYW1LlULLse+fimjfPdeNrrKoa9BfpQvSMY9Nefe1n6y9Dhm
         iYv0LlmIJ4cXeWV40YsIRq4yCkRSUIONeRn/3FmmJGup7Y80LgTTYFELKvS5/eqCvdKx
         TuCPbDbjgm8xAB1+lN0I/Hukpa2BvZ9qXglAQJGmnbGcRJh/WX5kFyoFGUex+DsIbzab
         cJVw==
X-Forwarded-Encrypted: i=1; AFNElJ/X3KmvfpDWhLuPVe44mrmIDTrGH2DGK7PpOWaKDV8HjAII5ELC6i6AKBYm7Qaez3qSIAiD73nrIyzvN2iuYHRj9XE=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7Pb6DFHsjqFspiipHh50L5CmuwhtTt3BtQA1faWgNu6nuYubW
	iKORrtAdmzXiu8y6b2JnqW9wF7R8xAes4XlY+M4L0GNC0WDuIEgJT5fD
X-Gm-Gg: AeBDievqa46QPQsZhz128XpfJdRVKOnwKFP0GLQiDGesD3I6z4Q86ojWPc7Q3AOPd2n
	hskVr7W7DxeZQLrZ96qjoq+FF64Lx7deeo48X5RJGj63CePrsAfXp2/5vfPNz644WiCDYChEfwY
	YQEp5s3jppvRmsqqjTbuDcCHfVZktlNNbPxvGdpe1JYUofbq1+4xOANbwNyHwI4enSGXCfvtaKt
	wv6xTQK4bOAcRMIqn3H7LZEV2g8OiNlHk8E/uZXUkrhHX5Rt2iyg76qpsuTccIo3xawWvw6XLJD
	GZ1YYtX/FK/eC7a/JDO3NzhYPceu/xiQmu9bTHqTG8z99LcU1ZpRf6LvN8XvxxL+sVzNwNlsdmr
	3KvoIEHnBE2eyoiH91vH7H4N6naEkpB4Ilo3IMxy/8J32a3tqqJBh523lSl9J+WROJq0k1G0fa+
	r+Kmu8itmvsD/uZqsl3v0NhaxBJxYgy2M14VHLfMZHYg==
X-Received: by 2002:a05:600c:3483:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-488fb7787d7mr602728325e9.15.1777298912024;
        Mon, 27 Apr 2026 07:08:32 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891c08faffsm1051100965e9.1.2026.04.27.07.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:08:31 -0700 (PDT)
Message-ID: <7380b427-4e88-4eaa-906d-6274080ff715@gmail.com>
Date: Mon, 27 Apr 2026 16:08:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH v2] mbedtls: add recipe for v4.1.0
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260424064603.728430-1-skandigraun@gmail.com>
 <CAMKF1sp4hCeyML8MMaOne2t2p_1+oKH37mvJUjF4M-soB2U_6A@mail.gmail.com>
 <CAMKF1so9vPsqk7eTi_ypsr-TiTJSeZFNPgri1KvvKzaT+yinug@mail.gmail.com>
 <18A9E5089EA766DA.2188217@lists.openembedded.org>
 <CAO5Uq5TarogKhyRTSZeYaZmSPPhJb0k2bKCJhSG3hev-Wf9m-g@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAO5Uq5TarogKhyRTSZeYaZmSPPhJb0k2bKCJhSG3hev-Wf9m-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 14:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126640

On 4/27/26 11:09, Alex Kiernan wrote:
> On Sun, Apr 26, 2026 at 12:35 PM Alex Kiernan via
> lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org>
> wrote:
>>
>> Just dropping mbedtls/ecp.h looks like it might be sufficient for mdns
>> (untested because of the mbedtls build failure around qemuwrapper):
>>
>> diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
>> index 6726ef9b9145..c2e47ba232a5 100644
>> --- a/mDNSPosix/mbedtls.c
>> +++ b/mDNSPosix/mbedtls.c
>> @@ -31,7 +31,6 @@
>>
>>  #include <mbedtls/error.h>
>>  #include <mbedtls/pk.h>
>> -#include <mbedtls/ecp.h>
>>  #include <mbedtls/ecdsa.h>
>>  #include <mbedtls/entropy.h>
>>  #include <mbedtls/ctr_drbg.h>
>>
> 
> Scratch that... the changes needed are much more than simple header removal.
> 


Good to know, thanks - but I think this also means that it won't get
into Wrynose unfortunately. Doing big changes on multiple recipes is
just too unstable for a stable branch, I guess.


>>
>> On Sat, Apr 25, 2026 at 2:35 AM Khem Raj via lists.openembedded.org
>> <raj.khem=gmail.com@lists.openembedded.org> wrote:
>>>
>>> and knock on effects perhaps see.
>>>
>>> https://errors.yoctoproject.org/Errors/Build/237188/
>>>
>>> On Fri, Apr 24, 2026 at 6:33 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> here is next error
>>>>
>>>> | *** stack smashing detected ***: terminated
>>>> | qemu: uncaught target signal 6 (Aborted) - core dumped
>>>> | Aborted
>>>> | Traceback (most recent call last):
>>>> |   File "/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/mbedtls/4.1.0/sources/mbedtls-4.1.0/tf-psa-crypto/framework/scripts/generate_psa_tests.py", line 870, in <module>
>>>> |     test_data_generation.main(sys.argv[1:], __doc__, PSATestGenerator)
>>>> |     ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>>
>>>> Detailed error log
>>>>
>>>> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/6511632/raw_inline
>>>>
>>>> On Thu, Apr 23, 2026 at 11:46 PM Gyorgy Sarvari via lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> wrote:
>>>>>
>>>>> This is the current LTS version for mbedtls, add it next to the existing recipe
>>>>> for v3.6. This new version will be supported longer than v3.6, but there are
>>>>> some incompatibilities between the two (see migration guide[1] and changelog[2]).
>>>>>
>>>>> This recipe is based on the v3.6 recipe. psa PACKAGECONFIG was dropped, as it is
>>>>> now the regular behavior, without an option to turn it off. update-alternatives
>>>>> class is also removed - it was required due to a sample program called "hello",
>>>>> which has been removed from this release.
>>>>>
>>>>> Added two small patches:
>>>>> - one to handle the CC env var correctly from Python. This is submitted for upstream.
>>>>> - one to use qemu to run cross-compiled binaries instead of running them as they are.
>>>>>   This is not upstreamed, as it is OE specific.
>>>>>
>>>>> Ptests passed successfully:
>>>>>
>>>>> root@qemux86-64:~# ptest-runner
>>>>> START: ptest-runner
>>>>> 2026-04-23T07:29
>>>>> BEGIN: /usr/lib/mbedtls/ptest
>>>>> PASS: test_suite_config.mbedtls_boolean
>>>>> PASS: test_suite_config.tls_combinations
>>>>> PASS: test_suite_constant_time_hmac
>>>>> PASS: test_suite_debug
>>>>> PASS: test_suite_error
>>>>> PASS: test_suite_mps
>>>>> PASS: test_suite_net
>>>>> PASS: test_suite_pkcs7
>>>>> PASS: test_suite_ssl
>>>>> PASS: test_suite_ssl.records
>>>>> PASS: test_suite_ssl.tls-defrag
>>>>> PASS: test_suite_ssl_decrypt.misc
>>>>> PASS: test_suite_test_helpers
>>>>> PASS: test_suite_timing
>>>>> PASS: test_suite_version
>>>>> PASS: test_suite_x509_oid
>>>>> PASS: test_suite_x509parse
>>>>> PASS: test_suite_x509write
>>>>> DURATION: 7
>>>>> END: /usr/lib/mbedtls/ptest
>>>>> 2026-04-23T07:29
>>>>> STOP: ptest-runner
>>>>> TOTAL: 1 FAIL: 0
>>>>>
>>>>> [1]: https://github.com/Mbed-TLS/mbedtls/blob/development/docs/4.0-migration-guide.md
>>>>> [2]: https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-4.1.0
>>>>>
>>>>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>>>>> ---
>>>>>
>>>>> v2: Inherit python3native, because some native python modules need to be used. When using the
>>>>>     system python, PYTHONPATH gets mixed with build host and sysroot modules, which is incorrect.
>>>>>     When using python3native class, the module search path is confined to the sysroot, so it
>>>>>     can be better controlled. Also, add python3-jsonschema-native as a build dependency (in v1
>>>>>     the recipe took this dependency from my build host)
>>>>>
>>>>>  ...c_build_helper-Split-cc-command-line.patch | 33 +++++++
>>>>>  ...wrapper-to-run-cross-compiled-binary.patch | 29 ++++++
>>>>>  .../mbedtls/mbedtls_4.1.0.bb                  | 88 +++++++++++++++++++
>>>>>  3 files changed, 150 insertions(+)
>>>>>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_build_helper-Split-cc-command-line.patch
>>>>>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-qemuwrapper-to-run-cross-compiled-binary.patch
>>>>>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb
>>>>>
>>>>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_build_helper-Split-cc-command-line.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_build_helper-Split-cc-command-line.patch
>>>>> new file mode 100644
>>>>> index 0000000000..adddb7ad8e
>>>>> --- /dev/null
>>>>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_build_helper-Split-cc-command-line.patch
>>>>> @@ -0,0 +1,33 @@
>>>>> +From 178e089683bf42097ac6d27522820d07483bc6bd Mon Sep 17 00:00:00 2001
>>>>> +From: Gyorgy Sarvari <skandigraun@gmail.com>
>>>>> +Date: Thu, 23 Apr 2026 08:54:02 +0200
>>>>> +Subject: [PATCH] c_build_helper: Split cc command line
>>>>> +
>>>>> +Optionally the CC/HOSTCC environment variable can hold the command to
>>>>> +invoke the C compiler, however this command can also contain extra
>>>>> +arguments, not only the binary name. In this particular case Python
>>>>> +was treating the whole value as a single binary name, and was trying
>>>>> +to execute as such (e.g. "cc -arg1 -arg2" instead of "cc" and the arguments
>>>>> +separately), which results in failure.
>>>>> +
>>>>> +Split the compiler command into its components to invoke it correctly.
>>>>> +
>>>>> +Upstream-Status: Submitted [https://github.com/Mbed-TLS/mbedtls-framework/pull/301]
>>>>> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>>>>> +---
>>>>> + scripts/mbedtls_framework/c_build_helper.py | 2 +-
>>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>> +
>>>>> +diff --git a/scripts/mbedtls_framework/c_build_helper.py b/scripts/mbedtls_framework/c_build_helper.py
>>>>> +index 59bb326e2..85dbb628f 100644
>>>>> +--- a/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py
>>>>> ++++ b/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py
>>>>> +@@ -98,7 +98,7 @@ def compile_c_file(c_filename, exe_filename, include_dirs):
>>>>> +     cc = os.getenv('HOSTCC', None)
>>>>> +     if cc is None:
>>>>> +         cc = os.getenv('CC', 'cc')
>>>>> +-    cmd = [cc]
>>>>> ++    cmd = cc.split()
>>>>> +
>>>>> +     proc = subprocess.Popen(cmd,
>>>>> +                             stdout=subprocess.DEVNULL,
>>>>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-qemuwrapper-to-run-cross-compiled-binary.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-qemuwrapper-to-run-cross-compiled-binary.patch
>>>>> new file mode 100644
>>>>> index 0000000000..a9e8bb2ed9
>>>>> --- /dev/null
>>>>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-qemuwrapper-to-run-cross-compiled-binary.patch
>>>>> @@ -0,0 +1,29 @@
>>>>> +From 46f0ea3eb35e8d0d33e88298a9e7c3dbdd49ec17 Mon Sep 17 00:00:00 2001
>>>>> +From: Gyorgy Sarvari <skandigraun@gmail.com>
>>>>> +Date: Thu, 23 Apr 2026 09:14:40 +0200
>>>>> +Subject: [PATCH] use qemuwrapper to run cross-compiled binary
>>>>> +
>>>>> +The build process executes a compiled binary to get some details,
>>>>> +however this results in a failure in case of cross-compiling.
>>>>> +
>>>>> +Run it with qemuwrapper, that is created in the recipe.
>>>>> +
>>>>> +Upstream-Status: Inappropriate [cross-compile specific]
>>>>> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>>>>> +---
>>>>> + scripts/mbedtls_framework/c_build_helper.py | 2 +-
>>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>> +
>>>>> +diff --git a/scripts/mbedtls_framework/c_build_helper.py b/scripts/mbedtls_framework/c_build_helper.py
>>>>> +index 59bb326e2..5c4c211ee 100644
>>>>> +--- a/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py
>>>>> ++++ b/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py
>>>>> +@@ -169,7 +169,7 @@ def get_c_expression_values(
>>>>> +                              .format(caller, c_name))
>>>>> +         else:
>>>>> +             os.remove(c_name)
>>>>> +-        output = subprocess.check_output([exe_name])
>>>>> ++        output = subprocess.check_output(['../../../qemuwrapper', exe_name])
>>>>> +         return output.decode('ascii').strip().split('\n')
>>>>> +     finally:
>>>>> +         remove_file_if_exists(exe_name)
>>>>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb
>>>>> new file mode 100644
>>>>> index 0000000000..614016b0f1
>>>>> --- /dev/null
>>>>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb
>>>>> @@ -0,0 +1,88 @@
>>>>> +SUMMARY = "Lightweight crypto and SSL/TLS library"
>>>>> +DESCRIPTION = "mbedtls is a lean open source crypto library          \
>>>>> +for providing SSL and TLS support in your programs. It offers        \
>>>>> +an intuitive API and documented header files, so you can actually    \
>>>>> +understand what the code does. It features:                          \
>>>>> +                                                                     \
>>>>> + - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
>>>>> +   Camellia and XTEA                                                 \
>>>>> + - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
>>>>> + - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
>>>>> + - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
>>>>> +   ECDSA and ECDH                                                    \
>>>>> + - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
>>>>> + - Abstraction layers for ciphers, hashes, public key operations,    \
>>>>> +   platform abstraction and threading                                \
>>>>> +"
>>>>> +
>>>>> +HOMEPAGE = "https://www.trustedfirmware.org/projects/mbed-tls/"
>>>>> +BUGTRACKER = "https://github.com/Mbed-TLS/mbedtls/issues"
>>>>> +
>>>>> +LICENSE = "Apache-2.0 | GPL-2.0-or-later"
>>>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
>>>>> +
>>>>> +SECTION = "libs"
>>>>> +
>>>>> +SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-4.1;tag=v${PV} \
>>>>> +           file://run-ptest \
>>>>> +           file://0001-c_build_helper-Split-cc-command-line.patch \
>>>>> +           "
>>>>> +
>>>>> +SRC_URI:append:class-target = " file://0001-use-qemuwrapper-to-run-cross-compiled-binary.patch"
>>>>> +
>>>>> +SRCREV = "0fe989b6b514192783c469039edd325fd0989806"
>>>>> +
>>>>> +DEPENDS += "python3-jinja2-native python3-jsonschema-native qemu-native"
>>>>> +
>>>>> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>>>>> +
>>>>> +inherit cmake ptest python3native qemu
>>>>> +
>>>>> +PACKAGECONFIG ??= "shared-libs programs ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
>>>>> +PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-DUSE_SHARED_MBEDTLS_LIBRARY=OFF"
>>>>> +PACKAGECONFIG[programs] = "-DENABLE_PROGRAMS=ON,-DENABLE_PROGRAMS=OFF"
>>>>> +PACKAGECONFIG[werror] = "-DMBEDTLS_FATAL_WARNINGS=ON,-DMBEDTLS_FATAL_WARNINGS=OFF"
>>>>> +PACKAGECONFIG[tests] = "-DENABLE_TESTING=ON,-DENABLE_TESTING=OFF"
>>>>> +
>>>>> +PROVIDES += "polarssl"
>>>>> +RPROVIDES:${PN} = "polarssl"
>>>>> +
>>>>> +PACKAGES =+ "${PN}-programs"
>>>>> +FILES:${PN}-programs = "${bindir}/"
>>>>> +
>>>>> +BBCLASSEXTEND = "native nativesdk"
>>>>> +
>>>>> +CVE_PRODUCT = "mbed_tls"
>>>>> +
>>>>> +do_configure:prepend() {
>>>>> +       # during building tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper.py
>>>>> +       # runs some of the cross-compiled binaries.
>>>>> +
>>>>> +       qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_LIBDIR}')])}"
>>>>> +       cat > ${WORKDIR}/qemuwrapper << EOF
>>>>> +#!/bin/sh
>>>>> +$qemu_binary "\$@"
>>>>> +EOF
>>>>> +
>>>>> +       chmod +x ${WORKDIR}/qemuwrapper
>>>>> +}
>>>>> +
>>>>> +# Strip host paths from autogenerated test files
>>>>> +do_compile:append() {
>>>>> +       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
>>>>> +       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
>>>>> +}
>>>>> +
>>>>> +# Export source files/headers needed by Arm Trusted Firmware
>>>>> +sysroot_stage_all:append() {
>>>>> +       sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library"
>>>>> +       sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include"
>>>>> +}
>>>>> +
>>>>> +do_install_ptest () {
>>>>> +       install -d ${D}${PTEST_PATH}/tests
>>>>> +       install -d ${D}${PTEST_PATH}/framework
>>>>> +       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
>>>>> +       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
>>>>> +       cp -fR ${S}/framework/data_files ${D}${PTEST_PATH}/framework/
>>>>> +}
>>>>>
>>>>>
>>>>>
>>>
>>>
>>>
>>
>>
>> --
>> Alex Kiernan
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#126614): https://lists.openembedded.org/g/openembedded-devel/message/126614
>> Mute This Topic: https://lists.openembedded.org/mt/118983952/3618097
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kiernan@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 


