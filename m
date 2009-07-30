Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MWYtY-0008Og-SY
	for openembedded-devel@openembedded.org; Thu, 30 Jul 2009 18:54:20 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MWYex-0001hE-Gp
	for openembedded-devel@openembedded.org; Thu, 30 Jul 2009 16:39:15 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 30 Jul 2009 16:39:15 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 30 Jul 2009 16:39:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 30 Jul 2009 18:39:04 +0200
Message-ID: <h4sib8$hau$1@ger.gmane.org>
References: <BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>	<1244206438.6643.46.camel@port4>	<BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>	<1244635240.28486.7.camel@hammer.suse.cz>	<20090730105711.GA29595@zlo.nu>	<1248952464.21030.110.camel@hammer.suse.cz>	<20090730114922.GA29793@zlo.nu>	<1248956053.21030.133.camel@hammer.suse.cz>	<20090730125001.GA30052@zlo.nu>	<c384c5ea0907300622k5ab4bc15yeae9f448312fb887@mail.gmail.com>	<20090730144831.GA30445@zlo.nu>
	<4A71B5AD.1080002@xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090716 Shredder/3.0b4pre
In-Reply-To: <4A71B5AD.1080002@xora.org.uk>
Sender: news <news@ger.gmane.org>
Subject: Re: Commit 2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3 breaks libtool's do_configure [PATCH]
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
X-List-Received-Date: Thu, 30 Jul 2009 16:54:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30-07-09 17:01, Graeme Gregory wrote:
> Marc Olzheim wrote:
>> On Thu, Jul 30, 2009 at 03:22:19PM +0200, Leon Woestenberg wrote:
>>>> My /bin/sh is a dash, I should have known, my apologies. I have a patch
>>>>
>>> Testing with dash rather than bash is GOOD due to it adhering to POSIX
>>> without much of the bash-specifics.
>>
>> Well, I agree, but judging by commit
>> e0ed375a8dfb292bdd72f5891917ef81f361f15c to classes/sanity.bbclass, I
>> assumed the policy was to require /bin/bash for /bin/sh instead of
>> fixing bashisms.
>>
>> To not be obligated to use bash, I added the attached patch.
>>
> OE is always supposed to run on dash, unfortuneately a lot of the stuff
> it builds is written by people less caring. I beleive that commit was
> spurred by a libtool failure on dash.

Gtk people abusing libtool to be more precise :)



