Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 23045753C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2018 07:41:36 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a22-v6so6202989pfo.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 00:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=EDg56r0JsKq9fNFJ7kzr1w3VIPH37MFyPVVdnzXWbLU=;
	b=cVe3cHd9cNUwRabOvZGvlqvFnrLfkM3sDyqzt0dlAmGpBVHTsi3TSt4193x1pfNfMb
	uWlsxgOVaA2nyv9CHguDDI7MDmUDr8+UI7vGFXNmyBswXggTYVt+8CLewxtLcl3ajrDI
	Pt+xnBGZDBEW2otdSd0iWsMko0zq0wM6Q6gxNSBGADhjj7jpdxKetFvsODwZOHhXkysj
	nMOd7y6D0LR7d2Af8LU5JN18jbbN6wbNbwfjnSWFutrLmQW8+UXsoC/V73bjIs+JVCk1
	xNLAgSvRf6txhwNRhQx7Ymue4GsPzh8kFknMDPwTLbTA6eNV3he5PC2wOEd2CDB4ohuJ
	lCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=EDg56r0JsKq9fNFJ7kzr1w3VIPH37MFyPVVdnzXWbLU=;
	b=GAgmEvcDLNJYAabSjtK9YEojPzeBLiFZJuMEp2y1cPJoLmOtJ98E/X/9oSTCnsQbae
	5CAEXhF2BGgNNvMTGOMWGy5gwUBI41kjdNG5QiYfVgyoLHCtJC89+Wq57AMRBoCyLNCL
	VP/2bbvoqqvaAs1Ny7EfO7F1UQ0FRQtUD3dS8GQCr/o3XQGywzQoVD/HbDVpmNKU91Kw
	ELqPv5TybzDMvHDEms09B8c6OeAYNaMuDrDzHy64ve2Q3O3WHuLj0HrYWcaxLawR9oRl
	yi78THvlkp5PoG6IDZUY5L/THekcWTV6cIAKRoWMARzXikGVDRg8L+9LRpI8reGK/fWG
	ahkA==
X-Gm-Message-State: APt69E3mODUdd2jjqRLKIgXEMSEGg/5YZIG2xkdMRYXXD6qy9SdmvHlW
	G0QAYR68MGYubrpyl/PhzYe7GCKM
X-Google-Smtp-Source: ADUXVKLRS9f2sgXqZzorUEi1KqVxves/7lciLO/XQvDoZDTAFtSJ8EVd2wddFZVHGEiBoHyha6t/lA==
X-Received: by 2002:a65:5d09:: with SMTP id
	e9-v6mr4332895pgr.150.1528443697819; 
	Fri, 08 Jun 2018 00:41:37 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:4576:376:b010:94ac])
	by smtp.gmail.com with ESMTPSA id
	u9-v6sm107546426pfi.60.2018.06.08.00.41.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 00:41:37 -0700 (PDT)
To: Dengke Du <dengke.du@windriver.com>, anuj.mittal@intel.com,
	openembedded-devel@lists.openembedded.org
References: <1528422567-14811-1-git-send-email-dengke.du@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <6effc8de-1e88-ea90-4f5b-7f44305ef48b@gmail.com>
Date: Fri, 8 Jun 2018 00:41:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1528422567-14811-1-git-send-email-dengke.du@windriver.com>
Subject: Re: [meta-intel][PATCH V2] mce-test: add it
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
X-List-Received-Date: Fri, 08 Jun 2018 07:41:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Dengke

subject seems to indicate its for meta-intel. if so then its sent to 
wrong ml.

On 6/7/18 6:49 PM, Dengke Du wrote:
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   .../mce-test/files/makefile-remove-ldflags.patch   | 23 +++++++++++
>   recipes-kernel/mce-test/mce-test_git.bb            | 48 ++++++++++++++++++++++
>   2 files changed, 71 insertions(+)
>   create mode 100644 recipes-kernel/mce-test/files/makefile-remove-ldflags.patch
>   create mode 100644 recipes-kernel/mce-test/mce-test_git.bb
> 
> diff --git a/recipes-kernel/mce-test/files/makefile-remove-ldflags.patch b/recipes-kernel/mce-test/files/makefile-remove-ldflags.patch
> new file mode 100644
> index 0000000..0ffedd2
> --- /dev/null
> +++ b/recipes-kernel/mce-test/files/makefile-remove-ldflags.patch
> @@ -0,0 +1,23 @@
> +Remove the default CFLAGS and LDFLAGS in Makefile. Ensure the extra linker flags can be passed.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +
> +diff --git a/cases/stress/hwpoison/Makefile b/cases/stress/hwpoison/Makefile
> +index da1cbd8..dec5b14 100644
> +--- a/cases/stress/hwpoison/Makefile
> ++++ b/cases/stress/hwpoison/Makefile
> +@@ -1,8 +1,8 @@
> +-CFLAGS := -g -Wall
> +-LDFLAGS := -g
> ++#CFLAGS := -g -Wall
> ++#LDFLAGS := -g
> +
> +-export CFLAGS
> +-export LDFLAGS
> ++#export CFLAGS
> ++#export LDFLAGS
> +
> + all:
> + 	mkdir -p bin
> diff --git a/recipes-kernel/mce-test/mce-test_git.bb b/recipes-kernel/mce-test/mce-test_git.bb
> new file mode 100644
> index 0000000..dca26a6
> --- /dev/null
> +++ b/recipes-kernel/mce-test/mce-test_git.bb
> @@ -0,0 +1,48 @@
> +#
> +# Copyright (C) 2012 Wind River Systems, Inc.
> +#
> +SUMMARY = "MCE test suite"
> +
> +DESCRIPTION = "The MCE test suite is a collection of tools and test scripts for \
> +testing the Linux RAS related features, including CPU/Memory error \
> +containment and recovery, ACPI/APEI support etc."
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
> +
> +PR = "r2"

Drop PR

> +
> +SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git;protocol=git \
> +           file://makefile-remove-ldflags.patch \
> +          "
> +# Use the commit date of SRCREV in PV.
> +#
> +SRCREV = "74bffd8b0aa27051aeaa1983a7b23975ca8d8726"
> +PE = "1"

We do not need PE its a new recipe.

> +PV = "20171030+git${SRCPV}"
> +
> +RDEPENDS_${PN} = "mcelog mce-inject dialog bash"
> +
> +COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
> +
> +S ="${WORKDIR}/git"
> +
> +inherit autotools-brokensep
> +
> +do_install_append(){
> +   install -d ${D}/opt/mce-test
> +   cp -rf ${S}/* ${D}/opt/mce-test/
> +}
> +
> +FILES_${PN} += "/opt"
> +FILES_${PN}-dbg += "/opt/mce-test/cases/function/hwpoison/.debug"
> +FILES_${PN}-dbg += "/opt/mce-test/cases/function/erst-inject/.debug"
> +FILES_${PN}-dbg += "/opt/mce-test/cases/function/pfa/.debug"
> +FILES_${PN}-dbg += "/opt/mce-test/cases/function/core_recovery/.debug"
> +FILES_${PN}-dbg += "/opt/mce-test/cases/stress/hwpoison/bin/.debug"
> +FILES_${PN}-dbg += "/opt/mce-test/cases/stress/hwpoison/tools/page-poisoning/.debug"
> +FILES_${PN}-dbg += "/opt/mce-test/cases/stress/hwpoison/tools/fs-metadata/.debug"
> +FILES_${PN}-dbg += "/opt/mce-test/bin/.debug"
> +FILES_${PN}-dbg += "/opt/mce-test/tools/ltp-pan/.debug"
> +FILES_${PN}-dbg += "/opt/mce-test/tools/simple_process/.debug"
> +FILES_${PN}-dbg += "/opt/mce-test/tools/page-types/.debug"
> 

