Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PvbbZ-00075E-Sc
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 21:28:05 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PvbaA-0005yp-Cf
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 21:26:38 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D714447.1000104@gumstix.com>
References: <4D714447.1000104@gumstix.com>
Date: Fri, 04 Mar 2011 20:26:30 +0000
Message-ID: <1299270390.3930.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Floating point exception in Xorg
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
X-List-Received-Date: Fri, 04 Mar 2011 20:28:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-04 at 11:57 -0800, Neil MacMunn wrote:
> > #1  0x40661fbc in __div0 ()
> >     at /home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r23.2/gcc-4.3.3/libgcc/../gcc/config/arm/lib1funcs.asm:1079
> > #2  0x40661f90 in __udivsi3 ()
> >     at /home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r23.2/gcc-4.3.3/libgcc/../gcc/config/arm/lib1funcs.asm:834
> > #3  0x4065edc4 in OMAPFBOutputGetModes (output=<value optimized out>)
> >     at omapfb-output.c:128
> > #4  0x000f8c60 in xf86ProbeOutputModes (scrn=0x90a990, maxX=2048, maxY=2048)
> >     at xf86Crtc.c:1575

That's a division by zero in what looks like the mode selection code.
At a guess, some parameter which the server is relying on to calculate
the video timings is not being set correctly by the kernel.  You'd need
to inspect the source for OMAPFBOutputGetModes() to figure out what's
up, though.

p.




