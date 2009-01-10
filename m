Received: from [68.230.241.58] (helo=fed1rmmtai102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LLgLv-0004uJ-DH
	for openembedded-devel@openembedded.org; Sat, 10 Jan 2009 17:06:23 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090110153243.EUZX12838.fed1rmmtao103.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 10 Jan 2009 10:32:43 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id 1rYh1b0011E665w03rYhdc; Sat, 10 Jan 2009 10:32:43 -0500
X-Authority-Analysis: v=1.0 c=1 a=LLvST7gcIdsA:10 a=0G8rmy93P40A:10
	a=b2ZvGRdsAAAA:8 a=4VfeMOr1OrhiZQKTfkEA:9 a=zwrM1v0UhoyZDVkTTi4A:7
	a=urZiJMW5eUY_1Yc7QSvQUzLz5XAA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sat, 10 Jan 2009 08:33:13 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090110153313.GM400@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<1231462490.6467.85.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1231462490.6467.85.camel@dax.rpnet.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: RFC: "Virtual" native and sdk recipes
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
X-List-Received-Date: Sat, 10 Jan 2009 16:06:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 09, 2009 at 12:54:50AM +0000, Richard Purdie wrote:
> On Fri, 2009-01-02 at 01:11 +0000, Richard Purdie wrote:
> > I just had a look through the trini/canadian-sdk branch and there are
> > bits I like and bits I dislike. I'll try and provide some feedback in
> > due course with a view to getting the less controversial bits merged. I
> > have some tweaks in poky to do with dynamic library extension handling
> > for example (from playing with darwin targets) where it would pay us to
> > find a common solution.
> 
> Sorry for the delayed feedback, what I've looked at so far follows
> below. It was easiest to extract some patches from your tree and make
> some commits of my own so these are in:
> 
> http://git.openembedded.net/?p=openembedded.git;a=shortlog;h=refs/heads/rpurdie/canadian-sofar

This appears to break, DISTRO=angstrom-2008.1 MACHINE=efika bitbake
meta-toolchain-sbox:
Parsing .bb files, please wait...done.
NOTE: Parsing finished. 6091 cached, 0 parsed, 288 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200901101526: started

OE Build Configuration:
BB_VERSION        = "1.8.11"
METADATA_BRANCH   = "trini/canadian-merge"
METADATA_REVISION = "5ebb709879ffac03ffffb98201f00811d42a79e6"
TARGET_ARCH       = "powerpc"
TARGET_OS         = "linux"
MACHINE           = "efika"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2009.X-test-20090110"
TARGET_FPU        = "hard"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1281 of 1655 (ID: 1597, /scratch/trini/canadian-oe/openembedded/packages/xorg-proto/xproto-native_7.0.13.bb, do_qa_staging)
NOTE: package xproto-native-7.0.13: started
NOTE: package xproto-native-1_7.0.13-r0: task do_qa_staging: started
NOTE: QA checking staging
ERROR: QA Issue: openssl.pc failed sanity test (tmpdir) in path /scratch/trini/canadian-oe/build/tmp/staging/i686-linux/usr/lib/pkgconfig
ERROR: QA Issue: glib-2.0.pc failed sanity test (tmpdir) in path /scratch/trini/canadian-oe/build/tmp/staging/i686-linux/usr/lib/pkgconfig
ERROR: QA Issue: xproto.pc failed sanity test (tmpdir) in path /scratch/trini/canadian-oe/build/tmp/staging/i686-linux/usr/lib/pkgconfig
ERROR: QA Issue: gobject-2.0.pc failed sanity test (tmpdir) in path /scratch/trini/canadian-oe/build/tmp/staging/i686-linux/usr/lib/pkgconfig
ERROR: QA Issue: gthread-2.0.pc failed sanity test (tmpdir) in path /scratch/trini/canadian-oe/build/tmp/staging/i686-linux/usr/lib/pkgconfig
ERROR: QA Issue: libopkg.pc failed sanity test (tmpdir) in path /scratch/trini/canadian-oe/build/tmp/staging/i686-linux/usr/lib/pkgconfig
ERROR: QA Issue: libcurl.pc failed sanity test (tmpdir) in path /scratch/trini/canadian-oe/build/tmp/staging/i686-linux/usr/lib/pkgconfig
ERROR: QA Issue: gmodule-no-export-2.0.pc failed sanity test (tmpdir) in path /scratch/trini/canadian-oe/build/tmp/staging/i686-linux/usr/lib/pkgconfig
ERROR: QA Issue: gmodule-2.0.pc failed sanity test (tmpdir) in path /scratch/trini/canadian-oe/build/tmp/staging/i686-linux/usr/lib/pkgconfig
ERROR: QA Issue: gio-unix-2.0.pc failed sanity test (tmpdir) in path /scratch/trini/canadian-oe/build/tmp/staging/i686-linux/usr/lib/pkgconfig
ERROR: QA Issue: zlib.pc failed sanity test (tmpdir) in path /scratch/trini/canadian-oe/build/tmp/staging/i686-linux/usr/lib/pkgconfig
ERROR: QA Issue: gio-2.0.pc failed sanity test (tmpdir) in path /scratch/trini/canadian-oe/build/tmp/staging/i686-linux/usr/lib/pkgconfig
ERROR: QA Issue: gmodule-export-2.0.pc failed sanity test (tmpdir) in path /scratch/trini/canadian-oe/build/tmp/staging/i686-linux/usr/lib/pkgconfig
ERROR: QA staging was broken by the package built above
ERROR: Error in executing: /scratch/trini/canadian-oe/openembedded/packages/xorg-proto/xproto-native_7.0.13.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Build of /scratch/trini/canadian-oe/openembedded/packages/xorg-proto/xproto-native_7.0.13.bb do_qa_staging failed
ERROR: Task 1597 (/scratch/trini/canadian-oe/openembedded/packages/xorg-proto/xproto-native_7.0.13.bb, do_qa_staging) failed
NOTE: Tasks Summary: Attempted 1280 tasks of which 1280 didn't need to be rerun and 1 failed.
ERROR: '/scratch/trini/canadian-oe/openembedded/packages/xorg-proto/xproto-native_7.0.13.bb' failed
NOTE: build 200901101526: completed

I'll try and poke around.

-- 
Tom Rini


