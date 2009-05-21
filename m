Received: from [85.33.2.26] (helo=smtp-out26.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1M7BFL-0006vl-Pa
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 18:35:56 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 21 May 2009 18:27:52 +0200
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Thu, 21 May 2009 18:27:51 +0200
Received: from [192.168.1.107] ([79.54.130.51]) by FBCMCL01B08.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 21 May 2009 18:23:14 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1242921442.27094.26.camel@port4>
References: <4A1563B0.4090406@taupro.com>  <1242921442.27094.26.camel@port4>
Date: Thu, 21 May 2009 18:29:35 +0200
Message-Id: <1242923375.27094.33.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 21 May 2009 16:23:14.0750 (UTC)
	FILETIME=[7118B5E0:01C9DA30]
Subject: Re: Changing a machine def and rebuilding tool chain?
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
X-List-Received-Date: Thu, 21 May 2009 16:35:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-05-21 at 17:57 +0200, GNUtoo wrote:
> On Thu, 2009-05-21 at 09:22 -0500, Jeff Rush wrote:
> > I'm working on a machine definition for the old TuxScreen hardware as I
> > haven't seen one already defined in the OE metadata.
> > 
> > Initially I had a:
> > 
> >    TARGET_CC_ARCH = "-march=armv4t -mtune=strongarm"
> > 
> > where the TuxScreen CPU is a StrongARM 1100.  After building a
> > statically-lined "helloworld" program however, it gives me an instruction
> > error when I try to run it on the target hardware.
> > 
> > Figuring it was my use of "armv4t" I changed it to just "-march=armv4
> > -mtune=strongarm".  Doing a:
> > 
> >   $ bitbake -c clean helloworld
> >   $ bitbake helloworld
> > 
> > produces the exact same binary, so obviously I need to rebuild something
> > further upstream in my toolchain.  Does the BitBake system notice that a
> > machine definition has changed, or that a TARGET_CC_ARCH has changed and
> > rebuild the necessary pieces?  Or do I have to blow it all away and rebuild
> > everything whenever something as fundamental as the TARGET_CC_ARCH changes?
> > 
> > Thanks,
> > 
> > -Jeff
> according to http://www.linuxdevices.com/products/PD5824679728.html you
> have a 2.4 kernel.
> Did you try with a 2.4 kenrel, if so the problem could be the arm ABI
> (binaries are produced for EABI and the kenrel support OABI)
> here are more infos on arm ABI:
> http://wiki.debian.org/ArmEabiPort
> 
> I've attached my config for a 2.4 kenrel and oabi in case you have to
> fight against setting openembedded to cross compile to OABI
> 
> Unfortunately some variables were printed after the parsing aren't
> printed anymore...that could help a lot for debuging theses
> problems...maybe you will have to use peek in bitbake -i then...
or to use bitbake -D as I was told on IRC

Denis.




