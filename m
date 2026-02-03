Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0D1E83072
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 09:56:04 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13067.1770112554642884222
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 01:55:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H21QszQ8;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-45effa36208so3803980b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 01:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770112554; cv=none;
        d=google.com; s=arc-20240605;
        b=EvKtGIIWlnIhCjUseQNNJwqDaERu1cq/zUapt3EzzvzRmpdq+1WmJW1GGn82gqgcmJ
         QCG78MNj/+2lZPqbXGkK6htcj8rvckCXnNwEg9sNKwdmhSNhn2xJwtmkMTPUzhY4tlrd
         1O6WKp4tPmcdxbg6hj/4hEZFSwFKg9W1+38A2QawDC9HqRBjymI/MpbjlL1p33RWpVkm
         qw0teOK5Mmn/JmD0oJ10b8uV+BrODVD1WWoyOBiZwCr+RXNgGFeAaNl2mjzzNz7T2bW4
         h7cuCQfHm8RNVCt0TdOdqgOZ2GPhltnwwJC0EW9cKT7PBixjDWXZFSahtHl9uqFCzRiB
         d/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kyc0vYoj8dYIyd/9OpA0Z2k6CpK2LIiKwzVWJOUGLgU=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=VsbRJWDxH9vuG6x7G/ybVcZk+TUuqmWzohEElyuFskkJg3ZUePbzUfyIgL7ttf2XHJ
         YuC8CLq2YJGXtUmjvNABf7VegtarfcO5s2iej/qb17nclHKF+CvMUIqJaKeegjQO490U
         Wqw50Pc/PhOagugg81DOBMjYNeYa8GTxIhk4BNWHJTeIAA4G7Z7h0pBoOfqz1yv4J0t1
         sUAUVDfjbChUXvWN4Y6BOHPI1+AE4OF/YG4qpSjJmiRb/8GUjkRbDWu7Gw43sLzJ7XLV
         CpZS8yqo+untxobKvbyc+UCC6XPCkk/wJu+lmJ+HSXNAu2ityail/F7GeuCWH4bHCByz
         y3tQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770112554; x=1770717354; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kyc0vYoj8dYIyd/9OpA0Z2k6CpK2LIiKwzVWJOUGLgU=;
        b=H21QszQ8F9XkcdIMkMxP1xHqrM72Oi/Bj2AK4L2ecl58QRvnknkDALihIy12q6mY4m
         lQgCRRhRf1uL1eZkEMaEZxGmlBuATWU115sw7VJbDCmt9Vg7CM6PGEcciMoMKttjLdPc
         LHWk5mJbV1dw7WtA5Ih2/IMr1N2lgtdjGukyfOXV9uST3hG7O/Ml1rCxAjYknc/9V8kW
         0YrlRkPT9dFOEYLA79yyBHRJCAh6HNFIlyUj5DdyfV4TU10SFdMC1rZexxwnXKZ2kfF5
         /c0GhyJVmsmk4a8RfQEMTcVOq0IcwtQJuVCw2fFeQsS26KGaGn3589RuVVXvivJYEJfe
         BSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770112554; x=1770717354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kyc0vYoj8dYIyd/9OpA0Z2k6CpK2LIiKwzVWJOUGLgU=;
        b=MtSAAu6gnOE1nAcOsSrE0rtNHXE550A/Jl1GCIKFEfF7lS0cJD9xVpc2h4PnCKmpPF
         q97fiXN+yfqhBRLehkllPJ5y2T8W2+oXZdO5OUwW30/mDfwOFp1aC+NNJBpTWAys4w/M
         78o+JewFHM0d6Lk7tw2QdpJGWwt/FzfvAL/AS9dtchEI2omYc9gRZWY5/0C3+a8+3mc3
         ZJnz/MgySKbeMe71wBtDrz7SE+/eIYh0Qu0iK9dwj6kiyXbdBr6tIkzCR0UQH4OK7xqq
         Sk9tW4S/+5YXQaErqgcsqL/BOTNwMYCxVluIciVg0hYL45N3P2gp8f0w0zeGej64TD4c
         bJVg==
X-Gm-Message-State: AOJu0Yz0XagDn2WoPRD6D+CMvXneO/5fvRn5iINiEJsuWVMt4SGqVVP6
	oHc3tvjuNT/mke000nEfmGncKHTzxfL5MpSoFROnxwpLozK2I+B0sFggdg5HuNWuObWiz8w2RSi
	HxQysWYPemjnmOHB3RnpFZ2y9q223uzy9vdRR
X-Gm-Gg: AZuq6aIulfpquimvT9aWIIqOl9061Utd4xkNolAh/nOPIKGs+DES621qarIkPbOJsxj
	OY6sREiG/bPAc1Q2WOT7KVqoWEUL4eA4vLD44Q/7tlZ2p4j3mpOh7CMC/ziAokVvElqjbd4SF69
	rS3XgUKRPWtupUoncRAkVBHraKk6065oH7+8+KVx2y/yUWw+cAhImuZRy1aIrIEHc07uNZWCPBI
	xbXR+7pMsI2u2Dv3nG6AVDnqMVmzn+sGWAGi1vwZ5v4z1tXMDE3tqJSdkWDZAme69DnN1iS
X-Received: by 2002:a4a:ee19:0:b0:663:4f6:a61d with SMTP id
 006d021491bc7-6630f04006bmr6172522eaf.30.1770112553834; Tue, 03 Feb 2026
 01:55:53 -0800 (PST)
MIME-Version: 1.0
References: <20260202211401.1287664-1-skandigraun@gmail.com> <20260202211401.1287664-13-skandigraun@gmail.com>
In-Reply-To: <20260202211401.1287664-13-skandigraun@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 3 Feb 2026 22:55:42 +1300
X-Gm-Features: AZwV_Qj2RsV_cVX4tqwXOX0ObiPiPXlvX1CQQvDQ84p7TM4yDrRsrs7uICCcW7s
Message-ID: <CADySD0EAw8EY+gHxRU23RLn+2=pKfda1YWWuis1z1DXeAF6-UQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][whinlatter][PATCH 13/15] nodejs: upgrade 22.21.1
 -> 22.22.0
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 09:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124098

Hi Gyorgy,

Getting following error when building for qemux86 with musl and clang

| /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-linux-=
musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686=
-poky-linux-musl-ld:
/usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/bits/atomi=
c_base.h:1090:(.text._ZN2v88internal12_GLOBAL__N_120ElementsAccessorBaseINS=
1_21TypedElementsAccessorILNS0_12ElementsKindE37EdEENS1_18ElementsKindTrait=
sILS4_37EEEE27CopyTypedArrayElementsSliceENS0_6TaggedINS0_12JSTypedArrayEEE=
SB_jj+0xe05):
undefined reference to `__atomic_store'
| /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-linux-=
musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686=
-poky-linux-musl-ld:
/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-linux-mu=
sl/nodejs/22.22.0/sources/node-v22.22.0/out/Release/obj.host/v8_base_withou=
t_compiler/deps/v8/src/objects/elements.o:
in function `std::remove_volatile<double>::type
std::__atomic_impl::load<double>(double const*, std::memory_order)':
| /usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/bits/ato=
mic_base.h:1099:(.text._ZN2v88internal12_GLOBAL__N_121TypedElementsAccessor=
ILNS0_12ElementsKindE37EdE15GetInternalImplEPNS0_7IsolateENS0_6HandleINS0_8=
JSObjectEEENS0_13InternalIndexE+0x7c):
undefined reference to `__atomic_load'
| /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-linux-=
musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686=
-poky-linux-musl-ld:
/usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/bits/atomi=
c_base.h:1099:(.text._ZN2v88internal12_GLOBAL__N_120ElementsAccessorBaseINS=
1_21TypedElementsAccessorILNS0_12ElementsKindE38EhEENS1_18ElementsKindTrait=
sILS4_38EEEE27CopyTypedArrayElementsSliceENS0_6TaggedINS0_12JSTypedArrayEEE=
SB_jj+0x549):
undefined reference to `__atomic_load'

Can you please have a look into it?

cheers
Ankur


On Tue, Feb 3, 2026 at 10:14=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Jason Schonberg <schonm@gmail.com>
>
> This is the December 2025 security release that the nodejs team released
> January 13, 2026.
>
>   3 high severity issues.
>   4 medium severity issues.
>   1 low severity issue.
>
> High priority fixes:
>   CVE-2025-55131
>   CVE-2025-55130
>   CVE-2025-59465
>
> Medium priority fixes:
>   CVE-2025-59466
>   CVE-2025-59464
>   CVE-2026-21636 *
>   CVE-2026-21637
>
> Low priority fixes:
>   CVE-2025-55132
>
> * note that this medium priority CVE only effects Nodejs v25.
>
> https://nodejs.org/en/blog/vulnerability/december-2025-security-releases
>
> Changelog: https://github.com/nodejs/node/releases/tag/v22.22.0
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 0bb156371e433cf3e9fdc4291da2319d63a83575)
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../oe-npm-cache                                                | 0
>  ...oe-cache-native_22.21.bb =3D> nodejs-oe-cache-native_22.22.bb} | 0
>  .../nodejs/{nodejs_22.21.1.bb =3D> nodejs_22.22.0.bb}             | 2 +-
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.21 =3D> nodej=
s-oe-cache-22.22}/oe-npm-cache (100%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.21.bb =
=3D> nodejs-oe-cache-native_22.22.bb} (100%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.21.1.bb =3D> nodejs_22=
.22.0.bb} (98%)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.21/oe-npm=
-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-npm-cache
> similarity index 100%
> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.21/oe-npm-=
cache
> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-npm-ca=
che
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.21=
.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.22.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.21.=
bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.22.bb
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_22.22.0.bb
> similarity index 98%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
> index ccaf9f7bb2..443cdc430d 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
> @@ -39,7 +39,7 @@ SRC_URI:append:class-target =3D " \
>  SRC_URI:append:toolchain-clang:powerpc64le =3D " \
>             file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
>             "
> -SRC_URI[sha256sum] =3D "487d73fd4db00dc2420d659a8221b181a7937fbc5bc73f31=
c30b1680ad6ded6a"
> +SRC_URI[sha256sum] =3D "4c138012bb5352f49822a8f3e6d1db71e00639d0c36d5b67=
56f91e4c6f30b683"
>
>  S =3D "${UNPACKDIR}/node-v${PV}"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124086): https://lists.openembedded.org/g/openembedde=
d-devel/message/124086
> Mute This Topic: https://lists.openembedded.org/mt/117604901/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

