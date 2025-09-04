Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00B4CA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 19:26:30 +0000 (UTC)
Received: from beige.elm.relay.mailchannels.net (beige.elm.relay.mailchannels.net [23.83.212.16])
 by mx.groups.io with SMTP id smtpd.web11.3574.1757013990300966263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 12:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=Cf540A9U;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.16, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremailsmtpin|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5F271854BE;
	Thu,  4 Sep 2025 19:26:29 +0000 (UTC)
Received: from fr-int-smtpout11.hostinger.io (100-102-90-229.trex-nlb.outbound.svc.cluster.local [100.102.90.229])
	(Authenticated sender: hostingeremailsmtpin)
	by relay.mailchannels.net (Postfix) with ESMTPA id 67E7284673;
	Thu,  4 Sep 2025 19:26:28 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1757013988; a=rsa-sha256;
	cv=none;
	b=Oei0Twrp/PsHzRFlO0M6kEga5a+iBbPQUswFRx3ywS0bjwFqZnPnN8y0Ma6Lr9Q2tqTEb/
	6ua8qrSY9ffeEcmZyNMtUgTff3UPG2FycTYNAuok/5+j/w07Oqz5UmkZMFuZyZJ5COlke8
	3NVmGkpj3gIkEdgU7PxxpmICqhBnj1iOQU/P1LxAZxr0DN82RM5JU5zYgipxkd8bOpTEz5
	muPkbTTEfetWEeRwP/PBnTSFNnBBbTKZDOdx17UWuBcUrfdnCI2PGbd53CldyaxOjerAUG
	lWCMX4XKbgzgGIC1XPYAobZKmC+EEHWxLcrSoTEjLLql8WBd610ZX3I1PgRvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1757013988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=gXWKLi7k8RrQ3dl+oKaYp4ZaIXaDcp/WKRbomMSLhEs=;
	b=KP1EEGWRDsD8/eVVlCQ92R8g4P4ZSAl8T1uc0cT7YTxBxiQ7m/fROT/qNqcpipKlTfziUL
	JCRrijAabejEEOhqjKnSFvtKaAAfIcLdU4xbWp2iLJWR70GVpcYPk45aBTUK98SCDg8aM9
	NNVPDszkNM5wfRBUKreXtQ1eumXZxzS9GKSGp+rEri5syHMC1xMBZC6e1QPQnlkSzxQ/bq
	W3sVsnCqF/lBVaSIYrqBLbGUylWx/8fUeUibUY+RX6bl0bXrHzuguqD86eIYOuE1e3S+r1
	K2mKbA8Y0lob1B6IyWtkQRRpvvOd/gvc0HQySCwVI8fWOQtYkf5CcG/swqctiw==
ARC-Authentication-Results: i=1;
	rspamd-8b9589799-8nm74;
	auth=pass smtp.auth=hostingeremailsmtpin
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremailsmtpin|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremailsmtpin|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremailsmtpin
X-Eight-Cooperative: 51542af52c119a56_1757013989087_403775838
X-MC-Loop-Signature: 1757013989087:3650258433
X-MC-Ingress-Time: 1757013989086
Received: from fr-int-smtpout11.hostinger.io ([UNAVAILABLE]. [148.222.54.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.102.90.229 (trex/7.1.3);
	Thu, 04 Sep 2025 19:26:29 +0000
Received: from [IPV6:2001:861:4448:6b00:1c5:245b:5c:a19] (unknown [IPv6:2001:861:4448:6b00:1c5:245b:5c:a19])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cHqGV1WD9z15Zj;
	Thu,  4 Sep 2025 19:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1757013986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gXWKLi7k8RrQ3dl+oKaYp4ZaIXaDcp/WKRbomMSLhEs=;
	b=Cf540A9U8jEEJnNygil95g4nCGaEvvjgnGJ6Sp6aWWoYlLwI41sbp3hIDBfdWBlsylBeNq
	FZ1uE3cxMgpq9bt2d2PpKvQfgY4LdRyNrteYFEPanWta2CLcIp+Zne1D2MnGVTGCLKoNsU
	qGqousvf8yqYGB4KgZlPVrx2W4Xp0EzjWsvNq9QpKk+deq/8j6KU9BgU7a0mt/bCgJD27S
	dFThNSdMeTOD8igwxTMgE+iCBzAYE2vBffmdA65OyzZEPCGlwsbJDlL0JDX5oO+oJUVd69
	y9XK0B6cfB8TJ/dpLFXhDMsYc3ICBWqJwwOgZqo4opRr28xwoYPO59v/Bw3z4Q==
Message-ID: <32bb2e07-7b0a-4822-b6c0-794bfda5c97d@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] kernel-hardening-checker:
 backport recipe
To: skandigraun@gmail.com
References: <20250819203929.1272607-1-michael.opdenacker@rootcommit.com>
 <1d47e8eb-0753-47e3-9339-b469f2f141f1@gmail.com>
 <e37ef122-48fa-4422-890b-22f9ad8e9d33@rootcommit.com>
 <698ff4df-4420-4f7d-a07c-bc022083ec5f@gmail.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <698ff4df-4420-4f7d-a07c-bc022083ec5f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu,  4 Sep 2025 19:26:26 +0000 (UTC)
X-CM-Envelope: MS4xfOo8bwLToCNsAcuLmLXtWkaODc681G4mqRe03PTk8fX3yQUFw22MSiLCkH4WyNheUDKYR6x/I+ivD+mDKWGr4T+v/0u35L/UiZ9MrlQNod3Y9RE2uzAE oDtaZkIa8Sh0HCnYcW/z68vNWqI8LQDrE6RI9cGwLxf+3QyHHGbByyryK8NJxsF7IuKxqylipDXzo64I/0bfULMmkgKlX7+sk4NZfv4hb1P3teDIVaV9UnUH HgbW1/HBfwpSvI08gs4qJrrXhtf5FXXWyWrpqOXJNUa3IkBxDSDFzz0URICWSlR7SamGKjWvakk8iF3X/+lX4vnhYQ/mo/lcXc/KqO8OWg2mklnyfeZjiqgE OYgPELxitU61eDO3m0usjkinQV+yG45rCp+1coP/83M6NBNreEQp7/pogeEOiAE13QskllY7
X-CM-Analysis: v=2.4 cv=DJTd4DNb c=1 sm=1 tr=0 ts=68b9e7e2 a=moH8wFLobXlosxT6PNuGGw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=d70CFdQeAAAA:8 a=RYqSDLjjAPyGnXIOvnYA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 19:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119295

Greetings.

On 8/20/25 10:28, Gyorgy Sarvari via lists.openembedded.org wrote:
>> However, this has already been accepted in master
>> (https://git.openembedded.org/meta-openembedded/commit/?id=5ae3536204ba3764b03647ab75169ee65ca43531)
>> It's true that meta-oe didn't originally have this recipe, but what's
>> the harm in sharing with LTS users that could have the same need as
>> mine? The risk of breaking tests again meta-oe?
> At the end of the day it's of course the branch maintainer's call if he
> accepts the extra recipe and the testing and maintenance tasks that come
> with it, but I don't recall it happening in recent years.
>
> I think it would make precedent - if this recipe is accepted, why
> wouldn't others be accepted? When does a small addition become an
> unacceptably risky or big one? Stability is boring - and that's the
> point. This of course is just the personal opinion of an internet rando
> (me), and not official in any shape or form.
>
>> I'm reading https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS
>> ... I guess such a backport qualifies as a "new feature". But does this
>> really apply to meta-openembedded which is not officially part of the LTS?
>>
>> On the other hand, mixin layers are supposed to be for "potentially
>> invasive changes", which is not the case here.
>> So, where are such (new) backports supposed to be shared?
> Such backports usually live in product specific layers (sometimes in
> other community layers that take up the task of acting like a mixin
> layer) until the project updates to a release that contains that recipe.

Any further objections to adding this backport to the scarthgap branch 
of meta-oe?

I guess there is no risk of breaking anything else in meta-oe/scarthgap, 
but if we don't want to accept exceptions to the rule (even for meta-oe 
which is not strictly part of the LTS), I'll create my own layer for LTS 
users who could be interested. I guess meta-security won't be a suitable 
candidate the upstream recipe is in meta-oe.

Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


