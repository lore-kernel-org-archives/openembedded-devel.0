Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PInuL-0006Yl-NX
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 20:43:06 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PIntG-00064R-2i from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 11:41:58 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 17 Nov 2010 11:41:57 -0800
Received: from [172.30.7.13] ([172.30.7.13]) by na2-mail.mgc.mentorg.com with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 17 Nov 2010 12:41:55 -0700
Message-ID: <4CE42FF0.1000702@mentor.com>
Date: Wed, 17 Nov 2010 12:41:36 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE3D70F.2000101@gmail.com>	<AANLkTin0i5rSxwA8Q3+jN7tLR-Rn3JEei6D==1CjKOh9@mail.gmail.com>	<4CE3EF4C.2050105@gmail.com>
	<AANLkTin2v1+3UP_rk593i+V4=e4QeKgPinAkoWNwY0BO@mail.gmail.com>
In-Reply-To: <AANLkTin2v1+3UP_rk593i+V4=e4QeKgPinAkoWNwY0BO@mail.gmail.com>
X-OriginalArrivalTime: 17 Nov 2010 19:41:55.0246 (UTC)
	FILETIME=[7D65CCE0:01CB868F]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Error: git was compiled without libcurl support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Nov 2010 19:43:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2010 12:30 PM, Khem Raj wrote:
> On Wed, Nov 17, 2010 at 7:05 AM, Marco Cavallini<koansoftware@gmail.com>  wrote:
>> Frans Meulenbroeks ha scritto, Il 17/11/2010 15:01:
>>> 2010/11/17 Marco Cavallini<koansoftware@gmail.com>:
>>>> Hi, I just tried installing OE retrieving it from git
>>>> git clone git://git.openembedded.org/openembedded
>>>>
>>>> bitbake version 1.10.0
>>>> branch master
>>>> MACHINE=akita time bitbake minimal-image
>>>> DISTRO = "angstrom-2008.1"
>>>> host machine : Debian lenny x86_64-linux
>>>>
>>>> I face to an unexpected error
>>>> "Error: git was compiled without libcurl support"
>>>>
>>>> I successfully built it until November 2nd but since last Saturday I
>>>> wonder if it should build or if is normal this behavoiur.
>>>> log: http://paste.ubuntu.com/533450/
>>>>
>>>
>>> you're using git from the host, guess that got changed one way or another.
>>>
>>
>> Frans,
>> thank you for answering.
>>
>> I tried removing ASSUME_PROVIDED git-native from my config (local.conf)
>> in this case bitbake create git and use it instead of the host provided.
>> Then I did
>>
>>   bitbake -b git-native
>>
>> Anyway there are errors again
>> http://tinderbox.openembedded.net/packages/985559/
>>
> can you post your local.conf and additionally what version of autoconf
> is installed on your build host.

On IRC we confirm that debian/lenny (on 64bit) has a git bug atm.

-- 
Tom Rini
Mentor Graphics Corporation


