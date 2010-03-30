Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NwY16-0003pa-GL
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 11:45:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2U9gYfQ026123
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 10:42:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25821-05 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 10:42:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2U9gQak026117
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 10:42:26 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hosgi3$v83$1@dough.gmane.org>
References: <1269878004.1681.331.camel@rex>
	<20100329174253.GC25428@gmail.com> <1269898959.1681.692.camel@rex>
	<hosgi3$v83$1@dough.gmane.org>
Date: Tue, 30 Mar 2010 10:42:25 +0100
Message-ID: <1269942145.1681.859.camel@rex>
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
X-List-Received-Date: Tue, 30 Mar 2010 09:45:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-03-30 at 11:33 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 29-03-10 23:42, Richard Purdie wrote:
> > On Mon, 2010-03-29 at 10:42 -0700, Khem Raj wrote:
> >> I have had gcc build all runtimes libraries separately. I think we should
> >> device gcc build and we can disable building certain directories via
> >> --disable-<dir>. We dont have to stash libgcc. Its not a big library and
> >> its probably better to rebuild it along with rest of runtime libraries IMO
> >> and probably we should have packages for each language runtime so people
> >> who dont need C++ or Java or fortran dont have to build those. The same
> >> should be tunable in gcc builds too.
> > 
> > I talked with Khem on irc but just for the record here, I've done some
> > testing with gcc 4.3.3 in Poky and have pushed my results to:
> > 
> > http://git.pokylinux.org/cgit.cgi/poky/log/?h=master-gcc-runtime-testing
> > 
> > This adds a gcc-runtime recipe which builds libgcc, libssp and libstdc++
> > as test cases. It will be possible to build other runtime libs
> > conditionally on whether they're enabled like libfortran easily enough.
> 
> Can't we have seperate recipes for ssp, stdc++, fortran, java, etc? I
> don't think we need USEFLAGs for this when we build them seperately anyway.

We'd not be using USEFLAGS, we'd just be looking at the line which tells
gcc itself which bits to build. Having separate recipes doesn't solve
the problem since we'd still have to work out whether the compiler for a
given lib was built and then we enter a dependency nightmare working out
which packages need which combinations of compilers and compiler libs.

So we can have separate recipes but think through the issues and see
whether you still like the idea... 

Cheers,

Richard



