Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BD9CD54BA
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 11:49:41 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.6446.1695124171558643622
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 04:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F4oTYn+M;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59bebd5bdadso57240577b3.0
        for <Openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 04:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695124170; x=1695728970; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbk0BzRyKqrZg2yTxn4+vwCevlDU6Q5ghI/5YAVAIiA=;
        b=F4oTYn+M8WuxicMq72dDwK+4nDL3GYthpgpXUU2FPJ6nkALpMqf232Cj8pCtqXbgfE
         MWKxjWf136pZG2WL8pG99kEZwBWTy0rbI6LU75AbiBLJBlVfD6pKogh/nuyUB+zufj7y
         GEnyUAgdeQlOhjI5PDZWpGXzuS4445HeHzcwHf6C0J3AHlirpTq+4bHFsnL2gw29++Fy
         goMQrkCnxZOwMO9WCQz6hVVCGtMcM9IvOAS0abee8swLYkuTI/jtflLoXjMHjCNPVfNB
         LrBbc3iB5Intr8MOIB3Pqls370Gmwd57Jbx8PAQDtibWryxGjxXuxqmKumTYUxP1jyws
         eKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695124170; x=1695728970;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbk0BzRyKqrZg2yTxn4+vwCevlDU6Q5ghI/5YAVAIiA=;
        b=NZKL8OL4GxF3FzetX4TXY88DDJs1/aioYZmcK8oiTpbJ8qwDyPwFn/CJ9xpz5LE6jF
         R1y93cURxotcw53FGxU/pYTylFKLWPHRhRBOsTIO2hRQIKfx9cUs3fq+im9ad70wjdLA
         ctM7n0hIv3i5VDdIKB/syqQPHo0VLOkubUjDxwu2Ci3AeHnVngMnY3CRU2S9uD26TJ/G
         Spfsew5L/xGGndENt2Jbn0FO77F2SKCrR/60upUCNjSw60kLEh7yHiuhdCFkRKl6nBNx
         JIQPUrsnyLdW2ttw9vQTTWNsrdOpzJpVsQmgNDkB4/+W5cYD45pynPFJrCecKy30yTHk
         3NAA==
X-Gm-Message-State: AOJu0Yyzq37jvRPNS7LbuLRN1FsYjPfeRUoMXnLO9B4NOL4/BpcgZlin
	npX0x26/782gHeoKLvL+kLM=
X-Google-Smtp-Source: AGHT+IF/2AO8r05LH/K+Suky/yPWaZaxNtgBi943+i3DoIYKZlpOr7//ISNuYfDiqiUAdnxNW8nMZA==
X-Received: by 2002:a0d:cc0a:0:b0:59b:49a0:eec0 with SMTP id o10-20020a0dcc0a000000b0059b49a0eec0mr11739569ywd.12.1695124170693;
        Tue, 19 Sep 2023 04:49:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:9058:5f6e:d411:ff3a? ([2600:1700:9190:ba10:9058:5f6e:d411:ff3a])
        by smtp.gmail.com with ESMTPSA id w124-20020a0dd482000000b005922c29c025sm3097350ywd.108.2023.09.19.04.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 04:49:30 -0700 (PDT)
Message-ID: <9917aa92-ea3e-34f8-9199-6ff55b8bea54@gmail.com>
Date: Tue, 19 Sep 2023 07:49:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [oe][meta-oe][kirkstone] freeglut: add packageconfigs for x11,
 wayland, gles, and demos
Content-Language: en-US
To: rs@ti.com, raj.khem@gmail.com
Cc: Openembedded-devel@lists.openembedded.org
References: <20230915010513.3425887-1-rs@ti.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230915010513.3425887-1-rs@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 11:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105002



On 9/14/23 9:05 PM, Randolph Sapp via lists.openembedded.org wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Add the PACKAGECONFIG entries to build freeglut for wayland and x11,
> which should conflict in this release, and add the ability to build a
> GLES release.
>
> Also split the demos their own config. The demos will conflict with the
> gles flag as they still require desktop GL in this release. This is
> essentially a loose backport of the following patch for this older
> release:
>
> a9212722c (freeglut: Add packageconfigs for x11/wayland/gles, 2023-01-10)
>
> It does not change the current default behavior of compiling for x11
> with demos.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
> index 6ef9f74c70..a204f86a6f 100644
> --- a/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
> +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
> @@ -10,11 +10,18 @@ SRC_URI[sha256sum] = "d4000e02102acaf259998c870e25214739d1f16f67f99cb35e4f468413
>   inherit cmake features_check
>   
>   # depends on virtual/libx11, virtual/libgl
> -REQUIRED_DISTRO_FEATURES = "x11 opengl"
> +REQUIRED_DISTRO_FEATURES = "opengl"
> +
> +PACKAGECONFIG ?= "x11 demos"
> +
> +PACKAGECONFIG[x11] = ",,virtual/libx11 virtual/libgl libxi libglu,,,wayland"
> +PACKAGECONFIG[wayland] = "-DFREEGLUT_WAYLAND=ON,-DFREEGLUT_WAYLAND=OFF,wayland,,,x11"
> +PACKAGECONFIG[gles] = "-DFREEGLUT_GLES=ON,-DFREEGLUT_GLES=OFF,virtual/libgles1 virtual/libgles2 virtual/egl,,,demos"
> +PACKAGECONFIG[demos] = "-DFREEGLUT_BUILD_DEMOS=ON,-DFREEGLUT_BUILD_DEMOS=OFF"
>   
>   # Do not use -fno-common, check back when upgrading to new version it might not be needed
>   CFLAGS += "-fcommon"
>   
>   PROVIDES += "mesa-glut"
>   
> -DEPENDS = "virtual/libx11 libxmu libxi virtual/libgl libglu libxrandr"
> +DEPENDS = "libxkbcommon"
Is there any reason not to take this commit?  Master and Kirkstone would 
have different implementations for the same thing.

https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-graphics/freeglut?h=master-next&id=a9212722c1b1a2ab29215651063ca94fb114c39b

- Armin
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104881): https://lists.openembedded.org/g/openembedded-devel/message/104881
> Mute This Topic: https://lists.openembedded.org/mt/101371224/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


