Return-Path: <stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49B7C47081
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web09.2666.1650364407448744318
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 03:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@datenfreihafen.org header.s=2021 header.b=Cr5c6tNG;
 spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185,
 mailfrom: stefan@datenfreihafen.org)
Received: from [IPV6:2003:e9:d720:33c2:d796:27fc:6107:c495]
 (p200300e9d72033c2d79627fc6107c495.dip0.t-ipconnect.de
 [IPv6:2003:e9:d720:33c2:d796:27fc:6107:c495])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@datenfreihafen.org)
	by proxima.lasnet.de (Postfix) with ESMTPSA id C0B36C06B0;
	Tue, 19 Apr 2022 12:33:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
	s=2021; t=1650364403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbcYnQi0SkW1O+EaezggUejkRC3gDsviHZTm42AqoiE=;
	b=Cr5c6tNGfLX26Q1ufreNY7PtLLWTDd3zVwysMS0aG30rFSsOSbWqb+GqiipHejz15JjE88
	3qBPrnhCRU5k+bUycOuyL4px+Af1jmSl6wdoo8KxwDG6fxyzLMFtZtKk03oNz7FEapOvXy
	PSgQ3wS17HxA3ETHngIPX/75AjZN6Ine6pgST2By49NH3h4xuxL8o/jwGLtpKgq8KGOc7E
	qyWTIZIGJZV1eOIU5pnz/ELqOuQlQzcppA6/vaAMwnQNBd3sXL0kMrhsQkxlpyknDA4eYf
	CLPmxcuilKyeFshMXB+mIko9ypSp8to0PUo4R2BBuYJVAemoLmPUwTId3Fx7bA==
Message-ID: <835de5fa-47f5-248f-be7d-b7a95c3d43ac@datenfreihafen.org>
Date: Tue, 19 Apr 2022 12:33:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [oe] [meta-networking][PATCH v3 1/4] ot-br-posix: add recipe for
 an OpenThread Border Router
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 Stefan Schmidt <stefan.schmidt@huawei.com>
References: <20220407191438.3696227-1-stefan@datenfreihafen.org>
 <CAMKF1sqT2ZBRU7q9ojY-Jq_PAJGEH5ntfU_ZbEixNRYFi3btvA@mail.gmail.com>
From: Stefan Schmidt <stefan@datenfreihafen.org>
In-Reply-To: 
 <CAMKF1sqT2ZBRU7q9ojY-Jq_PAJGEH5ntfU_ZbEixNRYFi3btvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96691


Hello Khem

On 12.04.22 15:56, Khem Raj wrote:
> this fails with gcc ( especially with gcc12 )
> 
> https://errors.yoctoproject.org/Errors/Details/654559/

I saw you fixed this already while I was enjoying my vacation. Thanks!


I like the CFLAGS override for the specific clang musl case also a lot 
better!

regards
Stefan Schmidt

