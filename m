Received: from [66.111.4.26] (helo=out2.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded-devel@lists.futaris.org>)
	id 1JcDrw-0002ld-I8 for openembedded-devel@lists.openembedded.org;
	Thu, 20 Mar 2008 07:03:18 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id C54A8D84BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2008 02:03:15 -0400 (EDT)
Received: from web7.messagingengine.com ([10.202.2.216])
	by compute1.internal (MEProxy); Thu, 20 Mar 2008 02:03:15 -0400
Received: by web7.messagingengine.com (Postfix, from userid 99)
	id A26374E588; Thu, 20 Mar 2008 02:03:15 -0400 (EDT)
Message-Id: <1205992995.25920.1243400709@webmail.messagingengine.com>
X-Sasl-Enc: mx7rbDspxXerZl91ZJiXlIFjQeIMbwE/QH7RN/iePOv+ 1205992995
From: "Hasjim Williams" <openembedded-devel@lists.futaris.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
References: <1204494435.17068.23.camel@utx.utx.cz> <fqg9c0$g00$1@ger.gmane.org>
In-Reply-To: <fqg9c0$g00$1@ger.gmane.org>
Date: Thu, 20 Mar 2008 16:03:15 +1000
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: openembedded-devel@lists.futaris.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: iwmmxt optimization and soft float in OE on PXA270
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
X-List-Received-Date: Thu, 20 Mar 2008 06:03:19 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ISO-8859-1"


On Mon, 03 Mar 2008 08:29:04 +0100, "Koen Kooi"
<koen@dominion.kabel.utwente.nl> said:
> Stanislav Brabec schreef:
> 
> | It should be the best possible optimization for PXA270 (compiled for
> | iwmmxt, use soft float instead of exception based kernel driver, use
> -Os
> | to make binaries as small as possible and add optimizations from -O3).
> 
> Angstrom already enables softfloat (for FPU-less systems) and -Os by
> default *and* enables iwmmxt (if you have MACHINE_FEATURES = "iwmmxt")
> for apps which have been proven to benefit from iwmmxt (e.g. mplayer).
> 
> I still get mysterious segfaults when running an all iwmmxt glibc system
> (uclibc is even worse), so I don't think flipping the global switch is a
> good idea.

You won't be able to use iwmmxt with everything.  The unwind / exception
support for iwxmmt isn't there in gcc.  Anything using C++ exceptions
won't work correctly.

infocenter.arm.com/help/topic/com.arm.doc.ihi0038a/IHI0038A_ehabi.pdf
explains about the unwind / exceptions.

This is also one of the issues that Cirrus's MaverickCrunch currently
has.

The only ARM coprocessor that is fully supported (by gcc) is VFP.  

In summary, we'd have to modify:
gcc/config/arm/pr-support.c
gcc/config/arm/unwind-arm.h
gcc/config/arm/unwind-arm.c

for proper iwmmxt Unwind_VRS_Pop support.

NB, I'm the guy that has done the MaverickCrunch gcc patches...

I could write/test these patches, I guess, but the only PXA270 machine
that I have access to is a HTC Magician (XDA Mini).

Hasjim Williams


