Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC24CAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 12:31:51 +0000 (UTC)
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
 by mx.groups.io with SMTP id smtpd.web10.31341.1757938146753999115
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Sep 2025 05:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prolan.hu header.s=mail header.b=UiIGiCty;
 spf=pass (domain: prolan.hu, ip: 193.68.50.107, mailfrom: csokas.bence@prolan.hu)
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id C2DC2A0368;
	Mon, 15 Sep 2025 14:09:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=vHTtNog9RNnbdlJnW01S
	SDMxzB2F/pT/kU6Fphe0ti4=; b=UiIGiCty2k+xlgiK1Mmmg+nNL63BVg0hZdoO
	+QyApbaUOzyQKLa9lTWF3Qn/B02Mnm6jKkQ+Vi/eooDyBd0+jDSe2lJC9hrXiM3V
	r1+gf8pgNG6ZHQXIhqfncWq02Urf1g3hVsMMXX26DZ+3tYK6x9yq5b4sHSzN7WfT
	TasT1TZiovKn6enM2VfD2g17kzOqCEY7zOwGDMMQFoOoOR2gGgFjKkwUGEL6k0iC
	W1bmIWeBOgxyhVhqKWGuPZDyRe8jx38BGBLxziB6gVEFg4KO2NzSNiJT3pacQDST
	c5jZ4v4XZ876+CLLtlLzJ7jp17cEpAupGsc4NYxOa5kEmeWFl+exVpVHP7T+eQp+
	Q5M3r86ywv/caobpvcknXTuTCypwmDxcGZ3gBnMqpTbKrw6yb8HII/egLYBoRdvp
	K7zVcEPfYv4hlHaobJ4au0/q/VZPgMXStJItw7BO1ZZ7DShbqWpiDSv7FMT8bVC+
	FGCrKO3Bi2VohjN3wKuhGsFa0ctGM7Ssar6lFARrRysNqNNi+Db7N7TDEj5VeuMO
	L4LzW74JxUDFEeDSszKhGZFkvAvBUw2xovNLMFv8dcho7HXNGf0GodNY+80//kTy
	CmBrVIZME6aaw8vV7JOgsFN+1BvtZXreMIF2awtu9wDCm5J9DXhLJLEZAkwbYpeI
	G5+Mt5k=
Message-ID: <3e61388e-8a2f-49a8-afff-8cf9d177adb8@prolan.hu>
Date: Mon, 15 Sep 2025 14:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] linuxptp: Add systemd instance specifier for ptp4l dependency
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
CC: Martin Schwan <m.schwan@phytec.de>, Khem Raj <raj.khem@gmail.com>
References: <0e42cad2-4d7b-4adf-9947-c3b431e09a1b@prolan.hu>
 <20250915095310.800122-2-csokas.bence@prolan.hu>
 <dff31734-f80b-4f63-b31e-19a2937c4b65@gmail.com>
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <dff31734-f80b-4f63-b31e-19a2937c4b65@gmail.com>
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E627264
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 12:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119408

Hi,

On 2025. 09. 15. 13:20, Gyorgy Sarvari wrote:
> Note that this has been part of Scarthgap since a few hours ago:
> https://git.openembedded.org/meta-openembedded/commit/?h=scarthgap&id=10fc22193840ad6f8d08aa05af0f1823714bfaaa

Yes, after I sent it, I noticed Anuj's Pull Request submitted on Friday. 
However, I did not see that it was merged. But yes, apparently it got 
pulled in the morning.

Sorry for the noise.

Bence


