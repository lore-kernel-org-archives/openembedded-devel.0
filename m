Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QBXHu-0006mi-Gt
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 21:05:38 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJT00MA78X363S0@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	17 Apr 2011 14:03:08 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id F2CED14AF5B; Sun,
	17 Apr 2011 15:03:02 -0400 (EDT)
Date: Sun, 17 Apr 2011 15:03:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110417190302.GD4068@denix.org>
References: <20110414193436.GA26286@denix.org> <4DAA505E.4000305@mentor.com>
	<ioe35g$lb4$1@dough.gmane.org> <4DAB2CEC.1030008@mentor.com>
	<20110417182117.GB4068@denix.org> <iofd1t$oat$1@dough.gmane.org>
MIME-version: 1.0
In-reply-to: <iofd1t$oat$1@dough.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [2011.03-maintenance] Pull request for TI matrix-gui, ipc	and sgx/gles
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
X-List-Received-Date: Sun, 17 Apr 2011 19:05:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Apr 17, 2011 at 08:54:53PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 17-04-11 20:21, Denys Dmytriyenko wrote:
> > On Sun, Apr 17, 2011 at 11:09:48AM -0700, Tom Rini wrote:
> >> On 04/17/2011 12:00 AM, Koen Kooi wrote:
> >>> On 17-04-11 04:28, Tom Rini wrote:
> >>>> On 04/14/2011 12:34 PM, Denys Dmytriyenko wrote:
> >>>>> Tom,
> >>>
> >>>>> Please pull these 5 commits for TI related changes - matrix-gui rev bump,
> >>>>> new ti-ipc version and sgx/gles fixes for ti816x.
> >>>>> All are cherry picked from oe.dev
> >>>
> >>>
> >>>>> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
> >>>>>   Branch: 2011.03-maintenance
> >>>>>   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
> >>>
> >>>>> Thanks,
> >>>>>     Denys Dmytriyenko <denys@ti.com>
> >>>
> >>>> Applied, thanks.
> >>>
> >>> Tom, can you please unmerge it? The SGX commit is bogus, I have already
> >>> asked Denys to revert it from .dev. I do not want crap like that in
> >>> maintenance.
> >>
> >> All of the parts of the merge or just a specific one?
> > 
> > Tom,
> > 
> > Can we hold off with unmerging/reverting for now? I'm trying to understand the 
> > damage level and see the best course of action... But the commit in question 
> > is "ligles-omap3: Remove SGX Fixup for TI816x"
> 
> Right, only the "ligles-omap3: Remove SGX Fixup for TI816x" needs to get
> reverted.
> 
> > 
> > Koen,
> > 
> > I replied to your email. Please let me know if you still prefer the complete 
> > revert or if it can be worked around, as it still works, while may not be 
> > optimal, and doesn't break anything else. Thanks.
> 
> As I said in my response to the patch:
> 
> - ------
> So, I'm back from travelling now and I'll have to NAK this patch:
> 
> 1) it assumes netra will never have an sgx core update and makes it
> diverge from the other platforms.
> 
> 2) it adds a useless 2 second boot delay
> 
> So the net result is a harder to maintain slower version of the scripts,
> which is not acceptable.
> - ------
> 
> So I'd very much like to get this patch reverted both from .dev and
> 2011.03-maintenance. Especially considering I'm the actual maintainer
> for that recipe.
> 
> For fun, try booting on omap3 and moving the SD to netra and see what
> happens. This is what we do at the office and customers do as well.

Ok, I'll revert this specific patch from .dev

Tom,

Please go ahead and unmerge/revert it from the 2011.03-maintenance. Sorry for 
the inconvenience.

Sid,

Please resubmit the patch with the above issues fixed. Thanks.

-- 
Denys


