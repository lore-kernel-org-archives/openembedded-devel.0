Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RIl8w-00058K-9R
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Oct 2011 19:50:30 +0200
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTM00F7OULAM6G5@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	25 Oct 2011 12:44:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 44CA814AF5D; Tue,
	25 Oct 2011 13:43:58 -0400 (EDT)
Date: Tue, 25 Oct 2011 13:43:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111025174358.GA7690@denix.org>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013D181@post.tritech.se>
	<8721E570-6C63-4CC6-AC4A-854409FFF3E6@gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C4013D8A9@post.tritech.se>
	<20111025075030.GA17580@ad.chargestorm.se>
MIME-version: 1.0
In-reply-to: <20111025075030.GA17580@ad.chargestorm.se>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [2011.03-maintenance] Pull request for binutils
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
X-List-Received-Date: Tue, 25 Oct 2011 17:50:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 25, 2011 at 09:50:30AM +0200, Anders Darander wrote:
> * Mats K?rrman <Mats.Karrman@tritech.se> [111025 09:37]:
> > I'm sorry for the slow progress but I'm working 100% on something else
> > so this is overtime...
> 
> Unfortunately a too common situation...
> 
> > What is the correct practice; to fork the oe repository at GitHub or
> > to create a "username/maintenance" branch in the same repo?
> 
> Well, unless you already have a git account, with rw permission
> openembedded.org (and thus can push to e.g. openembedded), the easiest
> thing should be to use another hosting. I'm using github for my
> pull-requests to meta-oe and oe-core.
> 
> If you do that, just:
> 1) fork openembedded on github
> 2) add the remote to you local git-tree
> 3) push your local branch to github, using i.e. `git push github
> featureXXX`, assuming that you named the remote github.

Just don't forget that you want your personal tree be at the tip of 
2011.03-maintenance branch, not the master oe.dev (which would otherwise be 
similar to what you just sent). Then you can cherry-pick the needed commit, 
push it to github and generate a pull request.

-- 
Denys


