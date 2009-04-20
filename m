Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LvxSL-0005xP-BJ
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 19:38:57 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090420173436.JGHU15318.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 13:34:36 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id htaY1b00H4dMFYL04taYcu; Mon, 20 Apr 2009 13:34:35 -0400
X-Authority-Analysis: v=1.0 c=1 a=C2nCanMo0Ec1LZ5u41UA:9
	a=lKebADfYAOTiiNV2_irp_Z0jxS8A:4
X-CM-Score: 0.00
Date: Mon, 20 Apr 2009 10:34:32 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090420173432.GB17629@smtp.west.cox.net>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF763@hiob.intern.dresearch.de>
	<20090417183927.GU17629@smtp.west.cox.net>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF767@hiob.intern.dresearch.de>
MIME-Version: 1.0
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF767@hiob.intern.dresearch.de>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: initramfs howto?
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
X-List-Received-Date: Mon, 20 Apr 2009 17:38:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2009 at 05:21:46PM +0200, Sledz, Steffen wrote:
> > I don't think that out of the box, "load some modules" can work.  The
> > current initramfs stuff, if I read it right, makes use of a premade
> > cpio.  It should however, be possible to fix this up, with the hardest
> > part being fixing up of the dev nodes.  What follows is a 
> > hack I've done to a specific kernel's do_compile:
> 
> Would be really nice if you can send me the complete bb as an example (or is it in the git repo?). Some things are not fully clear to me.

This is actually something I did in an older snapshot for a customer.
The only part of the normal do_compile I left was the part to unset
flags and make the first header.

-- 
Tom Rini


