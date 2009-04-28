Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LydDy-00020d-J8
	for openembedded-devel@openembedded.org; Tue, 28 Apr 2009 04:39:11 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090428023401.TEBW10385.fed1rmmtao107.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 22:34:01 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id kqa11b00J4dMFYL04qa1Uq; Mon, 27 Apr 2009 22:34:01 -0400
X-Authority-Analysis: v=1.0 c=1 a=aF9EY7e8h2YA:10 a=rQpF7iukuJ8A:10
	a=4HVRqb_MAAAA:8 a=cMxH4qxsAnffxVCsrakA:9
	a=NM08Lc2k09Q8ZO27qpQamxxPylkA:4 a=k-kO48AawpMA:10
X-CM-Score: 0.00
Date: Mon, 27 Apr 2009 19:34:01 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090428023401.GR18788@smtp.west.cox.net>
References: <20090423175928.GE12956@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090423175928.GE12956@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] Teach insane.bbclass to ignore SDK packages wrt	-dev and .so check
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
X-List-Received-Date: Tue, 28 Apr 2009 02:39:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 23, 2009 at 10:59:28AM -0700, Tom Rini wrote:

> With the change to make having libfoo.so symlinks in the main package
> become fatal (along with GNU_HASH) SDK stuff is broken now.  At Richard's
> suggestion, the following patch teaches insane.bbclass to not run the
> -dev check on sdk||canadian-sdk recipes.
> 
> I did this by splitting the devdbg check into two separate checks
> (rather than re-order the checks as we do want to pull dbg stuff out).
> This also clarifies the comments to both.  As an aside, yes we bail out
> if say a file named Kconfig.debug ends up in a package.
> 
> Signed-off-by: Tom Rini <trini@embeddedalley.com>

ping

-- 
Tom Rini


