Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LuYfK-0006W5-L9
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 22:58:47 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090416205437.PIEQ22254.fed1rmmtao106.cox.net@fed1rmimpo02.cox.net>;
	Thu, 16 Apr 2009 16:54:37 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id gLuc1b00M4dMFYL04Luc2t; Thu, 16 Apr 2009 16:54:36 -0400
X-Authority-Analysis: v=1.0 c=1 a=Q7dqUReUBcIA:10 a=s9zPVp_aTL4A:10
	a=WNYTieXrfAyMQT25zrQA:9 a=1WdBoq5USWWS3XWhfTwA:7
	a=MDIynbNDbixvkEe1WZKTs-ESVA8A:4
X-CM-Score: 0.00
Date: Thu, 16 Apr 2009 13:54:36 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090416205436.GL17629@smtp.west.cox.net>
References: <1239912183-25085-1-git-send-email-dhuggins@cs.cmu.edu>
	<1239912183-25085-2-git-send-email-dhuggins@cs.cmu.edu>
MIME-Version: 1.0
In-Reply-To: <1239912183-25085-2-git-send-email-dhuggins@cs.cmu.edu>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.40
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: David Huggins-Daines <dhuggins@cs.cmu.edu>
Subject: Re: [PATCH] fix do_install for MinGW gcc-canadian-sdk
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
X-List-Received-Date: Thu, 16 Apr 2009 20:58:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2009 at 04:03:03PM -0400, David Huggins-Daines wrote:

> When building a Canadian cross SDK for a MinGW host, installation of
> gcc-canadian-sdk fails, because it is configured using a Windows path
> as its ${prefix}.  Therefore it's not sufficient to use DESTDIR to
> install it; this leads to it being installed in ${DESTDIR}C: which
> is not where the rest of the recipe expects it.
> 
> This patch forces it to use the Unix ${prefix} variable, which has
> no drive letter, for installation.  I'm not 100% certain this is the
> right solution but it doesn't seem to break normal SDK builds.

Is this using the distro / machine you mentioned before?  This should
all be fine and we just end up making a 'C:' dir.  I'm very curious here
as at some point prior to pushing canadian stuff originally I had the
same patch, but on trying to confirm I needed it, I suddenly didn't need
it anymore.

-- 
Tom Rini


