Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LuUb2-0005CW-6F
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 18:37:55 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090416163355.RHNG10385.fed1rmmtao107.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Apr 2009 12:33:55 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id gGZt1b00D4dMFYL03GZtMy; Thu, 16 Apr 2009 12:33:55 -0400
X-Authority-Analysis: v=1.0 c=1 a=ecVkfYrEE2AA:10 a=DeDhTLAQbfcA:10
	a=0gcC27t9AAAA:8 a=XUJFkFnM_D6AkQQpAeAA:9
	a=w3s3o-fN9efVpVIs0SK-LTmOiNoA:4 a=4KgpRpU3nOMA:10
X-CM-Score: 0.00
Date: Thu, 16 Apr 2009 09:33:53 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090416163353.GG17629@smtp.west.cox.net>
References: <20090414234609.GA27890@denix.org>
	<1239752998-7677-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1239752998-7677-1-git-send-email-denis@denix.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.39
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] udev 124: add cache invalidation logic on kernel	change or its bootargs/cmdline
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
X-List-Received-Date: Thu, 16 Apr 2009 16:37:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2009 at 07:49:58PM -0400, Denys Dmytriyenko wrote:

> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  recipes/udev/udev-124/init |   10 +++++++++-
>  1 files changed, 9 insertions(+), 1 deletions(-)

So, for making it optional, how about adding something to /etc/default
to enable / disable dev caching all together?  And, I believe
/proc/atags would just be cp /proc/atags /tmp/atags || touch /tmp/atags.

-- 
Tom Rini


