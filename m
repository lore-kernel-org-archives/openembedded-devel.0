Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QBWdk-0005PR-4j
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 20:24:08 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJT00I606ZH7QS4@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	17 Apr 2011 13:21:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B6CC914AF5B; Sun,
	17 Apr 2011 14:21:17 -0400 (EDT)
Date: Sun, 17 Apr 2011 14:21:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110417182117.GB4068@denix.org>
References: <20110414193436.GA26286@denix.org> <4DAA505E.4000305@mentor.com>
	<ioe35g$lb4$1@dough.gmane.org> <4DAB2CEC.1030008@mentor.com>
MIME-version: 1.0
In-reply-to: <4DAB2CEC.1030008@mentor.com>
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
X-List-Received-Date: Sun, 17 Apr 2011 18:24:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Apr 17, 2011 at 11:09:48AM -0700, Tom Rini wrote:
> On 04/17/2011 12:00 AM, Koen Kooi wrote:
> > On 17-04-11 04:28, Tom Rini wrote:
> >> On 04/14/2011 12:34 PM, Denys Dmytriyenko wrote:
> >>> Tom,
> > 
> >>> Please pull these 5 commits for TI related changes - matrix-gui rev bump,
> >>> new ti-ipc version and sgx/gles fixes for ti816x.
> >>> All are cherry picked from oe.dev
> > 
> > 
> >>> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
> >>>   Branch: 2011.03-maintenance
> >>>   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
> > 
> >>> Thanks,
> >>>     Denys Dmytriyenko <denys@ti.com>
> > 
> >> Applied, thanks.
> > 
> > Tom, can you please unmerge it? The SGX commit is bogus, I have already
> > asked Denys to revert it from .dev. I do not want crap like that in
> > maintenance.
> 
> All of the parts of the merge or just a specific one?

Tom,

Can we hold off with unmerging/reverting for now? I'm trying to understand the 
damage level and see the best course of action... But the commit in question 
is "ligles-omap3: Remove SGX Fixup for TI816x"

Koen,

I replied to your email. Please let me know if you still prefer the complete 
revert or if it can be worked around, as it still works, while may not be 
optimal, and doesn't break anything else. Thanks.

-- 
Denys


