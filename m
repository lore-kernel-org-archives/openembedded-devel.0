Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OmnFZ-0008Bv-7J
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 14:32:43 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 0427D1660A06; Sat, 21 Aug 2010 06:32:03 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 22A8F1660A0D;
	Sat, 21 Aug 2010 06:31:30 -0600 (MDT)
Message-ID: <4C6FC722.9060002@mlbassoc.com>
Date: Sat, 21 Aug 2010 06:31:30 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTiknntyGcs6gdHDx84J8m7QufqZ8CPVs4nF5urD7@mail.gmail.com>
	<AANLkTinzw_8N9fu5bpuT17zcjffqWJ3ZH9rLK1cA-yG9@mail.gmail.com>
In-Reply-To: <AANLkTinzw_8N9fu5bpuT17zcjffqWJ3ZH9rLK1cA-yG9@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE stable, testing, dev (was Re: What to do about the poor bitbake Quality Control?)
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
X-List-Received-Date: Sat, 21 Aug 2010 12:32:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2010 12:26 AM, Frans Meulenbroeks wrote:
> 2010/8/18 Cliff Brake<cliff.brake@gmail.com>:
>> On Wed, Aug 18, 2010 at 4:30 AM, Martyn Welch<martyn.welch@ge.com>  wrote:
>>> On 17/08/10 16:02, Cliff Brake wrote:
>>>>
>>>> I think it would be very useful to have a "stable" branch that is only
>>>> synchronised with dev when X number of targets build from a clean
>>>> build.  It seems like this would be high value, with little effort.
>>>> Of course there will be corner things that break, but at least a new
>>>> beagleboard user can check out something and have reasonable
>>>> confidence that it will build images.
>>>>
>>>> Does anyone have suggestions for the branch name and a reasonable
>>>> subset of machines and build targets?  Perhaps someone is already
>>>> running these clean builds?  At one point we had a machine at OSUOSL
>>>> dedicated to this purpose, but no one ever set it up.
>>>>
>>>
>>> So something like Debian's stable, testing and unstable[1]?
>>
>> That sounds good to me -- so how about org.openembedded.dev and
>> org.openembedded.testing branches?
>
> Good plan!
>
>>
>> I'll plan to start doing a clean build of dev every Monday for the
>> Beagleboard, and then merge to testing once it builds.  Initial
>> targets:
>
> Cool!
>>
>> Angstrom Distro
>> beagleboard/beagleboard-linuxtag2010-demo-image
>> x86/minimal-image
>
> It would be nice to have some additional distro's (e.g. minimal, shr)
> and machines (what would be a good coverage here) tested before it is
> pushed
>>
>> My workstation runs a 64-bit OS, so that is probably worst case
>> (compared to i686).
>>
> What OS? If you want to make things really nasty go to RHEL4 (but I
> think most people would be fine with e.g. ubuntu 10.04)
> Ideally you'd do this in a clean vm to make sure that there is no
> dependency on whatever happens to be installed on your workstation for
> other purposes.

Perhaps share this load?  I'd volunteer to make some tests using
my Fedora servers.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


