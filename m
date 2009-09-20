Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MpRUC-0004IS-8l
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 20:50:15 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQA00CDL9MFWVK2@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	20 Sep 2009 13:49:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E867E14AF5F; Sun,
	20 Sep 2009 14:49:26 -0400 (EDT)
Date: Sun, 20 Sep 2009 14:49:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090920184926.GA1288@denix.org>
References: <1253428380-27587-1-git-send-email-denis@denix.org>
	<1253436022.4490.1517.camel@lenovo.internal.reciva.com>
MIME-version: 1.0
In-reply-to: <1253436022.4490.1517.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
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
X-List-Received-Date: Sun, 20 Sep 2009 18:50:15 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Sep 20, 2009 at 09:40:22AM +0100, Phil Blundell wrote:
> On Sun, 2009-09-20 at 02:33 -0400, Denys Dmytriyenko wrote:
> > Fixes the wrong versioned runtime dependency for shlib subpackages with
> > own versions. Consider this:
> > 
> > PACKAGES = "libfoo libbar"
> > PV_libfoo = "1"
> > PV_libbar = "2"
> > PV = "3"
> 
> Is this even legitimate usage?  I had always thought that PV applied to
> the recipe, not to the output subpackages.

PV_<pkg> works as is, because it is handled by the same code that does 
FILES_<pkg>, DESCRIPTION_<pkg>, RDEPENDS_<pkg>, RPROVIDES_<pkg>, PKG_<pkg> 
etc. And generated subpackages receive own versions just fine.
But for shared libraries in subpackages it has this small issue of exporting 
the main PV in shlibs/pkgdata/runtime...

> What's the typical use-case for this kind of thing?

As Koen said, helpful for large meta-packages. In the case of external 
toolchain, the main package may have version like "2009q1", while different 
subpackages can get their own versions, like "2.8" for libc, "4.3.3" for 
libstdc++ etc. Slightly convoluted example at [1]
W/o this fix I was getting runtime dependencies for libc >= 2009q1, instead
of 2.8

[1] http://arago-project.org/git/?p=arago.git;a=commitdiff;h=a6b686d9a5a81b55e17ef241f8c50a428639c048

-- 
Denys


