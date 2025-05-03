Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BA6C369C2
	for <webhook@archiver.kernel.org>; Sat,  3 May 2025 17:03:22 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.14648.1746291794516296341
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 May 2025 10:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hz3lPWNW;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so4702257a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 May 2025 10:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746291793; x=1746896593; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5M5SVmEDyPo6PXNwk/TIKwvh94EWTUd66gryIRahBeQ=;
        b=hz3lPWNW9MZPJVrYcKNAlo1jMt+45rJ1S5OPoQKZtA9ok/g2m+0CJd28qo8UD82vdb
         dQ9aEQzVkjlSeN8ebxCoXqkqFbo4K467UJbMp4MnHtra8LLHW9zEc/X1O5O0wOPQeaB5
         XeuX4Jc+Plturccp8RVGMwzp+fqsAdDDHWb7W6UGcPxfKFITXZ3YlTmY3KlcRn/WkoFG
         qDOT0/1awwDahq2IeeefrXbMRRlAfmtsQc1Z9c+jfdou1QXLYfBuWdJKNxPdg0z3RoIB
         04LrfilJSkkIYGEKIgHJRM0CmEMQ+jHIgqUGJ31sAaUjSWdA/E18ksQpTk1h3XG7QLhw
         SN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746291793; x=1746896593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5M5SVmEDyPo6PXNwk/TIKwvh94EWTUd66gryIRahBeQ=;
        b=YDCvm3kXY0jpwsZwRM7F1ewbHSabruDUB+X88eACLeCQ6SD223XfyR36z6/icuwfKu
         xuhCBTJhaR8w3MsRw3RqsyCp4aN/VKgeAvarO8Z+8+rAMQup3yjs0E4pbUCB+eH/a+PO
         6rNe8DWL/NJVm9kkUQ3Xldunf+GcrwIbAjAAWq6YLTOm/rb9JqI3f7gzJJFhwzM6cF4W
         vXIvM097wL7ddpunE/AKnesyZNyo2XzD8owDPkKBMz9uv4WqC2+bKw7gn/Ugv9ylYtJm
         eDqheJledPas8Rm3yebrl8lJgvgc7W+CxgQ8oBbiBEZwxOl5T/16zqe3CJQWVtqpybft
         RNAw==
X-Forwarded-Encrypted: i=1; AJvYcCXHsziFIl5aHghPlggTq2kSSWyrL+P5tbAF/biBsx2Avl7zwQ6wo9RSG+UPJ9XpgB8CLUug1vCGZ0pz7Tyf6bXGSe4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwPPvCenu/Y095qtili4WogQVNpjB5YYZPaCykOuy4iBIAABzwk
	UcaTN9jHryuzo3coKUAL2/37tO29Trd6Rzr1PHqldHNWz1qH1RCw
X-Gm-Gg: ASbGnct1S1xnua9VkXIVa//NN2xLlYRw/WfonBPQECmcsi2Mn/QB8LA7DkHCMz91KQR
	2k7NJxfjy5K/raiGpqOZ5njxXiNuogbcvWuCturKrjmJN8Ud2rWbVA1xi0O9z6viB4TLpeJhc4D
	NOgREocphtxj1HNkNT90AGn6yMVRTuprZDr7a8GLTZg6G9IGUt9DSOMWI8Dwrh9IVguNbnbDdzV
	iYTgmDhFgvgclQqzR2m0JUbHQo69jAlt9Q5orJzBX3Qh2YI6J1QLLvQk0Nys8rJVQXkkbRbEWP2
	M7xaBP54c7SInRo10rpF4nu/9+CmWou4t6uFtqnv6uLcI54R
X-Google-Smtp-Source: AGHT+IHmbVvEjJLlK1g97pV/nmVp3SP6tx9cNBxxySwTE1owwQWXFv/6FyNYbxwMar1fSSbd5WHA2w==
X-Received: by 2002:a17:907:869e:b0:ace:f2b7:c9ff with SMTP id a640c23a62f3a-ad17b832810mr766517066b.48.1746291792558;
        Sat, 03 May 2025 10:03:12 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7781bfa2sm2870563a12.43.2025.05.03.10.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 10:03:11 -0700 (PDT)
Message-ID: <1e6f9b15-1cf3-489f-8c3d-a0b56d415336@gmail.com>
Date: Sat, 3 May 2025 19:03:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] libsimplelog: Add a versatile C/C++ logger.
To: nguyenthaithuanalg@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250503135343.2207393-1-nguyenthaithuanalg@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250503135343.2207393-1-nguyenthaithuanalg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 May 2025 17:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117285

This recipe is already in the repository - make sure to make your
changes on top of the latest revision of the master branch of the project.

On 5/3/25 15:53, Thuận Nguyễn-Thái via lists.openembedded.org wrote:
> - Simple, stable, powerful.
> - Apply for embedded devices to PC, server.
>
> Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> ---
>  .../libsimplelog/libsimplelog_1.0.6.bb        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
>
> diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
> new file mode 100644
> index 000000000..c159492aa
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
> @@ -0,0 +1,19 @@
> +
> +SUMMARY = "simplelog-topc - Simple, STABLE, powerful of logging library in ANSI C/C++. Ready for billion records."
> +DESCRIPTION = "Async and Fast C/C++ multi-thread logger with topics. No external dependencies."
> +HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
> +
> +SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v1.0.6"
> +
> +SRCREV = "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> +EXTRA_OECMAKE += "-DUNIX_LINUX=1"
> +
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117284): https://lists.openembedded.org/g/openembedded-devel/message/117284
> Mute This Topic: https://lists.openembedded.org/mt/112598333/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


