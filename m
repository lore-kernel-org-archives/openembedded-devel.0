Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13C3EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 12:13:30 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.16470.1686831204670274789
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 05:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SanMq1OX;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5703cb4bcb4so4065747b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 05:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686831204; x=1689423204;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=thlyl0H8y15K6mqrDSZE3GsM3AOXQmUnyWN/ToXLWBQ=;
        b=SanMq1OXX1QluOBgQ73y78fjvOdiVfrAjOKBsFumgEJBG0jfA4cE+aJTgXtOftrfV8
         91Gp0aC9iQGK/T95bAeRboMbmaoBLb2GeOFjUnHg8Xl/kkgR4QT0GwCw2GQPIJXfPmFp
         UMzQgnM5BDuu8nCCB81fheRwZYa4BqRS8CenKoD7F07glLr912h5fc0Tza/ob/+I5GAd
         tZ1W1j2AKYNF1EBWvu8caZLj4HeoGaIDu0plXGIPmi15dNhpcuiSiv2Hw/apNwctKjQ7
         pRx1xvDckyvkGVGNzLDAV72DJZ1lxVlfzsvYSDRqEuhElgL3WhC9WSwACUDezDqSgOeN
         Er+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686831204; x=1689423204;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thlyl0H8y15K6mqrDSZE3GsM3AOXQmUnyWN/ToXLWBQ=;
        b=MtHZktCtPYuo4EGOuHIK0FXrsYXhlYOqFMxNH4ZzQ2NE+ANIt0ipmk0YOb0ZdV21Ud
         +Ss+oIZB2CzkmHYoYzEZAsKNmO5vVaZDtAulKHirdamg/clWcL3MEii6ltaT+uuywVkD
         gfMzvEf6/cT55DSfjSCnFnWsRKqWZ99yhrqB9TzVcH5Slqf+szmzRh/f9ZXY89Fqwjtn
         hS5uL6ONXxbMU440TQlwFeWgPzbbJ0oyEFOKn/7MohvpV8NgiYIvhfnD4Hw/cH5RV3ej
         tFHs/8c9LN4+xg/A5P2C6veIb6K9qloJsG7jkbxjUamTf1kZMyav8c+/RxjlS9tKy/G0
         WhPA==
X-Gm-Message-State: AC+VfDwUmmUY2Ywh+NbTReedL0jLnBTEZIM75qCf0Kk3IRHDi0OT4caC
	K7FQeldNXb6Lcf7j0V7hnPs=
X-Google-Smtp-Source: ACHHUZ5Z3qY0SfNwpCpAIcJYhJ0Kcgd6vjInFu8YAllJOgw924wyVjSDut7/dXKy6J3cjqFxtITdrw==
X-Received: by 2002:a0d:f8c4:0:b0:570:22f:7f94 with SMTP id i187-20020a0df8c4000000b00570022f7f94mr5376396ywf.27.1686831203737;
        Thu, 15 Jun 2023 05:13:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:b6a3:8a75:3124:ba44? ([2600:1700:9190:ba10:b6a3:8a75:3124:ba44])
        by smtp.gmail.com with ESMTPSA id g21-20020a815215000000b0056d2af1d11csm2569933ywb.7.2023.06.15.05.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 05:13:23 -0700 (PDT)
Message-ID: <612fc55c-d63b-9d09-665f-e14dee470bf8@gmail.com>
Date: Thu, 15 Jun 2023 08:13:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-networking][mickledore][PATCH] wireshark:
 CVE-2023-2952 XRA dissector infinite loop
Content-Language: en-US
To: Hitendra Prajapati <hprajapati@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20230612112806.10324-1-hprajapati@mvista.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230612112806.10324-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 12:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103302



On 6/12/23 7:28 AM, Hitendra Prajapati wrote:
> Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/e18d0e369729b0fff5f76f41cbae67e97c2e52e5
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>

This does not apply, there are other wireshark patches stacked up in 
stable/mickledore-nut that you can rebase on .

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
> index 693a16793..7d49c3c27 100644
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
> View/Reply Online (#103213): https://lists.openembedded.org/g/openembedded-devel/message/103213
> Mute This Topic: https://lists.openembedded.org/mt/99480576/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


