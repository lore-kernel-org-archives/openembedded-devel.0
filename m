Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id F0B596D61B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 09:46:36 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p27so9740704eda.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 02:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FVGm8AUimueRjD4hNMJPptKasWDkOu9/PI613Lv0veI=;
	b=fuxPXOn8ydD3hnplsqggNuv02+h8NO2gfTkZeaQR2hfAIxHmQOVS7o2iHI2z1bvoCp
	/8/lDC619xGNqBb98LgY5CSl/ZSU0EtKBUAJExPYGVFg1/N3rQKsgzuObVJRYLh1dgT3
	LgHqEyevHSKJAXmHgJKTpYubqYBspPFUwwoH61NvddHHe+YZVe3tkaWYsFKl62ZWjJLk
	9eEx1PGlpw2ViekEhB/hKdIfgSB4YB2PyK9lDL8F2pax2Tw69s8smbUtavVNyTLRRwp/
	yxq9UHX3PbZLNY3IgJXae5wqEyqvYwDye+OqevJ42JxedKPhEsR4jR2rHT4IAFCCLFx6
	mwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FVGm8AUimueRjD4hNMJPptKasWDkOu9/PI613Lv0veI=;
	b=Q/FU47seeVaJCdvsByUK7L1a6v54k/1kUY5WbzmG70O5YWNzlJpFUphEewmlooaWPM
	8NH5ALuzwIlM0zRyNrjfmd7WAts8Sviav6IMgRn6nnFeYUm4PDAZJHMFS0I2woPBhaLE
	QECa6vtOr0SllrOd1adR9Ljg1n160H5iJwkQgC2oxtzL7KOTyRfeT0XKfZ1gigIJJkkL
	ZDw6JYLSeucHZZAEP/WFDz5swW8qr1i4x2lxqW+XamzfumlZtyJP4MlZMrtHMY0HbBHp
	qpomFmMddrZkhscLMBBsvw63+3ucfCtdI1vll1whNpbburHVDBIyrMBxdaIBHStxYBRT
	iwiw==
X-Gm-Message-State: APjAAAU8cgNUAa74r+P9HBn3CaqQ4W2N/NAlPBeRhfu4esJIJ+p4oehc
	c/kg3HQXjVMVdDXnYWIi5Bmy29aEjSBm4Pb5Tdg=
X-Google-Smtp-Source: APXvYqzxzrdUOEHE4noJjtyvlOSf861SiIDdf0PXVnS0KOUtCg2LgYsEMVLLQR5o6VPA8WrAwAVXmnwHmQvweaQD6uY=
X-Received: by 2002:a50:fc97:: with SMTP id f23mr55430430edq.104.1558086397628;
	Fri, 17 May 2019 02:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <1545969383-31548-1-git-send-email-ankit.tarot@gmail.com>
In-Reply-To: <1545969383-31548-1-git-send-email-ankit.tarot@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 May 2019 11:46:27 +0200
Message-ID: <CA+chaQdpP5Oq7Q-iu9bLeNQg6LRGJXYY7Ni=BRcchiKaffdkFw@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] spirv-tools: Initial recipe for spirv tools
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
X-List-Received-Date: Fri, 17 May 2019 09:46:37 -0000
Content-Type: text/plain; charset="UTF-8"

You should set the PV in the recipe, "git" as a version isn't very useful:
spirv-tools-git-r0

On Fri, Dec 28, 2018 at 4:54 AM Ankit Navik <ankit.tarot@gmail.com> wrote:

> Add generic recipe for spirv tools.
>
> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  .../0001-tools-lesspipe-Allow-generic-shell.patch  | 24 ++++++++++++++++
>  meta-oe/recipes-graphics/spir/spirv-tools_git.bb   | 32
> ++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644
> meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
>  create mode 100644 meta-oe/recipes-graphics/spir/spirv-tools_git.bb
>
> diff --git
> a/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
> b/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
> new file mode 100644
> index 0000000..e9a45c2
> --- /dev/null
> +++
> b/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
> @@ -0,0 +1,24 @@
> +From 03127fd5a6eff5ae2ebea2e9c6c01fbf1a0a421a Mon Sep 17 00:00:00 2001
> +From: Ankit Navik <ankit.tarot@gmail.com>
> +Date: Tue, 25 Dec 2018 14:34:09 +0530
> +Subject: [PATCH] tools/lesspipe: Allow generic shell
> +
> +Upstream-Status: Submitted [
> https://github.com/KhronosGroup/SPIRV-Tools/pull/2255]
> +Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> +---
> + tools/lesspipe/spirv-lesspipe.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/lesspipe/spirv-lesspipe.sh
> b/tools/lesspipe/spirv-lesspipe.sh
> +index 81e3355..f955259 100644
> +--- a/tools/lesspipe/spirv-lesspipe.sh
> ++++ b/tools/lesspipe/spirv-lesspipe.sh
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/usr/bin/env sh
> + # Copyright (c) 2016 The Khronos Group Inc.
> +
> + # Licensed under the Apache License, Version 2.0 (the "License");
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
> b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
> new file mode 100644
> index 0000000..aae11df
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
> @@ -0,0 +1,32 @@
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
> +SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools
> \
> +       file://0001-tools-lesspipe-Allow-generic-shell.patch \
> +       git://
> github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers
> <http://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=$%7BDEST_DIR%7D/spirv-headers>
> \
> +       git://
> github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee
> <http://github.com/google/effcee.git;name=effcee;destsuffix=$%7BDEST_DIR%7D/effcee>
> \
> +       git://
> github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2
> <http://github.com/google/re2.git;name=re2;destsuffix=$%7BDEST_DIR%7D/re2>
> \
> +       git://
> github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest
> <http://github.com/google/googletest.git;name=googletest;destsuffix=$%7BDEST_DIR%7D/googletest>
> \
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
> +       install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/*
> ${D}/${includedir}/spirv
> +}
> +
> +FILES_SOLIBSDEV = ""
> +FILES_${PN} += "${libdir}/*.so"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

