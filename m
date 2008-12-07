Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L9PRV-0004dI-2l
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 20:37:25 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081207193334.SXLS2948.fed1rmmtao101.cox.net@fed1rmimpo01.cox.net>;
	Sun, 7 Dec 2008 14:33:34 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id oKZV1a00T1E665w03KZXfd; Sun, 07 Dec 2008 14:33:34 -0500
X-Authority-Analysis: v=1.0 c=1 a=EXJT-38Zl-vYhColrD0A:9
	a=ejjDnJxFfUKQ6rrw3C6wHVtz9IUA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sun, 7 Dec 2008 12:33:40 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081207193340.GC15204@smtp.west.cox.net>
References: <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<d2b9ea600810211323y1dd1fc11i585f26f044696de9@mail.gmail.com>
	<20081202174141.GB16628@smtp.west.cox.net>
	<1228250322.5456.70.camel@dax.rpnet.com>
	<20081202212155.GG16628@smtp.west.cox.net>
	<20081206214525.GJ16628@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20081206214525.GJ16628@smtp.west.cox.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Esben Haabendal <esbenhaabendal@gmail.com>
Subject: Re: Canadian SDK support
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
X-List-Received-Date: Sun, 07 Dec 2008 19:37:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 06, 2008 at 02:45:25PM -0700, Tom Rini wrote:
> On Tue, Dec 02, 2008 at 02:21:55PM -0700, Tom Rini wrote:
[snip]
> > OK.  Esben, have you had any updates?  If not, I'll take what's on the
> > bugzilla (or depending on my git-fu, pull your tree) and make a branch
> > on the main tree for this.  I really don't want to see this get lost :)
> 
> OK.  I've created a trini/canadian-sdk branch and am going to start a
> number of builds to make sure non-canadian SDKs are fine, before moving
> on to canadian.

I've got regular old meta-toolchain-sbox builds done for qemux86
nokia800 db1200 mpc8313e-rdb nslu2le simpad now.  I tried an AVR32
target, but it needs more than just the MACHINE being passed in.  Happy
to include one of those if someone points me in the right direction.
Shortly I'm going to kick off Canadian builds for these targets too.
What other build-tests would people like to see done here?

As an aside, gcc-cross-sdk on arm(v6 only?) is blowing up in fortran,
but I've got a git bisect narrowing that down now (30 revs left).

-- 
Tom Rini


