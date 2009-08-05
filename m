Received: from [209.85.220.216] (helo=mail-fx0-f216.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.klykvin@gmail.com>) id 1MYjFT-0005TD-5Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Aug 2009 18:21:55 +0200
Received: by fxm12 with SMTP id 12so185995fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Aug 2009 09:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=OrezFe4blMxw6VYwwFxiaR6G3rWXhP/VgeaSfmjQVRc=;
	b=bxC4rlx+n9dCm6NmUecg0vX7FHb7ApiKf6PfhH065GiIXz3/q1SX2j8d7nAi124Otz
	e6mrOjQdtlGRVwe35fmGGGD1Y9aoZrEjprmNZtn7b+foBUvN+zWSzQlz4feK2CvRnrzM
	sBdmotaTVvOJa9ihbWTXbX6xhdVV1V1onBKtE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=sU4uEMVYpAiyp4FUMfPMppmVjv9wA2bi+39ZZWxvDNqLIsVWVbyAqnwHnj5LieOPty
	XWo9bgnf9vx+wgjy8ngqWQbvLMX5R8p9Lv18zF4pLSnhao+TbJhdbd5YBGP/sNG49+32
	ma+H6HicmU+324uHDl61SBWR5mY32vQvbmV4I=
MIME-Version: 1.0
Received: by 10.86.86.8 with SMTP id j8mr3139516fgb.70.1249488373549; Wed, 05 
	Aug 2009 09:06:13 -0700 (PDT)
Date: Wed, 5 Aug 2009 20:06:13 +0400
Message-ID: <357403ef0908050906k3b4d0f8m61a52142ed88a3b7@mail.gmail.com>
From: Denis Klykvin <d.klykvin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: IO Error in Acer n30
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
X-List-Received-Date: Wed, 05 Aug 2009 16:21:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Greetings!

Can someone help me with little problem?

I try to run OE in my Acer n30. After unsucsessfull loading it into
internal flash, i try to run OE from SD-card.
# fdisk -l /dev/sdb

Disk /dev/sdb: 1995 MB, 1995440128 bytes
39 heads, 38 sectors/track, 2629 cylinders
Units = cylinders of 1482 * 512 = 758784 bytes
Disk identifier: 0x00000000

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1         277      205238    b  W95 FAT32
/dev/sdb2             278        2629     1742832   83  Linux

After build "bitbake helloworld-image" i have in deploy directory:

Angstrom-helloworld-image-glibc-ipk-2009.X-test-20090805-acern30.rootfs.tar
Angstrom-helloworld-image-glibc-ipk-2009.X-test-20090805-acern30.rootfs.jffs2
zImage-2.6.14-r0-acern30.bin

I unpack Angstrom...tar into /dev/sdb2 , and put zImage into fat partition.

So, in far partition I have:
boot.exe (which kill windows and run linux)
zImage ( zImage-2.6.14-r0-acern30.bin )
default.txt (sent parameters to kernel, if i'm not mistake)

in default.txt kernel got:
"console=tty verbose root=0xfe02 rootdelay=5 rw noinitrd"

When I run boot.exe, it restarts to linux, trying to boot, and show
something like:
 mmcblk0:<3>mmcblk0: error 2 transferring data
end_request: I/O error, dev mmcblk0, sector 0
Buffer I/O error on device mmcblk0, logical block 0
mmcblk0: error 2 transferring data
end_request: I/O error, dev mmcblk0, sector 0
Buffer I/O error on device mmcblk0, logical block 0
 unable to read partition table

But in card-reader SD-card works fine.
What i must do? Try to compile another kernel?


