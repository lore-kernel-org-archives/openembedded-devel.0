Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OYNCF-0004qV-It
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 19:53:43 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OYN7R-00029H-T6 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 10:48:41 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 12 Jul 2010 10:48:41 -0700
Received: from [172.30.80.244] ([172.30.80.244]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 12 Jul 2010 11:48:40 -0600
Message-ID: <4C3B5573.9010207@mentor.com>
Date: Mon, 12 Jul 2010 10:48:35 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinadOzl08k8hENqZJf9fMzcHHCnpUP1DfmatDj7@mail.gmail.com>	<4C3AA282.3030006@gmail.com>
	<1278946668.28835.769.camel@rex>
In-Reply-To: <1278946668.28835.769.camel@rex>
X-OriginalArrivalTime: 12 Jul 2010 17:48:40.0945 (UTC)
	FILETIME=[76CDBE10:01CB21EA]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: canadian-cross sdk?
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
X-List-Received-Date: Mon, 12 Jul 2010 17:53:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Mon, 2010-07-12 at 11:05 +0600, Dmitry Vinokurov wrote:
>> This question is important for me to. I'm running OE on linux-x86_64 
>> machine and want to build ARM toolchain for linux-x86 machine. I've 
>> asked about it on #irc and CruX| gave me config for building mingw32 
>> toolchain, it's in attachment and maybe it'll be helpful for you. 
>> Unfortunately, I couldn't adapt this config for my task, OE tries to 
>> build mingw all the same.
>>
>> It would be great if someone explain how to build canadian cross SDK. I 
>> haven't found nothing helpful about it neither in documentation nor in 
>> ML archives but it is very important question I think.
> 
> The canadian toolchain bits in OE are still in need to some attention to
> fully enable the case where the build machine is not the same as the
> machine you want to run the SDK on.
> 
> In Poky this works already, you'd set SDKMACHINE=i586 and then
> "MACHINE=qemuarm bitbake meta-toolchain".

So, if one wanted to update oe.dev again, is what's in poky's master 
what works for you guys now?

-- 
Tom Rini
Mentor Graphics Corporation


