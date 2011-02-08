Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pmv5F-00068t-Lh
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 22:26:49 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pmv4E-00019d-Gi from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 13:25:46 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 8 Feb 2011 13:25:46 -0800
Received: from [172.30.80.130] ([172.30.80.130]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 8 Feb 2011 14:25:45 -0700
Message-ID: <4D51B4D5.3060007@mentor.com>
Date: Tue, 08 Feb 2011 14:25:41 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>	<4D517D6C.3070604@mentor.com>	<iis1mg$tj9$1@dough.gmane.org>	<AANLkTim7EfHHu1wCmZOwEtG7uvtURM=fmpjGT9k790Jo@mail.gmail.com>
	<iisb4q$n5v$1@dough.gmane.org>
In-Reply-To: <iisb4q$n5v$1@dough.gmane.org>
X-OriginalArrivalTime: 08 Feb 2011 21:25:45.0211 (UTC)
	FILETIME=[BF0844B0:01CBC7D6]
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in PACKAGES
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
X-List-Received-Date: Tue, 08 Feb 2011 21:26:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2011 02:04 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 08-02-11 21:39, Filip Zyzniewski wrote:
>>> On 08-02-11 18:29, Tom Rini wrote:
>>> Yeah, this patch is wrong, since task-base is supposed to drag in bt and
>>> wifi when it's available which includes usb, pci, serial, etc.
>>
>> Shouldn't these optional devices be handled by packages from feed
>> rather than the bootstrap image?
>
> Kinda hard to get to the feeds without networking

So if I follow what you're saying, since BT/WiFi can be USB dongles (or 
PCI cards or otherwise plug-in IO) they need to exist all the time. 
Maybe we just need to also add in a line or two for usbhost (and pci) 
saying "Make common USB I/O also work" ?

-- 
Tom Rini
Mentor Graphics Corporation


