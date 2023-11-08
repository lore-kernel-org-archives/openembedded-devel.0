Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAF7C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 15:33:47 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.16887.1699457617874993160
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 07:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CYxQRIzy;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c5b7764016so94449681fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 07:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699457616; x=1700062416; darn=lists.openembedded.org;
        h=to:references:message-id:date:cc:in-reply-to:from:subject
         :mime-version:content-transfer-encoding:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZyqzXHDct1xGG2phld+CyO1onDPlqRUKWy/lBudDKY=;
        b=CYxQRIzy9YKjYG1E9imAnn1+N9aYoUJgLpbdY34VvkLYDUQWrv6KlVz/izHvrZVS40
         +/dAOm0pMOxwSeB2x+KA6Z8ERcW9uGCdlFQ8W0eiXpGAHTuyYnBANZxOyzq69LLXH9cf
         8nWWXtWUZaisKsUeVC+q0+P3X1SY/6J9Ea2qgMEa84SAgrYR3wH0gRyfwoJ96KadQXFp
         58mv8mL3qqgaHrR3xRO8xhECczLua0KifookNNEsINcr9ZfoU0fBUdDpuc9ZnZd+sH3X
         v+u7/6gvCQbfKHuHFr6ny8eRN+M2tXLdC3oW8uzwFv8E1EqU3hCpUhYPrPthg8DotUZn
         ppLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699457616; x=1700062416;
        h=to:references:message-id:date:cc:in-reply-to:from:subject
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YZyqzXHDct1xGG2phld+CyO1onDPlqRUKWy/lBudDKY=;
        b=IBuVZbXeJMs34uLKgwsP8In7AN3CDtPDs05clZmcWkujJ55SpWESKz6GL5LAjMWVvS
         twNhrJDP2bE3Ne2ullTlGOhd/0zbeFwayEygY8DmyAu9fNPl40u+anJHt+2KackMjOpM
         UpVMjr9rktQQhB4LB1L6caRNqJd7Qj+qn9lAfA0NPFt5qC4kyiAIj47ZO1NjEEf5MV/W
         EAyrJz88t3k6OElcXj7Df9aEsuL8ZlSV7E4gOlzCupP9o4AuuKiu/w6pCRbrr6WBzn1Y
         4zo87DMjegtiN8nwUYtPFHPjs/nSLW+4PVgPNa23aA7OqRvkORn9mxyosBDR2to3tTqO
         vbuw==
X-Gm-Message-State: AOJu0YzeHut24HTuyLiJtS0fe+q0TnUWsDEFZ7hldaTQwJclV5ic/B6e
	Ky2IvBlpPYqugaxEzPFTqyY=
X-Google-Smtp-Source: AGHT+IHa0OoCfdy0hbIzxyG+7Sdk58txOoocxoguI6lOO8XE52tD8cMatrVAKW6sfYFE0tcMDuT8lg==
X-Received: by 2002:a2e:bea3:0:b0:2c5:1553:9129 with SMTP id a35-20020a2ebea3000000b002c515539129mr2392315ljr.35.1699457615555;
        Wed, 08 Nov 2023 07:33:35 -0800 (PST)
Received: from smtpclient.apple ([2001:999:584:6fab:8992:a7a1:aeb2:f041])
        by smtp.gmail.com with ESMTPSA id y4-20020a05651c106400b002c12b823669sm1836542ljm.32.2023.11.08.07.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 07:33:35 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: [oe] [meta-oe][PATCH] abseil-cpp: fix mingw build
From: Samuli Piippo <samuli.piippo@gmail.com>
In-Reply-To: <AS1PR10MB569712676AD597C3A1EFC2FEFDA8A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Cc: openembedded-devel@lists.openembedded.org, jpewhacker@gmail.com
Date: Wed, 8 Nov 2023 17:33:23 +0200
Message-Id: <08EC39A3-1E05-457F-9898-43ED56069757@gmail.com>
References: <AS1PR10MB569712676AD597C3A1EFC2FEFDA8A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
To: "Marko, Peter" <Peter.Marko@siemens.com>
X-Mailer: iPhone Mail (21A360)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 15:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106480

The sysroot addition is not about executables and nothing is trying to run t=
hose from the target sysroot. Problem here is that CMake checks that all the=
 installed files are available when using abseil in an another build (protob=
uf in this case) and complains if the files are not there. See the error in t=
he commit message.=20

There is a lengthy thread about SYSROOT_DIR problem of similar nature with p=
rotobuf recipe.=20


> On 8. Nov 2023, at 16.53, Marko, Peter <Peter.Marko@siemens.com> wrote:
>=20
> =EF=BB=BF-----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.=
openembedded.org> On Behalf Of Samuli Piippo via lists.openembedded.org
> Sent: Wednesday, November 8, 2023 15:23
> To: openembedded-devel@lists.openembedded.org
> Cc: jpewhacker@gmail.com
> Subject: [oe] [meta-oe][PATCH] abseil-cpp: fix mingw build
>=20
>> Add patch to fix mingw build of abseil-cpp
>> undefined reference to `absl::lts_20230802::synchronization_internal::Win=
32Waiter::Poke()'
>> undefined reference to `absl::lts_20230802::synchronization_internal::Win=
32Waiter::Win32Waiter()'
>> undefined reference to `absl::lts_20230802::synchronization_internal::Win=
32Waiter::Post()'
>> undefined reference to `absl::lts_20230802::synchronization_internal::Win=
32Waiter::Poke()'
>> and include bindir to recipe sysroot to fix protobuf build.
>> |   The imported target "absl::log_severity" references the file
>> |
>> |      "../nativesdk-protobuf/4.23.4/recipe-sysroot/usr/local/oe-sdk-hard=
coded-buildpath/sysroots/x86_64-w64-mingw32/usr/bin/libabsl_log_severity.dll=
"
>> |
>> |   but this file does not exist.
>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>> ---
>> ...workaround-for-MinGW64-build-failure.patch | 28 +++++++++++++++++++
>> .../abseil-cpp/abseil-cpp_git.bb              |  3 ++
>> 2 files changed, 31 insertions(+)
>> create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Ad=
d-workaround-for-MinGW64-build-failure.patch
>> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Add-work=
around-for-MinGW64-build-failure.patch b/meta-oe/recipes-devtools/abseil-cpp=
/abseil-cpp/0004-Add-workaround-for-MinGW64-build-failure.patch
>> new file mode 100644
>> index 000000000..79c2ba7d7
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Add-workaround-=
for-MinGW64-build-failure.patch
>> @@ -0,0 +1,28 @@
>> +=46rom 2f198d4fd8e0e66a2cd7ef53f62c8c9acf356803 Mon Sep 17 00:00:00 2001=

>> +From: Samuli Piippo <samuli.piippo@qt.io>
>> +Date: Wed, 8 Nov 2023 07:18:37 +0000
>> +Subject: [PATCH] Add workaround for MinGW64 build failure
>> +
>> +Add extra include so that _WIN32_WINNT is defined to correct
>> +version when building with MinGW.
>> +
>> +Fixes #1510
>> +
>> +Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>> +Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/15=
64]
>> +---
>> + absl/synchronization/internal/win32_waiter.h | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/absl/synchronization/internal/win32_waiter.h b/absl/synchro=
nization/internal/win32_waiter.h
>> +index 87eb617c..517829e6 100644
>> +--- a/absl/synchronization/internal/win32_waiter.h
>> ++++ b/absl/synchronization/internal/win32_waiter.h
>> +@@ -17,6 +17,7 @@
>> + #define ABSL_SYNCHRONIZATION_INTERNAL_WIN32_WAITER_H_
>> +
>> + #ifdef _WIN32
>> ++#include <windows.h>
>> + #include <sdkddkver.h>
>> + #endif
>> +
>> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta=
-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
>> index 5003187d0..3e4820642 100644
>> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
>> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
>> @@ -15,6 +15,7 @@ SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D=
${BRANCH};protocol=3Dhttps \
>>          file://0002-Remove-maes-option-from-cross-compilation.patch \
>>          file://abseil-ppc-fixes.patch \
>>          file://0003-Remove-neon-option-from-cross-compilation.patch \
>> +           file://0004-Add-workaround-for-MinGW64-build-failure.patch \
>>         "
>> S =3D "${WORKDIR}/git"
>> @@ -32,4 +33,6 @@ EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
>> BBCLASSEXTEND =3D "native nativesdk"
>> +SYSROOT_DIRS:append:class-nativesdk:mingw32 =3D "${bindir}"
>=20
> You need to use leading space if you append.
>=20
> Additionally, what's the reason for mingw32 override?
> I'd expect the binaries to be required (or not required) independently on d=
istro.
>=20
> And finally, is this correct thing to do?
> You should not execute nativesdk binaries as native, you should rather add=
 dependency on abseil-cpp-native to recipe where you have failure without it=
.
>=20
>> +
>> FILES:${PN}-dev +=3D "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
>> --
>> 2.25.1

