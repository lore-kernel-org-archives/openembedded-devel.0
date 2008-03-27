Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Jf1Dx-0003dX-UY
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 00:09:35 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20080327230929.DIEY6668.fed1rmmtao107.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 19:09:29 -0400
Received: from opus ([68.230.58.230]) by fed1rmimpo03.cox.net with bizsmtp
	id 6P9U1Z0094y2VvG04P9Un9; Thu, 27 Mar 2008 19:09:30 -0400
Date: Thu, 27 Mar 2008 16:09:28 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080327230928.GD11881@smtp.west.cox.net>
References: <1206638249.4514.57.camel@dax.rpnet.com>
	<fsgsaq$nqf$1@ger.gmane.org> <47EC2661.90702@bolloretelecom.eu>
MIME-Version: 1.0
In-Reply-To: <47EC2661.90702@bolloretelecom.eu>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: ipkg/opkg offical response
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
X-List-Received-Date: Thu, 27 Mar 2008 23:09:45 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Mar 27, 2008 at 11:57:37PM +0100, Jeremy Lainé wrote:
> Koen Kooi wrote:
> > Richard Purdie schreef:
> > 
> > | * Adding do_deploy to packaged-staging's knowledge. This is best done
> > | with the patch for kernel.bbclass that thesing was been working on. I've
> > | made some suggestions for tweaks (looking at the version already in
> > | poky) and suggested he commits it after that.
> > 
> > That patch broke uImage kernels *real bad*, I just pushed a fix for it.
> 
> I have pushed an additional fix for the changes to kernel.bbclass.
> The DEPENDS added by kernel.bbclass (u-boot-mkimage-native) conflicted
> with the one added by linux.inc (u-boot-mkimage-openmoko-native).
> 
> I changed the DEPENDS to u-boot-mkimage-openmoko-native in
> kernel.bbclass and removed the DEPENDS from linux.inc. The assumption
> here is that u-boot-mkimage-openmoko-native is a strict superset of
> u-boot-mkimage-native.

I'll ask the silly qustion.  Given that mkimage hasn't changed in I
don't know how long, why are both providing it?  Just to save on sources
downloaded?  Did OM really change mkimage?

-- 
Tom Rini


