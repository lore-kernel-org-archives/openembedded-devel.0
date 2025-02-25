Return-Path: <ts@ferncast.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F445C021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 09:24:50 +0000 (UTC)
Received: from smtprelay04.ispgateway.de (smtprelay04.ispgateway.de [80.67.29.8])
 by mx.groups.io with SMTP id smtpd.web10.4297.1740475480233650897
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 01:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: ferncast.de, ip: 80.67.29.8, mailfrom: ts@ferncast.de)
Received: from [81.173.161.10] (helo=[192.168.178.67])
	by smtprelay04.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98)
	(envelope-from <ts@ferncast.de>)
	id 1tmrB1-000000004wT-33ME;
	Tue, 25 Feb 2025 10:24:33 +0100
Message-ID: <7258a928-31f9-43ec-af76-26af4e331bd5@ferncast.de>
Date: Tue, 25 Feb 2025 10:24:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] capnproto: remove binaries from
 target-build, add bbclass
To: skandigraun@gmail.com, openembedded-devel@lists.openembedded.org
References: <1820B183AA0ABC96.15786@lists.openembedded.org>
 <b74c1960-4f13-4758-8a80-22f025577c79@gmail.com>
Content-Language: en-US, de-DE
From: Thomas Schlien <ts@ferncast.de>
In-Reply-To: <b74c1960-4f13-4758-8a80-22f025577c79@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Df-Sender: dHNAZmVybmNhc3QuZGU=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 09:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115565

Hi,

we actually stumbled upon this issue because the patch also removes the 
binaries from the native package. As a result, our software—which 
requires the native binaries for compilation—no longer builds. I had to add

SRC_URI:remove = "file://0001-Don-t-check-usr-bin-content-from-cmake.patch"

to a capnproto_%.bbappend in our layer to get it working again.

One could also imagine use cases where having the capnp tools available 
on the target system would be beneficial. Therefore, I believe that not 
installing the binaries in the target package should be configurable.

Best regards,
Thomas

On 03.02.25 13:11, Gyorgy Sarvari via lists.openembedded.org wrote:
> While looking into Ross' feedback about the first version, I realized 
> that my
> sed regex didn't only have superficial problems (namely being an 
> eyesore, and
> likely brittle), but it also only solved a part of the problem - it 
> allowed to
> link to the cross-compiled libs, but code-generation during class-target
> compilation from capnproto definitions was still broken.
>
> This patch supposed to remediate this too.
>
> If you think that having a new class is overcomplicating the issue, I 
> can be easily
> convinced about it (but please leave an alternative suggestion also).
>
> There is 1 known caveat however: if someone would want to install the 
> binaries
> from ${bindir} on the target machine, that won't work after this 
> change. (Can't
> really think of any reasons however, why would one do that - this is 
> not a user-application.)
>
> Let me know if there's anything you'd like to change in this patch.
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115239): https://lists.openembedded.org/g/openembedded-devel/message/115239
> Mute This Topic: https://lists.openembedded.org/mt/110969312/8357607
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ts@ferncast.de]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
Dr.-Ing. Thomas Schlien
Ferncast GmbH
Gallierstr. 41a, 52074 Aachen
Germany

Phone: +49 241 99034567
Web:   www.ferncast.de
--
CEO: Detlef Wiese
Court of Registration: Amtsgericht Aachen
Commercial Register: HRB 22350


