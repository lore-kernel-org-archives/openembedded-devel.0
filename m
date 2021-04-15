Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.3425.1618468393786145359
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 23:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i1JjL6ui;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id h13so5509674qka.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Apr 2021 23:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vfKjWHt5+gMSHWFW47YJAI/KcVcDw6NJxz+osNANU5c=;
        b=i1JjL6uitDZTtc15sLBQDC2MqQkxjscJvD2Q8sRuExgTSzQpx++hLqz0rF2Vgu01gM
         UzCkiKBZFN2GQRzAaW5lE8WgPGQz8Gr2M6lDz4H/Z020nCkHUj3N/7zlDCU4t4CJQnCP
         yXPr6DQkwAcZIVxefdDKGG8D+kWzuAF4+t1k8+BA/PY4tMUhpMFdQsJpgwpcW3Lmq2Y0
         C5PYNMsM6EzUzMpsnbQn/h3ymliDdRpvSppHUo1ZK/HwqQht2bUEf4qlXU4KHZkb/JTz
         BmhXvGOKq9gA+DHKEEcgkPEbJoOEnZ5aAt3yfgF0je+IgnlRtdTksTzyFW1C1NvFaLEb
         hrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vfKjWHt5+gMSHWFW47YJAI/KcVcDw6NJxz+osNANU5c=;
        b=Nq7wIHyG8Xai3iaJv1Cm64o2THaanm9wtegyLMwsq+hjmy1UhkM+XpNtiUNMmQSt7u
         FjuRQjUDJOVIeXyhMSppbrdEVOD7FTZ8JQl2cdMaoWu2NqJnQG/XmvawwOX/9kiov/pZ
         +58TIST7AeW5XJ2qpg/Wh/cXJ+MEIr1igFVY990dygYK8dXQg06SJ5vz9GybYanwUbsa
         iYsS5t3Lax2AzErjxundPi6ij/HVqBnuiJkrSFPJu/7QMfzD6qr1tWz1df9Yg9QKXQKM
         WtjwkSXCDNvh4yyv8SUBrYXWsv1eRm7zOYjfYM/w7fQF8t5Lh8rLUNIBWYGnrmEcVHis
         qfYw==
X-Gm-Message-State: AOAM532nRxsU3bS6bsLQ3Xi5xQ9ETTmdZH6BPs39zAiCwKvK41eJrR0C
	Al9RHcwXsRMOTr3WW6czF64lihJfx1RpgYzF+QM=
X-Google-Smtp-Source: ABdhPJyaQ6Qa03iObUHtoNsBo/LrRnpCIRwaTZE2AjP4LaIXLTMdJVuovbcyVd2qyWLjIZk1bJt0p5O3ZSHv0EeDw/I=
X-Received: by 2002:a37:9607:: with SMTP id y7mr2045821qkd.25.1618468392866;
 Wed, 14 Apr 2021 23:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <1618467026-24468-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1618467026-24468-1-git-send-email-wangmy@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Apr 2021 23:32:46 -0700
Message-ID: <CAMKF1spMMjeO7361hMYj3GmUYB_v3UhSr8pN8ajncHU7fkidoQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] uftrace: Fix error on aarch64 when binutils update to 2.35.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 14, 2021 at 11:10 PM wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...error-on-aarch64-with-binutils2.35.1.patch | 27 +++++++++++++++++++
>  .../recipes-devtools/uftrace/uftrace_0.9.4.bb |  1 +
>  2 files changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
>
> diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
> new file mode 100644
> index 0000000000..ac17cf433f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
> @@ -0,0 +1,27 @@
> +From 0bc502989822506af308a559ac1cd52af82cac03 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Wed, 14 Apr 2021 09:35:35 +0900
> +Subject: [PATCH] Fix error on aarch64 with binutils2.35.1.
> +
> +WARN: child terminated by signal: 11: Segmentation fault
> +
> +Upstream-status: Pending
> +

please submit this upstream if not yet done. this patch can avail some
more eyes.

> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + arch/aarch64/mcount-arch.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/arch/aarch64/mcount-arch.h b/arch/aarch64/mcount-arch.h
> +index 69efe521..60c2c1ba 100644
> +--- a/arch/aarch64/mcount-arch.h
> ++++ b/arch/aarch64/mcount-arch.h
> +@@ -31,7 +31,7 @@ struct mcount_arch_context {
> +       double d[ARCH_MAX_FLOAT_REGS];
> + };
> +
> +-#define ARCH_PLT0_SIZE  32
> ++#define ARCH_PLT0_SIZE  16
> + #define ARCH_PLTHOOK_ADDR_OFFSET  0
> +
> + struct mcount_disasm_engine;
> diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
> index a3d0602182..4b4fc831c3 100644
> --- a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
> +++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
> @@ -13,6 +13,7 @@ inherit autotools
>  PV .= "+git${SRCPV}"
>  SRCREV = "d648bbffedef529220896283fb59e35531c13804"
>  SRC_URI = "git://github.com/namhyung/${BPN} \
> +           file://0001-Fix-error-on-aarch64-with-binutils2.35.1.patch \
>             "
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> 
>
