Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BD8CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 12:57:30 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.37631.1697201846195880330
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 05:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bMYlKsAs;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40684f53bfcso20937245e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697201844; x=1697806644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rpw0leb/KtvFjBk4fTn257YKp+wd0T8g4PrUcZ30bFM=;
        b=bMYlKsAsbLrQUJmmHoWG6Ij3Mmv1OmYJEL/f6S+Cmlq+rE71e7W/t4kfugh5+D7o49
         qev1qgENg8IMOzASg0b2IPSZhQ9ibd0h8wBGPiXa6tN4J+AunVvvpxePozQ2DhTxRTJY
         fNpOqjGsdN3ls4c7liL25oiX/mpbvuxu779V5tgjZVfINcH3Je0JRfHC4U6a630zOmdl
         8wVhttoPzOZNtEVfxR9xFanT48fgPg+L5t+sqG7TW0FWHtdOYucIyEkdBx2JuoYp7Gng
         5kyHKb7RsZNqhSEYsqgPWbqhaR2n28H9peTMfFoEhDx1mu53bLrI92y55hygwvyKABwp
         dz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697201844; x=1697806644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rpw0leb/KtvFjBk4fTn257YKp+wd0T8g4PrUcZ30bFM=;
        b=qcjH44G3LwH/FHTyO6+YjWMiRaLUwbtxguTItwyQKc4tOhwQHhqqUcnGZ+EPYpH0f7
         wdnTGFyvTQYfA2U/zVG41Fa99V0dc23bQabf5gDD2juCuIUFrcD4RZosCR48t4dIkz+v
         fMA7VdNNiCd5Og7nsy3GJjHM9TpiC7hQh3RoS4glCsbScNjXs9RaZrVSkLYlt8nIEFE7
         jeBUIfvGpxYBCPLHS3CkwUWkeeuGDL7xH0hsQbjYT7YFY3cHKqxyM8RRFnwfT1okX9L7
         laLuPuVfzpon2K4VYVnNrUlsSh0bTUl4YmRC5zvU5HjzU+qRwwz5Zy91dfKrwarSPF4U
         iFOw==
X-Gm-Message-State: AOJu0YwG4upY8iesZpIwQiYHDsFb5DmXZPJ8bmCdm4hNaIsfE/k/RtCl
	bg2zaiMxXYEJCdVPWz6wtvAmmFnLwPbvOFSi
X-Google-Smtp-Source: AGHT+IFTKUsQnBPOkwGOKAStitIdnxPzaPvcIPkR70yWnZzsp1AByWz0jV2lyygFsKrVoU+xDTGeeQ==
X-Received: by 2002:a05:600c:b49:b0:406:7232:1431 with SMTP id k9-20020a05600c0b4900b0040672321431mr23505394wmr.33.1697201844031;
        Fri, 13 Oct 2023 05:57:24 -0700 (PDT)
Received: from uk-l1.. (cpc147796-finc20-2-0-cust5.4-2.cable.virginm.net. [86.20.236.6])
        by smtp.gmail.com with ESMTPSA id t16-20020a05600c199000b00403b63e87f2sm51491wmq.32.2023.10.13.05.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 05:57:23 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH v2] mbedtls: upgrade 3.4.1 -> 3.5.0
Date: Fri, 13 Oct 2023 13:57:05 +0100
Message-Id: <20231013125705.322898-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 12:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105466

API changes
   * Mbed TLS 3.4 introduced support for omitting the built-in implementation
     of ECDSA and/or EC J-PAKE when those are provided by a driver. However,
     their was a flaw in the logic checking if the built-in implementation, in
     that if failed to check if all the relevant curves were supported by the
     accelerator. As a result, it was possible to declare no curves as
     accelerated and still have the built-in implementation compiled out.
     Starting with this release, it is necessary to declare which curves are
     accelerated (using MBEDTLS_PSA_ACCEL_ECC_xxx macros), or they will be
     considered not accelerated, and the built-in implementation of the curves
     and any algorithm possible using them will be included in the build.
   * Add new millisecond time type `mbedtls_ms_time_t` and `mbedtls_ms_time()`
     function, needed for TLS 1.3 ticket lifetimes. Alternative implementations
     can be created using an ALT interface.

Requirement changes
   * Officially require Python 3.8 now that earlier versions are out of support.
   * Minimum required Windows version is now Windows Vista, or
     Windows Server 2008.

New deprecations
   * PSA_WANT_KEY_TYPE_xxx_KEY_PAIR and
     MBEDTLS_PSA_ACCEL_KEY_TYPE_xxx_KEY_PAIR, where xxx is either ECC or RSA,
     are now being deprecated in favor of PSA_WANT_KEY_TYPE_xxx_KEY_PAIR_yyy and
     MBEDTLS_PSA_ACCEL_KEY_TYPE_xxx_KEY_PAIR_yyy. Here yyy can be: BASIC,
     IMPORT, EXPORT, GENERATE, DERIVE. The goal is to have a finer detail about
     the capabilities of the PSA side for either key.
   * MBEDTLS_CIPHER_BLKSIZE_MAX is deprecated in favor of
     MBEDTLS_MAX_BLOCK_LENGTH (if you intended what the name suggests:
     maximum size of any supported block cipher) or the new name
     MBEDTLS_CMAC_MAX_BLOCK_SIZE (if you intended the actual semantics:
     maximum size of a block cipher supported by the CMAC module).
   * mbedtls_pkcs5_pbes2() and mbedtls_pkcs12_pbe() functions are now
     deprecated in favor of mbedtls_pkcs5_pbes2_ext() and
     mbedtls_pkcs12_pbe_ext() as they offer more security by checking
     for overflow of the output buffer and reporting the actual length
     of the output.

Features
   * All modules that use hashes or HMAC can now take advantage of PSA Crypto
     drivers when MBEDTLS_PSA_CRYPTO_C is enabled and psa_crypto_init() has
     been called. Previously (in 3.3), this was restricted to a few modules,
     and only in builds where MBEDTLS_MD_C was disabled; in particular the
     entropy module was not covered which meant an external RNG had to be
     provided - these limitations are lifted in this version. A new set of
     feature macros, MBEDTLS_MD_CAN_xxx, has been introduced that can be used
     to check for availability of hash algorithms, regardless of whether
     they're provided by a built-in implementation, a driver or both. See
     docs/driver-only-builds.md.
   * When a PSA driver for ECDH is present, it is now possible to disable
     MBEDTLS_ECDH_C in the build in order to save code size. For TLS 1.2
     key exchanges based on ECDH(E) to work, this requires
     MBEDTLS_USE_PSA_CRYPTO. Restartable/interruptible ECDHE operations in
     TLS 1.2 (ECDHE-ECDSA key exchange) are not supported in those builds yet,
     as PSA does not have an API for restartable ECDH yet.
   * When all of ECDH, ECDSA and EC J-PAKE are either disabled or provided by
     a driver, it is possible to disable MBEDTLS_ECP_C (and MBEDTLS_BIGNUM_C
     if not required by another module) and still get support for ECC keys and
     algorithms in PSA, with some limitations. See docs/driver-only-builds.txt
     for details.
   * Add parsing of directoryName subtype for subjectAltName extension in
     x509 certificates.
   * Add support for server-side TLS version negotiation. If both TLS 1.2 and
     TLS 1.3 protocols are enabled, the TLS server now selects TLS 1.2 or
     TLS 1.3 depending on the capabilities and preferences of TLS clients.
     Fixes #6867.
   * X.509 hostname verification now supports IPAddress Subject Alternate Names.
   * Add support for reading and writing X25519 and X448
     public and private keys in RFC 8410 format using the existing PK APIs.
   * When parsing X.509 certificates, support the extensions
     SignatureKeyIdentifier and AuthorityKeyIdentifier.
   * Don't include the PSA dispatch functions for PAKEs (psa_pake_setup() etc)
     if no PAKE algorithms are requested
   * Add support for the FFDH algorithm and DH key types in PSA, with
     parameters from RFC 7919. This includes a built-in implementation based
     on MBEDTLS_BIGNUM_C, and a driver dispatch layer enabling alternative
     implementations of FFDH through the driver entry points.
   * It is now possible to generate certificates with SubjectAltNames.
     Currently supported subtypes: DnsName, UniformResourceIdentifier,
     IP address, OtherName, and DirectoryName, as defined in RFC 5280.
     See mbedtls_x509write_crt_set_subject_alternative_name for
     more information.
   * X.509 hostname verification now partially supports URI Subject Alternate
     Names. Only exact matching, without any normalization procedures
     described in 7.4 of RFC5280, will result in a positive URI verification.
   * Add function mbedtls_oid_from_numeric_string() to parse an OID from a
     string to a DER-encoded mbedtls_asn1_buf.
   * Add SHA-3 family hash functions.
   * Add support to restrict AES to 128-bit keys in order to save code size.
     A new configuration option, MBEDTLS_AES_ONLY_128_BIT_KEY_LENGTH, can be
     used to enable this feature.
   * AES performance improvements. Uplift varies by platform,
     toolchain, optimisation flags and mode.
     Aarch64, gcc -Os and CCM, GCM and XTS benefit the most.
     On Aarch64, uplift is typically around 20 - 110%.
     When compiling with gcc -Os on Aarch64, AES-XTS improves
     by 4.5x.
   * Add support for PBKDF2-HMAC through the PSA API.
   * New symbols PSA_WANT_KEY_TYPE_xxx_KEY_PAIR_yyy and
     MBEDTLS_PSA_ACCEL_KEY_TYPE_xxx_KEY_PAIR_yyy (where xxx is either ECC, RSA
     or DH) were introduced in order to have finer accuracy in defining the
     PSA capabilities for each key. These capabilities, named yyy above, can be
     any of: BASIC, IMPORT, EXPORT, GENERATE, DERIVE.
     - DERIVE is only available for ECC keys, not for RSA or DH ones.
     - implementations are free to enable more than what it was strictly
       requested. For example BASIC internally enables IMPORT and EXPORT
       (useful for testing purposes), but this might change in the future.
   * Add support for FFDH key exchange in TLS 1.3.
     This is automatically enabled as soon as PSA_WANT_ALG_FFDH
     and the ephemeral or psk-ephemeral key exchange mode are enabled.
     By default, all groups are offered; the list of groups can be
     configured using the existing API function mbedtls_ssl_conf_groups().
   * Improve mbedtls_x509_time performance and reduce memory use.
   * Reduce syscalls to time() during certificate verification.
   * Allow MBEDTLS_CONFIG_FILE and MBEDTLS_USER_CONFIG_FILE to be set by
     setting the CMake variable of the same name at configuration time.
   * Add getter (mbedtls_ssl_cache_get_timeout()) to access
     `mbedtls_ssl_cache_context.timeout`.
   * Add getter (mbedtls_ssl_get_hostname()) to access
     `mbedtls_ssl_context.hostname`.
   * Add getter (mbedtls_ssl_conf_get_endpoint()) to access
     `mbedtls_ssl_config.endpoint`.
   * Support for "opaque" (PSA-held) ECC keys in the PK module has been
     extended: it is now possible to use mbedtls_pk_write_key_der(),
     mbedtls_pk_write_key_pem(), mbedtls_pk_check_pair(), and
     mbedtls_pk_verify() with opaque ECC keys (provided the PSA attributes
     allow it).
   * The documentation of mbedtls_ecp_group now describes the optimized
     representation of A for some curves. Fixes #8045.
   * Add a possibility to generate CSR's with RCF822 and directoryName subtype
     of subjectAltName extension in x509 certificates.
   * Add support for PBKDF2-CMAC through the PSA API.
   * New configuration option MBEDTLS_AES_USE_HARDWARE_ONLY introduced. When
     using CPU-accelerated AES (e.g., Arm Crypto Extensions), this option
     disables the plain C implementation and the run-time detection for the
     CPU feature, which reduces code size and avoids the vulnerability of the
     plain C implementation.
   * Accept arbitrary AttributeType and AttributeValue in certificate
     Distinguished Names using RFC 4514 syntax.
   * Applications using ECC over secp256r1 through the PSA API can use a
     new implementation with a much smaller footprint, but some minor
     usage restrictions. See the documentation of the new configuration
     option MBEDTLS_PSA_P256M_DRIVER_ENABLED for details.

Security
   * Fix a case where potentially sensitive information held in memory would not
     be completely zeroized during TLS 1.2 handshake, in both server and client
     configurations.
   * In configurations with ARIA or Camellia but not AES, the value of
     MBEDTLS_CIPHER_BLKSIZE_MAX was 8, rather than 16 as the name might
     suggest. This did not affect any library code, because this macro was
     only used in relation with CMAC which does not support these ciphers.
     This may affect application code that uses this macro.
   * Developers using mbedtls_pkcs5_pbes2() or mbedtls_pkcs12_pbe() should
     review the size of the output buffer passed to this function, and note
     that the output after decryption may include CBC padding. Consider moving
     to the new functions mbedtls_pkcs5_pbes2_ext() or mbedtls_pkcs12_pbe_ext()
     which checks for overflow of the output buffer and reports the actual
     length of the output.
   * Improve padding calculations in CBC decryption, NIST key unwrapping and
     RSA OAEP decryption. With the previous implementation, some compilers
     (notably recent versions of Clang and IAR) could produce non-constant
     time code, which could allow a padding oracle attack if the attacker
     has access to precise timing measurements.
   * Updates to constant-time C code so that compilers are less likely to use
     conditional instructions, which can have an observable difference in
     timing. (Clang has been seen to do this.) Also introduce assembly
     implementations for 32- and 64-bit Arm and for x86 and x86-64, which are
     guaranteed not to use conditional instructions.
   * Fix definition of MBEDTLS_MD_MAX_BLOCK_SIZE, which was too
     small when MBEDTLS_SHA384_C was defined and MBEDTLS_SHA512_C was
     undefined. Mbed TLS itself was unaffected by this, but user code
     which used MBEDTLS_MD_MAX_BLOCK_SIZE could be affected. The only
     release containing this bug was Mbed TLS 3.4.0.
   * Fix a buffer overread when parsing short TLS application data records in
     null-cipher cipher suites. Credit to OSS-Fuzz.
   * Fix a remotely exploitable heap buffer overflow in TLS handshake parsing.
     In TLS 1.3, all configurations are affected except PSK-only ones, and
     both clients and servers are affected.
     In TLS 1.2, the affected configurations are those with
     MBEDTLS_USE_PSA_CRYPTO and ECDH enabled but DHM and RSA disabled,
     and only servers are affected, not clients.
     Credit to OSS-Fuzz.

Bugfix
   * Fix proper sizing for PSA_EXPORT_[KEY_PAIR/PUBLIC_KEY]_MAX_SIZE and
     PSA_SIGNATURE_MAX_SIZE buffers when at least one accelerated EC is bigger
     than all built-in ones and RSA is disabled.
     Resolves #6622.
   * Add missing md.h includes to some of the external programs from
     the programs directory. Without this, even though the configuration
     was sufficient for a particular program to work, it would only print
     a message that one of the required defines is missing.
   * Fix declaration of mbedtls_ecdsa_sign_det_restartable() function
     in the ecdsa.h header file. There was a build warning when the
     configuration macro MBEDTLS_ECDSA_SIGN_ALT was defined.
     Resolves #7407.
   * Fix an error when MBEDTLS_ECDSA_SIGN_ALT is defined but not
     MBEDTLS_ECDSA_VERIFY_ALT, causing ecdsa verify to fail. Fixes #7498.
   * Fix missing PSA initialization in sample programs when
     MBEDTLS_USE_PSA_CRYPTO is enabled.
   * Fix the J-PAKE driver interface for user and peer to accept any values
     (previously accepted values were limited to "client" or "server").
   * Fix clang and armclang compilation error when targeting certain Arm
     M-class CPUs (Cortex-M0, Cortex-M0+, Cortex-M1, Cortex-M23,
     SecurCore SC000). Fixes #1077.
   * Fix "unterminated '#pragma clang attribute push'" in sha256/sha512.c when
     built with MBEDTLS_SHAxxx_USE_A64_CRYPTO_IF_PRESENT but don't have a
     way to detect the crypto extensions required. A warning is still issued.
   * Fixed an issue that caused compile errors when using CMake and the IAR
     toolchain.
   * Fix very high stack usage in SSL debug code. Reported by Maximilian
     Gerhardt in #7804.
   * Fix a compilation failure in the constant_time module when
     building for arm64_32 (e.g., for watchos). Reported by Paulo
     Coutinho in #7787.
   * Fix crypt_and_hash decryption fail when used with a stream cipher
     mode of operation due to the input not being multiple of block size.
     Resolves #7417.
   * Fix a bug in which mbedtls_x509_string_to_names() would return success
     when given a invalid name string if it did not contain '=' or ','.
   * Fix compilation warnings in aes.c, which prevented the
     example TF-M configuration in configs/ from building cleanly:
     tfm_mbedcrypto_config_profile_medium.h with
     crypto_config_profile_medium.h.
   * In TLS 1.3, fix handshake failure when a client in its ClientHello
     proposes an handshake based on PSK only key exchange mode or at least
     one of the key exchange modes using ephemeral keys to a server that
     supports only the PSK key exchange mode.
   * Fix CCM* with no tag being not supported in a build with CCM as the only
     symmetric encryption algorithm and the PSA configuration enabled.
   * Fix the build with MBEDTLS_PSA_INJECT_ENTROPY. Fixes #7516.
   * Fix a compilation error on some platforms when including mbedtls/ssl.h
     with all TLS support disabled. Fixes #6628.
   * Fix x509 certificate generation to conform to RFC 5480 / RFC 5758 when
     using ECC key. The certificate was rejected by some crypto frameworks.
     Fixes #2924.
   * Fix a potential corruption of the passed-in IV when mbedtls_aes_crypt_cbc()
     is called with zero length and padlock is not enabled.
   * Fix compile failure due to empty enum in cipher_wrap.c, when building
     with a very minimal configuration. Fixes #7625.
   * Fix some cases where mbedtls_mpi_mod_exp, RSA key construction or ECDSA
     signature can silently return an incorrect result in low memory conditions.
   * Don't try to include MBEDTLS_PSA_CRYPTO_USER_CONFIG_FILE when
     MBEDTLS_PSA_CRYPTO_CONFIG is disabled.
   * Fix IAR compiler warnings.
   * Fix an issue when parsing an otherName subject alternative name into a
     mbedtls_x509_san_other_name struct. The type-id of the otherName was not
     copied to the struct. This meant that the struct had incomplete
     information about the otherName SAN and contained uninitialized memory.
   * Fix the detection of HardwareModuleName otherName SANs. These were being
     detected by comparing the wrong field and the check was erroneously
     inverted.
   * Fix a build error in some configurations with MBEDTLS_PSA_CRYPTO_CONFIG
     enabled, where some low-level modules required by requested PSA crypto
     features were not getting automatically enabled. Fixes #7420.
   * Fix undefined symbols in some builds using TLS 1.3 with a custom
     configuration file.
   * Fix log level for the got supported group message. Fixes #6765
   * Functions in the ssl_cache module now return a negative MBEDTLS_ERR_xxx
     error code on failure. Before, they returned 1 to indicate failure in
     some cases involving a missing entry or a full cache.
   * mbedtls_pk_parse_key() now rejects trailing garbage in encrypted keys.
   * Fix the build with CMake when Everest or P256-m is enabled through
     a user configuration file or the compiler command line. Fixes #8165.

Changes
   * Enable Arm / Thumb bignum assembly for most Arm platforms when
     compiling with gcc, clang or armclang and -O0.
   * Enforce minimum RSA key size when generating a key
     to avoid accidental misuse.
   * Use heap memory to allocate DER encoded RSA private key.
     This reduces stack usage significantly for RSA signature
     operations when MBEDTLS_PSA_CRYPTO_C is defined.
   * Update Windows code to use BCryptGenRandom and wcslen, and
     ensure that conversions between size_t, ULONG, and int are
     always done safely.  Original contribution by Kevin Kane #635, #730
     followed by Simon Butcher #1453.
   * Users integrating their own PSA drivers should be aware that
     the file library/psa_crypto_driver_wrappers.c has been renamed
     to psa_crypto_driver_wrappers_no_static.c.
   * When using CBC with the cipher module, the requirement to call
     mbedtls_cipher_set_padding_mode() is now enforced. Previously, omitting
     this call accidentally applied a default padding mode chosen at compile
     time.

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 ...cify-an-arch-version-when-enabling-c.patch | 33 ------------------
 ...t-target-attribute-when-building-wit.patch | 34 -------------------
 .../{mbedtls_3.4.1.bb => mbedtls_3.5.0.bb}    |  4 +--
 3 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
 delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.4.1.bb => mbedtls_3.5.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
deleted file mode 100644
index 44d74754c..000000000
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2246925e3cb16183e25d4e2cfd13fb800df86270 Mon Sep 17 00:00:00 2001
-From: Beniamin Sandu <beniaminsandu@gmail.com>
-Date: Sun, 25 Jun 2023 19:58:08 +0300
-Subject: [PATCH] aesce: do not specify an arch version when enabling crypto
- instructions
-
-Building mbedtls with different aarch64 tuning variations revealed
-that we should use the crypto extensions without forcing a particular
-architecture version or core, as that can create issues.
-
-Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/471a975942dec76bf0ccb92b6c6da055385683fb]
-
-Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
----
- library/aesce.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/library/aesce.c b/library/aesce.c
-index fe056dc4c..843de3973 100644
---- a/library/aesce.c
-+++ b/library/aesce.c
-@@ -60,7 +60,7 @@
- #           error "A more recent GCC is required for MBEDTLS_AESCE_C"
- #       endif
- #       pragma GCC push_options
--#       pragma GCC target ("arch=armv8-a+crypto")
-+#       pragma GCC target ("+crypto")
- #       define MBEDTLS_POP_TARGET_PRAGMA
- #   else
- #       error "Only GCC and Clang supported for MBEDTLS_AESCE_C"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
deleted file mode 100644
index c8f6cb750..000000000
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 03d3523f974536f2358047382aadb0d4cc762f8a Mon Sep 17 00:00:00 2001
-From: Beniamin Sandu <beniaminsandu@gmail.com>
-Date: Mon, 26 Jun 2023 12:07:21 +0300
-Subject: [PATCH] aesce: use correct target attribute when building with clang
-
-Seems clang has its own issues when it comes to crypto extensions,
-and right now the best way to avoid them is to accurately enable
-the needed instructions instead of the broad crypto feature.
-
-E.g.: https://github.com/llvm/llvm-project/issues/61645
-
-Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/aa4f6219014d863bed51453e5261178adc66be34]
-
-Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
----
- library/aesce.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/library/aesce.c b/library/aesce.c
-index 843de3973..7bea088ba 100644
---- a/library/aesce.c
-+++ b/library/aesce.c
-@@ -53,7 +53,7 @@
- #       if __clang_major__ < 4
- #           error "A more recent Clang is required for MBEDTLS_AESCE_C"
- #       endif
--#       pragma clang attribute push (__attribute__((target("crypto"))), apply_to=function)
-+#       pragma clang attribute push (__attribute__((target("aes"))), apply_to=function)
- #       define MBEDTLS_POP_TARGET_PRAGMA
- #   elif defined(__GNUC__)
- #       if __GNUC__ < 6
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
index a6f8583b2..1fd187ab2 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
@@ -23,10 +23,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "72718dd87e087215ce9155a826ee5a66cfbe9631"
+SRCREV = "1ec69067fa1351427f904362c1221b31538c8b57"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
-	file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch \
-	file://0002-aesce-use-correct-target-attribute-when-building-wit.patch \
 	file://run-ptest"
 
 inherit cmake update-alternatives ptest
-- 
2.34.1


