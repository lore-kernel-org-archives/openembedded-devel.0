Received: from [209.85.218.15] (helo=mail-bw0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LNW7m-0007xZ-Vu
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jan 2009 18:35:23 +0100
Received: by bwz8 with SMTP id 8so3020212bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2009 09:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=bOw/eJ2UeJM86dR0jLaNAtCuxeT9rjbNHwbiqEb4Mjg=;
	b=FmYyroWNqYISB6PnX+DQUK1I5HkWFUfBao0j96uYbhmn+k2Z4t/Fm4YcqqUyBuCYg+
	KP8Ad9BmaIyorSQ4O6MyIfwzKmTg0petqodpPlPGwuEl9r0fedPcsv4KUYncJnwNmoKi
	uG8RmszxVvFkRrkFd4aLoW5R8XOkgwn+JUxvY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=rYg1SyoLkLhMFhsBsgStLuDctPCozFCZ85e2XQk3CT7uvTCcTH4SUmRc9HvAIddDza
	gwhxkiqjw+vKDZVPX70VVB19+4WJV3bJhrjQyUw+lTPsUzwE2E2E4q7cJzBkLxA3v7Vm
	udnflGsMsty902Ob7c1hKfzcYmsNnemD5O4M0=
MIME-Version: 1.0
Received: by 10.181.20.6 with SMTP id x6mr499256bki.167.1232040520697; Thu, 15 
	Jan 2009 09:28:40 -0800 (PST)
Date: Thu, 15 Jan 2009 18:28:40 +0100
Message-ID: <d1b08f940901150928h56ede408u2d070606fbe6b7bc@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: ARM bootloaders (Zaurus) and CMDLINE
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
X-List-Received-Date: Thu, 15 Jan 2009 17:35:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm trying to understand in details the boot-process and the changes
between 2.4 and 2.6 kernels.

The idea is to read the mtdparts passed by the Zaurus bootloader
(angel) with a 2.6 kernel.

I found two threads which shed some light:

http://lists.gnu.org/archive/html/qemu-devel/2007-07/msg00344.html
https://kerneltrap.org/mailarchive/linux-kernel/2007/10/25/355025/thread

The question is simple: is it possible to apply the
CONFIG_SHARPSL_BOOTLDR_PARAMS patch to the 2.6 kernels?

We'd need this in the kexecboot-kernel, to be able to recognize the
mtdparts passed in /proc/cmdline. This is actually working only with
u-boot.

Other solution would be a raw read of the nand addresses and a
subsequent edit of the CMDLINE params passed by the kexecboot kernel
to the launched kernel.

Any advice?

TIA

Andrea


