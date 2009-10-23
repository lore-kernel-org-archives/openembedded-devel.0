Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N1FeF-0001G5-Fb
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 10:37:26 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N1FdE-00034U-Es
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 09:36:20 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1N1FdE-00037R-5q
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 09:36:20 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200910231023.43911.holger+oe@freyther.de>
References: <200910230504.57681.holger+oe@freyther.de>
	<200910230930.00314.holger+oe@freyther.de> <hbrnn4$1kd$1@ger.gmane.org>
	<200910231023.43911.holger+oe@freyther.de>
Date: Fri, 23 Oct 2009 09:36:16 +0100
Message-Id: <1256286976.4529.117.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
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
X-List-Received-Date: Fri, 23 Oct 2009 08:37:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-10-23 at 10:23 +0200, Holger Hans Peter Freyther wrote:
> One thing that pops back into my mind is to move .a files into a -static 
> package? People that want to link statically can pick their .a files.

Yes, I think someone else proposed this a few weeks ago but it doesn't
seem to have happened.  Given that static linking is pretty much a
minority pursuit nowadays (excepting libc_noshared.a) this sounds like a
fine idea.

Stripping .a files with the default options will effectively destroy
them so the current state of affairs is definitely silly.  If you are
going to do that then you might as well just delete the files: they are
no use for anything after stripping.

An alternative (or an addition) to the -static packaging would be to
arrange for .a files (and .o files, I guess) to be stripped with "strip
--strip-debug" (or perhaps --strip-unneeded).  This should leave enough
symbol data in the files for them to remain usable.  

p.




