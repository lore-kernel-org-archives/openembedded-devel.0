Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LIVcG-0001vG-Uo
	for openembedded-devel@openembedded.org; Thu, 01 Jan 2009 23:02:09 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090101215627.SYFH131.fed1rmmtao107.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 1 Jan 2009 16:56:27 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id yMwS1a00C1E665w04MwSNz; Thu, 01 Jan 2009 16:56:26 -0500
X-Authority-Analysis: v=1.0 c=1 a=uDHEWIsU9mQA:10 a=nUQUF18d54MA:10
	a=b2ZvGRdsAAAA:8 a=PjBgo13E6nASBsMl_BUA:9 a=KajAkloILao5INTkYFUA:7
	a=FCsAhEOMPW4Kh7oLLjxrMKKeKlUA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 1 Jan 2009 14:56:53 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090101215653.GG7040@smtp.west.cox.net>
References: <20081222211049.GB4287@smtp.west.cox.net>
	<c384c5ea0901011332w109a42euec5bfcefb3100ca5@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0901011332w109a42euec5bfcefb3100ca5@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Please review trini/canadian-sdk branch
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
X-List-Received-Date: Thu, 01 Jan 2009 22:02:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 01, 2009 at 10:32:35PM +0100, Leon Woestenberg wrote:
> Hello Tom,
> 
> On Mon, Dec 22, 2008 at 10:10 PM, Tom Rini <trini@kernel.crashing.org> wrote:
> > Hey all.  Can people please review the trini/canadian-sdk branch, in
> > terms of content?  If things are good at this point content-wise, I'll
> > split the commits up roughly along the lines of the original patches in
> > http://bugs.openembedded.net/show_bug.cgi?id=4664 but with checksums
> > added in each new commit.
> >
> I noticed your *poke* but I'm new on inspecting branches with GIT.
> 
> How could I easily browse through the content? I think I would like to
> see the changed and newly added content in an easy way.

I _think_ the easy way is 'git diff
51fc27d415c1f9d0a5f6ce7aae220e7268069725..trini/canadian-sdk'.  Or
something close to that (51.. is the last HEAD i synced with).

> Also, do you have any pointers on how to use the canadian sdk stuff?
> 
> Maybe a tested build I might reproduce?

In the bug attachments is the required additions to your local.conf, and
I've been doing builds of both canadian-sdk and meta-toolchain-sbox, for
angstrom208.1 + canadian definitions for efika db1200 mpc8313e-rdb
nokia800 nslu2le qemux86 and simpad.  I've actually tested the canadian
outputs on nokia800 and qemux86 (as those are what I can easily test)
for both XP and Vista.

It might indeed make sense to put some of the conf stuff into the
regular include files, somewhere, but I don't know where, so a
suggestion would be welcome :)

-- 
Tom Rini


