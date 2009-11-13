Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1N8yma-00042Z-HH
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 17:14:00 +0100
X-AuditID: 0a1e000a-b7b8cae000000d7b-93-4afd857371be
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <Pine.LNX.4.64.0911130657000.4186@juice.ott.cti.com>
References: <alpine.LFD.2.00.0911130555020.3622@localhost>
	<1258110604.5799.10.camel@dax.rpnet.com>
	<Pine.LNX.4.64.0911130657000.4186@juice.ott.cti.com>
Date: Fri, 13 Nov 2009 11:03:27 -0500
Message-Id: <1258128207.4913.29.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: how to remove all traces of a previous package build?
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
X-List-Received-Date: Fri, 13 Nov 2009 16:14:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-11-13 at 07:00 -0500, Michael Smith wrote:
> On Fri, 13 Nov 2009, Richard Purdie wrote:
> 
> > On Fri, 2009-11-13 at 05:56 -0500, Robert P. J. Day wrote:
> > > surely a dumb question, but what's the recipe for deleting every
> > > trace of a single previous package build, so i know i'm rebuilding it
> > > absolutely from step one?  i'll use that to test a rebuild of the
> > > packages that are failing for me.
> > 
> > bitbake X -c clean
> 
> Then remove all packages under tmp/deploy; also tmp/pkgdata/*/X and
> tmp/pkgdata/*/runtime/X*; and tmp/staging/*/*/shlibs/X*. Otherwise you may 
> get problems if you've switched PACKAGE_ARCH in a recipe, or switched 
> between packages that provide the same shared library.
> 
> I don't think there's a way to remove files from the staging directory. 
> Maybe with packaged staging?
> 
> Mike


I almost wonder if we should consider adding a task which handles the
above in addition to the standard bitbake clean. I was burned a few
weeks ago by having a stale package in my deploy directory that kept
getting chosen over the new one I was building due to some versioning
nastiness. I can see how automatically purging stuff from deploy would
be considered destructive, but IMHO there should be a command which just
nukes every last bit of a package the build system knows about.

--Chris


