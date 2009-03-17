Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Ljgaa-0007fd-Hs
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 22:12:50 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090317211156.JSDI10385.fed1rmmtao107.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Mar 2009 17:11:56 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id UMBv1b00G4dMFYL03MBvsi; Tue, 17 Mar 2009 17:11:55 -0400
X-Authority-Analysis: v=1.0 c=1 a=7hFh1kqG_eL5xDLm8SUA:9
	a=eypDbAQd1JeMa5Xb_i8TzptY68MA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 17 Mar 2009 14:11:55 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090317211155.GN26343@smtp.west.cox.net>
References: <000001c9a60e$28fd4650$753018ac@GLAMDRING>
	<9B414415A7024345895304717D1B3CCF@aeglos>
MIME-Version: 1.0
In-Reply-To: <9B414415A7024345895304717D1B3CCF@aeglos>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.39
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_40,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Tue, 17 Mar 2009 21:12:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2009 at 05:28:27PM +0100, Ulf Samuelsson wrote:
[snip]
> BTW: The total buildtime was around 2 hours. There is some overhead
> since the build was restarted 3-4 times, and local.conf was changed once.
> I started the build with PARALLEL_MAKE = "-j2" and BB_NUMBER_THREADS=8.

Hmm.  I wonder if the gettext problem was related to having so many
threads.  For my builds I had been getting around 2 hours (once sources
are fetched), but as I've said, I do -j8/4 threads.  I haven't yet
expirimented with my new box, so I'll give a j2/8 threads one a shot and
see where gettext is falling down.

> I noticed that having a lot of threads helps most of the time,
> since the CPUs were executing at max frequency.
>
> When the cross compiler, was built,it was different,
> most of the cores were not used with this configuration.
> 2-3 max while compiling gcc.

Yeah.  I almost wonder if it's worth doing some python string magic to
try and manually bump up PARALLEL_MAKE in recipes that we know are
bottlenecks.

-- 
Tom Rini


