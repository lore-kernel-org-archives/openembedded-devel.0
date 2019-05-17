Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 807CC7DF4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 09:50:30 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id j12so9680012eds.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 02:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BDl9awkn/oejQZiBJ7XIiZdwzNXyYkFyWbHX8pDymRE=;
	b=LdrEWJx8sfFtjQRdO00fcwtv/8u75IAtnADj0VRiZLg6EBCtqRguvNCJ0LswR+Jxoc
	lp5uhAscX/O+D7D8omNJ0WJHxhzjslUH41gPeaKUfFbpPMnN0BvHb0adLqoNwgpsbQ0c
	MY3y+43Gr4sl1UO5/HuC1pEfMMziB3r0VBvKVf61qx3siFdckDiTLKA1PIHCkfG1ybU8
	uaGFRTrul5sgmfdeWkzFBjrZOSs0Dc5wEXtcQxksPDJMJoc2LEhU7TRtRZDH1HRM8F+T
	eE5qPsY6QmL2Vhv/2xncbUXjtxegIcLy80g/B4yLPaDkTK43EcQoe1lZU68NQ2vBOZwY
	ZfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BDl9awkn/oejQZiBJ7XIiZdwzNXyYkFyWbHX8pDymRE=;
	b=IwYip2fhktLsYp297H3fk7ckZgxuJglwrthU/r3K2NvI0OV/765G5idko5gBAahFSD
	VY0IgzCTjtKPKhfmlKt9NN9ECWqJaPLP0jLXfsN3s130QZLaswaKIlM9vaKdH9gtuj1T
	r8Qdtzqr2PSbLHJyIdiMhPVEhI2goKz/RdI9Ql3Sj4/NRefBAe1D2vVpt9JZDulY0v2h
	/pEo60+oanwB8xCDreTBC/hlNGdAYFpctapZzARrFtbLeiRu+nTTJs11aU1CLeQs6wOr
	LAG6O8sV3A6eDrd7JBm+35qDJZzxD5HTL9RtBNDXszlURdgpTJGXBHaiIAXEZ3so5Del
	Wnhw==
X-Gm-Message-State: APjAAAXFuvbhOvEwou7OELCPGPOsCVOhfGtekW/EgACgdrl83V/K8RNN
	W1l3TDTo88/lnJ+mN1FSbYy8Cf8fsjZNS2tNH2o=
X-Google-Smtp-Source: APXvYqzSV6p+zgep+Nb9czjXIzw5+VnzQI4hoyJFfTmu7NvEuySvaKbeiGGx6NjBLYSaJZ4EzTX1KmuN9PvWBj8cRgI=
X-Received: by 2002:a50:abe5:: with SMTP id u92mr51109592edc.164.1558086631260;
	Fri, 17 May 2019 02:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <1545969383-31548-1-git-send-email-ankit.tarot@gmail.com>
	<CA+chaQdpP5Oq7Q-iu9bLeNQg6LRGJXYY7Ni=BRcchiKaffdkFw@mail.gmail.com>
In-Reply-To: <CA+chaQdpP5Oq7Q-iu9bLeNQg6LRGJXYY7Ni=BRcchiKaffdkFw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 May 2019 11:50:21 +0200
Message-ID: <CA+chaQcOVeusDa8Dvmvu=MumoxMXRVDJFy64Au6UjbQVnVn2_Q@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 May 2019 09:50:31 -0000
Content-Type: text/plain; charset="UTF-8"

It also installs the library in wrong path with multilib:
ERROR: QA Issue: spirv-tools: Files/directories were installed but not
shipped in any package:
  /usr/lib
  /usr/lib/libeffcee.a

On Fri, May 17, 2019 at 11:46 AM Martin Jansa <martin.jansa@gmail.com>
wrote:

> You should set the PV in the recipe, "git" as a version isn't very useful:
> spirv-tools-git-r0
>
> On Fri, Dec 28, 2018 at 4:54 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
>> Add generic recipe for spirv tools.
>>
>> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
>> ---
>>  .../0001-tools-lesspipe-Allow-generic-shell.patch  | 24 ++++++++++++++++
>>  meta-oe/recipes-graphics/spir/spirv-tools_git.bb   | 32
>> ++++++++++++++++++++++
>>  2 files changed, 56 insertions(+)
>>  create mode 100644
>> meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
>>  create mode 100644 meta-oe/recipes-graphics/spir/spirv-tools_git.bb
>>
>> diff --git
>> a/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
>> b/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
>> new file mode 100644
>> index 0000000..e9a45c2
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-graphics/spir/files/0001-tools-lesspipe-Allow-generic-shell.patch
>> @@ -0,0 +1,24 @@
>> +From 03127fd5a6eff5ae2ebea2e9c6c01fbf1a0a421a Mon Sep 17 00:00:00 2001
>> +From: Ankit Navik <ankit.tarot@gmail.com>
>> +Date: Tue, 25 Dec 2018 14:34:09 +0530
>> +Subject: [PATCH] tools/lesspipe: Allow generic shell
>> +
>> +Upstream-Status: Submitted [
>> https://github.com/KhronosGroup/SPIRV-Tools/pull/2255]
>> +Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
>> +---
>> + tools/lesspipe/spirv-lesspipe.sh | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/tools/lesspipe/spirv-lesspipe.sh
>> b/tools/lesspipe/spirv-lesspipe.sh
>> +index 81e3355..f955259 100644
>> +--- a/tools/lesspipe/spirv-lesspipe.sh
>> ++++ b/tools/lesspipe/spirv-lesspipe.sh
>> +@@ -1,4 +1,4 @@
>> +-#!/bin/bash
>> ++#!/usr/bin/env sh
>> + # Copyright (c) 2016 The Khronos Group Inc.
>> +
>> + # Licensed under the Apache License, Version 2.0 (the "License");
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
>> b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
>> new file mode 100644
>> index 0000000..aae11df
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
>> @@ -0,0 +1,32 @@
>> +SUMMARY  = "The SPIR-V Tools project provides an API and commands for \
>> +processing SPIR-V modules"
>> +DESCRIPTION = "The project includes an assembler, binary module parser, \
>> +disassembler, validator, and optimizer for SPIR-V."
>> +LICENSE  = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>> +SECTION = "graphics"
>> +
>> +S = "${WORKDIR}/git"
>> +DEST_DIR = "${S}/external"
>> +SRC_URI = "git://
>> github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools \
>> +       file://0001-tools-lesspipe-Allow-generic-shell.patch \
>> +       git://
>> github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers
>> <http://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=$%7BDEST_DIR%7D/spirv-headers>
>> \
>> +       git://
>> github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee
>> <http://github.com/google/effcee.git;name=effcee;destsuffix=$%7BDEST_DIR%7D/effcee>
>> \
>> +       git://
>> github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2
>> <http://github.com/google/re2.git;name=re2;destsuffix=$%7BDEST_DIR%7D/re2>
>> \
>> +       git://
>> github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest
>> <http://github.com/google/googletest.git;name=googletest;destsuffix=$%7BDEST_DIR%7D/googletest>
>> \
>> +"
>> +SRCREV_spirv-tools = "167f1270a9ee641b17c016a545741e4aadfabe86"
>> +SRCREV_spirv-headers = "4618b86e9e4b027a22040732dfee35e399cd2c47"
>> +SRCREV_effcee = "8f0a61dc95e0df18c18e0ac56d83b3fa9d2fe90b"
>> +SRCREV_re2 = "2cf86e5ab6dcfe045a1f510c2b9a8b012a4158cd"
>> +SRCREV_googletest = "150613166524c474a8a97df4c01d46b72050c495"
>> +
>> +inherit cmake python3native
>> +
>> +do_install_append() {
>> +       install -d ${D}/${includedir}/spirv
>> +       install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/*
>> ${D}/${includedir}/spirv
>> +}
>> +
>> +FILES_SOLIBSDEV = ""
>> +FILES_${PN} += "${libdir}/*.so"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

