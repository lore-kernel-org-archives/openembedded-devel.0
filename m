Received: from aek116.rev.netart.pl ([77.55.114.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mateusz.nowaczyk@wisene.pl>) id 1T75ps-0004np-SA
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 16:35:08 +0200
Received: from [192.168.0.4] (unknown [79.191.173.144])
	by wisene.nazwa.pl (Postfix) with ESMTP id 62EA01158168
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2012 16:22:55 +0200 (CEST)
Message-ID: <503F773F.6020409@wisene.pl>
Date: Thu, 30 Aug 2012 16:22:55 +0200
From: Mateusz Nowaczyk <mateusz.nowaczyk@wisene.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <503E506E.2010002@wisene.pl> <k1n6oh$8ve$1@ger.gmane.org>
In-Reply-To: <k1n6oh$8ve$1@ger.gmane.org>
Subject: Re: Newbie question: Angstrom on at91sam9g20
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
X-List-Received-Date: Thu, 30 Aug 2012 14:35:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.08.2012 10:03, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 29-08-12 19:25, Mateusz Nowaczyk schreef:
>> Hi, I've been using Angstrom 2011.03 (oe-classic) on a modified
>> at91sam9g20ek board. Unfortunately, it seems that it is no longer updated
>> - it contains obsolete version of dropbear (0.52) ect. I tried switching
>> to the new oe-core based version, but it lacks adequate bsp layer. I also
>> tried manually changing the opkg.conf and installing packages from
>> http://www.angstrom-distribution.org/feeds/v2012.05/ipk/eglibc/armv5te/base/
>>
>>
> but it only caused more problems (can't login at all).
>> How can i get an up-to-date Angstrom for this architecture? Should I
>> stick to the classic OE and manually update recipies, or rather create a
>> bsp layer?
>
> Create a bsp layer

OK, I found the meta-atmel layer here:
https://github.com/rascalmicro/meta-atmel

I got the following error:

~/angstrom/setup-scripts$ MACHINE=at91sam9g20ek bitbake console-image

Pseudo is not present but is required, building this first before the 
main build
ERROR: ParseError at 
/home/mn/angstrom/setup-scripts/sources/meta-atmel/recipes-bsp/u-boot/u-boot.inc:62: 
unparsed line: 'INSANE_SKIP_${PN} = True':  --:--:--
ERROR: Command execution failed: Exited with 1
Is there any way to fix it?


