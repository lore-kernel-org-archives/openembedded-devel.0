Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BC2C3064D
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 16:05:14 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.11800.1719504311674548745
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 09:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=LwVi1LYZ;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0C26F88435;
	Thu, 27 Jun 2024 18:05:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719504310;
	bh=d3d42TvyvCtGcXBxG6/XV5NuayCm3mAqDeDZ2Qfvw+I=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=LwVi1LYZrJNlQxx72Xg1NTDVUlECXpyhrUl5tF12/fU2f2tLifuwZytGlsQnggiHs
	 VeFopWOH0acRtrElzMTTdkRLj/OSO+TRqMoOqh+vYXYsRuTTefllkJE8/GjVugx/9R
	 8q4RnyTl+35FVzmsxw2N58pUijJRA+BDl8/jG05cKiqp7KRtF7JUIxJ/gI6IelB207
	 ytyBNht+ieP/EFFk5GD1CvUpSqTRTUokA73nzFsTrp76T6W4ZqbAibZssG+ujI4aKh
	 SNVP0qTcv0Ihxl//L4YRZEHkYwEryl4oUzr8DicrxKoU8xp+oBKsRN7vEqeEMkAt2i
	 AFJ1QMsWUSGdQ==
Message-ID: <0e77a1f5-7df0-49a3-bdf0-138e594fcc20@denx.de>
Date: Thu, 27 Jun 2024 17:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 1/2] lvgl: fix version in shared library file
 name
To: Christian Eggers <ceggers@arri.de>,
 openembedded-devel@lists.openembedded.org
References: <20240627085256.21526-1-ceggers@arri.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240627085256.21526-1-ceggers@arri.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 16:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111128

On 6/27/24 10:52 AM, Christian Eggers wrote:
> The version in the patch file needs to be updated.
> 
> Fixes: 0c19e65a0969 ("lvgl: Update to 9.1.0")
> Signed-off-by: Christian Eggers <ceggers@arri.de>

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !

