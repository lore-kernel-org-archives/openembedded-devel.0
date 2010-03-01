Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nm7YH-0003ag-SQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 16:29:03 +0100
Received: by fxm20 with SMTP id 20so2334262fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 07:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=tpfCIMVaQVgNSD2Gtj7yoefVsRvlzJ2kdNaPkY3Wcss=;
	b=BOtwx1TXVkmTUtW7MVIVGbGBY0B0gA/Io9jeTt+OG65/oJve7FtVMB/KauBSxeotnj
	1cxOoQccVskQIeONH99ittk1Hd2L2xyDEhLnmWm2GUDX6tL1Ju+AYLaFkEcqRfV0SM4w
	s3mMuxk9nuDebFUVeako+YIuaP5sj41yIB6jU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=vhu3IC+iOvlD8Iq1VSXXB8m36/bmFFk/mM6dQSnAhO1nNjVRWbPJvPaVk1uRLjqxPz
	UUhsN5bB233rvF7cnE3KbmF8IE9Jb1LF27XJOSnVCURq2fPaOJpnaM95KlEWpA26swTK
	cGDb93ninHTBzUrpyegkfGrI0PfmSApGvJ6ME=
Received: by 10.87.47.3 with SMTP id z3mr7495667fgj.70.1267457168229;
	Mon, 01 Mar 2010 07:26:08 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm2162637fxm.7.2010.03.01.07.26.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Mar 2010 07:26:07 -0800 (PST)
Date: Mon, 1 Mar 2010 16:26:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100301152627.GT3206@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Building ubi/ubifs images
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
X-List-Received-Date: Mon, 01 Mar 2010 15:29:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

when we (SHR) are building ubi images, then mkfs.ubifs always fails for
om-gta01 when buiding big shr-image, usually fails for image almost the
size of NAND shr-lite-image and works ok for small image like 
35MB shr-fso2-console-image-eglibc-ipk--20100207-om-gta01.rootfs.ubifs

When it fails because requested image needs more LEBs then is available
on device (specified with -c 2376 in om-gta01) it says error message:

+ mkfs.ubifs -r /home/shr/shr-unstable/tmp/rootfs/shr-lite-image -o /home/shr/shr-unstable/tmp/deploy/images/om-gta01/shr-lite-eglibc-ipk--20100226-om-gta01.rootfs.ubifs -m 512 -e 15360 -c 2376
Error: max_leb_cnt too low (4799 needed)
/home/shr/shr-unstable/tmp/work/om-gta01-oe-linux-gnueabi/shr-lite-image-2.0-r11/temp/run.do_rootfs.5789: line 751: 
16899 Aborted mkfs.ubifs -r /home/shr/shr-unstable/tmp/rootfs/shr-lite-image -o /home/shr/shr-unstable/tmp/deploy/images/om-gta01/shr-lite-eglibc-ipk--20100226-om-gta01.rootfs.ubifs -m 512 -e 15360 -c 2376

with longer and a bit confusing error written on stderr (missing from do_rootfs.log).

NOTE: Running task 7195 of 7198 (ID: 10, /home/shr/shr-unstable/openembedded/recipes/images/shr-lite-image.bb, do_rootfs)
*** glibc detected *** mkfs.ubifs: double free or corruption (!prev): 0x000000000060d0c0 ***
======= Backtrace: =========
/lib/libc.so.6[0x2b4e55501948]
/lib/libc.so.6(cfree+0x76)[0x2b4e55503a56]
mkfs.ubifs[0x403bc4]
mkfs.ubifs[0x4050ca]
/lib/libc.so.6(__libc_start_main+0xe6)[0x2b4e554ac1a6]
mkfs.ubifs[0x401939]
======= Memory map: ========
00400000-0040c000 r-xp 00000000 08:01 5947470                            /home/shr/shr-unstable/tmp/staging/x86_64-linux/usr/bin/mkfs.ubifs
0060c000-0060d000 rw-p 0000c000 08:01 5947470                            /home/shr/shr-unstable/tmp/staging/x86_64-linux/usr/bin/mkfs.ubifs
0060d000-00943000 rw-p 0060d000 00:00 0                                  [heap]
2b4e547a1000-2b4e547bd000 r-xp 00000000 08:01 2985980                    /lib/ld-2.7.so
2b4e547bd000-2b4e547c0000 rw-p 2b4e547bd000 00:00 0
2b4e549bc000-2b4e549be000 rw-p 0001b000 08:01 2985980                    /lib/ld-2.7.so
2b4e549be000-2b4e549c8000 r-xp 00000000 08:01 33064620                   /home/shr/shr-unstable/tmp/staging/x86_64-linux/usr/lib/libfakeroot-0.so
2b4e549c8000-2b4e54bc7000 ---p 0000a000 08:01 33064620                   /home/shr/shr-unstable/tmp/staging/x86_64-linux/usr/lib/libfakeroot-0.so
2b4e54bc7000-2b4e54bc8000 rw-p 00009000 08:01 33064620                   /home/shr/shr-unstable/tmp/staging/x86_64-linux/usr/lib/libfakeroot-0.so
2b4e54bc8000-2b4e54bdd000 r-xp 00000000 08:01 33066631                   /home/shr/shr-unstable/tmp/staging/x86_64-linux/usr/lib/libz.so.1.2.3
2b4e54bdd000-2b4e54ddc000 ---p 00015000 08:01 33066631                   /home/shr/shr-unstable/tmp/staging/x86_64-linux/usr/lib/libz.so.1.2.3
2b4e54ddc000-2b4e54ddd000 rw-p 00014000 08:01 33066631                   /home/shr/shr-unstable/tmp/staging/x86_64-linux/usr/lib/libz.so.1.2.3
2b4e54ddd000-2b4e54dfd000 r-xp 00000000 08:01 5964438                    /home/shr/shr-unstable/tmp/staging/x86_64-linux/usr/lib/liblzo.so.1.0.0
2b4e54dfd000-2b4e54ffc000 ---p 00020000 08:01 5964438                    /home/shr/shr-unstable/tmp/staging/x86_64-linux/usr/lib/liblzo.so.1.0.0
2b4e54ffc000-2b4e54ffd000 rw-p 0001f000 08:01 5964438                    /home/shr/shr-unstable/tmp/staging/x86_64-linux/usr/lib/liblzo.so.1.0.0
2b4e55006000-2b4e55007000 rw-p 2b4e55006000 00:00 0
2b4e55007000-2b4e55089000 r-xp 00000000 08:01 2985976                    /lib/libm-2.7.so
2b4e55089000-2b4e55288000 ---p 00082000 08:01 2985976                    /lib/libm-2.7.so
2b4e55288000-2b4e5528a000 rw-p 00081000 08:01 2985976                    /lib/libm-2.7.so
2b4e5528a000-2b4e5528d000 r-xp 00000000 08:01 33067295                   /home/shr/shr-unstable/tmp/staging/x86_64-linux/usr/lib/libuuid.so.1.2
2b4e5528d000-2b4e5548d000 ---p 00003000 08:01 33067295                   /home/shr/shr-unstable/tmp/staging/x86_64-linux/usr/lib/libuuid.so.1.2
2b4e5548d000-2b4e5548e000 rw-p 00003000 08:01 33067295                   /home/shr/shr-unstable/tmp/staging/x86_64-linux/usr/lib/libuuid.so.1.2
2b4e5548e000-2b4e555d8000 r-xp 00000000 08:01 2985977                    /lib/libc-2.7.so
2b4e555d8000-2b4e557d7000 ---p 0014a000 08:01 2985977                    /lib/libc-2.7.so
2b4e557d7000-2b4e557da000 r--p 00149000 08:01 2985977                    /lib/libc-2.7.so
2b4e557da000-2b4e557dc000 rw-p 0014c000 08:01 2985977                    /lib/libc-2.7.so
2b4e557dc000-2b4e557e2000 rw-p 2b4e557dc000 00:00 0
2b4e557e2000-2b4e557e4000 r-xp 00000000 08:01 2985981                    /lib/libdl-2.7.so
2b4e557e4000-2b4e559e4000 ---p 00002000 08:01 2985981                    /lib/libdl-2.7.so
2b4e559e4000-2b4e559e6000 rw-p 00002000 08:01 2985981                    /lib/libdl-2.7.so
2b4e559e6000-2b4e55a58000 rw-p 2b4e559e6000 00:00 0
2b4e55a61000-2b4e55a77000 r-xp 00000000 08:01 2985961                    /lib/libgcc_s.so.1
2b4e55a77000-2b4e55c77000 ---p 00016000 08:01 2985961                    /lib/libgcc_s.so.1
2b4e55c77000-2b4e55c78000 rw-p 00016000 08:01 2985961                    /lib/libgcc_s.so.1
2b4e58000000-2b4e58021000 rw-p 2b4e58000000 00:00 0
2b4e58021000-2b4e5c000000 ---p 2b4e58021000 00:00 0
7fff562f2000-7fff56309000 rw-p 7fff562f2000 00:00 0                      [stack]
ffffffffff600000-ffffffffffe00000 ---p 00000000 00:00 0                  [vdso]

So my point is:
What's best way to check number of needed LEBs for an image before
actually building it? Or would be better to supply increadibly high -c
param (to build ubifs image successfully) and then check with right LEBs
count available on machine (specified in machine config) and then show simple
error or even modify image name (like ${IMAGE_NAME}-TOO-BIG.ubifs)?

I'm not sure about right -c LEBs value (the value I pushed to
om-gta01.conf doesn't look right now).

mkfs.ubifs --help says
-c, --max-leb-cnt=COUNT  maximum logical erase block count

from mount formated image
UBIFS: file system size:   58967040 bytes (57585 KiB, 56 MiB, 3839 LEBs)
UBIFS: journal size:       2964480 bytes (2895 KiB, 2 MiB, 193 LEBs)
from ubiattach
UBI device number 0, total 3907 LEBs (60011520 bytes, 57.2 MiB), available 3864 LEBs (59351040 bytes, 56.6 MiB), LEB size 15360 bytes (15.0 KiB)
UBI: number of good PEBs:        3907
UBI: number of bad PEBs:         4
UBI: available PEBs:             3864
UBI: total number of reserved PEBs: 43
UBI: number of PEBs reserved for bad PEB handling: 39

So is it safe to assume that all PEBs on device are good and use -c 3864
(expecting that mkfs.ubifs use that parameter for fs size and journal
included?)

Kind regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


