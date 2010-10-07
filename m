Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P3u4R-0001jo-7O
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 19:15:56 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P3u42-0005eo-KB from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 10:15:30 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 7 Oct 2010 10:15:01 -0700
Received: from [172.30.80.69] ([172.30.80.69]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 7 Oct 2010 11:14:58 -0600
Message-ID: <4CAE0004.6080607@mentor.com>
Date: Thu, 07 Oct 2010 10:14:44 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CADCF1E.3090602@mentor.com> <20101007140016.GC3163@jama>
In-Reply-To: <20101007140016.GC3163@jama>
X-OriginalArrivalTime: 07 Oct 2010 17:14:58.0618 (UTC)
	FILETIME=[2B5761A0:01CB6643]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Updating libtiff
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
X-List-Received-Date: Thu, 07 Oct 2010 17:15:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Martin Jansa wrote:
> On Thu, Oct 07, 2010 at 06:46:06AM -0700, Tom Rini wrote:
>> Hey all,
>>
>> I'm looking to update libtiff to cover some security issues in the 
>> version we ship, and I noticed something funny about how we do it today. 
>>   Currently tiff_3.9.2.bb sets PV to 3.9.2+4.0.0beta5 and grabs and 
>> builds 4.0.0beta5.  While it's possible that in the past 3.9.2 was 
>> intended to be the last 3.9.x, it wasn't.
>>
>> I think we should go with:
>> - Add tiff_4.0.0beta6.bb which should be compatible with beta5 and will 
>> get upgrades right.
>> - Add tiff_3.9.4.bb as well, in case someone wants to stay on the 
>> released line.
>>
>> Anyone see a problem with that?
> 
> Isn't PV="4.0.0" < PV="4.0.0beta5"?
> 
> Then it would be better to stay with 3.9.2+4.0.0beta* sheme for easy
> upgrade path to 4.0.0 release.
> 
> at least that's the reason why I have ie:
> KERNEL_RELEASE = "2.6.36-rc7"
> OLD_KERNEL_RELEASE = "2.6.35"
> PV = "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"

Ah right.  But the problem is that we're more like back in the "not 
quite 2.6.0" days of the kernel.  Unless we just skip out on doing 3.9.4 
itself, which I guess is possible.

-- 
Tom Rini
Mentor Graphics Corporation


