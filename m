Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id D4333771A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2018 08:27:08 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id r21-v6so5711934pgv.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 01:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=EDg56r0JsKq9fNFJ7kzr1w3VIPH37MFyPVVdnzXWbLU=;
	b=CEJoQNP94FTEPigt/mYT6xWOZMuuChF3jz9Y9yCqtnsMZdeRtE2GQ6rGGWeG9ROxaX
	lEBvpYz1dciPwZFjrSe660FUmuuIUMomAZl3LtHXSTO/Wrw3J/uXnvJxXssgGvhmDas7
	uRyuAZ8EXvsaGs2KvuJo9TsPOSVPIq1oy7Pnfhl2HetYofNy6/53GDrdLmcn0GCOTkoB
	tyyqwdndvJ0MXEsn232q14ImvgdyxAPd6MsSj4N5Ze5gRwnT5E4l2KVAWsk3NjSLSk2X
	oLwrv/Q/6oL2CYxOMB2v+6fN2uDXl/NrpuCqdzJlpXazNGnbMyjJedLOGe8Nw9GTl1pK
	Lu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=EDg56r0JsKq9fNFJ7kzr1w3VIPH37MFyPVVdnzXWbLU=;
	b=Va50X5eq2qkF0mj+D1qbO6FFj6duomfgGIsyEGwxqnrbU30tfgYuOt/FwPPpZOnSit
	GRMTIrcYHGx6ukJ5oEk98rMorcs5exfyKUXxzYlfCbZGXv4qM8adJCZkOrnVxelfAAOB
	qujdcbipB+/i7nGYmEYoifxhs/aRVrjOuwB2B1FQKwiyvl8n70nL/jKrhELj2dzMTe1g
	Aa0noZdmo/j998xn3wlkhSfLvi2IYoIQto86PM/PW5LUyIh/aziPhfBNq3+wiXEau5qA
	gg59DTsrk/ojxXRdbv3l9IXxatMhScgeTELDzSZPUkvV3pgdRx52n4QlNWCsNmWhzS6z
	ngrg==
X-Gm-Message-State: APt69E1Ii1bcR34vlhofYGRuSKMktNj2KDbL6Yt6h0/ifeA5afYzOB0p
	3qoX+Q/4mMWjDA5HaKbw0HejMXf5
X-Google-Smtp-Source: ADUXVKK4pDiPkYS4J1FUGudkO0/cAgfy63vPRKRn9SEkPZnmA1zowvAGspKN8VY777Hfw9KfcoEgSA==
X-Received: by 2002:a62:1855:: with SMTP id
	82-v6mr5066165pfy.132.1528446429440; 
	Fri, 08 Jun 2018 01:27:09 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:cc7d:178e:51d6:ef12])
	by smtp.gmail.com with ESMTPSA id
	m22-v6sm17622685pfg.61.2018.06.08.01.27.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 01:27:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Dengke Du <dengke.du@windriver.com>, anuj.mittal@intel.com,
	openembedded-devel@lists.openembedded.org
References: <1528422567-14811-1-git-send-email-dengke.du@windriver.com>
Organization: HIMVIS LLC
Message-ID: <3fcfbf73-9a52-d6c3-4b43-ac4942e54232@gmail.com>
Date: Fri, 8 Jun 2018 01:27:07 -0700
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
X-List-Received-Date: Fri, 08 Jun 2018 08:27:09 -0000
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

