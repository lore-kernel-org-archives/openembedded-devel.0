Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JXlW1-0005OJ-EE
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Mar 2008 23:58:15 +0100
X-ASG-Debug-ID: 1204930595-6d7400940000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 778F910D16
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2008 16:56:36 -0600 (CST)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id gJcKDeHyTFpURGkw for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 07 Mar 2008 16:56:36 -0600 (CST)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] AVR32 + OpenEmbedded: Problems
	=?iso-8859-1?q?with=09uclibc-initial=09do=5Fpopulate=5Fstaging?=
	()
Date: Fri, 7 Mar 2008 16:56:41 -0600
User-Agent: KMail/1.9.7
References: <200803051349.39583.geoffrey@pager.net>
	<200803051458.03954.geoffrey@pager.net>
	<1204754380.8110.186.camel@dax.rpnet.com>
In-Reply-To: <1204754380.8110.186.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200803071656.41738.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1204930596
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AVR32 + OpenEmbedded: Problems with	uclibc-initial	do_populate_staging ()
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
X-List-Received-Date: Fri, 07 Mar 2008 22:58:15 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 05 March 2008 03:59:40 pm Richard Purdie wrote:

> Which distro and machine are you using? This sounds like something which
> isn't using sysroot or the sysroot workarounds.
>
> Poking around cross hasn't been needed for a while and instead of the
> above, building "cross-linkage" might help. This was removed from the
> linux-libc-headers DEPENDS recently. You may also need
> "staging-linkage", it all depends on the compiler though and if its
> sysroot capable, enabling that would be infinitely preferable.

So much for blaming Atmel for their ld patch.  I think I found the REAL 
problem.

Checking the log.do_configure for gcc-cross-initial, --with-sysroot was NOT 
getting passed to gcc's configure script.

So I started parsing gcc-cross-initial_4.1.2.bb by hand.  Here's what it looks 
like is happening to me.  Eventually, gcc3-build-cross.inc gets required in. 
This file will set EXTRA_OECONF to have the "--with-sysroot" option.  But a 
little later, gcc-cross-initial.inc gets required in.  This file resets 
EXTRA_OECONF, so the "--with-sysroot" option added by gcc3-build-cross.inc 
gets lost.

I attempted to just swap the order of "require gcc-cross_${PV}.bb" 
and "require gcc-cross-initial.inc" in gcc-cross-initial_4.1.2.bb.  Doing 
a "bitbake -c rebuild gcc-cross-initial" built the gcc-cross-initial with the 
proper "--with-sysroot" option.  Hooray!  But then when I tried to resume 
building the image, this swap made the overall build system think 
that "avr32-gcc-initial-4.1.2" wasn't available.  Back to the drawing board.

So then I changed gcc-cross-initial.inc to append onto EXTRA_OECONF instead of 
setting EXTRA_OECONF.  This seems to work for me now, although I don't know 
what other implications this change may have.

Comments?

---
Geoffrey




