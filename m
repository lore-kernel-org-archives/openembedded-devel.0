Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3C3C64E67
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.11901.1649546472079976244
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 16:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=OeeNQqZJ;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9E20B803F5;
	Sun, 10 Apr 2022 01:21:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1649546469;
	bh=aaWGe8taI9UYajjS8RNYMgRLdB7LSqiBVL5TbCiml6s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OeeNQqZJhgNJ8wBrkvPa3qu78yI76rtV7w0N2jg4fwF2UpiRSeC7OU4Kmwc0hBsAH
	 mPVjuflxfFE2fKj9Rrq6ri/TOmrNt9Zp4HxAQsy479/8WlI7u7VRc4xjjV2WSavsM0
	 Or095UKdlLiMuagQjwxc1puFQLidGPcz1HHiVtxoo68lAFoES9517yT1VhPBf8c/HN
	 gnwF+qRviaQmO9ZSKDlxShvJiv0DWYq6tLMwpeYL+Jv18hsOisxi8ko5ohULxnc79W
	 fpLPfyAQekto6BKWgo9LQNYPVBaAcPeQsrY9klF2Ay/aXBkHpqqqzaD8To4oo6Av5T
	 Cq73+8u6q2Yjg==
Message-ID: <7971d511-630b-a312-9052-06b76a429eca@denx.de>
Date: Sun, 10 Apr 2022 01:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-oe][PATCH] wxwidgets: Fix build without x11 and with opengl
 DISTRO_FEATURES
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220409194644.78969-1-marex@denx.de>
 <CAMKF1sord5m4Ne_P+QJ=K4AM3=SvAbJbO2UMT1HaeVuk3G1auw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: 
 <CAMKF1sord5m4Ne_P+QJ=K4AM3=SvAbJbO2UMT1HaeVuk3G1auw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96504

On 4/9/22 21:53, Khem Raj wrote:
> There is already a patch staged in master-next
> 
> https://lists.openembedded.org/g/openembedded-devel/message/96479
> 
> does that solve the problem?

That patch from Scott is even better, thanks !

