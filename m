Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LrERw-0002WA-LT
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 18:47:23 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090407164401.SLCQ15318.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>;
	Tue, 7 Apr 2009 12:44:01 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id cgk01b00P4dMFYL04gk0G5; Tue, 07 Apr 2009 12:44:00 -0400
X-Authority-Analysis: v=1.0 c=1 a=LLXGQB_n1EEA:10 a=Li_4dJr9FsMA:10
	a=mDV3o1hIAAAA:8 a=smwuGHakn5I1XgXVvbAA:9 a=PD-f8B4QFod_zVsBeWgA:7
	a=ODJOenv2FfXzKssn7VY5xAiwAOcA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 7 Apr 2009 09:44:00 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090407164400.GD2195@smtp.west.cox.net>
References: <1239117404-2263-1-git-send-email-dhuggins@cs.cmu.edu>
MIME-Version: 1.0
In-Reply-To: <1239117404-2263-1-git-send-email-dhuggins@cs.cmu.edu>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.41
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: David Huggins-Daines <dhuggins@cs.cmu.edu>
Subject: Re: [PATCH] fix GCC 4.3.3 sources in stable/2009 branch
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
X-List-Received-Date: Tue, 07 Apr 2009 16:47:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2009 at 11:16:44AM -0400, David Huggins-Daines wrote:

> Currently it's not possible to build the stable/2009 branch with GCC 4.3.3,
> because it hardcodes a download location for the sources which is not
> resolvable (at least from where I am...).  It was suggested to change the
> recipe to use GNU_MIRROR.
> 
> Unfortunately, bitbake.conf and checksums.ini have a different idea of what
> the URI for the main GNU download site is.  This patch fixes these problems.

NACK.

First, this is fixed in .dev now, by fixing all of the gcc recipes
(except for csl ones) to use ${GNU_MIRROR} and updating the checksums
file.  Second, ftp.gnu.org/gnu is correct as 'pub' is just a symlink to
'.'.

-- 
Tom Rini


