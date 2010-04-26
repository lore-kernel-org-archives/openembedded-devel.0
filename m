Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O6SjF-0003Jm-9Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 20:08:22 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1H00KCPX0SWOK3@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	26 Apr 2010 13:07:46 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E339614AF60; Mon,
	26 Apr 2010 14:03:57 -0400 (EDT)
Date: Mon, 26 Apr 2010 14:03:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100426180357.GB22763@denix.org>
References: <hqrv2b$a7u$1@dough.gmane.org>
	<1272046053.3865.425.camel@trini-m4400>
	<20100423182217.GB27322@denix.org>
	<hqsprc$no6$1@dough.gmane.org> <1272048959.3865.478.camel@trini-m4400>
	<hqt003$fvd$1@dough.gmane.org> <20100423205439.GC27322@denix.org>
	<1272058993.3865.531.camel@trini-m4400>
	<20100424170705.GB10320@denix.org>
	<1272135069.3865.539.camel@trini-m4400>
MIME-version: 1.0
In-reply-to: <1272135069.3865.539.camel@trini-m4400>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC][PATCH] meta-toolchain: use MULTIMACH_TARGET_SYS	instead of TARGET_SYS
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
X-List-Received-Date: Mon, 26 Apr 2010 18:08:22 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Apr 24, 2010 at 11:51:09AM -0700, Tom Rini wrote:
> On Sat, 2010-04-24 at 13:07 -0400, Denys Dmytriyenko wrote:
> > On Fri, Apr 23, 2010 at 02:43:13PM -0700, Tom Rini wrote:
> > > On Fri, 2010-04-23 at 16:54 -0400, Denys Dmytriyenko wrote:
> > > > On Fri, Apr 23, 2010 at 10:29:54PM +0200, Koen Kooi wrote:
> > > > > >> Yes, that needs to be done, as well as seperating the cross tools in
> > > > > >> case different archs need different versions (as is the case with
> > > > > >> angstrom, v5te and v7a need different binutils). This change largely to
> > > > > >> to cosmetically highlight that the toolchain is not really "universal"
> > > > > >> (yet).
> > > > > > 
> > > > > > And we can talk about if "universal" is really a good goal either.
> > > > > 
> > > > > I don't think we can make it "universal" without sacrificing key benefits.
> > > > > 
> > > > > > Taking a bit of a guess in the dark, an SDK with support for all the fun
> > > > > > stuff found on Beagleboard might not be done easily with also having
> > > > > > support for all the fun stuff found on some other ref board too.
> > > > > 
> > > > > The immediate problem I'm trying to address now is that having both an
> > > > > armv5te and armv7a toolchain installed is breaking horribly. Ideally
> > > > > they would coexist peacefully, but I don't know if we can manage that,
> > > > > without impacting the ease of use.
> > > > 
> > > > I know it's not what you are looking for, but easier workaround would be to 
> > > > install different toolchains in different paths... :)
> > > 
> > > Or, noting all of the very machine specific stuff Koen mentions
> > > elsewhere, we don't pretend it's an SDK for armv7a but just call it an
> > > SDK for ${MACHINE} and encode that into the PATH.
> > 
> > The thing is, while SDKPATH is the same by default for both of the 
> > incompatile toolchains (e.g. for Angstrom it is /usr/local/angstrom), the 
> > resulting tarballs are named with the specific architecture in the name taken 
> > from the FEED_ARCH:
> > 
> > TOOLCHAIN_OUTPUTNAME ?= "${DISTRO}-${DISTRO_VERSION}-${SDK_SYS}-${FEED_ARCH}-${TARGET_OS}-${SDK_SUFFIX}"
> > 
> > While not machine-specific, when installed in separate locations, can safely 
> > separate armv5te from armv7a. That way even the host cross tools are separated.
> 
> Right.  I'm saying that SDKPATH should be more than /usr/local/${DISTRO}
> but /usr/local/${DISTRO}/${MACHINE} by default, toss a comment above
> about why (output is very MACHINE specific in certain cases) and maybe
> update the default TOOLCHAIN_OUTPUTNAME too.

Ok, you asked for a comment, I'll give you two :)

1. In Arago I have a way to overwrite SDKPATH from the command line when 
building a specific SDK/toolchain. So, I can do what you suggest, but...

2. My SDKs are currently not machine-specific, moreover, they don't have the 
cross-compile tools in them (i.e. no toolchain part), as Arago uses external 
CodeSourcery toolchain for that. The only cross-tools I have in my SDKs are 
those, which are missing from CS - i.e. libtool, pkgconfig, opkg, qt4e-tools 
etc. But I still build 2 versions of SDK - armv5te and armv7a.

-- 
Denys


