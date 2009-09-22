Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MqAAx-0000Kj-Io
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 20:33:22 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQD00KCBY5H67R5@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	22 Sep 2009 13:32:18 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D526814AF5F; Tue,
	22 Sep 2009 14:32:04 -0400 (EDT)
Date: Tue, 22 Sep 2009 14:32:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090922183204.GB18271@denix.org>
References: <1253549226-16186-1-git-send-email-denis@denix.org>
	<1253562306.16477.38.camel@lenovo.internal.reciva.com>
	<20090921223956.GF3599@denix.org>
	<1253626112.16477.58.camel@lenovo.internal.reciva.com>
	<20090922164252.GA18271@denix.org>
	<1253642412.16477.75.camel@lenovo.internal.reciva.com>
MIME-version: 1.0
In-reply-to: <1253642412.16477.75.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] netbase: don't start udhcpc if kernel	assigned IP statically
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
X-List-Received-Date: Tue, 22 Sep 2009 18:33:22 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 22, 2009 at 07:00:12PM +0100, Phil Blundell wrote:
> On Tue, 2009-09-22 at 12:42 -0400, Denys Dmytriyenko wrote:
> > On Tue, Sep 22, 2009 at 02:28:32PM +0100, Phil Blundell wrote:
> > > On Mon, 2009-09-21 at 18:39 -0400, Denys Dmytriyenko wrote:
> > > > On Mon, Sep 21, 2009 at 08:45:06PM +0100, Phil Blundell wrote:
> > > > > It seems like there must be a better way of solving this problem.  How
> > > > > about just teaching "ifup -a" to spot interfaces that are already up and
> > > > > leave them alone?
> > > > 
> > > > Won't work for the case of kernel-acquired DHCP address, i.e. kernel level 
> > > > autoconfig, aka IP_PNP, aka ip=dhcp command line.
> > > 
> > > True, but your original patch won't help with this situation either
> > > (since "ip=dhcp" won't match the regex).  I think this is a different
> > 
> > Not true. The default is to start udhcpc always. I just cover one case to 
> > prevent it from starting when ip=x.x.x.x
> 
> Right, but as you said in your other mail, in the case where the kernel
> has already claimed a dhcp lease you want to start udhcpc with different
> arguments to the usual ones.  So, although your original patch
> admittedly doesn't make that situation any worse, it also doesn't make
> it much better either.

Correct. As I was thinking on adding the check for kernel acquired DHCP lease 
somewhere inside the udhcpc code or script, it appears to be quite independent 
from this patch to pre-up...

> I still think that this:
> 
> > > problem and probably requires a different solution: the ideal thing
> > > would be for the kernel to set a flag on the interface to say that it
> > > needs to be taken over by a DHCP client, or alternatively to invoke the
> > > DHCP client itself via the hotplug mechanism.  Failing that you could
> > > arrange for the startup scripts to poke around at /proc/cmdline and try
> > > to second-guess what the kernel has done, although that would be rather
> > > less satisfactory.
> 
> together with the thing I mentioned earlier, is the right way to solve
> this kind of issue in general.  
> 
> Poking at /proc/cmdline from the pre-up command has another downside as
> well, namely that if you bring the interface down it will then be
> impossible to get it back up again because the command line will still
> have the "ip=" bits in it even though they are no longer relevant.

Fair enough, I will try to figure out a better way of fixing it for all the 
possible cases... Thanks.

-- 
Denys


