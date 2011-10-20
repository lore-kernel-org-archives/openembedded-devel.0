Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RGzkI-0008C0-Rn
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Oct 2011 23:01:47 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTD00J2GU4BNYAO@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	20 Oct 2011 15:55:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A040214AF5D; Thu,
	20 Oct 2011 16:55:23 -0400 (EDT)
Date: Thu, 20 Oct 2011 16:55:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111020205523.GT26170@denix.org>
References: <CAFu+nvF2BM344-+5wHCobJshpU=TtuaxD0_WR2CPisNSev0pnQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAFu+nvF2BM344-+5wHCobJshpU=TtuaxD0_WR2CPisNSev0pnQ@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: DEPLOY_DIR and package_stagefile_shell
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
X-List-Received-Date: Thu, 20 Oct 2011 21:01:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 19, 2011 at 05:39:45PM -0400, George C. Huntington, III wrote:
> It appears that if you override DEPLOY_DIR to make the DEPLOY directory
> outside of TMPDIR, then recipes that call package_stagefile_shell fail. the
> sed magic in package_stagefile_shell assumes that the path will be in
> TMPDIR.  Should the package_stagefile_shell be fixed, or should the recipes
> that call it with ${DEPLOY_DIR_IMAGE} be changed.  the u-boot.inc and the
> linux.inc have this problem.

Well, it's an old issue - I first faced it over 3 years ago[1]. I had it 
"fixed" or worked around, by modifying the sed magic. Then it got broken again 
and there wasn't any good fixes available since then. That's the way packaged 
staging works, as pstage had to be relative to deploy dir, which both reside 
in TMPDIR by default.

At one point I even disabled packaged staging in Arago in order to allow 
re-defining DEPLOY_DIR, but later on it got mandated and I just gave in to not 
being able to move DEPLOY_DIR outside of TMPDIR. :)

Either way it's a moot point now with oe-core and shared state...

[1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/19300

-- 
Denys


