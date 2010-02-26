Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Nl5Lv-00086V-8R
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 19:56:00 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KYG0062QPSHZR8H@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	26 Feb 2010 12:53:06 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 769F014AF60; Fri,
	26 Feb 2010 13:53:05 -0500 (EST)
Date: Fri, 26 Feb 2010 13:53:05 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100226185305.GB15391@denix.org>
References: <4B87B283.20009@atmel.com> <hm8ggf$j65$1@dough.gmane.org>
	<1267209944.18176.575.camel@trini-m4400>
MIME-version: 1.0
In-reply-to: <1267209944.18176.575.camel@trini-m4400>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC; Building multiple u-boot images for a single board
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
X-List-Received-Date: Fri, 26 Feb 2010 18:56:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Feb 26, 2010 at 11:45:44AM -0700, Tom Rini wrote:
> On Fri, 2010-02-26 at 13:57 +0100, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > On 26-02-10 12:37, Ulf Samuelsson wrote:
> > > If you want to support multiple boot memories, you have to
> > > have multiple boards in the conf/machine directory
> > > 
> > > I currently testing a change to at91bootstrap, where a defconfig
> > > is not provided by openembedded.
> > > Instead you provide a list of defconfig's in your machine description:
> > > 
> > > I.E: in conf/machien/at91sam9g45ek.conf you have:
> > > 
> > > AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"
> > > 
> > > when at91bootstrap is built it will loop through all the boards.
> > > and build three versions.
> > > 
> > > I think it would make sense to do the same for u-boot,
> > > so that you can build u-boot for several configurations.
> > 
> > Not about u-boot, but slightly related:
> > 
> > I need something similar for uImages due to hardware limitations
> > (daughtercards requiring conflicting pinmux) and I have created this for
> > kernel builds:
> > 
> > http://dominion.thruhere.net/git/cgit.cgi/openembedded/tree/recipes/linux/multi-kernel.inc?h=ti/staging
> > 
> > It's working nicely for my usecase (validate hardware configs with
> > multiple kernels, validate software with only one kernel).
> 
> That indeed looks useful.  Any chance it'll go in soon?  Or what's left
> to cleanup before it can?  Aside from some shellfile for pstaging that
> is.

It is also being used in Arago. Hope to see it merged to oe-dev soon! :)

I need to seriosly look into package_stagefile_shell, as it breaks my setup 
with DEPLOY_DIR outside of TMPDIR - there are some wrong assumptions in that 
function... :(

-- 
Denys


