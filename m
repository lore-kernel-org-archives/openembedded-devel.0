Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Nm7P9-00039T-3w
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 16:19:31 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KYL00KEYZQLBEB4@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	01 Mar 2010 09:16:10 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9A87614AF60; Mon,
	01 Mar 2010 10:15:57 -0500 (EST)
Date: Mon, 01 Mar 2010 10:15:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100301151557.GD15391@denix.org>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
	<hmeia3$p6c$1@dough.gmane.org>
	<ac9c93b11002281226w3b73d9ebo6c3169dedd1b74c5@mail.gmail.com>
	<6ec4247d1002281340t76447b67hc0457bbf702d38b9@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <6ec4247d1002281340t76447b67hc0457bbf702d38b9@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} glib-2.0 cleanup
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
X-List-Received-Date: Mon, 01 Mar 2010 15:19:32 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 01, 2010 at 08:10:31AM +1030, Graham Gower wrote:
> On 1 March 2010 06:56, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
> > 2010/2/28 Koen Kooi <k.kooi@student.utwente.nl>:
> >>
> >> But more importantly, what harm do the recipes do to you? Does it offend
> >> you that there are 26 recipes?
> >
> > Somewhat yes. Frankly I don't see a use for 26 recipes for all kind of
> > different versions, some of which are very outdated.
> 
> What should offend you more is stuff like this:
> 
> [grg@rak gcc]$ pwd
> /home/grg/oe/openembedded/recipes/gcc
> [grg@rak gcc]$ find . -name svn-updates.dpatch -exec ls -l {} \;
> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
> ./gcc-4.4.2/debian/svn-updates.dpatch
> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
> ./gcc-4.4.1/debian/svn-updates.dpatch
> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
> ./gcc-4.3.1/debian/svn-updates.dpatch
> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
> ./gcc-4.3.3/debian/svn-updates.dpatch
> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
> ./gcc-4.3.4/debian/svn-updates.dpatch
> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
> ./gcc-svn/debian/svn-updates.dpatch
> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
> ./gcc-4.3.2/debian/svn-updates.dpatch
> [grg@rak gcc]$ grep svn-updates *
> [grg@rak gcc]$

So, there is 125 MB wasted right there... Thanks for the heads up! :)

-- 
Denys


