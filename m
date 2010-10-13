Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P66QT-0006nJ-3m
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 20:51:45 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LA800DIISCTZ4A7@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	13 Oct 2010 13:50:59 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B7E5B14AF64; Wed,
	13 Oct 2010 14:50:52 -0400 (EDT)
Date: Wed, 13 Oct 2010 14:50:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20101013185052.GG11514@denix.org>
References: <1286978491-13427-1-git-send-email-Chase.Maupin@ti.com>
	<20101013165840.GA11514@denix.org>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA7DE@dlee06.ent.ti.com>
MIME-version: 1.0
In-reply-to: <131E5DFBE7373E4C8D813795A6AA7F080310FFA7DE@dlee06.ent.ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/5] matrix-gui-common: skip qa check on prebuilt	binaries
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
X-List-Received-Date: Wed, 13 Oct 2010 18:51:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 13, 2010 at 01:39:53PM -0500, Maupin, Chase wrote:
> 
> 
> 
> 
> > -----Original Message-----
> > From: Denys Dmytriyenko [mailto:denis@denix.org]
> > Sent: Wednesday, October 13, 2010 11:59 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Maupin, Chase
> > Subject: Re: [oe] [PATCH 1/5] matrix-gui-common: skip qa check on prebuilt
> > binaries
> > 
> > On Wed, Oct 13, 2010 at 09:01:27AM -0500, Chase Maupin wrote:
> > > * Skip the QA check on the prebuilt binaries used for dm365
> > >   devices.
> > 
> > And why do we have prebuilt binaries in OE?
> 
> They are not so much in the OE repository as they are part of the matrix 
> repository.  That being said I'm working to get these buildable in OE and 
> I'll make this an RDEPENDS.  So go ahead and ignore this patch.

Hmm, when I created the original recipes for the Matrix, the only binary in 
the repository was the Qt/E based browser (which I disabled in OE, but enabled 
temporarily in Arago) and a bunch of scripts... The rest of it was built from 
the sources - has it changed that much lately? Unless there is an issue, like 
with am-benchmarks performance using specific toolchain, we should build 
everything from sources. Let me know if you need any help changing it.

-- 
Denys


