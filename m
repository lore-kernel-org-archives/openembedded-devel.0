Received: from [195.170.0.94] (helo=rosebud.otenet.gr ident=OTEnet-mail-system)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <skoroneos@digital-opsis.com>) id 1JZX2X-0004US-6p
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 20:55:12 +0100
Received: from dias (athedsl-387391.home.otenet.gr [79.131.65.61])
	by rosebud.otenet.gr (8.13.8/8.13.8/Debian-3) with ESMTP id
	m2CJqwGG032458 for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 21:52:59 +0200
Message-Id: <200803121952.m2CJqwGG032458@rosebud.otenet.gr>
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Wed, 12 Mar 2008 21:52:36 +0200
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook, Build 11.0.5510
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3198
In-Reply-To: <47D774A4.3040207@linuxdevelopment.de>
thread-index: AciECRJ/j0DWAwgVROOX0dbIMd3hzwAb80gg
X-SA-Exim-Connect-IP: 195.170.0.94
X-SA-Exim-Mail-From: skoroneos@digital-opsis.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Stuck with AVR32 segfaults in init
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
X-List-Received-Date: Wed, 12 Mar 2008 19:55:12 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

FYI I won't be able to even look at avr32/OE for at least a month a half and
Koen's stk1000 is in my office waiting to be unbricked :(
With the amount (and type) of changes going into .dev these days it would
have been a miracle if something was working without problems.
Probably this could also be connected to the SCM issue but I think it would
be wise in the future, to create separate branches when these kind of
"infrastacture" changes are to be pushed to OE, so they could be tested
before been merged with .dev.


Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com
 

> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org 
> [mailto:openembedded-devel-bounces@openembedded.org] On 
> Behalf Of Robert Worle
> Sent: Wednesday, March 12, 2008 8:14 AM
> To: openembedded-devel@openembedded.org
> Cc: openembedded-devel@openembedded.org
> Subject: Re: [oe] Stuck with AVR32 segfaults in init
> 
> 
> > 
> > If you take an OE binary and run it within a working 
> filesystem from 
> > whereever, what happens? If it segfaults there you may be able to 
> > debug it. If it doesn't, try copying libs from OE into that system 
> > until it breaks? That should at least tell you where the problem is.
> 
> Dear all
> I was starting a oe build the day koen announced the merge 
> and it went with some obstacles and finished the major libs 
> nicely but i cant tell what i had to do to get past the uclibc parts.
> 
> I did then get a 0.9.28 based libs and apps which i now merge 
> with a atmel bsp kernel and uClibc.
> So i can now run all oe libs ( beside uClibc) with that and 
> it feels wonderful. I am currently running the ngw100 with a 
> 5.7 lcd attached and can get up a Xfbdev + gtk+ + x11vnc 
> within the nand and nor ( totale of
> 16 mb)  Hurray the power if footprinting of oe !!
> 
> 
> But i am also stuck now redoing this and rebuilding a new oe 
> toolchain for avr32 . I cant get pass the external-toolchain 
> ERROR mentioned in some earlier mails.
> I tried both oe uclibc 0.9.28 and 0.9.29 So i now have one 
> tool chain up and running and i can go on to develop my 
> target application but nobody is allowed to touch my laptop 
> with that toolchain or he dies !!
> 
> Maybe we need some of the guru`s here to help us poor avr32 
> small users to get the basic oe toolchain up and running and 
> stable at least for the ucLibc part.
> 
> Robert
> >
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 




