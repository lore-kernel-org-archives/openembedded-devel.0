Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NA1S9-0000m9-I9 for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 14:17:12 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NA1Qd-0004Kr-Pd
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 14:15:35 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 14:15:35 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 14:15:35 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 16 Nov 2009 14:15:07 +0100
Message-ID: <hdrj8r$r03$1@ger.gmane.org>
References: <20091115163618.GA3317@jama>
	<hdr31n$8b0$1@ger.gmane.org>	<1258364356.5799.94.camel@dax.rpnet.com>
	<hdra17$t4d$1@ger.gmane.org>	<1258368570.5799.99.camel@dax.rpnet.com>
	<hdrb9v$1dp$1@ger.gmane.org>	<1258371591.5799.112.camel@dax.rpnet.com>
	<hdrffa$do6$1@ger.gmane.org>
	<1258375022.16625.3.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <1258375022.16625.3.camel@dax.rpnet.com>
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
X-List-Received-Date: Mon, 16 Nov 2009 13:17:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-11-09 13:37, Richard Purdie wrote:
> On Mon, 2009-11-16 at 13:10 +0100, Koen Kooi wrote:
>>> How does Angstrom currently solve this problem? You bump the SRCREV
>>> and override PV manually?
>>
>> With 'angstrom' you mean 'oe', right? If a SRCREV gets updated the
>> person doing that checks if PV or PR need to get changed to make it sort
>> higher (or lower, depending on the change). I don't see how SRCPV will
>> make life or less error-prone. By the looks of it it only makes things
>> worse.
>
> I meant Angstrom which looks like it relies on anyone doing the updating
> to OE in general to get this right :/. As I'm sure you're aware this is
> less than ideal.

I used to spend a non-trivial amount of time cleaning up such things, 
but since I stopped caring about various recipes it isn't such a problem 
anymore.

> You have a point in that we can't lock down the local build revisions
> and this causes a problem with the distributed nature of Angstrom's
> builds.

Note that 'distributed' can mean something as simple as laptop + 
desktop. Or ubuntu-vm +fedora-vm. Or even "I wiped TMPDIR this morning".

> I think we will have to hold off some of the SRCPV migration until
> bitbake has some kind of lock down functionality for the local build
> numbers.

It would at least need a lockdown feature and a way to share 
changes/updates that is firewall friendly (basically git or http in my 
case).
I don't think forcing every distro to setup and manage their own 
database server just to make life easier for AUTOREV git users is worth 
it. I'm not saying we should make life harder for them, but screwing 
over everyone for what I would call a niche usecase (autorev users 
caring about upgradepaths) goes too far.
The current SRCREV situation sucks, but SRCPV only helps with making the 
packagemanager see that your change sorts higher and will get installed 
when upgrading. It does *NOT* solve any of the other issues, like 
needing to change PV if the new revision increased the upstream version 
(e.g. going from 2.6.31 to 2.6.32 for kernels).

> Any volunteers to write a patch?

I would guess the AUTOREV people would.

regards,

Koen




