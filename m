Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B300E82CCA
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 19:48:08 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.26506.1695844086004700796
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 12:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JGE+coV8;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5042bfb4fe9so18869758e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 12:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695844084; x=1696448884; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=97NthAUZZpgrwwkvgBEBr6gwXoshSRDQLSRET3DHO3k=;
        b=JGE+coV8FJFUNcxC3yzj5ppOz+8mDIzYiPcvaFNERORQg+EtqlbEjbjUDsRgyfgXMJ
         FTWFnDNMSKSNtrt+ZMSvviDqSNpNpmineMCjDSVy8/nnXgWsbmEX2ZAFrlStLe5EcpHr
         +RX+dzQvWPKMF9QzXTAvHdB73C3ByDEUIkxFpgtomTCHSA4kPdScBRmGo8iAGeXyGsc1
         ibvC4QKQlRf9NlKzJn3yOGHa8ae4wfG8QzqLwP1QnhCW9rc9KORwxnlEO2VqythrzdL6
         +1TZnErP8T8n9f9ixnPwGWYX0phytdDPWQAtqdiDluKqlxTM0pWGyp/8XVSPOaiWGSPL
         NDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695844084; x=1696448884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97NthAUZZpgrwwkvgBEBr6gwXoshSRDQLSRET3DHO3k=;
        b=A5UpEwHFrMDRNrrwzQ9EWBeeqcxU7tdl/xvrBiCQxmslkIcyp3sA3ZIRRCEoG7Du/e
         ramTE8Q8NX0MtH3oFhAAgFPQ0EsPltbUH2lA+Vv76N/1/ov7YGwvk6eYrTCHEgQoD2kw
         ZxR8VnTDXm+jP+BZTKTtO67a0ZoquOz5+6JwwlLPcT8zMjg3Gmt5a3lLE+4EN/YRY+EZ
         1GWkCsMfeR3XXr4gnWJSHmfD8ujeHWhiGHEME/s1lzWRMSt6vqVQMUHoI9BV4C1fkEB6
         6JbQivN3CcHZqF5TqxyA+puBizNH3VjJa+eftXDPgN+V/ZKvEuxY/8WX3vbbAaoLNfyz
         z5gw==
X-Gm-Message-State: AOJu0YySlaWtzXcR6AkDp7jBQOnWCDVxdh4js84kwkhi81lUN9+Enpsa
	uTGbo31AwJXC7/r/qD3DbsC7sm/UeIY3YRHe36s=
X-Google-Smtp-Source: AGHT+IHLdD0cv73nc+/do04FFvTeCyNoEGA7ynn2VVAmxRdNu68JotpHx18XNWYyXlOKqGLrKJtVJY4VRXIpNgmii14=
X-Received: by 2002:a19:4f5d:0:b0:503:16d6:1f0b with SMTP id
 a29-20020a194f5d000000b0050316d61f0bmr2360565lfk.25.1695844083751; Wed, 27
 Sep 2023 12:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <1788A95F04E8B4F0.25618@lists.openembedded.org> <CABXoSoW=xU3fvq6EcaMxopw8e3FhEOLmYG59O1Fiyu8DKcT6Zg@mail.gmail.com>
In-Reply-To: <CABXoSoW=xU3fvq6EcaMxopw8e3FhEOLmYG59O1Fiyu8DKcT6Zg@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 27 Sep 2023 21:47:51 +0200
Message-ID: <CAJiuCccy1FUw_YtF+hf6N8m5NP1WDdSnKuV_m7tJnNbK3GVJJg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] protobuf: stage protoc binary to sysroot
To: Samuli Piippo <samuli.piippo@gmail.com>, Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 19:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105199

Hi Samuli,

On Wed, 27 Sept 2023 at 07:20, Samuli Piippo <samuli.piippo@gmail.com> wrote:
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

+Ross Burton

You will have the same issue with gRPC binaries and I think the best solution
is to fix the QT CMake instead of contaminating the rootfs, no?

You should update to have something like this:
https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/blob/master/CMakeLists.txt

Regards,
Clement


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
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105165): https://lists.openembedded.org/g/openembedded-devel/message/105165
> Mute This Topic: https://lists.openembedded.org/mt/101612304/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [peron.clem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

