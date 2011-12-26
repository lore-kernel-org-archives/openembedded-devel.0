Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Rf2yu-0005JJ-QA
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Dec 2011 06:20:17 +0100
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LWS00MN1MD37Q30@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	25 Dec 2011 22:12:45 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C3A0D202C0; Sun,
	25 Dec 2011 23:12:39 -0500 (EST)
Date: Sun, 25 Dec 2011 23:12:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111226041239.GA2321@denix.org>
References: <4EF2F380.80704@celestialaudio.com>
	<20111223223753.GA20360@denix.org>
	<CACW_hTbZ=9HZNZGouQoWvLcc2WmDP4O+i+ooF98DYHWOXK79Jw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CACW_hTbZ=9HZNZGouQoWvLcc2WmDP4O+i+ooF98DYHWOXK79Jw@mail.gmail.com>
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
X-List-Received-Date: Mon, 26 Dec 2011 05:20:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Dec 25, 2011 at 09:11:36PM +0100, Frans Meulenbroeks wrote:
> 2011/12/23 Denys Dmytriyenko <denis@denix.org>
> 
> > On Thu, Dec 22, 2011 at 01:08:16AM -0800, Jesse Lackey wrote:
> > > I'm have exactly the same problem.  "git pull" says up to date.
> > >
> > > I'm continuing on by running "bitbake -k".  But things appear to be
> > > indeed broken, by the presumably recent removal of
> > > fakeroot_1.15.1.orig.tar.bz2 from the debian ftp site.
> > >
> > > Any assistance greatly appreciated.  I'm a total newbie with bitbake and
> > OE.
> > >
> > > >I tried `git pull` but apparently everything is "Already up-to-date."
> > Am I
> > > >missing something else?
> >
> > Add this line to your local.conf:
> >
> > DEBIAN_MIRROR = "
> > http://snapshot.debian.org/archive/debian/20111129T215729Z/pool"
> >
> 
> Actually bumped into this today as well; I saw maintenance moved back to
> 1.14.6 or so.
> Latest version is about 1.18.2.2.
> 
> Guess we should either move master back to 1.14.6, or maybe even move to a
> newer version. or fix the url to point to the snapshot copy.

So, instead of always chasing the very latest version, why not simply set the 
Debian mirror variable on a per-distro basis?

-- 
Denys


