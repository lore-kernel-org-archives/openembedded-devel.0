Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id CD01E748D5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 00:36:13 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id m77-v6so1694819pfi.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 17:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=5JanwpmfO52Q01DDviPBWyawVCOJZ27/GT3ci4zaFIw=;
	b=cgGxTKllKFF4iV3phfLDb+pAgxw9dqahMbwtu9RZoju52NFaum8nLbD9eaONcxzEaT
	dnB/rrh981EecaAF7F9ThiSGqGvF1JRKAsYiuvAD4l4DAsLwM/uYOzT4cu2Mowt5gFiT
	0gwajnKtF0W/Et/rhv+n4v5azA+tL8lxP8LBkAnAAHnivrEua61kzJSEA5Lp0jIMAq/x
	3sQ5gDbaU5j18hyf3mSS5WUpTD+k9c9MchvUuBN5em2RH3KcBXYUbu3COsAECVCcnHef
	9VtHNQKPVm+EwcHcmEehExuCJFC8kg2KfIycLiH1FaZg+2xqf3vJdCQfzNFj42Vz1DDz
	4eSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=5JanwpmfO52Q01DDviPBWyawVCOJZ27/GT3ci4zaFIw=;
	b=TXwU7DnZgEdSskATjD6NRIJL+Dqjf+fOynZ91LLjfGuna17DZ4HtR2MlaOfbdURJWk
	3owk3OecIl8VyzSQQb8BcUabSgUa3T3/VD0uDvjMKEffpstxjzMWIMPmRp3LNqJhaXJb
	XKW2U29Btcg6HRm58w1IOoz4LpxP50UyEPhfmWmnhsRlvY7ZrW2tF2QZsnRhhSBUjG25
	nV+juEBP5Q2a75lvxPLlTg5xbhcLN+EQDjgzXgiyuVi8RtUYeckKrSveCJMP+EceYb48
	Hk9bZ14KKE58TAtXNh5epif05Mjd68I8oY0bJGT1xEcatnWtMCxIz3qRV6JcyLapjw6r
	DyZw==
X-Gm-Message-State: ABuFfojUyS6KTmpA7LrGjNxbk3S/FY0fXQ7f2vg2LfWfeV2IJdFfS2vM
	n/wtz1Zv3/SoL4fO7EPKBqow4Bfr
X-Google-Smtp-Source: ACcGV61Of+RkZfAkUSl+3W4KktbYAN6tt1spjC8CTi9PUSY54ASAJ8XKBewleT9QypJ28riSJ1MWFQ==
X-Received: by 2002:a63:d00b:: with SMTP id
	z11-v6mr27940241pgf.317.1539131774447; 
	Tue, 09 Oct 2018 17:36:14 -0700 (PDT)
Received: from [10.43.100.234] (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	e7-v6sm32555948pfk.3.2018.10.09.17.36.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Oct 2018 17:36:13 -0700 (PDT)
To: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>,
	openembedded-devel@lists.openembedded.org
References: <CAMKF1sqm2-6+mKtpLfk6jTwugc+vTy2U6mWrrKB8-iL-zV95qw@mail.gmail.com>
	<1539092429-3587-1-git-send-email-stefan.wiehler@missinglinkelectronics.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <b927b1b3-1816-9685-4ed2-bf2bb0b6e8e6@gmail.com>
Date: Tue, 9 Oct 2018 17:36:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1539092429-3587-1-git-send-email-stefan.wiehler@missinglinkelectronics.com>
Subject: Re: [meta-oe][PATCH v2] nvme-cli: add recipe
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
X-List-Received-Date: Wed, 10 Oct 2018 00:36:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/09/2018 06:40 AM, Stefan Wiehler wrote:
> NVMe management command line interface.
>
> Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
> ---
>
> Change: Use bash-completion class and patch bash completion install path
>
>  ...Makefile-fix-bash-completion-install-path.patch | 33 ++++++++++++++++++++++
>  meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb  | 21 ++++++++++++++

Would it be more appropriate to have this in the recipes-bsp ?


>  2 files changed, 54 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch
>  create mode 100644 meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb
>
> diff --git a/meta-oe/recipes-extended/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch b/meta-oe/recipes-extended/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch
> new file mode 100644
> index 0000000..ecd4f03
> --- /dev/null
> +++ b/meta-oe/recipes-extended/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch
> @@ -0,0 +1,33 @@
> +From ef64032b34190079aab591c64a25f7535a977390 Mon Sep 17 00:00:00 2001
> +From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
> +Date: Tue, 9 Oct 2018 11:26:34 +0200
> +Subject: [PATCH] Makefile: fix bash completion install path
> +
> +Change path to bash-completion upstream recommendation used by most
> +distributions.
> +
> +Upstream-Status: Submitted [https://github.com/linux-nvme/nvme-cli/pull/418]
> +
> +Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index fa587dd..433bc41 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -69,8 +69,8 @@ install-bin: default
> + 	$(INSTALL) -m 755 nvme $(DESTDIR)$(SBINDIR)
> + 
> + install-bash-completion:
> +-	$(INSTALL) -d $(DESTDIR)$(PREFIX)/share/bash_completion.d
> +-	$(INSTALL) -m 644 -T ./completions/bash-nvme-completion.sh $(DESTDIR)$(PREFIX)/share/bash_completion.d/nvme
> ++	$(INSTALL) -d $(DESTDIR)$(PREFIX)/share/bash-completion/completions
> ++	$(INSTALL) -m 644 -T ./completions/bash-nvme-completion.sh $(DESTDIR)$(PREFIX)/share/bash-completion/completions/nvme
> + 
> + install: install-bin install-man install-bash-completion
> + 
> +-- 
> +1.9.1
> +
> diff --git a/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb b/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb
> new file mode 100644
> index 0000000..9b7e6cd
> --- /dev/null
> +++ b/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "NVMe management command line interface"
> +AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
> +HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
> +DEPENDS = "util-linux"
> +PV .= "+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/linux-nvme/nvme-cli.git \
> +           file://0001-Makefile-fix-bash-completion-install-path.patch \
> +           "
> +SRCREV = "642d426faf8a67ed01e90f7c35c0d967f8cc52a3"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit bash-completion
> +
> +do_install() {
> +    oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> +}


