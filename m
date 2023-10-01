Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D5DE748F1
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 00:48:58 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.52165.1696121334617048953
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Sep 2023 17:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dQDmLDZB;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-53808d5b774so1678647a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 17:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696121333; x=1696726133; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdDwL2UmANAMWysV5BMmIbhmXGmP1/qlgfsdOSZdK7M=;
        b=dQDmLDZB8esoW+/20idUdZXd7/ZwTUkL2fdLtb+oc0ijSnbcX2/9iDu7eMCZqkdUuB
         qfvazL+X2sCX7KsEQiTDjYonr7P/6omguspjmf8J6ytOBe6/+zXT/Y6yA5xJn2T3jsKJ
         6+J5iZOeob6DO4Zmf+XVvbmIz2LTU4g2rbpoZt7hvz+sxwhbXBbWaRRx009BJOrq6uNw
         Tb1+CsT4JclPV2ViuLz/eEFUvnHf7YncN9l7fj8Lsdrc+eUSoFfyY4r6vOFqMgbFdnox
         Vflqae/8UipqVxfcbmjLcENabEZtTmNymxsbBLM6RDJ7kKhjRxvcO9Wyu8KVRXFz8ogC
         hTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696121333; x=1696726133;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdDwL2UmANAMWysV5BMmIbhmXGmP1/qlgfsdOSZdK7M=;
        b=uh+TdbKjBHfuvGaH+/ZgxR5/voq0jawj80jhHN4CaLYsHf5P/f7ZSjDimkzHzDUzb/
         CK6+DJW5t09uQtmq360H1miUbkTWQbJdAgi2TqG/NaNla1f0EIT9ueq3HMmR1/N67DpF
         k/zJPmIkp6tcyDWn6VHfzjnKYqR8OB0yi7Yvth81olscoM6UpZGu85VqRVYjYuxgBXjp
         zT7AsBSfGzi3NZHai5FIMHQ1/zSZztQW+cVhLBb6+BDynTLy1sqEurJvw3XYw1n4y5MP
         EWt1JjVUH5y0AaX6jNZ7l6G0vQ9HEe+QBTD/xTfNA1i+uKXZfBmY1PmvORYm0mdQDWLH
         ikbg==
X-Gm-Message-State: AOJu0Yyug0CnRxbmjohXqRnEkXsjghgRgaxJXQQijJ/zWol130d53f+T
	m5454PzB7bmaFyutrj6/TAA=
X-Google-Smtp-Source: AGHT+IEFwJ0DpMli39x7dWVi1xj8FX2aIjQ+0AfjFOSQOtYD/QBYr0mP+gDrPUvxm7Q0Su7sQ0WX8w==
X-Received: by 2002:a17:907:b18:b0:9ad:a4bd:dc67 with SMTP id h24-20020a1709070b1800b009ada4bddc67mr7366922ejl.50.1696121333012;
        Sat, 30 Sep 2023 17:48:53 -0700 (PDT)
Received: from [10.134.50.150] ([89.249.73.142])
        by smtp.gmail.com with ESMTPSA id qk8-20020a170906d9c800b0099bd1ce18fesm14956732ejb.10.2023.09.30.17.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 17:48:52 -0700 (PDT)
Message-ID: <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
Date: Sun, 1 Oct 2023 02:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Samuli Piippo <samuli.piippo@gmail.com>, Ross Burton <ross.burton@arm.com>
References: <20230930173003.3210-1-peron.clem@gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20230930173003.3210-1-peron.clem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 00:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105290

I agree, protoc should _not_ be in sysroot, because target binary can't 
run on host system.

Vyacheslav

On 30.09.2023 19:30, Clément Péron wrote:
> This reverts commit a0557fe5433620717eeb00d3b16801711337b1a4.
>
> As said by Ross[Ø]:
> "Putting the _target_ protoc into the sysroot for executation at _build_
> time isn't useful because even if it has the right architecture, the
> tune might be incompatible.  Recipes which want protoc should just depend
> on protobuf-native."
>
> This has been reverted recently by Samuli[1]:
> "If protoc is enabled for the build, recipes using protobuf will
> fail when protoc is not available in the recipe sysroot"
>
> Be the revert is incorret as This is an issue coming from qtgrpc
> other recipes that use protobuf or gRPC compiler, proplery looks for
> the binary in the correct sysroot folder.
>
> Qtgrpc recipe should fix this issue at the recipe level, for example this
> is what I've done for "etcd-cpp-apiv3" recipe[2] that doesn't need this
> patch to properly compile.
>
> So keeping this hack doesn't seems to be a correct fix.
>
> Note that qtgrpc recipe isn't available on meta-oe nor any other public
> layers.
>
> 0: https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.377450-1-ross.burton@arm.com/
> 1: https://patchwork.yoctoproject.org/project/oe/patch/20230927051101.3088498-1-samuli.piippo@qt.io/
> 2: https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/47f0d9e0326f3cc31c801a0ecf7312d1049ece3e
>
> CC: Samuli Piippo <samuli.piippo@gmail.com>
> CC: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>   meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
> index 06d73d648..1edc21cdf 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
> @@ -101,9 +101,6 @@ PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
>   FILES:${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
>   FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
>   
> -# CMake requires binaries to exist in sysroot, even if they have wrong architecture.
> -SYSROOT_DIRS += "${bindir}"
> -
>   RDEPENDS:${PN}-compiler = "${PN}"
>   RDEPENDS:${PN}-dev += "${PN}-compiler"
>   RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105284): https://lists.openembedded.org/g/openembedded-devel/message/105284
> Mute This Topic: https://lists.openembedded.org/mt/101679410/4455192
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [uvv.mail@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


