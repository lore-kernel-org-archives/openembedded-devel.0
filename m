Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JdUVj-00068e-Ll
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Mar 2008 19:01:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 6C3581417186
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Mar 2008 19:00:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22Erexqi-5VI
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Mar 2008 19:00:00 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id EC31E1416BC5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Mar 2008 18:59:59 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1206051256.5975.1243541279@webmail.messagingengine.com>
References: <1204494435.17068.23.camel@utx.utx.cz> <fqg9c0$g00$1@ger.gmane.org>
	<1205992995.25920.1243400709@webmail.messagingengine.com>
	<1206017175.4700.8.camel@hammer.suse.cz>
	<1206051256.5975.1243541279@webmail.messagingengine.com>
Date: Sun, 23 Mar 2008 19:01:33 +0100
Message-Id: <1206295294.6914.7.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
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
X-List-Received-Date: Sun, 23 Mar 2008 18:01:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hasjim Williams wrote:
> On Thu, 20 Mar 2008 13:46:15 +0100, "Stanislav Brabec"
> <utx@penguin.cz>
> said:

> > > I could write/test these patches, I guess, but the only PXA270 machine
> > > that I have access to is a HTC Magician (XDA Mini).
> > 
> > It would be very nice. I could test them on my Zaurus, if you send me
> > some C++ testcase (or name of application to test it on).
> 
> It'd be good if you could run the tests, before we generate the
> patches... 

I tested gcc-4.2.2-r6 with -march=iwmmxt -mcpu=iwmmxt -mtune=iwmmxt on
my image compiled for iwmmxt.

Results seems to be promising. 99.99% tests passed. Results for Fortran
are invalid (I had not libgfortran in the system). Surprisingly, all
g++.dg/eh (exception handling) tests PASSed.

Profiling tests has some problems - file is generated with different
suffix than expected.

Details:

                === gcc Summary ===
# of expected passes            40740
# of unexpected failures        15
  It consists of (my guess):
  probably real failure         4 (1 file, 4 flags)
  missing file in testsuite     11
# of expected failures          84
# of unresolved testcases       23
# of untested testcases         28
# of unsupported tests          394

                === g++ Summary ===
# of expected passes            13403
# of unexpected failures        20
  It consists of (my guess):
  missing file in testsuite     14
  internal compiler error       4 (2 errors, 2 subsequent failures)
  probably real failure         2
# of unexpected successes       1
# of expected failures          66
# of unresolved testcases       28
# of unsupported tests          133

For complete report see:
http://www.penguin.cz/~utx/zaurus/temp/testsuite/

I may re-run tests for armv5 to see whether there is any regression for
iwmmxt.

> > The last missing thing - iwmmxt support in qemu - was already written by
> > Andrzej Zaborowski.
> 
> Is this "qemu-pxa270-and-more.patch" or is there something newer?  Has
> this been put into OE's buildtree?

It should be. But it seems, that in latest qemu-0.9.1, these patches are
present, but iwmmxt files are not compiled.

> NB, Not sure what you're using to profile the speedups, but there is:

I did not yet tried to profile the code. I only did measurements of
decoding time of video by MPlayer.


________________________________________________________________________

Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



