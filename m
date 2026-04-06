Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E0BF46C5E
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 17:06:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60028.1775495210172996576
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 10:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NRiz/Iov;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b9d3ebed5so3633034f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 10:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775495208; x=1776100008; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nwHn4WoXcU1u0nx0cNTea+zxzH8Jf6iIgtJ6/hYatsM=;
        b=NRiz/IovgVKxSN+0xwjZTfMBAER4WEvZ0IvMkci/0/QJ+JjrRX8vqjJb2j4NvAXOQG
         LWfNTjxUQB8NVSKsMlvcSf/wl+2Zj0d7jYvErnEMoE3ifuJdSk8dRsaYWCyW3h0cVxRO
         KoTOZUbp/OoZRk1PDtSFSenCixd0/4vyjO+GhZbFEzx4Ydl+HU7PslMeCpWe+GeylLRk
         puwBeaQOqGmXGCN9QGKbouJquKCLYCpEBVzmN9AIZkzh/U1KNhCuFv5pf1T0jET7MhZN
         CXxQwfRQapq+679ipEtui45VqyFD4qJadBD8W//Ookz5nOkZLJW0pjC1rFHE6b5LBwYk
         BdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775495208; x=1776100008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwHn4WoXcU1u0nx0cNTea+zxzH8Jf6iIgtJ6/hYatsM=;
        b=LLRfgXt//eGyfqHMhBbIsZrVnokSDgua2+Rbnh0OaG0FTQ6rLOWDkMtSIAMjvo6/6R
         2oaOyl53wE+em5sZb/JkOrUTjw9C93DjC2VcZN+8WjB04VQgVkv1nJivwP/Y76kxFAwr
         Pk1BHkyTgKbKr0vXkzwv2hVLw3GKUslwQGZq6+j8w7vihW4YNSqZlV6iuM4hn0yTAFr6
         ezKVY7XLxi83SRs/6maZhkCGrBJZfWxQU1UQWJDLCMV+SnGUAwT8ebhYs97YWYkbFPzn
         D7hyiHB3hTjz6hON7G4QPRfX2LDSHdQJpVyGLzTHAgG27YilJICcTcAg9YZu+EN2I49Z
         C3RA==
X-Gm-Message-State: AOJu0YwA+kfslgCQL0ZpSbosqu8I0QONQxh8ftgc+HcNxNMI+FmO2lUb
	B0Yqj1PmxKAFtluxVvs45DN/FUzMrVxWo4t9RDoCUICePbDDimYOA3lw
X-Gm-Gg: AeBDieuUziaom50eYV29S2e7Q4IwnufmP7YO2S5AKUUXzNgKulmg3SU/LPrLw560ea5
	BgvrBE1+ER22AlCxGB8Pf+YbrgE4Gi4TqUIs6ICz7/sDr1aoKnz3foyFgA7W+e6pWLf1ImdMvpl
	NECJJvEDR/yI68uSoaj7tc+iproZZRzv7Ft3BcDeXosUp2WuEfob7liBaG55ISfZ3PnNYf5IzpI
	cMfXUpuhmZVgaUE92++8tvK1SBlLQ4Z8zgu0AK1rW+uXnLkHDwK4ytC/isAikTsJ1lGy7EzHGN/
	ZeyKfEWgHAEwA0bgxorRchHlZBvzLhnPiTUY/wysHiCIaXqk/OUk4sWzoFCr7S6SZzj1o5/N+L+
	Xfr0MPp2RAVlkqbUPBfhIqUXC1z+KYt5huSl3Y4kwOB2JmO8GbymQO6V3auvAEimoDjCXQ9zZGg
	Twesmbk/z3ppDFMdb9vROabP65KXO0pNUBNh29F9F+oA==
X-Received: by 2002:a05:6000:46:b0:43d:3060:5d0f with SMTP id ffacd0b85a97d-43d3060e9f9mr11203537f8f.2.1775495208179;
        Mon, 06 Apr 2026 10:06:48 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5468sm41795213f8f.13.2026.04.06.10.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 10:06:47 -0700 (PDT)
Message-ID: <e9d4e5d2-37b3-4cd5-9c5f-28b9e8a00824@gmail.com>
Date: Mon, 6 Apr 2026 19:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH 1/2] mbedtls: drop recipe for v2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260406141500.3557451-1-skandigraun@gmail.com>
 <CAMKF1spYETBv05ax4eGpxW5==dY3DmAScE7tVMqLYiYHiqiVeQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1spYETBv05ax4eGpxW5==dY3DmAScE7tVMqLYiYHiqiVeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 17:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126057


On 4/6/26 18:57, Khem Raj wrote:
> I think we should drop it since upcoming release it LTS and carrying an
> EOL package is not good. I also wonder if we should be adding recipe for
> 4.x release, is it backward compatible to 3.x ? if not maybe a second
> recipe.
> 


Yes, I started to look at 4.x, I also think it would be nice to get in,
because 3.x has only a year of support left. I was thinking leaving 3.x,
but making the new one the default. It was giving me some errors that I
managed to solve, and then it gave me some new very weird errors... plan
to try again soon, unless someone else is faster.


> On Mon, Apr 6, 2026 at 7:15 AM Gyorgy Sarvari via lists.openembedded.org
> <http://lists.openembedded.org>
> <skandigraun=gmail.com@lists.openembedded.org
> <mailto:gmail.com@lists.openembedded.org>> wrote:
> 
>     It has been unmaintained/EOL for over a year - there is
>     a recipe for a newer, still supported version.
> 
>     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com
>     <mailto:skandigraun@gmail.com>>
>     ---
>      .../mbedtls/mbedtls_2.28.10.bb <http://mbedtls_2.28.10.bb>         
>           | 79 -------------------
>      1 file changed, 79 deletions(-)
>      delete mode 100644 meta-networking/recipes-connectivity/mbedtls/
>     mbedtls_2.28.10.bb <http://mbedtls_2.28.10.bb>
> 
>     diff --git a/meta-networking/recipes-connectivity/mbedtls/
>     mbedtls_2.28.10.bb <http://mbedtls_2.28.10.bb> b/meta-networking/
>     recipes-connectivity/mbedtls/mbedtls_2.28.10.bb <http://
>     mbedtls_2.28.10.bb>
>     deleted file mode 100644
>     index b126aee7db..0000000000
>     --- a/meta-networking/recipes-connectivity/mbedtls/
>     mbedtls_2.28.10.bb <http://mbedtls_2.28.10.bb>
>     +++ /dev/null
>     @@ -1,79 +0,0 @@
>     -SUMMARY = "Lightweight crypto and SSL/TLS library"
>     -DESCRIPTION = "mbedtls is a lean open source crypto library          \
>     -for providing SSL and TLS support in your programs. It offers        \
>     -an intuitive API and documented header files, so you can actually    \
>     -understand what the code does. It features:                          \
>     -                                                                     \
>     - - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
>     -   Camellia and XTEA                                                 \
>     - - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
>     - - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
>     - - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
>     -   ECDSA and ECDH                                                    \
>     - - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
>     - - Abstraction layers for ciphers, hashes, public key operations,    \
>     -   platform abstraction and threading                                \
>     -"
>     -
>     -HOMEPAGE = "https://tls.mbed.org/ <https://tls.mbed.org/>"
>     -
>     -LICENSE = "Apache-2.0 | GPL-2.0-or-later"
>     -LIC_FILES_CHKSUM = "file://
>     LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
>     -
>     -SECTION = "libs"
>     -
>     -SRCREV = "2fc8413bfcb51354c8e679141b17b3f1a5942561"
>     -SRC_URI = "git://github.com/Mbed-TLS/
>     mbedtls.git;protocol=https;branch=archive/mbedtls-2.28;tag=${BPN}
>     <http://github.com/Mbed-TLS/
>     mbedtls.git;protocol=https;branch=archive/mbedtls-2.28;tag=$%7BBPN%7D> \
>     -           file://run-ptest \
>     -          "
>     -
>     -inherit cmake update-alternatives ptest
>     -
>     -PACKAGECONFIG ??= "shared-libs programs
>     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
>     -PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-
>     DUSE_SHARED_MBEDTLS_LIBRARY=OFF"
>     -PACKAGECONFIG[programs] = "-DENABLE_PROGRAMS=ON,-DENABLE_PROGRAMS=OFF"
>     -PACKAGECONFIG[werror] = "-DMBEDTLS_FATAL_WARNINGS=ON,-
>     DMBEDTLS_FATAL_WARNINGS=OFF"
>     -# Make X.509 and TLS calls use PSA
>     -# https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-
>     psa-crypto.md
>     -PACKAGECONFIG[psa] <https://github.com/Mbed-TLS/mbedtls/blob/
>     development/docs/use-psa-crypto.md-PACKAGECONFIG%5Bpsa%5D> = ""
>     -PACKAGECONFIG[tests] = "-DENABLE_TESTING=ON,-DENABLE_TESTING=OFF"
>     -
>     -EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:STRING=${libdir}"
>     -
>     -# For now the only way to enable PSA is to explicitly pass a -D via
>     CFLAGS
>     -CFLAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -
>     DMBEDTLS_USE_PSA_CRYPTO', '', d)}"
>     -
>     -PROVIDES += "polarssl"
>     -RPROVIDES:${PN} = "polarssl"
>     -
>     -PACKAGES =+ "${PN}-programs"
>     -FILES:${PN}-programs = "${bindir}/"
>     -
>     -ALTERNATIVE:${PN}-programs = "${@bb.utils.contains('PACKAGECONFIG',
>     'programs', 'hello', '', d)}"
>     -ALTERNATIVE_LINK_NAME[hello] = "${bindir}/hello"
>     -
>     -BBCLASSEXTEND = "native nativesdk"
>     -
>     -CVE_PRODUCT = "mbed_tls"
>     -
>     -CVE_STATUS[CVE-2021-43666] = "backported-patch: Fix merged upstream
>     https://github.com/Mbed-TLS/mbedtls/pull/5310 <https://github.com/
>     Mbed-TLS/mbedtls/pull/5310>"
>     -CVE_STATUS[CVE-2021-45451] = "backported-patch: Fix merged upstream
>     https://github.com/Mbed-TLS/mbedtls/
>     commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c <https://github.com/
>     Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c>"
>     -
>     -# Strip host paths from autogenerated test files
>     -do_compile:append() {
>     -       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
>     -       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
>     -}
>     -
>     -# Export source files/headers needed by Arm Trusted Firmware
>     -sysroot_stage_all:append() {
>     -       sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/
>     share/mbedtls-source/library"
>     -       sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/
>     share/mbedtls-source/include"
>     -}
>     -
>     -do_install_ptest () {
>     -       install -d ${D}${PTEST_PATH}/tests
>     -       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
>     -       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
>     -       cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
>     -}
> 
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#126045): https://lists.openembedded.org/g/
>     openembedded-devel/message/126045 <https://lists.openembedded.org/g/
>     openembedded-devel/message/126045>
>     Mute This Topic: https://lists.openembedded.org/mt/118690748/1997914
>     <https://lists.openembedded.org/mt/118690748/1997914>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/
>     unsub <https://lists.openembedded.org/g/openembedded-devel/unsub>
>     [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>     -=-=-=-=-=-=-=-=-=-=-=-
> 


