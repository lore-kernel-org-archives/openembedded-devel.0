Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E53EE732E3
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 15:09:58 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.15758.1695913796307998225
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 08:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H8Occ/RB;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50481a0eee7so3578818e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695913794; x=1696518594; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OOpHMtcu2KSXR9o+8bN8SaGegSAw3xpy6xCHbxgTMSs=;
        b=H8Occ/RB2Yk8NYxgeD8cAPSOvaEt61AbM+kr+SPHtcn4UmEMqF9Z4eZkWcVtmjQjW6
         vGR8mWMDqujuxkqoS4Js5ZcaGFvOb8aKralRRps8a7E/CkZP5r6acmF/fFX3XeUHUWNp
         2yiN1WKMNVO2KVBFWF02OLsXWtSO28pWaylBXTOY24ltycOVEyG47kvIT/4sXgO2xKgT
         b3NTQkK2bNsNcLCBsdGj37jIKNfNyNQfZQm3Q6drtJwRKG3wzEZE7n2WsdE7d89LGsbO
         Y6EGX8BATlr0xVKi5m5sU7HB9x5OAnKTBsgKL+0kZaDiH90u0NrlUrOg4Fp/VPsp2z0q
         531w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695913794; x=1696518594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOpHMtcu2KSXR9o+8bN8SaGegSAw3xpy6xCHbxgTMSs=;
        b=WeNJ/faVL1wDbhJG+TKUOXW/O2MuAoKigT309qgRVWJc92r7zn3YP2mJ3M75oipsKw
         047IqWTPQPkqx93FKBraDNMw594nMU9wh8eTj2DYMTpRVXYRtxHOd6Mj11ia21ZPuu1R
         hGmOKjtvM2B7ZXooybbf6qT5BtlvTEBUpT/NiAheeIfwNg4zdk6LDfhfI/Bato2wfWqR
         zR+jdHGQsJGZyCN0wke65RWhLFAmFClb5ks8HGYFSMJp/6tMGcnhxd3mcBUoKq/wldcl
         oMF8yYxKuPaIczSjCgw/UOpDyv5GbvfIrN97dUkOKs5LwBIu1SRx0FN+anIMH7QAPAnq
         Nn9Q==
X-Gm-Message-State: AOJu0YwlsMjwvcylvDPaPv5OGjaSpbo9+RRccDMN8B+tpN76tmOZ1aPh
	jQXp9StCyvvc8q0Zmmof0/cACMQ16Ww/jrdlprg=
X-Google-Smtp-Source: AGHT+IEm+Af2v3BZCZNTPxk9DXyJzQI/l2s2HwGyo92ciSVp7JY3+vocmk9agtDQgxFmYMbN4BBqTIifxeNfa87NavQ=
X-Received: by 2002:a05:6512:10d1:b0:501:be4d:6dc5 with SMTP id
 k17-20020a05651210d100b00501be4d6dc5mr1224022lfg.8.1695913793913; Thu, 28 Sep
 2023 08:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <1788A95F04E8B4F0.25618@lists.openembedded.org>
 <CABXoSoW=xU3fvq6EcaMxopw8e3FhEOLmYG59O1Fiyu8DKcT6Zg@mail.gmail.com> <f1f80ad8-bb44-4d7c-9be3-aa5c727fcc85@gmail.com>
In-Reply-To: <f1f80ad8-bb44-4d7c-9be3-aa5c727fcc85@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 28 Sep 2023 17:09:42 +0200
Message-ID: <CAJiuCcfpfECPgezDDUibmLToLmv8GRoAxLak3W+Eb2ZTURE9nQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] protobuf: stage protoc binary to sysroot
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Samuli Piippo <samuli.piippo@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 15:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105226

Hi,

On Thu, 28 Sept 2023 at 17:03, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> I think I was the one who originally removed protoc, because it's not useful in the sysroot. Even if you satisfy cmake so it can find protoc target, the next step is that it will try to use it, which will obviously fail.
>
> The only reason to put it on the target sysroot would be if you really going to use it _on the target_. But I guess this can be done via bbappend in the user layer.

The files is properly installed when you set PACKAGECONFIG to compiler.
FILES:${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"

Which is done when by default for native
PACKAGECONFIG:class-native ?= "compiler"

If you really need it in the target then set the package config
"compiler" for the target recipe.

But mixing architecture in the sysroot is a Hack and this would lead
to undefined behavior regarding the arch / tune you select.

Regards
Clement


>
> Vyacheslav
>
> On 27.09.2023 07:19, Samuli Piippo wrote:
>
> Re-applying this patch as it got removed in https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.377450-1-ross.burton@arm.com/
>
> On Wed, 27 Sept 2023 at 08:11, Samuli Piippo via lists.openembedded.org <samuli.piippo=gmail.com@lists.openembedded.org> wrote:
>>
>> From: Samuli Piippo <samuli.piippo@gmail.com>
>>
>> If protoc is enabled for the build, recipes using protobuf will
>> fail when protoc is not available in the recipe sysroot:
>>
>> |   The imported target "protobuf::protoc" references the file
>> |
>> |      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-3.21.5.0"
>> |
>> |   but this file does not exist.  Possible reasons include:
>> |
>> |   * The file was deleted, renamed, or moved to another location.
>> |
>> |   * An install or uninstall procedure did not complete successfully.
>> |
>> |   * The installation package was faulty and contained
>> |
>> |      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake"
>> |
>> |   but not all the files it references.
>>
>> Use SYSROOT_DIRS to stage the binary to sysroot so it's always
>> available for other recipes.
>>
>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
>> index d95e1c20f..06b21a0d6 100644
>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
>> @@ -92,6 +92,9 @@ PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
>>  FILES:${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
>>  FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
>>
>> +# CMake requires binaries to exist in sysroot, even if they have wrong architecture.
>> +SYSROOT_DIRS += "${bindir}"
>> +
>>  RDEPENDS:${PN}-compiler = "${PN}"
>>  RDEPENDS:${PN}-dev += "${PN}-compiler"
>>  RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
>> --
>> 2.25.1
>>
>>
>>
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105224): https://lists.openembedded.org/g/openembedded-devel/message/105224
> Mute This Topic: https://lists.openembedded.org/mt/101612304/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [peron.clem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

