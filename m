Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LuUWz-00056c-O0
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 18:33:52 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090416162945.HGLP22254.fed1rmmtao106.cox.net@fed1rmimpo02.cox.net>;
	Thu, 16 Apr 2009 12:29:45 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id gGVi1b00C4dMFYL04GVipo; Thu, 16 Apr 2009 12:29:45 -0400
X-Authority-Analysis: v=1.0 c=1 a=tid_rkRsmLIA:10 a=mbpeHvT-P2EA:10
	a=4Q1qM1fRJH0BXGjfW9YA:9 a=r7g7an-8955n7iwtc-UA:7
	a=mhw19vOfLmUuv-8myiDauDMQOqQA:4
X-CM-Score: 0.00
Date: Thu, 16 Apr 2009 09:29:42 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090416162942.GF17629@smtp.west.cox.net>
References: <1239739518-1325-1-git-send-email-dhuggins@cs.cmu.edu>
MIME-Version: 1.0
In-Reply-To: <1239739518-1325-1-git-send-email-dhuggins@cs.cmu.edu>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.40
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: David Huggins-Daines <dhuggins@cs.cmu.edu>
Subject: Re: [PATCH] Supply uclibc-thread-db package expected by	task-sdk-base
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
X-List-Received-Date: Thu, 16 Apr 2009 16:33:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2009 at 04:05:18PM -0400, David Huggins-Daines wrote:

> Currently, building task-sdk-base (and by extension meta-toolchain) fails
> for uclibc targets.  This is because task-sdk-base depends on the thread
> debugging library uclibc-thread-db, but this is not built by the uclibc
> recipe unless PTHREADS_DEBUG_SUPPORT is enabled.  In addition, once it is
> built, if you are using Debian version numbers, it will be helpfully
> renamed to "libthread-db1" and the build will still fail.
> 
> This patch fixes these problems, it's against stable/2009 but will also
> apply to .dev

That's interesting as when I pushed these changes I did test with a
uclibc target too.  What DISTRO/MACHINE are you using?

-- 
Tom Rini


