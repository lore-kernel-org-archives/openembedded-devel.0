Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NbM2K-0005HR-Ax
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 23:43:31 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 30 Jan 2010 23:41:01 +0100
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 30 Jan 2010 23:41:01 +0100
Received: from [192.168.1.116] ([95.244.130.46]) by FBCMCL01B02.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 30 Jan 2010 23:41:02 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B598603.4080603@dresearch.de>
References: <4B598603.4080603@dresearch.de>
Date: Sat, 30 Jan 2010 23:40:50 +0100
Message-Id: <1264891250.3912.12.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 30 Jan 2010 22:41:02.0252 (UTC)
	FILETIME=[4CE786C0:01CAA1FD]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: package for kernel module devel?
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
X-List-Received-Date: Sat, 30 Jan 2010 22:43:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2010-01-22 at 12:03 +0100, Steffen Sledz wrote:
> Our team is developing new kernel modules for our machine. For fast
> development cycles it would be very helpful to be able to compile the
> modules at the machine itself.
> 
> By installing task-native-sdk & Co. nearly all needed stuff is
> available but i miss the linux kernel headers and the corresponding
> link to them (/lib/modules/x.x.x.x/build). :(
> 
> Does a package exist for this (or for the complete kernel sources)?
> 
> Steffen
I am not aware of a package which install /lib/modules/x.x.x.x/build 
(It may exist)
but there are other possibilities:

With the build on an external build machine:
--------------------------------------------
*build the kernel on a build machine and tftpboot the kernel(if the
bootloader permits it) which would boot on a NFS share which would
contain the modules
*Variants: simply use a NFS share for the external modules and boot your
kernel normally

Make the target machine build the kernel modules(would be slow,could be
some ram usage issues depending on your machine speed and ram quantity
and usage):
--------------------------------------------------
*according to my distro:
lrwxrwxrwx. 1 root root 21 2009-09-16 19:52 build
-> /usr/src/linux-2.6.31
so that simply points to the entire source of the kernel...
So simply add a simlink that point to the sources
(the sources could be on your local storage device or could be an NFS
share...)

Denis.




