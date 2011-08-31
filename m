Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QykUS-0001bb-51 for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 15:06:00 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QykPf-0000Yc-Ku for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 15:01:03 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 15:01:03 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 15:01:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 31 Aug 2011 15:00:51 +0200
Message-ID: <j3lba3$7a9$1@dough.gmane.org>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
	<201108311327.01907.paul.eggleton@linux.intel.com>
	<62BBB5B2-363D-49EA-AD5D-B67123C0F908@dominion.thruhere.net>
	<20110831124339.GA19917@chargestorm.se>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <20110831124339.GA19917@chargestorm.se>
X-Enigmail-Version: 1.3.1
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Wed, 31 Aug 2011 13:06:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 31-08-11 14:43, Anders Darander schreef:
> * Koen Kooi <koen@dominion.thruhere.net> [110831 14:36]:
>> Op 31 aug. 2011, om 14:27 heeft Paul Eggleton het volgende geschreven:
> 
>>> On Wednesday 31 August 2011 13:16:50 Koen Kooi wrote:
>>>> Op 31-08-11 13:55, Anders Darander schreef:
>>>>> To sad. It's a lot easier to remember to bump the PR, when PR
>>>>> actually is in the recipe. Thus, including PR=0 will often remove
>>>>> one issue with patches.
>>>> 
>>>> That's what review is for, no?
>>> 
>>> Surely you'd rather people have a better chance of getting it right
>>> the first time rather than you having to remind them for every patch?
>>> The almost insignificant burden of a PR = "r0" in each recipe seems
>>> worthwhile to me if it even helps a single person remember.
> 
>> I've found that in .dev having PR = r0 in recipes is a bigger burden 
>> than not having them, especially when using shared .inc files like 
>> xorg. And there have been enough patches where people don't get PR 
>> bumps right even if there's a PR already in the recipe. So I'm 
>> unconvinced that it makes a real difference in "getting it right".
> 
>> Even in the extreme case that every packaging patch is missing a PR 
>> bump that, for me,  is less annoying than issues I faced in .dev with 
>> PR = r0 sprinkled throughout the metadata.
> 
> Just curious (and it might convince me and others) what issues have PR = 
> "r0" caused in .dev?

The most recent one in .dev was xorg .inc files. Some recipes had PR, some
didn't, and some had INC_PR. In this specific case there should have been
only one PR (or INC_PR) in the .inc.

And of course the good old "add PR=r0 to the .inc, making older recipes go
backwards" thing.

In OE-core/meta-oe the most recent annoyance were the gcc recipes, which now
finally have a centrally managed PR.

No situation is perfect, but my *personal* experience is that not adding
PR=r0 is *less* annoying than adding it.

The big difference between classic OE and the OE-core way is that things are
a lot cleaner to start with, so PR=r0 might be safer to use, but I'd like to
err on the side of caution.

If you all feel really strongly about PR=r0 I'd advice you to send patches
to add it to recipes that need it in OE-core and after those get accepted
send patches for the recipes in meta-oe.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOXjCDMkyGM64RGpERAi6IAJ9gfcBsVYJnmUyUfuG2FYzM1gwLBwCfS50P
0/Nfa+jBKCmb/T3pNjxwHds=
=bsOl
-----END PGP SIGNATURE-----



