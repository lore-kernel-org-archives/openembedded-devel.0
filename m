Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEA5EB64DB
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 11:56:50 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.16216.1686830202500989161
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 04:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DT2CEvfE;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5700b15c12fso17557487b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 04:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686830201; x=1689422201;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXSZ27JwUFLs6JNy3XmPtDXV1F8m78INx3Kbi+tax0Q=;
        b=DT2CEvfESIzObi6z1/vdiR4RsuQWn7LDGeDc0mmoagReugNLgp5RmXLQfw1BXFRM/w
         r6ojsIbSQP3QpwKBsdBEZBvNNptqf1UkaMPh6B9r7Bsgdx8lpIn/d/vbQvV4kstfAJ3+
         NgqGEq3QoGFmVqbEmOcazByyz9v2zMrnYedkwF80EQ8DSY1ygSO6Il17jZM7AJFhSM1H
         Zb4l3DzG8w4KvXM+oFYXpgQoQvzzFhNzi0p8CISDKeI7nOUM7TnpJbSnBsddUgR43aA0
         sodNcIDlLQxROYkNN9rklOlKG9dLdV1JkJqGQvZZqhxeD7pNb0yWlF9876ixVm7Rls8d
         Yrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686830201; x=1689422201;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXSZ27JwUFLs6JNy3XmPtDXV1F8m78INx3Kbi+tax0Q=;
        b=kvDiA+oZ6+r/WRzYxfuB6sEzAdRe3nIa1VBPuMAjE3VzHy6bC3I4HUUX5vZod0M2An
         Xj2ou3TNhghjoNfK3lg/lRa4NNAv4/WxForkBD1jc3GI6890tpYjkPaW6F6YzpG3SDzi
         Idman/4jh5j78BiJS7rFHWuoXFF/aDIVxSvel68BiiohsNLxnYnwAviMMrs8o/hV2+3l
         ALPxDe48k7DRL1sYXsJ9/FS+qIFFDGJfGg5khOBx0CREUaO4ml/2QSdlA44MdRoKMiQ4
         7n+Pn3gcrcpXSVqTvMxQLaIRcy5f1xt7jJgOK92oB2MnQAKuJ6gufHO2QpEl4aTXt2aG
         2YKw==
X-Gm-Message-State: AC+VfDxAI2WFm2Gm16aasHE3jNX0emXJ+TXiMLSAu1qFpRcda80yjaqm
	IP7xCLuDgvksEh9SfVYNOPGwxZGFIL0=
X-Google-Smtp-Source: ACHHUZ7J1aOB5kb44rDBzSxiTt2AGu0WS23+T9IgFJxlWaAOXooDtILIVU5mAiu63LnLvud1wiY3Tg==
X-Received: by 2002:a0d:dd08:0:b0:565:e657:debe with SMTP id g8-20020a0ddd08000000b00565e657debemr4359781ywe.23.1686830201614;
        Thu, 15 Jun 2023 04:56:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:b6a3:8a75:3124:ba44? ([2600:1700:9190:ba10:b6a3:8a75:3124:ba44])
        by smtp.gmail.com with ESMTPSA id h185-20020a0dc5c2000000b00570362e1caasm259477ywd.93.2023.06.15.04.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 04:56:41 -0700 (PDT)
Message-ID: <d250021e-1498-979e-0f91-8ae02e5fc974@gmail.com>
Date: Thu, 15 Jun 2023 07:56:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] wireshark: CVE-2023-2952
 XRA dissector infinite loop
Content-Language: en-US
To: Hitendra Prajapati <hprajapati@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20230612113110.10593-1-hprajapati@mvista.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230612113110.10593-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 11:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103300



On 6/12/23 7:31 AM, Hitendra Prajapati wrote:
> Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/e18d0e369729b0fff5f76f41cbae67e97c2e52e5
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>

This patch does not apply and should be rebased from kirkstone once 
merge is complete. There are several wireshark patches stacked in there.

- armin
> ---
>   .../wireshark/files/CVE-2023-2952.patch       | 98 +++++++++++++++++++
>   .../wireshark/wireshark_3.4.12.bb             |  1 +
>   2 files changed, 99 insertions(+)
>   create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch
>
> diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch
> new file mode 100644
> index 000000000..41b02bb3f
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch
> @@ -0,0 +1,98 @@
> +From ce87eac0325581b600b3093fcd75080df14ccfda Mon Sep 17 00:00:00 2001
> +From: Gerald Combs <gerald@wireshark.org>
> +Date: Tue, 23 May 2023 13:52:03 -0700
> +Subject: [PATCH] XRA: Fix an infinite loop
> +
> +C compilers don't care what size a value was on the wire. Use
> +naturally-sized ints, including in dissect_message_channel_mb where we
> +would otherwise overflow and loop infinitely.
> +
> +Fixes #19100
> +
> +Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/e18d0e369729b0fff5f76f41cbae67e97c2e52e5]
> +CVE: CVE-2023-2952
> +
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + epan/dissectors/packet-xra.c | 16 ++++++++--------
> + 1 file changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/epan/dissectors/packet-xra.c b/epan/dissectors/packet-xra.c
> +index 68a8e72..6c7ab74 100644
> +--- a/epan/dissectors/packet-xra.c
> ++++ b/epan/dissectors/packet-xra.c
> +@@ -478,7 +478,7 @@ dissect_xra_tlv_cw_info(tvbuff_t * tvb, proto_tree * tree, void* data _U_, guint
> +   it = proto_tree_add_item (tree, hf_xra_tlv_cw_info, tvb, 0, tlv_length, ENC_NA);
> +   xra_tlv_cw_info_tree = proto_item_add_subtree (it, ett_xra_tlv_cw_info);
> +
> +-  guint32 tlv_index =0;
> ++  unsigned tlv_index = 0;
> +   while (tlv_index < tlv_length) {
> +     guint8 type = tvb_get_guint8 (tvb, tlv_index);
> +     ++tlv_index;
> +@@ -533,7 +533,7 @@ dissect_xra_tlv_ms_info(tvbuff_t * tvb, proto_tree * tree, void* data _U_, guint
> +   it = proto_tree_add_item (tree, hf_xra_tlv_ms_info, tvb, 0, tlv_length, ENC_NA);
> +   xra_tlv_ms_info_tree = proto_item_add_subtree (it, ett_xra_tlv_ms_info);
> +
> +-  guint32 tlv_index =0;
> ++  unsigned tlv_index = 0;
> +   while (tlv_index < tlv_length) {
> +     guint8 type = tvb_get_guint8 (tvb, tlv_index);
> +     ++tlv_index;
> +@@ -567,7 +567,7 @@ dissect_xra_tlv_burst_info(tvbuff_t * tvb, proto_tree * tree, void* data _U_, gu
> +   it = proto_tree_add_item (tree, hf_xra_tlv_burst_info, tvb, 0, tlv_length, ENC_NA);
> +   xra_tlv_burst_info_tree = proto_item_add_subtree (it, ett_xra_tlv_burst_info);
> +
> +-  guint32 tlv_index =0;
> ++  unsigned tlv_index = 0;
> +   while (tlv_index < tlv_length) {
> +     guint8 type = tvb_get_guint8 (tvb, tlv_index);
> +     ++tlv_index;
> +@@ -607,7 +607,7 @@ dissect_xra_tlv(tvbuff_t * tvb, packet_info * pinfo, proto_tree * tree, void* da
> +   it = proto_tree_add_item (tree, hf_xra_tlv, tvb, 0, tlv_length, ENC_NA);
> +   xra_tlv_tree = proto_item_add_subtree (it, ett_xra_tlv);
> +
> +-  guint32 tlv_index =0;
> ++  unsigned tlv_index = 0;
> +   tvbuff_t *xra_tlv_cw_info_tvb, *xra_tlv_ms_info_tvb, *xra_tlv_burst_info_tvb;
> +
> +   while (tlv_index < tlv_length) {
> +@@ -751,7 +751,7 @@ dissect_message_channel_mb(tvbuff_t * tvb, packet_info * pinfo, proto_tree* tree
> +   if(packet_start_pointer_field_present) {
> +     proto_tree_add_item_ret_uint (tree, hf_plc_mb_mc_psp, tvb, 1, 2, FALSE, &packet_start_pointer);
> +
> +-    guint16 docsis_start = 3 + packet_start_pointer;
> ++    unsigned docsis_start = 3 + packet_start_pointer;
> +     while (docsis_start + 6 < remaining_length) {
> +       /*DOCSIS header in packet*/
> +       guint8 fc = tvb_get_guint8(tvb,docsis_start + 0);
> +@@ -760,7 +760,7 @@ dissect_message_channel_mb(tvbuff_t * tvb, packet_info * pinfo, proto_tree* tree
> +         docsis_start += 1;
> +         continue;
> +       }
> +-      guint16 docsis_length = 256*tvb_get_guint8(tvb,docsis_start + 2) + tvb_get_guint8(tvb,docsis_start + 3);
> ++      unsigned docsis_length = 256*tvb_get_guint8(tvb,docsis_start + 2) + tvb_get_guint8(tvb,docsis_start + 3);
> +       if (docsis_start + 6 + docsis_length <= remaining_length) {
> +         /*DOCSIS packet included in packet*/
> +         tvbuff_t *docsis_tvb;
> +@@ -830,7 +830,7 @@ dissect_ncp_message_block(tvbuff_t * tvb, proto_tree * tree) {
> + static int
> + dissect_plc(tvbuff_t * tvb, packet_info * pinfo, proto_tree * tree, void* data _U_) {
> +
> +-  guint16 offset = 0;
> ++  int offset = 0;
> +   proto_tree *plc_tree;
> +   proto_item *plc_item;
> +   tvbuff_t *mb_tvb;
> +@@ -890,7 +890,7 @@ dissect_plc(tvbuff_t * tvb, packet_info * pinfo, proto_tree * tree, void* data _
> +
> + static int
> + dissect_ncp(tvbuff_t * tvb, proto_tree * tree, void* data _U_) {
> +-  guint16 offset = 0;
> ++  int offset = 0;
> +   proto_tree *ncp_tree;
> +   proto_item *ncp_item;
> +   tvbuff_t *ncp_mb_tvb;
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> index 1a4aedc13..c48da9561 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> @@ -16,6 +16,7 @@ SRC_URI += " \
>       file://0003-bison-Remove-line-directives.patch \
>       file://0004-lemon-Remove-line-directives.patch \
>       file://CVE-2022-3190.patch \
> +    file://CVE-2023-2952.patch \
>   "
>   
>   UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103214): https://lists.openembedded.org/g/openembedded-devel/message/103214
> Mute This Topic: https://lists.openembedded.org/mt/99480605/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


