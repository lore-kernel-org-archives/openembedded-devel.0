Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Mhfmq-0006eS-OG
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 10:29:21 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MhfV0-0001xi-SA
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 09:10:56 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090830012244.GA5033@gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<20090829020254.GC6785@smtp.west.cox.net>
	<19c1b8a90908290050q60b6d47dw7b559087e343dc41@mail.gmail.com>
	<20090830012244.GA5033@gmail.com>
Date: Sun, 30 Aug 2009 09:10:52 +0100
Message-Id: <1251619852.4215.666.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS =	linux-gnuspe for e500
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
X-List-Received-Date: Sun, 30 Aug 2009 08:29:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-08-29 at 18:22 -0700, Khem Raj wrote:
> We can override only for powerpc second time around. So changing it to 
> 
> TARGET_OS_powerpc =
> "linux${@['','-gnuspe'][bb.data.getVar('TARGET_ARCH',d,1) in ['ppc',
> 'powerpc'] and bb.data.getVar('MACHINE',d) in ['calamari', 'tqm8540']]}"
> 
> will that be ok ?

That's better, but it still doesn't seem terribly elegant.  I also
remain slightly unconvinced that the eglibc-specific file is,
conceptually, the right place for this logic.  I would propose:

a) write a single, generic function to generate an appropriate TARGET_OS
suffix based on the distro properties, something along the approximate
lines of:

if target_os == "linux":
  # compute and apply appropriate suffix
  linux_suffix = ""
  if bb.data.getVar("LIBC", d, 1) == "uclibc":
    linux_suffix += "uclibc"
  if bb.data.getVar("TARGET_ARCH", d, 1) in [ 'arm', 'armeb' ] and
arm_abi == "eabi":
    linux_suffix += "gnueabi"
  # does this really need to mention both ppc and powerpc; can't we just
pick one?
  if bb.data.getVar('TARGET_ARCH',d,1) in ['ppc', 'powerpc'] and
bb.data.getVar('MACHINE',d) in ['calamari', 'tqm8540'] and "spe" in
distro_features:
    linux_suffix += "gnuspe"
  if linux_suffix != "":
    target_os = "%s-%s" % (target_os, linux_suffix)

(the above is obviously incomplete but I imagine you get the idea)

b) absent an obviously more appropriate place, put it in the top level
sane-toolchain.inc

That way at least we only have this stuff in one place, rather than the
current proliferation of duplicated logic (see the eabi selector for
example).

p.




