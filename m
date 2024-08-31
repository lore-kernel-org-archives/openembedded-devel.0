Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5082CD13DA
	for <webhook@archiver.kernel.org>; Sat, 31 Aug 2024 15:41:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.7564.1725118897981326186
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Aug 2024 08:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tkhqp2aU;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47VFfadU002861;
	Sat, 31 Aug 2024 10:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725118896;
	bh=HQUIV4879llcPl/QmygE6ApuJQP7Rv+pg/bBCkwxPNI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=tkhqp2aUC6qxOOOH/bFfz+mrOIiphiXD/KorEkvsln5wlKdiKQQpzWYp8NZn+brxz
	 n9tFP+qzUeyRKvcBqYC/OmqceItfFFaqOEt1veGyJtk611FTyhu5gKY1udFYl1COfv
	 /uOY3b/ldtQ5KGg3GBhc7OsO7+nR65zSei6AOY0c=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47VFfauQ011907
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 31 Aug 2024 10:41:36 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 31
 Aug 2024 10:41:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 31 Aug 2024 10:41:36 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47VFfaRT109614;
	Sat, 31 Aug 2024 10:41:36 -0500
Message-ID: <8c7ff1e0-6ef0-49e0-901f-7a5f94aead69@ti.com>
Date: Sat, 31 Aug 2024 10:41:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 5/8] mpv: Upgrade to 0.38.0 release
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20240830035827.406391-1-raj.khem@gmail.com>
 <20240830035827.406391-5-raj.khem@gmail.com>
 <17F08A6E249C2A38.19027@lists.openembedded.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17F08A6E249C2A38.19027@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Aug 2024 15:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112060



On 8/30/2024 10:14 AM, Ryan Eatmon via lists.openembedded.org wrote:
> 
> 

> 
>> +PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=diabled,virtual/libx11 xsp 
>> libxv libxscrnsaver libxinerama libxpresent libxext"
> 
> Mispelling on "diabled", should be "disabled".
> 

Well... since the patch has already made it to master I'll send a new 
patch that fixes this spelling mistake.



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

