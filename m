Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358C9D4415C
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 13:07:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.20422.1732020928424139101
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Nov 2024 04:55:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=limQ9UHr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0215FF809;
	Tue, 19 Nov 2024 12:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732020926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VLnTByZIwjgP7+Qo4zP2rQSmuTz+dAzuydEy3sv0Xr0=;
	b=limQ9UHr11RMZ0tsdY1Ns0Z2IVXkx2eTmy+/RWRW0PEBirZdyn0PON6YKDVy5B6k7Gcgo/
	YiZKppC7AOrtd3nltXr/oJWJrE3TnThyY/f2jKUVS4sEyUrZRJBkC8e0suOgsyNn3FbZSl
	/l70U1S5gx/6udNYp8JAWPwpwNtSf3db80qC5XYPhdjcDEs2AJgvhuQlaPfgeOINuxw3AF
	M34AET/CZ5ZaW03uHxTKAUxCr0amouWmfQh70jhxf/UNCZ4YCD+cRhQdSZ5q0/c7EF1oob
	ZdEhEGPeb6fmw+95s/rTZmG93tJvcslNmqbBs4Z9IEtuNvt3k79Z7KU874WwBA==
Date: Tue, 19 Nov 2024 13:55:24 +0100
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Zhang, Liyin (CN)" <liyin.zhang.cn@windriver.com>,
	Steve Sakoman <steve@sakoman.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lttng-ust: backport patch to fix cmake-multiple-shared-libraries build error
Message-ID: <ZzyKvNO8ZLK-UMT4@bootlin-mathieu>
References: <20241114111829.1182716-1-liyin.zhang.cn@windriver.com>
 <ZzX0di8r1p4zh_PO@bootlin-mathieu>
 <7a80e2e2-622a-419d-8ea6-7c29e2a2a992@windriver.com>
MIME-Version: 1.0
In-Reply-To: <7a80e2e2-622a-419d-8ea6-7c29e2a2a992@windriver.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 13:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113909

On Tue, Nov 19, 2024 at 09:32:17AM +0800, Zhang, Liyin (CN) wrote:
> 
> Sorry, I forgot branch name. Please merge it into [scarthgap].
> 
> Thanks.

Ok, noted it's not for master. Adding Steve, in copy to make sure he
sees your patch.

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

