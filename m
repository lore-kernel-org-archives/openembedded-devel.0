Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17364C7EE39
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:46:49 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.35695.1751276808571118094
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TMvVmH15;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so1892883a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 02:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751276807; x=1751881607; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IB2cff9MahqkOOg/khEduUDvuZjKqMTm+ZbulZ8uJw4=;
        b=TMvVmH15R9k3g+mGNFunVV+V4bRA9EUUctHwHfNkjj/WDHgvsAaDq/E6HuK/3tG50S
         QhWHhQdFNBjjnuan0SQClyNA7hhjl0OjgFzvYkpXBT6N11FYe1k0R9EuD6llrKBzxXd/
         N2HLGQTWVn3RmYJ3Z/cMwPt+5Scv6p5aekidlXl9CTGHXwHauEquxx+hElDB7sOWTZhe
         e39mAequw+iMKLu6xj/BZwyWvQaKRA3SK1pU+QRc4gdELyELemHLUBTGENxEZv8EQYV+
         65TyF0CYCPYqoIzXDHIpFuotNndneOTrvETCEQEglkHeN3CHle511ipAIVvDj3DYV5kC
         abOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751276807; x=1751881607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IB2cff9MahqkOOg/khEduUDvuZjKqMTm+ZbulZ8uJw4=;
        b=YSxeNv7Zq7DKK5C9KnAR8BU+bceH7BI5cPSj1N7Ht7LbHc+HNPnJepLCjm+cfW+PYU
         syicqQzrZZlUBn7ab3t/n2U5Fj2UXm/NykMvyI8NIDcoW8qaddvQy03ZLUN6j1S4l/ov
         hEg2okLKgmt3HhQjToV/fosQTTgBTyd00JNIzn+LL2JIJQj+ppQUQTgX/I70QOwxzYeh
         jEd4mYHErQlrw5JvCmGVfEdZtL+kPJSYxkqg+fSl499mE5RwymBLExQj4jlj1Hu9h8Yw
         I8yPb6yXcSE4bVvzwb4syWy6Onex0lkly4yu7TSrOeC6I79tKJUT8UURs/MVWwv8ZrAy
         tn/Q==
X-Gm-Message-State: AOJu0YwS9CCyCdGMTWuhQJvMJWJpCdq5LP3CK3g2DiJULggID0d7R5gL
	mWmZBu1NjX7NtGWQqp2pRaVVlTQKSdqFbBEr6DLNgGdZ1Q5hupZZkRoj
X-Gm-Gg: ASbGnctrKXBFXcV2gR60q2t54i1IvRCaM/INRZqQV8D0yO//0TY6maKKYkIf1RYNQX3
	So3cv4kLdrUHk1fG8RmXMkreyoQTBL2MOVlwC/0Zdo/3+w0MZLHPQF6PIcEWY9i+IFSgnv+9KPP
	0adWL0quSdrOfMcvn+zWuHQHSWTf6jZpYvpVVCBMqYb6vVcW1Tnso+lrLerXOpe5/0V17BOFoPN
	V7fmiSNSN/Z+Wsrt7YqX5tBaS23sTLpWMqiMXMH5dpySfbNsZ1jjsYP9X3uRdY2XL0OyWZjv5z7
	jwJyfk8gbW1wKsXfBmDfmkGNJcvVze9h+i5hPJ0UyB4g30kf/vcd+KKU+XaNx0bWB1kpmg==
X-Google-Smtp-Source: AGHT+IHfoHtOSOw6QPXhvciUi+eDzXsSJQhayQA1hxxnYC+Bzaz7sQ8UfdJlLr2P/9a5ltViXsbUoA==
X-Received: by 2002:a17:907:3cc2:b0:ae0:bf99:6c5d with SMTP id a640c23a62f3a-ae0d28de385mr1347922266b.26.1751276806379;
        Mon, 30 Jun 2025 02:46:46 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca1cbesm638259866b.166.2025.06.30.02.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 02:46:45 -0700 (PDT)
Message-ID: <bd09d601-b551-4621-aa6d-ca9d05473280@gmail.com>
Date: Mon, 30 Jun 2025 11:46:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] nodejs: inherit qemu class conditionally
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250627140633.354460-1-skandigraun@gmail.com>
 <CANNYZj_K1AT8nov3Wz30bUVdReE=c=DNvgKEQ5tKAygVb1MshQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANNYZj_K1AT8nov3Wz30bUVdReE=c=DNvgKEQ5tKAygVb1MshQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 09:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118172



On 6/27/25 16:36, Alexander Kanavin wrote:
> On Fri, 27 Jun 2025 at 16:06, Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> The recipe unconditionally inherits the qemu class, because it executes
>> some target binaries when it is cross-compiled and the bit-width of the
>> build host and the target host are different.
>>
>> Since it is unconditional, it also means that it is inherited for native
>> and nativesdk builds also. The qemu class uses some qemu options that are
>> always derived from the target machine's configuration, even when the
>> recipe is built for class-native. This means that some of the variables
>> used by the recipe changes (e.g. QEMU_OPTIONS), and the shared state cache
>> is invalidated when the target machine changes, even when nodejs-native is
>> being built - and it triggers a full rebuild of nodejs-native unnecessarily.
>>
>> To avoid this, inherit the qemu class conditionally, only in case it is
>> used (when the target and build arch's bit-widths are different).
>>
>> Also, inherit qemu-native based on the same condition, and move around the
>> qemu-dependent code a bit, so it will be only executed when the qemu class
>> is inherited.
> This doesn't quite look right. Plenty of other recipes inherit qemu
> unconditionally, including some pretty foundational ones like python3,
> and they do not need this fix, or do they? I think something else is
> going on here, and that issue needs to be properly investigated.
>
> Can you describe the steps needed to observe the issue? Can you take
> those steps for e.g. python3-native?

Though I thought I do, apparently I don't have a step-by-step
reproduction (yet?) unfortunately. I keep looking at diffsigs and then
bitbake -e, and hope to catch it (which usually point to QEMU_OPTIONS &
co, but yeah. there seems to be more to this).
Until now I thought that it happens just by simply building
nodejs-native for different targets, but now that I tried to observe it
in a targeted way, it doesn't seem to be the case. Keep building images
that have nodejs-native as their build dependency :S

2 anecdata:
1. Just now I set up manually a vanilla[1] oe-core+meta-oe env from
master, and added nodejs-native to psplash's DEPENDS (psplash has no
relevancy here, just added it to a random recipe, to build nodejs). 
  - When I built nodejs-native directly with qemuarm and qemuarm64,
sstate cache worked. 
  - When I built core-image-minimal and core-image-sato also that way
for the same targets, they worked too. 
  - Then I added PR = "r01" to openssl recipe. By this I tried to
simulate the update of nodejs dependencies. Then I rebuilt
core-image-sato for the same targets. As expected, nodejs-native was
rebuilt for the first build. And then it was rebuilt from scratch for
the second MACHINE too.
So now my suspicion is somewhere around updated dependencies if there
are some sstate cache already, but I won't be able to look much at this
in the first half of the week.
  
2. In one of my own projects (where nodejs-native is a real dependency),
over the weekend nodejs was rebuilt twice, in same build environment.
The diff pulled between the config of the 2 rebuilds is below[2]. All I
did was just building one image after another. I used kas with this,
with pinned layer revisions - it hasn't changed between runs. They were
also built in the same docker image, but in separate, sequential docker
sessions.

[1]: Vanilla = only bblayers.conf is modified to add the meta-oe layer,
and added INHERIT += "rm_work" in local.conf and nothing else. Only the
MACHINE variable changes between builds, through environment variable.
The env is unused, sstate cache and everything else were generated from
0 during the first build, and then reused during the subsequent ones.

[2]: the conf diff:

[meeee@desktop yocto]$ diff -Naur
nodejs-rebuild-walnascar-musl-riscv.local.conf
nodejs-rebuild-walnascar-musl-x86.local.conf
--- nodejs-rebuild-walnascar-musl-riscv.local.conf      2025-06-28
17:02:03.282055974 +0200
+++ nodejs-rebuild-walnascar-musl-x86.local.conf        2025-06-29
17:51:14.298700768 +0200
@@ -1,5 +1,5 @@
 # image_name
-IMAGE_NAME = "musl-walnascar-esr-riscv"
+IMAGE_NAME = "musl-walnascar-esr-x86_64"
 BBMASK += "meta-browser/meta-firefox/recipes-devtools/rust"
 
 # meta-firefox-common
@@ -137,6 +137,6 @@
 REQUIRED_VERSION_rust-llvm = "1.84.1"
 REQUIRED_VERSION_rust-llvm-native = "1.84.1"
 
-MACHINE ??= "qemuriscv64"
+MACHINE ??= "qemux86-64"
 DISTRO ??= "poky"
 BBMULTICONFIG ?= ""
[meeee@desktop yocto]$ 

>
> Alex


