Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B11DC7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 16:27:41 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.20132.1750868853237511639
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jun 2025 09:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HBwDmhgZ;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PGRV5x1502708;
	Wed, 25 Jun 2025 11:27:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750868851;
	bh=oQ3DyOb1Mk9W21xteXxii5p1A854WSN0BrDJPef9zEc=;
	h=Date:To:From:Subject;
	b=HBwDmhgZBTgBwdIf8nw2EbD0dASvYkfagL/4UU1zPnmBbJ2P4pT2ws6tvHKMG/1SF
	 nJH4JDN+yH2HLFRx14dlU8OS2d+tSPCWu6cXZL1FFIxCMuRaSyVFPqW5Ju7ZlTZQgD
	 U0b0rRENxq7f4YNkfwnzNu131lkgsAD8KSTE7eRA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PGRVoq2821702
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 11:27:31 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 11:27:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 11:27:31 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PGRVT33948091;
	Wed, 25 Jun 2025 11:27:31 -0500
Message-ID: <05ecbc8e-911d-41c7-a1eb-598069dbe289@ti.com>
Date: Wed, 25 Jun 2025 11:27:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <openembedded-devel@lists.openembedded.org>, <Qi.Chen@windriver.com>,
        Khem
 Raj <raj.khem@gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
Subject: protobuf build issue
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 16:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118111


I'm seeing a build issue with protobuf-native due to the recent 
abseil-cpp version change.  The new abseil dropped something that the 
current protobuf version is requiring (at least on native).

I have a patch to update to the latest protobuf 6.31.1 that fixes the issue.

What are folks thoughts?  Do you want me to send in this patch?  What 
all else will this patch break?  python3-protobuf?



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

