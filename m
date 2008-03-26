Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded-devel@lists.futaris.org>)
	id 1JeKc3-0000Hr-Nd for openembedded-devel@lists.openembedded.org;
	Wed, 26 Mar 2008 02:39:35 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 4DC6FE3E0B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2008 21:39:35 -0400 (EDT)
Received: from web7.messagingengine.com ([10.202.2.216])
	by compute1.internal (MEProxy); Tue, 25 Mar 2008 21:39:35 -0400
Received: by web7.messagingengine.com (Postfix, from userid 99)
	id 0E1953F708; Tue, 25 Mar 2008 21:39:35 -0400 (EDT)
Message-Id: <1206495575.1924.1244289243@webmail.messagingengine.com>
X-Sasl-Enc: Nj5U2KA1fQ65Q8N24Z/s0kaC0ZoPDE5tsxe/eybz44nG 1206495575
From: "Hasjim Williams" <openembedded-devel@lists.futaris.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
References: <1204494435.17068.23.camel@utx.utx.cz> <fqg9c0$g00$1@ger.gmane.org>
	<1205992995.25920.1243400709@webmail.messagingengine.com>
	<1206017175.4700.8.camel@hammer.suse.cz>
	<1206051256.5975.1243541279@webmail.messagingengine.com>
	<1206295294.6914.7.camel@utx.utx.cz>
In-Reply-To: <1206295294.6914.7.camel@utx.utx.cz>
Date: Wed, 26 Mar 2008 11:39:35 +1000
Subject: Re: iwmmxt optimization on PXA270 (dejagnu test report)
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
X-List-Received-Date: Wed, 26 Mar 2008 01:39:36 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ISO-8859-1"


On Sun, 23 Mar 2008 19:01:33 +0100, "Stanislav Brabec" <utx@penguin.cz>
said:

> I tested gcc-4.2.2-r6 with -march=iwmmxt -mcpu=iwmmxt -mtune=iwmmxt on
> my image compiled for iwmmxt.
> 
> Results seems to be promising. 99.99% tests passed. Results for Fortran
> are invalid (I had not libgfortran in the system). Surprisingly, all
> g++.dg/eh (exception handling) tests PASSed.

I was a bit surprised that all the exception handling tests PASSed, but
then I realised that there is no code to test exceptions on iwmmxt in
that directory:

tmp/work/ep9312-angstrom-linux-gnueabi/gcc-cross-4.2.2-r6/gcc-4.2.6/gcc/testsuite/g++.dg/eh/

The only unwind tester is arm-vfp-unwind.C , which is for the VFP
coprocessor and floats, doubles, etc on VFP.

iwmmxt should make use of uint64 / uint32, and simd .  I think simd-1 &
simd-2 are only run for x86 machines with MMX.  We probably need
something similar to test the popping of iwmmx data/control registers.

I suspect we may need to write a quick test app to check for this error
/ testcase...

The other reason why some iwmmxt compiled apps are segfaulting is that
something in iwmmxt support is missing.  Whilst the gcc testcases cover
most of the major tests, sometimes we need to add extra test cases for
100% test visibility.  I suspect that if gcc tries to do a
Unwind_VRS_Pop and get the NOT_IMPLEMENTED signal, it causes the
segfault.

Not sure if there are many extra bugs introduced by compiling for iwmmxt
vs armv5t, but I suspect this is the only "major" one.  It would be good
if someone has already done these tests (or arm/armv5), so we can do a
simple diff against the files to see what regression there is for
iwmmxt...


