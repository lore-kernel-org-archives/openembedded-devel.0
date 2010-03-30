Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NwYkK-0005wd-33
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 12:32:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2UATHDO026591
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 11:29:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26383-04 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 11:29:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2UAT9uc026585
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 11:29:09 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hosiv0$875$1@dough.gmane.org>
References: <1269878004.1681.331.camel@rex>
	<20100329174253.GC25428@gmail.com> <1269898959.1681.692.camel@rex>
	<hosgi3$v83$1@dough.gmane.org> <1269942145.1681.859.camel@rex>
	<hosiv0$875$1@dough.gmane.org>
Date: Tue, 30 Mar 2010 11:29:07 +0100
Message-ID: <1269944947.1681.905.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Standalone gcc library builds
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
X-List-Received-Date: Tue, 30 Mar 2010 10:32:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-03-30 at 12:14 +0200, Koen Kooi wrote:
> On 30-03-10 11:42, Richard Purdie wrote:
> > On Tue, 2010-03-30 at 11:33 +0200, Koen Kooi wrote:
> >> Can't we have seperate recipes for ssp, stdc++, fortran, java, etc? I
> >> don't think we need USEFLAGs for this when we build them seperately anyway.
> > 
> > We'd not be using USEFLAGS, we'd just be looking at the line which tells
> > gcc itself which bits to build. Having separate recipes doesn't solve
> > the problem since we'd still have to work out whether the compiler for a
> > given lib was built and then we enter a dependency nightmare working out
> > which packages need which combinations of compilers and compiler libs.
> > 
> > So we can have separate recipes but think through the issues and see
> > whether you still like the idea... 
> 
> Let's put it in a different way:
> 
> Can we stop artificially limiting the toolchain options and have people
> opt-out instead of opt-in for stuff? I really need a full featured
> toolchain :)

I see no reason why the default compiler shouldn't be the fully featured
one and then distros and users can turn off the bits they don't want if
they choose to.

Is that the issue you mean or is there a concern I'm missing?

I can see the other side though, its a pain having to fight fortran
build failures when upgrading the compiler if you never use fortran. Its
this point where it becomes a pain to have so many old versions of
things as this would be much simpler to arrange and maintain if we had
less gcc versions. I worry about trying to add gcc-runtime to OE for
this reason.

[remark about Poky removed]

Cheers,

Richard




