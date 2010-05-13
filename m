Received: from smtp-out110.alice.it ([85.37.17.110])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OCehI-0001By-D9
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 22:07:57 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out110.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 13 May 2010 22:03:59 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 13 May 2010 22:03:59 +0200
Received: from [192.168.1.116] ([79.21.48.109]) by FBCMCL01B07.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 13 May 2010 22:04:00 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hshkde$7bv$1@dough.gmane.org>
References: <hshkde$7bv$1@dough.gmane.org>
Date: Thu, 13 May 2010 22:03:59 +0200
Message-ID: <1273781039.8785.32.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 13 May 2010 20:04:00.0696 (UTC)
	FILETIME=[6DC46B80:01CAF2D7]
X-SA-Exim-Connect-IP: 85.37.17.110
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: please revert 0e617baf2916269bbe02cb7b2d4eb20161c86547 - change it to MACHINE_ARCH and bump PR
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
X-List-Received-Date: Thu, 13 May 2010 20:07:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-05-13 at 21:37 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> The person who committed
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=0e617baf2916269bbe02cb7b2d4eb20161c86547
> apparently didn't realize that when using machine overrides in SRC_URI
> the package automatically gets built as MACHINE_ARCH.
> 
> However there is a need for a non machine specific initscript package
> for things like rescue filesystems. Currenly for 90% of our machines
> it's already a generic package.
> 
> In the future please RFC changes on this mailinglist to core recipes
> like initscripts as you're supposed to.
> 
> regards,
> 
> Koen
Reverted.
Sorry not to have realized that it was core stuff(I reviewed all stuff I
pushed(and tested it too) but I forgot that)
Here's the issue:
<koen> it doesn't break, but it means that we have a spurious machine
specific package
<koen> so if a bug fix goes in, I need to rebuilt it for 100 machines or
so, instead of 15

Should I attach a patch for switching only the machines that overrides
some file to MACHINE_ARCH,or should we make the init scripts more
generic: 
<GNUtoo> so what should be done,there are machine specific stuff in it 
<koen> I suspect most of those entries are bogus

Denis.



