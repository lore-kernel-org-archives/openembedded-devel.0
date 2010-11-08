Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PFIba-0005RG-IH
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 04:41:16 +0100
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LBJ000BNRILHBK0@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	07 Nov 2010 21:40:02 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DF24614AF6A; Sun,
	07 Nov 2010 22:39:56 -0500 (EST)
Date: Sun, 07 Nov 2010 22:39:56 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "l.bolognini@tiscali.it" <l.bolognini@tiscali.it>
Message-id: <20101108033956.GD27133@denix.org>
References: <14172071.346581288106319217.JavaMail.defaultUser@defaultHost>
MIME-version: 1.0
In-reply-to: <14172071.346581288106319217.JavaMail.defaultUser@defaultHost>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: arago-devel@gforge.ti.com,
	Open Embedded Mailing List <openembedded-devel@lists.openembedded.org>
Subject: Re: [arago-devel] c6a816x-evm support
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
X-List-Received-Date: Mon, 08 Nov 2010 03:41:16 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 26, 2010 at 05:18:39PM +0200, l.bolognini@tiscali.it wrote:
> Hallo, any news about ti816x support?
> Do I have to setup again Arago 
> environment by the three "git clone" commands or is there a way to 
> update the tree with the new supports?

Luca,

Sorry for the delay - your email came when I was at ELC/OEDEM and got buried 
under other emails in my inbox...

You can always update your existing repositories by running "git pull" to get 
the latest changes.

Specifically, the problem you reported below was resolved recently and ti816x 
kernel now fetches and builds properly.

Please let me know if you have any problems. Thanks.

Denys

> With the same tree "cloned" in 
> the beginning of October now I get:
> [luca@fedora13 oe]$ MACHINE=c6a816x-
> evm bitbake -v ti816x-image
> [...]
> NOTE: fetch http://www.angstrom-
> distribution.org/unstable/sources/git_arago-project.org.git.projects.
> linux-omap3.git_661585a1407961c5e71f1d8203f1a32f08e9a772.tar.gz
> --2010-
> 10-26 17:11:43--  http://www.angstrom-distribution.
> org/unstable/sources/git_arago-project.org.git.projects.linux-omap3.
> git_661585a1407961c5e71f1d8203f1a32f08e9a772.tar.gz
> Resolving www.
> angstrom-distribution.org... 188.40.83.200
> Connecting to www.angstrom-
> distribution.org|188.40.83.200|:80... connected.
> HTTP request sent, 
> awaiting response... 404 Not Found
> 2010-10-26 17:11:50 ERROR 404: Not 
> Found.
> 
> fatal: read error: Connection reset by peer
> 
> NOTE: Task failed: 
> Fetch failed: Fetch command export HOME=...; export PATH=...; git fetch 
> git://arago-project.org/git/projects/linux-omap3.git master failed with 
> signal 128, output:
> fatal: read error: Connection reset by peer
> 
> What 
> about the development for MACHINE=c6a816x-evm ?
> Thank you,
> bye 
> Luca
> 
> 
> 
> 
> 
> ----Messaggio originale----
> Da: denis@denix.org
> Data: 04/10/2010 18.34
> 
> A: "l.bolognini@tiscali.it"<l.bolognini@tiscali.it>, <arago-
> devel@gforge.ti.com>
> Cc: "Open Embedded Mailing List"<openembedded-
> devel@lists.openembedded.org>
> Ogg: Re: [arago-devel] c6a816x-evm 
> support
> 
> On Mon, Oct 04, 2010 at 05:43:06PM +0200, l.bolognini@tiscali.
> it wrote:
> > Hallo,
> > I'm working with Arago but I thought to extend 
> this mail to OE 
> > mailing list too.
> > I made 
> > git clone git://arago-
> project.org/git/arago.
> > git
> > git clone git://arago-project.
> org/git/arago-oe-dev.git
> > git clone 
> > git://arago-project.
> org/git/arago-bitbake.git 
> > last Friday (1st October 
> > 2010)
> > Now 
> I'm trying to build my custom image for MACHINE=c6a816x-evm.
> > 
> > From 
> git:
> > //arago-project.org/git/projects/linux-omap3
> >  * 
> branch            
> > master     -> FETCH_HEAD
> > NOTE: Creating tarball 
> of git repository
> > 
> > fatal: failed to unpack tree object 
> > 
> 661585a1407961c5e71f1d8203f1a32f08e9a772
> > NOTE: Task failed: Fetch 
> > 
> failed: Fetch command export HOME=...; export PATH=...;
> > git read-
> tree 
> > 661585a1407961c5e71f1d8203f1a32f08e9a772 failed with signal 
> 128, 
> > output:
> > fatal: failed to unpack tree object 
> > 
> 661585a1407961c5e71f1d8203f1a32f08e9a772
> 
> Luca,
> 
> Yes, we have noticed 
> this issue last Friday - the commit ID the recipe was 
> originally based 
> on, is no longer available. I believe Roger fixed it when 
> pushing the 
> ti816x support to OE, but I haven't had time to fix it in Arago 
> yet. 
> It should be fixed in Arago shortly, sorry for the inconvenience.
> 
> -- 
> 
> Denys


