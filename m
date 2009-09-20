Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MpRVg-0004K2-IZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 20:51:47 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQA00NEV9OS21RG@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	20 Sep 2009 13:50:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9CA9714AF5F; Sun,
	20 Sep 2009 14:50:51 -0400 (EDT)
Date: Sun, 20 Sep 2009 14:50:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090920185051.GB1288@denix.org>
References: <1253428380-27587-1-git-send-email-denis@denix.org>
	<19c1b8a90909200813u30642a87g38fc83cfb2b59d36@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <19c1b8a90909200813u30642a87g38fc83cfb2b59d36@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] package.bbclass: export subpackage	individual version, if different from main
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
X-List-Received-Date: Sun, 20 Sep 2009 18:51:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Sep 20, 2009 at 08:13:52AM -0700, Khem Raj wrote:
> On Sat, Sep 19, 2009 at 11:33 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > Fixes the wrong versioned runtime dependency for shlib subpackages with
> > own versions. Consider this:
> >
> > PACKAGES = "libfoo libbar"
> > PV_libfoo = "1"
> > PV_libbar = "2"
> > PV = "3"
> >
> > That will generate libfoo_1 and libbar_2 packages, but version 3 will be
> > exported in shlibs database, leading to the following versioned runtime
> > dependencies:
> >
> > RDEPENDS: libfoo (>=3) libbar (>=3)
> 
> Can RPROVIDES fill in this void somehow.

Does RPROVIDES specify versions?

-- 
Denys


