Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N1OrM-00029W-K2
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 20:27:35 +0200
Received: from gandalf.denix.org ([71.251.63.147]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KRZ006D4CJK2SS2@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	23 Oct 2009 13:26:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8EAE314AF60; Fri,
	23 Oct 2009 14:26:08 -0400 (EDT)
Date: Fri, 23 Oct 2009 14:26:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091023182608.GB28604@denix.org>
References: <200910230504.57681.holger+oe@freyther.de>
	<200910230930.00314.holger+oe@freyther.de> <hbrnn4$1kd$1@ger.gmane.org>
	<200910231023.43911.holger+oe@freyther.de>
	<1256286976.4529.117.camel@mill.internal.reciva.com>
MIME-version: 1.0
In-reply-to: <1256286976.4529.117.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
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
X-List-Received-Date: Fri, 23 Oct 2009 18:27:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 23, 2009 at 09:36:16AM +0100, Phil Blundell wrote:
> On Fri, 2009-10-23 at 10:23 +0200, Holger Hans Peter Freyther wrote:
> > One thing that pops back into my mind is to move .a files into a -static 
> > package? People that want to link statically can pick their .a files.
> 
> Yes, I think someone else proposed this a few weeks ago but it doesn't
> seem to have happened.  Given that static linking is pretty much a
> minority pursuit nowadays (excepting libc_noshared.a) this sounds like a
> fine idea.

I was the one who brought this up few weeks ago - but unfortunately I couldn't 
find enough time to invest in the solution of moving .a files into -static 
subpackages. I ended up just using Koen's fix for now, which worked for the 
external toolchain, as there are no _nonshared libs there...

-- 
Denys


