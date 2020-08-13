Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.6478.1597357546971952054
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 15:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BLwgBrj6;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id v22so5644851qtq.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 15:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6m23k3SCnQtCXPq1kzkNZ/xyIMQk8M2vlkf8MV9qBhY=;
        b=BLwgBrj6dqCoPlsj2/DB0CLGY1DE+8k34TMhOe8iY3cPoAOnQW1UFWjHPIaJO2Su6W
         whuOjMI4y0haEyPRBkyvSPjMb1a75wINFlPDXGm7aLUm0B2Ti65bh0RfYyeb6FB7Vve7
         0F4uO4K6Qu3xS29Fsk9v44oHsznd1m0ZcWAXHHCbtxSfZJM/E+Iywr6nXVpE90nGPxMD
         ObMg7jOSIjF3VN8Mv8b7Vhtexy4JIq7HX1hz9vOXMRM/4dPnBIUpluHY3pXLYQp0lLd4
         /A3izG+Mbm8K/xFQ0pRBTyXpX7U0Slc/EiMf0F837QboTgZRxGem4+9QKlMCrnJkuzmh
         Wfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6m23k3SCnQtCXPq1kzkNZ/xyIMQk8M2vlkf8MV9qBhY=;
        b=KNaLTmf8cxIP7WAQLa3Vd4Qy2BBCfZ7ekDXI3hRA6+gLwxToh2MtxP/U5y/7P3LytD
         3esDokUb2gk7SLkVDgPGHvc4gz9nHubhABG0kSiokfaCIzITGBg/+ROxUr6E0xks5S1W
         dwW5a0bBWl6OQOHB7uDbxIk6imAy9iySTviO9mZ148yAfImaYSS0Z3etVsHapLKbo4K5
         6zQ/34uxCBTHK0VVRjSyOaySY1WgMRp8NvG3gmdBlc0wo56Pho/sPk1JBPl+RN6+z14h
         YHHp8Mp2dIATUpdgoWz4nEav9J/44GflMAYJv5Wm3RN95MBV6XYx2J5yeBiABlLOrQqd
         IwTg==
X-Gm-Message-State: AOAM532T6Ay68jLLahJvbUm20cSGQNpWo05VymowPUyCUvVnImJU5QFg
	BW3QW9UyRirIuEf5PJAaZu4CX1Z8rYLj2kIJ8HM=
X-Google-Smtp-Source: ABdhPJykeZgs0fs1OcJvZJoVqRwKYcVA21ATi6xWWhdCsqToAIdvoafEjXsF/nT9UB1zveLJ87oMzHVPXnRSBJtq8/Y=
X-Received: by 2002:ac8:4097:: with SMTP id p23mr7058615qtl.316.1597357545978;
 Thu, 13 Aug 2020 15:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200813194015.3412-1-joe.slater@windriver.com>
In-Reply-To: <20200813194015.3412-1-joe.slater@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 13 Aug 2020 15:25:19 -0700
Message-ID: <CAMKF1sreu9ygY8TK0biqdsfHkYFGHL3m_E-y-g_+5F4DZ0xBpg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/1] aoetool: make builds reproducible
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 13, 2020 at 12:40 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> Strip host path infomation out of binaries by not suppressing
> default CFLAGS.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../aoetools/aoetools/reproducible-build.patch       | 12 ++++++++++++
>  .../recipes-support/aoetools/aoetools_36.bb          |  1 +
>  2 files changed, 13 insertions(+)
>  create mode 100644 meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch
>
> diff --git a/meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch b/meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch
> new file mode 100644
> index 000000000..4939ab25c
> --- /dev/null
> +++ b/meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch
> @@ -0,0 +1,12 @@
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -40,7 +40,8 @@ NPERSHELF=16
> + CONF_SCRIPTS = aoe-discover aoe-interfaces aoe-mkshelf aoe-revalidate aoe-flush aoe-stat
> + PROGS = aoeping aoecfg aoe-sancheck
> + COMMANDS := ${CONF_SCRIPTS} aoe-mkdevs aoe-version coraid-update ${PROGS}
> +-CFLAGS = -Wall -O -g
> ++# We could still override this on the command line.
> ++CFLAGS += -Wall -O -g

Perhaps use ?= here, since -O will override the default optimization
that bitbake will pass in env

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
