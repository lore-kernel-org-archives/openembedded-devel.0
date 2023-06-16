Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8057EEB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 22:18:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.542.1686953897614291085
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jun 2023 15:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=F5jTzyFn;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35GMIHkT086182
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 17:18:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686953897;
	bh=x4mRMMlHri/GDm+0Nso/8+AU33TIa4+j4P3q5w3/ilI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=F5jTzyFnmFO+Ox31IFr/uzN3w9ujPnhNM2RbPfYsVApc25FfdfwShFJBLNs0njleC
	 6m56hQtOFmwqUmrgbp3RmQpc6KyBRBuc4dlbx9JcvOfLaGOtNUABP2qGbszyVItVmi
	 IKutfVjS2W88xt4Gaysay62P5ihGwQ2jwJtY5KQY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35GMIH2k024514
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 17:18:17 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Jun 2023 17:18:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Jun 2023 17:18:16 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35GMIG42107471
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 17:18:16 -0500
Message-ID: <46982fd3-2875-6fa0-9b30-03dd8a4f9d1e@ti.com>
Date: Fri, 16 Jun 2023 17:18:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [EXTERNAL] [oe] [meta-oe][kirkstone][PATCH 1/6] glfw: add
 packageconfig and wayland dependencies
Content-Language: en-US, en-US-large
To: <openembedded-devel@lists.openembedded.org>
References: <20230615205637.724348-1-rs@ti.com>
 <1768F09D6B3AA47F.29648@lists.openembedded.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <1768F09D6B3AA47F.29648@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 22:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103345

On 6/15/23 15:56, Randolph Sapp via lists.openembedded.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> GLFW has the ability to use a wayland backend. This patch adds a config
> for it, but does not enable it by default because it has a dependency on
> extra-cmake-modules which is provided (most commonly) by meta-qt5-extra.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>

Whoops. That wasn't supposed to be included. Please ignore this patch, 
we had a previous discussion about it [1] and I haven't gotten around to 
cleaning it up.

[1] https://lists.openembedded.org/g/openembedded-devel/message/102216


