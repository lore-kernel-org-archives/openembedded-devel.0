Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Nd1Oo-0003Cb-HI
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 14:05:38 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id BEAA0491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Feb 2010 14:03:05 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 4 Feb 2010 14:03:45 +0100
Message-ID: <4B6AC59A.90000@dresearch.de>
Date: Thu, 04 Feb 2010 14:03:22 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W217652A5FD6DFB2C0B4E2FD8570@phx.gbl>	<4B684D9D.2030001@dresearch.de>
	<4B699C5A.70909@dresearch.de>
	<20100203162120.GB26844@xora-build.xora.org.uk>
In-Reply-To: <20100203162120.GB26844@xora-build.xora.org.uk>
X-OriginalArrivalTime: 04 Feb 2010 13:03:45.0850 (UTC)
	FILETIME=[7C10C1A0:01CAA59A]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem in bitbaking
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
X-List-Received-Date: Thu, 04 Feb 2010 13:05:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
>>> Since today i see a similar problem when doing a clean bitbake of
>>> glib-2.0. It seems to be a problem with automake/automake. :(
>>
>> I think i've identified this patch as cause of the problems.
>>
>>   commit b1caa21ab2590689f3b6ff68483803701c12d721
>>   Author: Graeme Gregory <dp@xora.org.uk>
>>   Date:   Tue Jan 26 12:02:08 2010 +0000
>>
> Guys there is zero point sending me emails direct if you dont actually
> tell me any information.

Sorry about that. But i wasn't sure if you read the ml daily. So i put
you on the Cc.

BTW, i would call the hint, that your commit broke[1] the baking of at
least glib-2.0 (which isn't that exotic) an 'information'.

[1] I've rechecked this again with angstrom distro and hipox,
beagleboard, and x86 machine making a clean build of glib-2.0:

  rm -rf tmp.5
  bitbake glib-2.0

Steffen



