Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.1465.1623170100315853461
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 09:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=m51nUczP;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id i94so17240306wri.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=441jBJE21poFFZKp/JjfIBRjJF5iSbDfmBe/sZ38qlk=;
        b=m51nUczPZQP8Or4X0cZz7BkU7BUsHNz9tFWs2zh77Vu3Cl35feiwD3G5sgYdO1FQXg
         PiphUNRTDNYBHX1MeFrMIPCmRjr8UN0JFjnNT2C04A6+kJxm3FKOnZstypKNGTju8Qj8
         JJPL6NY64cS7yHa8/jSy9KsXm5tQMpiOYxo8nuy1X3lkBOgfVPBdhp5BlOVA8/ok9oE+
         wWTKO7QCal+U315uPIvMT6QPGxdEYoL73i8SNOx631OgoDadR7FkPrm4TRGJTOeM4I67
         EpuD4rZBRbRm+3MqGmSiCzZgNObNknmkWU7q2CaUIITOWiEYOIw4Bu5n07NQ7XCc2aTq
         R8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=441jBJE21poFFZKp/JjfIBRjJF5iSbDfmBe/sZ38qlk=;
        b=ncex1RiD651QFpYnK33Ddgul7SQzTwJjrA9FoltVIJOv4rGCu5l2569VcozMmhd6CF
         6eXKPPniNYt0EabHpo6+O0k161Y0tVklw72Jlzykr7KdHn2XVIMcqxosUCRZS8ecNQQU
         rXRcSZpwGeGl4W9fNXNvY3wFmZCicMPdF8lnHv+sc5uAGYrG+dY69Rfzbjg2HGlqRy4W
         T5VrtpqaxJHSbjSd1u+sZ6Vt7q3Fmtkw9e9wuXBypi1Z/v4k4SNRZ2JcAwKrAV7RQpNm
         WlFJulIbAjoWdtdqo7IQzU5PFhLVTimzCn0lvcOLsvyT8prE28iQsJogn8iEj/+V+5Sl
         GJKQ==
X-Gm-Message-State: AOAM530A8Ug1mCRVMRmqrnCvGnoIPLmFAKG+AaPRGp7V3WjRAPuZbBzv
	kEsLW0zxEpkCcSsPi3C+VqBWlJ9bKGtPadRkXCKDtg==
X-Google-Smtp-Source: ABdhPJxXTxN14JJgN2pjv1J2AMBaXDYAF674BNQlh2rRoqg/U3bS0CL4l/QNWdv8oeBEzaw4PBjn0FNDlnbE/o8HcbI=
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr23915902wrv.109.1623170098448;
 Tue, 08 Jun 2021 09:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210608163304.1223962-1-raj.khem@gmail.com>
In-Reply-To: <20210608163304.1223962-1-raj.khem@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 8 Jun 2021 17:34:47 +0100
Message-ID: <CAAnfSTs1y0HLWswwpH-weyqV9gLMJeM=nYK37Ea47bSOKfhMtA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] zsync: Fix build on musl
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I've a better patch, hold off merging that recipe.

Ross

On Tue, 8 Jun 2021 at 17:33, Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@arm.com>
> ---
>  ...0001-sha1-Include-unistd.h-for-off_t.patch | 29 +++++++++++++++++++
>  meta-oe/recipes-extended/zsync/zsync_0.6.2.bb |  4 ++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-extended/zsync/zsync/0001-sha1-Include-unistd.h-for-off_t.patch
>
> diff --git a/meta-oe/recipes-extended/zsync/zsync/0001-sha1-Include-unistd.h-for-off_t.patch b/meta-oe/recipes-extended/zsync/zsync/0001-sha1-Include-unistd.h-for-off_t.patch
> new file mode 100644
> index 0000000000..60bcd8166f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zsync/zsync/0001-sha1-Include-unistd.h-for-off_t.patch
> @@ -0,0 +1,29 @@
> +From 72ad6dd95441836afb1f113697339b3c694d0e69 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 8 Jun 2021 09:26:32 -0700
> +Subject: [PATCH] sha1: Include unistd.h for off_t
> +
> +Musl systems do not get this definition indirectly like what happens
> +on glibc, therefore include unistd.h to get the definition
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + libzsync/sha1.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libzsync/sha1.h b/libzsync/sha1.h
> +index 3946505..23d9434 100644
> +--- a/libzsync/sha1.h
> ++++ b/libzsync/sha1.h
> +@@ -16,6 +16,7 @@
> + #else
> + #include <sys/types.h>
> + #endif
> ++#include <unistd.h>
> +
> + #define       SHA1_BLOCK_LENGTH               64
> + #define       SHA1_DIGEST_LENGTH              20
> +--
> +2.32.0
> +
> diff --git a/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb b/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb
> index c61e26309d..b80bf9cded 100644
> --- a/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb
> +++ b/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb
> @@ -5,7 +5,9 @@ LICENSE = "Artistic-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=71c0ac4d86266533509aa0825b8d323c"
>
>  SRC_URI = "http://zsync.moria.org.uk/download/${BP}.tar.bz2 \
> -           file://out-of-tree.patch"
> +           file://out-of-tree.patch \
> +           file://0001-sha1-Include-unistd.h-for-off_t.patch \
> +           "
>  SRC_URI[sha256sum] = "0b9d53433387aa4f04634a6c63a5efa8203070f2298af72a705f9be3dda65af2"
>
>  inherit autotools
> --
> 2.32.0
>
>
> 
>
