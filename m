Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CC2C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 15:18:25 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.17147.1679325496235245241
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Mar 2023 08:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fV3n8pKK;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id q30so1815498oiw.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679325495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=celFIQCFfYBYQpTU2kisKpB/6dtHiEnLO/3QJfM7Q84=;
        b=fV3n8pKKmfWj5nfiB9V5hDSgojuA0BvWOacyWua+YGevfYnlOX3KeSuQuYZEov1F3q
         G/Gq4ShIKXvdK9PRNNRMHePWx9FWLOUfkrWUeBBXuX0S3IbLTPFcb55gsYYHtmT2BNls
         Q2QdziI1zOUks3MnHu3j8kV0D8ouY6FjBNHm8MiME/vTx4xrUTUbw0GRgnGPbBLbt7b1
         aL4qze1Ws7coVYv3rH0FtXVTUgiWPc+LDlGFEaTnLK6eTzIkvIO6qBPf7C+3LhvNQiLL
         kCsZLk4wpZqNBxn3tPY11A72qREtP1MoGk/3siHzFBoWUg3uQjk0XWQYQFKTur/XRkjK
         yHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679325495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=celFIQCFfYBYQpTU2kisKpB/6dtHiEnLO/3QJfM7Q84=;
        b=ZBXT3nLiq7hT7Ty2g6lLno4V++gSFWop6RFJIvEMkGVQNAXy4auCGqwOG4BzovXrPd
         Pd5T0AHngdS62K23XFikuZ/z+QKZzW5ld/yN3KIYU28GgArz/kRYMEWbh6/cn8vbtzaQ
         uXRxS0YKy8CIPp3gh5VyOSeP9PCYAZBsuUa7Za692w0omMXkhxBf+NQICFlI2hClCox7
         n/SZBwGZ4ReYu8dgLjf0LCLTBPyTfQE2oMXHpJEGN+ESLPd+HTK2Owlje8dvHWhL3+4V
         yXgNUCCJTegmfh4QX6bBkjbFBE6IRV3xf5BvQU+eFeKeKdetJHaV5y1fdKic78PdqelP
         8BpQ==
X-Gm-Message-State: AO0yUKX+XM7qbHaBTNgKcGDVLWb/+l38yQK3Eml86IeVcwhpo+jVlOQs
	sne4X63GXn57ficwnTgSWxsisNFBLN7oNfX5MjTu6mkG
X-Google-Smtp-Source: AK7set+d8xz95WL12thwum36QYPN7+r3bib/NH+MQuZqx/0TEcIOTK0tUChBgeRTLAZR20ZJzUpTxFfz4WMXZIpb6xg=
X-Received: by 2002:aca:281a:0:b0:383:f5df:9e85 with SMTP id
 26-20020aca281a000000b00383f5df9e85mr59478oix.4.1679325494718; Mon, 20 Mar
 2023 08:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230320085615.535596-1-yi.zhao@windriver.com>
In-Reply-To: <20230320085615.535596-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Mar 2023 08:17:48 -0700
Message-ID: <CAMKF1spjJSfYG8eAeKaAG-2C1My7ub7i2Z12=1Tq9CMVA6KDXA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mbedtls: add ptest
To: Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 15:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101611

On Mon, Mar 20, 2023 at 1:56=E2=80=AFAM Yi Zhao <yi.zhao@eng.windriver.com>=
 wrote:
>
> Results:
> $ ptest-runner mbedtls
> START: ptest-runner
> 2023-03-20T08:11
> BEGIN: /usr/lib/mbedtls/ptest
> PASS: test_suite_aes.cbc
> PASS: test_suite_aes.cfb
> PASS: test_suite_aes.ecb
> PASS: test_suite_aes.ofb
> PASS: test_suite_aes.rest
> PASS: test_suite_aes.xts
> PASS: test_suite_arc4
> PASS: test_suite_aria
> PASS: test_suite_asn1parse
> PASS: test_suite_asn1write
> PASS: test_suite_base64
> PASS: test_suite_bignum.generated
> PASS: test_suite_bignum.misc
> PASS: test_suite_blowfish
> PASS: test_suite_camellia
> PASS: test_suite_ccm
> PASS: test_suite_chacha20
> PASS: test_suite_chachapoly
> PASS: test_suite_cipher.aes
> PASS: test_suite_cipher.arc4
> PASS: test_suite_cipher.aria
> PASS: test_suite_cipher.blowfish
> PASS: test_suite_cipher.camellia
> PASS: test_suite_cipher.ccm
> PASS: test_suite_cipher.chacha20
> PASS: test_suite_cipher.chachapoly
> PASS: test_suite_cipher.des
> PASS: test_suite_cipher.gcm
> PASS: test_suite_cipher.misc
> PASS: test_suite_cipher.nist_kw
> PASS: test_suite_cipher.null
> PASS: test_suite_cipher.padding
> PASS: test_suite_cmac
> PASS: test_suite_constant_time
> PASS: test_suite_constant_time_hmac
> PASS: test_suite_ctr_drbg
> PASS: test_suite_debug
> PASS: test_suite_des
> PASS: test_suite_dhm
> PASS: test_suite_ecdh
> PASS: test_suite_ecdsa
> PASS: test_suite_ecjpake
> PASS: test_suite_ecp
> PASS: test_suite_entropy
> PASS: test_suite_error
> PASS: test_suite_gcm.aes128_de
> PASS: test_suite_gcm.aes128_en
> PASS: test_suite_gcm.aes192_de
> PASS: test_suite_gcm.aes192_en
> PASS: test_suite_gcm.aes256_de
> PASS: test_suite_gcm.aes256_en
> PASS: test_suite_gcm.camellia
> PASS: test_suite_gcm.misc
> PASS: test_suite_hkdf
> PASS: test_suite_hmac_drbg.misc
> PASS: test_suite_hmac_drbg.nopr
> PASS: test_suite_hmac_drbg.no_reseed
> PASS: test_suite_hmac_drbg.pr
> PASS: test_suite_md
> PASS: test_suite_mdx
> PASS: test_suite_memory_buffer_alloc
> PASS: test_suite_mps
> PASS: test_suite_net
> PASS: test_suite_nist_kw
> PASS: test_suite_oid
> PASS: test_suite_pem
> PASS: test_suite_pk
> PASS: test_suite_pkcs12
> PASS: test_suite_pkcs1_v15
> PASS: test_suite_pkcs1_v21
> PASS: test_suite_pkcs5
> PASS: test_suite_pkparse
> PASS: test_suite_pkwrite
> PASS: test_suite_poly1305
> PASS: test_suite_psa_crypto
> PASS: test_suite_psa_crypto_attributes
> PASS: test_suite_psa_crypto_driver_wrappers
> PASS: test_suite_psa_crypto_entropy
> PASS: test_suite_psa_crypto_generate_key.generated
> PASS: test_suite_psa_crypto_hash
> PASS: test_suite_psa_crypto_init
> PASS: test_suite_psa_crypto_metadata
> PASS: test_suite_psa_crypto_not_supported.generated
> PASS: test_suite_psa_crypto_not_supported.misc
> PASS: test_suite_psa_crypto_op_fail.generated
> PASS: test_suite_psa_crypto_op_fail.misc
> PASS: test_suite_psa_crypto_persistent_key
> PASS: test_suite_psa_crypto_se_driver_hal
> PASS: test_suite_psa_crypto_se_driver_hal_mocks
> PASS: test_suite_psa_crypto_slot_management
> PASS: test_suite_psa_crypto_storage_format.current
> PASS: test_suite_psa_crypto_storage_format.misc
> PASS: test_suite_psa_crypto_storage_format.v0
> PASS: test_suite_psa_its
> PASS: test_suite_random
> PASS: test_suite_rsa
> PASS: test_suite_shax
> PASS: test_suite_ssl
> PASS: test_suite_timing
> PASS: test_suite_version
> PASS: test_suite_x509parse
> PASS: test_suite_x509write
> PASS: test_suite_xtea
> DURATION: 83
> END: /usr/lib/mbedtls/ptest
> 2023-03-20T08:13
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../mbedtls/mbedtls/run-ptest                 | 124 ++++++++++++++++++
>  .../mbedtls/mbedtls_2.28.2.bb                 |  18 ++-
>  2 files changed, 138 insertions(+), 4 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/=
run-ptest
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-pte=
st b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
> new file mode 100644
> index 000000000..9d815fcd0
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
> @@ -0,0 +1,124 @@
> +#!/bin/sh
> +
> +# Valid tests to run
> +tests=3D"test_suite_aes.cbc \
> +       test_suite_aes.cfb \
> +       test_suite_aes.ecb \
> +       test_suite_aes.ofb \
> +       test_suite_aes.rest \
> +       test_suite_aes.xts \
> +       test_suite_arc4 \
> +       test_suite_aria \
> +       test_suite_asn1parse \
> +       test_suite_asn1write \
> +       test_suite_base64 \
> +       test_suite_bignum.generated \
> +       test_suite_bignum.misc \
> +       test_suite_blowfish \
> +       test_suite_camellia \
> +       test_suite_ccm \
> +       test_suite_chacha20 \
> +       test_suite_chachapoly \
> +       test_suite_cipher.aes \
> +       test_suite_cipher.arc4 \
> +       test_suite_cipher.aria \
> +       test_suite_cipher.blowfish \
> +       test_suite_cipher.camellia \
> +       test_suite_cipher.ccm \
> +       test_suite_cipher.chacha20 \
> +       test_suite_cipher.chachapoly \
> +       test_suite_cipher.des \
> +       test_suite_cipher.gcm \
> +       test_suite_cipher.misc \
> +       test_suite_cipher.nist_kw \
> +       test_suite_cipher.null \
> +       test_suite_cipher.padding \
> +       test_suite_cmac \
> +       test_suite_constant_time \
> +       test_suite_constant_time_hmac \
> +       test_suite_ctr_drbg \
> +       test_suite_debug \
> +       test_suite_des \
> +       test_suite_dhm \
> +       test_suite_ecdh \
> +       test_suite_ecdsa \
> +       test_suite_ecjpake \
> +       test_suite_ecp \
> +       test_suite_entropy \
> +       test_suite_error \
> +       test_suite_gcm.aes128_de \
> +       test_suite_gcm.aes128_en \
> +       test_suite_gcm.aes192_de \
> +       test_suite_gcm.aes192_en \
> +       test_suite_gcm.aes256_de \
> +       test_suite_gcm.aes256_en \
> +       test_suite_gcm.camellia \
> +       test_suite_gcm.misc \
> +       test_suite_hkdf \
> +       test_suite_hmac_drbg.misc \
> +       test_suite_hmac_drbg.nopr \
> +       test_suite_hmac_drbg.no_reseed \
> +       test_suite_hmac_drbg.pr \
> +       test_suite_md \
> +       test_suite_mdx \
> +       test_suite_memory_buffer_alloc \
> +       test_suite_mps \
> +       test_suite_net \
> +       test_suite_nist_kw \
> +       test_suite_oid \
> +       test_suite_pem \
> +       test_suite_pk \
> +       test_suite_pkcs12 \
> +       test_suite_pkcs1_v15 \
> +       test_suite_pkcs1_v21 \
> +       test_suite_pkcs5 \
> +       test_suite_pkparse \
> +       test_suite_pkwrite \
> +       test_suite_poly1305 \
> +       test_suite_psa_crypto \
> +       test_suite_psa_crypto_attributes \
> +       test_suite_psa_crypto_driver_wrappers \
> +       test_suite_psa_crypto_entropy \
> +       test_suite_psa_crypto_generate_key.generated \
> +       test_suite_psa_crypto_hash \
> +       test_suite_psa_crypto_init \
> +       test_suite_psa_crypto_metadata \
> +       test_suite_psa_crypto_not_supported.generated \
> +       test_suite_psa_crypto_not_supported.misc \
> +       test_suite_psa_crypto_op_fail.generated \
> +       test_suite_psa_crypto_op_fail.misc \
> +       test_suite_psa_crypto_persistent_key \
> +       test_suite_psa_crypto_se_driver_hal \
> +       test_suite_psa_crypto_se_driver_hal_mocks \
> +       test_suite_psa_crypto_slot_management \
> +       test_suite_psa_crypto_storage_format.current \
> +       test_suite_psa_crypto_storage_format.misc \
> +       test_suite_psa_crypto_storage_format.v0 \
> +       test_suite_psa_its \
> +       test_suite_random \
> +       test_suite_rsa \
> +       test_suite_shax \
> +       test_suite_ssl \
> +       test_suite_timing \
> +       test_suite_version \
> +       test_suite_x509parse \
> +       test_suite_x509write \
> +       test_suite_xtea \
> +      "
> +

Can this list be generated dynamically ? that will avoid this going
out of sync when a test is added/deleted
which might happen often.

> +ptestdir=3D$(dirname "$(readlink -f "$0")")
> +cd "$ptestdir"/tests || exit
> +
> +# Run specified tests
> +for f in $tests
> +do
> +    if test -e ./"$f"; then
> +        if ./"$f" > ./"$f".out 2> ./"$f".err; then
> +            echo "PASS: $f"
> +        else
> +            echo "FAIL: $f"
> +        fi
> +    else
> +        echo "SKIP: $f"
> +    fi
> +done
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.=
bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
> index e19587ca0..dc77ba0bf 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
> @@ -24,19 +24,22 @@ SECTION =3D "libs"
>
>  S =3D "${WORKDIR}/git"
>  SRCREV =3D "89f040a5c938985c5f30728baed21e49d0846a53"
> -SRC_URI =3D "git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branc=
h=3Dmbedtls-2.28"
> +SRC_URI =3D "git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branc=
h=3Dmbedtls-2.28 \
> +           file://run-ptest \
> +          "
>
> -inherit cmake update-alternatives
> +inherit cmake update-alternatives ptest
>
> -PACKAGECONFIG ??=3D "shared-libs programs"
> +PACKAGECONFIG ??=3D "shared-libs programs ${@bb.utils.contains('PTEST_EN=
ABLED', '1', 'tests', '', d)}"
>  PACKAGECONFIG[shared-libs] =3D "-DUSE_SHARED_MBEDTLS_LIBRARY=3DON,-DUSE_=
SHARED_MBEDTLS_LIBRARY=3DOFF"
>  PACKAGECONFIG[programs] =3D "-DENABLE_PROGRAMS=3DON,-DENABLE_PROGRAMS=3D=
OFF"
>  PACKAGECONFIG[werror] =3D "-DMBEDTLS_FATAL_WARNINGS=3DON,-DMBEDTLS_FATAL=
_WARNINGS=3DOFF"
>  # Make X.509 and TLS calls use PSA
>  # https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-cryp=
to.md
>  PACKAGECONFIG[psa] =3D ""
> +PACKAGECONFIG[tests] =3D "-DENABLE_TESTING=3DON,-DENABLE_TESTING=3DOFF"
>
> -EXTRA_OECMAKE =3D "-DENABLE_TESTING=3DOFF -DLIB_INSTALL_DIR:STRING=3D${l=
ibdir}"
> +EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR:STRING=3D${libdir}"
>
>  # For now the only way to enable PSA is to explicitly pass a -D via CFLA=
GS
>  CFLAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -DMBED=
TLS_USE_PSA_CRYPTO', '', d)}"
> @@ -64,3 +67,10 @@ sysroot_stage_all:append() {
>         sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/mb=
edtls-source/library"
>         sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/mb=
edtls-source/include"
>  }
> +
> +do_install_ptest () {
> +       install -d ${D}${PTEST_PATH}/tests
> +       install ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
> +       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
> +       cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
> +}
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101605): https://lists.openembedded.org/g/openembedde=
d-devel/message/101605
> Mute This Topic: https://lists.openembedded.org/mt/97727127/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

