Received: from fallback4.mail.ru ([94.100.176.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1OMRJx-0007Ht-OI
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 21:52:26 +0200
Received: from mx30.mail.ru (mx30.mail.ru [94.100.176.44])
	by fallback4.mail.ru (mPOP.Fallback_MX) with ESMTP id 0568520E7B27
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jun 2010 23:37:21 +0400 (MSD)
Received: from [77.51.33.209] (port=35998 helo=localhost)
	by mx30.mail.ru with asmtp id 1OMR5S-000JAE-00
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 23:37:18 +0400
Date: Wed, 9 Jun 2010 23:37:17 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100609193717.GA12397@rainbow>
References: <1276068782-23257-1-git-send-email-mad_soft@inbox.ru>
	<1276068782-23257-4-git-send-email-mad_soft@inbox.ru>
	<20100609133618.GC29724@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20100609133618.GC29724@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam: Not detected
X-Mras: Ok
X-SA-Exim-Connect-IP: 94.100.176.42
X-SA-Exim-Mail-From: mad_soft@inbox.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] mupdf-0.6: new recipe
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
X-List-Received-Date: Wed, 09 Jun 2010 19:52:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 06:36 Wed 09 Jun     , Khem Raj wrote:
> On (09/06/10 11:33), Dmitry Artamonow wrote:
> > +# mupdf crashes (at least on arm) when built with high level of optimization
> > +FULL_OPTIMIZATION = "-O2"
> 
> the commend does not go with the code. O2 is high enough optimization.
> be more specific what does not work and by default OE uses -Os + some 
> specific opt passes.
I think optimization options vary depending on distro. Anyway, I had runtime
crashes on armv5 (hx4700) when mupdf is built with Angstrom's default
optimization flags:
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -Os -ggdb3
Didn't investigate which exactly option leads to fault, but changing CFLAGS to
simple "-O2" produced working build ("-Os" without other flags probably
also does the trick, need to recheck).

So would it be better to add some more text in comment to prevent ambiguity -
something like this?
# mupdf crashes (at least on arm) when built with high level of optimization
# so we need to provide some safe settings


> > +
> > +do_configure() {
> > +    cp ${WORKDIR}/Makerules ${S}/Makerules
> > +
> 
> Why not create a patch for Makerules instread of creating a file and then
> copying. It will help upgrades the patch will get refreshed for any changes
> but this will overwrite those changes.

Well, as far as I can understand, Makerules was designed just to keep
CFLAGS and other host-specific tunings separate from main Makefile.
Currently, Makerules in original tarball contains some host-detecting
logic and corresponding sections with CFLAGS, LDFLAGS, etc. for each
host OS: Linux, Darwin, MinGW and build type - debug or release.
As there's really nothing to reuse for cross-compiling, I decided that
it's better to rewrite this file, than patching it. Patch would be
almost as big as original Makerules (as it would throw almost
everything from it), hard to maintain, and absolutely no help in
upgrades.

-- 
Best regards,
Dmitry "MAD" Artamonow



