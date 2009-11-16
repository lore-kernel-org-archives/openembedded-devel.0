Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N9z0x-0005vq-3d for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 11:40:58 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N9yz9-0004Vf-1c
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 11:39:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 11:39:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 11:39:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 16 Nov 2009 11:37:26 +0100
Message-ID: <hdra17$t4d$1@ger.gmane.org>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <1258364356.5799.94.camel@dax.rpnet.com>
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
X-List-Received-Date: Mon, 16 Nov 2009 10:40:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-11-09 10:39, Richard Purdie wrote:
> On Mon, 2009-11-16 at 09:38 +0100, Koen Kooi wrote:
>> If something needs a PE bump, make sure you do it properly and bump PE
>> on the non scm fetched entries as well. For the kernel I wouldn't bump
>> PE, since too many machines can use different kernel recipes.
>>
>> And can someone tell me how SRCPV works when you have multiple
>> buildmachines across the world, how does one keep SRCPV in sync between
>> all those machines?
>>
>> How does SRCPV work when you have recipes for 1.2+gitrfoo, 1.3+gitrbar, etc?
>
> They'd become 1.2+LOCALBUILDREV+gitrfoo and 1.3+LOCALBUILDREV+gitrfoo.
>
>> IOW: will it create more work for me (like the proposed checksums
>> changes) instead of making things easier?
>
> SRCPV solves one particular set of bugs where local build revisions were
> only injected into revisions part of the time. This change makes things
> more consistent and predicable in that its always injected.
>
> Nobody has ever written code to share the bitbake persistent data
> between machines. It shouldn't be that hard with some kind of database
> server but nobody has done it.
>
> It doesn't really change the position for Angstrom as I understand it
> though as you don't (can't) use these packages now due to the multiple
> build servers and that position hasn't changed :/.

So basically every recipe that is using SRCPV in PV or PR is unsuitable 
to be put in online feeds. That should be enough to stop the SRCPV merge 
into .dev.

regards,

Koen




