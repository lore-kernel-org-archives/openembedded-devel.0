Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lqv02-0001VO-3s
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 22:00:57 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090406195759.XIYH10385.fed1rmmtao107.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 6 Apr 2009 15:57:59 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id cKxx1b0084dMFYL04KxxSV; Mon, 06 Apr 2009 15:57:59 -0400
X-Authority-Analysis: v=1.0 c=1 a=4IYAc8W0s2EA:10 a=-J8vTly0Cj8A:10
	a=wMNdZWldAAAA:8 a=rGij7EbnlDu1QmEEijQA:9 a=OuYe-U4-XCUamLdbDx4A:7
	a=6-nHrwLpqOGTA-I-ZaICz_X707UA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 6 Apr 2009 12:57:56 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090406195756.GT30840@smtp.west.cox.net>
References: <20090403221352.GH30840@smtp.west.cox.net>
	<20090403221721.GI30840@smtp.west.cox.net>
	<20090403221751.GJ30840@smtp.west.cox.net>
	<19c1b8a90904061234i111a38dbg784d78fbc524d332@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <19c1b8a90904061234i111a38dbg784d78fbc524d332@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.39
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=AWL,BAYES_20,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc-cross-sdk: Fix relocation of the toolchain	and bump PR.
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
X-List-Received-Date: Mon, 06 Apr 2009 20:00:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2009 at 12:34:46PM -0700, Khem Raj wrote:
> On 4/3/09, Tom Rini <trini@kernel.crashing.org> wrote:
> > gcc-cross-sdk: Fix relocation of the toolchain and bump PR.
> >  There's two parts to this.  The first is to make relative, not absolute
> >  symlinks for 'cpp', etc.  The second is that we need to configure
> >  without --with-gxx-include-dir and instead install the base C++ headers
> >  into the expected location.  The path passed to --with-gxx-include-dir
> >  will not be relocated and is an absolute.
[snip]
> > -EXTRA_OECONF_PATHS =
> > "--with-gxx-include-dir=${prefix}/${TARGET_SYS}/${layout_includedir}/c++ \
> > -                      --with-sysroot=${prefix}/${TARGET_SYS} \
> > +EXTRA_OECONF_PATHS = "--with-sysroot=${prefix}/${TARGET_SYS} \
> >
> > --with-build-time-tools=${CROSS_DIR}/${TARGET_SYS}/bin \
> >                        --with-build-sysroot=${STAGING_DIR_TARGET}"
> 
> 
> You should wait on the above change. Rest of patch looks good to go.

It's a fun little circle here.  We can't move them until gcc will look
in the right place them and we can't make gcc only look in the right
place until they're moved.  And I didn't want to change gcc-cross-sdk
and meta-toolchains all in one commit.  Since I'll push them all at once
and all the PRs invovled get bumped, the end result is fine (everything
will get rebuilt and know the right stuff)

-- 
Tom Rini


