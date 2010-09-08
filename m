Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OtLjF-0002Ut-4h
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 16:34:26 +0200
Received: (qmail 8333 invoked by uid 1003); 8 Sep 2010 14:33:42 -0000
Received: from pool-96-240-180-126.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.126)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	8 Sep 2010 14:33:42 -0000
Message-ID: <4C879EC5.10402@balister.org>
Date: Wed, 08 Sep 2010 10:33:41 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.8) Gecko/20100806 Fedora/3.1.2-1.fc13 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>	<i6629i$d5c$1@dough.gmane.org>
	<201009081609.32135.pieterg@gmx.com>
In-Reply-To: <201009081609.32135.pieterg@gmx.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Wed, 08 Sep 2010 14:34:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/08/2010 10:09 AM, pieterg wrote:
> On Tuesday 07 September 2010 21:03:14 Koen Kooi wrote:
>> On 07-09-10 18:18, Khem Raj wrote:
>>> On Tue, Sep 7, 2010 at 5:52 AM, Koen Kooi<k.kooi@student.utwente.nl>
> wrote:
>>>> it happens when you build 'gcc' after 'gcc-cross', gcc will doesn't
>>>> create a libstdc6++ package, but it does create a libstdc-dev package.
>>>
>>> I see thats plausible. I think its time to look into separating gcc
>>> runtime from gcc on the lines of poky.
>>
>> I put back libgcc and libstdc++ for the time being:
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=241b8865f20
>> b9e3c3beb334535e6cd8452cbf47d
>>
>> I have a feeling the others needs to put back as well (e.g. fortran),
>> but this fixes the immediate problem.
>
> Not for me, after a clean build today packages are still missing libstdc++
> in their deps (and as a result the images are still missing libstdc++).
> So there must be more to it.

Does anyone have any idea what commit caused this breakage? It is 
causing a lot of problems for people.

Philip


