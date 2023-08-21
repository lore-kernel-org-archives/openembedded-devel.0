Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F763EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 19:32:54 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.113.1692646370277054774
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Aug 2023 12:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 37LJWnGe005915
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 14:32:49 -0500
Message-ID: <0e8818ab-ca4e-796a-3956-3677a42c631c@kernel.crashing.org>
Date: Mon, 21 Aug 2023 14:32:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: openembedded-devel@lists.openembedded.org
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: [meta-oe] kconfig-frontends recipe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 19:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104513

I was trying to build the kconfig-frontends recipe locally the other day and ran 
into a problem where it reported unsafe "/usr/include" path.

This seems to have been triggered because I actually had a /usr/include/ncursesw 
on one of my host systems.  Other systems I had didn't have this directory and 
no issue was reported.


I tracked this down to

https://gitlab.com/ymorin/kconfig-frontends/-/blob/master/configure.ac?ref_type=heads#L349

Lines 349 and 350.  I changed to them to
'-I=...' in both cases and it appears to have solved the problem I was having.


Has anyone else seen this issue, and is my possible fix above reasonable in this 
case?  If so I'll generate a patch to do just that and send it to the list.

--Mark

