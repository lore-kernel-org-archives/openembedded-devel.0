Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1N1HKk-0007pI-Uo
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 12:25:26 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1N1HJf-0005nC-LC
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 11:24:16 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1N1HJd-00041s-MT
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 11:24:13 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200910231154.22284.holger+oe@freyther.de>
References: <200910230504.57681.holger+oe@freyther.de>
	<200910231133.11053.holger+oe@freyther.de> <hbru1e$m80$1@ger.gmane.org>
	<200910231154.22284.holger+oe@freyther.de>
Date: Fri, 23 Oct 2009 11:24:09 +0100
Message-Id: <1256293449.4529.133.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Fri, 23 Oct 2009 10:25:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-10-23 at 11:54 +0200, Holger Hans Peter Freyther wrote:
> On Friday 23 October 2009 11:46:22 Koen Kooi wrote:
> 
> > > and I would prefer to have debug symbols in there. you can always strip
> > > them out of the final binary but you can not add them when they are gone.
> > 
> > Installing foo-dbg doesn't work?
> 
> It will not. At least from my understanding of an .a archive. You will need to 
> get the symbols into the binary when statically linking, this will not happen 
> when they are in a .debug/liba.a.
> 
> Does this sound correct?

Yes, that is correct.  In theory it would be possible to splice the
debug data back into the binary, or to teach gdb how to read debug
symbols out of the individual .debug records for the archive components,
or indeed to teach g(o)ld to pull in debug data in the way that you
suggest during final link of a binary, but I don't think the existing
tools can do any of those things.

p.




