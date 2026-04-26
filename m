Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28131FF885C
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 11:36:02 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16858.1777203352577703624
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 04:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OUm66EBw;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38def541b0bso79953141fa.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 04:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777203350; cv=none;
        d=google.com; s=arc-20240605;
        b=RR6L5/XZVeN2JYtBjQ5n9YxFcU3VwAcw65+9Uy4XElGaUWX8eq5NYZCbMw9ykr9Ynz
         9KEvWPvVnqOHwvStExO15HEfBIKv4aijdo7XpOM56Z4VFOPuK8BcJ0OnmCBPItkT/A3z
         rI5fevqJASDJ8yEbxfwHPc7Te3H7wr/yVxHEYuHJirAhdNoHaNm1YrW9QM+ycsFg2mxp
         C0dtuEv35QyAGTykUAmmpR6EmYp4L7ecR2e30NSAE/eqtvxaid41DHhiWsLqvxBwVMNG
         SeS5MXbvx/ejs5SOwj5s9I7QROVs5dj6etvvoY8uRKaq97gxao3Tpc2oEb/JZD7AS9Et
         A8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N/0jIlxW3/vswMCENrkRTDiNHWq7SB5dKdFgXN7nnbE=;
        fh=8+aJ578aPNXLPFqLZOHjUXOB/8jCfgi26ViHdsyiOjw=;
        b=Hquxd2FX4Gnap/kvsNKBouXPQzbHDgQYA50pjufPmVSBSEOxKCNYAeZ0gF1hNWrgQW
         zswgyh3kTkvUFxlcHFUJdKG1q/yL/zjpCdl4XJHG/S2+w1swKXgK5Kp27nBtYO0zjNm8
         IlOPcJIOBdIue+eEgKaK4D8vbBpx8T2k5aXajFStVzy82bQVyUvfrG8e59Wmyz1/XyS9
         x/TTINFnKzsIwYTm0nQOdSzb4GhLUFib+BL4kvyWB7mUfDnG6TtHclN7MzwnEgcrrL6G
         KhOWEzMUNjv2EzcuAmaflVdlqMiHu0ukfyYC+QKzkZGQdWqbNFArMtWPClstfPjj1F2E
         f9Kw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777203350; x=1777808150; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/0jIlxW3/vswMCENrkRTDiNHWq7SB5dKdFgXN7nnbE=;
        b=OUm66EBwQEemFCcrWCMjFAYroaX89BtaBVx9iTmgQkWM9YgLb8qLz9EzvPG3BobQID
         7IuTajWTNyNpS+Pey4CcHWxBhQlrPSgDd1f2ec+3MBHgnZbrd2kh4ALUYz/t4Je648cC
         jUh3h64jxGYP9Gj8FkhjzkTdBhQqNE6pKgzunjJUaG7xzM2r1S3DnTQ2CuBOLA0cFNuF
         +56Mp521CQtnF9qkMCrGh/xNDy9rpO4zCPgfxapfszFiIqKKtmNjRQFML2dKoz18smp5
         oX4R8ixgHzKrHqMMIq1NHutpT9VD3YOQHKFsSlqXw4MRaAFt4nNpolwJhvsMHaUfK5of
         djTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777203350; x=1777808150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N/0jIlxW3/vswMCENrkRTDiNHWq7SB5dKdFgXN7nnbE=;
        b=lIVJ8IEQZoAoykXlaAcEGa6FoHkOnwsuGw3V9cGp05fNp5dJGysrGxJA18itRkcuzm
         iK9J1gpHr5+AFbhlkYvTneJf8t6mjDm08me/vqwBdDCf1FggmpvuzJJXQLNUXMP8p77y
         W0KUWxqku4Irp+4Gf+KsuqH4AI7QnESjmNle0A8/DGPM55Gu6cHDkmIlzuSd9xgwn0Yh
         hWmA4obCU286zh6cplG7/Xa69mgbZFFqSsrbGQjKpQoSSn+XSRjcRmgAH9lf0dtY8Q5/
         A4uDSpEexq9P5/JUj3+rTXpMSo83F7MaTRyswfI6m0M1mHqcT0wd/mEjHP746basiCZ/
         7Ftg==
X-Forwarded-Encrypted: i=1; AFNElJ/0zM2V5xxfx4oxBMOv0G7gMVSeksx7H2HzfE1bF6bza2npt8FquSu6F1CCccItWcU7SaNyQ9/KJ5xrvjxTjrhTyVo=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzv35EwLnIlkgRqDCNgvxkSHLpgxsMum8QObd5VxmvWYDQFJZPO
	lW3pprGjbMJlVG8Yw0rOIb5QHPXJ8dbGdpRpkY2leJxX0BuY11M26x7Xswmx+nv6VQCCrUptkhj
	tEtbKSEKZkNCmUVvcSQHsgp1weA2VLUk=
X-Gm-Gg: AeBDievKLf9eaTUKkoh/xK5YnyP8RnDO4gwSzNX0pUXwRlWa96+jgGSKVmHLIcB4Tgk
	qOFavdsL/+EmQkxGQG86W1a02ss5Sc32qP2Qc5047ZqRqv3UQatHE/pLjj2OohHi+l7X+Pf5U+M
	/wWRJfT6VY7P5LrkXa4kg84ZiR75FQpIHCFKoWDiUn8fsdHqWrXtn5gHoc2khi5DxEQ3H0z5myI
	ZnxJaD0z7A2mN2IaN/C4x0Ykc90CQMxVqR6qzJw3OUQd0UGH8GSS4JCfuE/5/BReLPh2UqqPGgH
	cIXnvW0PkV+7EgygwzzMYT5pQiw=
X-Received: by 2002:a2e:bc10:0:b0:38e:298:96c6 with SMTP id
 38308e7fff4ca-38ec7b05e7bmr117134981fa.19.1777203350007; Sun, 26 Apr 2026
 04:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260424064603.728430-1-skandigraun@gmail.com>
 <CAMKF1sp4hCeyML8MMaOne2t2p_1+oKH37mvJUjF4M-soB2U_6A@mail.gmail.com> <CAMKF1so9vPsqk7eTi_ypsr-TiTJSeZFNPgri1KvvKzaT+yinug@mail.gmail.com>
In-Reply-To: <CAMKF1so9vPsqk7eTi_ypsr-TiTJSeZFNPgri1KvvKzaT+yinug@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 26 Apr 2026 12:35:38 +0100
X-Gm-Features: AQROBzCVysGbelJ7tmpyp55eNtE4GvruoPdzjRKCTkQ_QIZhSsrAT8YI0JaHZgY
Message-ID: <CAO5Uq5TA_EtTwJoBSZV7yxzTEkD9Csx6cZTcDvan30jYhDwKbw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] mbedtls: add recipe for v4.1.0
To: raj.khem@gmail.com
Cc: skandigraun@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 11:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126614

Just dropping mbedtls/ecp.h looks like it might be sufficient for mdns
(untested because of the mbedtls build failure around qemuwrapper):

diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
index 6726ef9b9145..c2e47ba232a5 100644
--- a/mDNSPosix/mbedtls.c
+++ b/mDNSPosix/mbedtls.c
@@ -31,7 +31,6 @@

 #include <mbedtls/error.h>
 #include <mbedtls/pk.h>
-#include <mbedtls/ecp.h>
 #include <mbedtls/ecdsa.h>
 #include <mbedtls/entropy.h>
 #include <mbedtls/ctr_drbg.h>


On Sat, Apr 25, 2026 at 2:35=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> and knock on effects perhaps see.
>
> https://errors.yoctoproject.org/Errors/Build/237188/
>
> On Fri, Apr 24, 2026 at 6:33=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> here is next error
>>
>> | *** stack smashing detected ***: terminated
>> | qemu: uncaught target signal 6 (Aborted) - core dumped
>> | Aborted
>> | Traceback (most recent call last):
>> |   File "/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/mbedtls/4.1.0/sources/mbedtls-4.1.0/tf-psa-crypto/framework=
/scripts/generate_psa_tests.py", line 870, in <module>
>> |     test_data_generation.main(sys.argv[1:], __doc__, PSATestGenerator)
>> |     ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> Detailed error log
>>
>> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/6511632/raw_in=
line
>>
>> On Thu, Apr 23, 2026 at 11:46=E2=80=AFPM Gyorgy Sarvari via lists.openem=
bedded.org <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
>>>
>>> This is the current LTS version for mbedtls, add it next to the existin=
g recipe
>>> for v3.6. This new version will be supported longer than v3.6, but ther=
e are
>>> some incompatibilities between the two (see migration guide[1] and chan=
gelog[2]).
>>>
>>> This recipe is based on the v3.6 recipe. psa PACKAGECONFIG was dropped,=
 as it is
>>> now the regular behavior, without an option to turn it off. update-alte=
rnatives
>>> class is also removed - it was required due to a sample program called =
"hello",
>>> which has been removed from this release.
>>>
>>> Added two small patches:
>>> - one to handle the CC env var correctly from Python. This is submitted=
 for upstream.
>>> - one to use qemu to run cross-compiled binaries instead of running the=
m as they are.
>>>   This is not upstreamed, as it is OE specific.
>>>
>>> Ptests passed successfully:
>>>
>>> root@qemux86-64:~# ptest-runner
>>> START: ptest-runner
>>> 2026-04-23T07:29
>>> BEGIN: /usr/lib/mbedtls/ptest
>>> PASS: test_suite_config.mbedtls_boolean
>>> PASS: test_suite_config.tls_combinations
>>> PASS: test_suite_constant_time_hmac
>>> PASS: test_suite_debug
>>> PASS: test_suite_error
>>> PASS: test_suite_mps
>>> PASS: test_suite_net
>>> PASS: test_suite_pkcs7
>>> PASS: test_suite_ssl
>>> PASS: test_suite_ssl.records
>>> PASS: test_suite_ssl.tls-defrag
>>> PASS: test_suite_ssl_decrypt.misc
>>> PASS: test_suite_test_helpers
>>> PASS: test_suite_timing
>>> PASS: test_suite_version
>>> PASS: test_suite_x509_oid
>>> PASS: test_suite_x509parse
>>> PASS: test_suite_x509write
>>> DURATION: 7
>>> END: /usr/lib/mbedtls/ptest
>>> 2026-04-23T07:29
>>> STOP: ptest-runner
>>> TOTAL: 1 FAIL: 0
>>>
>>> [1]: https://github.com/Mbed-TLS/mbedtls/blob/development/docs/4.0-migr=
ation-guide.md
>>> [2]: https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-4.1.0
>>>
>>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>>> ---
>>>
>>> v2: Inherit python3native, because some native python modules need to b=
e used. When using the
>>>     system python, PYTHONPATH gets mixed with build host and sysroot mo=
dules, which is incorrect.
>>>     When using python3native class, the module search path is confined =
to the sysroot, so it
>>>     can be better controlled. Also, add python3-jsonschema-native as a =
build dependency (in v1
>>>     the recipe took this dependency from my build host)
>>>
>>>  ...c_build_helper-Split-cc-command-line.patch | 33 +++++++
>>>  ...wrapper-to-run-cross-compiled-binary.patch | 29 ++++++
>>>  .../mbedtls/mbedtls_4.1.0.bb                  | 88 +++++++++++++++++++
>>>  3 files changed, 150 insertions(+)
>>>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtl=
s/0001-c_build_helper-Split-cc-command-line.patch
>>>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtl=
s/0001-use-qemuwrapper-to-run-cross-compiled-binary.patch
>>>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtl=
s_4.1.0.bb
>>>
>>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-=
c_build_helper-Split-cc-command-line.patch b/meta-networking/recipes-connec=
tivity/mbedtls/mbedtls/0001-c_build_helper-Split-cc-command-line.patch
>>> new file mode 100644
>>> index 0000000000..adddb7ad8e
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-c_build=
_helper-Split-cc-command-line.patch
>>> @@ -0,0 +1,33 @@
>>> +From 178e089683bf42097ac6d27522820d07483bc6bd Mon Sep 17 00:00:00 2001
>>> +From: Gyorgy Sarvari <skandigraun@gmail.com>
>>> +Date: Thu, 23 Apr 2026 08:54:02 +0200
>>> +Subject: [PATCH] c_build_helper: Split cc command line
>>> +
>>> +Optionally the CC/HOSTCC environment variable can hold the command to
>>> +invoke the C compiler, however this command can also contain extra
>>> +arguments, not only the binary name. In this particular case Python
>>> +was treating the whole value as a single binary name, and was trying
>>> +to execute as such (e.g. "cc -arg1 -arg2" instead of "cc" and the argu=
ments
>>> +separately), which results in failure.
>>> +
>>> +Split the compiler command into its components to invoke it correctly.
>>> +
>>> +Upstream-Status: Submitted [https://github.com/Mbed-TLS/mbedtls-framew=
ork/pull/301]
>>> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>>> +---
>>> + scripts/mbedtls_framework/c_build_helper.py | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/scripts/mbedtls_framework/c_build_helper.py b/scripts/mbe=
dtls_framework/c_build_helper.py
>>> +index 59bb326e2..85dbb628f 100644
>>> +--- a/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper=
.py
>>> ++++ b/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper=
.py
>>> +@@ -98,7 +98,7 @@ def compile_c_file(c_filename, exe_filename, include=
_dirs):
>>> +     cc =3D os.getenv('HOSTCC', None)
>>> +     if cc is None:
>>> +         cc =3D os.getenv('CC', 'cc')
>>> +-    cmd =3D [cc]
>>> ++    cmd =3D cc.split()
>>> +
>>> +     proc =3D subprocess.Popen(cmd,
>>> +                             stdout=3Dsubprocess.DEVNULL,
>>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-=
use-qemuwrapper-to-run-cross-compiled-binary.patch b/meta-networking/recipe=
s-connectivity/mbedtls/mbedtls/0001-use-qemuwrapper-to-run-cross-compiled-b=
inary.patch
>>> new file mode 100644
>>> index 0000000000..a9e8bb2ed9
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-use-qem=
uwrapper-to-run-cross-compiled-binary.patch
>>> @@ -0,0 +1,29 @@
>>> +From 46f0ea3eb35e8d0d33e88298a9e7c3dbdd49ec17 Mon Sep 17 00:00:00 2001
>>> +From: Gyorgy Sarvari <skandigraun@gmail.com>
>>> +Date: Thu, 23 Apr 2026 09:14:40 +0200
>>> +Subject: [PATCH] use qemuwrapper to run cross-compiled binary
>>> +
>>> +The build process executes a compiled binary to get some details,
>>> +however this results in a failure in case of cross-compiling.
>>> +
>>> +Run it with qemuwrapper, that is created in the recipe.
>>> +
>>> +Upstream-Status: Inappropriate [cross-compile specific]
>>> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>>> +---
>>> + scripts/mbedtls_framework/c_build_helper.py | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/scripts/mbedtls_framework/c_build_helper.py b/scripts/mbe=
dtls_framework/c_build_helper.py
>>> +index 59bb326e2..5c4c211ee 100644
>>> +--- a/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper=
.py
>>> ++++ b/tf-psa-crypto/framework/scripts/mbedtls_framework/c_build_helper=
.py
>>> +@@ -169,7 +169,7 @@ def get_c_expression_values(
>>> +                              .format(caller, c_name))
>>> +         else:
>>> +             os.remove(c_name)
>>> +-        output =3D subprocess.check_output([exe_name])
>>> ++        output =3D subprocess.check_output(['../../../qemuwrapper', e=
xe_name])
>>> +         return output.decode('ascii').strip().split('\n')
>>> +     finally:
>>> +         remove_file_if_exists(exe_name)
>>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0=
.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb
>>> new file mode 100644
>>> index 0000000000..614016b0f1
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_4.1.0.bb
>>> @@ -0,0 +1,88 @@
>>> +SUMMARY =3D "Lightweight crypto and SSL/TLS library"
>>> +DESCRIPTION =3D "mbedtls is a lean open source crypto library         =
 \
>>> +for providing SSL and TLS support in your programs. It offers        \
>>> +an intuitive API and documented header files, so you can actually    \
>>> +understand what the code does. It features:                          \
>>> +                                                                     \
>>> + - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
>>> +   Camellia and XTEA                                                 \
>>> + - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
>>> + - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
>>> + - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
>>> +   ECDSA and ECDH                                                    \
>>> + - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
>>> + - Abstraction layers for ciphers, hashes, public key operations,    \
>>> +   platform abstraction and threading                                \
>>> +"
>>> +
>>> +HOMEPAGE =3D "https://www.trustedfirmware.org/projects/mbed-tls/"
>>> +BUGTRACKER =3D "https://github.com/Mbed-TLS/mbedtls/issues"
>>> +
>>> +LICENSE =3D "Apache-2.0 | GPL-2.0-or-later"
>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D379d5819937a6c2f1ef1630d341=
e026d"
>>> +
>>> +SECTION =3D "libs"
>>> +
>>> +SRC_URI =3D "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;=
branch=3Dmbedtls-4.1;tag=3Dv${PV} \
>>> +           file://run-ptest \
>>> +           file://0001-c_build_helper-Split-cc-command-line.patch \
>>> +           "
>>> +
>>> +SRC_URI:append:class-target =3D " file://0001-use-qemuwrapper-to-run-c=
ross-compiled-binary.patch"
>>> +
>>> +SRCREV =3D "0fe989b6b514192783c469039edd325fd0989806"
>>> +
>>> +DEPENDS +=3D "python3-jinja2-native python3-jsonschema-native qemu-nat=
ive"
>>> +
>>> +UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>>> +
>>> +inherit cmake ptest python3native qemu
>>> +
>>> +PACKAGECONFIG ??=3D "shared-libs programs ${@bb.utils.contains('PTEST_=
ENABLED', '1', 'tests', '', d)}"
>>> +PACKAGECONFIG[shared-libs] =3D "-DUSE_SHARED_MBEDTLS_LIBRARY=3DON,-DUS=
E_SHARED_MBEDTLS_LIBRARY=3DOFF"
>>> +PACKAGECONFIG[programs] =3D "-DENABLE_PROGRAMS=3DON,-DENABLE_PROGRAMS=
=3DOFF"
>>> +PACKAGECONFIG[werror] =3D "-DMBEDTLS_FATAL_WARNINGS=3DON,-DMBEDTLS_FAT=
AL_WARNINGS=3DOFF"
>>> +PACKAGECONFIG[tests] =3D "-DENABLE_TESTING=3DON,-DENABLE_TESTING=3DOFF=
"
>>> +
>>> +PROVIDES +=3D "polarssl"
>>> +RPROVIDES:${PN} =3D "polarssl"
>>> +
>>> +PACKAGES =3D+ "${PN}-programs"
>>> +FILES:${PN}-programs =3D "${bindir}/"
>>> +
>>> +BBCLASSEXTEND =3D "native nativesdk"
>>> +
>>> +CVE_PRODUCT =3D "mbed_tls"
>>> +
>>> +do_configure:prepend() {
>>> +       # during building tf-psa-crypto/framework/scripts/mbedtls_frame=
work/c_build_helper.py
>>> +       # runs some of the cross-compiled binaries.
>>> +
>>> +       qemu_binary=3D"${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR=
_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_LIBD=
IR}')])}"
>>> +       cat > ${WORKDIR}/qemuwrapper << EOF
>>> +#!/bin/sh
>>> +$qemu_binary "\$@"
>>> +EOF
>>> +
>>> +       chmod +x ${WORKDIR}/qemuwrapper
>>> +}
>>> +
>>> +# Strip host paths from autogenerated test files
>>> +do_compile:append() {
>>> +       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
>>> +       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
>>> +}
>>> +
>>> +# Export source files/headers needed by Arm Trusted Firmware
>>> +sysroot_stage_all:append() {
>>> +       sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/=
mbedtls-source/library"
>>> +       sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/=
mbedtls-source/include"
>>> +}
>>> +
>>> +do_install_ptest () {
>>> +       install -d ${D}${PTEST_PATH}/tests
>>> +       install -d ${D}${PTEST_PATH}/framework
>>> +       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
>>> +       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
>>> +       cp -fR ${S}/framework/data_files ${D}${PTEST_PATH}/framework/
>>> +}
>>>
>>>
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126610): https://lists.openembedded.org/g/openembedde=
d-devel/message/126610
> Mute This Topic: https://lists.openembedded.org/mt/118983952/3618097
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alex Kiernan

