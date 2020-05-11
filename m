Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web12.13207.1589207558362654535
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2020 07:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==4003dd60f2f==cbing@cybernetics.com)
X-ASG-Debug-ID: 1589207496-0fb3b0649e755330001-aWHRdb
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id 9MEGGRSrO3P6JuCt for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2020 10:31:36 -0400 (EDT)
X-Barracuda-Envelope-From: cbing@cybernetics.com
X-ASG-Whitelist: Client
Received: from [10.157.1.18] (HELO [192.168.184.100])
  by cybernetics.com (CommuniGate Pro SMTP 5.1.14)
  with ESMTP id 9950972 for openembedded-devel@lists.openembedded.org; Mon, 11 May 2020 10:31:36 -0400
Subject: Re: [oe] [meta-oe][PATCH] php: fix opcache link error in 7.4
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] [meta-oe][PATCH] php: fix opcache link error in 7.4
References: <20200507142806.48643a47@cy-rd-cb>
 <20200508105610.GA8452@localhost>
 <090c0075-c785-e3fd-1da4-c56518a64c0c@cybernetics.com>
 <20200508184129.GA7248@localhost>
 <b2a74e1d-32f1-56f2-934c-58d2a6d25f64@cybernetics.com>
 <CAGDS+nmf3gjj6Nsp0+dRn-B=TXDF5tYOa2zN-MN-9s9ZNAJn6Q@mail.gmail.com>
From: "Claude Bing" <cbing@cybernetics.com>
Message-ID: <96e159d5-dd18-37cf-8dba-65ef4474e2f9@cybernetics.com>
Date: Mon, 11 May 2020 10:32:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAGDS+nmf3gjj6Nsp0+dRn-B=TXDF5tYOa2zN-MN-9s9ZNAJn6Q@mail.gmail.com>
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1589207496
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Barracuda-Scan-Msg-Size: 3073
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The patch is already present in master, so I opted to send a patch
rebased for dunfell.  If there are any issues, please let me know.

Regards,

Claude Bing

On 5/9/20 2:54 PM, Steve Sakoman wrote:
> Hi Claude,
> 
> On Fri, May 8, 2020 at 11:26 AM Claude Bing <cbing@cybernetics.com> wrote:
>>
>> OK, I started a new patch thread.  Who/what determines which patches get
>> included in the named release branches?  Specifically, we are using
>> dunfell and would like these changes to show up in that branch.
> 
> Just submit a patch to this list tagged with [dunfell].  In general
> though I won't take a patch unless it is already in master, so a patch
> for both master and dunfell should be tagged with [master][dunfell]
> 
> If the issue is already fixed in master with a version bump, and a
> version bump in dunfell would be too dangerous (i.e. feature changes)
> then I'll take a patch to the current version in dunfell.  Again, tag
> it with [dunfell] and also mention the commit in master that fixes the
> issue.
> 
> Thanks,
> 
> Steve
> 
>>
>> :)
>>
>> Regards,
>>
>> Claude Bing
>>
>> On 5/8/20 2:41 PM, Adrian Bunk wrote:
>>> On Fri, May 08, 2020 at 10:42:22AM -0400, Claude Bing wrote:
>>>> On 5/8/20 6:56 AM, Adrian Bunk wrote:
>>>>> On Thu, May 07, 2020 at 02:28:06PM -0400, Claude Bing wrote:
>>>>>> Explicitly specifying -lrt is required for opcache to be linked against
>>>>>> the proper dependencies.  Additionally, PHP disables libdl when it
>>>>>> detects a cross-compilation environment for some reason.  In order to
>>>>>> load any type of extension, re-enabling libdl is required.
>>>>>> ...
>>>>>> +# link against librt (libc) if opcache is specified in order to avoid the
>>>>>> +# following error:
>>>>>> +# Failed loading /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: undefined symbol: shm_unlink
>>>>>> +LDFLAGS += "${@ " -lrt " if bb.utils.contains('PACKAGECONFIG', 'opcache', 'true', 'false', d) else "" }"
>>>>>
>>>>> Is this actually a bug in 0001-opcache-config.m4-enable-opcache.patch
>>>>> and should instead be fixed there?
>>>>
>>>> Yes, that does indeed fix the problem.  Would you like me to reply to
>>>> this thread with a new patch, or create a different thread?
>>>> ...
>>>
>>> Your original patch is already in master, please submit a new patch in a
>>> different thread that removes this workaround from php_7.4.4.bb and
>>> fixes 0001-opcache-config.m4-enable-opcache.patch.
>>>
>>> Thanks
>>> Adrian
>>>
>>>
>>>
>>>
>>
>>
>> 
