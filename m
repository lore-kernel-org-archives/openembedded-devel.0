Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OuEvD-0001wL-Rz for openembedded-devel@lists.openembedded.org;
	Sat, 11 Sep 2010 03:30:28 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OuEuU-00007r-Gb for openembedded-devel@lists.openembedded.org;
	Sat, 11 Sep 2010 03:29:42 +0200
Received: from s207-6-220-230.bc.hsia.telus.net ([207.6.220.230])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Sep 2010 03:29:42 +0200
Received: from dfoley by s207-6-220-230.bc.hsia.telus.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Sep 2010 03:29:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Dallas Foley <dfoley@techsol.ca>
Date: Fri, 10 Sep 2010 18:29:30 -0700
Message-ID: <4C8ADB7A.4000303@techsol.ca>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>	<i6629i$d5c$1@dough.gmane.org>	<201009081609.32135.pieterg@gmx.com>
	<4C879EC5.10402@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s207-6-220-230.bc.hsia.telus.net
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.8) Gecko/20100802 Thunderbird/3.1.2
In-Reply-To: <4C879EC5.10402@balister.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Sat, 11 Sep 2010 01:30:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10-09-08 07:33 AM, Philip Balister wrote:
> On 09/08/2010 10:09 AM, pieterg wrote:
>> On Tuesday 07 September 2010 21:03:14 Koen Kooi wrote:
>>> On 07-09-10 18:18, Khem Raj wrote:
>>>> On Tue, Sep 7, 2010 at 5:52 AM, Koen Kooi<k.kooi@student.utwente.nl>
>> wrote:
>>>>> it happens when you build 'gcc' after 'gcc-cross', gcc will doesn't
>>>>> create a libstdc6++ package, but it does create a libstdc-dev package.
>>>>
>>>> I see thats plausible. I think its time to look into separating gcc
>>>> runtime from gcc on the lines of poky.
>>>
>>> I put back libgcc and libstdc++ for the time being:
>>>
>>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=241b8865f20
>>> b9e3c3beb334535e6cd8452cbf47d
>>>
>>> I have a feeling the others needs to put back as well (e.g. fortran),
>>> but this fixes the immediate problem.
>>
>> Not for me, after a clean build today packages are still missing libstdc++
>> in their deps (and as a result the images are still missing libstdc++).
>> So there must be more to it.
>
> Does anyone have any idea what commit caused this breakage? It is causing a lot
> of problems for people.
>
> Philip

With git bisect I get commit d2a283ad002660e46b2f8d40a8ddfabad457d8a4 that 
causes libstdc++ to not get included.





