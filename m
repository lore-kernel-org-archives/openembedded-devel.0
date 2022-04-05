Return-Path: <stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BFCC5519F
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web11.3615.1649147997656375851
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 01:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@datenfreihafen.org header.s=2021 header.b=CG6Ch9Vr;
 spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185,
 mailfrom: stefan@datenfreihafen.org)
Received: from [IPV6:2003:e9:d721:c707:f462:96cc:47f6:1c47]
 (p200300e9d721c707f46296cc47f61c47.dip0.t-ipconnect.de
 [IPv6:2003:e9:d721:c707:f462:96cc:47f6:1c47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@datenfreihafen.org)
	by proxima.lasnet.de (Postfix) with ESMTPSA id CBB4FC0A49;
	Tue,  5 Apr 2022 10:39:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
	s=2021; t=1649147994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wzKA0cmuBMgaV0m7rkSAVA5D+uWHQkr5H5TF3+xcR/I=;
	b=CG6Ch9VrGCbihjRo2BNxtDIJ2gYU0S/8AtQh2iZhRwOTX5yQHZeoOhEZnMPIyhZirANPNs
	gwRrIhfwbHYYWM9KedGgxkcmj2oAoksfBBxUqhe0QogDrQ58HaUsU55hQ1XC9JfZOP5Vqa
	IcqY/Yc6Tu6s2hWBOSVoysZ+mmBrnwzPC/zSMPiOlSYJqWvtYPhgaO2OmSArvpAYFfLimR
	9EPP5E4Wwb3KxZTh46MdbXcH7QuylBE0mlOjghR3fu+EU7pnIhzqgX0kUhOzJIxf8PwDYC
	FwQSMY/ALb9Hpu0tsnOcgq9XKj4OOaB8BhGD/hRtorS9wO4uw7KbSQnxGX/h8g==
Message-ID: <0dffc397-22be-a6b1-0fb2-8792c6c93dd8@datenfreihafen.org>
Date: Tue, 5 Apr 2022 10:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-networking][PATCH 2/4] ot-daemon: add recipe for
 OpenThread daemon
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 Stefan Schmidt <stefan.schmidt@huawei.com>
References: <20220404130354.2131131-1-stefan@datenfreihafen.org>
 <20220404130354.2131131-2-stefan@datenfreihafen.org>
 <CAMKF1soas80msGDvw7zB7S=8rXuz2ni4L2FwbffXw=BJ1xNygA@mail.gmail.com>
From: Stefan Schmidt <stefan@datenfreihafen.org>
In-Reply-To: 
 <CAMKF1soas80msGDvw7zB7S=8rXuz2ni4L2FwbffXw=BJ1xNygA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96420


Hello Khem.

On 05.04.22 05:16, Khem Raj wrote:
> fails on x86_64/glibc see
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1610

Ah, its not x86_64/glibc (I tested this) but the fact that the 
autobuilder uses poky and I tested here without DISTRO in openembedded core.

Seems the code base it not happy about the gcc changes to warn on the 
combination of _FORTIFY_SOURCE and non-optimized code:

error: #warning _FORTIFY_SOURCE requires compiling with optimization 
(-O) [-Werror=cpp]

Will fix and resend.

regards
Stefan Schmidt

