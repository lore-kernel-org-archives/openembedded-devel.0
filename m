Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE73C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 09:07:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.17315.1666602457993421412
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Oct 2022 02:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ir5Q2FFo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A6C9D24001B;
	Mon, 24 Oct 2022 09:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666602456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BwSRIvbtg5yQRoIWeaqSgu96B44bMbJl/etbwdeQ980=;
	b=ir5Q2FFokNO4Jgg3oIgPu2IgUwIyuxBjSnnH2ShhGkddGGYUOcCpmjGhG44uU0QnDjjKmn
	sAjC89cnoNCueecqQxX33KZ4D7URuW21QA6SsEYSj3si84mfejNxNaKeQnjNitGi/xSpbI
	qceLwqxkD/RuGiUTlWbUen+GAa47+twZLMzr7oBpjm4IBlQn3wSdR+dENkqW6Mkqh6ALm4
	xaUkIOEDxYr9xUyBgifWFjUTscIrud7tsfPnokHh/ZfOEt7E4bCvtUvqGai/CyZVdJapyo
	qf8Z+hvuN8lS6kSY99J1DlLKrqVO5uSog6oatdTFtIDauuYXDrpZUIPw0QUMjg==
Message-ID: <b54e3b01-3200-3214-5e4b-418319760d9d@bootlin.com>
Date: Mon, 24 Oct 2022 11:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python] [PATCH] python3-xxhash: upgrade 3.0.0 -> 3.1.0
Content-Language: en-US
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
References: <1666593513-2652-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1666593513-2652-1-git-send-email-zhengrq.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 09:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99295

Hi Zheng

On 10/24/22 08:38, zhengruoqin wrote:
> Changelog:
> =========
>   Type annotations.
>   Enabled muslinux wheels building.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>   .../python/{python3-xxhash_3.0.0.bb => python3-xxhash_3.1.0.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-xxhash_3.0.0.bb => python3-xxhash_3.1.0.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.0.0.bb b/meta-python/recipes-devtools/python/python3-xxhash_3.1.0.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-xxhash_3.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-xxhash_3.1.0.bb
> index ca8ed3b01e..bb7bdd3141 100644

Your patches sent by git send-email are still missing a "From:" field 
that would make your identity correct as a commit author. This adds more 
load on the shoulders of the maintainer.

Did you run the following?
git config --global sendemail.from "zhengrq.fnst@fujitsu.com"

See  the patches that Wang Mingyu sends now.

Thanks in advance
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


