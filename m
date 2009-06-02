Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MBW0F-0002XB-Jd
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jun 2009 17:34:15 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MBVrf-0004Gs-A3
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jun 2009 16:25:24 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MBVrf-0003CC-4Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jun 2009 16:25:23 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <C62896630644CE43BF64B0FF0AC27F0E05B514@mail.ad.skymv.com>
References: <C62896630644CE43BF64B0FF0AC27F0E05B4D2@mail.ad.skymv.com>
	<1243929198.5049.45.camel@lenovo.internal.reciva.com>
	<C62896630644CE43BF64B0FF0AC27F0E05B514@mail.ad.skymv.com>
Date: Tue, 02 Jun 2009 16:25:22 +0100
Message-Id: <1243956322.2611.11.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: bitbake virtual/kernel -c menuconfig
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
X-List-Received-Date: Tue, 02 Jun 2009 15:34:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-06-02 at 07:43 -0700, Chuck Kamas wrote:
> The kernel is 2.6.28 and the patches are the AT91 set.   What is
> interesting is that I change nothing but the distro= line and the
> menuconfig works with the patches applied.  I do know that there is a
> lot hidden behind the distro= line,  that is why I am asking the experts
> for their insight into how it all works and where to look for what is
> going wrong.

I just did "bitbake -c menuconfig
-b ../org.openembedded.dev/recipes/linux/linux_2.6.28.bb" using
DISTRO=minimal, MACHINE=at91sam9263ek and it seemed to apply the patches
correctly:

NOTE: Running task 4 of 5 (ID:
3, /home/pb/oe/org.openembedded.dev/recipes/linux/linux_2.6.28.bb,
do_patch)
NOTE: Applying patch
'linux-2.6.28-at91.patch' (tmp/work/at91sam9263ek-oe-linux-gnueabi/linux-2.6.28-r9/linux-2.6.28-at91.patch)
NOTE: Applying patch
'linux-2.6.28-exp.patch' (tmp/work/at91sam9263ek-oe-linux-gnueabi/linux-2.6.28-r9/linux-2.6.28-exp.patch)
NOTE: Running task 5 of 5 (ID:
4, /home/pb/oe/org.openembedded.dev/recipes/linux/linux_2.6.28.bb,
do_menuconfig)

So, I'm a bit baffled as to why it isn't working for you.  I also tried
the same thing with DISTRO=micro and, again, it worked fine for me.

> Regarding Angstrom:  I have no animosity against it. I am simply
> following the rule: "start with the bare metal and build up".

Right, that's a perfectly respectable point of view.  Micro, at least,
is less complicated than Angstrom and does have the potential to produce
smaller images.  Actually, that reminds me, I have some patches to
eliminate further bloat in micro that I should submit :-)

p.




