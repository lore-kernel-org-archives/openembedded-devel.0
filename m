Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8672C83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 16:10:33 +0000 (UTC)
Received: from outbound3.mail.transip.nl (outbound3.mail.transip.nl [136.144.136.12])
 by mx.groups.io with SMTP id smtpd.web11.11932.1752594408704957488
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@myspectrum.nl header.s=transip-a header.b=YUmOgL2K;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.12, mailfrom: jeroen@myspectrum.nl)
Received: from submission15.mail.transip.nl (unknown [10.103.8.166])
	by outbound3.mail.transip.nl (Postfix) with ESMTP id 4bhNpX6kqwz129dg;
	Tue, 15 Jul 2025 17:46:44 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission15.mail.transip.nl (Postfix) with ESMTPSA id 4bhNpS4D49z2mZN1L;
	Tue, 15 Jul 2025 17:46:40 +0200 (CEST)
Received: from [192.168.178.17] (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: jeroen@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 3125520117;
	Tue, 15 Jul 2025 15:46:38 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=jeroen@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Message-ID: <12cb4783-4aee-420a-85b9-a29b43fb737a@myspectrum.nl>
Date: Tue, 15 Jul 2025 17:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] tailscale: add initial recipe for v1.84.3
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 Ross Burton <ross.burton@arm.com>,
 Jeroen Hofstee <jhofstee@victronenergy.com>,
 Mark Bath <mark@baggywrinkle.co.uk>
References: <20250714202915.902593-1-jeroen@myspectrum.nl>
 <CAMKF1srjbOv7ysURM-DmArgCWWsTUeMGbn9aMZmmtR0LEPOTJg@mail.gmail.com>
From: "Jeroen Hofstee" <jeroen@myspectrum.nl>
In-Reply-To: <CAMKF1srjbOv7ysURM-DmArgCWWsTUeMGbn9aMZmmtR0LEPOTJg@mail.gmail.com>
X-Scanned-By: ClueGetter at submission15.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1752594400; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=l5b01j3GAcmDxnw+fLCcmLz7Hcb1NJ35VCrLaBtGTwo=;
 b=YUmOgL2KxlM9plsq1dvS5v+NzBuajB8QcNzSaJLdZ/qK3pDtwJBXWDyHgL6B6VV7L14PwD
 03k7413aK5/9PtPbYIHbDFEq1VJRsuSNNNHPbqCQzuMEn6xtqjW2KgWt1e2X+cFoaq5n9I
 JgQIYKdyrLEoNTK9+gXqaGzNonSTULKszASW/YuBlleV/wESyG8TT6MZ28sJU+Xi78bCij
 l95ZLgRkAMiIx9mj1vHpduJqRnf8HPLrZWtS11iUbUuZELUUG+TJQHvfq/2j5Dc7OdcP3x
 ToeYvevVSB0g54PyZ2urBu+uMWU6fjhKa9kpCgiKp9VE8ethzxjOjEjl/xoyvA==
X-Report-Abuse-To: abuse@transip.nl
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 16:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118563

Hi Khem,

On 7/15/25 16:48, Khem Raj wrote:
> one of musl/qemuarm64 builds fail in do_compile, it seems to be trying
> to access network to fetch some modules see
>
> https://errors.yoctoproject.org/Errors/Details/872189/

[...]

Thanks, I was already surprised that that worked. It does work
here locally, as in, cleanall, fetch, disconnect network, compile.
aws is a direct requirement of tailscale though, dropping that is
actually new since whinlatter, it used to be there before.

I will clean everything and build from scratch and check if I can
reproduce that, a lot of things got moved etc...
That might take a while though.

Regards,

Jeroen


