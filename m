Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q7NCg-0006oC-8U for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:31:07 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q7NAf-0002z8-IY for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:28:57 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 09:28:57 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 09:28:57 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 06 Apr 2011 09:28:45 +0200
Message-ID: <inh4nd$q7$1@dough.gmane.org>
References: <1302016253-10390-1-git-send-email-heroor@gmail.com>	<inff89$hdg$1@dough.gmane.org>
	<BANLkTinEDpEthJ92iS1w=wT=6Ctemum9UQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTinEDpEthJ92iS1w=wT=6Ctemum9UQ@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/2] ti-syslink: Add TI Syslink for TI816x and TI814x devices
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
X-List-Received-Date: Wed, 06 Apr 2011 07:31:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-04-11 04:42, Siddharth Heroor wrote:
> On Tue, Apr 5, 2011 at 9:46 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 05-04-11 17:10, Siddharth Heroor wrote:
>>> From: Siddharth Heroor <heroor@ti.com>
>>>
>>> * Syslink is an Inter Processor communication layer for ARM/DSP devices.
>>
>> NAK!
>>
>> 1) This has way too much copy/paste crud from dsplink that needs to get
>> cleaned up, some highlights:
> Yes, I did follow precedence and use what was already present in OE.
> 
>>
>>> +PROVIDES = "ti-syslink-module"
>>> +PROVIDES += "ti-syslink-examples"
>>> +PR_append = "j"
>>
>> 2) inconsistent whitespace every where, do_compile is the worst
>>
>> 3) This really needs to get split into 2 recipes: one for the kernel
>> modules using module.bbclass and one for the userspace bits.
> 
> I can split the examples and libraries into two recipes, but we may need the
> kernel module and libraries to be staged together. What would you suggest
> I do to keep them together when staging?

You don't need to stage the kernel modules, only the symbol map. And I
doubt even that is necessary looking at the syslink diagrams.

>> 4) The platform defines seem to be better suited for e.g. ti-paths.inc
> 
> Would moving all the defines into a separate ti-syslink-env.inc be good or does
> it have to be in ti-paths.inc. I'm not keen on keep all the syslink
> defines in ti-paths.inc
> as its unrelated to the other recipes that use ti-paths.inc.

And a related question, why is this version of syslink so convoluted
compared to
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/ti/ti-syslink_git.bb
?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNnBYtMkyGM64RGpERArn6AKCKCyr22nEDOFPTahnnhsqvvNQbWwCePna9
AplUQiJ0epW8GZ/rzsSBoOo=
=Jrak
-----END PGP SIGNATURE-----



