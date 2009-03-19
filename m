Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LkKTU-0005qk-KZ
	for openembedded-devel@openembedded.org; Thu, 19 Mar 2009 16:48:05 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090319154703.XWRL22254.fed1rmmtao106.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Mar 2009 11:47:03 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id V3n41b00F4dMFYL043n4By; Thu, 19 Mar 2009 11:47:04 -0400
X-Authority-Analysis: v=1.0 c=1 a=47dJSQ357cbmG5cLnPgA:9
	a=tSuzsWRRe3Wk0tCshA47DfJ-RP0A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 19 Mar 2009 08:47:04 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090319154704.GB14278@smtp.west.cox.net>
References: <1237467616-4745-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <1237467616-4745-1-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] mtd-utils cleanup
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
X-List-Received-Date: Thu, 19 Mar 2009 15:48:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2009 at 02:00:13PM +0100, Marcin Juszkiewicz wrote:

> Hi
> 
> I wanted to clean mtd-utils situation a bit. All versions older then 1.1.0
> (used by SlugOS) were dropped and 1.2.0+git are default now.
> 
> Next part is move of mkfs.ubifs into separate package (like we have with
> mkfs.jffs2). This was done to get rid of lzo & e2fsprogs-libs dependency
> from resulting 'mtd-utils' package (those libraries are only used by mkfs.ubifs
> binary).

As a further cleanup, making a package of the NAND stuff and a package
of the rest of the UBI utils might make sense, if you're so inclined.
But for what's here now +1

-- 
Tom Rini


