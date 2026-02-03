Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D5BE8B36C
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 21:50:21 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5432.1770155419438376962
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 13:50:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jBxhnvHO;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so4251763f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 13:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770155418; x=1770760218; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZ1yP3irI1ugMi0qpfWNMOq4qIIzOZRKt8oElNCEOdc=;
        b=jBxhnvHOt9jgINzu653LGG7EtPZvp1e/A6eKfnH/slE7UX2i0T+/EHbls+rZ73RaSI
         j8qytlGg2NKp91dcDLs7VHxyR/hV6LClwylhSJ4hPSKQrT2oN3QGDpLxNqEc17s+IXPC
         XgnsCvf2wZa/TFPS2t+YwW72DVyIgvu9d7AoGlKZrO/b0jjx+7yICRnr5VDSz6SJGeKR
         IV1kr9eoRBxsfgTr2X1RhdLyQQKysFVgVsizuGCjssBZwdPdjpTcLB3LIVF8dKoox2bS
         fUK9IafEyk0OrSkOYyQjFq8je5aXAbIewG1HPHgdsn9xpqIQSntFDSwyYAEAeg13WseF
         gPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770155418; x=1770760218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZ1yP3irI1ugMi0qpfWNMOq4qIIzOZRKt8oElNCEOdc=;
        b=TBSnuiRVb+HeMOTwF7dymq+79kKqEb9y/b/ztgbmTjR1iu0Yy7poRaHy6kZm6uwxNn
         VfICVcbN1mRxv7cVwCFcwup/pTgZFBUCX3teLl+G01LK/6MBYDq+JmAZ4BqkAjlB9+HM
         Ci1F8n4fq+IWAlLdHPfIz4wTsnLUYCgdoBCVyMjd8gHz2JftSwtKZAml97S3GGDmv1GT
         3O4DRbaO4yPytxkCQF8RjAQpZowdFG+5EIChHsxtj/OopmrKZBOudvvc3jMtQsKH+PbA
         rTnSOd0vqu1SKlE93Vy4dKeRSNLNDA6Ocq3FDMXYfPF4Q1Z5F5ZyL1iQKacwPzFZ/vfK
         hxag==
X-Gm-Message-State: AOJu0YxP2anheBbt1Oq0WZk2jAlX0AZwsPzroxIWyRgEfjcJdQ/qfDBv
	suAHBFbVA+JFRVjxx9m7CLw5ylFmGJdzLaTTOhHxzsqUJRyAC5wjHhIy7kbaEg==
X-Gm-Gg: AZuq6aIdH985IH1hI1c0SRWtxRmFP0qB9Z7t0YXYClBysxFf+px8EzxTPdjWdXyQBPI
	9wcjl4eQ+dV/jfHk9TksQemo4BbfgXkhDeenQy2nMButxvNv9KZD22ueDxW6TOiid6Zfn/4zGaJ
	ZeNFEaI9mWOQ/VgZMzTZT067KOoo930vEo6ZSP6MwSs+HItXU4Es4n1NZw9O7CyZaRDxenKp2Zo
	685plRrjUKQOKCqIXQ5nmzWCWwGdr2sb9tjNdPUtFM5ArjTanBb1Bb8OreSiuhskyNda8zOpyj1
	rBmlZADLuJ2vhu0/5bKi82MrlTMIK/Utus3jJRJ4eY1sXBc3+MtfHOh0tJBYKZjH92ocT4wfP+g
	QSOOLiXOoZxkzomVqW+Qk0omOXA7S/VOWhA2sYkmwr47AWFQmcr96CVeHwOAa8QTUrmbugfcc/I
	4DLGOrrb4i1WLG9He89Cs=
X-Received: by 2002:a05:6000:144a:b0:435:99d5:9d90 with SMTP id ffacd0b85a97d-43617e38f3emr1235050f8f.3.1770155417400;
        Tue, 03 Feb 2026 13:50:17 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e387b9sm1620685f8f.12.2026.02.03.13.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 13:50:16 -0800 (PST)
Message-ID: <20c9fdae-9dd0-4a1e-b709-c7d668bb03d5@gmail.com>
Date: Tue, 3 Feb 2026 22:50:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][whinlatter][PATCH 13/15] nodejs: upgrade 22.21.1
 -> 22.22.0
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260202211401.1287664-1-skandigraun@gmail.com>
 <20260202211401.1287664-13-skandigraun@gmail.com>
 <CADySD0EAw8EY+gHxRU23RLn+2=pKfda1YWWuis1z1DXeAF6-UQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CADySD0EAw8EY+gHxRU23RLn+2=pKfda1YWWuis1z1DXeAF6-UQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 21:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124112



On 2/3/26 10:55, Ankur Tyagi wrote:
> Hi Gyorgy,
>
> Getting following error when building for qemux86 with musl and clang
>
> | /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-linux-musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld:
> /usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/bits/atomic_base.h:1090:(.text._ZN2v88internal12_GLOBAL__N_120ElementsAccessorBaseINS1_21TypedElementsAccessorILNS0_12ElementsKindE37EdEENS1_18ElementsKindTraitsILS4_37EEEE27CopyTypedArrayElementsSliceENS0_6TaggedINS0_12JSTypedArrayEEESB_jj+0xe05):
> undefined reference to `__atomic_store'
> | /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-linux-musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld:
> /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-linux-musl/nodejs/22.22.0/sources/node-v22.22.0/out/Release/obj.host/v8_base_without_compiler/deps/v8/src/objects/elements.o:
> in function `std::remove_volatile<double>::type
> std::__atomic_impl::load<double>(double const*, std::memory_order)':
> | /usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/bits/atomic_base.h:1099:(.text._ZN2v88internal12_GLOBAL__N_121TypedElementsAccessorILNS0_12ElementsKindE37EdE15GetInternalImplEPNS0_7IsolateENS0_6HandleINS0_8JSObjectEEENS0_13InternalIndexE+0x7c):
> undefined reference to `__atomic_load'
> | /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-linux-musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld:
> /usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/bits/atomic_base.h:1099:(.text._ZN2v88internal12_GLOBAL__N_120ElementsAccessorBaseINS1_21TypedElementsAccessorILNS0_12ElementsKindE38EhEENS1_18ElementsKindTraitsILS4_38EEEE27CopyTypedArrayElementsSliceENS0_6TaggedINS0_12JSTypedArrayEEESB_jj+0x549):
> undefined reference to `__atomic_load'
>
> Can you please have a look into it?

I don't think that I can unfortunately. It seems to be something with
the -latomic LDFLAG. I *think* that the problem is the library order in
the linker invocation. libatomic appears very early in the command,
before any other resource, and I think it should appear at the end. But
I'm not familiar with gyp, and nodejs takes 30 minutes to show that my
try about reordering the flags was unsuccessful.

As a sidenote, it is not a regression from this patch, it has the same
issue with the current version also - but if it's a stopper for
Whinlatter, feel free to drop this. I might take another shot at it in
the future.


>
> cheers
> Ankur
>
>
> On Tue, Feb 3, 2026 at 10:14 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> From: Jason Schonberg <schonm@gmail.com>
>>
>> This is the December 2025 security release that the nodejs team released
>> January 13, 2026.
>>
>>   3 high severity issues.
>>   4 medium severity issues.
>>   1 low severity issue.
>>
>> High priority fixes:
>>   CVE-2025-55131
>>   CVE-2025-55130
>>   CVE-2025-59465
>>
>> Medium priority fixes:
>>   CVE-2025-59466
>>   CVE-2025-59464
>>   CVE-2026-21636 *
>>   CVE-2026-21637
>>
>> Low priority fixes:
>>   CVE-2025-55132
>>
>> * note that this medium priority CVE only effects Nodejs v25.
>>
>> https://nodejs.org/en/blog/vulnerability/december-2025-security-releases
>>
>> Changelog: https://github.com/nodejs/node/releases/tag/v22.22.0
>>
>> Signed-off-by: Jason Schonberg <schonm@gmail.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit 0bb156371e433cf3e9fdc4291da2319d63a83575)
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  .../oe-npm-cache                                                | 0
>>  ...oe-cache-native_22.21.bb => nodejs-oe-cache-native_22.22.bb} | 0
>>  .../nodejs/{nodejs_22.21.1.bb => nodejs_22.22.0.bb}             | 2 +-
>>  3 files changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.21 => nodejs-oe-cache-22.22}/oe-npm-cache (100%)
>>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.21.bb => nodejs-oe-cache-native_22.22.bb} (100%)
>>  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.21.1.bb => nodejs_22.22.0.bb} (98%)
>>
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.21/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-npm-cache
>> similarity index 100%
>> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.21/oe-npm-cache
>> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-npm-cache
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.21.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.22.bb
>> similarity index 100%
>> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.21.bb
>> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.22.bb
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
>> similarity index 98%
>> rename from meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
>> rename to meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
>> index ccaf9f7bb2..443cdc430d 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
>> @@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
>>  SRC_URI:append:toolchain-clang:powerpc64le = " \
>>             file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
>>             "
>> -SRC_URI[sha256sum] = "487d73fd4db00dc2420d659a8221b181a7937fbc5bc73f31c30b1680ad6ded6a"
>> +SRC_URI[sha256sum] = "4c138012bb5352f49822a8f3e6d1db71e00639d0c36d5b6756f91e4c6f30b683"
>>
>>  S = "${UNPACKDIR}/node-v${PV}"
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#124086): https://lists.openembedded.org/g/openembedded-devel/message/124086
>> Mute This Topic: https://lists.openembedded.org/mt/117604901/3619737
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ankur.tyagi85@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


