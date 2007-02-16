Received: from [213.95.27.120] (helo=ganesha.gnumonks.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <laforge@openmoko.org>) id 1HIAOq-0006cq-Bt
	for openembedded-devel@openembedded.org; Fri, 16 Feb 2007 22:13:51 +0100
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.50)
	id 1HIAOo-0004dA-ES
	for openembedded-devel@openembedded.org; Fri, 16 Feb 2007 22:13:46 +0100
Received: from laforge by prithivi.gnumonks.org with local (Exim 3.36 #1)
	id 1HIADb-000368-00; Fri, 16 Feb 2007 22:02:11 +0100
Date: Fri, 16 Feb 2007 22:02:11 +0100
From: Harald Welte <laforge@openmoko.org>
To: Koen Kooi <koen@dominion.kabel.utwente.nl>
Message-ID: <20070216210211.GH10999@prithivi.gnumonks.org>
References: <45D5F14F.1050602@dominion.kabel.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <45D5F14F.1050602@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.5.13 (2006-08-11)
X-Mailman-Approved-At: Fri, 16 Feb 2007 22:29:14 +0100
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: RFC: making uboot safe for multimachine and agree on one spelling
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2007 21:13:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 16, 2007 at 07:00:47PM +0100, Koen Kooi wrote:
 
> After spending some time going trough u-boot recipes trying to make sense of its
> buildsystem, I noticed some strange problems and inconsistencies.
> 
> First the easy part: we need *one* spelling for u-boot, instead of uboot, u-boot, u-bot,
> etc. What is the preferred one nowadays?

u-boot is the official name, so I would recommend to go for that (even
though I hate hyphens inside project names)

> Second: it seems that the 'mkimage' tool is at least arch speficic (at worst
> board-specific), so uboot recipes should install it to
> ${STAGING_NATIVE_DIR}/mkimage.u-boot.${MACHINE_ARCH}

are you sure it's arch specific?  I'm quite surprised about that, since
the uImage format contains a header indicating the architecture, doesn't
it?

If it really uses a different binary format for each arch, yes, we
should change it.  'mkuimage.${MACHINE_ARCH}' sounds like a more user
friendly name, though.

-- 
- Harald Welte <laforge@openmoko.org>          	        http://openmoko.org/
============================================================================
Software for the world's first truly open Free Software mobile phone


