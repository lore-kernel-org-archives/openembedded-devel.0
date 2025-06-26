Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541E0C7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 15:00:53 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10345.1750950047622998946
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 08:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=j5BLq1gE;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QF0ik01765910;
	Thu, 26 Jun 2025 10:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750950044;
	bh=AvVNni1M6slkTSub/OmqI53wV0wnaqoBV1ocMbcN+Kw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=j5BLq1gEW9KvAYS7IjVToCyYoIR65sBW97+ol1zzUr3vjFBbEqk8HM+8jZyQ5y+Xs
	 Kr2Tn5oifGNDdRKpzZChpSW2UBFgVGk+PtZz9jV864Km5wsdDZxIgmQYM//RKzh+3z
	 uDlyt/KAJeHZEReUBqH6q/vLgM8Tz++qtfNBhWR8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QF0itd3724112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 10:00:44 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 10:00:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 10:00:44 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QF0ida1456679;
	Thu, 26 Jun 2025 10:00:44 -0500
Message-ID: <de57cc74-9aee-4703-b50b-fd9806bc1c69@ti.com>
Date: Thu, 26 Jun 2025 10:00:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] python3-protobuf: upgrade from 5.29.5 to 6.31.1
To: Jon Mason <jdmason@kudzu.us>, <openembedded-devel@lists.openembedded.org>
References: <20250626144912.3573904-1-jdmason@kudzu.us>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250626144912.3573904-1-jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 15:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118130


Thanks.


On 6/26/2025 9:49 AM, Jon Mason wrote:
> From: Jon Mason <jon.mason@arm.com>
> 
> protobuf was upgraded from 5.29.5 to 6.31.1. Upgrade python3-protobuf
> to match, otherwise a fatal mismatch error occurs.
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>   .../{python3-protobuf_5.29.5.bb => python3-protobuf_6.31.1.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-protobuf_5.29.5.bb => python3-protobuf_6.31.1.bb} (95%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.31.1.bb
> similarity index 95%
> rename from meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
> rename to meta-python/recipes-devtools/python/python3-protobuf_6.31.1.bb
> index 14ab3237b97b..bb801ffb71f4 100644
> --- a/meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-protobuf_6.31.1.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
>   "
>   
>   inherit pypi setuptools3
> -SRC_URI[sha256sum] = "bc1463bafd4b0929216c35f437a8e28731a2b7fe3d98bb77a600efced5a15c84"
> +SRC_URI[sha256sum] = "d8cac4c982f0b957a4dc73a80e2ea24fab08e679c0de9deb835f4a12d69aca9a"
>   
>   CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118127): https://lists.openembedded.org/g/openembedded-devel/message/118127
> Mute This Topic: https://lists.openembedded.org/mt/113844469/6551054
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

