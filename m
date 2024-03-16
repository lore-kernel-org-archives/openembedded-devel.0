Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58376C54E72
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 21:09:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.6120.1710623338324016974
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 14:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=drbcoqOm;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C281687FCC;
	Sat, 16 Mar 2024 22:08:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710623335;
	bh=eZ4OunzrYa+RJGar/NQlLtAOi31rns89T/qszhNS28I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=drbcoqOmZ4J5IKqEfYBIgt/7BX9Ho92W0+rrJ76QNzytqIYn/JCkjhKWU3fRCr7ht
	 vnKJfbo3e2gEKsYJ+ZApBIuFT+y8pVXRqFjoh0K/c0dxYg4xIK55XE7xIqnbIBvyTe
	 Wn+hpOSNFoblP80xS4ds2czcc0Cni7GL08n38MraXHcf2myx7JafeuXZyIrZeQaRHl
	 p+5M3QPar2I7DGE+ILqWqWHnCHL+scFHIn5Hx9+Iq0yxQiasafELMPOo3vI+O4cjUI
	 zQa+d+G0fULCXFCxLXFaUxd1RzHV6k5tP3uW6vvw43uzWx4TrNUCh0iUDJ6PSnWgHX
	 9aG+JeKpaN/ZQ==
Message-ID: <1f31165f-adc1-4148-a9ee-873c12c36a30@denx.de>
Date: Sat, 16 Mar 2024 21:43:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v4 4/7] lvgl: cleanup sed instructions in
 lv-conf.inc
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-4-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240316100056.409758-4-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 21:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109370

On 3/16/24 11:00 AM, Christophe Chapuis wrote:
> Use back reference instead of repeating the search pattern. Later on
> this could lead to a more generic way of replacing values in the .h file.
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>

Reviewed-by: Marek Vasut <marex@denx.de>

