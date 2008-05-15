Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JwylH-00020j-DY
	for openembedded-devel@openembedded.org; Fri, 16 May 2008 14:10:12 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jwlsx-0006a8-PO
	for openembedded-devel@openembedded.org; Thu, 15 May 2008 22:25:15 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 15 May 2008 22:25:15 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 15 May 2008 22:25:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 16 May 2008 00:25:07 +0200
Message-ID: <g0id83$qie$1@ger.gmane.org>
References: <c384c5ea0805141436m9f5151dje832c2da95379127@mail.gmail.com>	<1210869726.7097.93.camel@localhost.localdomain>	<c384c5ea0805151151v35e28a99i2ccb39157d5d47f6@mail.gmail.com>	<20080515201138.GB8281@smtp.west.cox.net>
	<c384c5ea0805151350o19a22753y87545cfc9e22c7d1@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008050803)
In-Reply-To: <c384c5ea0805151350o19a22753y87545cfc9e22c7d1@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Stop on multiple providers but none explicitly specified
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 16 May 2008 12:10:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:

> Use cases:
>
> Selecting "MACHINE=microblaze_dev_board, bitbake helloworld-image.bb"
> should work out of the box if we add the microblaze toolchain.
>
> Selecting "MACHINE=new_machine_with_new_arch DISTRO=old_distro bitbake
> some-image.bb" should as least TRY to build the image for the machine
> using the toolchain that is available in OpenEmbedded.

I've tried to make OE do "the right thing" in the past, but at the time 
the ARM users were strongly divided into seperate camps, with 
conflicting use cases (eg. some people insisted on hard-float, others on 
soft-float).
In the end it was both easier and cleaner (no double _distro_machine 
overrides in gcc_foo.bb) to specify the toolchain in the distro.
Since a few weeks the toolchain portion in angstrom is a log cleaner 
since people can now use subarch overrrides (armv7a, ppc405) to base 
their decision on.

 From a practical POV I'd say "pick a distro that's maintained and 
supports uclibc" for you microblaze board, and you should have very 
little trouble getting it to work.
 From a theoretical POV I'd say "OE should do the right thing", but "the 
right thing" is sadly such a political minefield that makes having a 
distro based with lots of technical merits (subarch overrides, 
modularity, extendability, QA integration, etc) like Angstrom is a blessing.
For years OE claimed "just change the MACHINE and everything just 
works", but it took angstrom nearly two years to make that a reality, so 
don't underestimate the work[1] involved making everything "just work"

regards,

Koen

[1] Just look at the the sheer amount of nasty python code in angstrom 
to select OABI for certain machines in a sane, supportable way....



