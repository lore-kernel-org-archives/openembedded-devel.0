Received: from [192.67.63.145] (helo=rampart.timecastle.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeff@taupro.com>) id 1M79Hp-0000iw-6L
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 16:30:21 +0200
Received: from [192.168.3.100] (adsl-68-95-128-31.dsl.rcsntx.swbell.net
	[68.95.128.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by rampart.timecastle.net (Postfix) with ESMTP id 6910F2D072;
	Thu, 21 May 2009 09:22:45 -0500 (CDT)
Message-ID: <4A1563B0.4090406@taupro.com>
Date: Thu, 21 May 2009 09:22:40 -0500
From: Jeff Rush <jeff@taupro.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
OpenPGP: id=AA9D62B9
Subject: Changing a machine def and rebuilding tool chain?
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
X-List-Received-Date: Thu, 21 May 2009 14:30:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm working on a machine definition for the old TuxScreen hardware as I
haven't seen one already defined in the OE metadata.

Initially I had a:

   TARGET_CC_ARCH = "-march=armv4t -mtune=strongarm"

where the TuxScreen CPU is a StrongARM 1100.  After building a
statically-lined "helloworld" program however, it gives me an instruction
error when I try to run it on the target hardware.

Figuring it was my use of "armv4t" I changed it to just "-march=armv4
-mtune=strongarm".  Doing a:

  $ bitbake -c clean helloworld
  $ bitbake helloworld

produces the exact same binary, so obviously I need to rebuild something
further upstream in my toolchain.  Does the BitBake system notice that a
machine definition has changed, or that a TARGET_CC_ARCH has changed and
rebuild the necessary pieces?  Or do I have to blow it all away and rebuild
everything whenever something as fundamental as the TARGET_CC_ARCH changes?

Thanks,

-Jeff



