Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D871C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 18:06:51 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.759.1701799610714104244
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Dec 2023 10:06:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FBRZUZdm;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6d9a1a2fb22so1530304a34.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 10:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701799610; x=1702404410; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKxQux8K9fGLXSOW9VQex9m+qk0dMKnUYaV2ff2WOls=;
        b=FBRZUZdmt8m+C1Y4xlZmGIIZ5tdxjXGkLarhuEgFrEzJ8YSF7iI4QmQ08Os6EBEPqD
         bYCLqzcm0ktpkmPMbB/n2HR+kD3rGGbYLPsbyaq/4NmMISoUr/DqyXNLSQ/w3xEFuFL6
         aOI92K+g6OFBrSfB7Rw9vkKhsGdkJaaTTz9bNyIBQicRPcufsJTR54ljmQx97M4HrXya
         XssBsvoHSpzLeWqMhrUuTLxotBKEnjQ66n0LvrmhJtRb9vbsT71QF7Kj/cJ2nje0bGXj
         McdV0Dyfzs4MS3xeB5EGh9iEzGs45ANcNhBppvKUInfNX/EO1tdW8pOCR85YDQdUZ9cf
         Vh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799610; x=1702404410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKxQux8K9fGLXSOW9VQex9m+qk0dMKnUYaV2ff2WOls=;
        b=SS6F/2TQDk6c/Xukgm9t0MAdoCSHpqMEDBbai/P+jE17vZQh+fWSDvBFA6PSnsRiPe
         9NnhJma+XFMMhOmBDnmzgVatGGsNBv7YcrteC6E+WJsot+SsWDwavJTsKsvDwRdNmmrQ
         HbN/28s67eVCG6QSVNQDUhyJO73nIbxV9rRY8tVNYOQgiqaVgYWcGP8XWaF4U8V0GMTr
         hYTiR1BouQJX0/6LIO2xzTbQpUR83AItAgNvf53MeOtTELLCMYOWLhZN1DnnxoCm42yd
         JjNpxm29FzKdaArs6qEAGiWZ8pGRLTM21lrdqjwonwmDr3Q813XTeXDO3YntdusLFq3V
         lohg==
X-Gm-Message-State: AOJu0YzJRiXlyFTCGuB0nOsMW1hlu50e2LkrKgW1xv0cupOgRdFKTsV4
	pxT9VQTYGAEasNROLTloIlcbDh/zSkSJ32Y/ub3XdIQzbB4=
X-Google-Smtp-Source: AGHT+IH6aYt12vWEX3TnnciKN769C1PGDMRBonMyrKKHDg9R9EFqrcjEltPyFjNggIyJ5MsxnSvxqLqzXg57TiFvGsw=
X-Received: by 2002:a05:6870:6111:b0:1fa:f3ab:d7bf with SMTP id
 s17-20020a056870611100b001faf3abd7bfmr5096054oae.4.1701799609786; Tue, 05 Dec
 2023 10:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20231204075356.26863-1-alperyasinak1@gmail.com>
In-Reply-To: <20231204075356.26863-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Dec 2023 10:06:23 -0800
Message-ID: <CAMKF1spxo2r=UkzddHjOvNC2Y1n9JY8MRMteAHSqLOoZ9RKG=Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] snappy: upgrade 1.1.9 -> 1.1.10
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 18:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107229

this fails on arm
https://errors.yoctoproject.org/Errors/Details/745647/

On Sun, Dec 3, 2023 at 11:54=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com> =
wrote:
>
> * 0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch removed becau=
se fixed in the new version
>
> Changelog:
>
> * Performance improvements
> * Compilation fixes for various environments
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  ...-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch | 71 -------------------
>  .../{snappy_1.1.9.bb =3D> snappy_1.1.10.bb}     |  8 +--
>  2 files changed, 3 insertions(+), 76 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/snappy/snappy/0001-Add-inlin=
e-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
>  rename meta-oe/recipes-extended/snappy/{snappy_1.1.9.bb =3D> snappy_1.1.=
10.bb} (85%)
>
> diff --git a/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-=
SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch b/meta-oe/recipes-extended/snappy/snap=
py/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
> deleted file mode 100644
> index 27357d88a..000000000
> --- a/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_=
ATTRIBUTE_ALWAYS_INLINE.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From 4728803cc8687431449c8c9fbfabb1da04943400 Mon Sep 17 00:00:00 2001
> -From: "Georgi D. Sotirov" <gdsotirov@gmail.com>
> -Date: Wed, 5 May 2021 14:16:46 +0300
> -Subject: [PATCH] Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE
> -
> -Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE on AdvanceToNextTag to
> -fix the following compilation errors and a warning with GCC:
> -
> -[  2%] Building CXX object CMakeFiles/snappy.dir/snappy.cc.o
> -/usr/bin/c++   -DHAVE_CONFIG_H -Dsnappy_EXPORTS
> --I/tmp/snappy-1.1.9/build -I/tmp/snappy-1.1.9  -O3
> --march=3Di586 -mtune=3Di686 -Wall -Wextra -fno-exceptions -fno-rtti -O3
> --DNDEBUG -fPIC   -std=3Dc++11 -o CMakeFiles/snappy.dir/snappy.cc.o -c
> -/tmp/snappy-1.1.9/snappy.cc
> -/tmp/snappy-1.1.9/snappy.cc:1017:8: warning: always_inline
> -function might not be inlinable [-Wattributes]
> - size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> -        ^
> -/tmp/snappy-1.1.9/snappy.cc: In function 'std::pair<const
> -unsigned char*, int> snappy::DecompressBranchless(const uint8_t*, const
> -uint8_t*, ptrdiff_t, T, ptrdiff_t) [with T =3D char*; uint8_t =3D unsign=
ed
> -char; ptrdiff_t =3D int]':
> -/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
> -call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
> -size_t*)': function body can be overwritten at link time
> -/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
> -         size_t tag_type =3D AdvanceToNextTag(&ip, &tag);
> -                                                     ^
> -/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
> -call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
> -size_t*)': function body can be overwritten at link time
> - size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> -        ^
> -/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
> -         size_t tag_type =3D AdvanceToNextTag(&ip, &tag);
> -                                                     ^
> -/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
> -call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
> -size_t*)': function body can be overwritten at link time
> - size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> -        ^
> -/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
> -         size_t tag_type =3D AdvanceToNextTag(&ip, &tag);
> -                                                     ^
> -CMakeFiles/snappy.dir/build.make:137: recipe for target
> -'CMakeFiles/snappy.dir/snappy.cc.o' failed
> -
> -Just like with other functions using SNAPPY_ATTRIBUTE_ALWAYS_INLINE
> -macro (i.e. __attribute__((always_inline)) ) it is necessary to use C++
> -inline specifier.
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> -Upstream-Status: Submitted [https://github.com/google/snappy/pull/128]
> ----
> - snappy.cc | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/snappy.cc b/snappy.cc
> -index 79dc0e8..51157be 100644
> ---- a/snappy.cc
> -+++ b/snappy.cc
> -@@ -1014,7 +1014,7 @@ void MemMove(ptrdiff_t dst, const void* src, size_=
t size) {
> - }
> -
> - SNAPPY_ATTRIBUTE_ALWAYS_INLINE
> --size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> -+inline size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> -   const uint8_t*& ip =3D *ip_p;
> -   // This section is crucial for the throughput of the decompression lo=
op.
> -   // The latency of an iteration is fundamentally constrained by the
> diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-oe/re=
cipes-extended/snappy/snappy_1.1.10.bb
> similarity index 85%
> rename from meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
> rename to meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
> index 9e0e43ce8..7baf9c647 100644
> --- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
> +++ b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
> @@ -10,12 +10,10 @@ compression ratio."
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df62f3080324a97b3159a7a7e61812=
d0c"
>
> -SRC_URI =3D "gitsm://github.com/google/snappy.git;protocol=3Dhttps;branc=
h=3Dmain \
> -    file://0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch \
> -"
> -SRCREV =3D "2b63814b15a2aaae54b7943f0cd935892fae628f"
> -S =3D "${WORKDIR}/git"
> +SRC_URI =3D "gitsm://github.com/google/snappy.git;protocol=3Dhttps;branc=
h=3Dmain"
> +SRCREV =3D "dc05e026488865bc69313a68bcc03ef2e4ea8e83"
>
> +S =3D "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107200): https://lists.openembedded.org/g/openembedde=
d-devel/message/107200
> Mute This Topic: https://lists.openembedded.org/mt/102966758/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

