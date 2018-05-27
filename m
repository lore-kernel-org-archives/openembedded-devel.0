Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7ED749F7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 May 2018 04:07:22 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id m5-v6so11348215qti.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 May 2018 21:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rqkCbpBqQowrsI2OxlUzxyKjaCmARnCANAuNOKfEv5Q=;
	b=WodtmrCOTRVTooNnWQK4ah2wbET929TY7sJ+xp6NWx0qhYJQIL/4ap94QaSxbn2yRs
	udFcu78JFnL/wcI3cUKy5yAqWRmzSupIHmy5MH0WI7eNzeDuF/c6EXAAQyeEu21C5Ul+
	QmFzmEohJrD/Me0bVlnZguZHcKzQJCenYn0JGiIy82upADoC+6EPGMa5zAu+QXhEMl1O
	KqefNg1/pv7QquptIYer31BybuhEY73QfMJZZwRiM4Nzg8WuCKKF2IjZfS/6MSJZ0re5
	+Ej/mpHP8z6CAXJxh6h9oSjYchkH9T1zy9IN08WlkQZPZa8pPaGzPlPZvoU2d5eXTw5p
	FEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rqkCbpBqQowrsI2OxlUzxyKjaCmARnCANAuNOKfEv5Q=;
	b=tfTysilmN2AHMsozsW2l/1q7Zi5HOOCOm3/MBPMxFUTcGXBkSFT5w9IyDYrulDIzHC
	9qWXmr+jFJbpxqw4GhdkonSEycwUyYXs5zJgtY3/MpIi4604vKJ83CZG+Wbz17pgY3Yz
	Lfcrsl/ESmTsUvnLeMNJ/pTN0m76t7gR1S/FmARBOvQSot36lSV62lYBQr2p6Tz2dZwA
	xJUzlUGNbINCOhBVvJma5usdAdfsNTRNvyKf+CMUSwUJoRuv61coumfO0kiz6/c18g4c
	jvlCETDdWHdE9UqsMEBwuoWfIpbQZLIj79/K12i2fgkfzwYwWeekqq6AKQGNaHHURsGQ
	BoWg==
X-Gm-Message-State: ALKqPwePzrZVBQfngxIooFg4xnR+4eD3KtAIRfD5MMiIkBlUNVDc01Bo
	zWYvuiO6rZ8d9llcmivgsECvIIzb5+gjSJ7KxeA=
X-Google-Smtp-Source: ADUXVKKU6+ikQCF9y8f/qOOiaQelXruvwgoZh/HAjsXsjteo944DQu9qJylfq7JAq86FBqBZ4mBilK7eO0SXP6wEahY=
X-Received: by 2002:a0c:e545:: with SMTP id
	n5-v6mr8022710qvm.214.1527394043263; 
	Sat, 26 May 2018 21:07:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Sat, 26 May 2018 21:06:52
	-0700 (PDT)
In-Reply-To: <20180524135509.22244-1-hongzhi.song@windriver.com>
References: <20180524135509.22244-1-hongzhi.song@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 May 2018 21:06:52 -0700
Message-ID: <CAMKF1sqx1OJ270OZ36ke=4Vupav3yG9ZnSY4wa0nxZ_7Ariy_A@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] turbostat: add the recipe of turbostat to meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 May 2018 04:07:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 6:55 AM, Hongzhi.Song
<hongzhi.song@windriver.com> wrote:
> It is an efficient and necessary tool to reflect the status of X86
> processors. Turbostat reports processor topology, frequency, idle
> power-state statistics, temperature and power on X86 processors.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  recipes-kernel/turbostat/turbostat_3.4.bb | 58 +++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 recipes-kernel/turbostat/turbostat_3.4.bb
>

this recipe should belong to a sub-layer, as such it is being added to
top directory.


> diff --git a/recipes-kernel/turbostat/turbostat_3.4.bb b/recipes-kernel/turbostat/turbostat_3.4.bb
> new file mode 100644
> index 0000000..13c53aa
> --- /dev/null
> +++ b/recipes-kernel/turbostat/turbostat_3.4.bb
> @@ -0,0 +1,58 @@
> +#
> +# Copyright (C) 2013 Wind River Systems, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +SUMMARY = "Frequency and Idle power monitoring tools for Linux"
> +
> +DESCRIPTION = "The turbostat tool allows you to determine the actual \
> +processor frequency and idle power saving state residency on supported \
> +processors."
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> +
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
> +COMPATIBLE_HOST_libc-musl = "null"
> +
> +DEPENDS = "virtual/kernel"
> +
> +do_fetch[noexec] = "1"
> +do_unpack[noexec] = "1"
> +do_patch[noexec] = "1"
> +
> +# This looks in S, so we better make sure there's
> +# something in the directory.
> +#
> +do_populate_lic[depends] = "${PN}:do_configure"
> +
> +
> +EXTRA_OEMAKE = '\
> +                CC="${CC}" \
> +               'CFLAGS=-Wall -I${STAGING_KERNEL_DIR}/arch/x86/include/uapi ${LDFLAGS}' \
> +               '
> +
> +# If we build under STAGING_KERNEL_DIR, source will not be put
> +# into the dbg rpm.  STAGING_KERNEL_DIR will exist by the time
> +# do_configure() is invoked so we can safely copy from it.
> +#
> +do_configure_prepend() {
> +       mkdir -p ${S}
> +       cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S}
> +       cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h ${S}
> +       cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
> +       cp -r ${STAGING_KERNEL_DIR}/COPYING ${S}
> +}
> +
> +do_compile() {
> +       sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
> +       sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
> +       sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
> +       oe_runmake STAGING_KERNEL_DIR=${STAGING_KERNEL_DIR}
> +}
> +
> +do_install() {
> +       oe_runmake DESTDIR="${D}" install
> +}
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

