Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EDCC433EF
	for <webhook@archiver.kernel.org>; Sun, 24 Oct 2021 19:10:55 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.22454.1635102654049834536
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Oct 2021 12:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from [::1] (port=48076 helo=cpanel8.indieserve.net)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1meitQ-0005mv-47
	for openembedded-devel@lists.openembedded.org;
 Sun, 24 Oct 2021 15:10:52 -0400
Received: from [19.12.93.167] ([19.12.93.167]) by crashcourse.ca (Horde
 Framework) with HTTPS; Sun, 24 Oct 2021 15:10:51 -0400
Date: Sun, 24 Oct 2021 15:10:51 -0400
Message-ID: <20211024151051.Horde.tMYuf-oR0Ly0t9EJstyJ3EW@crashcourse.ca>
From: rpjday@crashcourse.ca
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] should "ntp-dev" package have header files in it, or not?
References: <20eeedea-efe-555c-acd2-2f89fd879d2@crashcourse.ca>
 <CAMKF1sq45WMvPcdx527KWTYkUkxa+yS+T+4aES3nvrS6JvDJBQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq45WMvPcdx527KWTYkUkxa+yS+T+4aES3nvrS6JvDJBQ@mail.gmail.com>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Oct 2021 19:10:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93557


Quoting Khem Raj <raj.khem@gmail.com>:

> On Sun, Oct 24, 2021 at 5:51 AM Robert P. J. Day  
> <rpjday@crashcourse.ca> wrote:
>>
>>
>>   colleague recently asked me how to get access to one or more header
>> files associated with "ntp", so he could:
>>
>>   #include <ntp.h>
>>
>> from some other code. casually, i suggested the standard way was to
>> add ntp to his recipe's DEPENDS, but that didn't do it, so i built ntp
>> in my own aarch64 project, then took a look under packages-split to
>> see what got packaged in ntp-dev, and was puzzled to see it was
>> absolutely empty.
>>
>>   is this deliberate? are other recipes not entitled to ntp's header
>> files? am i overlooking something?
>
> While the header seems to be meant for public consumption, the build
> explicitly does
> not export it, so perhaps thats not expected to be used this way anymore.

   i popped over to https://github.com/ntp-project/ntp to see if the README
would clarify anything, and the docs say of the include/ directory:

"Directory containing include header files used by most programs
in the distribution."

   "in the distribution." so does that mean that nothing external
is expected to use them? still unsure as to what to tell other
developers as to whether they are entitled to include any of
those headers, no matter how they do it.

rday


