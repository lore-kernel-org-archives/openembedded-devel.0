Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NA0R7-0001LE-ND for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 13:12:04 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NA0Pp-0000CY-JP
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 13:10:41 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 13:10:41 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 13:10:41 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 16 Nov 2009 13:10:17 +0100
Message-ID: <hdrffa$do6$1@ger.gmane.org>
References: <20091115163618.GA3317@jama>
	<hdr31n$8b0$1@ger.gmane.org>	<1258364356.5799.94.camel@dax.rpnet.com>
	<hdra17$t4d$1@ger.gmane.org>	<1258368570.5799.99.camel@dax.rpnet.com>
	<hdrb9v$1dp$1@ger.gmane.org>
	<1258371591.5799.112.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <1258371591.5799.112.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration
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
X-List-Received-Date: Mon, 16 Nov 2009 12:12:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-11-09 12:39, Richard Purdie wrote:
> On Mon, 2009-11-16 at 11:59 +0100, Koen Kooi wrote:
>> On 16-11-09 11:49, Richard Purdie wrote:
>>> On Mon, 2009-11-16 at 11:37 +0100, Koen Kooi wrote:
>>>> So basically every recipe that is using SRCPV in PV or PR is unsuitable
>>>> to be put in online feeds. That should be enough to stop the SRCPV merge
>>>> into .dev.
>>>
>>> How is this different to the current situation though?
>>
>> In the current situation (actually, last weeks situation) SRCPV was
>> never used.
>>
>>> If SRCREV is locked down you will get 1 as the local build revision back
>>> and it will not change and will be the same for everyone.
>>
>>> If its not locked down, all bets are off but they always have been - no
>>> change.
>>
>> Ah, that was the bit of info I was missing. But if SRCREV is locked down
>> (as it should!) what's the point of putting SRCPV in PV or PR? It seems
>> to make things worse if you update a locked SRCREV, since SRCPV will
>> remain '1'.
>
> How does Angstrom currently solve this problem? You bump the SRCREV and
> override PV manually?

With 'angstrom' you mean 'oe', right? If a SRCREV gets updated the 
person doing that checks if PV or PR need to get changed to make it sort 
higher (or lower, depending on the change). I don't see how SRCPV will 
make life or less error-prone. By the looks of it it only makes things 
worse.

regards,

Koen

>
> Angstrom would probably need a policy of wiping out the persistent data
> DB so it didn't auto increase and then the situation doesn't change (for
> Angstrom).
>
> The benefit of this change is that local builds start automatically
> working for people with fixed or floating SRCREV (and allows easily
> switching between them) and people generating feeds from a single build
> machine also benefit.
>
> What we really need is a way to force the "local" build revisions for
> the likes of Angstrom, I'll keep that in mind for the next bitbake
> release...
>
> Cheers,
>
> Richard




