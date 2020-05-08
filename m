Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web11.1526.1588973204978088372
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 14:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==397780a3020==cbing@cybernetics.com)
X-ASG-Debug-ID: 1588973201-0fb3b0649e6ac7e0001-aWHRdb
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id 9lZu2iJGFTb7BvS5 for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2020 17:26:41 -0400 (EDT)
X-Barracuda-Envelope-From: cbing@cybernetics.com
X-ASG-Whitelist: Client
Received: from [10.157.1.18] (HELO [192.168.184.100])
  by cybernetics.com (CommuniGate Pro SMTP 5.1.14)
  with ESMTP id 9949201 for openembedded-devel@lists.openembedded.org; Fri, 08 May 2020 17:26:41 -0400
Subject: Re: [oe] [meta-oe][PATCH] php: fix opcache link error in 7.4
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] [meta-oe][PATCH] php: fix opcache link error in 7.4
References: <20200507142806.48643a47@cy-rd-cb>
 <20200508105610.GA8452@localhost>
 <090c0075-c785-e3fd-1da4-c56518a64c0c@cybernetics.com>
 <20200508184129.GA7248@localhost>
From: "Claude Bing" <cbing@cybernetics.com>
Message-ID: <b2a74e1d-32f1-56f2-934c-58d2a6d25f64@cybernetics.com>
Date: Fri, 8 May 2020 17:27:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508184129.GA7248@localhost>
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1588973201
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 2111
X-Barracuda-BRTS-Status: 1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

OK, I started a new patch thread.  Who/what determines which patches get
included in the named release branches?  Specifically, we are using
dunfell and would like these changes to show up in that branch.

:)

Regards,

Claude Bing

On 5/8/20 2:41 PM, Adrian Bunk wrote:
> On Fri, May 08, 2020 at 10:42:22AM -0400, Claude Bing wrote:
>> On 5/8/20 6:56 AM, Adrian Bunk wrote:
>>> On Thu, May 07, 2020 at 02:28:06PM -0400, Claude Bing wrote:
>>>> Explicitly specifying -lrt is required for opcache to be linked against
>>>> the proper dependencies.  Additionally, PHP disables libdl when it
>>>> detects a cross-compilation environment for some reason.  In order to
>>>> load any type of extension, re-enabling libdl is required.
>>>> ...
>>>> +# link against librt (libc) if opcache is specified in order to avoid the
>>>> +# following error:
>>>> +# Failed loading /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: undefined symbol: shm_unlink
>>>> +LDFLAGS += "${@ " -lrt " if bb.utils.contains('PACKAGECONFIG', 'opcache', 'true', 'false', d) else "" }"
>>>
>>> Is this actually a bug in 0001-opcache-config.m4-enable-opcache.patch
>>> and should instead be fixed there?
>>
>> Yes, that does indeed fix the problem.  Would you like me to reply to
>> this thread with a new patch, or create a different thread?
>> ...
> 
> Your original patch is already in master, please submit a new patch in a 
> different thread that removes this workaround from php_7.4.4.bb and 
> fixes 0001-opcache-config.m4-enable-opcache.patch.
> 
> Thanks
> Adrian
> 
> 
> 
> 
