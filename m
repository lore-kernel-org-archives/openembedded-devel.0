Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LuYk2-0006bm-Gh
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 23:03:33 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090416205928.TVBD4363.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>;
	Thu, 16 Apr 2009 16:59:28 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id gLzU1b0074dMFYL04LzUhw; Thu, 16 Apr 2009 16:59:28 -0400
X-Authority-Analysis: v=1.0 c=1 a=jPlMlblrO3oA:10 a=ywbLZgbN88kA:10
	a=-S8moVqFDP8skU5MU38A:9 a=4luq2qbMRjOb9zoKtids9L5gKmYA:4
X-CM-Score: 0.00
Date: Thu, 16 Apr 2009 13:59:28 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090416205928.GM17629@smtp.west.cox.net>
References: <1239912183-25085-1-git-send-email-dhuggins@cs.cmu.edu>
MIME-Version: 1.0
In-Reply-To: <1239912183-25085-1-git-send-email-dhuggins@cs.cmu.edu>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.43
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: David Huggins-Daines <dhuggins@cs.cmu.edu>
Subject: Re: [PATCH] update canadian-sdk to match meta-toolchain
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
X-List-Received-Date: Thu, 16 Apr 2009 21:03:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2009 at 04:03:02PM -0400, David Huggins-Daines wrote:

> This patch synchronizes (to some extent) canadian-sdk.bb with
> meta-toolchain.bb.  Unlike meta-toolchain, it does not build an
> -extras package.  There's a lot of code duplication there which I will
> leave to the experts to sort out :)

I _think_ this is OK.  I'm iffy at best on if opkg will actually work in
Windows, but otherwise, yeah.  I'm going to go kick a build or two prior
to both of these patches then put 'em in and see what happens.

-- 
Tom Rini


