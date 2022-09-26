Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD26C07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 17:47:28 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.1096.1664214445521815876
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Sep 2022 10:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M7PDbGsY;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id cj27so4568504qtb.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Sep 2022 10:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lUUULrFkJBRlsfNngjiTvQd8KlnL1yITthkIhWgKbNI=;
        b=M7PDbGsYUrjQ3NTm2gFRlLOKNv1HfHR15kng1daC8xjRxQGd90I8y8Syu6KEz9oS4s
         0aP8ntaIk8q8XKOYWWUvu6G0CPYKv15LeN/oUArPEWiw8eQEGzBCBsnaw7jlnWW8Jxc9
         i1tISg7I+A8NrPUM5NRVb+q4ksBwW+cgEpxHMiqPdGLjgILqhIXCIH3bnHpjfmm5/znC
         4e3ZpPE/4EsyxyAadCHGUvRZ1mm6dDBCrvDgyJnt++/jZj4jyKSwPO0O1wjZpPXn9UAu
         x4myZmT59wK6jav8WVejrPPhlPewjd2U585lgWUCb4fI0NX2YgTiXzGryL+D1kHtM7z4
         kadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lUUULrFkJBRlsfNngjiTvQd8KlnL1yITthkIhWgKbNI=;
        b=MlZpcvsVS3S3gZ5d+fiwVuIm5XCH8eTl5sZQyc5e/0L2BQdepdonfPTwl85WR1LZTO
         5zTGZPaKt29DvR6md9eUJ5Sf2G69J3Y9T44QVsiv9kqm5Fi7a+op/01TWiEG6BA98ZmL
         BZQolhXtWzT2F0flvOsJXKLquCwiuhbOLPj9+A/cmlQW4jPJ4+McKJiLaMHJapgBOYeb
         WxQ8ZmEbm0Rl0C06xrKwc035eUSLi7AfVPZIVv1PHapQmP5GJUjWm1AqGsjM2c0JQxw5
         0qrKRpFDakQirKt186qpvcrdAMiL8ojLdzuxfu+6lf6DBoSkFtimF4xVV/H5IrWQGO8P
         PPDA==
X-Gm-Message-State: ACrzQf0MiYvY1OlvRTrWTLwPPRgstFuFoVNVGrfuzytJSZO66KVlxpFG
	Poj6TzJW1apvrxiwndf/+og=
X-Google-Smtp-Source: 
 AMsMyM6iTqbijEqNLVN2pt9JolqstwEVUow0aGBJZaJHYmC3Aca35ju11OkfsnsVl3R67qZdiFJ7+Q==
X-Received: by 2002:ac8:5b05:0:b0:35c:e1ed:a816 with SMTP id
 m5-20020ac85b05000000b0035ce1eda816mr18743040qtw.208.1664214444447;
        Mon, 26 Sep 2022 10:47:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:82f1:3179:8101:3ea3?
 ([2600:1700:9190:ba10:82f1:3179:8101:3ea3])
        by smtp.gmail.com with ESMTPSA id
 x27-20020a05620a0b5b00b006a6ebde4799sm11631084qkg.90.2022.09.26.10.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 10:47:22 -0700 (PDT)
Message-ID: <b48e14a4-0c22-79bf-b6ec-d33b69e2fcce@gmail.com>
Date: Mon, 26 Sep 2022 13:47:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] wireshark: CVE-2022-3190
 Infinite loop in legacy style dissector
Content-Language: en-US
To: Hitendra Prajapati <hprajapati@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20220926114055.4607-1-hprajapati@mvista.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220926114055.4607-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Sep 2022 17:47:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98954

Any reason why updating to the latest stable 3.14.16 version is not 
appropriate?
- armin

On 9/26/22 07:40, Hitendra Prajapati wrote:
> Source: https://gitlab.com/wireshark/wireshark/-/commit/67326401a595fffbc67eeed48eb6c55d66a55f67
> MR: 122044
> Type: Security Fix
> Disposition: Backport from https://gitlab.com/wireshark/wireshark/-/commit/67326401a595fffbc67eeed48eb6c55d66a55f67
> ChangeID: 13f833dfbd8f76db1ea01984441b212f08e6e4f5
> Description:
>            CVE-2022-3190 wireshark: Infinite loop in legacy style dissector.
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>   .../wireshark/files/CVE-2022-3190.patch       | 145 ++++++++++++++++++
>   .../wireshark/wireshark_3.4.12.bb             |   1 +
>   2 files changed, 146 insertions(+)
>   create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch
>
> diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch b/meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch
> new file mode 100644
> index 0000000000..0b987700f5
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch
> @@ -0,0 +1,145 @@
> +From 4585d515b962f3b3a5e81caa64e13e8d9ed2e431 Mon Sep 17 00:00:00 2001
> +From: Hitendra Prajapati <hprajapati@mvista.com>
> +Date: Mon, 26 Sep 2022 12:47:00 +0530
> +Subject: [PATCH] CVE-2022-3190
> +
> +Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/67326401a595fffbc67eeed48eb6c55d66a55f67]
> +CVE : CVE-2022-3190
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + epan/dissectors/packet-f5ethtrailer.c | 108 +++++++++++++-------------
> + 1 file changed, 56 insertions(+), 52 deletions(-)
> +
> +diff --git a/epan/dissectors/packet-f5ethtrailer.c b/epan/dissectors/packet-f5ethtrailer.c
> +index ed77dfd..b15b0d4 100644
> +--- a/epan/dissectors/packet-f5ethtrailer.c
> ++++ b/epan/dissectors/packet-f5ethtrailer.c
> +@@ -2741,69 +2741,73 @@ dissect_dpt_trailer(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *d
> + static gint
> + dissect_old_trailer(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
> + {
> +-    proto_tree *type_tree   = NULL;
> +-    proto_item *ti          = NULL;
> +     guint offset            = 0;
> +-    guint processed         = 0;
> +-    f5eth_tap_data_t *tdata = (f5eth_tap_data_t *)data;
> +-    guint8 type;
> +-    guint8 len;
> +-    guint8 ver;
> +
> +     /* While we still have data in the trailer.  For old format trailers, this needs
> +      * type, length, version (3 bytes) and for new format trailers, the magic header (4 bytes).
> +      * All old format trailers are at least 4 bytes long, so just check for length of magic.
> +      */
> +-    while (tvb_reported_length_remaining(tvb, offset)) {
> +-        type = tvb_get_guint8(tvb, offset);
> +-        len = tvb_get_guint8(tvb, offset + F5_OFF_LENGTH) + F5_OFF_VERSION;
> +-        ver = tvb_get_guint8(tvb, offset + F5_OFF_VERSION);
> +-
> +-        if (len <= tvb_reported_length_remaining(tvb, offset) && type >= F5TYPE_LOW
> +-            && type <= F5TYPE_HIGH && len >= F5_MIN_SANE && len <= F5_MAX_SANE
> +-            && ver <= F5TRAILER_VER_MAX) {
> +-            /* Parse out the specified trailer. */
> +-            switch (type) {
> +-            case F5TYPE_LOW:
> +-                ti        = proto_tree_add_item(tree, hf_low_id, tvb, offset, len, ENC_NA);
> +-                type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_low);
> +-
> +-                processed = dissect_low_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
> +-                if (processed > 0) {
> +-                    tdata->trailer_len += processed;
> +-                    tdata->noise_low = 1;
> +-                }
> +-                break;
> +-            case F5TYPE_MED:
> +-                ti        = proto_tree_add_item(tree, hf_med_id, tvb, offset, len, ENC_NA);
> +-                type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_med);
> +-
> +-                processed = dissect_med_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
> +-                if (processed > 0) {
> +-                    tdata->trailer_len += processed;
> +-                    tdata->noise_med = 1;
> +-                }
> +-                break;
> +-            case F5TYPE_HIGH:
> +-                ti        = proto_tree_add_item(tree, hf_high_id, tvb, offset, len, ENC_NA);
> +-                type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_high);
> +-
> +-                processed =
> +-                    dissect_high_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
> +-                if (processed > 0) {
> +-                    tdata->trailer_len += processed;
> +-                    tdata->noise_high = 1;
> +-                }
> +-                break;
> ++    while (tvb_reported_length_remaining(tvb, offset) >= F5_MIN_SANE) {
> ++        /* length field does not include the type and length bytes.  Add them back in */
> ++        guint8 len = tvb_get_guint8(tvb, offset + F5_OFF_LENGTH) + F5_OFF_VERSION;
> ++        if (len > tvb_reported_length_remaining(tvb, offset)
> ++            || len < F5_MIN_SANE || len > F5_MAX_SANE) {
> ++            /* Invalid length - either a malformed trailer, corrupt packet, or not f5ethtrailer */
> ++            return offset;
> ++        }
> ++        guint8 type = tvb_get_guint8(tvb, offset);
> ++        guint8 ver = tvb_get_guint8(tvb, offset + F5_OFF_VERSION);
> ++
> ++        /* Parse out the specified trailer. */
> ++        proto_tree *type_tree   = NULL;
> ++        proto_item *ti          = NULL;
> ++        f5eth_tap_data_t *tdata = (f5eth_tap_data_t *)data;
> ++        guint processed = 0;
> ++
> ++        switch (type) {
> ++        case F5TYPE_LOW:
> ++            ti        = proto_tree_add_item(tree, hf_low_id, tvb, offset, len, ENC_NA);
> ++            type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_low);
> ++
> ++            processed = dissect_low_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
> ++            if (processed > 0) {
> ++                tdata->trailer_len += processed;
> ++                tdata->noise_low = 1;
> +             }
> +-            if (processed == 0) {
> +-                proto_item_set_len(ti, 1);
> +-                return offset;
> ++            break;
> ++        case F5TYPE_MED:
> ++            ti        = proto_tree_add_item(tree, hf_med_id, tvb, offset, len, ENC_NA);
> ++            type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_med);
> ++
> ++            processed = dissect_med_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
> ++            if (processed > 0) {
> ++                tdata->trailer_len += processed;
> ++                tdata->noise_med = 1;
> ++            }
> ++            break;
> ++        case F5TYPE_HIGH:
> ++            ti        = proto_tree_add_item(tree, hf_high_id, tvb, offset, len, ENC_NA);
> ++            type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_high);
> ++
> ++            processed =
> ++                dissect_high_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
> ++            if (processed > 0) {
> ++                tdata->trailer_len += processed;
> ++                tdata->noise_high = 1;
> +             }
> ++            break;
> ++        default:
> ++            /* Unknown type - malformed trailer, corrupt packet, or not f5ethtrailer - bali out*/
> ++            return offset;
> ++        }
> ++        if (processed == 0) {
> ++            /* couldn't process trailer - bali out */
> ++            proto_item_set_len(ti, 1);
> ++            return offset;
> +         }
> +         offset += processed;
> +     }
> +-return offset;
> ++    return offset;
> + } /* dissect_old_trailer() */
> +
> + /*---------------------------------------------------------------------------*/
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> index 38fdbce892..1a4aedc139 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
> @@ -15,6 +15,7 @@ SRC_URI += " \
>       file://0002-flex-Remove-line-directives.patch \
>       file://0003-bison-Remove-line-directives.patch \
>       file://0004-lemon-Remove-line-directives.patch \
> +    file://CVE-2022-3190.patch \
>   "
>   
>   UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98953): https://lists.openembedded.org/g/openembedded-devel/message/98953
> Mute This Topic: https://lists.openembedded.org/mt/93924739/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


