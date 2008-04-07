Received: from [195.170.0.93] (helo=aiolos.otenet.gr ident=OTEnet-mail-system)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <skoroneos@digital-opsis.com>) id 1Jivcg-00048m-Rn
	for openembedded-devel@openembedded.org; Mon, 07 Apr 2008 19:59:15 +0200
Received: from dias (athedsl-313440.home.otenet.gr [85.72.79.254])
	by aiolos.otenet.gr (8.13.8/8.13.8/Debian-3) with ESMTP id
	m37HxD8J010059 for <openembedded-devel@openembedded.org>;
	Mon, 7 Apr 2008 20:59:13 +0300
Message-Id: <200804071759.m37HxD8J010059@aiolos.otenet.gr>
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Mon, 7 Apr 2008 20:58:42 +0300
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook, Build 11.0.5510
In-Reply-To: <200804070954.12162.geoffrey@pager.net>
Thread-Index: AciYwMGkgo0JA/EmQL+r6jMEa9BneAAF4Zuw
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3198
Subject: Re: Building multiple gdb-cross targets
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
X-List-Received-Date: Mon, 07 Apr 2008 17:59:15 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I think you are missing the point

"bare-metal" gdb does not have any bindings with
glibc/uclibc/eglibc/whatever-libc because its (usually) used to build a
system with no OS (standalone apps).
You also need a "bare-metal" toolchain i.e toolchain that generates code
that can run on the board without any OS (this was the case in most embedded
designs before linux become "embedded")


Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com
 

> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org 
> [mailto:openembedded-devel-bounces@openembedded.org] On 
> Behalf Of Geoffrey Wossum
> Sent: Monday, April 07, 2008 5:54 PM
> To: openembedded-devel@openembedded.org
> Subject: Re: [oe] Building multiple gdb-cross targets
> 
> On Friday 04 April 2008 01:46:08 pm Geoffrey Wossum wrote:
> 
> > It was easy enough to build the bare metal debugger outside 
> OE.  Just 
> > seems like you should be able to build this with OE, too.  It seems 
> > like it might need a separate .bb file to pull it off.  Not exactly 
> > sure how you'd force bitbake to use a different target 
> setting.  Maybe 
> > setting the TARGET_OS to be blank in the bitbake file?
> 
> Copied gdb-cross_x.x.bb to gdb-baremetal_x.x.bb.  Added a line:
> TARGET_SYS_avr32 = "avr32"
> 
> That actually seemed to work.
> 
> ---
> Geoffrey
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



