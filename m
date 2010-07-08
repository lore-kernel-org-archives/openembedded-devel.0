Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1OWrd7-000680-HT
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 15:59:13 +0200
Received: by bwz10 with SMTP id 10so520090bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jul 2010 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=+t1UusT3t0oLJTIMwpBuK1/7JCRbNg6PdyRjfySr4zM=;
	b=GbxXd4nXhDqP3/wUHuULwULnrJ3KqeLofNuH8k99WX9KWwjFs9bo4+D1S/WnOfnCk0
	ShSWC1rdgY+wN9LHPyJhMWexz+rKehnoxjGviym1AGNNGqn62JDtF7hH9Wld6YbmZnQB
	448+4YjzxFpxsbt2DzvxfvOnIRhdMZoTNu2MA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=vgiJCD0xwnAwOMnyUzHKzFn2x90zmMCuhhg+d4t8lom4GTylTWdVdiz6/8t7+JHlLp
	y5kNIDzYls8fW/VwxC4vk4uhv1d7Hlgwkp6DrSgtOAX2jr0m5/OjKARjrhwNB1n3LDlp
	jlWqpLX987FheyUg3db6MLOqNPZNswUlkTE94=
MIME-Version: 1.0
Received: by 10.204.160.146 with SMTP id n18mr6338813bkx.116.1278597253869; 
	Thu, 08 Jul 2010 06:54:13 -0700 (PDT)
Received: by 10.204.62.67 with HTTP; Thu, 8 Jul 2010 06:54:13 -0700 (PDT)
Date: Thu, 8 Jul 2010 17:54:13 +0400
Message-ID: <AANLkTil7o0fTTOKgeENfJ54exQUXvpnDzIicIWfbDG2-@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Strangeness with mkdosfs on OMAP3 board
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
X-List-Received-Date: Thu, 08 Jul 2010 13:59:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi, all!

I try to create FAT32 filesystem on SD card which is labelled as 8Gb
by its vendor. I use about a month old Angstrom:

root@beagle:~# mkdosfs -F 32 -v /dev/mmcblk0p1
mkdosfs 2.11 (12 Mar 2005)
/dev/mmcblk0p1 has 4 heads and 16 sectors per track,
logical sector size is 512,
using 0xf8 media descriptor, with 2097152 sectors;
file system has 2 32-bit FATs and 8 sectors per cluster.
FAT size is 2044 sectors, and provides 261629 clusters.
Volume ID is 4c35d63f, no volume label.

Which makes 1GB partition, which is weird, while

root@beagle:~# fdisk -l /dev/mmcblk0

Disk /dev/mmcblk0: 7969 MB, 7969177600 bytes
4 heads, 16 sectors/track, 243200 cylinders
Units = cylinders of 64 * 512 = 32768 bytes

        Device Boot      Start         End      Blocks  Id System
/dev/mmcblk0p1   *           1      243200     7782399+  b Win95 FAT32

root@beagle:~# cat /sys/block/mmcblk0/mmcblk0p1/size
15564799

which is correct value (so kernel knows correct size.

Any ideas on what happens?

log.do_compile.xxx:
arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp -isystem/build/ANF2
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-fram
e-pointer -O2 -ggdb3 -c mkdosfs.c -o mkdosfs.o
arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp -L/build/ANF2/tmp/s
ysroots/armv7a-angstrom-linux-gnueabi/usr/lib
-Wl,-rpath-link,/build/ANF2/tmp/sysroots/armv7a-angstrom-linux-gnu
eabi/usr/lib -Wl,-O1 -Wl,--hash-style=gnu mkdosfs.o -o mkdosfs

means that there's no various 64-bit lseek stuff like
-D_FILE_OFFSET_BITS=64, where it has gone?
Does OPTFLAGS gets lost on its way?

Thanks a lot,
S.


