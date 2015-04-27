Return-Path: <ajlennon@dynamicdevices.co.uk>
X-Greylist: delayed 312 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 27 Apr 2015 10:59:01 UTC
Received: from www.dynamicdevices.co.uk (www.dynamicdevices.co.uk
	[89.200.136.37])
	by mail.openembedded.org (Postfix) with ESMTP id 9587765CAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 10:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by www.dynamicdevices.co.uk (Postfix) with ESMTP id E1E6E27E240;
	Mon, 27 Apr 2015 10:53:48 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at lennoab2.miniserver.com
Received: from www.dynamicdevices.co.uk ([127.0.0.1])
	by localhost (www.dynamicdevices.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TwtyxrQXZx2r; Mon, 27 Apr 2015 10:53:46 +0000 (UTC)
Received: from [192.168.1.16] (AMarseille-651-1-40-127.w92-150.abo.wanadoo.fr
	[92.150.31.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by www.dynamicdevices.co.uk (Postfix) with ESMTPSA id 5D7D027E224;
	Mon, 27 Apr 2015 10:53:43 +0000 (UTC)
Message-ID: <553E152F.6090601@dynamicdevices.co.uk>
Date: Mon, 27 Apr 2015 12:53:35 +0200
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
References: <1427045315-13142-1-git-send-email-raj.khem@gmail.com>	<CAP9ODKp=x2GpWVZLB1kf2CjZpMCuBfGZxYuOAQRUsx-D+uRiVw@mail.gmail.com>	<CAMKF1sqm5ARrWih-TgnzFXgEGXR97o=iUU_xR-fvp_bLC=SyEQ@mail.gmail.com>	<CAP9ODKoFdepGX7OZu8XxMQVr-ssUCG_Ndyyj6GROOACViiMhEw@mail.gmail.com>	<8A51FBCF-FD07-4A7A-9829-14964E58A121@gmail.com>	<CAP9ODKqL1d447vjyEv6wQvJzS_uz1wFFmgOOjh+MKv83xsjTkg@mail.gmail.com>	<CAMKF1sqf=txyROy9rQ0qyPgD5iM+YV358X3-Z3kVmCrg1t+U+w@mail.gmail.com>
	<CAP9ODKrrABT39MyQUYqnZY3BRkvM_amzV8mjaVQRwMvhpQGtuw@mail.gmail.com>
In-Reply-To: <CAP9ODKrrABT39MyQUYqnZY3BRkvM_amzV8mjaVQRwMvhpQGtuw@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: meta-browser][PATCH V2] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Mon, 27 Apr 2015 10:59:02 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 24/03/2015 19:58, Otavio Salvador wrote:
> On Tue, Mar 24, 2015 at 3:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mar 24, 2015 9:36 AM, "Otavio Salvador" <otavio@ossystems.com.br>
wrote:
>>>
>>> On Tue, Mar 24, 2015 at 12:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>>> On Mar 24, 2015, at 4:56 AM, Otavio Salvador <otavio@ossystems.com.br>
>> wrote:
>>>>>
>>>>>
>>>>> I'd prefer to do it once and avoid adding another recipe and handle
>>>>> same problems we had solved there. Also this allows for example the
>>>>> use of i.MX patches on meta-fsl-arm.
>>>>
>>>> My usecase is not i.MX moreover I do not have i.MX h/w to test as well,
>> current set work fine for the architectures I need it for, if someone
wants
>> to help in testing on other machines, its welcome. however as I said, it
>> will be in subsequent work to unite both recipes due to the overhead as
>> explained in last email.
>>>
>>> I am not asking you to test cef3 on i.MX, this is fine. I don't want
>>> another giant build recipe with duplication.
>>
>> I am aware of that. This let's other folks hands on it with a working
>> version. Moving cef to latest chromium is a bigger exercise and will
delay
>> this. That's the motivation.
>
> Reuse chromium.inc file for this, so we at least avoid recipe
> duplication? If you have a good reason to avoid it I am fine but I
> certainly prefer reuse here.
>

Hi - thanks for the initial cef3 recipe. I've been taking a look at this
with a view to a cef3 recipe based on chromium.inc that I can use to
build for i.MX6 (the original recipe was failing to build for me)

I have this building now and was able to run cefsimple on i.MX6 although
I am unsure whether it's correctly using hardware acceleration and I
think it needs more work / cleanups.

I wish to use cefglue to wrap a Mono WebBrowser control around CEF3 and
there are a set of standard Chromium builds it supports to this end.

I can build Chromium 39.0.2171.95 and the current 40.0.2214.91 recipe
but when I go to 41.0.2272.104 which is supported by one of the newer
cefglue releases I get an error of this form:

| In file included from ../../v8/src/base/sys-info.cc:19:0:
| /usr/include/c++/4.8/limits:42:28: fatal error: bits/c++config.h: No
such file or directory
|  #include <bits/c++config.h>
|                             ^
| compilation terminated.
| ninja: build stopped: subcommand failed.

I'm using a fairly vanilla x64 Ubuntu 14.04.2 LTS. It looks like some
kind of paths/sysroot issue with the host compiler settings. I see
googling that others have had similar issues with x64 hosts  but I can't
quite work out what to do.

Can anybody advise?

Thanks,

Alex

