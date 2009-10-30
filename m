Received: from [209.85.223.190] (helo=mail-iw0-f190.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N3xkJ-0001iH-6R
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Oct 2009 21:06:54 +0100
Received: by iwn28 with SMTP id 28so2494436iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2009 13:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=EmkomWKqWWnwnIhk++nZawoCv47ZxF3jXuClkKam9oA=;
	b=cA0Lbkqow/Pi5qW2veyGSRaRRWw5i83Kc90U7rmevDR6XLd11w2TGcJkj0rZhzY97M
	lDh1hKbA03QvT0uRmwG6EnNOswvM77Wt/nx/ZW11MfM+Sv20YipnxNeOdpYtBpccEOTI
	TWjrqf9cwe6IzqHJpnB0rPTAO7lHoO/kKLoZ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=i1rMjD0z+FXH1b2YNGGwXp8Vk0G6bDkvLAwsJGvgtL+avcnq2QoxJHcAqpbT0K9SQT
	tTWASl+L+e+TIYWTJKc7jNKnPElAHpYWFOBxWiu383MjoPHvJGAb0mw3QSMmpKMeW8LA
	neZNl/9O4Q0R+cMSML4/NMp7VWGg6vQ8upugw=
MIME-Version: 1.0
Received: by 10.231.25.29 with SMTP id x29mr4311533ibb.31.1256933141067; Fri, 
	30 Oct 2009 13:05:41 -0700 (PDT)
In-Reply-To: <4AEB0638.5070700@dresearch.de>
References: <4AE830DE.5030209@dresearch.de>
	<19c1b8a90910291529m56c2af1fvaa56dc17a657044f@mail.gmail.com>
	<4AEB0638.5070700@dresearch.de>
Date: Fri, 30 Oct 2009 13:05:40 -0700
Message-ID: <19c1b8a90910301305w57559452n824ffeb11a45b68b@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.190
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Fri, 30 Oct 2009 20:06:54 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 30, 2009 at 8:28 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> On 10/29/2009 11:29 PM, Khem Raj wrote:
>>> After a long time i tried to build an initramfs image containing
>>> busybox-static which fails to link (besides some warnings) with these
>>> errors:
>>>
>>> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:189:
>>> undefined reference to `__cpu_to_be16'
>>> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:190:
>>> undefined reference to `__cpu_to_be16'
>>> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:202:
>>> undefined reference to `__cpu_to_be16'
>>> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:214:
>>> undefined reference to `__cpu_to_be16'
>>> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:224:
>>> undefined reference to `__cpu_to_be16'
>>> networking/libiproute/lib.a(iptunnel.o):/home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:225:
>>> more undefined references to `__cpu_to_be16' follow
>>>
>>> This is really obscure for me because i can't identify the code lines
>>> responsible for them. :(
>>
>> you need this kernel patch here
>> http://lkml.org/lkml/2009/6/18/223
>
> This fixes the missing include inside the kernel. My patch suggestion
> adds the missing include inside busybox. I would prefer the kernel
> patch. Any objections?

This patch have not been applied in kernel upstream yet. So it would
be nice to get
an idea if this will be pushed upstream or not. Otherwise patching
busybox will be
right thing to do. May be you can ping the author of kernel patch to
retry to push
it

Thanks

-Khem

>
> Steffen
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


