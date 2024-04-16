Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80364C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 22:13:06 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.34596.1713305579620769422
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 15:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 43GMCwHf013582
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 17:12:58 -0500
Received: from [192.168.3.155] ([192.168.3.155])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 43GMCvt5013441
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 17:12:58 -0500
Message-ID: <0c3ae56b-b5f8-4371-a0ac-c1f1444264df@kernel.crashing.org>
Date: Tue, 16 Apr 2024 17:12:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: [meta-python] obsolete distutils3-base.bbclass error
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 22:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109986

In scarthgap/master, I still have a couple of recipes that haven't been moved to 
using the proper setuptools3-base class yet.  However, including distutils3-base 
fails.

The code meta-python/classes/distutils3-base.bbclass is missing the close "}".

--Mark

