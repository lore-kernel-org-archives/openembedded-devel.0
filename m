Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.44538.1598625817399137263
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 07:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sDRnx+OF;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 67so545206pgd.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2020 07:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/jTLuahqXe2z8bZjz6cDF2/Ct3u9zgDzBUh69GaUNoA=;
        b=sDRnx+OFYrIdIKmRnudC+PHVb7yvQNwWPeRadSZYtttCsU/ovURT6VpwQeF1vgT7Ld
         F5i3qdU0/1vgF941E4qE4DkZW769Noa3AsfqKrLkaAPAecEZeJpJ2qNQ35K4QlJBdb4l
         QEW2+LC0kEM18rIMHWWrvWmW1wvh8+rEEypklyWe7oZfhxThiv5T8QWcd9xv2SD99LJo
         HPXLerpXld6IUJ2XR92BDZ9xwNOoIvB2Too4ZdeuD6yHcHYNMz4My+f0dfiUhqUawXqi
         Zn4PaLE89rOHonk6sarL2lv+5nFZg8vdJhOx6el5dMPTgq1ndgZ5U5A9jKQd6NOa4z5F
         zPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/jTLuahqXe2z8bZjz6cDF2/Ct3u9zgDzBUh69GaUNoA=;
        b=QIQwT5xxbjtnqK9C/Io+Y3N34Y1Ec4XUseWVNjOXteRQOsMFK4QmXvYmk/67QNdl6o
         SIHyEDi4D7aeN6Byg3o3RH32eIZsSZ3hAgT38DZK4XbVjo3nzVGldQkWEtRN7cvVTY5Q
         FD80t/2PsAXcUQ4HPihORtH8N9u4i7bWMxefbukA9z5a8zjue3U267PlNQI7IK8tIXij
         Kr6Av67gMRQThbsPtkrymXG/2iZ75URwx+y8DwEMLod32UCwWUNYVfK6bYg0hB+TjEHf
         UI8NWc8UllwSxLcXXeuScF790ajWU87hMQULIoUiJJmFjmKXCITqwVXDTERkSLypi1sk
         0hzQ==
X-Gm-Message-State: AOAM531+/O7Ubkz1zP1kQGBI85ed91L4YCc3LJZPpzOzr9ia6ir2s9bZ
	ncU3rl5e1uH0zEtLLmJ4EWpIPUaTOBE=
X-Google-Smtp-Source: ABdhPJygAtrJeetpmfVyO+W+HQs0HHWlordd33w9pyPu8Dnprst7WPYe5ASbB6hMAkfra6r8jEWYEQ==
X-Received: by 2002:a62:648c:: with SMTP id y134mr1523507pfb.114.1598625816631;
        Fri, 28 Aug 2020 07:43:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:74ef:893c:fcae:e3a1? ([2601:202:4180:a5c0:74ef:893c:fcae:e3a1])
        by smtp.gmail.com with ESMTPSA id fz19sm1440264pjb.40.2020.08.28.07.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 07:43:36 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH v2] nss: Upgrade to 3.56
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200828020411.1988431-1-raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
 Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
 mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
 aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
 mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
 C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
 Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
 7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
 dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
 FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
 IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
 FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
 vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
 ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
 IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
 g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
 rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
 FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
 wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
 t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
 aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
 oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
 Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
 37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
 0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
 IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
 0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
 0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
 ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
 UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
 Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
 AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
 mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
 ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
 vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
 JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
 EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
 dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
 /mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
 PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
 ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
 8CS2NxU=
Message-ID: <eca6954a-0a7d-8990-70ab-2b141c53ce69@gmail.com>
Date: Fri, 28 Aug 2020 07:43:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828020411.1988431-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/27/20 7:04 PM, Khem Raj wrote:
> Forward port 0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Update armv8 hw crypto patch to work on arm32

Did you add this to an image?

I am seeing new error when nss is appended to an image.

WARNING: security-build-image-1.0-r0 do_rootfs: nss.postinst returned 127, marking as unpacked only, configuration required on target.
2020-08-28 02:07:33 - ERROR    - ERROR: security-build-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['nss'] have failed. If the intention is to defer them to first boot,
2020-08-28 02:07:33 - ERROR    - then please place them into pkg_postinst_ontarget_${PN} ().
2020-08-28 02:07:33 - ERROR    - Deferring to first boot via 'exit 1' is no longer supported.

- Armin

>
>  ...figure-option-to-disable-ARM-HW-cryp.patch | 32 ++++++-------------
>  .../nss/{nss_3.54.bb => nss_3.56.bb}          |  3 +-
>  2 files changed, 11 insertions(+), 24 deletions(-)
>  rename meta-oe/recipes-support/nss/{nss_3.54.bb => nss_3.56.bb} (99%)
>
> diff --git a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> index 1a87a0577f..f1f76bd1b7 100644
> --- a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> +++ b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> @@ -14,21 +14,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   nss/lib/freebl/gcm.c    | 2 ++
>   2 files changed, 6 insertions(+)
>  
> -diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
> -index f99f769..b0ec81b 100644
>  --- a/nss/lib/freebl/Makefile
>  +++ b/nss/lib/freebl/Makefile
> -@@ -125,6 +125,9 @@ else
> -         DEFINES += -DNSS_X86
> +@@ -126,6 +126,8 @@ else
>   endif
>   endif
> -+
> + ifdef NS_USE_GCC
>  +ifdef NSS_USE_ARM_HW_CRYPTO
>  +    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
>   ifeq ($(CPU_ARCH),aarch64)
> -     DEFINES += -DUSE_HW_AES -DUSE_HW_SHA2
> -     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c sha256-armv8.c
> -@@ -148,6 +151,7 @@ endif
> +     DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
> +     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c sha1-armv8.c sha256-armv8.c
> +@@ -150,6 +152,7 @@ endif
>           endif
>       endif
>   endif
> @@ -36,23 +33,14 @@ index f99f769..b0ec81b 100644
>   
>   ifeq ($(OS_TARGET),OSF1)
>       DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
> -diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
> -index c2cc18d..b77f573 100644
>  --- a/nss/lib/freebl/gcm.c
>  +++ b/nss/lib/freebl/gcm.c
> -@@ -18,6 +18,7 @@
> +@@ -20,7 +20,7 @@
>   
> - #include <limits.h>
> - 
> -+#ifdef NSS_USE_ARM_HW_CRYPTO
>   /* old gcc doesn't support some poly64x2_t intrinsic */
>   #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
> -     (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
> -@@ -27,6 +28,7 @@
> - /* We don't test on big endian platform, so disable this on big endian. */
> +-    (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
> ++    (defined(__clang__) && defined(NSS_USE_ARM_HW_CRYPTO) || defined(__GNUC__) && __GNUC__ > 6)
>   #define USE_ARM_GCM
> - #endif
> -+#endif
> - 
> - /* Forward declarations */
> - SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
> + #elif defined(__arm__) && defined(IS_LITTLE_ENDIAN) && \
> +     !defined(NSS_DISABLE_ARM32_NEON)
> diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb b/meta-oe/recipes-support/nss/nss_3.56.bb
> similarity index 99%
> rename from meta-oe/recipes-support/nss/nss_3.54.bb
> rename to meta-oe/recipes-support/nss/nss_3.56.bb
> index 1cc94735bb..4aa5d29ec2 100644
> --- a/meta-oe/recipes-support/nss/nss_3.54.bb
> +++ b/meta-oe/recipes-support/nss/nss_3.56.bb
> @@ -34,8 +34,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
>             file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
>             file://0001-pkix-Do-not-use-NULL-where-0-is-needed.patch \
>             "
> -
> -SRC_URI[sha256sum] = "dab18bbfcf5e347934cda664df75ce9fd912a5772686c40d3c805e53c08d6e43"
> +SRC_URI[sha256sum] = "f875e0e8ed3b5ce92d675be4a55aa25a8c1199789a4a01f69b5f2327e2048e9c"
>  
>  UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
>  UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
>
> 

