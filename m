Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49487106ACF9
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 19:31:37 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16317.1773516687853998736
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 12:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P/l3Y91/;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48535a0ef86so27126055e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 12:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773516686; x=1774121486; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9HkS8Jk9wV2x5T89r31TyNbNYitzBFN2w5QY3Bu2kk=;
        b=P/l3Y91/tq8v3IdfNP84nQ30mbYpTij42ZHtjbhbHO/TSSNSF/2EJetkpoxreex9N+
         hE+oui/Wh8qZhZJjNLQIpPHQdvortHdGJNd0kJB2BVok8PVW8daA7M+rGa4wc3R29GT+
         8VAfdM+Uw5irhvZfvPy18FuweDHrP+ErhYmcphpNkFvaoC+OLGjrT2bRrcyVrRJ570Jh
         n+lnnC35rwECB8WcCH3oopAJaPyaeEppT013l1HkJFtMTHvSgaEeKsU9gpbw8oFu8fOu
         93gsXuS0NFQqn0lOoS5VVESf/uwb73USKPez5WFNzW2CtFFMw/jXy0ojwLorgb8odubf
         Oh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773516686; x=1774121486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9HkS8Jk9wV2x5T89r31TyNbNYitzBFN2w5QY3Bu2kk=;
        b=Jg+RVIFOSeppM8v6MSNSqNo4cR/TBLLFkHVkSCBa6OUzgHLLCoq52t6zPUS39b5D38
         nyg4D8myVgFtTrsHD7xqVcJ8V2QrwwgoWmn5Mg4Beq5DL1/qn5i9Ucnz/ro06Q1Dt83h
         PXYnfmigSS+dqiMgAymu97iTbEglZa+jQ150a4yyyn8x1glQqoT6HCirOhaaIzzdOZa9
         5EuvF4ASQ/EfKvyl7pIbMjJDPISR4x6Pzz7tBFcV/Nl6Vhr2nycKL4wBYysnQ5sGBe0n
         2dQ8oqhFQibU76Cm97R9kluLCdf9UJ9ouVv9s+o6yPCGmYISe8vxiq6rsmajOPxYdB0x
         rLPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG7klViQpmpHBqCOggqGEW9uUyKU4SKYwWchtJCc49ewZ2GvFIfofRswXFsjXnxFGIPKZ415CVBhuMTME6FTjD+7A=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy99gYjPAayGryFSIk6DY5/Y8mkZQluPEZPsR/Ruos6pw9zow0H
	oCYRwNdQ3VfrUq/vYBiGTXNq8eBCeK3NIUONZgiONSCWZ3ANocGT5rhL
X-Gm-Gg: ATEYQzznvzoFDSWw6XXdFrSl0bw1NA+YdLPXDiNZQkMLobpD7z7ND9iWYY5XNZXGL+i
	Ps/6J9l8/ddGmEOo1Z5Ln1mmUIupU4a4KVoslpghc+Q8zl8oBSlR0wbI6B7hY/C3kpcWIRU8CwI
	zR1s71YzW7joRlayGM3Qb126VzdO56iC4bqmAda6zahRH6ugdAHFkopcy163JBruNf7vdhDouYO
	rrnomKM4oJfEBACJZMzpBLPfS6XbrK5ARyhxHvQ+jeeTpUySIm5aZv0XdPVQAKbOKDs1+99lP2y
	sifk9BOMwMFZKBaykDcPQkIsRB3n23DLzuzoSCwSv+rxdP6hRcynmOJ73O/JKbo2vx3XRq7yKbm
	jqvhpRaf4QUqeStfeuw4Onk5HIRPvmT5vbM1AMfWP+p+2o4cbXuHgEzd04q16qXq9hiWFNFiXhI
	Zr2yLre8qS5APnv2Fm5I4iZzaLt7teZV8=
X-Received: by 2002:a05:600c:8b6f:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-485566d92f3mr127047125e9.10.1773516685951;
        Sat, 14 Mar 2026 12:31:25 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6c69fsm53351585e9.26.2026.03.14.12.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 12:31:25 -0700 (PDT)
Message-ID: <0aab0196-c89e-4a9c-8048-9c2ff203ea32@gmail.com>
Date: Sat, 14 Mar 2026 20:31:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 07/14] libsodium: upgrade 1.0.20 -> 1.0.21
To: andrej.kozemcak@siemens.com, openembedded-devel@lists.openembedded.org
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
 <20260309100630.404637-7-andrej.kozemcak@siemens.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260309100630.404637-7-andrej.kozemcak@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 19:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125213

It seems that this update fails for aarch64:
https://gist.github.com/OldManYellsAtCloud/3e80a812b4342a990f76c42bb17a6ba4


On 3/9/26 11:06, Andrej Kozemcak via lists.openembedded.org wrote:
> License-Update: copyright years refreshed
> 
> Removed patch included in this release
> 
> Changelog:
>   https://github.com/jedisct1/libsodium/releases/tag/1.0.21-RELEASE
> 
> Changes:
> 
> Version 1.0.21
> - security fix for the crypto_core_ed25519_is_valid_point() function
> - new crypto_ipcrypt_* functions
> - sodium_bin2ip and sodium_ip2bin helper functions
> - XOF: the crypto_xof_shake* and crypto_xof_turboshake* functions
> 
> Version 1.0.20-stable
> - XCFramework: cross-compilation is now forced on Apple Silicon to avoid Rosetta-related build issues
> - The Fil-C compiler is supported out of the box
> - The CompCert compiler is supported out of the box
> - MSVC 2026 (Visual Studio 2026) is now supported
> - Zig builds now support FreeBSD targets
> - Performance of AES256-GCM and AEGIS on ARM has been improved with some compilers
> - Android binaries have been added to the NuGet package
> - Windows ARM binaries have been added to the NuGet package
> - The Android build script has been improved. The base SDK is now 27c, and the default platform is 21, supporting 16 KB page sizes.
> - The library can now be compiled with Zig 0.15 and Zig 0.16
> - Zig builds now generate position-independent static libraries by default on targets that support PIC
> - arm64e builds have been added to the XCFramework packages
> - XCFramework packages are now full builds instead of minimal builds
> - MSVC builds have been enabled for ARM64
> - iOS 32-bit (armv7/armv7s) support has been removed from the XCFramework build script
> - Security: optblockers have been introduced in critical code paths to prevent compilers from introducing unwanted side channels via conditional jumps. This was observed on RISC-V targets with specific compilers and options.
> - Security: crypto_core_ed25519_is_valid_point() now properly rejects small-order points that are not in the main subgroup
> - ((nonnull)) attributes have been relaxed on some crypto_stream* functions to allow NULL output buffers when the output length is zero
> - A cross-compilation issue with old clang versions has been fixed
> - JavaScript: support for Cloudflare Workers has been added
> - JavaScript: WASM_BIGINT is forcibly disabled to retain compatibility with older runtimes
> - A compilation issue with old toolchains on Solaris has been fixed
> - crypto_aead_aes256gcm_is_available is exported to JavaScript
> - libsodium is now compatible with Emscripten 4.x
> - Security: memory fences have been added after MAC verification in AEAD to prevent speculative access to plaintext before authentication is complete
> - Assembly files now include .gnu.property notes for proper IBT and Shadow Stack support when building with CET instrumentation.
> 
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---
>  .../libsodium/libsodium/CVE-2025-69277.patch  | 61 -------------------
>  ...ibsodium_1.0.20.bb => libsodium_1.0.21.bb} |  5 +-
>  2 files changed, 2 insertions(+), 64 deletions(-)
>  delete mode 100644 meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch
>  rename meta-oe/recipes-crypto/libsodium/{libsodium_1.0.20.bb => libsodium_1.0.21.bb} (58%)
> 
> diff --git a/meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch b/meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch
> deleted file mode 100644
> index a2ced62760..0000000000
> --- a/meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From ad3004ec8731730e93fcfbbc824e67eadc1c1bae Mon Sep 17 00:00:00 2001
> -From: Frank Denis <github@pureftpd.org>
> -Date: Mon, 29 Dec 2025 23:22:15 +0100
> -Subject: [PATCH] core_ed25519_is_valid_point: check Y==Z in addition to X==0
> -
> -CVE: CVE-2025-69277
> -Upstream-Status: Backport [https://github.com/jedisct1/libsodium/commit/ad3004ec8731730e93fcfbbc824e67eadc1c1bae]
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c | 5 ++++-
> - test/default/core_ed25519.c                             | 7 ++++++-
> - 2 files changed, 10 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c b/src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c
> -index d3020132..4b824f6d 100644
> ---- a/src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c
> -+++ b/src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c
> -@@ -1141,10 +1141,13 @@ int
> - ge25519_is_on_main_subgroup(const ge25519_p3 *p)
> - {
> -     ge25519_p3 pl;
> -+    fe25519    t;
> - 
> -     ge25519_mul_l(&pl, p);
> - 
> --    return fe25519_iszero(pl.X);
> -+    fe25519_sub(t, pl.Y, pl.Z);
> -+
> -+    return fe25519_iszero(pl.X) & fe25519_iszero(t);
> - }
> - 
> - int
> -diff --git a/test/default/core_ed25519.c b/test/default/core_ed25519.c
> -index bc457493..02f72bd6 100644
> ---- a/test/default/core_ed25519.c
> -+++ b/test/default/core_ed25519.c
> -@@ -13,6 +13,10 @@ static const unsigned char max_canonical_p[32] = {
> -     0xe4, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> -     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f
> - };
> -+static const unsigned char not_main_subgroup_p[32] = {
> -+    0x95, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99,
> -+    0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99
> -+};
> - static const unsigned char L_p1[32] = {
> -     0xee, 0xd3, 0xf5, 0x5c, 0x1a, 0x63, 0x12, 0x58, 0xd6, 0x9c, 0xf7, 0xa2, 0xde, 0xf9, 0xde, 0x14,
> -     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10
> -@@ -133,11 +137,12 @@ main(void)
> -     assert(crypto_core_ed25519_is_valid_point(p) == 0);
> - 
> -     p[0] = 9;
> --    assert(crypto_core_ed25519_is_valid_point(p) == 1);
> -+    assert(crypto_core_ed25519_is_valid_point(p) == 0);
> - 
> -     assert(crypto_core_ed25519_is_valid_point(max_canonical_p) == 1);
> -     assert(crypto_core_ed25519_is_valid_point(non_canonical_invalid_p) == 0);
> -     assert(crypto_core_ed25519_is_valid_point(non_canonical_p) == 0);
> -+    assert(crypto_core_ed25519_is_valid_point(not_main_subgroup_p) == 0);
> - 
> -     memcpy(p2, p, crypto_core_ed25519_BYTES);
> -     add_P(p2);
> diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.20.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.21.bb
> similarity index 58%
> rename from meta-oe/recipes-crypto/libsodium/libsodium_1.0.20.bb
> rename to meta-oe/recipes-crypto/libsodium/libsodium_1.0.21.bb
> index 972b8b8694..5616dbc55e 100644
> --- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.20.bb
> +++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.21.bb
> @@ -2,12 +2,11 @@ SUMMARY = "The Sodium crypto library"
>  HOMEPAGE = "http://libsodium.org/"
>  BUGTRACKER = "https://github.com/jedisct1/libsodium/issues"
>  LICENSE = "ISC"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c59be7bb29f8e431b5f2d690b6734185"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4942a8ebbbc7f2212bd68a47df264a4f"
>  
>  SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
> -SRC_URI[sha256sum] = "ebb65ef6ca439333c2bb41a0c1990587288da07f6c7fd07cb3a18cc18d30ce19"
> +SRC_URI[sha256sum] = "9e4285c7a419e82dedb0be63a72eea357d6943bc3e28e6735bf600dd4883feaf"
>  
> -SRC_URI += "file://CVE-2025-69277.patch"
>  
>  inherit autotools
>  
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124985): https://lists.openembedded.org/g/openembedded-devel/message/124985
> Mute This Topic: https://lists.openembedded.org/mt/118218630/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


