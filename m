Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PDOJO-0004Pa-Fc
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 22:22:36 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1PDOIa-0007GB-51 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 14:21:44 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 2 Nov 2010 14:21:44 -0700
Received: from [172.30.80.166] ([172.30.80.166]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 2 Nov 2010 15:21:43 -0600
Message-ID: <4CD080E2.2000706@mentor.com>
Date: Tue, 02 Nov 2010 14:21:38 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <i9p1d0$7q4$1@dough.gmane.org>	<AANLkTimRY+gDbK9jZvUEuxMAu3PvQ8pnfb3oXjAXeU0B@mail.gmail.com>	<iaptb1$bpb$1@dough.gmane.org>
	<4CD07F3E.7040703@eukrea.com>
In-Reply-To: <4CD07F3E.7040703@eukrea.com>
X-OriginalArrivalTime: 02 Nov 2010 21:21:43.0458 (UTC)
	FILETIME=[F2743020:01CB7AD3]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Tue, 02 Nov 2010 21:22:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Eric Bénard wrote:
> Hi,
> 
> Le 02/11/2010 21:46, Koen Kooi a écrit :
>> I do fear that pulling things into seperate layers too much will make it
>> harder to propagate fixes...
>>
> yes, in your example, the fines in conf/machine/include are common to 
> all omap boards (and even all cortexa8 for tune-cortexa8.inc) and thus 
> when fixing one BSP you have to think to fix the others (and to 
> communicate the fix to other BSP maintainers).
> The same apply for most of the .inc in recipes-bsp/*/.
> 
> Do you think the following setup is possible ?
> 
> - ARM overlay (containing all generic files for ARM achitecture : 
> conf/machines/include for example)
> 
> - OMAP3 overlay (containing all generic files for OMAP3 SOC : 
> conf/machines/include/omap* + recipes/linux u-boot x-load base files for 
> omap3 architecture,
> 
> - specific board overlay (conf/machine/themachine.conf + board specific 
> additions in recipes/linux u-boot & x-load (with patches based on top of 
> the OMAP3 overlay).

How about:

- allow some form of conf/machine/include to continue to exist in the 
main layer

? There would have to be some judgment calls, but I don't think that 
should be too hard, over when it's SOC_FAMILY or when it's very generic. 
  Basically the ARM overlay wouldn't be created in this case (nor the 
PPC nor MIPS nor ...).  But we must avoid duplicating tune-coretexa8.inc 
and similar.

-- 
Tom Rini
Mentor Graphics Corporation


