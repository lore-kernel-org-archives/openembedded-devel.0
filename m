Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Np0fQ-0002ui-Uf
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 15:44:21 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 888D549127F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Mar 2010 15:41:16 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 9 Mar 2010 15:42:03 +0100
Message-ID: <4B965E0D.8050501@dresearch.de>
Date: Tue, 09 Mar 2010 15:41:17 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B8E618C.2080604@dresearch.de> <4B94AA93.4070709@dresearch.de>
	<1268071514.16526.6.camel@trini-m4400>
In-Reply-To: <1268071514.16526.6.camel@trini-m4400>
X-OriginalArrivalTime: 09 Mar 2010 14:42:03.0970 (UTC)
	FILETIME=[AF403220:01CABF96]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: u-boot ready initrds
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
X-List-Received-Date: Tue, 09 Mar 2010 14:44:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
>> Initrds need to be prepared with mkimage to be usable from u-boot.
>> The following patch introduces an additional IMAGE_FSTYPE .cpio.gz.u-boot
>> for this (at the moment just for hipox machine).
>>
>> Is this the way it should be done?
>>
>> Should this better become part of conf/bitbake.conf?
> 
> I don't know why patchwork didn't see this.

That's really crazy. None of my patches occurs in the patch queue.
I started an extra thread for this [1]. It would be really
great if somebody can fix this problem (or tell me what i'm
doing wrong).

> That said, mkimage -A arm is bad.  UBOOT_ARCH is right,

Good point. Total agreement.

> and comes from kernel-arch.bbclass.  So, I
> think a full patch would need to add in changes to image.bbclass to
> inherit kernel-arch so that UBOOT_ARCH will be evaluated.
>
> And yes, this I think should be in bitbake.conf with the rest of the
> image magics

I've too much respect and to little knowledge to make changes
inside these core components.

Can someone take me by the hand and guide me. ;-)

Steffen

PS: And another little question: is '.u-boot' a good extension for
this? Or is the shorter '.u' better?

[1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/30693



