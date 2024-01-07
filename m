Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCCDC47074
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 21:11:34 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.24746.1704661892610883539
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 13:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PArAlANB;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5e734d6cbe4so7483927b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 13:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704661892; x=1705266692; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F7cViUrYVGTsrNPuSfOapiXddeC85fue886ISOu8FZI=;
        b=PArAlANBu/fDn3AlJvJtG0S/ccB+OqAG/eZTBQxz/16ieeOGx8LDs3Kth6kXjENmFK
         4LKedsbGIv047JlZLUtKMqwuXRQjtedl5sGKp0St0ZGJzY3aOrtSBNBubrlRcV9RAm1T
         obWPdBLs8sm8BCfOJRCh+UvDAnBgIA28OPi44Tm/PDVBNCSYQPnuwq+2NcpagoRkhbFK
         QqUKBSZYOLEhvnV56yC5Q4qMB40+UHP01r34hFBovEs7OXB3f8Jf8y+2ZfDqh2GBqoWu
         hnEzlWg3dAwSfL1oAdg/nxfc8B8QilBl8wCkpa+W2EtBbAr5SaUNPNiafZaT3aN2COaZ
         lT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704661892; x=1705266692;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7cViUrYVGTsrNPuSfOapiXddeC85fue886ISOu8FZI=;
        b=NObB6f1DS49vuugthOdZQKYcd7pxtcutq6BQRi0JT74ZdM1MzzHl/vH4Wurzq4SYGt
         AjnMfgTmRRxgSt60xtvt9NQh/ejW7j48KsTCCUGBM2jz5e/B7eeAqkWia+RbVlTdmFbm
         37A5Xj1u32/7LgwZmhhD/zoYx4oiSSrZi9+e21cKLBKLE/PD4i9Rsu1nT5eb6B84KxbA
         sI9y/tUSPn57sCI7qkHtd32ELCp4fRlNnSACwKelA6e571lLvP8hdbuHikg7csBz9hIZ
         gLHFMSZz9SKzU2z8oHCp98WY/+msownQdpgoW1k40fZ0JPavPt3Untf3k7MTz/oWGZYp
         yjOA==
X-Gm-Message-State: AOJu0YwHkoYF3RyNO+aBrd29Kg2PZQ0O3JPrME55++Fy/lljJB/LcNxf
	jYoRtfAP03HfI+XT02WFsK4BY/gmVEi2rQ==
X-Google-Smtp-Source: AGHT+IGvA5gWhFoV0Vu6BEsychG3eN4jZtFgVYv5ZLwyeHVq14xZ39cX/dXH5/diiBp21bUKGVBMiA==
X-Received: by 2002:a25:908e:0:b0:dbe:f0a6:cf76 with SMTP id t14-20020a25908e000000b00dbef0a6cf76mr230720ybl.32.1704661891572;
        Sun, 07 Jan 2024 13:11:31 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10::29? ([2600:1700:9190:ba10::29])
        by smtp.gmail.com with ESMTPSA id e18-20020a258912000000b00d89679f6d22sm1752362ybl.64.2024.01.07.13.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jan 2024 13:11:31 -0800 (PST)
Message-ID: <1f4d91e3-3163-4ed2-9822-9934d2181205@gmail.com>
Date: Sun, 7 Jan 2024 16:11:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-networking][dunfell][PATCH] wireshark: Backport fix for
 CVE-2023-1992 RPCoRDMA: Frame end cleanup for global write offsets
Content-Language: en-US
To: asharma@mvista.com, openembedded-devel@lists.openembedded.org
References: <20240105090606.16197-1-asharma@mvista.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <20240105090606.16197-1-asharma@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 21:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108078



On 1/5/24 4:06 AM, Ashish Sharma via lists.openembedded.org wrote:
> Upstream-Status: Backport from [https://gitlab.com/colin.mcinnes/wireshark/-/commit/3c8be14c827f1587da3c2b3bb0d9c04faff57413]
>
> Signed-off-by: Ashish Sharma <asharma@mvista.com>

Please rebase against current Dunfell.

BR,
Armin
> ---
>   .../wireshark/files/CVE-2023-1992.patch       | 62 +++++++++++++++++++
>   .../wireshark/wireshark_3.2.18.bb             |  1 +
>   2 files changed, 63 insertions(+)
>   create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch
>
> diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch
> new file mode 100644
> index 0000000000..2fbef6bae0
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch
> @@ -0,0 +1,62 @@
> +From 3c8be14c827f1587da3c2b3bb0d9c04faff57413 Mon Sep 17 00:00:00 2001
> +From: John Thacker <johnthacker@gmail.com>
> +Date: Sun, 19 Mar 2023 15:16:39 -0400
> +Subject: [PATCH] RPCoRDMA: Frame end cleanup for global write offsets
> +
> +Add a frame end routine for a global which is assigned to packet
> +scoped memory. It really should be made proto data, but is used
> +in a function in the header (that doesn't take the packet info
> +struct as an argument) and this fix needs to be made in stable
> +branches.
> +
> +Fix #18852
> +---
> +Upstream-Status: Backport from [https://gitlab.com/colin.mcinnes/wireshark/-/commit/3c8be14c827f1587da3c2b3bb0d9c04faff57413]
> +CVE: CVE-2023-1992
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +
> + epan/dissectors/packet-rpcrdma.c | 14 ++++++++++++++
> + 1 file changed, 14 insertions(+)
> +
> +diff --git a/epan/dissectors/packet-rpcrdma.c b/epan/dissectors/packet-rpcrdma.c
> +index 680187b2653..3f250f0ea1c 100644
> +--- a/epan/dissectors/packet-rpcrdma.c
> ++++ b/epan/dissectors/packet-rpcrdma.c
> +@@ -24,6 +24,7 @@
> + #include <epan/addr_resolv.h>
> +
> + #include "packet-rpcrdma.h"
> ++#include "packet-frame.h"
> + #include "packet-infiniband.h"
> + #include "packet-iwarp-ddp-rdmap.h"
> +
> +@@ -285,6 +286,18 @@ void rpcrdma_insert_offset(gint offset)
> +     wmem_array_append_one(gp_rdma_write_offsets, offset);
> + }
> +
> ++/*
> ++ * Reset the array of write offsets at the end of the frame. These
> ++ * are packet scoped, so they don't need to be freed, but we want
> ++ * to ensure that the global doesn't point to no longer allocated
> ++ * memory in a later packet.
> ++ */
> ++static void
> ++reset_write_offsets(void)
> ++{
> ++    gp_rdma_write_offsets = NULL;
> ++}
> ++
> + /* Get conversation state, it is created if it does not exist */
> + static rdma_conv_info_t *get_rdma_conv_info(packet_info *pinfo)
> + {
> +@@ -1600,6 +1613,7 @@ dissect_rpcrdma(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void* data
> +             if (write_size > 0 && !pinfo->fd->visited) {
> +                 /* Initialize array of write chunk offsets */
> +                 gp_rdma_write_offsets = wmem_array_new(wmem_packet_scope(), sizeof(gint));
> ++                register_frame_end_routine(pinfo, reset_write_offsets);
> +                 TRY {
> +                     /*
> +                      * Call the upper layer dissector to get a list of offsets
> +--
> +GitLab
> +
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
> index 64e436df38..eb43574f9f 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
> @@ -18,6 +18,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
>              file://CVE-2023-0667.patch \
>              file://CVE-2023-0668.patch \
>              file://CVE-2023-2906.patch \
> +           file://CVE-2023-1992.patch \
>              "
>   UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108044): https://lists.openembedded.org/g/openembedded-devel/message/108044
> Mute This Topic: https://lists.openembedded.org/mt/103539863/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


