Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MvtHR-0007IF-4i
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Oct 2009 15:43:45 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MvtGS-0006H3-Vp
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Oct 2009 14:42:41 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MvtGQ-0004Yk-RS
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Oct 2009 14:42:38 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200910081523.06229.holger+oe@freyther.de>
References: <20091008125302.GE10797@xora.vm.bytemark.co.uk>
	<200910081523.06229.holger+oe@freyther.de>
Date: Thu, 08 Oct 2009 14:42:35 +0100
Message-Id: <1255009355.6355.4.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert Request for linux -> linux-gnu changes
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
X-List-Received-Date: Thu, 08 Oct 2009 13:43:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-10-08 at 15:23 +0200, Holger Hans Peter Freyther wrote:
> As hard as it is. I agree that it should be backed out and put in a branch and 
> tested on non EABI systems. We find new regressions every day.

Yes, I agree.  It isn't even completely obvious to me that this change
has a great deal of merit.  As I wrote in:

http://lists.linuxtogo.org/pipermail/openembedded-devel/2009-September/013577.html

it doesn't seem as if switching TARGET_OS from "linux" to "linux-gnu"
brings any benefits other than trivial cosmetic ones, and it is a shame
to break everybody's builds just for that.

So, personally, I would be tempted to just revert it and leave it
reverted rather than burning a lot of manpower on trying to make
"linux-gnu" work for everybody at once.  If individual DISTROs want to
switch to linux-gnu then they are obviously welcome to do so and pick up
the pieces for themselves.

p.




