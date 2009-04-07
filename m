Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LrEPF-0007A5-Of
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 18:44:20 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090407164114.DUTF6112.fed1rmmtao102.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Apr 2009 12:41:14 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id cghB1b00B4dMFYL03ghB0E; Tue, 07 Apr 2009 12:41:13 -0400
X-Authority-Analysis: v=1.0 c=1 a=0sXtSTLkSA4A:10 a=CEQruDUxg1kA:10
	a=wMNdZWldAAAA:8 a=V7NSixQb32qxfkKRf8gA:9
	a=KOD7Xz3jyV4qU70_icZklBvAriUA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 7 Apr 2009 09:41:11 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090407164111.GC2195@smtp.west.cox.net>
References: <d2b9ea600904061614r2839effbla380925d536c3999@mail.gmail.com>
	<20090406235402.GA2195@smtp.west.cox.net>
	<d2b9ea600904070011m2233742by5b8af78fa8417261@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <d2b9ea600904070011m2233742by5b8af78fa8417261@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.44
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] mingw-binutils: update to 2.19.1
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
X-List-Received-Date: Tue, 07 Apr 2009 16:44:21 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Apr 07, 2009 at 09:11:17AM +0200, Esben Haabendal wrote:
> On Tue, Apr 7, 2009 at 1:54 AM, Tom Rini <trini@kernel.crashing.org> wrote:
> > On Tue, Apr 07, 2009 at 01:14:07AM +0200, Esben Haabendal wrote:
> >
> >> Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
> >> ---
> >>  .../mingw-binutils-canadian-cross_2.19.1.bb        |   11 +++++++++++
> >>  recipes/binutils/mingw-binutils_2.19.1.bb          |   12 ++++++++++++
> >>  2 files changed, 23 insertions(+), 0 deletions(-)
> >>  create mode 100644 recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
> >>  create mode 100644 recipes/binutils/mingw-binutils_2.19.1.bb
> >
> > First, this isn't in .dev yet.  Second..
> 
> I know, it should apply there cleanly as well, but I need to test it...
> 
> >> diff --git a/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
> >> b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
> >> new file mode 100644
> >> index 0000000..27e06c6
> >> --- /dev/null
> >> +++ b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
> >> @@ -0,0 +1,11 @@
> >> +require mingw-binutils_${PV}.bb
> >> +require binutils-canadian-cross.inc
> >> +
> >> +DEFAULT_PREFERENCE_sdk-mingw32 = "1"
> >> +DEFAULT_PREFERENCE_sdk-mingw64 = "1"
> >
> > That's meaningless atm.  Or at least it is for how I've been doing all
> > of the build tests (SDK_OS=mingw32), it would be just _mingw32 (does
> > mingw64 work yet?).  Finally, do we really want to make this default
> > when we're still building gcc-3.4.5?  I wouldn't think so, but I assume
> > this means a gcc 4 actual release is soon.
> 
> The gcc 4 relase from MinGW project seem to have been in the same
> state for quite a while.
> I wonder when they will change it.

Well, any idea why it's still "alpha" ?

> Any special reason why we don't want to use a newer binutils for gcc-3.4.5?

I suppose binutils might be less problematic than gcc but the
possibility of issues arising when using much newer toolchains to build
fairly old toolchains is something Khem brought up recently in the
context of our gcc-cross-kernel-3.* recipes.

> I don't remember seeing any problems with that, but maybe I have just
> been lucky on that issue :-)
> 
> The reason I pulled in this release was actually that I had a failure
> with ld from the old binutils when building mingw-runtime.

Can you provide some more details on this?

> So unless something points against setting 2.19.1 as default, I think we should.

After some testing, yeah :)

-- 
Tom Rini


