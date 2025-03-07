Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6D7C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 18:38:31 +0000 (UTC)
Received: from smtp4.emailarray.com (smtp4.emailarray.com [65.39.216.22])
 by mx.groups.io with SMTP id smtpd.web11.18602.1741372705366626961
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 10:38:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: balister.org, ip: 65.39.216.22, mailfrom: philip@balister.org)
Received: (qmail 90654 invoked by uid 89); 7 Mar 2025 18:38:20 -0000
X-Orig-Sender: philip@balister.org
Received: from unknown (HELO ?10.50.11.14?) (cGhpbGlwQGJhbGlzdGVyLm9yZ0A2OS43LjEyMy4xNDY=) (POLARISLOCAL)  
  by smtp4.emailarray.com with SMTP; 7 Mar 2025 18:38:20 -0000
Message-ID: <17fde519-38d7-4c44-8592-a0ff6efd56fe@balister.org>
Date: Fri, 7 Mar 2025 11:38:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python] python3-scipy
To: rob.woolleywr@gmail.com, openembedded-devel@lists.openembedded.org
References: <CAGAhMBz9zz0K8Fnj__NkEVvbsD8SibEs=BKR8YFE9mv+mG6tsw@mail.gmail.com>
Content-Language: en-US
From: Philip Balister <philip@balister.org>
In-Reply-To: <CAGAhMBz9zz0K8Fnj__NkEVvbsD8SibEs=BKR8YFE9mv+mG6tsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 18:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115797

On 3/6/25 1:07 PM, Rob Woolley via lists.openembedded.org wrote:
> The meta-scipy layer was archived on Nov 30, 2023 (https://github.com/ 
> tuxable-ltd/meta-scipy <https://github.com/tuxable-ltd/meta-scipy>)
> 
> I need python3-scipy for some recipes in ROS 2 (notably pinocchio), so I 
> patched it up and got it building again: https://github.com/robwoolley/ 
> meta-scipy <https://github.com/robwoolley/meta-scipy>
> 
> I don't know the history behind why it was in a separate layer.  Would 
> it be worth submitting to meta-python instead of resurrecting the meta- 
> scipy layer?

I want to say because scipy needs fortran and that is not built by 
default. So world builds woul dneed to skip scipy unless fortran was 
enabled.

Does this sound right?

Philip

> 
> Regards,
> Rob
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115775): https://lists.openembedded.org/g/openembedded-devel/message/115775
> Mute This Topic: https://lists.openembedded.org/mt/111555507/384425
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [philip@balister.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


