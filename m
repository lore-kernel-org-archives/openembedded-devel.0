Received: from zmta01.irigo.dk ([193.200.44.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@doredevelopment.dk>) id 1Pzjj3-0007jD-L4
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 06:56:53 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zmta01.irigo.dk (Postfix) with ESMTP id B6AFE24C047D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 06:47:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at zmta01.irigo.dk
Received: from zmta01.irigo.dk ([127.0.0.1])
	by localhost (zmta01.irigo.dk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMMfrMBKFMWz
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 06:47:58 +0100 (CET)
Received: from [192.168.1.191] (0x55532124.adsl.cybercity.dk [85.83.33.36])
	by zmta01.irigo.dk (Postfix) with ESMTPSA id 46AF824C046F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 06:47:58 +0100 (CET)
From: Esben Haabendal <eha@doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110315220301.GC3042@denix.org>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>  <20110315220301.GC3042@denix.org>
Organization: DoreDevelopment ApS
Date: Wed, 16 Mar 2011 06:47:57 +0100
Message-ID: <1300254477.2818.5.camel@eha>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Eliminating dependency race-conditions
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
X-List-Received-Date: Wed, 16 Mar 2011 05:56:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-15 at 18:03 -0400, Denys Dmytriyenko wrote:
> On Tue, Mar 15, 2011 at 10:08:37AM +0100, Esben Haabendal wrote:
> > On Fri, 2011-03-11 at 12:04 +0100, Steffen Sledz wrote:
> > > which occurred sometimes depending on build order (not in clean
> > > package only builds).
> > 
> > I would like to raise awareness of the underlying problem here.
> > 
> > The current dependency/staging model of OE basically has this feature
> > that a build can be influenced not only by it's own dependencies, but
> > also what has been build before it (or not).
> > 
> > I strongly believe that this has to be fixed on the architectural level,
> > and not just on a case-by-case level as is currently needed.
> > 
> > I haven't received much feedback on the preivous posting about the
> > per-recipe staging principle implemented in OE-lite, but I decided to
> > take this opportunity to re-iterate the fact that the OE-lite
> > implementation of staging and build dependencies eliminates this
> > problem.
> > 
> > I am still very much interested in discussing how to move this
> > technology from OE-lite to OE, but as it impacts all recipe metadata
> > (build dependencies has to be redefined), OE community at a large really
> > needs to value the benefits of solving this problem.
> 
> Esben,
> 
> Thanks for raising this issue and making people aware of it!
> 
> This has previously been discussed several times, including last time during 
> the Yocto Summit in December, where I brought up the question of per-package 
> staging/dependency to Richard's attention, when he introduced the new Shared 
> State (sstate). While per-package dependency wasn't considered a critical 
> must-have feature right away, it was acknowledged as something worthwhile 
> looking at and, according to Richard, should be easy to accomplish with the 
> new sstate functionality...

There is two different objectives in this.

Per-recipe staging and per-package build-time dependencies.  While I
assume per-recipe staging will be doable to build on top of sstate,
per-package build-time dependencies is not really related to sstate, but
is mostly a meta-data issue (man-hours wise), while also requiring
changes to tbe BitBake cooker.

The final thing that I have found while solving the above issues, is how
simple (KISS!) all this can be addressed when going from per-recipe
build-time dependencies to per-package.  And I really think that we need
more KISS in OE ;-)

/Esben





