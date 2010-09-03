Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1OrR8n-0001XI-90
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 09:56:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id A23042C839
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Sep 2010 07:50:18 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMPnoJRNRTcL
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Sep 2010 07:50:14 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 15ADE2C824
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Sep 2010 07:50:13 +0000 (UTC)
Message-ID: <4C80AA1B.7080406@gmail.com>
Date: Fri, 03 Sep 2010 09:56:11 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C7FCA85.8050807@gmail.com> <4C7FCEBD.6050407@kernelconcepts.de>
In-Reply-To: <4C7FCEBD.6050407@kernelconcepts.de>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: minimal-image doesn't boot
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
X-List-Received-Date: Fri, 03 Sep 2010 07:56:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Florian Boor ha scritto, Il 02/09/2010 18:20:
> Hi Marco,
> 
> Marco Cavallini schrieb:
>> I have been trying to run a minimal-image on an ARM system, because I
>> plan to use it on a 16MB NOR Flash.
>>
>> I started wirh a PXA270 based board but I faced to puzzling jffs2
>> errors, then I tried on a more reliable machine (for me) Ronetix-pm9263
>> with same results.
>>
>> Does anybody tested minimal-image recently?
>> Did it work?
>> With which machine?
>>
>> Any hint will be greatly appreciated.
> 
> this looks like either the jffs2 image are completely messed up (not very
> likely) or something went wrong while flashing. Do the bootloader agree with the
> kernels about the partition layout and was the root flash partition erased
> completely?
> 
> I do not have a Ronetix board around which would be useful to verify but I could
> try it with the SimOne I have - I built a minimal image for it recently but
> didn't test it so far.

Dear Florian,
a complete root flash partition clean solved the problem
Thank you

/marco


