Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA769749F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 01:15:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4V1F9Ys030304
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 18:15:24 -0700
Received: from [128.224.162.161] (128.224.162.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 30 May 2018 18:14:58 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20180528020041.33603-1-hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <50b5ba5a-6d57-56b3-616f-75a17d472dd4@windriver.com>
Date: Thu, 31 May 2018 09:15:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180528020041.33603-1-hongzhi.song@windriver.com>
X-Originating-IP: [128.224.162.161]
Subject: Re: [meta-oe][PATCH v3] turbostat: add the recipe of turbostat to meta-oe
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
X-List-Received-Date: Thu, 31 May 2018 01:15:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

ping

-- Hongzhi


On 2018年05月28日 10:00, Hongzhi.Song wrote:
> It is an efficient and necessary tool to reflect the status of X86
> processors. Turbostat reports processor topology, frequency, idle
> power-state statistics, temperature and power on X86 processors.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>   meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb | 58 +++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
>   create mode 100644 meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
>
> diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> new file mode 100644
> index 000000000..355941794
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
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
> +		'CFLAGS=-Wall -I${STAGING_KERNEL_DIR}/arch/x86/include/uapi ${LDFLAGS}' \
> +               '
> +
> +# If we build under STAGING_KERNEL_DIR, source will not be put
> +# into the dbg rpm.  STAGING_KERNEL_DIR will exist by the time
> +# do_configure() is invoked so we can safely copy from it.
> +#
> +do_configure_prepend() {
> +	mkdir -p ${S}
> +	cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S}
> +	cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h ${S}
> +	cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
> +	cp -r ${STAGING_KERNEL_DIR}/COPYING ${S}
> +}
> +
> +do_compile() {
> +	sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
> +	sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
> +	sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
> +	oe_runmake STAGING_KERNEL_DIR=${STAGING_KERNEL_DIR}
> +}
> +
> +do_install() {
> +	oe_runmake DESTDIR="${D}" install
> +}


