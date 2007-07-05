Received: from [64.233.162.226] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1I6Rpj-00077s-3L
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2007 15:57:23 +0200
Received: by nz-out-0506.google.com with SMTP id v1so1367883nzb
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2007 06:52:11 -0700 (PDT)
Received: by 10.114.93.17 with SMTP id q17mr8177799wab.1183643527379;
	Thu, 05 Jul 2007 06:52:07 -0700 (PDT)
Received: by 10.114.144.2 with HTTP; Thu, 5 Jul 2007 06:52:07 -0700 (PDT)
Message-ID: <432beae0707050652p1ea54a50me3e03ccca40015de@mail.gmail.com>
Date: Thu, 5 Jul 2007 06:52:07 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <468C7B11.8050809@openhardware.net>
MIME-Version: 1.0
References: <468C7B11.8050809@openhardware.net>
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
X-List-Received-Date: Thu, 05 Jul 2007 13:57:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 7/4/07, Tom Walsh <tom@openhardware.net> wrote:
> I know, this has come up before.  Reading through some of the old
> messages I see this discussed, but, I do not see any solution(s) mentioned?
>
> I have several parts to this project that must be built during the
> bitbake process (bootstrap-image), but are not part of the target
> filesystem image.  The total system parts are:
>
> * bootloader - ARM - resides in Flash.
> * kernel - ARM - resides in Flash.
> * target rootfs image - ARM - resides on MMC card.
> * Flash Utility - native (x86) - runs on host computer.
>
> The concept for the system is that the bootloader starts the RAM and
> other hardware up.  It then copies the kernel image into RAM and
> launches it.  The kernel is configured to look for its root filesystem
> on the MMC card.  Essentially, I boot the kernel from Flash, but the
> kernel boots from the MMC card.
>
> The only thing that I need in the root filesystem (tmp/rootfs/) is the
> packages I named from the local conf files.  The kernel does need to be
> there, it soaks up space uselessly.
>
> As to the bootloader, it comes in two sections (files), these are
> programmed by the Flash Utility into the target system.  The bootloader
> is not needed in the root filesystem.
>
> The problem is not getting these things built, but preventing them from
> being installed in the tmp/rootfs/ filesystem or tarball.  They should
> only go into tmp/deploy/image/, which  I currently have them going
> into...  However, the bitbake system assumes that anything that is
> packaged, must be deployed into the root filesystem!?

This isn't quite true. Bitbake installs whatever packages are in the
RDEPENDS of the image. I think what you would do it make sure that
your bootloader, etc are in the DEPENDS but not the RDEPENDS.

>
> How do you build a bootloader that resides in Flash and doesn't get
> stuck into the filesystem image?  The same would hold true for the
> native (linux PC) app which flashes the target memory.
>

-- 
Justin Patrin


