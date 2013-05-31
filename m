Return-Path: <Xufeng.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 97D8760655
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 08:56:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4V8uJ7d027262
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2013 01:56:19 -0700 (PDT)
Received: from [128.224.163.210] (128.224.163.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 31 May 2013 01:56:19 -0700
Message-ID: <51A86887.1050601@windriver.com>
Date: Fri, 31 May 2013 17:08:23 +0800
From: Xufeng Zhang <xufeng.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100512 Thunderbird/3.0.5 ThunderBrowse/3.3.5
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1369981125-9597-1-git-send-email-xufeng.zhang@windriver.com>
	<1704407.SDREl8D59z@helios>
In-Reply-To: <1704407.SDREl8D59z@helios>
Cc: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <joe.macdonald@windriver.com>
Subject: Re: [OE-devel] [PATCH] ntp: Resolve some abnormal behaviors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 May 2013 08:56:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2013 04:34 PM, Paul Eggleton wrote:
> On Friday 31 May 2013 14:18:45 Xufeng Zhang wrote:
>    
>> The main changes include:
>> 1). Add ntp:ntp(user:group) to system.
>> 2). Running ntpd dameon as ntp:ntp.
>>      
>    
>> 3). Move relevant files from /usr/bin to /usr/sbin.
>>      
>    
Thanks for your review, Paul!

> I'm not sure but I think the way this has been done (--with-binsubdir=sbin) is
> going to bypass the ability to set sbindir in the distro config. If that's the
> case then I don't think this is a good change, although I appreciate having
> ntpd in /usr/sbin by default would be more appropriate.
>    
But currently it's the proper and easy way to do that, right?
I can think out any better way to do the same job.

>    
>> 4). Add crypto support.
>>      
> The support is already there, it's just off by default and that was
> intentional. Those that need this can easily enable it in their distro config.
>    
I'm not sure why we do that intentional, but shouldn't the package run
as secure as possible by default?


Thanks,
Xufeng

> Cheers,
> Paul
>
>    


