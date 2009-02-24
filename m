Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LbrBZ-0005j2-8O
	for openembedded-devel@openembedded.org; Tue, 24 Feb 2009 07:54:33 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090224065126.OUPN2948.fed1rmmtao101.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 01:51:26 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id KirQ1b0074dMFYL04irQXQ; Tue, 24 Feb 2009 01:51:26 -0500
X-Authority-Analysis: v=1.0 c=1 a=hjmUo6_iwTf1-Xc1ZCUA:9
	a=nJteQal8-xDW7jX9PsGSIQs_xhUA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 23 Feb 2009 23:51:24 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090224065124.GF2172@smtp.west.cox.net>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090224064639.GE2172@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: checksums situation
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
X-List-Received-Date: Tue, 24 Feb 2009 06:54:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 23, 2009 at 11:46:39PM -0700, Tom Rini wrote:
> On Fri, Feb 13, 2009 at 05:28:08PM +0100, Marcin Juszkiewicz wrote:
> 
> > 
> > Hi
> > 
> > It is nearly two years since conf/checksums.ini was introduced. We 
> > populated it with over 6000 entries during that time (mostly by 
> > automatic fetching of all source on CELF and EWI machines). But there 
> > are problems with it's format.
> 
> I'm going to make a different suggestion.  Lets just drop it.  Part of
> why I say this is that we went back on it being a mandatory thing
> because it was a burden.  And we're already back to adding stuff without
> checksums again (gstreamer, libdaemon on this build so far..).
[snip]
> Oh, and in the 5 minutes the above took to write, gst-plugins-base
> failed to have a checksum too.

OK, this is a me problem.  But the rest of my point stands.  I'm willing
to bet most people aren't making sure the md5/sha1 is right with
upstream, and I think we'd be better off at trying to automatically grab
an upstream verification and use that.

-- 
Tom Rini


