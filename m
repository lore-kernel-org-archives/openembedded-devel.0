Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O7wXq-0002dp-1W
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 22:10:47 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1P00IARH7GLLAB@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	30 Apr 2010 15:06:53 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BE94114AF60; Fri,
	30 Apr 2010 16:06:52 -0400 (EDT)
Date: Fri, 30 Apr 2010 16:06:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: C Michael Sundius <msundius@sundius.com>
Message-id: <20100430200652.GE5713@denix.org>
References: <g2y18e217241004291133x532abf49k8fb76e81564efbad@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <g2y18e217241004291133x532abf49k8fb76e81564efbad@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: building an SDK with an externally provided toolchain
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
X-List-Received-Date: Fri, 30 Apr 2010 20:10:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 29, 2010 at 11:33:33AM -0700, C Michael Sundius wrote:
> Denys,
> 
> in your comment in the thread:
> 
> Re: [oe] [RFC][PATCH] meta-toolchain: use MULTIMACH_TARGET_SYS instead of
> TARGET_SYS
> 
> > Ok, you asked for a comment, I'll give you two :)
> >
> > 1. In Arago I have a way to overwrite SDKPATH from the command line when
> > building a specific SDK/toolchain. So, I can do what you suggest, but...
> >
> > 2. My SDKs are currently not machine-specific, moreover, they don't have
> > the
> > cross-compile tools in them (i.e. no toolchain part), as Arago uses
> > external
> > CodeSourcery toolchain for that. The only cross-tools I have in my SDKs are
> > those, which are missing from CS - i.e. libtool, pkgconfig, opkg,
> > qt4e-tools
> > etc. But I still build 2 versions of SDK - armv5te and armv7a.
> >
> I am in a similar predicament where we have to use a tool-chain provided to
> us prior to the adoption of OE. As a result, we've hacked up our own
> external-toolchain recipe to copy the libs and headers into the staging dir,
> but do not have a real cross-compile. we just add the path for the actual
> tools. We also would like to provide an SDK of our libraries separately from
> the toolchain that we deliver to our SDK customers.
> 
> my question is, how do you build your sdk. since our SDK_PATH is not where
> our toolchain is the sdk.bbclass points ${prefix} to /usr/local (which does
> not contain our toolchain) thus much of the makery reverts to looking in
> /usr/include for headers which of course casuse the build to break..
> 
> do you keep your external toolchain from CS in your SDK_PATH or somewhere
> else?
> 
> you seem to allude to the fact that you did some magic to overrite the
> SDKPATH in certain circumstances.. I didn't see it in your code.

The trick is that meta-toolchain recipe does not build any target packages and 
expects them to be already available in deploy - it only opkg-installs them. 
Thus, it's safe to overwrite SDK_PATH when building/assembling the SDK. I have 
a python code in my local.conf (argh, my local.conf already looks like a 
distro.conf) where I set SDK_PATH to point to CSL for normal builds; or set it 
with the directory (provided through a separate variable set on the command 
line) where I want the SDK installed, when building said SDK:

SDK_PATH = "${@[bb.data.getVar('TOOLCHAIN_PATH', d, 1), bb.data.getVar('META_SDK_PATH', d, 1)][bool(bb.data.getVar('META_SDK_PATH', d, 1))]}"

I.e. if META_SDK_PATH is set, assume we are building SDK and set SDK_PATH to 
the root of our SDK, otherwise set it to TOOLCHAIN_PATH, which is CSL. I also 
set TOOLCHAIN_PATH in addition to SDK_PATH in the environment-setup script, 
generated by meta-toolchain.bb

Then I make builds like this:

$ MACHINE=omap3evm bitbake arago-image
$ META_SDK_PATH=/opt/arago-sdk MACHINE=omap3evm bitbake meta-toolchain-arago

Feel free to poke around in the Arago repository:
http://arago-project.org/git/arago.git

-- 
Denys


