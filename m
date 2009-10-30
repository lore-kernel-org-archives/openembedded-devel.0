Received: from [87.193.137.100] (helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1N3tRC-0003Z6-9P
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Oct 2009 16:30:55 +0100
Received: from hiob.intern.dresearch.de (unknown [10.32.0.138])
	by mail.dresearch.de (Postfix) with ESMTP id DFDE9491287
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2009 16:29:43 +0100 (CET)
Received: from [10.32.11.62] ([10.32.11.62]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 30 Oct 2009 16:31:58 +0100
Message-ID: <4AEB0638.5070700@dresearch.de>
Date: Fri, 30 Oct 2009 16:28:56 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.4pre) Gecko/20090915 SUSE/3.0b4-3.6 Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AE830DE.5030209@dresearch.de>
	<19c1b8a90910291529m56c2af1fvaa56dc17a657044f@mail.gmail.com>
In-Reply-To: <19c1b8a90910291529m56c2af1fvaa56dc17a657044f@mail.gmail.com>
X-OriginalArrivalTime: 30 Oct 2009 15:31:58.0703 (UTC)
	FILETIME=[1E8CAFF0:01CA5976]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: busybox-static linking failed
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
X-List-Received-Date: Fri, 30 Oct 2009 15:30:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/29/2009 11:29 PM, Khem Raj wrote:
>> After a long time i tried to build an initramfs image containing
>> busybox-static which fails to link (besides some warnings) with these
>> errors:
>>
>> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:189:
>> undefined reference to `__cpu_to_be16'
>> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:190:
>> undefined reference to `__cpu_to_be16'
>> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:202:
>> undefined reference to `__cpu_to_be16'
>> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:214:
>> undefined reference to `__cpu_to_be16'
>> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:224:
>> undefined reference to `__cpu_to_be16'
>> networking/libiproute/lib.a(iptunnel.o):/home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:225:
>> more undefined references to `__cpu_to_be16' follow
>>
>> This is really obscure for me because i can't identify the code lines
>> responsible for them. :(
> 
> you need this kernel patch here
> http://lkml.org/lkml/2009/6/18/223

This fixes the missing include inside the kernel. My patch suggestion
adds the missing include inside busybox. I would prefer the kernel
patch. Any objections?

Steffen




