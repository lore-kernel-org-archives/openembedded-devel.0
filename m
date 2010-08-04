Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1OghJW-00020o-QV
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 18:59:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 6EE9BA5BF0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Aug 2010 17:59:31 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id p5MzOv8AZ-AB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Aug 2010 17:59:30 +0100 (BST)
Received: from [192.168.1.119] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id CBEB9A5BEF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Aug 2010 17:59:30 +0100 (BST)
Message-ID: <4C599C72.10805@xora.org.uk>
Date: Wed, 04 Aug 2010 17:59:30 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.7) Gecko/20100720 Lightning/1.0b2 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>	<20100804001959.GF17391@denix.org>
	<20100804052042.GB7085@gmail.com>	<1280920678.26249.33.camel@saphir>	<1280922518.2692.377.camel@mill.internal.reciva.com>
	<20100804161327.GA7189@denix.org>
In-Reply-To: <20100804161327.GA7189@denix.org>
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY	in	COMPATIBLE_MACHINES
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
X-List-Received-Date: Wed, 04 Aug 2010 16:59:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

 On 04/08/10 17:13, Denys Dmytriyenko wrote:
> On Wed, Aug 04, 2010 at 12:48:38PM +0100, Phil Blundell wrote:
>> On Wed, 2010-08-04 at 13:17 +0200, Michael 'Mickey' Lauer wrote:
>>> FWIW, minimal is using MACHINE_CLASS since quite a while to
>>> reduce the need for adding the same files over and over again,
>>> this is being used e.g. for HTC msm7 series and OpenEZX series
>>> (see conf/machine/include).
>>>
>>> Perhaps it's time to standardize something like that.
>> Yeah.  I certainly don't think we want a proliferation of such
>> mechanisms.  If minimal is already using MACHINE_CLASS then there would
>> be some sense in trying to make use of the same thing.
>>
>> Failing that though, testing COMPATIBLE_MACHINE against MACHINE_CLASS
>> probably is more desirable than adding a completely new variable (i.e.
>> SOC_FAMILY) for that purpose.
> Phil,
>
> Re: "adding a completely new variable" - SOC_FAMILY has been in use for almost 
> a year now. I'm hearing about MACHINE_CLASS for the first time, although it 
> appears to be slightly older than SOC_FAMILY though. But it doesn't seem to be 
> used anywhere besides in few machine configs and micro.conf. There are no 
> recipes actually using it, unlike SOC_FAMILY...
>
> I'm not saying one is better than the other (actually, unifying them would 
> be nice), I'm just saying it's too late to object adding SOC_FAMILY...
>
As the person who originally added MACHINE_CLASS to openmoko and the OE,
then removed it from OE I can say it has different meaning that
SOC_FAMILY. MACHINE_CLASS was to identify a range of machines that were
90% the same but had a few differences. It was used in a few recipes
which were MACHINE_ARCH to make them use the same ARCH in these recipes
to stop them being rebuilt when switching machines.

The original use was om-gta01 and om-gta02 which had the same MACHINE_CLASS.

Graeme



