Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbUUB-0000kR-MG
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 08:44:51 +0100
Received: by pxi9 with SMTP id 9so3003829pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 23:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:cc:mime-version:from:organization:message-id:user-agent;
	bh=xu2NotCgGGDc1WhXg9bKQEIq7iTb9uIt/1WeX8XW05A=;
	b=ZgO0Mp2BfeCpJPHLHDypUptkPeldUksxADDkku1UZW11OaD0qQ8IMGrNAdXOqHqpHE
	b4P1Aq4zvah1I4SM+YxZEuzhgmsUGbVnzy3kqRfdQXcmQHFIsZHgLiDO0+MmMcFbBM3s
	/X8KEIo/wBupcNPdsD5pbBTljubFa060y0Oy4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:cc:mime-version:from:organization
	:message-id:user-agent;
	b=hSJ6UezaQmCnaib++7pt8PVD5lMhQMOZU3yu9L0EfcKAfvlVFIsBdJsIGAfxTuEQyH
	USD/NqSUJlqUM0+H3yncJfdN3AImt9lusXYk4z9Jcp5zF2aE0VFKQDe8a2SolW9VyH6J
	Ggb95QlriOcVPAthyVWXw75GV4ihjlnPpzKW8=
Received: by 10.141.14.4 with SMTP id r4mr2069804rvi.109.1264923741936;
	Sat, 30 Jan 2010 23:42:21 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 22sm3309241pzk.2.2010.01.30.23.42.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 23:42:21 -0800 (PST)
Date: Sun, 31 Jan 2010 15:42:10 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7dzok03mn1qzu@camelguo>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: leon@sidebranch.com
Subject: building linux-kirkwood_2.6.33-rc5.bb for openrd-base failed and it causes bitbake exception
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
X-List-Received-Date: Sun, 31 Jan 2010 07:44:51 -0000
X-Groupsio-MsgNum: 16346
Content-Type: multipart/mixed; boundary=----------9OcyKMCnv5ZTfUdZ2Th7Vb

------------9OcyKMCnv5ZTfUdZ2Th7Vb
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I tried to build openembedded with the following configuration:
MACHINE=openrd-base
DISTRO=micro
LIBC=glibc
But when building linux kernel ( linux-kirkwood_2.6.33-rc5.bb ), there are  
some patches failed to be applied and bitbake raised some exceptions with  
unknow reason. The attachment is the raw error information captured from  
the screen. Hope it is useful.

Thanks a lot!

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com

------------9OcyKMCnv5ZTfUdZ2Th7Vb
Content-Disposition: attachment; filename=screen-of-building-openrd-base-kernel.txt
Content-Type: text/plain; name=screen-of-building-openrd-base-kernel.txt
Content-Transfer-Encoding: 7bit

patching file drivers/ata/libata-eh.c
patching file drivers/ata/libata-scsi.c
patching file drivers/ata/ox800sata.c
patching file drivers/ata/ox810sata.c
patching file drivers/ata/pata_hpt366.c
Hunk #1 FAILED at 27.
Hunk #2 FAILED at 180.
2 out of 2 hunks FAILED -- rejects in file drivers/ata/pata_hpt366.c
patching file drivers/ata/pata_hpt37x.c
Hunk #1 FAILED at 24.
Hunk #2 FAILED at 281.
Hunk #3 FAILED at 297.
3 out of 3 hunks FAILED -- rejects in file drivers/ata/pata_hpt37x.c
patching file drivers/ata/pata_serverworks.c
Hunk #1 FAILED at 226.
1 out of 1 hunk FAILED -- rejects in file drivers/ata/pata_serverworks.c
patching file drivers/base/firmware_class.c
Hunk #1 FAILED at 292.
1 out of 1 hunk FAILED -- rejects in file drivers/base/firmware_class.c
patching file drivers/base/platform.c
Hunk #1 FAILED at 647.
1 out of 1 hunk FAILED -- rejects in file drivers/base/platform.c
patching file drivers/block/ub.c
Hunk #1 FAILED at 657.
Hunk #2 FAILED at 667.
2 out of 2 hunks FAILED -- rejects in file drivers/block/ub.c
patching file drivers/char/defkeymap.c_shipped
Hunk #1 FAILED at 223.
1 out of 1 hunk FAILED -- rejects in file drivers/char/defkeymap.c_shipped
patching file drivers/char/drm/drm_stub.c
Hunk #1 FAILED at 218.
1 out of 1 hunk FAILED -- rejects in file drivers/char/drm/drm_stub.c
patching file drivers/char/drm/drm_vm.c
Hunk #1 FAILED at 506.
Hunk #2 FAILED at 656.
2 out of 2 hunks FAILED -- rejects in file drivers/char/drm/drm_vm.c
patching file drivers/char/mspec.c
Hunk #1 FAILED at 283.
1 out of 1 hunk FAILED -- rejects in file drivers/char/mspec.c
patching file drivers/char/vt.c
Hunk #1 FAILED at 702.
1 out of 1 hunk FAILED -- rejects in file drivers/char/vt.c
patching file drivers/dma/Kconfig
patching file drivers/dma/Makefile
patching file drivers/dma/ioat_dma.c
Hunk #1 FAILED at 726.
Hunk #2 FAILED at 750.
2 out of 2 hunks FAILED -- rejects in file drivers/dma/ioat_dma.c
patching file drivers/dma/oxnas_adma.c
patching file drivers/firmware/dmi_scan.c
Hunk #1 FAILED at 469.
1 out of 1 hunk FAILED -- rejects in file drivers/firmware/dmi_scan.c
patching file drivers/i2c/algos/Kconfig
patching file drivers/i2c/algos/Makefile
patching file drivers/i2c/algos/i2c-algo-oxnas.c
patching file drivers/i2c/busses/Kconfig
patching file drivers/i2c/busses/Makefile
patching file drivers/i2c/busses/i2c-oxnas-bitbash.c
patching file drivers/leds/Kconfig
patching file drivers/macintosh/smu.c
Hunk #1 FAILED at 85.
Hunk #2 succeeded at 150 with fuzz 2 (offset 14 lines).
Hunk #3 FAILED at 239.
Hunk #4 FAILED at 493.
Hunk #5 succeeded at 574 with fuzz 2 (offset 23 lines).
3 out of 5 hunks FAILED -- rejects in file drivers/macintosh/smu.c
patching file drivers/md/Kconfig
patching file drivers/md/Makefile
patching file drivers/md/dm-ox-crypt.c
patching file drivers/md/raid1.c
patching file drivers/media/video/cx23885/cx23885-cards.c
Hunk #1 succeeded at 142 (offset 4 lines).
patching file drivers/message/fusion/mptsas.c
Hunk #1 succeeded at 1704 with fuzz 2 (offset 5 lines).
patching file drivers/net/Kconfig
patching file drivers/net/bonding/bond_main.c
Hunk #1 FAILED at 4883.
1 out of 1 hunk FAILED -- rejects in file drivers/net/bonding/bond_main.c
patching file drivers/net/dl2k.h
Hunk #1 FAILED at 388.
1 out of 1 hunk FAILED -- rejects in file drivers/net/dl2k.h
patching file drivers/net/e1000e/netdev.c
Hunk #1 succeeded at 1689 with fuzz 2 (offset 3 lines).
Hunk #2 FAILED at 1757.
1 out of 2 hunks FAILED -- rejects in file drivers/net/e1000e/netdev.c
patching file drivers/net/forcedeth.c
Hunk #1 FAILED at 5593.
1 out of 1 hunk FAILED -- rejects in file drivers/net/forcedeth.c
patching file drivers/net/macb.c
Hunk #1 FAILED at 148.
1 out of 1 hunk FAILED -- rejects in file drivers/net/macb.c
patching file drivers/net/mii.c
patching file drivers/net/niu.c
Hunk #1 FAILED at 33.
Hunk #2 FAILED at 1616.
Hunk #3 FAILED at 5148.
3 out of 3 hunks FAILED -- rejects in file drivers/net/niu.c
patching file drivers/net/niu.h
Hunk #1 FAILED at 499.
1 out of 1 hunk FAILED -- rejects in file drivers/net/niu.h
patching file drivers/net/pcmcia/smc91c92_cs.c
Hunk #1 FAILED at 559.
1 out of 1 hunk FAILED -- rejects in file drivers/net/pcmcia/smc91c92_cs.c
patching file drivers/net/sky2.c
Hunk #1 FAILED at 621.
Hunk #2 FAILED at 633.
Hunk #3 succeeded at 1772 with fuzz 2 (offset 358 lines).
Hunk #4 FAILED at 2787.
Hunk #5 FAILED at 2795.
Hunk #6 FAILED at 2810.
Hunk #7 FAILED at 3176.
Hunk #8 FAILED at 3899.
Hunk #9 FAILED at 4732.
8 out of 9 hunks FAILED -- rejects in file drivers/net/sky2.c
patching file drivers/net/via-velocity.c
patching file drivers/net/via-velocity.h
patching file drivers/net/wireless/b43/dma.c
Hunk #1 FAILED at 165.
Hunk #2 FAILED at 426.
Hunk #3 FAILED at 495.
Hunk #4 FAILED at 659.
Hunk #5 FAILED at 692.
Hunk #6 FAILED at 708.
Hunk #7 FAILED at 1120.
Hunk #8 FAILED at 1130.
Hunk #9 FAILED at 1172.
Hunk #10 FAILED at 1184.
Hunk #11 FAILED at 1248.
11 out of 11 hunks FAILED -- rejects in file drivers/net/wireless/b43/dma.c
patching file drivers/net/wireless/b43/main.c
Hunk #1 FAILED at 101.
Hunk #2 succeeded at 1814 (offset 13 lines).
Hunk #3 FAILED at 3093.
Hunk #4 FAILED at 3421.
Hunk #5 succeeded at 3522 with fuzz 2 (offset 18 lines).
3 out of 5 hunks FAILED -- rejects in file drivers/net/wireless/b43/main.c
patching file drivers/net/wireless/b43/xmit.c
Hunk #1 FAILED at 177.
Hunk #2 FAILED at 235.
Hunk #3 FAILED at 360.
3 out of 3 hunks FAILED -- rejects in file drivers/net/wireless/b43/xmit.c
patching file drivers/net/wireless/b43/xmit.h
Hunk #1 FAILED at 82.
1 out of 1 hunk FAILED -- rejects in file drivers/net/wireless/b43/xmit.h
patching file drivers/net/wireless/b43legacy/dma.c
Hunk #1 FAILED at 1164.
Hunk #2 succeeded at 1177 with fuzz 2 (offset 3 lines).
Hunk #3 FAILED at 1187.
Hunk #4 FAILED at 1217.
Hunk #5 FAILED at 1229.
Hunk #6 FAILED at 1297.
5 out of 6 hunks FAILED -- rejects in file drivers/net/wireless/b43legacy/dma.c
patching file drivers/net/wireless/b43legacy/main.c
Hunk #1 FAILED at 3215.
Hunk #2 succeeded at 3314 with fuzz 2 (offset 5 lines).
1 out of 2 hunks FAILED -- rejects in file drivers/net/wireless/b43legacy/main.c
patching file drivers/net/wireless/b43legacy/pio.c
Hunk #1 FAILED at 181.
Hunk #2 FAILED at 189.
Hunk #3 FAILED at 207.
Hunk #4 FAILED at 231.
Hunk #5 FAILED at 253.
Hunk #6 succeeded at 513 with fuzz 2 (offset 15 lines).
5 out of 6 hunks FAILED -- rejects in file drivers/net/wireless/b43legacy/pio.c
patching file drivers/net/wireless/b43legacy/xmit.c
Hunk #1 FAILED at 181.
Hunk #2 FAILED at 252.
Hunk #3 FAILED at 351.
3 out of 3 hunks FAILED -- rejects in file drivers/net/wireless/b43legacy/xmit.c
patching file drivers/net/wireless/b43legacy/xmit.h
Hunk #1 FAILED at 76.
1 out of 1 hunk FAILED -- rejects in file drivers/net/wireless/b43legacy/xmit.h
patching file drivers/pci/hotplug/fakephp.c
Hunk #1 FAILED at 39.
Hunk #2 FAILED at 64.
Hunk #3 FAILED at 116.
Hunk #4 succeeded at 186 with fuzz 1 (offset 15 lines).
Hunk #5 FAILED at 297.
Hunk #6 succeeded at 352 with fuzz 1 (offset 25 lines).
Hunk #7 FAILED at 378.
Hunk #8 FAILED at 391.
Hunk #9 succeeded at 409 with fuzz 2 (offset 31 lines).
6 out of 9 hunks FAILED -- rejects in file drivers/pci/hotplug/fakephp.c
patching file drivers/pci/probe.c
patching file drivers/rtc/rtc-ds1307.c
patching file drivers/s390/char/defkeymap.c
Hunk #1 FAILED at 151.
1 out of 1 hunk FAILED -- rejects in file drivers/s390/char/defkeymap.c
patching file drivers/scsi/Kconfig
patching file drivers/scsi/advansys.c
Hunk #1 FAILED at 566.
Hunk #2 FAILED at 6439.
Hunk #3 FAILED at 13833.
Hunk #4 FAILED at 13846.
Hunk #5 FAILED at 13902.
5 out of 5 hunks FAILED -- rejects in file drivers/scsi/advansys.c
patching file drivers/scsi/aic94xx/aic94xx_scb.c
Hunk #1 FAILED at 458.
Hunk #2 FAILED at 484.
2 out of 2 hunks FAILED -- rejects in file drivers/scsi/aic94xx/aic94xx_scb.c
patching file drivers/scsi/arcmsr/arcmsr_hba.c
Hunk #1 FAILED at 1380.
Hunk #2 FAILED at 1418.
Hunk #3 FAILED at 1481.
3 out of 3 hunks FAILED -- rejects in file drivers/scsi/arcmsr/arcmsr_hba.c
patching file drivers/scsi/gdth.c
Hunk #1 FAILED at 160.
Hunk #2 FAILED at 183.
Hunk #3 FAILED at 417.
Hunk #4 FAILED at 439.
Hunk #5 FAILED at 487.
Hunk #6 FAILED at 500.
Hunk #7 FAILED at 2344.
Hunk #8 FAILED at 2370.
Hunk #9 FAILED at 2424.
Hunk #10 FAILED at 2434.
Hunk #11 FAILED at 2446.
Hunk #12 FAILED at 2456.
Hunk #13 FAILED at 2468.
Hunk #14 FAILED at 2838.
Hunk #15 FAILED at 2847.
Hunk #16 succeeded at 3769 with fuzz 2 (offset -11 lines).
Hunk #17 FAILED at 4646.
Hunk #18 FAILED at 4777.
Hunk #19 FAILED at 4907.
Hunk #20 FAILED at 5047.
Hunk #21 FAILED at 5080.
Hunk #22 succeeded at 5100 with fuzz 2 (offset -23 lines).
Hunk #23 FAILED at 5180.
Hunk #24 FAILED at 5189.
22 out of 24 hunks FAILED -- rejects in file drivers/scsi/gdth.c
patching file drivers/scsi/gdth.h
Hunk #1 FAILED at 915.
1 out of 1 hunk FAILED -- rejects in file drivers/scsi/gdth.h
patching file drivers/scsi/gdth_proc.c
Hunk #1 FAILED at 694.
1 out of 1 hunk FAILED -- rejects in file drivers/scsi/gdth_proc.c
patching file drivers/scsi/ips.c
Hunk #1 FAILED at 1580.
Hunk #2 FAILED at 6842.
Hunk #3 FAILED at 6864.
3 out of 3 hunks FAILED -- rejects in file drivers/scsi/ips.c
patching file drivers/scsi/scsi_lib.c
Hunk #1 FAILED at 298.
1 out of 1 hunk FAILED -- rejects in file drivers/scsi/scsi_lib.c
patching file drivers/scsi/sd.c
Hunk #1 FAILED at 907.
Hunk #2 FAILED at 946.
2 out of 2 hunks FAILED -- rejects in file drivers/scsi/sd.c
patching file drivers/serial/8250.c
patching file drivers/spi/atmel_spi.c
Hunk #1 succeeded at 113 with fuzz 2 (offset 28 lines).
patching file drivers/spi/pxa2xx_spi.c
Hunk #1 FAILED at 48.
Hunk #2 FAILED at 967.
Hunk #3 FAILED at 976.
Hunk #4 FAILED at 986.
4 out of 4 hunks FAILED -- rejects in file drivers/spi/pxa2xx_spi.c
patching file drivers/usb/Kconfig
patching file drivers/usb/class/usblp.c
Hunk #1 FAILED at 428.
1 out of 1 hunk FAILED -- rejects in file drivers/usb/class/usblp.c
patching file drivers/usb/core/driver.c
Hunk #1 FAILED at 534.
1 out of 1 hunk FAILED -- rejects in file drivers/usb/core/driver.c
patching file drivers/usb/core/hcd.h
patching file drivers/usb/core/hub.c
Hunk #1 FAILED at 2946.
1 out of 1 hunk FAILED -- rejects in file drivers/usb/core/hub.c
patching file drivers/usb/gadget/fsl_usb2_udc.c
Hunk #1 FAILED at 776.
1 out of 1 hunk FAILED -- rejects in file drivers/usb/gadget/fsl_usb2_udc.c
patching file drivers/usb/host/Kconfig
patching file drivers/usb/host/Makefile
patching file drivers/usb/host/ehci-dbg.c
patching file drivers/usb/host/ehci-hcd.c
patching file drivers/usb/host/ehci-hub.c
patching file drivers/usb/host/ehci-oxnas.c
patching file drivers/usb/host/ehci-q.c
Hunk #1 FAILED at 315.
1 out of 1 hunk FAILED -- rejects in file drivers/usb/host/ehci-q.c
patching file drivers/usb/host/ehci-sched.c
patching file drivers/usb/host/ehci.h
patching file drivers/usb/misc/usbtest.c
Hunk #2 FAILED at 1152.
Hunk #3 succeeded at 1210 (offset 1 line).
Hunk #4 succeeded at 2103 (offset 1 line).
1 out of 4 hunks FAILED -- rejects in file drivers/usb/misc/usbtest.c
patching file drivers/usb/serial/cp2101.c
Hunk #1 FAILED at 59.
Hunk #2 FAILED at 77.
2 out of 2 hunks FAILED -- rejects in file drivers/usb/serial/cp2101.c
patching file drivers/usb/serial/ftdi_sio.c
Hunk #1 FAILED at 310.
Hunk #2 succeeded at 323 with fuzz 1 (offset 5 lines).
Hunk #3 FAILED at 389.
Hunk #4 FAILED at 483.
Hunk #5 FAILED at 556.
Hunk #6 FAILED at 581.
Hunk #7 succeeded at 1332 (offset 25 lines).
5 out of 7 hunks FAILED -- rejects in file drivers/usb/serial/ftdi_sio.c
patching file drivers/usb/serial/ftdi_sio.h
Hunk #1 succeeded at 105 with fuzz 2 (offset 7 lines).
Hunk #2 FAILED at 259.
Hunk #3 FAILED at 293.
Hunk #4 succeeded at 574 with fuzz 2 (offset 31 lines).
2 out of 4 hunks FAILED -- rejects in file drivers/usb/serial/ftdi_sio.h
patching file drivers/usb/serial/keyspan.c
Hunk #1 FAILED at 838.
1 out of 1 hunk FAILED -- rejects in file drivers/usb/serial/keyspan.c
patching file drivers/usb/serial/kobil_sct.c
Hunk #1 FAILED at 114.
1 out of 1 hunk FAILED -- rejects in file drivers/usb/serial/kobil_sct.c
patching file drivers/usb/serial/option.c
Hunk #1 FAILED at 180.
1 out of 1 hunk FAILED -- rejects in file drivers/usb/serial/option.c
patching file drivers/usb/serial/pl2303.c
Hunk #1 FAILED at 65.
Hunk #2 FAILED at 85.
2 out of 2 hunks FAILED -- rejects in file drivers/usb/serial/pl2303.c
patching file drivers/usb/serial/pl2303.h
Hunk #1 FAILED at 35.
Hunk #2 FAILED at 97.
Hunk #3 FAILED at 104.
3 out of 3 hunks FAILED -- rejects in file drivers/usb/serial/pl2303.h
patching file drivers/usb/serial/sierra.c
Hunk #1 FAILED at 104.
Hunk #2 FAILED at 118.
Hunk #3 FAILED at 136.
Hunk #4 FAILED at 150.
Hunk #5 FAILED at 164.
5 out of 5 hunks FAILED -- rejects in file drivers/usb/serial/sierra.c
patching file drivers/usb/storage/protocol.c
Hunk #1 FAILED at 194.
Hunk #2 FAILED at 249.
2 out of 2 hunks FAILED -- rejects in file drivers/usb/storage/protocol.c
patching file drivers/usb/storage/unusual_devs.h
Hunk #1 succeeded at 94 with fuzz 2 (offset 8 lines).
patching file fs/adfs/file.c
patching file fs/affs/file.c
patching file fs/afs/file.c
patching file fs/aio.c
Hunk #1 succeeded at 1005 with fuzz 2 (offset 8 lines).
patching file fs/bio.c
patching file fs/coda/file.c
patching file fs/ecryptfs/file.c
patching file fs/ecryptfs/mmap.c
Hunk #1 FAILED at 263.
1 out of 1 hunk FAILED -- rejects in file fs/ecryptfs/mmap.c
patching file fs/eventpoll.c
Hunk #1 FAILED at 353.
1 out of 1 hunk FAILED -- rejects in file fs/eventpoll.c
patching file fs/ext2/file.c
patching file fs/ext3/file.c
patching file fs/ext3/ialloc.c
patching file fs/ext4/file.c
patching file fs/fat/file.c
patching file fs/fuse/dir.c
Hunk #1 FAILED at 905.
1 out of 1 hunk FAILED -- rejects in file fs/fuse/dir.c
patching file fs/fuse/file.c
patching file fs/gfs2/ops_file.c
patching file fs/hpfs/file.c
patching file fs/inotify_user.c
Hunk #1 FAILED at 269.
1 out of 1 hunk FAILED -- rejects in file fs/inotify_user.c
patching file fs/isofs/compress.c
Hunk #1 FAILED at 72.
1 out of 1 hunk FAILED -- rejects in file fs/isofs/compress.c
patching file fs/jbd/recovery.c
Hunk #1 FAILED at 478.
1 out of 1 hunk FAILED -- rejects in file fs/jbd/recovery.c
patching file fs/jbd2/recovery.c
Hunk #1 FAILED at 488.
1 out of 1 hunk FAILED -- rejects in file fs/jbd2/recovery.c
patching file fs/jffs2/file.c
patching file fs/jfs/file.c
patching file fs/minix/file.c
patching file fs/ncpfs/mmap.c
Hunk #1 FAILED at 50.
1 out of 1 hunk FAILED -- rejects in file fs/ncpfs/mmap.c
patching file fs/nfs/write.c
Hunk #1 succeeded at 712 (offset 11 lines).
Hunk #2 FAILED at 743.
1 out of 2 hunks FAILED -- rejects in file fs/nfs/write.c
patching file fs/nfsd/nfsfh.c
Hunk #1 FAILED at 231.
Hunk #2 FAILED at 241.
Hunk #3 FAILED at 253.
3 out of 3 hunks FAILED -- rejects in file fs/nfsd/nfsfh.c
patching file fs/ntfs/file.c
patching file fs/ocfs2/file.c
patching file fs/qnx4/file.c
patching file fs/read_write.c
patching file fs/reiserfs/file.c
patching file fs/smbfs/file.c
patching file fs/splice.c
Hunk #1 succeeded at 1187 with fuzz 2 (offset 3 lines).
Hunk #2 FAILED at 1242.
Hunk #3 succeeded at 1402 (offset 8 lines).
1 out of 3 hunks FAILED -- rejects in file fs/splice.c
patching file fs/sysv/file.c
patching file fs/udf/file.c
patching file fs/ufs/file.c
patching file fs/ufs/util.h
Hunk #1 FAILED at 58.
1 out of 1 hunk FAILED -- rejects in file fs/ufs/util.h
patching file fs/xfs/Makefile-linux-2.6
patching file fs/xfs/linux-2.6/xfs_buf.c
patching file fs/xfs/linux-2.6/xfs_buf.h
patching file fs/xfs/linux-2.6/xfs_file.c
Hunk #2 FAILED at 372.
Hunk #3 FAILED at 384.
Hunk #4 succeeded at 522 (offset -1 lines).
Hunk #5 succeeded at 548 (offset -1 lines).
2 out of 5 hunks FAILED -- rejects in file fs/xfs/linux-2.6/xfs_file.c
patching file fs/xfs/linux-2.6/xfs_lrw.c
patching file fs/xfs/xfs_alloc.c
patching file fs/xfs/xfs_alloc_btree.c
patching file fs/xfs/xfs_attr_leaf.c
patching file fs/xfs/xfs_bmap_btree.c
patching file fs/xfs/xfs_da_btree.c
patching file fs/xfs/xfs_dir2_block.c
patching file fs/xfs/xfs_dir2_data.c
patching file fs/xfs/xfs_dir2_leaf.c
patching file fs/xfs/xfs_dir2_node.c
patching file fs/xfs/xfs_fsops.c
patching file fs/xfs/xfs_ialloc.c
patching file fs/xfs/xfs_ialloc_btree.c
patching file fs/xfs/xfs_inode.c
patching file fs/xfs/xfs_inode.h
patching file fs/xfs/xfs_log.c
patching file fs/xfs/xfs_log.h
patching file fs/xfs/xfs_log_priv.h
patching file fs/xfs/xfs_log_recover.c
patching file fs/xfs/xfs_trans.c
patching file fs/xfs/xfs_vnodeops.c
patching file include/asm-arm/arch-oxnas/GPIO_PST_FunctionEnables.inc
patching file include/asm-arm/arch-oxnas/ahb_mon.h
patching file include/asm-arm/arch-oxnas/cipher.h
patching file include/asm-arm/arch-oxnas/debug-macro.S
patching file include/asm-arm/arch-oxnas/desc_alloc.h
patching file include/asm-arm/arch-oxnas/dma.h
patching file include/asm-arm/arch-oxnas/entry-macro.S
patching file include/asm-arm/arch-oxnas/hardware.h
patching file include/asm-arm/arch-oxnas/i2s.h
patching file include/asm-arm/arch-oxnas/io.h
patching file include/asm-arm/arch-oxnas/irqs.h
patching file include/asm-arm/arch-oxnas/leon-power-button-prog.h
patching file include/asm-arm/arch-oxnas/leon-program.h
patching file include/asm-arm/arch-oxnas/leon.h
patching file include/asm-arm/arch-oxnas/memory.h
patching file include/asm-arm/arch-oxnas/ox810sata.h
patching file include/asm-arm/arch-oxnas/sata.h
patching file include/asm-arm/arch-oxnas/system.h
patching file include/asm-arm/arch-oxnas/taco.h
patching file include/asm-arm/arch-oxnas/timex.h
patching file include/asm-arm/arch-oxnas/uncompress.h
patching file include/asm-arm/arch-oxnas/vmalloc.h
patching file include/asm-arm/arch-pxa/pxa-regs.h
Hunk #1 FAILED at 1669.
1 out of 1 hunk FAILED -- rejects in file include/asm-arm/arch-pxa/pxa-regs.h
patching file include/asm-arm/assembler.h
patching file include/asm-arm/io.h
patching file include/asm-arm/uaccess.h
patching file include/asm-arm/unaligned.h
patching file include/asm-arm/unistd.h
patching file include/asm-powerpc/pmac_feature.h
Hunk #1 succeeded at 296 with fuzz 2 (offset -96 lines).
patching file include/asm-x86/apic_32.h
Hunk #1 FAILED at 109.
1 out of 1 hunk FAILED -- rejects in file include/asm-x86/apic_32.h
patching file include/asm-x86/futex_32.h
Hunk #1 FAILED at 28.
Hunk #2 FAILED at 68.
Hunk #3 FAILED at 111.
3 out of 3 hunks FAILED -- rejects in file include/asm-x86/futex_32.h
patching file include/asm-x86/futex_64.h
Hunk #1 FAILED at 27.
Hunk #2 FAILED at 62.
Hunk #3 FAILED at 101.
3 out of 3 hunks FAILED -- rejects in file include/asm-x86/futex_64.h
patching file include/asm-x86/io_apic_64.h
Hunk #1 FAILED at 129.
1 out of 1 hunk FAILED -- rejects in file include/asm-x86/io_apic_64.h
patching file include/asm-x86/processor_32.h
Hunk #1 FAILED at 712.
1 out of 1 hunk FAILED -- rejects in file include/asm-x86/processor_32.h
patching file include/linux/bio.h
patching file include/linux/byteorder/generic.h
patching file include/linux/byteorder/swab.h
patching file include/linux/dmi.h
Hunk #1 FAILED at 79.
Hunk #2 FAILED at 89.
2 out of 2 hunks FAILED -- rejects in file include/linux/dmi.h
patching file include/linux/fs.h
Hunk #3 succeeded at 1795 (offset 2 lines).
Hunk #4 succeeded at 1808 (offset 2 lines).
patching file include/linux/futex.h
Hunk #1 FAILED at 153.
1 out of 1 hunk FAILED -- rejects in file include/linux/futex.h
patching file include/linux/hrtimer.h
Hunk #1 FAILED at 300.
1 out of 1 hunk FAILED -- rejects in file include/linux/hrtimer.h
patching file include/linux/hugetlb.h
Hunk #1 FAILED at 17.
1 out of 1 hunk FAILED -- rejects in file include/linux/hugetlb.h
patching file include/linux/i2c-id.h
patching file include/linux/irq.h
Hunk #1 succeeded at 370 with fuzz 2 (offset 3 lines).
patching file include/linux/ktime.h
Hunk #1 succeeded at 312 with fuzz 2 (offset 2 lines).
patching file include/linux/leds.h
patching file include/linux/libata.h
patching file include/linux/mii.h
patching file include/linux/moduleparam.h
Hunk #1 succeeded at 72 with fuzz 2 (offset 10 lines).
Hunk #2 FAILED at 91.
1 out of 2 hunks FAILED -- rejects in file include/linux/moduleparam.h
patching file include/linux/net.h
patching file include/linux/raid/raid1.h
patching file include/linux/serial_reg.h
patching file include/linux/syscalls.h
patching file include/linux/trustees.h
patching file include/linux/wait.h
Hunk #1 succeeded at 177 with fuzz 2 (offset 16 lines).
patching file include/net/inet_sock.h
Hunk #1 FAILED at 175.
1 out of 1 hunk FAILED -- rejects in file include/net/inet_sock.h
patching file include/net/sock.h
patching file include/net/tcp.h
patching file kernel/audit.c
Hunk #1 FAILED at 1200.
1 out of 1 hunk FAILED -- rejects in file kernel/audit.c
patching file kernel/compat.c
Hunk #1 FAILED at 40.
Hunk #2 FAILED at 78.
2 out of 2 hunks FAILED -- rejects in file kernel/compat.c
patching file kernel/futex.c
Hunk #1 succeeded at 62 with fuzz 2 (offset 2 lines).
Hunk #2 succeeded at 412 with fuzz 2 (offset -56 lines).
Hunk #3 FAILED at 1802.
Hunk #4 succeeded at 1893 with fuzz 2 (offset 9 lines).
Hunk #5 succeeded at 2001 with fuzz 2 (offset 12 lines).
Hunk #6 FAILED at 2058.
Hunk #7 FAILED at 2086.
Hunk #8 FAILED at 2121.
Hunk #9 FAILED at 2150.
Hunk #10 FAILED at 2182.
6 out of 10 hunks FAILED -- rejects in file kernel/futex.c
patching file kernel/futex_compat.c
Hunk #1 succeeded at 57 with fuzz 2 (offset 3 lines).
Hunk #2 FAILED at 121.
Hunk #3 succeeded at 145 with fuzz 2 (offset 9 lines).
Hunk #4 FAILED at 193.
2 out of 4 hunks FAILED -- rejects in file kernel/futex_compat.c
patching file kernel/hrtimer.c
Hunk #1 succeeded at 343 with fuzz 2 (offset 18 lines).
Hunk #2 succeeded at 447 with fuzz 2 (offset 20 lines).
Hunk #3 succeeded at 468 with fuzz 2 (offset 29 lines).
Hunk #4 FAILED at 740.
Hunk #5 FAILED at 891.
Hunk #6 FAILED at 900.
Hunk #7 FAILED at 1335.
Hunk #8 FAILED at 1364.
Hunk #9 FAILED at 1377.
Hunk #10 FAILED at 1393.
Hunk #11 FAILED at 1411.
Hunk #12 FAILED at 1419.
9 out of 12 hunks FAILED -- rejects in file kernel/hrtimer.c
patching file kernel/irq/chip.c
Hunk #1 succeeded at 257 (offset 11 lines).
Hunk #2 FAILED at 278.
Hunk #3 succeeded at 661 with fuzz 2 (offset 54 lines).
1 out of 3 hunks FAILED -- rejects in file kernel/irq/chip.c
patching file kernel/posix-timers.c
Hunk #1 FAILED at 766.
Hunk #2 FAILED at 983.
2 out of 2 hunks FAILED -- rejects in file kernel/posix-timers.c
patching file kernel/printk.c
patching file kernel/relay.c
Hunk #1 FAILED at 92.
Hunk #2 FAILED at 1072.
Hunk #3 FAILED at 1103.
3 out of 3 hunks FAILED -- rejects in file kernel/relay.c
patching file kernel/sched.c
Hunk #1 FAILED at 4028.
Hunk #2 FAILED at 4040.
Hunk #3 FAILED at 4338.
Hunk #4 FAILED at 7108.
4 out of 4 hunks FAILED -- rejects in file kernel/sched.c
patching file kernel/sched_fair.c
Hunk #1 FAILED at 511.
Hunk #2 FAILED at 867.
2 out of 2 hunks FAILED -- rejects in file kernel/sched_fair.c
patching file kernel/softirq.c
patching file kernel/sysctl.c
Hunk #1 FAILED at 306.
Hunk #2 succeeded at 1054 with fuzz 2 (offset 144 lines).
1 out of 2 hunks FAILED -- rejects in file kernel/sysctl.c
patching file mm/filemap.c
Hunk #7 FAILED at 1893.
Hunk #8 FAILED at 1925.
Hunk #9 FAILED at 2421.
Hunk #10 FAILED at 2435.
4 out of 10 hunks FAILED -- rejects in file mm/filemap.c
patching file mm/fremap.c
Hunk #1 FAILED at 190.
1 out of 1 hunk FAILED -- rejects in file mm/fremap.c
patching file mm/hugetlb.c
Hunk #1 FAILED at 119.
Hunk #2 FAILED at 134.
Hunk #3 succeeded at 615 (offset 10 lines).
2 out of 3 hunks FAILED -- rejects in file mm/hugetlb.c
patching file mm/memory.c
Hunk #1 FAILED at 980.
1 out of 1 hunk FAILED -- rejects in file mm/memory.c
patching file mm/mmap.c
Hunk #1 FAILED at 2215.
1 out of 1 hunk FAILED -- rejects in file mm/mmap.c
patching file mm/shmem.c
patching file mm/slab.c
Hunk #1 FAILED at 304.
Hunk #2 succeeded at 1426 (offset 16 lines).
Hunk #3 succeeded at 1458 with fuzz 2 (offset 10 lines).
Hunk #4 FAILED at 1614.
Hunk #5 FAILED at 1986.
Hunk #6 FAILED at 2109.
Hunk #7 FAILED at 2971.
5 out of 7 hunks FAILED -- rejects in file mm/slab.c
patching file mm/slub.c
Hunk #1 succeeded at 3082 with fuzz 2 (offset 490 lines).
Hunk #2 FAILED at 3092.
1 out of 2 hunks FAILED -- rejects in file mm/slub.c
patching file net/bluetooth/hci_sysfs.c
Hunk #1 FAILED at 12.
Hunk #2 succeeded at 285 with fuzz 2 (offset 4 lines).
Hunk #3 FAILED at 321.
Hunk #4 FAILED at 357.
Hunk #5 FAILED at 406.
4 out of 5 hunks FAILED -- rejects in file net/bluetooth/hci_sysfs.c
patching file net/bridge/netfilter/ebt_dnat.c
Hunk #1 FAILED at 20.
1 out of 1 hunk FAILED -- rejects in file net/bridge/netfilter/ebt_dnat.c
patching file net/bridge/netfilter/ebt_redirect.c
Hunk #1 FAILED at 21.
1 out of 1 hunk FAILED -- rejects in file net/bridge/netfilter/ebt_redirect.c
patching file net/bridge/netfilter/ebt_snat.c
Hunk #1 FAILED at 22.
1 out of 1 hunk FAILED -- rejects in file net/bridge/netfilter/ebt_snat.c
patching file net/core/dev.c
Hunk #1 FAILED at 1068.
Hunk #2 succeeded at 1078 with fuzz 2.
Hunk #3 FAILED at 2906.
2 out of 3 hunks FAILED -- rejects in file net/core/dev.c
patching file net/ipv4/af_inet.c
patching file net/ipv4/fib_hash.c
Hunk #1 FAILED at 434.
Hunk #2 FAILED at 493.
2 out of 2 hunks FAILED -- rejects in file net/ipv4/fib_hash.c
patching file net/ipv4/fib_trie.c
Hunk #1 FAILED at 1203.
Hunk #2 FAILED at 1253.
Hunk #3 FAILED at 1270.
Hunk #4 FAILED at 1630.
4 out of 4 hunks FAILED -- rejects in file net/ipv4/fib_trie.c
patching file net/ipv4/inet_diag.c
Hunk #1 FAILED at 259.
Hunk #2 FAILED at 710.
Hunk #3 FAILED at 840.
3 out of 3 hunks FAILED -- rejects in file net/ipv4/inet_diag.c
patching file net/ipv4/ip_output.c
Hunk #1 FAILED at 462.
Hunk #2 FAILED at 486.
Hunk #3 FAILED at 497.
3 out of 3 hunks FAILED -- rejects in file net/ipv4/ip_output.c
patching file net/ipv4/ip_sockglue.c
Hunk #1 FAILED at 514.
1 out of 1 hunk FAILED -- rejects in file net/ipv4/ip_sockglue.c
patching file net/ipv4/ipcomp.c
Hunk #1 FAILED at 74.
Hunk #2 FAILED at 85.
Hunk #3 FAILED at 108.
3 out of 3 hunks FAILED -- rejects in file net/ipv4/ipcomp.c
patching file net/ipv4/ipconfig.c
Hunk #1 FAILED at 739.
1 out of 1 hunk FAILED -- rejects in file net/ipv4/ipconfig.c
patching file net/ipv4/netfilter/arpt_mangle.c
Hunk #1 FAILED at 19.
1 out of 1 hunk FAILED -- rejects in file net/ipv4/netfilter/arpt_mangle.c
patching file net/ipv4/netfilter/ip_queue.c
Hunk #1 FAILED at 336.
Hunk #2 FAILED at 349.
2 out of 2 hunks FAILED -- rejects in file net/ipv4/netfilter/ip_queue.c
patching file net/ipv4/sysctl_net_ipv4.c
Hunk #1 FAILED at 248.
1 out of 1 hunk FAILED -- rejects in file net/ipv4/sysctl_net_ipv4.c
patching file net/ipv4/tcp.c
patching file net/ipv4/xfrm4_tunnel.c
Hunk #1 FAILED at 50.
1 out of 1 hunk FAILED -- rejects in file net/ipv4/xfrm4_tunnel.c
patching file net/ipv6/ip6_output.c
Hunk #1 FAILED at 593.
Hunk #2 FAILED at 609.
Hunk #3 FAILED at 632.
Hunk #4 FAILED at 663.
Hunk #5 succeeded at 1395 with fuzz 2 (offset 6 lines).
4 out of 5 hunks FAILED -- rejects in file net/ipv6/ip6_output.c
patching file net/ipv6/ip6_tunnel.c
Hunk #1 FAILED at 550.
1 out of 1 hunk FAILED -- rejects in file net/ipv6/ip6_tunnel.c
patching file net/ipv6/ipcomp6.c
Hunk #1 FAILED at 64.
Hunk #2 FAILED at 80.
Hunk #3 FAILED at 111.
Hunk #4 FAILED at 146.
4 out of 4 hunks FAILED -- rejects in file net/ipv6/ipcomp6.c
patching file net/ipv6/netfilter/ip6_queue.c
Hunk #1 FAILED at 333.
Hunk #2 FAILED at 346.
2 out of 2 hunks FAILED -- rejects in file net/ipv6/netfilter/ip6_queue.c
patching file net/ipv6/xfrm6_output.c
Hunk #1 FAILED at 34.
1 out of 1 hunk FAILED -- rejects in file net/ipv6/xfrm6_output.c
patching file net/netfilter/nf_conntrack_proto_tcp.c
Hunk #1 FAILED at 135.
Hunk #2 FAILED at 834.
Hunk #3 FAILED at 861.
Hunk #4 FAILED at 904.
Hunk #5 FAILED at 958.
5 out of 5 hunks FAILED -- rejects in file net/netfilter/nf_conntrack_proto_tcp.c
patching file net/netfilter/nfnetlink_log.c
Hunk #1 FAILED at 594.
1 out of 1 hunk FAILED -- rejects in file net/netfilter/nfnetlink_log.c
patching file net/netfilter/nfnetlink_queue.c
Hunk #1 FAILED at 353.
Hunk #2 FAILED at 616.
Hunk #3 FAILED at 627.
3 out of 3 hunks FAILED -- rejects in file net/netfilter/nfnetlink_queue.c
patching file net/netfilter/xt_time.c
Hunk #1 FAILED at 95.
1 out of 1 hunk FAILED -- rejects in file net/netfilter/xt_time.c
patching file net/sched/em_meta.c
Hunk #1 FAILED at 719.
1 out of 1 hunk FAILED -- rejects in file net/sched/em_meta.c
patching file net/sched/ematch.c
Hunk #1 FAILED at 305.
1 out of 1 hunk FAILED -- rejects in file net/sched/ematch.c
patching file net/socket.c
patching file scripts/mod/file2alias.c
Hunk #1 FAILED at 155.
1 out of 1 hunk FAILED -- rejects in file scripts/mod/file2alias.c
patching file security/Kconfig
patching file security/Makefile
patching file security/commoncap.c
Hunk #1 FAILED at 539.
1 out of 1 hunk FAILED -- rejects in file security/commoncap.c
patching file security/selinux/ss/services.c
Hunk #1 succeeded at 1747 with fuzz 2 (offset 3 lines).
Hunk #2 FAILED at 2632.
1 out of 2 hunks FAILED -- rejects in file security/selinux/ss/services.c
patching file security/trustees/Makefile
patching file security/trustees/fs.c
patching file security/trustees/funcs.c
patching file security/trustees/init.c
patching file security/trustees/internal.h
patching file security/trustees/security.c
patching file sound/oss/via82cxxx_audio.c
Hunk #1 FAILED at 2104.
Hunk #2 FAILED at 2128.
2 out of 2 hunks FAILED -- rejects in file sound/oss/via82cxxx_audio.c
patching file sound/usb/usx2y/usX2Yhwdep.c
Hunk #1 FAILED at 88.
1 out of 1 hunk FAILED -- rejects in file sound/usb/usx2y/usX2Yhwdep.c
patching file sound/usb/usx2y/usx2yhwdeppcm.c
Hunk #1 FAILED at 728.
1 out of 1 hunk FAILED -- rejects in file sound/usb/usx2y/usx2yhwdeppcm.c
Patch oxnas.diff does not apply (enforce with -f)
^[3ERROR: Task 376 (/opt/workdir/oe/openembedded/recipes/linux/linux_2.6.24.bb, do_patch) failed
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: /opt/workdir/oe/openembedded/recipes/base-files/base-files_3.0.14.bb, do_install (21076)
NOTE: Tasks Summary: Attempted 2657 tasks of which 2649 didn't need to be rerun and 1 failed.
ERROR: '/opt/workdir/oe/openembedded/recipes/linux/linux_2.6.24.bb' failed
NOTE: oestats: build failed, see http://tinderbox.openembedded.net/builds/55837/
camelguo@camelguo:/opt/workdir/oe/build/gulessoft-oe-standard-conf$ 
camelguo@camelguo:/opt/workdir/oe/build/gulessoft-oe-standard-conf$ ls
autobuilder.log  build.sh  conf  dependsgraph.sh  setup-env.sh  test.sh
camelguo@camelguo:/opt/workdir/oe/build/gulessoft-oe-standard-conf$ vi autobuilder.log 
camelguo@camelguo:/opt/workdir/oe/build/gulessoft-oe-standard-conf$ vi build.sh 
camelguo@camelguo:/opt/workdir/oe/build/gulessoft-oe-standard-conf$ ./build.sh 
NOTE: Out of date cache found, rebuilding...
NOTE: Handling BitBake files: / (8020/8020) [100 %]
NOTE: Parsing finished. 0 cached, 7702 parsed, 318 skipped, 0 masked.
NOTE: oestats: build 55838
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1297 of 2669 (ID: 377, /opt/workdir/oe/openembedded/recipes/linux/linux-kirkwood_2.6.33-rc5.bb, do_patch)
NOTE: Applying patch 'openrd-base-enable-pcie.patch' (../../openembedded/recipes/linux/linux-kirkwood/openrd-base/openrd-base-enable-pcie.patch)
ERROR: Error in executing: /opt/workdir/oe/openembedded/recipes/linux/linux-kirkwood_2.6.33-rc5.bb
ERROR: Exception:<class 'CmdError'> Message:Command Error: exit status: 1  Output:
Applying patch openrd-base-enable-pcie.patch
patching file arch/arm/mach-kirkwood/openrd_base-setup.c
Hunk #1 FAILED at 70.
1 out of 1 hunk FAILED -- rejects in file arch/arm/mach-kirkwood/openrd_base-setup.c
Patch openrd-base-enable-pcie.patch does not apply (enforce with -f)
ERROR: Printing the environment of the function
ERROR: Error in executing: /opt/workdir/oe/openembedded/recipes/linux/linux-kirkwood_2.6.33-rc5.bb
ERROR: Exception:<class 'CmdError'> Message:Command Error: exit status: 1  Output:
Applying patch openrd-base-enable-pcie.patch
patching file arch/arm/mach-kirkwood/openrd_base-setup.c
Hunk #1 FAILED at 70.
1 out of 1 hunk FAILED -- rejects in file arch/arm/mach-kirkwood/openrd_base-setup.c
Patch openrd-base-enable-pcie.patch does not apply (enforce with -f)
ERROR: Printing the environment of the function
ERROR: Error in executing: /opt/workdir/oe/openembedded/recipes/linux/linux-kirkwood_2.6.33-rc5.bb
ERROR: Exception:<class 'CmdError'> Message:Command Error: exit status: 1  Output:
Applying patch openrd-base-enable-pcie.patch
patching file arch/arm/mach-kirkwood/openrd_base-setup.c
Hunk #1 FAILED at 70.
1 out of 1 hunk FAILED -- rejects in file arch/arm/mach-kirkwood/openrd_base-setup.c
Patch openrd-base-enable-pcie.patch does not apply (enforce with -f)
ERROR: Printing the environment of the function
ERROR: Build of /opt/workdir/oe/openembedded/recipes/linux/linux-kirkwood_2.6.33-rc5.bb do_patch failed
Traceback (most recent call last):
  File "/opt/workdir/oe/bitbake/bin/bitbake", line 143, in <module>
    main()
  File "/opt/workdir/oe/bitbake/bin/bitbake", line 140, in main
    cooker.cook()
  File "/opt/workdir/oe/bitbake/lib/bb/cooker.py", line 640, in cook
    return self.buildTargets(pkgs_to_build)
  File "/opt/workdir/oe/bitbake/lib/bb/cooker.py", line 547, in buildTargets
    failures = rq.execute_runqueue()
  File "/opt/workdir/oe/bitbake/lib/bb/runqueue.py", line 841, in execute_runqueue
    self.execute_runqueue_internal()
  File "/opt/workdir/oe/bitbake/lib/bb/runqueue.py", line 950, in execute_runqueue_internal
    self.cooker.tryBuild(fn)
  File "/opt/workdir/oe/bitbake/lib/bb/cooker.py", line 136, in tryBuild
    return self.tryBuildPackage(fn, item, self.configuration.cmd, the_data)
  File "/opt/workdir/oe/bitbake/lib/bb/cooker.py", line 110, in tryBuildPackage
    bb.build.exec_task('do_%s' % task, the_data)
  File "/opt/workdir/oe/bitbake/lib/bb/build.py", line 283, in exec_task
    exec_func(task, localdata)
  File "/opt/workdir/oe/bitbake/lib/bb/build.py", line 120, in exec_func
    exec_func_python(func, d)
  File "/opt/workdir/oe/bitbake/lib/bb/build.py", line 141, in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/opt/workdir/oe/bitbake/lib/bb/utils.py", line 185, in better_exec
    exec code in context
  File "do_patch", line 4, in <module>
  File "do_patch", line 2, in do_patch
  File "/opt/workdir/oe/bitbake/lib/bb/build.py", line 120, in exec_func
    exec_func_python(func, d)
  File "/opt/workdir/oe/bitbake/lib/bb/build.py", line 141, in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/opt/workdir/oe/bitbake/lib/bb/utils.py", line 185, in better_exec
    exec code in context
  File "base_do_patch", line 4, in <module>
  File "base_do_patch", line 2, in base_do_patch
  File "/opt/workdir/oe/bitbake/lib/bb/build.py", line 120, in exec_func
    exec_func_python(func, d)
  File "/opt/workdir/oe/bitbake/lib/bb/build.py", line 141, in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/opt/workdir/oe/bitbake/lib/bb/utils.py", line 185, in better_exec
    exec code in context
  File "patch_do_patch", line 98, in <module>
  File "patch_do_patch", line 96, in patch_do_patch
  File "<bb>", line 361, in Resolve
__builtin__.CmdError: Command Error: exit status: 1  Output:
Applying patch openrd-base-enable-pcie.patch
patching file arch/arm/mach-kirkwood/openrd_base-setup.c
Hunk #1 FAILED at 70.
1 out of 1 hunk FAILED -- rejects in file arch/arm/mach-kirkwood/openrd_base-setup.c
Patch openrd-base-enable-pcie.patch does not apply (enforce with -f)
ERROR: Task 377 (/opt/workdir/oe/openembedded/recipes/linux/linux-kirkwood_2.6.33-rc5.bb, do_patch) failed
NOTE: Tasks Summary: Attempted 2616 tasks of which 2616 didn't need to be rerun and 1 failed.
ERROR: '/opt/workdir/oe/openembedded/recipes/linux/linux-kirkwood_2.6.33-rc5.bb' failed
NOTE: oestats: build failed, see http://tinderbox.openembedded.net/builds/55838/


------------9OcyKMCnv5ZTfUdZ2Th7Vb--
