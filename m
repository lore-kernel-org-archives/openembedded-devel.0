Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C815FFA3754
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 13:25:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.73423.1726233932529558903
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Sep 2024 06:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ilCYtlSo;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48DDPVQ2023645;
	Fri, 13 Sep 2024 08:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726233931;
	bh=QqBBuyrcZJR6fQX+UjwhjyAXWv0a5AXJvByixvT2WHE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ilCYtlSoYMo2g84yYSnrwqK+ZJHIAdEn/6lFtdkJTx9ABUF6rgxb17eFLu2JtxUwt
	 8fVqsJPDsBdhSzq2BceQIEzUnY++jD3Kkh2RZR5K+ujbY1eUKnPHE/P/BAOuk4B10O
	 ulALj41+iJcbW2Ayn5vi2qdc+WMXwvDAS5vItFyY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48DDPVZD041423;
	Fri, 13 Sep 2024 08:25:31 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Sep 2024 08:25:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Sep 2024 08:25:31 -0500
Received: from [10.249.34.164] ([10.249.34.164])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48DDPUDC018965;
	Fri, 13 Sep 2024 08:25:30 -0500
Message-ID: <c501aa82-8069-48ce-abb2-6c6ab7a86bb1@ti.com>
Date: Fri, 13 Sep 2024 08:25:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] yavta: Update to kernel 6.8
To: Einar Gunnarsson <tolvupostur@gmail.com>,
        <openembedded-devel@lists.openembedded.org>
References: <20240910124936.21220-1-tolvupostur@gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240910124936.21220-1-tolvupostur@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 13:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112274


I'm seeing build failures on 32bit platforms with this new version.  Can 
anyone verify?


On 9/10/2024 7:49 AM, Einar Gunnarsson wrote:
> Additional changes:
> Use https protocol for git fetch
> Build with meson
> 
> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> ---
>   .../recipes-multimedia/v4l2apps/yavta_git.bb   | 18 +++---------------
>   1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> index c4f31c033..db00c67b1 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> @@ -2,9 +2,9 @@ SUMMARY = "Yet Another V4L2 Test Application"
>   LICENSE = "GPL-2.0-only"
>   LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
>   
> -SRC_URI = "git://git.ideasonboard.org/yavta.git;branch=master \
> +SRC_URI = "git://git.ideasonboard.org/yavta.git;branch=master;protocol=https \
>             "
> -SRCREV = "65f740aa1758531fd810339bc1b7d1d33666e28a"
> +SRCREV = "323facd1d5bd6251eec70dd5c1484a12ce01202a"
>   
>   PV = "0.0"
>   S = "${WORKDIR}/git"
> @@ -12,16 +12,4 @@ S = "${WORKDIR}/git"
>   # Upstream repo does not tag
>   UPSTREAM_CHECK_COMMITS = "1"
>   
> -EXTRA_OEMAKE = "-e MAKEFLAGS="
> -
> -# The yavta sources include copies of the headers required to build in the
> -# include directory.  The Makefile uses CFLAGS to include these, but since
> -# we override the CFLAGS then we need to add this include path back in.
> -CFLAGS += "-I${S}/include"
> -
> -do_install() {
> -    install -d ${D}${bindir}
> -    install -m 0755 yavta ${D}${bindir}
> -}
> -
> -
> +inherit meson
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112229): https://lists.openembedded.org/g/openembedded-devel/message/112229
> Mute This Topic: https://lists.openembedded.org/mt/108374819/6551054
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

