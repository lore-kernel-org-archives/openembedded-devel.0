Received: from aek116.rev.netart.pl ([77.55.114.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mateusz.nowaczyk@wisene.pl>) id 1T76Br-0006KB-Rr
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 16:57:51 +0200
Received: from [192.168.0.4] (unknown [79.191.173.144])
	by wisene.nazwa.pl (Postfix) with ESMTP id 7FF1B30CDB85
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2012 16:45:39 +0200 (CEST)
Message-ID: <503F7C92.9000701@wisene.pl>
Date: Thu, 30 Aug 2012 16:45:38 +0200
From: Mateusz Nowaczyk <mateusz.nowaczyk@wisene.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <503E506E.2010002@wisene.pl> <k1n6oh$8ve$1@ger.gmane.org>
	<503F773F.6020409@wisene.pl> <1354802.G46xZeSRAF@helios>
In-Reply-To: <1354802.G46xZeSRAF@helios>
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
X-List-Received-Date: Thu, 30 Aug 2012 14:57:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.08.2012 16:29, Paul Eggleton wrote:
> On Thursday 30 August 2012 16:22:55 Mateusz Nowaczyk wrote:
>> Pseudo is not present but is required, building this first before the
>> main build
>> ERROR: ParseError at
>> /home/mn/angstrom/setup-scripts/sources/meta-atmel/recipes-bsp/u-boot/u-boot
>> .inc:62: unparsed line: 'INSANE_SKIP_${PN} = True':  --:--:--
>> ERROR: Command execution failed: Exited with 1
>> Is there any way to fix it?
>
> Whoever maintains the meta-atmel layer needs to fix it up to use quotes around
> that value - also True is probably no longer an appropriate value for
> INSANE_SKIP_.

Thx, I added quotes and it started building!


