Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O7w4C-0004r9-HB
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 21:40:05 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1P00IJZFRSLL1B@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	30 Apr 2010 14:35:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CED3414AF60; Fri,
	30 Apr 2010 15:35:51 -0400 (EDT)
Date: Fri, 30 Apr 2010 15:35:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100430193551.GD5713@denix.org>
References: <20100423182217.GB27322@denix.org> <hqsprc$no6$1@dough.gmane.org>
	<1272048959.3865.478.camel@trini-m4400>
	<hqt003$fvd$1@dough.gmane.org> <20100423205439.GC27322@denix.org>
	<1272058993.3865.531.camel@trini-m4400>
	<20100424170705.GB10320@denix.org>
	<1272135069.3865.539.camel@trini-m4400>
	<20100426180357.GB22763@denix.org>
	<1272392294.3865.571.camel@trini-m4400>
MIME-version: 1.0
In-reply-to: <1272392294.3865.571.camel@trini-m4400>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Fri, 30 Apr 2010 19:40:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 27, 2010 at 11:18:14AM -0700, Tom Rini wrote:
> On Mon, 2010-04-26 at 14:03 -0400, Denys Dmytriyenko wrote:
> > On Sat, Apr 24, 2010 at 11:51:09AM -0700, Tom Rini wrote:
> [snip] 
> > > Right.  I'm saying that SDKPATH should be more than /usr/local/${DISTRO}
> > > but /usr/local/${DISTRO}/${MACHINE} by default, toss a comment above
> > > about why (output is very MACHINE specific in certain cases) and maybe
> > > update the default TOOLCHAIN_OUTPUTNAME too.
> > 
> > Ok, you asked for a comment, I'll give you two :)
> > 
> > 1. In Arago I have a way to overwrite SDKPATH from the command line when 
> > building a specific SDK/toolchain. So, I can do what you suggest, but...
> > 
> > 2. My SDKs are currently not machine-specific, moreover, they don't have the 
> > cross-compile tools in them (i.e. no toolchain part), as Arago uses external 
> > CodeSourcery toolchain for that. The only cross-tools I have in my SDKs are 
> > those, which are missing from CS - i.e. libtool, pkgconfig, opkg, qt4e-tools 
> > etc. But I still build 2 versions of SDK - armv5te and armv7a.
> 
> I'd make a very small wager that you're unknowningly wrong about #2 or a
> someone adding an RRECOMMENDS/RDEPENDS_mach somewhere (or using another
> machine you haven't tried yet) from machine specific stuff leaking in
> and being wrong :)
> 
> It's not the gcc & co that you get from CodeSourcery or our -sdk recipes
> or whatever that makes this machine-specific but the conditional
> inclusion of some userland bits (be it "small" "regular" Linux stuff or
> "small" stuff for FPGAs or whatever on a particular ref board).  Or even
> PACKAGE_ARCH=MACHINE stuff already being in there, again without you
> knowning (some of which can be rather easily pulled out with that
> removal hook you added).

In general, you are correct, but:

$ grep 'Architecture:' $SDK_PATH/$TARGET_SYS/usr/lib/opkg/status | uniq
armv7a

So, I'm being carefull and use the EXCLUDE removal hook extensively :)

-- 
Denys


