Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDB9C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 10:06:10 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.9903.1743674764351728519
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 03:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqJAZnuy;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8f94c2698so4233966d6.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 03:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743674763; x=1744279563; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SEFOI4GBUoJQS7UiizlyJQ8Xfxk90FK7GLa2nMc3oGM=;
        b=hqJAZnuyXAXuumGNgF+edm2b3C/mzAtExkbx4v5EGZbkWvJ7tPqVrW2ZljdPMxeHfd
         HMyQuqmkLzA8XUIjbu96eLgi4QOhqG28T92IzxxeLIaAU3ptYmflOYhi2zwMLuq51TPy
         Z9sepwewFYOxOJ1bI3oFDJwpgwnba68HT7au/7aKahEToy010ybzCNkq6Fsh/9/FVmzc
         /Pp9jLMgCwHlr4KB+FBES2QuCxREniJlR+cG6esysJYR5G0rk+5umBA+ha8xlT6qsn72
         yVwso6zUywlz4/Ohyib8KgJOAPB22WR9aRbWVdsd6BwFOW+E9Z8lUNTN5E8mxp9B3K5A
         hThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743674763; x=1744279563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEFOI4GBUoJQS7UiizlyJQ8Xfxk90FK7GLa2nMc3oGM=;
        b=UMqfGFVBZkMRmc+1ZKKfC461EGQhle6rwMhYzAvmJccd0ggzoyUxtJNfm5survEubc
         5d3EdHBy+2w6SfWOdwF37duTRRWavJVLySVw72TdwTwFdhlmWKE1nkwxYPY99aS8Iax+
         D7iEoTKkiphWv6Ut2V1gvI4wDh+l+6mPETS6SUhD+dUhtLzPcOuDO2TSpf29NmiVqqNd
         YVqMHq3dxWsRr1ozVy74w0/EYmgvW4lJNA/TkC2qQOXZrdpUws6pMfrSboejFV2zejlf
         +3lwBNPBs8mxZXbbNiWfJBVrs01PvKE0h3IOQ+AE89VPRAhQlOLlSRPgIMAFqni5IlK3
         XJEA==
X-Gm-Message-State: AOJu0YzoxBuVNHaNpF888mkoUbvHTfnkWsLfwvnQ4zJqahuI+AjBmggp
	3b4vbzlvUS2pPrXWUCD7KdBiYfuJZhnzobJoqXkJjaK87WkXYCJaDXsLES1R81B/gN3/UtcUS6E
	mZbi0lbvuM6nPsDUp4gKK/fWH0TJ9mQ==
X-Gm-Gg: ASbGncuTqIlEPjRARzWBZAxv+gECmtE25oEXlcd3QnO8x3ICHA1j8V9kvihKDGpinC/
	Jml5m5T0t+WKooSL21EHVWEH4+IMKmqh+RnkHtFfnzpaAwqjZ16ymaIQfZy2hUq481UvuTW1WNU
	z46oCVKYW5zMYHHpqLDIep4+HeqGjFBMNkY4fLIeEGvx52dfFJj5wV73OKZsFR
X-Google-Smtp-Source: AGHT+IFSK2ozw8YYu+HP/JI5EAng/hQDVqC+soJpdll/h4j7kztfjPnuPRbViFOFKLrCcsbXVTFFAd/g4xtsRSOB0WM=
X-Received: by 2002:a05:6214:248f:b0:6e8:fa72:be51 with SMTP id
 6a1803df08f44-6eed5febf75mr299530366d6.19.1743674763242; Thu, 03 Apr 2025
 03:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250403094223.2339348-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20250403094223.2339348-1-jiaying.song.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Apr 2025 12:05:52 +0200
X-Gm-Features: ATxdqUFVkdHFpf_XKDYWj4jFUIxmxOCFss-Xo0MbZ0WkkLEgD6xi8qmbuZJU63Q
Message-ID: <CANNYZj95sE8Ajv1zaAMyvgKhTqmz4P0e7riG0_0ubRRzJqKs+A@mail.gmail.com>
Subject: Re: [oe] [PATCH] gcc: Undef _TIME_BITS along with _FILE_OFFSET_BITS
 on Linux
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-devel@lists.openembedded.org, changqing.li@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 10:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116539

Thanks for the patch. The correct mailing list is openembedded-core.

Just a quick note: if the aim is to address issues on Linux, why is
the patch changing things in solaris code?

Alex

On Thu, 3 Apr 2025 at 11:42, Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=windriver.com@lists.openembedded.org> wrote:
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> On 32-bit glibc>=2.34 systems using 64bit time_t build fails because
> _FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64
>
> Fixes
>
> ```
> /usr/include/features-time64.h:26:5: error: "_TIME_BITS=64 is allowed
>  only with _FILE_OFFSET_BITS=64"
> | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
> |     ^
> | 1 error generated.
> ```
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-14.2.inc        |  1 +
>  ...-along-with-_FILE_OFFSET_BITS-on-Lin.patch | 44 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0028-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools/gcc/gcc-14.2.inc
> index 3d65bed92a..0ed6f1875b 100644
> --- a/meta/recipes-devtools/gcc/gcc-14.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
> @@ -71,6 +71,7 @@ SRC_URI = "${BASEURI} \
>            file://0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
>             file://0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch \
>             file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
> +           file://0028-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch \
>  "
>
>  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
> diff --git a/meta/recipes-devtools/gcc/gcc/0028-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch b/meta/recipes-devtools/gcc/gcc/0028-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
> new file mode 100644
> index 0000000000..06c24cdff5
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0028-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
> @@ -0,0 +1,44 @@
> +From 883d5549dc959b736e3cb61b989272a9e6a42565 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 3 Apr 2025 17:09:22 +0800
> +Subject: [PATCH] Undef _TIME_BITS along with _FILE_OFFSET_BITS on Linux
> +
> +On 32-bit glibc>=2.34 systems using 64bit time_t build fails because
> +_FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64
> +
> +Fixes
> +
> +```
> +/usr/include/features-time64.h:26:5: error: "_TIME_BITS=64 is allowed
> + only with _FILE_OFFSET_BITS=64"
> +| #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
> +|     ^
> +| 1 error generated.
> +```
> +Upstream-Status: Backport [https://github.com/gcc-mirror/gcc/commit/fa321004f3f6288d3ee2eefa6b02177131882dca]
> +
> +Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> +---
> + libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
> +index eeb49e2af..f78558bed 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
> ++++ b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
> +@@ -10,7 +10,12 @@
> + //===----------------------------------------------------------------------===//
> +
> + // Before Solaris 11.4, <procfs.h> doesn't work in a largefile environment.
> ++
> + #undef _FILE_OFFSET_BITS
> ++
> ++// Avoid conflict between `_TIME_BITS` defined vs. `_FILE_OFFSET_BITS`
> ++// undefined in some Linux configurations.
> ++#undef _TIME_BITS
> + #include "sanitizer_platform.h"
> + #if SANITIZER_SOLARIS
> + #  include <fcntl.h>
> +--
> +2.34.1
> +
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116538): https://lists.openembedded.org/g/openembedded-devel/message/116538
> Mute This Topic: https://lists.openembedded.org/mt/112062601/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

