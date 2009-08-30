Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Mhg4R-0007Mw-VD
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 10:47:32 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Mhfmf-0002QV-N7
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 09:29:10 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1251619852.4215.666.camel@lenovo.internal.reciva.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<20090829020254.GC6785@smtp.west.cox.net>
	<19c1b8a90908290050q60b6d47dw7b559087e343dc41@mail.gmail.com>
	<20090830012244.GA5033@gmail.com>
	<1251619852.4215.666.camel@lenovo.internal.reciva.com>
Date: Sun, 30 Aug 2009 09:29:07 +0100
Message-Id: <1251620948.4215.673.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS	=	linux-gnuspe for e500
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
X-List-Received-Date: Sun, 30 Aug 2009 08:47:32 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-08-30 at 09:10 +0100, Phil Blundell wrote:
> On Sat, 2009-08-29 at 18:22 -0700, Khem Raj wrote:
> > We can override only for powerpc second time around. So changing it
> to 
> > 
> > TARGET_OS_powerpc =
> > "linux${@['','-gnuspe'][bb.data.getVar('TARGET_ARCH',d,1) in ['ppc',
> > 'powerpc'] and bb.data.getVar('MACHINE',d) in ['calamari',
> 'tqm8540']]}"
> > 
> > will that be ok ?
> 
> That's better, but it still doesn't seem terribly elegant.  I also
> remain slightly unconvinced that the eglibc-specific file is,
> conceptually, the right place for this logic. 

Actually, there is still a bigger problem with this change: it will
cause the ABI to change in a semi-random way depending on the selected
MACHINE and this will screw up people who are trying to do multimachine
builds.

For example, if I set MACHINE=calamari and then bitbake micro-image, it
will select linux-gnuspe and I will presumably get the SPE ABI.  But
then, if I set MACHINE=efika, say, and build another package in the same
tree, it'll now select regular linux and the ABI will change, although
this won't be reflected in the naming of the output packages: they'll
all just be named "powerpc".  Worse, if eglibc itself happens to be
version-bumped while I am building for efika, my C library will be
quietly recompiled with a different ABI and, presumably, lose in a
fairly serious way.

p.




