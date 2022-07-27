Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C073C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 15:59:11 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.21512.1658937543453000303
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 08:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=InBo73z/;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id z132so13921852iof.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 08:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=aNDJm3cvI0itiZ0HayOY1ouCvfoIyV0JsLEQdiYLgTM=;
        b=InBo73z/+Luc+v7NkyGefjHgq2mnrdl3sg9oyrDt6xQIoLoaFNGmZggz3vBPS3wwCw
         0zpQ5QHlvCdOkKCnmIygzBHXR4Cnz5UP5mS5fRYUFW1f970xYPnSTsMlQ9298K52E9oO
         gbUpjgRulYnvcDBxU0nU7e0KlX43y4Ucy5zL4/X5hFMMS7JQOXq/IXWkAG7dd8vsJvIA
         uWBbOWgpiBQMxmwcczTKbQj31gJAEBNai5JShf9xnlb195bem2Yni4fPF9Rnsk7R/vfu
         VcCq0pNyC+7jc7KGQArDyJxPzZpEdm5UDveqW7h+8nEUkoz49ZSepO37p3XuqbWe7NjH
         YkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aNDJm3cvI0itiZ0HayOY1ouCvfoIyV0JsLEQdiYLgTM=;
        b=GJeGyU4ZhnUXYY6FZRhAgvFn4pteiP2Ofoo46/mLPsvNwO+itxnghoGRGnlbODhpPt
         ZEp11vRssDshDjO5P+QPaV8znRNxw0uptFlOVZd71KNPC6D7RB7pmDBa2lPmelJIw1e1
         Ww2DsI9JFSNSQ+URLQ7l4EkefmWoAkzpdTFg5qlckK9sfBYQ2NQ2cf9uRkAX//REjE7R
         wsEpr+lTFvxZcQ535+VtlXLBzxQ9K+hqGjUXSJq1UU4sRHsK6PZ4wR28/ctTPw3m7ZTp
         MI7OdL/crBZRYxB489rjJtxtaEdQSsjza6XCJ7maozLBBbbHHFXKncwNDb4LjnUX7UIu
         LdGA==
X-Gm-Message-State: AJIora8z3+gVaJ2C6VgrIvzZ4B34yT1w9E/18s0tB45tzfdOfMM87Lqs
	Y1twL5oec1sSiYcVyWkPmjA=
X-Google-Smtp-Source: 
 AGRyM1uiA1/RGgOVkg9JT8JQ4iA2Qy5HiOfpNYWeT61WbsAoeiNcs//G4bcarjtFx+OWGRpzqaV8EA==
X-Received: by 2002:a02:ad12:0:b0:33f:4663:e784 with SMTP id
 s18-20020a02ad12000000b0033f4663e784mr9441991jan.29.1658937542662;
        Wed, 27 Jul 2022 08:59:02 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:e8b7:596a:a352:5d5c?
 ([2607:fea8:95df:9730:e8b7:596a:a352:5d5c])
        by smtp.gmail.com with ESMTPSA id
 b10-20020a92dcca000000b002dd10ca9272sm6950629ilr.24.2022.07.27.08.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 08:59:02 -0700 (PDT)
Message-ID: <b7ecdf3a-3db3-3eb8-868e-efe52cedd1c9@gmail.com>
Date: Wed, 27 Jul 2022 11:59:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [oe] [meta-python] [PATCH] python3-absl: upgrade 1.1.0 -> 1.2.0
Content-Language: en-US
To: zhengruoqin <zhengrq.fnst@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1658462573-26038-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1658462573-26038-1-git-send-email-zhengrq.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 15:59:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98017

Hi Zheng

Your emails come out with skewed time e.g. this email shows up from July 
22 but it came in today July 27, please fix your system time on the 
machine you use to send these emails. It makes it difficult to sort the 
patches if they are not in right date and time for my process.

On 7/22/22 12:02 AM, zhengruoqin wrote:
> Fixed a crash in Python 3.11 when TempFileCleanup.SUCCESS is used.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>   .../python/{python3-absl_1.1.0.bb => python3-absl_1.2.0.bb}     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-absl_1.1.0.bb => python3-absl_1.2.0.bb} (76%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-absl_1.1.0.bb b/meta-python/recipes-devtools/python/python3-absl_1.2.0.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-absl_1.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-absl_1.2.0.bb
> index e3f7c4c6ae..42b3ddc93a 100644
> --- a/meta-python/recipes-devtools/python/python3-absl_1.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-absl_1.2.0.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -SRC_URI[sha256sum] = "3aa39f898329c2156ff525dfa69ce709e42d77aab18bf4917719d6f260aa6a08"
> +SRC_URI[sha256sum] = "f568809938c49abbda89826223c992b630afd23c638160ad7840cfe347710d97"
>   
>   PYPI_PACKAGE = "absl-py"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98008): https://lists.openembedded.org/g/openembedded-devel/message/98008
> Mute This Topic: https://lists.openembedded.org/mt/92646147/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

