Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LkHsA-0000Cl-05
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 14:01:30 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGR004YW83PUUV3@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	19 Mar 2009 07:59:55 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 130716B83A8; Thu,
	19 Mar 2009 08:59:49 -0400 (EDT)
Date: Thu, 19 Mar 2009 08:59:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090319125949.GC27595@denix.org>
References: <1237328436.20770.57.camel@homestead>
	<20090318000600.GA20384@denix.org>
	<200903191101.09014.mickey@vanille-media.de>
MIME-version: 1.0
In-reply-to: <200903191101.09014.mickey@vanille-media.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Cleaning tmp folder
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
X-List-Received-Date: Thu, 19 Mar 2009 13:01:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 19, 2009 at 11:01:08AM +0100, Michael 'Mickey' Lauer wrote:
> On Wednesday 18 March 2009 01:06:00 Denys Dmytriyenko wrote:
> > On Tue, Mar 17, 2009 at 10:20:36PM +0000, Shane Dixon wrote:
> > > I've been digging through the bitbake files and I don't see any recipe
> > > for cleaning the tmp folder.  I typically just blow away the entire tmp/
> > > folder and build again, but then I'm spending time rebuilding the native
> > > packages and crosscompiler.
> > >
> > > Is there a bitbake recipe for cleaning out all non-native and
> > > non-crosscompiler packages from tmp or am I stuck just starting over
> > > each time?
> >
> > If you have packaged staging enabled (see INHERIT += "packaged-staging"),
> > you can try setting DEPLOY_DIR_PSTAGE (or entire DEPLOY_DIR) outside of
> > TMPDIR.
> 
> Note that this doesn't work atm. since DEPLOY_DIR is not using a weak 
> assignment in bitbake.conf -- something which I'm changing as we speak.

Correct, DEPLOY_DIR is not a weak assignment. But I believe DEPLOY_DIR_PSTAGE 
is. Also, it can be "fixed" locally in the overlay.

-- 
Denys


