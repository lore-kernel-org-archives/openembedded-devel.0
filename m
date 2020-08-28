Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web10.48139.1598635725045026385
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 10:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cU+5EmPD;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id p15so811418pli.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2020 10:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CWb2u92AuK5tITtpeI2iXlOxbvvi0hiiJfzj4bOm1XY=;
        b=cU+5EmPDXiGrHfM392f9l7oABIcsNsXmVPVaU73ehD9IUG+meRxqHntbrlRU4oCF3j
         Silx6CRKHHYCxaKljsz4iku41nB7T9wGnqN6OTOgJjHiIpF00U8C654swKtNlfSVqC65
         P44AAs7Ru4qSW1oEWJ/ldU9L5dVZ9b+PbJdB9xIJqNpGN/YPtbeCoNNjPLanbwa5Ubl4
         WKROyOUmeXHFGRySPNPS2+x03CHOlW1cNzZFb1m6iyZ8TQ0HE5+/vytAI7lSKmbwSoNw
         Cx7WxIf7bkhKrUByGGHmPF4bH//srplR3at7YLXYsa6Deagufb0d6VALN+AZOwNCRDdr
         hXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CWb2u92AuK5tITtpeI2iXlOxbvvi0hiiJfzj4bOm1XY=;
        b=OQGWY9Gjd1WlTg0jWGxBTprgNFJ0QFQ27sQfGh3CjJIRswoj6ffupMEknGVimzRZu8
         8GXszb/K2lvrRNwAlxasy7Hbfw/vdqgnXidJZJGEKsWWIDPAZhNs1nMj6+5KpYEaof6H
         2nMagiIfMHSjc1zShnHdAN0wxPTk8+kAgMZdf3RVHmm6gEtbSIpGKxWXVDIqMMAGZhRq
         i818DH5II7VyIPQokROm4ysWtjS7Fx3696xsix37opVgrNNHP+pF/lqsn5nMGNxdsA6j
         ZZhlGa/g6xs2RQ24Rq5yAVaGOlfZ58PJT5JkkQRJvasC496u9EK+R/D8kkJq+/E7L9o3
         xgYA==
X-Gm-Message-State: AOAM53131bk2xbxbuH4TfQFgKWsH5ei+IcsO9nHzvHoibBFaJtBau8U+
	REy2wdK7C3wMYJY3iK0UqRQ=
X-Google-Smtp-Source: ABdhPJyV4Biq316mmDkyLmToyfk/sN8KcmI3P9xiIhvVR7w1Ko00ockH5QrvAmTAHXbs04xL9xDi0Q==
X-Received: by 2002:a17:90a:bd02:: with SMTP id y2mr113883pjr.66.1598635724454;
        Fri, 28 Aug 2020 10:28:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:f1d8:9f31:ff5f:5356? ([2601:646:9200:4e0:f1d8:9f31:ff5f:5356])
        by smtp.gmail.com with ESMTPSA id v22sm5441pfe.75.2020.08.28.10.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 10:28:43 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH v2] nss: Upgrade to 3.56
To: Martin Jansa <martin.jansa@gmail.com>
Cc: akuster <akuster808@gmail.com>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>,
 Mikko Rapeli <mikko.rapeli@bmw.de>
References: <20200828020411.1988431-1-raj.khem@gmail.com>
 <eca6954a-0a7d-8990-70ab-2b141c53ce69@gmail.com>
 <CA+chaQcn6Ep4YRRJDaXLbdRoTA791VzEsqBb29yWj_GT6K6U1g@mail.gmail.com>
 <1460d060-bcec-4e42-d34a-0d3d336e96ef@gmail.com>
 <CA+chaQdAeq_g1a7bOE_WWPvTreG2=DEFa9at8M5Kc51qKMV9Kw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <41feda75-1d8a-fae6-a345-8e7fcd48da60@gmail.com>
Date: Fri, 28 Aug 2020 10:28:42 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdAeq_g1a7bOE_WWPvTreG2=DEFa9at8M5Kc51qKMV9Kw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Thanks Martin

On 8/28/20 10:18 AM, Martin Jansa wrote:
> I'm testing a fix for target, would be nice if Mikko can confirm 
> nativesdk works with it - will send it later today.
> 
> On Fri, Aug 28, 2020 at 7:03 PM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
> 
> 
>     On 8/28/20 8:14 AM, Martin Jansa wrote:
>      > I'm seeing this postinst issue already without Khem's nss changes, I
>      > guess it is caused by:
>      > 31552510b1 nss: fix postinst script for nativesdk build
>      >
> 
>     seems so. Although my upgrade patch had compile issues during build
>     which are fixed now.
> 
>     perhaps we should revert 31552510b1 unless there is a better fix Mikko
>     any ideas ?
> 
>      > On Fri, Aug 28, 2020 at 4:43 PM akuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>
>      > <mailto:akuster808@gmail.com <mailto:akuster808@gmail.com>>> wrote:
>      >
>      >
>      >
>      >     On 8/27/20 7:04 PM, Khem Raj wrote:
>      >      > Forward port
>      >     0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
>      >      >
>      >      > Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>
>      >     <mailto:raj.khem@gmail.com <mailto:raj.khem@gmail.com>>>
>      >      > ---
>      >      > v2: Update armv8 hw crypto patch to work on arm32
>      >
>      >     Did you add this to an image?
>      >
>      >     I am seeing new error when nss is appended to an image.
>      >
>      >     WARNING: security-build-image-1.0-r0 do_rootfs: nss.postinst
>      >     returned 127, marking as unpacked only, configuration required on
>      >     target.
>      >     2020-08-28 02:07:33 - ERROR    - ERROR:
>     security-build-image-1.0-r0
>      >     do_rootfs: Postinstall scriptlets of ['nss'] have failed. If the
>      >     intention is to defer them to first boot,
>      >     2020-08-28 02:07:33 - ERROR    - then please place them into
>      >     pkg_postinst_ontarget_${PN} ().
>      >     2020-08-28 02:07:33 - ERROR    - Deferring to first boot via
>     'exit
>      >     1' is no longer supported.
>      >
>      >     - Armin
>      >
>      >      >
>      >      >  ...figure-option-to-disable-ARM-HW-cryp.patch | 32
>      >     ++++++-------------
>      >      >  .../nss/{nss_3.54.bb <http://nss_3.54.bb>
>     <http://nss_3.54.bb> => nss_3.56.bb <http://nss_3.56.bb>
>      >     <http://nss_3.56.bb>}          |  3 +-
>      >      >  2 files changed, 11 insertions(+), 24 deletions(-)
>      >      >  rename meta-oe/recipes-support/nss/{nss_3.54.bb
>     <http://nss_3.54.bb>
>      >     <http://nss_3.54.bb> => nss_3.56.bb <http://nss_3.56.bb>
>     <http://nss_3.56.bb>} (99%)
>      >      >
>      >      > diff --git
>      >   
>       a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
>      >   
>       b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
>      >      > index 1a87a0577f..f1f76bd1b7 100644
>      >      > ---
>      >   
>       a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
>      >      > +++
>      >   
>       b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
>      >      > @@ -14,21 +14,18 @@ Signed-off-by: Alexander Kanavin
>      >     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>
>     <mailto:alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>>
>      >      >   nss/lib/freebl/gcm.c    | 2 ++
>      >      >   2 files changed, 6 insertions(+)
>      >      >
>      >      > -diff --git a/nss/lib/freebl/Makefile
>     b/nss/lib/freebl/Makefile
>      >      > -index f99f769..b0ec81b 100644
>      >      >  --- a/nss/lib/freebl/Makefile
>      >      >  +++ b/nss/lib/freebl/Makefile
>      >      > -@@ -125,6 +125,9 @@ else
>      >      > -         DEFINES += -DNSS_X86
>      >      > +@@ -126,6 +126,8 @@ else
>      >      >   endif
>      >      >   endif
>      >      > -+
>      >      > + ifdef NS_USE_GCC
>      >      >  +ifdef NSS_USE_ARM_HW_CRYPTO
>      >      >  +    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
>      >      >   ifeq ($(CPU_ARCH),aarch64)
>      >      > -     DEFINES += -DUSE_HW_AES -DUSE_HW_SHA2
>      >      > -     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c sha256-armv8.c
>      >      > -@@ -148,6 +151,7 @@ endif
>      >      > +     DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
>      >      > +     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c sha1-armv8.c
>      >     sha256-armv8.c
>      >      > +@@ -150,6 +152,7 @@ endif
>      >      >           endif
>      >      >       endif
>      >      >   endif
>      >      > @@ -36,23 +33,14 @@ index f99f769..b0ec81b 100644
>      >      >
>      >      >   ifeq ($(OS_TARGET),OSF1)
>      >      >       DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
>      >      > -diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
>      >      > -index c2cc18d..b77f573 100644
>      >      >  --- a/nss/lib/freebl/gcm.c
>      >      >  +++ b/nss/lib/freebl/gcm.c
>      >      > -@@ -18,6 +18,7 @@
>      >      > +@@ -20,7 +20,7 @@
>      >      >
>      >      > - #include <limits.h>
>      >      > -
>      >      > -+#ifdef NSS_USE_ARM_HW_CRYPTO
>      >      >   /* old gcc doesn't support some poly64x2_t intrinsic */
>      >      >   #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
>      >      > -     (defined(__clang__) || defined(__GNUC__) && __GNUC__
>      > 6)
>      >      > -@@ -27,6 +28,7 @@
>      >      > - /* We don't test on big endian platform, so disable this
>     on big
>      >     endian. */
>      >      > +-    (defined(__clang__) || defined(__GNUC__) && __GNUC__
>      > 6)
>      >      > ++    (defined(__clang__) && defined(NSS_USE_ARM_HW_CRYPTO) ||
>      >     defined(__GNUC__) && __GNUC__ > 6)
>      >      >   #define USE_ARM_GCM
>      >      > - #endif
>      >      > -+#endif
>      >      > -
>      >      > - /* Forward declarations */
>      >      > - SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
>      >      > + #elif defined(__arm__) && defined(IS_LITTLE_ENDIAN) && \
>      >      > +     !defined(NSS_DISABLE_ARM32_NEON)
>      >      > diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb
>     <http://nss_3.54.bb>
>      >     <http://nss_3.54.bb>
>     b/meta-oe/recipes-support/nss/nss_3.56.bb <http://nss_3.56.bb>
>      >     <http://nss_3.56.bb>
>      >      > similarity index 99%
>      >      > rename from meta-oe/recipes-support/nss/nss_3.54.bb
>     <http://nss_3.54.bb>
>      >     <http://nss_3.54.bb>
>      >      > rename to meta-oe/recipes-support/nss/nss_3.56.bb
>     <http://nss_3.56.bb>
>      >     <http://nss_3.56.bb>
>      >      > index 1cc94735bb..4aa5d29ec2 100644
>      >      > --- a/meta-oe/recipes-support/nss/nss_3.54.bb
>     <http://nss_3.54.bb> <http://nss_3.54.bb>
>      >      > +++ b/meta-oe/recipes-support/nss/nss_3.56.bb
>     <http://nss_3.56.bb> <http://nss_3.56.bb>
>      >      > @@ -34,8 +34,7 @@ SRC_URI =
>      >   
>       "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO <http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/$%7BVERSIO>
>      >   
>       <http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/$%7BVERSIO>
>      >      >
>      >     
>       file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
>      >      >
>      >       file://0001-pkix-Do-not-use-NULL-where-0-is-needed.patch \
>      >      >             "
>      >      > -
>      >      > -SRC_URI[sha256sum] =
>      >   
>       "dab18bbfcf5e347934cda664df75ce9fd912a5772686c40d3c805e53c08d6e43"
>      >      > +SRC_URI[sha256sum] =
>      >   
>       "f875e0e8ed3b5ce92d675be4a55aa25a8c1199789a4a01f69b5f2327e2048e9c"
>      >      >
>      >      >  UPSTREAM_CHECK_URI =
>      >   
>       "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
>      >      >  UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
>      >      >
>      >      >
>      >
>      >     
>      >
> 
