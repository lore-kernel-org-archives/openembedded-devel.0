Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1IVLT8-0006rr-6h
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 08:12:58 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B02FDA1B1 for openembedded-devel@openembedded.org;
	Wed, 12 Sep 2007 08:08:40 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Wed, 12 Sep 2007 09:09:47 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHMEOAMDAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
In-Reply-To: <9870FB9891C7AD4B910E20B14776DF850104187B@NAEX16.na.qualcomm.com>
Importance: Normal
Subject: Re: bootstrap-image boot error: Inconsistency detected by ld.so:dynamic_link.h...
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2007 06:12:58 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mike,
Looks like a busybox problem
What distro and busybox version are you using ?

Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org 
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of 
> DeVico, Michael
> Sent: Tuesday, September 11, 2007 10:36 PM
> To: openembedded-devel@openembedded.org
> Subject: [oe] bootstrap-image boot error: Inconsistency detected 
> by ld.so:dynamic_link.h...
> 
> 
> Hello,
> 
>  
> 
> This is more than likely a configuration/environment setup issue rather
> that a bug, so I'm posting it here
> 
> rather than filing a bug for now...
> 
>  
> 
> I built the bootstrap-image using the angstrom-2007.1 distro and the
> i686-generic machine definition.
> 
> My build host is running Fedora FC7 and the processor is an Intel Core 2
> Duo.
> 
>  
> 
> However, when I try to boot, the kernel progresses through the device
> hw/driver initialization and 
> 
> successfully mounts  the rootfs, but then fails with the following error
> message:
> 
>  
> 
> Inconsistency detected by ld.so: dynamic_link.h: 179
> elf_get_dynamic_info: Assertion 'Info[15] == ((void*)0)' failed!
> 
>  
> 
> If I point it to a partition containing the helloworld root fs, it
> prints "Hello World" as expected, so it would
> 
> appear to be a problem with the bootstrap image rootfs rather than the
> kernel itself, but this is my first 
> 
> experience building a linux system from the ground up so I could
> definitely use some help here.
> 
>  
> 
> Any ideas?
> 
>  
> 
> Thanks in advance!
> 
> --Mike
> 
>  
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



