Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 241246079F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 04:10:45 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id w19-v6so12179733plq.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 21:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xePb4Y5N6M0Jai5uE8RMAp3IwcpBrsvA6y+Ha8Z9wkc=;
	b=fIYQl3XZdQxscWE7o1QTXQFHWzgC+pLTEz4GjOw75rUJVJhfKpL5btxGsES2HkhS3T
	omo0LZQHU1+2bABi9RBNrDxXiik5T2/4fcN9laXh0P0iZKoOitkZCkrOGG0dlD0+WEBu
	9qOYEUZfEw+nnUYXS34uIl3iKtidSQo5Svmc4s1cW1cG30g9l+6XtTt3AonBA6wOxkA6
	ddal6Ub12fL5FA/+R/SOGVXzYCkQc74ptC4w/xf2rtsj5JwwqWpfqhc3FtXVfFeWCQLX
	EoriFRf99KeFCHTkU1KIwB3DXtI5aMeb96N/S8yWtg2b1StfPCRU3kwvvIWnm92cEZOi
	o4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xePb4Y5N6M0Jai5uE8RMAp3IwcpBrsvA6y+Ha8Z9wkc=;
	b=Fl+LBYr97+KNA1A9kZZ+8jdrEJQAbZMgV716V98KrQOL2op/vQpJv8HhcWOwF/hQI5
	KabDtO34g5SfAhaAE+S0/0+cXf0MU9/4q3aDhiDeZSAFqhsf0VvkzxKMldgzI1LMce/u
	wJ+RatT89VwU+XasVbMTAcT6v3ANMlOt4O6bjdGG4IFsJRrxBukD7axS5eMn3glo2/Fp
	cQXCMFEqsGF943POhQae6C9LcHyK8qzpaYIvDIxAEfGsmI0OfjOfqTqoiQCGiiyBS3G+
	PT2aQxNBmgvI7RSXtBx7EIn3enKe9VRS4NTN40MKg47DBOt5UHZLg/8CGMMidmll2hq7
	m1XA==
X-Gm-Message-State: ALKqPwfnx98hTQ+19woYQYm/Wx4fuDpibWT9DsFJZxwdNTsE405MLaQT
	buYTeBfUYeavRkAQRYr2g0uUJaDkHUh7j+4sppA=
X-Google-Smtp-Source: AB8JxZp78m4wRWO6pSWhGeYnpfRne8JZB5FQvPX4RBGZXIFX8PXWvZJVJ9lWUqEqMb+Aky0Oc6c1Ft83+R/YgyUyt8I=
X-Received: by 2002:a17:902:14d:: with SMTP id
	71-v6mr1254335plb.275.1527048646787; 
	Tue, 22 May 2018 21:10:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:9384:0:0:0:0 with HTTP; Tue, 22 May 2018 21:10:15
	-0700 (PDT)
In-Reply-To: <20180523015108.34800-1-hongzhi.song@windriver.com>
References: <20180523015108.34800-1-hongzhi.song@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 May 2018 00:10:15 -0400
Message-ID: <CAMKF1socUcjP2tQnF2-rfF1zm8iqUape4-s_3OX1+bp6RdEiKg@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] turbostat: add the recipe of turbostat to meta-oe
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
X-List-Received-Date: Wed, 23 May 2018 04:10:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 22, 2018 at 9:51 PM, Hongzhi.Song
<hongzhi.song@windriver.com> wrote:
> From: Hongzhi Song <hongzhi.song@windriver.com>
>
> It is an efficient and necessary tool to reflect the status of X86
> processors. Turbostat reports processor topology, frequency, idle
> power-state statistics, temperature and power on X86 processors.
>
> Signed-off-by: Hongzhi Song <hongzhi.song@windriver.com>
> ---
>  recipes-kernel/turbostat/turbostat_3.4.bb | 56 +++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 recipes-kernel/turbostat/turbostat_3.4.bb
>
> diff --git a/recipes-kernel/turbostat/turbostat_3.4.bb b/recipes-kernel/turbostat/turbostat_3.4.bb
> new file mode 100644
> index 0000000..ec789c1
> --- /dev/null
> +++ b/recipes-kernel/turbostat/turbostat_3.4.bb
> @@ -0,0 +1,56 @@
> +#
> +# Copyright (C) 2013 Wind River Systems, Inc.
> +#

can you also add a note about license of recipe here along with copyrights.

> +SUMMARY = "Frequency and Idle power monitoring tools for Linux"
> +
> +DESCRIPTION = "The turbostat tool allows you to determine the actual \
> +processor frequency and idle power saving state residency on supported \
> +processors."
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> +
> +
> +PR = "r7"

drop this.

> +
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
> +

should this work on musl as well ?

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

