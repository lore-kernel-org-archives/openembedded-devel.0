Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.70615.1597770060891288613
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 10:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tafUmbKH;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id t23so15662661qto.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2020 10:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QbBGAz7V9MUGeBYsbu7EPYs831z62I4ss37onfs5o88=;
        b=tafUmbKHVxsoyTxK0CdElcIoYdbvgTGWrBJQ86betzDkDWaEp3xDSBqszFf2TCb25W
         ehSKcLIcT9Y54xW0p9t8F72O0qG3FIiZW2uupgx4gbgq/DslyfZj4qeyx3Ko0S3Ab5zW
         PC+ZdPCVg6gH0EswRjKVbX2TF/Iix1vGgVUz7bG9lFWcPxC+lVAiLclYeovfZH5oy1t7
         hLHS+bwHuIsqfNYfYZfxacmTFT+32hKsYmL2ifAuZaYEq456ZiAfDjBGeIcOvHuyepiq
         OdF1tgJOtty0aJ2ah+knFvE0iAkGjlsC3zCrSV0Z6+lUfOu5cwoKthf1Rx1cHc41suOT
         YR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QbBGAz7V9MUGeBYsbu7EPYs831z62I4ss37onfs5o88=;
        b=jzeGHSGewFkwgin09DoNvzym6JPswJM/5pCQ1GF85bTb4Ka5eDx5h2UPtMqWBSFL+l
         4YmmZzkSvZN7UTnNFJsTR9K5gsTwyIXlZ6ZwfQDDPjwfjAvmHC658g3HiwaTTZGe0vTD
         OyCVwR1anLLvQgVJGSksSSUpHVXAR0hhsg2ZyQc8Y84/56gh4j/xUERQ/vvvqebGGOf2
         JfvCdGklx4zvqjvM5wbNWAP9/6P66lXJY0otEqk2WYzcmY9IJKzYBX7ZBdsb4IZu/JQI
         q+W8/lTc4dQhWROluOom1Hz6x+OBAknHpy6kLaRmjjh+B2h+KRcFKI9lWsAM5mdxHdEJ
         /GmA==
X-Gm-Message-State: AOAM532oWVJq+sjGYtvftXTsmIx7o2Q7v/mMDwuW8WkAEOmwXtmaD4Im
	x12a++FPamTgBxr4w+T9NDOauWqcuA1QJ3oKgIY=
X-Google-Smtp-Source: ABdhPJyuzgWfwYCNb8gMiswyCk8gM2c2klR5aoYTBMOQgLmrjH69h3AnWVIbQ5albdJH1AIOAaIG+sr4dkc1cGH0oR4=
X-Received: by 2002:ac8:748b:: with SMTP id v11mr18745480qtq.293.1597770059782;
 Tue, 18 Aug 2020 10:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200818154958.333-1-joe.slater@windriver.com>
In-Reply-To: <20200818154958.333-1-joe.slater@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 18 Aug 2020 10:00:33 -0700
Message-ID: <CAMKF1sq=kB9FaV74eWJg99k2KEi390oTRbLGuOAdzAhnBTh_0w@mail.gmail.com>
Subject: Re: [oe] [meta-networking][V2][PATCH 1/1] aoetool: make builds reproducible
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

I merged V1 since that sounded least disruptive.

On Tue, Aug 18, 2020 at 8:50 AM Joe Slater <joe.slater@windriver.com> wrote:
>
> Strip host path infomation out of binaries by not suppressing
> default CFLAGS.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../aoetools/reproducible-build.patch         | 21 +++++++++++++++++++
>  .../recipes-support/aoetools/aoetools_36.bb   |  1 +
>  2 files changed, 22 insertions(+)
>  create mode 100644 meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch
>
> diff --git a/meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch b/meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch
> new file mode 100644
> index 000000000..2cbd5016d
> --- /dev/null
> +++ b/meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch
> @@ -0,0 +1,21 @@
> +aoetools: modify CFLAGS for reproducible build
> +
> +Use the build system CFLAGS, if provided.
> +
> +Upstream-Status:  Pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +
> +--- aoetools-36.orig/Makefile
> ++++ aoetools-36/Makefile
> +@@ -40,7 +40,8 @@ NPERSHELF=16
> + CONF_SCRIPTS = aoe-discover aoe-interfaces aoe-mkshelf aoe-revalidate aoe-flush aoe-stat
> + PROGS = aoeping aoecfg aoe-sancheck
> + COMMANDS := ${CONF_SCRIPTS} aoe-mkdevs aoe-version coraid-update ${PROGS}
> +-CFLAGS = -Wall -O -g
> ++# Provide a default.
> ++CFLAGS ?= -Wall -O -g
> + SANCHECKLIBS = -lpthread
> +
> + AOE_PING_OBJ = aoeping.o linux.o
> diff --git a/meta-networking/recipes-support/aoetools/aoetools_36.bb b/meta-networking/recipes-support/aoetools/aoetools_36.bb
> index 9b73b442a..60f3dc9b2 100644
> --- a/meta-networking/recipes-support/aoetools/aoetools_36.bb
> +++ b/meta-networking/recipes-support/aoetools/aoetools_36.bb
> @@ -13,6 +13,7 @@ RRECOMMENDS_${PN} = "kernel-module-aoe"
>  SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}/${BPN}-${PV}.tar.gz \
>             file://aoe-stat-no-bashism.patch \
>             file://makefile-add-ldflags.patch \
> +           file://reproducible-build.patch \
>          "
>  SRC_URI[md5sum] = "bff30daa988a65f69d4448ce4726a6db"
>  SRC_URI[sha256sum] = "fb5e2cd0de7644cc1ec04ee3aeb43211cf7445a0c19e13d6b3ed5a8fbdf215ff"
> --
> 2.24.1
>
> 
