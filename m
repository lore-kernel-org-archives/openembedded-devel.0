Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 359A06BE24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Dec 2018 18:16:59 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id t33so15491401qtt.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Dec 2018 10:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5mbaiPYF1L5390qGkfmLi8793r2vGeZKm10X8cBf4wA=;
	b=cgZl4rz11sqOnQ38QdjnM6TnBCtkCOEvBdy9CmAwN64fkhXViuvSZl+NfPUArqzzQL
	NEPDJ+gcYLQVTopBmNFs2o+ixAKtg5jgjzVFmVam6SquhwfXyRj/qTnH2Tu8vSWpOnrg
	Uz5zrM4aKzq8zXpZClhlW8UF4HC6EDMhcVbXVQ02H+3XZEOqN0o+PUa7OaQag9p8lqiI
	RbnHOlz76HNkeLtVavtRQvo6uwizCHcL/lK2Du7drzK5xBpTrqeRK7r9L/kJdb9JVEiw
	H/wIrU43JoDYvF78p0NKzwPyJasLwlyB9X96e55q3cX53t/8VAo5Dv8PnDHO6ASuJ5JR
	q5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5mbaiPYF1L5390qGkfmLi8793r2vGeZKm10X8cBf4wA=;
	b=cKQF0pugmiVr1QGNoh8/KfYo94AmNAQoKGKCTRfRKOkoxnqvFWhgXSIMWCYCHkx7D6
	1E6oB9YTBIIRw3imbdZ9j/KWw8Ke1UlGcBPjudq7NIycta9QaKRijCcNcNnfRRc+6tw/
	KpdRRfXgcyHeHPBrksJszayuw0y8seZJlBsbrGV1Ak4tsNvtCMoaxAeJiX8nzNH+r1tp
	8vj6T49keFGQo3rA5ZIJk5DdO4mN3vRVoAiBoJNbSjf7jks+GVOuKRGRBF1kW68cYddA
	dCA9vyj5jf6GRxu8J1+1HIDtCoSzFToNFAOmAXE9MmshMh0OI5jU0ucm7SP3UGGD38EP
	+IZg==
X-Gm-Message-State: AJcUuke/B/ahIakWxlgzXvH00x7tIQqNtLaCiXiMB9l/hnTNx/JUkvUO
	f/i97ge6BF1zAwU28c0pqacUh3OcP7gsCQnJl3Y=
X-Google-Smtp-Source: ALg8bN78jZSsp6dpZv2jX0Y+3WJouDhS97cp7r1zQi11bvVg0RyRCpxEl+HnL9YKMnn3BBS72h8NqnR5DBCp85oYGvs=
X-Received: by 2002:a0c:93e2:: with SMTP id g31mr16156050qvg.194.1545761819750;
	Tue, 25 Dec 2018 10:16:59 -0800 (PST)
MIME-Version: 1.0
References: <1545735842-21144-1-git-send-email-ankit.tarot@gmail.com>
In-Reply-To: <1545735842-21144-1-git-send-email-ankit.tarot@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Dec 2018 10:16:34 -0800
Message-ID: <CAMKF1spJiGPHffpzVQbe5UBpA4hstAfKc5ain8Z87aq9ESiKCA@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] spirv-tools: Initial recipe for spirv tools
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
X-List-Received-Date: Tue, 25 Dec 2018 18:16:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 25, 2018 at 3:02 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Add generic recipe for spirv tools.
>
> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  .../0001-tools-lesspipe-Allow-generic-shell.patch  | 24 +++++++++++++++++
>  meta-oe/recipes-graphics/spir/spirv-tools_git.bb   | 31 ++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
>  create mode 100644 meta-oe/recipes-graphics/spir/spirv-tools_git.bb
>
> diff --git a/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch b/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
> new file mode 100644
> index 0000000..542d7ff
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
> @@ -0,0 +1,24 @@
> +From 03127fd5a6eff5ae2ebea2e9c6c01fbf1a0a421a Mon Sep 17 00:00:00 2001
> +From: Ankit Navik <ankit.tarot@gmail.com>
> +Date: Tue, 25 Dec 2018 14:34:09 +0530
> +Subject: [PATCH] tools/lesspipe: Allow generic shell
> +
> +Upstream-Status: Submitted [https://github.com/KhronosGroup/SPIRV-Tools/pull/2255]
> +Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> +---
> + tools/lesspipe/spirv-lesspipe.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/lesspipe/spirv-lesspipe.sh b/tools/lesspipe/spirv-lesspipe.sh
> +index 81e3355..f955259 100644
> +--- a/tools/lesspipe/spirv-lesspipe.sh
> ++++ b/tools/lesspipe/spirv-lesspipe.sh
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh

make it #!/usr/bin/env sh

> + # Copyright (c) 2016 The Khronos Group Inc.
> +
> + # Licensed under the Apache License, Version 2.0 (the "License");
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
> new file mode 100644
> index 0000000..9d31a06
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
> @@ -0,0 +1,31 @@
> +SUMMARY  = "The SPIR-V Tools project provides an API and commands for \
> +processing SPIR-V modules"
> +DESCRIPTION = "The project includes an assembler, binary module parser, \
> +disassembler, validator, and optimizer for SPIR-V."
> +LICENSE  = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +SECTION = "graphics"
> +
> +S = "${WORKDIR}/git"
> +DEST_DIR = "${S}/external"
> +SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools \
> +       file://0001-tools-lesspipe-Allow-generic-shell.patch \
> +       git://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers \
> +       git://github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee \
> +       git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2 \
> +       git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest \
> +"
> +SRCREV_spirv-tools = "167f1270a9ee641b17c016a545741e4aadfabe86"
> +SRCREV_spirv-headers = "4618b86e9e4b027a22040732dfee35e399cd2c47"
> +SRCREV_effcee = "8f0a61dc95e0df18c18e0ac56d83b3fa9d2fe90b"
> +SRCREV_re2 = "2cf86e5ab6dcfe045a1f510c2b9a8b012a4158cd"
> +SRCREV_googletest = "150613166524c474a8a97df4c01d46b72050c495"
> +
> +inherit cmake python3native
> +
> +do_install_append() {
> +       install -d ${D}/${includedir}/spirv
> +       install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv
> +}
> +
> +INSANE_SKIP_${PN}-dev += "dev-elf"

why is this needed ?

> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

