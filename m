Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30B8C7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 12:15:40 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.7334.1686053733695248484
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 05:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=V3XOlYT/;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-bacfa9fa329so6279827276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 05:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686053733; x=1688645733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cCmP0qeUC9yeax1GK59+05L9hMkZ6TT5IWu4lyA6RfA=;
        b=V3XOlYT/49PMWf2rWQBGVHGFxc3zO0mW3qErGaefLQn77CEuBhbwlevWTB36pVDgs6
         +XCUGMsSvG5JMqnD2mHxfkGfCJi/XKqb3Vru4L1hfS/Yt8YnMbXLkTGI24G1Y0/1rnOi
         26K4GZSmLa80rk/e8JSWtR+a3aSOhiTUElBtfWvQNzQPxQYOz0V5c0m1i4YB1V5yqVxh
         NeRbSzVkxhenpls9UdBcUaPu3NoHOKablaUByJdfsId0kXKguWD7YPRIZREdXygW1Ra2
         k+VNfRiiuKNcTSSRPiZ2YqxIZ1ye/ekWqzCGTSUsWPq2IneEMnjhCvNpRHCfkAuAfzSj
         qzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686053733; x=1688645733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCmP0qeUC9yeax1GK59+05L9hMkZ6TT5IWu4lyA6RfA=;
        b=lqUjzu7lukqnfOlk1em/eeinYzop6XJHbACfM7pmwOiaAbyonhwjW2I1LuYvdH3g1k
         SjOzI9mbnO5rnOv5s4kDdByl8MXZe2qwUiczIyzQT0itEVjRm63jNzVJVje3zjdgYMGh
         N3aRTf8AGYEaBb5336zxQG4OL9fZGqoMCN7dm3S1whZlWIdrLA+ZRpB6wi013oKngn//
         LGoI5BV/EZtSbcTpg1p6Abkj1ve/xMyWSM42gt7JsuDSo3uaMoX46tlNehH4rWPutez9
         XaJ5i+G2oWma3U04YqYbyB/X9sfpptmaJDCzoi2HKRl2EZl7vP9TZxu6IvQWelds5fBZ
         LsKA==
X-Gm-Message-State: AC+VfDzgtu7iaEaSJnCYmWxTBnI8HzYF/dqHQ11uGkUk31tyzTTdZRGr
	BIKp2fdJgoB9S5yI0Eg68t5fEbpwd3M=
X-Google-Smtp-Source: ACHHUZ6LDDqaOssV+9z+i2nYH24K9P4BVB8IMa0e7qoTgLqNPUlq6qpViP5/AAWc2AfUH4yXJUlqmA==
X-Received: by 2002:a5b:20d:0:b0:b8f:3621:f93f with SMTP id z13-20020a5b020d000000b00b8f3621f93fmr1589391ybl.17.1686053732698;
        Tue, 06 Jun 2023 05:15:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:c463:b29:d008:874c? ([2600:1700:9190:ba10:c463:b29:d008:874c])
        by smtp.gmail.com with ESMTPSA id n75-20020a25d64e000000b00ba88763e5b5sm3213298ybg.2.2023.06.06.05.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 05:15:32 -0700 (PDT)
Message-ID: <8bdc3c8c-829b-11e7-8ecd-2c35fbce34d8@gmail.com>
Date: Tue, 6 Jun 2023 08:15:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe][meta-networking][kirkstone][PATCH 1/1] tcpreplay: fix
 CVE-2023-27783
Content-Language: en-US
To: archana.polampalli@windriver.com,
 openembedded-devel@lists.openembedded.org
Cc: Hari.GPillai@windriver.com
References: <20230605085416.4086325-1-archana.polampalli@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230605085416.4086325-1-archana.polampalli@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 12:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103144



On 6/5/23 4:54 AM, Polampalli, Archana via lists.openembedded.org wrote:
> An issue found in TCPreplay tcprewrite v.4.4.3 allows a remote attacker to cause a denial
> of service via the tcpedit_dlt_cleanup function at plugins/dlt_plugins.c.
Thanks for the fix.

Master will need these fixes. If master is patched,  then we can update 
tcpreplay to 4.4.3  all the way to kirkstone since this is a bug fix 
only update and then all the versions will be the same.


- Armin
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>   .../tcpreplay/tcpreplay/CVE-2023-27783.patch  | 29 +++++++++++++++++++
>   .../tcpreplay/tcpreplay_4.4.2.bb              |  4 ++-
>   2 files changed, 32 insertions(+), 1 deletion(-)
>   create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-27783.patch
>
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-27783.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-27783.patch
> new file mode 100644
> index 000000000..59adff615
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-27783.patch
> @@ -0,0 +1,29 @@
> +From e831aad6d48874abab6efa37d4460da2be3ac765  Mon Sep 17 00:00:00 2001
> +From: Marsman1996 <lqliuyuwei@outlook.com>
> +Date: Wed Mar 1 14:48:48 2023 +0800
> +Subject: [PATCH] dlt_jnpr_ether_cleanup: check subctx before cleanup
> +
> +CVE: CVE-2023-27783
> +Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit/7aca59e4fc96fc1d0e43a3d64b2f9fc9a46b6ca8]
> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
> +index e282ef4..98b67e9 100644
> +--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
> ++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
> +@@ -168,7 +168,8 @@ dlt_jnpr_ether_cleanup(tcpeditdlt_t *ctx)
> +         jnpr_ether_config_t *config;
> +
> +         config = (jnpr_ether_config_t *)ctx->encoder->config;
> +-        tcpedit_dlt_cleanup(config->subctx);
> ++        if (config->subctx != NULL)
> ++            tcpedit_dlt_cleanup(config->subctx);
> +         safe_free(plugin->config);
> +         plugin->config = NULL;
> +         plugin->config_size = 0;
> +--
> +2.40.0
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
> index 165a0e735..ccff19f16 100644
> --- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
> +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
> @@ -7,7 +7,9 @@ SECTION = "net"
>   LICENSE = "GPL-3.0-only"
>   LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
>   
> -SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
> +SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz \
> +           file://CVE-2023-27783.patch \
> +           "
>   
>   SRC_URI[sha256sum] = "5b272cd83b67d6288a234ea15f89ecd93b4fadda65eddc44e7b5fcb2f395b615"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103126): https://lists.openembedded.org/g/openembedded-devel/message/103126
> Mute This Topic: https://lists.openembedded.org/mt/99336397/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


