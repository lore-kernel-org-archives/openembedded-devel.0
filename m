Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13B0C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 16:38:35 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.16196.1707842314595100664
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Feb 2024 08:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 41DGcXR3011551
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 10:38:33 -0600
Message-ID: <7fffaa90-0e3c-4f71-a385-e6248df3b27f@kernel.crashing.org>
Date: Tue, 13 Feb 2024 10:38:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: opencv - python3-opencv not building properly
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 16:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108729

With master as of yesterday (February 12, 2024), the python3-opencv package is 
not building.  There is no error during the build of the opencv recipe, but the 
package itself never builds.

During the do_configure step there is a non-fatal error generated:

-- Found PythonInterp: .../opencv/4.9.0/recipe-sysroot-native/usr/bin/python3 
(found suitable version "3.12.1", minimum required is "3.2")
-- Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUDE_DIRS) 
(Required is at least version "3.12")

I've been unable to figure out what is causing the failure.  Was hoping someone 
else might be able to figure this out or provide a clue to be able to figure out 
what Cmake is trying to do that it can't.

