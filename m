Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F60C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 09:20:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.6204.1676539233830451474
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 01:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZH2mnEjL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6971040016
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676539232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=joYMOX3oaD/wZ9MURsElMLpNxCHxedNprBh4rs688Kk=;
	b=ZH2mnEjLj7cYFL0mHmVS0gjoqEyvMJ+a80QIBk/1E1eZ2wVV9ABD22Dyv2VMkEUwpwHKW0
	PeUit+pYAb3uSZxSfPsW/9GknEMpHVQN4NF3yuKoTlUzrH1RPjJ/Epf2PEmIAm42YjjdpD
	8BlD20t3Eh2ZvkiOMyo9Xlo4jFtdwwSbBx3q5VrjgJ1QPMRG3YiAJxMe8/vsmgI0zN1rRE
	whtkIWvvULcuuqplZN2uZm5N+Clxf736TzKBe8n+WYsGpHMN0aNktduIVL1D5RodLkTEsk
	QfGsMF5WhYpa2WMWHTzvAqepgAoe+ixkFFnyEhNJc0E1f6WnmbpuTIKXjEPgAw==
Message-ID: <913735b2-d5b6-67be-07c9-064e94097a42@bootlin.com>
Date: Thu, 16 Feb 2023 10:20:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe] [meta-python][PATCH] ipcalc: update to 1.0.2
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <1744437CB635A0DE.20300@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1744437CB635A0DE.20300@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 09:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101100


On 16.02.23 at 10:18, Michael Opdenacker via lists.openembedded.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> - Now built with meson
> - Update the source git repository and home page
>    https://github.com/nmav/ipcalc redirects to https://gitlab.com/ipcalc/ipcalc
> - USE_GEOIP = "no" not necessary in the recipe, already
>    set by default in the code.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>


Forget this one, wrong subject!
Apologies for the noise

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


