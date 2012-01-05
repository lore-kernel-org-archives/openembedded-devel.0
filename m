Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RisIn-00064a-JV
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 19:44:38 +0100
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LXC0009D91L1J61@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	05 Jan 2012 12:37:03 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 561AA201BF; Thu,
	05 Jan 2012 13:36:57 -0500 (EST)
Date: Thu, 05 Jan 2012 13:36:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120105183657.GC28075@denix.org>
References: <1325756829-6511-1-git-send-email-eyalr@ti.com>
	<1325757506.3742.128.camel@mattotaupa>
MIME-version: 1.0
In-reply-to: <1325757506.3742.128.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] iw: use a newer commit in the public git
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
X-List-Received-Date: Thu, 05 Jan 2012 18:44:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 05, 2012 at 10:58:26AM +0100, Paul Menzel wrote:
> Dear Ayal,
> 
> 
> Am Donnerstag, den 05.01.2012, 11:47 +0200 schrieb Eyal Reizer:
> > switch to use a newer commit in the public git
> 
> That line is redundant to the commit summary. Why not use the following
> as the summary?
> 
>         iw_git: Update to commit 8b2b1c6a (version 3.2)
> 
> Additionally please add if this just introduces new features or if it
> fixes any problems for you.
> 
> And lastly please add how you have tested the new version.
> 
> > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> > ---
> >  recipes/iw/iw_git.bb |    6 +++---
> >  1 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/recipes/iw/iw_git.bb b/recipes/iw/iw_git.bb
> > index c98e1bc..f0dc7ff 100644
> > --- a/recipes/iw/iw_git.bb
> > +++ b/recipes/iw/iw_git.bb
> > @@ -4,9 +4,9 @@ SECTION = "base"
> >  PRIORITY = "optional"
> >  LICENSE = "BSD"
> >  
> > -SRCREV = "0a236ef5f8e4ba7218aac7d0cdacf45673d5b35c"
> > -PR = "r0"
> > -PV = "0.9.22"
> > +SRCREV = "8b2b1c6a77ee17e4128b22845cb8c5901de296c9"
> > +PR = "r1"
> > +PV = "3.2"
> >  PR_append = "+gitr${SRCPV}"
> 
> I always forget, if a `PR` bump for a version update is needed if we
> have `PR_append${SRCPV}`. Could you check that again, please.

Actually, if the version (PV) is bumped, PR should go back to 0 or 1, ideally. 
Otherwise it's not needed to bump PR, when PV is increased.

-- 
Denys


