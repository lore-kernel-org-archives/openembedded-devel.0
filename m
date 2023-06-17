Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DACEB64D9
	for <webhook@archiver.kernel.org>; Sat, 17 Jun 2023 18:07:56 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.10522.1687025275286851746
 for <Openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jun 2023 11:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=T6J47BhQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-bc9782291f5so2172183276.1
        for <Openembedded-devel@lists.openembedded.org>; Sat, 17 Jun 2023 11:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687025274; x=1689617274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=boIpNlYwq5DJgBbmNpUKD0o2QzLdq3Lk7rGMuZtWiUY=;
        b=T6J47BhQkHIh8aRF2WNy7dxfpH2xlw4Jpa/VVz/MQxMfNQLQwRNtbnGraEjYrrnb8b
         520MQyxsnmpeu+Ex9OCs/I0h6vhIJ1SL8ldAoD/N5efPvAE5n6LMakm/9sBiEV1ey2i6
         66eHcu9agBZ1k0fLkDagYvVbazuKTGyZ37TxS8vD0nI17+4+iCouoAK9/sD4OsLDGYhF
         b9CFot8AZP6VRKfdwmjMMZYMaUn7nbyur7O7k1o/wRv/P/KHK/J0MPIH/zdyMedKbG6Y
         OHrqN0HLkMP2pi4foRV70fD99NWZqmVBU2LlEgChTIFr4dBB40RWtJBOQcZm7IXIswmd
         ECQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687025274; x=1689617274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=boIpNlYwq5DJgBbmNpUKD0o2QzLdq3Lk7rGMuZtWiUY=;
        b=ktdn114S8cJ8E5YbeDmq8UzKQNs8u276tuRNnns1/aY35o656/n3lRmSKdejrnxKlG
         TpFho0vXSzgZuwSvgopgqdtd9N7Q0eyYtYUDmdnObcG29ojXNpPtlnetV+HOCdj7tsOC
         kSgoyPdNzAWruAFzUq0mASt0WnmLfmOH3GgEIHe39LNtiLWZRZZAWzGflFv1RvGb7yBP
         TZMjr1qESC7i602SxxVuV4N2UqniP1WF3yGbN+uA5VhXFUjq+CGlXBKPJGaJJ5b2nkBx
         VC3K3JaBPm5CALInggR8TgDyP81rDpBsHH4lL6RLZQ+8U/ERUXtu5oFVVMy9CIC1iLj7
         3TIA==
X-Gm-Message-State: AC+VfDydc7cwTVcpxothcLyF9aGy1mCx3Bj/6eECq2U9TjFE/hahMW5E
	20o11DQpieLjtRQWtAm7QzQ=
X-Google-Smtp-Source: ACHHUZ6KoUm6dHQKdYNjqhjKlL4Sf1jwhZqOuOx7fHhvd9e+bBh2NkhFlJE4iEMPgyslvb/F5uwNhw==
X-Received: by 2002:a0d:cc56:0:b0:56d:2ad0:cb45 with SMTP id o83-20020a0dcc56000000b0056d2ad0cb45mr5430491ywd.1.1687025274392;
        Sat, 17 Jun 2023 11:07:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:89fd:7ebd:1d10:5272? ([2600:1700:9190:ba10:89fd:7ebd:1d10:5272])
        by smtp.gmail.com with ESMTPSA id v11-20020a81610b000000b00565a78b7938sm5649643ywb.146.2023.06.17.11.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 11:07:54 -0700 (PDT)
Message-ID: <dddc3e26-aa69-2b49-819a-a461581aed15@gmail.com>
Date: Sat, 17 Jun 2023 14:07:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 0/6] Backport everything relevant
 to using cts with Weston >= 10
Content-Language: en-US
To: rs@ti.com, raj.khem@gmail.com, afd@ti.com, denis@denix.org
Cc: Openembedded-devel@lists.openembedded.org
References: <20230615205637.724348-1-rs@ti.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230615205637.724348-1-rs@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jun 2023 18:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103353



On 6/15/23 4:56 PM, Randolph Sapp via lists.openembedded.org wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Backport everything relevant to getting opengl-es-cts up and running on
> newer versions of wayland protocols and subsequently Weston 10.
Weston 10 was released months before Kirkstone released so IMHO there 
was ample of time to get needed packages updated prior to release.  This 
does not sound like bug fixes.

Nacking series.

- armin


>
> Khem Raj (2):
>    vulkan-cts,opengl-es-cts: Upgrade to1.3.3.1 and 3.2.8 respectively
>    vulkan-cts,opengl-es-cts: Fix build with gcc-13
>
> Linus Jacobson (1):
>    khronos-cts: Replace wayland feature dependancy with vulkan
>
> Randolph Sapp (2):
>    glfw: add packageconfig and wayland dependencies
>    opengl-es-cts: 3.2.8.0 -> 3.2.9.3
>
> Ross Burton (1):
>    khronos-cts: fix build when python3-build-native is present
>
>   meta-oe/recipes-core/glfw/glfw_3.3.bb         | 14 ++-
>   ...ude-limits-header-for-numeric_limits.patch | 88 -------------------
>   .../files/0001-Include-missing-cstdint.patch  | 34 +++++++
>   .../files/0001-Remove-dead-variable-984.patch | 34 +++++++
>   ...-GCC-11-uninit-variable-warnings-946.patch | 73 ---------------
>   ...LAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch | 37 ++++++++
>   .../files/0001-include-missing-cstdint.patch  | 61 +++++++++++++
>   ...0001-use-library-sonames-for-linking.patch | 20 +----
>   ...01-vulkancts-Include-missing-cstdint.patch | 32 +++++++
>   .../vk-gl-cts/files/0001-vulkancts.patch      | 40 ---------
>   .../vk-gl-cts/files/gen-framework-path.patch  | 20 +++++
>   .../vk-gl-cts/khronos-cts.inc                 | 43 ++++++---
>   .../vk-gl-cts/opengl-es-cts_3.2.7.0.bb        | 31 -------
>   .../vk-gl-cts/opengl-es-cts_3.2.9.3.bb        | 36 ++++++++
>   .../vk-gl-cts/vulkan-cts_1.2.6.0.bb           | 24 -----
>   .../vk-gl-cts/vulkan-cts_1.3.3.1.bb           | 34 +++++++
>   16 files changed, 334 insertions(+), 287 deletions(-)
>   delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-limits-header-for-numeric_limits.patch
>   create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-missing-cstdint.patch
>   create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Remove-dead-variable-984.patch
>   delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch
>   create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
>   create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-include-missing-cstdint.patch
>   create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts-Include-missing-cstdint.patch
>   delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts.patch
>   create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch
>   delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.7.0.bb
>   create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb
>   delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.6.0.bb
>   create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103326): https://lists.openembedded.org/g/openembedded-devel/message/103326
> Mute This Topic: https://lists.openembedded.org/mt/99557891/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


