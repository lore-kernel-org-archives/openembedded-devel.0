Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PD2xa-0004Lm-3G
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 23:34:39 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1PD1YZ-0003eR-Ca from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 14:04:43 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 1 Nov 2010 14:04:43 -0700
Received: from [172.30.80.166] ([172.30.80.166]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 1 Nov 2010 15:04:42 -0600
Message-ID: <4CCF2B68.2070201@mentor.com>
Date: Mon, 01 Nov 2010 14:04:40 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <i9p1d0$7q4$1@dough.gmane.org>
	<4CC00D57.4070601@xora.org.uk>	<i9p2uf$f40$1@dough.gmane.org>
	<4CC0104B.4070108@xora.org.uk>
	<AANLkTi=74mwvxLLwCjEhV3OMCyOdpfRZeU0Z-bf6TM+P@mail.gmail.com>
In-Reply-To: <AANLkTi=74mwvxLLwCjEhV3OMCyOdpfRZeU0Z-bf6TM+P@mail.gmail.com>
X-OriginalArrivalTime: 01 Nov 2010 21:04:42.0951 (UTC)
	FILETIME=[67C56D70:01CB7A08]
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
X-List-Received-Date: Mon, 01 Nov 2010 22:34:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/10/21 Graeme Gregory <dp@xora.org.uk>:
> 
>> Such a pity git doesnt have increasing rev numbers, a cool adition would
>> be a flag in layer that showed the last rev of core it was tested with.
>>
>> Layer was tested with core 1 but core is now 999 would give an
>> indication on drift between layers and core.
>>
>> Graeme
> 
> Triggered by this (and apologies if I am drifting off-topic).
> It would be nice if with amend.inc you could specify the PR of the
> underlying recipe that this amend is for (and get a warning or error
> if there is a mismatch)

I know I'm late to the party but.. I don't think this is a big deal. 
Changes getting out of sync from foopkg 1.1 to foopkg 1.2?  Yes.  foopkg 
1.1 PR="r1" to 1.1 PR="r10" ?   Unlikely and something the human control 
side should be able to handle.

-- 
Tom Rini
Mentor Graphics Corporation


