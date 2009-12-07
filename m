Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NHk6Y-00076f-NZ for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 21:22:49 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NHk4x-0004ty-LZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 21:21:07 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 21:21:07 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 21:21:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 07 Dec 2009 21:20:41 +0100
Message-ID: <hfjo2p$i1b$1@ger.gmane.org>
References: <200912071959.19252.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <200912071959.19252.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Java handling in OpenEmbedded
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
X-List-Received-Date: Mon, 07 Dec 2009 20:22:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-12-09 19:59, Marcin Juszkiewicz wrote:
>
> Hi
>
> For most of time I do builds of BugLabs software for just one device: BUG
> which uses i.mx31 cpu (armv6). As I need to test it also on BeagleBoard I got
> hit by one problem when it comes to building Java software...
>
> As Java is target independent we package it as "all". But the problem is when
> build want to get JAR files built from other recipes (think dependencies). By
> default all those jars are staged into target staging (armv6-angstrom-linux-
> gnueabi in this case). It works fine as long as you do not want to build for
> other architecture in same tmpdir.
>
> After MACHINE change OE thinks (correctly) that it does not need to build Java
> things again (as it was PACKAGE_ARCH="all") and tries to use it from staging.
> But staging/usr/share/java/ dir is empty...
>
> OK, someone can say "but what is a deal? it got built before so you can just
> install packages - they are 'all' anyway". Sure, but some of our Java recipes
> are bind to BUG kernel services so can not be built for other devices and we
> do not want to be forced to keep MACHINE values in specific order to 'maybe
> this will work' way of building.
>
> What is a solution? I had few ideas during weekend and tested two of them.
>
> 1. Drop PACKAGE_ARCH="all" for ALL Java recipes. It works but adds extra
>     building time.
>
> 2. Change staging of JAR files. This worked fine for my build. Patch to
>     stable/2009 branch attached.

Your proposal sounds good to me. I'm willing to sacrifice some buildtime 
and storage om my buildhosts to retain my sanity when building java stuff :)

regards,

Koen



