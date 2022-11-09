Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3661AC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 17:38:39 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.137.1668015511632652854
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 09:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pYZqAZqZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id r76so19515143oie.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 09:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LHZG2GHgOJr8wBhIjhyP+es71dpLJyI5XadXg89HQEc=;
        b=pYZqAZqZUbtRU1GkjkvIlbqtWvODXq9Cz4bNV8QCYJYpwm5Veo0UbgmsABpKikccU/
         BNjbJ8V5GuemM+1Lapts/QdGkNIF8agVZ68fBUZpvgFyvl+yjuWtUDwxadQ8nUve84jh
         BzG5XAEX7oowecjwzMt7k7aSaBmytkGv+NyY1Wq6y8kkG0P3TdTUqfjV/9IpEQ60sMhn
         fTC0ImqzyYAMitG6gXULY0JQEmeTChBDXGpGExLKt2qvr4Bf7IiAkKvJLhuLxoLUe82p
         CtDqoHHpT6HfoYlb4TLGb1kPtDDGUtfvtB0V4XlYp328IF6x8HVqsFKcHp2dCPU8jPiq
         65Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHZG2GHgOJr8wBhIjhyP+es71dpLJyI5XadXg89HQEc=;
        b=2uOX15USMgqCvsu68v3yhECN+xhdHXToG1SdC+wkwNc31D7Rbllqpyb0Wj5l549Jl8
         YI1kF5LudNWv/KmwiQNUBY/KfmuVb8/POwNNt0sMgSU02xS/cMdi9X8NBJauWwLgAUHg
         cydx6xDzrrrrtNrbkdArlt0HR2C+F1HX3yBYk7db81gPhUwpsWRZ4xvrH498lqg0kbeX
         uK2htX3mqAPvbQdnkZGIpbsQ3ePEZFY83jmw122OICnHxHiaC9AeIg6j2I1cJEayWCm9
         ppKztn8tGtL8oSREzJEjYQX6WhTKGnbERXrql36TMYvpDLialvCPbyaLYTNbAF8m7gJn
         jt6g==
X-Gm-Message-State: ACrzQf3jo8a5totykVAHyjuzxo3s1jA6kAwtS1fy6AbK2tZbMj+2Qfjj
	PLVnHNsbB1cB280Y+a5KHzutn2pqOkSJFOM8ggY=
X-Google-Smtp-Source: AMsMyM4ZAg8DDzIbHmEHtYWW0Oet94bSxPOhU1B7cbQby3bLtB5ByfQMOiZTIYGOX7V+wXq/LxNxHS0/juMIx1xj/8k=
X-Received: by 2002:a05:6808:20a0:b0:359:e4d6:8bd3 with SMTP id
 s32-20020a05680820a000b00359e4d68bd3mr32439759oiw.262.1668015510773; Wed, 09
 Nov 2022 09:38:30 -0800 (PST)
MIME-Version: 1.0
References: <1667809788-30849-1-git-send-email-wangmy@fujitsu.com> <1667809788-30849-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1667809788-30849-3-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Nov 2022 09:38:05 -0800
Message-ID: <CAMKF1srqq6hDKcJpLbeS3c8W2+0rdW2Ue0w6-Eo_ww7bHN1G6g@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libbpf: upgrade 0.8.0 -> 1.0.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 17:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99503

This changes APIs and causes build issues when compiling pahole see.
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2153/steps/14/logs/stdio

On Mon, Nov 7, 2022 at 12:30 AM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> https://github.com/libbpf/libbpf/releases
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libbpf/{libbpf_0.8.0.bb => libbpf_1.0.1.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-kernel/libbpf/{libbpf_0.8.0.bb => libbpf_1.0.1.bb} (89%)
>
> diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.0.1.bb
> similarity index 89%
> rename from meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
> rename to meta-oe/recipes-kernel/libbpf/libbpf_1.0.1.bb
> index 76fd86214..5137a4cb3 100644
> --- a/meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
> +++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.0.1.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
>
>  DEPENDS = "zlib elfutils"
>
> -SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
> -SRCREV = "86eb09863c1c0177e99c2c703092042d3cdba910"
> +SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-v1.0.1"
> +SRCREV = "a6d7530cb7dff87ac1e64a540e63b67ddde2e0f9"
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64|powerpc64).*-linux"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99449): https://lists.openembedded.org/g/openembedded-devel/message/99449
> Mute This Topic: https://lists.openembedded.org/mt/94862032/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

