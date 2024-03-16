Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F975C54E73
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 21:09:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.6053.1710623336053091073
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 14:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=njheynR/;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CE78A87DDD;
	Sat, 16 Mar 2024 22:08:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710623333;
	bh=E3pc9pPTR6QxPdnePParvQihi0QGDwvmvNCEsbEHsio=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=njheynR/Oxu4bgnp0FyjTys0fUWQH7EsnDCOfjgqbJVQYO1oHeB4zYArLzz9/Yrw2
	 RbxPuWKupVlZLp102bfLNjlxD9Z+QcSKQsSUGUlPOl2x+ZPxMOhdM6LdfMdWHGaiN9
	 qwP+PlsfGJJbV+bfOjUZDDd7OWy7DB7ykGURLeXF463HxdVOR7XZPiwxc8niX1zetP
	 bzzwT1S3iZonsCqyNb+XgCQYLSWQsDXQAhCfosmG0/ZtCchqNy4p07x1v23GNsEH8j
	 t3IDqEtN0x6+hT6qcEPkG1llrBnk6bX7ctTECVoGhYeknmDjMGoXiGFLHjIjC3plkB
	 HoygyyLdssNvw==
Message-ID: <ae0c47f4-d155-436a-ab1b-7c0c9f9da9f5@denx.de>
Date: Sat, 16 Mar 2024 21:41:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v4 3/7] lvgl: remove useless FILES include
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-3-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240316100056.409758-3-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 21:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109368

On 3/16/24 11:00 AM, Christophe Chapuis wrote:
> As ${includedir}${PN} is already listed in FILES, there is no
> need to add one of its subdirectories.
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>

Reviewed-by: Marek Vasut <marex@denx.de>

