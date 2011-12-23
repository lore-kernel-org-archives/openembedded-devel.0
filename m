Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1ReEo0-0007L9-1T
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Dec 2011 00:45:40 +0100
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LWO00LKBHJ5D1C0@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	23 Dec 2011 16:37:59 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 95BEA20429; Fri,
	23 Dec 2011 17:37:53 -0500 (EST)
Date: Fri, 23 Dec 2011 17:37:53 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111223223753.GA20360@denix.org>
References: <4EF2F380.80704@celestialaudio.com>
MIME-version: 1.0
In-reply-to: <4EF2F380.80704@celestialaudio.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: fakeroot 1.15.1 issues
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
X-List-Received-Date: Fri, 23 Dec 2011 23:45:40 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Dec 22, 2011 at 01:08:16AM -0800, Jesse Lackey wrote:
> I'm have exactly the same problem.  "git pull" says up to date.
> 
> I'm continuing on by running "bitbake -k".  But things appear to be
> indeed broken, by the presumably recent removal of
> fakeroot_1.15.1.orig.tar.bz2 from the debian ftp site.
> 
> Any assistance greatly appreciated.  I'm a total newbie with bitbake and OE.
> 
> >I tried `git pull` but apparently everything is "Already up-to-date." Am I
> >missing something else?

Add this line to your local.conf:

DEBIAN_MIRROR = "http://snapshot.debian.org/archive/debian/20111129T215729Z/pool"

-- 
Denys


