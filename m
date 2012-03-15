Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1S8EBp-0000Wx-BH
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 18:10:13 +0100
Received: from cpc9-live20-0-0-cust612.know.cable.virginmedia.com
	([82.42.142.101] helo=[127.0.0.1])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1S8E32-0007o1-7D
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 17:01:08 +0000
Message-ID: <4F622053.50202@dynamicdevices.co.uk>
Date: Thu, 15 Mar 2012 17:01:07 +0000
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F610B38.5060309@dynamicdevices.co.uk>
	<CAP9ODKo_RMjJ1BsP9QQHJY8xwmRzBie3L0DuB1e7jr=N_kuekQ@mail.gmail.com>
	<4F6219FC.7010506@dynamicdevices.co.uk>
	<CAP9ODKrpf0tSGb5e8whj05JUtzjZTkbJMcD2C4TH3YUgJ1pQDg@mail.gmail.com>
In-Reply-To: <CAP9ODKrpf0tSGb5e8whj05JUtzjZTkbJMcD2C4TH3YUgJ1pQDg@mail.gmail.com>
Subject: Re: oe-core layer including support for i.MX28
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
X-List-Received-Date: Thu, 15 Mar 2012 17:10:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

>However, you should be able to base your work on that and keep doing rebases against this branch

Will do.

What's the view/policy on adding custom board implementations into these 
layers?

e.g. I'm about to start taking a look at an i.MX51 based screen unit. 
Various machine parameters are different including SDRAM settings, so 
I'll probably end up with a new machine, imx51gem or some such, much as 
I did with my imx28evk based "gem" in oe-classic.

Is the the new machine target and associated recipes, kernel+patches 
something that I should expect to be able to merge back into 
meta-fsl-arm at some point?

Thanks / Best Regards,

Alex

On 15/03/2012 16:53, Otavio Salvador wrote:
> On Thu, Mar 15, 2012 at 13:34, Alex J Lennon
> <ajlennon@dynamicdevices.co.uk>  wrote:
>>> I am working on that; my current work in progress can be seen at
>>> https://github.com/OSSystems/meta-fsl-arm
>> Thanks for that. I had a quick go ad building and as you say I saw bitbake
>> fails as it's trying to build up a patched linux-imx kernel.
>>
>> "include/linux/pagemap.h: In function 'fault_in_pages_readable':"
> I fixed the branch right now and you ought to be able to build using it.
>
>> Maybe the best way for me to proceed would be to put in a pull request on
>> your wip-imx28 branch and see if I can add my oe-classic imx28 specifics
>> into the copy?
> I'll do the pull request but only after I get it properly done.
> There're some missing things on it and some work to be done. However,
> you should be able to base your work on that and keep doing rebases
> against this branch (be prepared to fix some conflicts on the way).
>



