Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NA0Zn-0001bc-4W for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 13:21:02 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NA0YU-0003IW-Bx
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 13:19:38 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 13:19:38 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 13:19:38 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 16 Nov 2009 13:19:15 +0100
Message-ID: <hdrg03$g1p$1@ger.gmane.org>
References: <20091115163618.GA3317@jama>
	<hdr31n$8b0$1@ger.gmane.org>	<1258364356.5799.94.camel@dax.rpnet.com>	<hdra17$t4d$1@ger.gmane.org>	<1258368570.5799.99.camel@dax.rpnet.com>	<hdrb9v$1dp$1@ger.gmane.org>
	<20091116115115.GA23383@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <20091116115115.GA23383@jama>
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
X-List-Received-Date: Mon, 16 Nov 2009 12:21:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-11-09 12:51, Martin Jansa wrote:
> On Mon, Nov 16, 2009 at 11:59:10AM +0100, Koen Kooi wrote:
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
>> Ah, that was the bit of info I was missing. But if SRCREV is locked
>> down (as it should!) what's the point of putting SRCPV in PV or PR?
>> It seems to make things worse if you update a locked SRCREV, since
>> SRCPV will remain '1'.
>>
>> regards,
>>
>> Koen
>
> Hi,
>
> I'm not sure if this is 100% right but it behaves like this here:
>
> with AUTOREV used

Which angstrom tries to avoid at great lenghts and any OE recipe fetched 
from an scm will by default and policy have a locked down rev available.
A user (or distro) has to explicitly enable AUTOREV for recipes.

> as SRCREV you get ${SRCREV} in format
> gitrNNNN+hash
> where NNNN is localcount incremented on buildhost every time you build
> that recipe AND hash is changed
> if you have fixed SRCREV then without SRCPV you get just gitrHash which
> can be<  gitrNNNN+hash or>  gitrNNNN+hash depending on actual hash value.
> That's why you cannot switch between SRCREV and SRCPV without PE bump.

I'm extremely allergic to PE bumps, because it means we screwed up big time.

> If there is SRCPV in PV and you're using fixed SRCREV than you don't
> need to bump PR in cases like this
> ./xorg-proto/calibrateproto_git.bb:PV = "0.0+${PR}+gitr${SRCPV}"
> because +gitr${SRCPV} will create non-decreasing sequence as localcount
> will be incremented every time you bump fixed SRCREV for that recipe AND
> build it.

So, how do I say

PREFERRED_VERSION_calibrateproto = 0.0+r1+gitr483843874931943189393 # 
(4838... is what's in sane-srcrevs.inc)

with SRCPV? It seems I would loose the ability to do that 'globally' 
since SRCPV is tied to a buildhost.

> You're right that there can be inconsistency between builders if one ie
> you're changing fixed srcrev every day and rebuild it on that buildhost
> and othere buildhost is rebuilding that package once a month.
>
> If all your builders are building all your targets every day and you're
> not changing fixed SRCREV more then once a day, you need to sync
> bb_persist_data.sqlite3 only for new builder or after some failures
> (which I know is quite error-prone :().

So SRCPV makes things worse than the current situation.

> This inconsistency can be fixed imho only by sharing
> tmpdir-dev-shr/cache/om-gta02/bb_persist_data.sqlite3 between hosts
> (better using some online database access for getting localcounts)
>
> sqlite3 ../tmpdir-dev-shr/cache/om-gta02/bb_persist_data.sqlite3
> "select * from BB_URI_LOCALCOUNT where key like '%kernel.git-linux-openmoko-shr-drm-devel_count';"
> git:git.openmoko.org.git.kernel.git-linux-openmoko-shr-drm-devel_count|5

So it seems that using SRCPV in PV and PR shouldn't be allowed till 
there is *good* way to share the 'localcount' to all builders.

regards,

Koen



