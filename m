Received: from [66.111.4.26] (helo=out2.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded-devel@lists.futaris.org>)
	id 1JcT1d-0004Ts-7g for openembedded-devel@lists.openembedded.org;
	Thu, 20 Mar 2008 23:14:19 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id C6315D9EBE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2008 18:14:16 -0400 (EDT)
Received: from web5.messagingengine.com ([10.202.2.214])
	by compute1.internal (MEProxy); Thu, 20 Mar 2008 18:14:16 -0400
Received: by web5.messagingengine.com (Postfix, from userid 99)
	id 931C0420D8; Thu, 20 Mar 2008 18:14:16 -0400 (EDT)
Message-Id: <1206051256.5975.1243541279@webmail.messagingengine.com>
X-Sasl-Enc: kXcxp2L0zPGiYgyCPL3nHklnazp83wijFD+7O33K2n46 1206051256
From: "Hasjim Williams" <openembedded-devel@lists.futaris.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
References: <1204494435.17068.23.camel@utx.utx.cz> <fqg9c0$g00$1@ger.gmane.org>
	<1205992995.25920.1243400709@webmail.messagingengine.com>
	<1206017175.4700.8.camel@hammer.suse.cz>
In-Reply-To: <1206017175.4700.8.camel@hammer.suse.cz>
Date: Fri, 21 Mar 2008 08:14:16 +1000
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: openembedded-devel@lists.futaris.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.3
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
X-List-Received-Date: Thu, 20 Mar 2008 22:14:19 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ISO-8859-1"


On Thu, 20 Mar 2008 13:46:15 +0100, "Stanislav Brabec" <utx@penguin.cz>
said:
> Hasjim Williams wrote:
> 
> > You won't be able to use iwmmxt with everything.  The unwind / exception
> > support for iwxmmt isn't there in gcc.  Anything using C++ exceptions
> > won't work correctly.
> 
> So plain C binaries (e. g. kernel) are OK? And
> c++ -march=iwmmxt -fno-exceptions as well?

You can try this for C++ with -fno-exceptions, but I've never tried
it...

> > I could write/test these patches, I guess, but the only PXA270 machine
> > that I have access to is a HTC Magician (XDA Mini).
> 
> It would be very nice. I could test them on my Zaurus, if you send me
> some C++ testcase (or name of application to test it on).

It'd be good if you could run the tests, before we generate the
patches... 

gcc has a built in testcase system, dejagnu:
http://lists.gnu.org/archive/html/dejagnu/2006-04/msg00008.html explains
how to set it up and run it.
http://gcc.gnu.org/onlinedocs/libstdc++/test.html and 

e.g. FROM:
openembedded/build/tmp/work/armv4t-angstrom-linux-gnueabi/gcc-cross-4.1.2-r13/gcc-4.1.2/build.i686-linux.arm-angstrom-linux.arm-angstrom-linux-gnueabi
$ make check-gcc RUNTESTFLAGS="normal.exp --target_board=pxa270-linux"

I think the C++ support you're looking to test is in "normal.exp" .  You
should get a gcc.log and gcc.sum at the end, saying what tests
passed/failed.

$ make check
Will do a complete test of everything, and will probably take at least 8
hrs - day on a pxa270, I would think.

You'll only need dropbear or some other ssh server, so even a
minimal-image should be enough on your pxa27x machine.
 
> The last missing thing - iwmmxt support in qemu - was already written by
> Andrzej Zaborowski.

Is this "qemu-pxa270-and-more.patch" or is there something newer?  Has
this been put into OE's buildtree?

NB, Not sure what you're using to profile the speedups, but there is:

gcov:
http://gcc.gnu.org/onlinedocs/gcc/Gcov.html#Gcov

and gprof:
http://www.gnu.org/software/binutils/manual/gprof-2.9.1/gprof.html


