Received: from ey-out-1920.google.com ([74.125.78.145])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NWVnr-0001Or-DI
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 15:08:34 +0100
Received: by ey-out-1920.google.com with SMTP id 13so419541eye.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 06:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=4ew/WQfhIa0qGmim6aB43nPfoVnI9a6jEF9UlIBVPK8=;
	b=lWbigNZij671Nzb2FuU7zQY4RfV7DnmFzIZ/r1DswINUeojiVACf3RY9iUnMHk9M1T
	7T5C3+cj8StAAPsU63gx6+yw/m06DpmHl9KhLvCH+6S5a7bgno57f/ph1sBpSkDFUVli
	1P3PEC614WU8Ed5T/63F7fd/lcuxFtjDQ+XdM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=f59WR5qazBXkmbdI5H9Bmmy7rzWisZNgBjW/WqTs6rzC/vDn4QBv2XXzGCTt2TVjt8
	lVFjb9zQaNfFQoc7QZxYUeecYfuC8Qzb7sEepwUt9dqD9kE6E53sZu/cq/pnOTgqxept
	gW3U4XOmFhyMhQZ8iVdCBBQMv5IGk+xO2AzIE=
MIME-Version: 1.0
Received: by 10.213.37.211 with SMTP id y19mr151915ebd.23.1263737179806; Sun, 
	17 Jan 2010 06:06:19 -0800 (PST)
Date: Sun, 17 Jan 2010 15:06:19 +0100
Message-ID: <d1b08f941001170606w13dcfc0ey341da93deb94c7b8@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.145
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] Zaurus: make updater.sh obsolete for poodle, clamshells and 	tosa
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
X-List-Received-Date: Sun, 17 Jan 2010 14:08:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Reading the post about gnu-tar I remember we talked about a new way to
install 2.6 kernels and images on Zaurus.

Well, there are very good reasons to make this now obsolete:
- we can flash from console (2.6 userspace)
- we have a different image-layout (kernel in /boot), thus we can boot
from every hd partition
- we can create jffs2 images (see Narcissus) and flash these from
console, without striping the legacy headers. We can even have 2
images in nand

My idea would be:

-refactor updater.sh and flash only kernels
-provide an updater script

An example of the commands on c7x0 (see
http://www.h5.dion.ne.jp/~rimemoon/zaurus/pic/nandmap.jpg):

Kernel:
nandlogical /dev/mtd1 WRITE 0x0E0000 0x140000 zImage.bin

Rootfs:
flash_eraseall -j /dev/mtd2
nandwrite /dev/mtd2 rootfs.jffs2

Optionally:
flash_eraseall -j /dev/mtd3
nandwrite /dev/mtd3 rootfs.jffs2


Better ideas?

Andrea


