Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P2o0U-0002CM-Em
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 18:35:37 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9R005GSY196W90@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	04 Oct 2010 11:34:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CB82E14AF64; Mon,
	04 Oct 2010 12:34:20 -0400 (EDT)
Date: Mon, 04 Oct 2010 12:34:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "l.bolognini@tiscali.it" <l.bolognini@tiscali.it>,
	arago-devel@gforge.ti.com
Message-id: <20101004163420.GD28782@denix.org>
References: <33321834.75021286206986565.JavaMail.defaultUser@defaultHost>
MIME-version: 1.0
In-reply-to: <33321834.75021286206986565.JavaMail.defaultUser@defaultHost>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Open Embedded Mailing List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 04 Oct 2010 16:35:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Oct 04, 2010 at 05:43:06PM +0200, l.bolognini@tiscali.it wrote:
> Hallo,
> I'm working with Arago but I thought to extend this mail to OE 
> mailing list too.
> I made 
> git clone git://arago-project.org/git/arago.
> git
> git clone git://arago-project.org/git/arago-oe-dev.git
> git clone 
> git://arago-project.org/git/arago-bitbake.git 
> last Friday (1st October 
> 2010)
> Now I'm trying to build my custom image for MACHINE=c6a816x-evm.
> 
> From git:
> //arago-project.org/git/projects/linux-omap3
>  * branch            
> master     -> FETCH_HEAD
> NOTE: Creating tarball of git repository
> 
> fatal: failed to unpack tree object 
> 661585a1407961c5e71f1d8203f1a32f08e9a772
> NOTE: Task failed: Fetch 
> failed: Fetch command export HOME=...; export PATH=...;
> git read-tree 
> 661585a1407961c5e71f1d8203f1a32f08e9a772 failed with signal 128, 
> output:
> fatal: failed to unpack tree object 
> 661585a1407961c5e71f1d8203f1a32f08e9a772

Luca,

Yes, we have noticed this issue last Friday - the commit ID the recipe was 
originally based on, is no longer available. I believe Roger fixed it when 
pushing the ti816x support to OE, but I haven't had time to fix it in Arago 
yet. It should be fixed in Arago shortly, sorry for the inconvenience.

-- 
Denys


