Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I6Tt6-00009i-HC
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2007 18:09:00 +0200
Received: by ug-out-1314.google.com with SMTP id i24so527851ugd
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2007 09:03:48 -0700 (PDT)
Received: by 10.82.152.16 with SMTP id z16mr20505260bud.1183651427683;
	Thu, 05 Jul 2007 09:03:47 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.17])
	by mx.google.com with ESMTP id y2sm46193315mug.2007.07.05.09.03.46
	(version=SSLv3 cipher=OTHER); Thu, 05 Jul 2007 09:03:47 -0700 (PDT)
Date: Thu, 5 Jul 2007 19:03:37 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <1223999433.20070705190337@gmail.com>
To: Tom Walsh <tom@openhardware.net>
In-Reply-To: <468C7B11.8050809@openhardware.net>
References: <468C7B11.8050809@openhardware.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: howto? Build something but not deploy in root image
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
X-List-Received-Date: Thu, 05 Jul 2007 16:09:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Tom,

Thursday, July 5, 2007, 8:01:05 AM, you wrote:

> I know, this has come up before.  Reading through some of the old 
> messages I see this discussed, but, I do not see any solution(s) mentioned?

  Well, until recently, OE had issues with building truly minimal and
well-polished images. This yet needs to be described in howto-like
manner, that's on my todo.

> I have several parts to this project that must be built during the 
> bitbake process (bootstrap-image), but are not part of the target 
> filesystem image.  The total system parts are:

> * bootloader - ARM - resides in Flash.
> * kernel - ARM - resides in Flash.
> * target rootfs image - ARM - resides on MMC card.
> * Flash Utility - native (x86) - runs on host computer.

> The concept for the system is that the bootloader starts the RAM and 
> other hardware up.  It then copies the kernel image into RAM and 
> launches it.  The kernel is configured to look for its root filesystem
> on the MMC card.  Essentially, I boot the kernel from Flash, but the 
> kernel boots from the MMC card.

> The only thing that I need in the root filesystem (tmp/rootfs/) is the
> packages I named from the local conf files.

  This is one feature which is possible now. You name exact and
complete list of packages you want to install into image, and nothing
else gets installed, not even dependencies. This is of course highly
special-purpose feature, and you don't want to use it on realistic
rootfs with dozens of packages, it is indtended for initrds/initramfs,
which consist of few packages and where each KB counts.

>  The kernel does need to be
> there, it soaks up space uselessly.

  Kernel is indeed special case, and there was some kind of adhoc
support for doing what you want all the time in OE. Couple of months
ago Richard Purdie implemented more scalable support for this though,
so search archives for his RFC.

> As to the bootloader, it comes in two sections (files), these are 
> programmed by the Flash Utility into the target system.  The bootloader
> is not needed in the root filesystem.

  Besides two special cases above, when you really need to subvert
OE's dependency handling, for all other cases you just need to get it
right. The only reason why bootloader is installed into image is that
something RDEPENDS on it (or it listed as top-level package to install
;-) ). So, fix your dependencies, and it will be ok.

> The problem is not getting these things built, but preventing them from
> being installed in the tmp/rootfs/ filesystem or tarball.  They should
> only go into tmp/deploy/image/, which  I currently have them going 
> into...  However, the bitbake system assumes that anything that is 
> packaged, must be deployed into the root filesystem!?

> How do you build a bootloader that resides in Flash and doesn't get 
> stuck into the filesystem image?  The same would hold true for the 
> native (linux PC) app which flashes the target memory.

> Regards,

> TomW




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



