Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC844FF887E
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 01:02:22 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9141.1777505799984674275
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2026 16:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nabladev.com header.s=dkim header.b=DaEnan9X;
 spf=pass (domain: nabladev.com, ip: 178.251.229.89, mailfrom: marex@nabladev.com)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 041FE114A96;
	Thu, 30 Apr 2026 01:27:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1777505272;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rJabwlqezAtlXCf5f7ACSuDV7HhHcAYSQF+mB9Nh2Og=;
	b=DaEnan9X/9BZ5urpoqei2Ibi9Z0Tm8jsJqZy0LfV9S0pNGNzktaEMn+eLHiLVQ5Q94OeqY
	tLie+kbXkXItQC6bcwGvc09r6sFulWdsDW2PEz/bcMZ9SXdy8mcLk7uRj7VyWDtVhNPWvq
	7BHGT6f3E/WbNoxZjiviGmiD98/6ir9iaJr4RknTQVbXRfAV2NmxRDcbkwjh29XWACPjhO
	IbXWJ20Tn5ALKZSqMl+Cek9+B1Jnp4KAnQES/iNE1JESfqiCt76y6gjeZrG6bAaU1zthuy
	9LzsAe+miKekULsErpTTVnCUaYS15pAbqrUiil/CZsQDmYb/aufK3Q3wyWfwXA==
Message-ID: <77e0fa69-0702-4399-a5cf-0503ebe9ece0@nabladev.com>
Date: Thu, 30 Apr 2026 01:27:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH] populate_sdk: Execute populate_sdk before rm_work if rm_work.bbclass active
To: openembedded-devel@lists.openembedded.org
Cc: Adam Nilsson <Adam.X.Nilsson@axis.com>,
 Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Patrick Ohly <patrick.ohly@intel.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Philip Lorenz <philip.lorenz@bmw.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20260429232506.561814-1-marex@nabladev.com>
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260429232506.561814-1-marex@nabladev.com>
X-Last-TLS-Session-Version: TLSv1.3
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 01:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126667

On 4/30/26 1:23 AM, Marek Vasut wrote:
> In case the rm_work.bbclass is inherited via INHERIT += "rm_work" into
> a build, it is currently possible for an image build to execute both
> rm_work and populate_sdk tasks in parallel, which usually leads to an
> unusual failure of the populate_sdk task.
Please ignore this, this should've been sent to core@ , sorry for the noise.

