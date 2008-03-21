Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Jcq6g-0007J2-DG
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Mar 2008 23:53:02 +0100
Received: by wa-out-1112.google.com with SMTP id l24so2458400waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2008 15:52:59 -0700 (PDT)
Received: by 10.114.78.1 with SMTP id a1mr6910003wab.36.1206139979381;
	Fri, 21 Mar 2008 15:52:59 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Fri, 21 Mar 2008 15:52:59 -0700 (PDT)
Message-ID: <19c1b8a90803211552gdc8ed5cr3c9b3f55528c1e8b@mail.gmail.com>
Date: Fri, 21 Mar 2008 15:52:59 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1206051256.5975.1243541279@webmail.messagingengine.com>
MIME-Version: 1.0
References: <1204494435.17068.23.camel@utx.utx.cz> <fqg9c0$g00$1@ger.gmane.org>
	<1205992995.25920.1243400709@webmail.messagingengine.com>
	<1206017175.4700.8.camel@hammer.suse.cz>
	<1206051256.5975.1243541279@webmail.messagingengine.com>
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
X-List-Received-Date: Fri, 21 Mar 2008 22:53:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Mar 20, 2008 at 3:14 PM, Hasjim Williams
<openembedded-devel@lists.futaris.org> wrote:
>
>  On Thu, 20 Mar 2008 13:46:15 +0100, "Stanislav Brabec" <utx@penguin.cz>
>  said:
>
> > Hasjim Williams wrote:
>  >
>  > > You won't be able to use iwmmxt with everything.  The unwind / exception
>  > > support for iwxmmt isn't there in gcc.  Anything using C++ exceptions
>  > > won't work correctly.
>  >
>  > So plain C binaries (e. g. kernel) are OK? And
>  > c++ -march=iwmmxt -fno-exceptions as well?
>
>  You can try this for C++ with -fno-exceptions, but I've never tried
>  it...
>
>
>  > > I could write/test these patches, I guess, but the only PXA270 machine
>  > > that I have access to is a HTC Magician (XDA Mini).
>  >
>  > It would be very nice. I could test them on my Zaurus, if you send me
>  > some C++ testcase (or name of application to test it on).
>
>  It'd be good if you could run the tests, before we generate the
>  patches...
>
>  gcc has a built in testcase system, dejagnu:
>  http://lists.gnu.org/archive/html/dejagnu/2006-04/msg00008.html explains
>  how to set it up and run it.
>  http://gcc.gnu.org/onlinedocs/libstdc++/test.html and
>
>  e.g. FROM:
>  openembedded/build/tmp/work/armv4t-angstrom-linux-gnueabi/gcc-cross-4.1.2-r13/gcc-4.1.2/build.i686-linux.arm-angstrom-linux.arm-angstrom-linux-gnueabi
>  $ make check-gcc RUNTESTFLAGS="normal.exp --target_board=pxa270-linux"
>
>  I think the C++ support you're looking to test is in "normal.exp" .  You
>  should get a gcc.log and gcc.sum at the end, saying what tests
>  passed/failed.
>
>  $ make check
>  Will do a complete test of everything, and will probably take at least 8
>  hrs - day on a pxa270, I would think.
>
>  You'll only need dropbear or some other ssh server, so even a
>  minimal-image should be enough on your pxa27x machine.

yeah and also setup a passwordless entry into the target from host.
Otherwise it will ask for password everytime
it wants to talk to target. Dropbear asks for return carriage key for
empty passwords too. I havent figured to disable that
openssh works.

Khem


