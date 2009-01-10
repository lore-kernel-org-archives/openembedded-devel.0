Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LLjFo-0000AN-UK
	for openembedded-devel@openembedded.org; Sat, 10 Jan 2009 20:12:17 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090110190555.XGQM2342.fed1rmmtao102.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 10 Jan 2009 14:05:55 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id 1v5v1b00K1E665w03v5vTu; Sat, 10 Jan 2009 14:05:55 -0500
X-Authority-Analysis: v=1.0 c=1 a=LLvST7gcIdsA:10 a=0G8rmy93P40A:10
	a=b2ZvGRdsAAAA:8 a=75kK3m_RliEsMGiiZe0A:9
	a=YNGGOTXZnBSnwfwglcL5L1Nb2u8A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sat, 10 Jan 2009 12:06:27 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090110190627.GP400@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<1231462490.6467.85.camel@dax.rpnet.com>
	<20090110153313.GM400@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090110153313.GM400@smtp.west.cox.net>
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
X-List-Received-Date: Sat, 10 Jan 2009 19:12:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 10, 2009 at 08:33:13AM -0700, Tom Rini wrote:
> On Fri, Jan 09, 2009 at 12:54:50AM +0000, Richard Purdie wrote:
> > On Fri, 2009-01-02 at 01:11 +0000, Richard Purdie wrote:
> > > I just had a look through the trini/canadian-sdk branch and there are
> > > bits I like and bits I dislike. I'll try and provide some feedback in
> > > due course with a view to getting the less controversial bits merged. I
> > > have some tweaks in poky to do with dynamic library extension handling
> > > for example (from playing with darwin targets) where it would pay us to
> > > find a common solution.
> > 
> > Sorry for the delayed feedback, what I've looked at so far follows
> > below. It was easiest to extract some patches from your tree and make
> > some commits of my own so these are in:
> > 
> > http://git.openembedded.net/?p=openembedded.git;a=shortlog;h=refs/heads/rpurdie/canadian-sofar
> 
> This appears to break, DISTRO=angstrom-2008.1 MACHINE=efika bitbake
> meta-toolchain-sbox:

Found it!  The following is needed (I'll push to your branch shortly):

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 3e32830..3a2cadc 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -383,12 +383,11 @@ def package_qa_check_staged(path,d):
 
     installed = "installed=yes"
     iscrossnative = False
+    pkgconfigcheck = tmpdir
     for s in ['cross', 'native', 'canadian-cross', 'canadian-native']:
         if bb.data.inherits_class(s, d):
             pkgconfigcheck = workdir
             iscrossnative = True
-    else:
-        pkgconfigcheck = tmpdir
 
     # find all .la and .pc files
     # read the content

-- 
Tom Rini


