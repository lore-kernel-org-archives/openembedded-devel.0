Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LjRUE-00068R-IK
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 06:05:14 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090317050426.JVEJ16134.fed1rmmtao104.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Mar 2009 01:04:26 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id U54R1b00B4dMFYL0454RWg; Tue, 17 Mar 2009 01:04:25 -0400
X-Authority-Analysis: v=1.0 c=1 a=GN_yKGkEFO0A:10 a=JfrnYn6hAAAA:8
	a=TCpyz0MEsNMupqQoMG0A:9 a=X-RaL_A-38Wd-tTqMOYA:7
	a=GuH_NDwieIGBICSz8XSqQVqdJcUA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 16 Mar 2009 22:04:24 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090317050424.GJ26343@smtp.west.cox.net>
References: <49BF280A.7090705@tait.co.nz>
MIME-Version: 1.0
In-Reply-To: <49BF280A.7090705@tait.co.nz>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.42
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Git SRC_TARBALL_STASH filename
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
X-List-Received-Date: Tue, 17 Mar 2009 05:05:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2009 at 05:33:14PM +1300, Douglas Royds wrote:

> Working behind a firewall that doesn't allow Git access (except over  
> http). I've set SRC_TARBALL_STASH so that we only have to download the  
> appropriate source tarball (manually) once.
>
> While building mtd-utils, BitBake is trying to fetch from the tarball stash:
>
>    http://.../git_git.infradead.org.mtd-utils.git.tar.gz
>
> Instead of:
>
>    http://.../git_git.infradead.org.mtd-utils.git_ea429635388f7bb53f62c41ec3d5ccf5fa207370.tar.gz
>
> The following patch appears to do the job, but I'm not confident this is  
> the right fix. I notice that all the other fetchers use ud.localfile,  
> which already has the correct filename.

What's going on is that it's trying to fetch the raw git tree stash,
rather than the checkout stash, so you need to mirror the other.  OTOH,
perhaps it should try first the checkout then the raw?

-- 
Tom Rini


