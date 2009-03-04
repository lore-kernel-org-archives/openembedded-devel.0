Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LexhQ-0003S9-SL
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 21:28:17 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090304202401.DDJI4363.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 4 Mar 2009 15:24:01 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id P8Py1b0074dMFYL048Pylt; Wed, 04 Mar 2009 15:24:00 -0500
X-Authority-Analysis: v=1.0 c=1 a=af50XY3WUk0A:10 a=xz7DMSkBCQEA:10
	a=XwMTGu9mEhT4Van5oFYA:9 a=YgaccPdRzmGHacAfW2KUDvV5JkQA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 4 Mar 2009 13:23:57 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090304202357.GZ26343@smtp.west.cox.net>
References: <1236178350.4249.5.camel@debian.dorg.org>
	<20090304153617.GQ26343@smtp.west.cox.net>
	<1236195338.4249.20.camel@debian.dorg.org>
	<20090304194502.GX26343@smtp.west.cox.net>
	<1236197506.4249.25.camel@debian.dorg.org>
MIME-Version: 1.0
In-Reply-To: <1236197506.4249.25.camel@debian.dorg.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Compile OE on Sun Ultrasparc 64 architecture?
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
X-List-Received-Date: Wed, 04 Mar 2009 20:28:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2009 at 09:11:46PM +0100, harald wrote:
[snip]
> > > | /bin/sh ../sparc64-linux-libtool --mode=compile
[snip]
> libtool was not even installed. there is no libtool-devel package
> available for lenny at all. for none of the architectures. have
> installed libtool 1.5.26-4. No updates available. same message than
> before. do i need to reconfigure if i installed addidional packages on
> build host? if yes, how do i do it? think the problem is anywhere in
> sparc configuration. system compiles without libtool on x86_64 machine.

OE is making use of libtool, the version that it compiles for its own
use, I believe, in this case.  Debian as you note provides a host
libtool 1.5.26.  Perhaps Debian has a patch in libtool that needs to be
imported to OE's version for it to have a correct sparc configuration.
Or the problem could be deeper / elsewhere.  Traditionally, sparc hasn't
been the most ... easy to use ... platform, so you may need to do some
serious digging around to see just where the problem lies.

-- 
Tom Rini


