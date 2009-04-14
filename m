Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1Ltj45-0003Tj-CS
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 15:52:44 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1653576ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2009 06:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=eQJgFwbsqAzZ03bU8fT6XIrGQFF0Y3fM2J/MFIygaK0=;
	b=pClowWmvH/grKKLEZf7scvBZeb2sY5wql3U0REsqGf4uZz7y0rQWNmK09tk3z7qm6h
	mH+qhjZtr+dSfyWmwNHSL33rnkFPSxPx9Xqpw5GpQOHzRUwsd2JeOrHRPGTiXwLiSb7O
	9UbQZgBgbVNNtN4pH1k9VLaRueH5NgBM99nVI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=mp/ottPaW46InNf2bHzkcWg37XVDq3PuUPu9UjvPmdB4511fwsYkeQDzIKIhNhL5An
	+bmtuGEwa6hw6K3mc+vlN8yyjx9icgB8adGHjC9QeHugzvwhMGUJPzIchpDyRMDECgWh
	KgqpPdCMjg/RUHnSp/j56wTFF8sa7fmqXESgg=
MIME-Version: 1.0
Received: by 10.231.37.8 with SMTP id v8mr1034978ibd.35.1239716939732; Tue, 14 
	Apr 2009 06:48:59 -0700 (PDT)
In-Reply-To: <gs21kr$sbu$1@ger.gmane.org>
References: <ade1bdc0904140555w37f51e9m1a81f951bd68cc8a@mail.gmail.com>
	<gs21kr$sbu$1@ger.gmane.org>
Date: Tue, 14 Apr 2009 15:48:59 +0200
Message-ID: <ade1bdc0904140648s7970ecccr2d5e7ade0685b681@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.46.153
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 2.6.28 pm kernel for beagleboard: "Turning off lcd and digit"
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
X-List-Received-Date: Tue, 14 Apr 2009 13:52:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

It is without splash.
I press RESET button keeping USER button presses.
u-boot start without splash.
but, with pm kernel I have the pb (see the logs below).
with the same u-boot,bootargs,rootfs, I put 2.6.28-r25 and the problem
disappear.
So I have to stay in 2.6.28-r25.
I'm sorry about this.
If can give more debug info tell me how to do, please.



U-Boot 2009.03 (Apr 11 2009 - 13:48:57)

OMAP3530-GP rev 2, CPU-OPP2 L3-165MHz
OMAP3 Beagle board + LPDDR/NAND
DRAM:  128 MB
NAND:  256 MiB
In:    serial
Out:   serial
Err:   serial
Board revision Ax/Bx
Die ID #5ac400030000000004013f8901001001
Hit any key to stop autoboot:  0
reading uImage

2703012 bytes read
## Booting kernel from Legacy Image at 80300000 ...
   Image Name:   Angstrom/2.6.28/beagleboard
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2702948 Bytes =  2.6 MB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux.............................................................................................................................................................................
done, booting the kernel.
Linux version 2.6.28-omap1 (recalcati@recalcati-laptop) (gcc version
4.3.1 (GCC) ) #1 Sat Apr 11 14:16:14 CEST 2009
CPU: ARMv7 Processor [411fc083] revision 3 (ARMv7), cr=10c5387f
CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
Machine: OMAP3 Beagle Board
Memory policy: ECC disabled, Data cache writeback
OMAP3430 ES3.0
SRAM: Mapped pa 0x40200000 to va 0xd7000000 size: 0x100000
Reserving 15728640 bytes SDRAM for VRAM
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
Kernel command line: console=ttyS2,115200n8 root=/dev/mmcblk0p2
rootwait rw init=/init omapfb.video_mode=hd720 omapfb.debug=y
omap-dss.def_disp=lcd omap-dss.debug=y
Clocking rate (Crystal/DPLL/ARM core): 26.0/332/500 MHz
GPMC revision 5.0
IRQ: Found an INTC at 0xd8200000 (revision 4.0) with 96 interrupts
Total of 96 interrupts on 1 active controller
OMAP34xx GPIO hardware version 2.5
PID hash table entries: 512 (order: 9, 2048 bytes)
OMAP clockevent source: GPTIMER12 at 32768 Hz
Console: colour dummy device 80x30
..
...
..
SR1: VDD autocomp is not active
uncorrectable error : <3>uncorrectable error : <3>end_request: I/O
error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
uncorrectable error : <3>end_request: I/O error, dev mtdblock0, sector 8
Buffer I/O error on device mtdblock0, logical block 1
uncorrectable error : <3>end_request: I/O error, dev mtdblock0, sector 16
Buffer I/O error on device mtdblock0, logical block 2
end_request: I/O error, dev mtdblock0, sector 24
Buffer I/O error on device mtdblock0, logical block 3
uncorrectable error : <3>uncorrectable error : <3>end_request: I/O
error, dev mtdblock0, sector 0
Buffer I/O error on device mtdblock0, logical block 0
SR1: VDD autocomp is not active
ALSA: Restoring mixer settings...
Configuring network interfaces... eth0: link up, 100Mbps, full-duplex,
lpa 0x45E1
eth0      no wireless extensions.

udhcpc (v1.13.2) started
run-parts: /etc/udhcpc.d/00avahi-autoipd exited with code 1
eth0: link up, 100Mbps, full-duplex, lpa 0x45E1
Sending discover...
Sending select for 192.168.1.112...
Lease of 192.168.1.112 obtained, lease time 43200
run-parts: /etc/udhcpc.d/00avahi-autoipd exited with code 1
adding dns 192.168.1.254
done.
Starting portmap daemon: portmap.
Unknown HZ value! (94) Assume 100.
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.all.rp_filter = 1
Tue Apr 14 13:01:00 BST 2009
INIT: Entering runlevel: 5
Configuring leds:
  beagleboard::usr0: heartbeat
  beagleboard::usr1: mmc0
Starting Dropbear SSH server: dropbear.
Starting advanced power management daemon: No APM support in kernel
(failed.)
Starting system message bus: dbus.
Starting Hardware abstraction layer hald
eth0: link up, 100Mbps, full-duplex, lpa 0x45E1
Starting syslogd/klogd: done
 * Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon
[ ok ]
Starting Connection Manager
/etc/init.d/rc: line 168: /etc/rc5.d/S30ntpdate: Permission denied
Starting GPE display manager: gpe-dm

.-------.
|       |                  .-.
|   |   |-----.-----.-----.| |   .----..-----.-----.
|       |     | __  |  ---'| '--.|  .-'|     |     |
|   |   |  |  |     |---  ||  --'|  |  |  '  | | | |
'---'---'--'--'--.  |-----''----''--'  '-----'-'-'-'
                -'  |
                '---'

The Angstrom Distribution beagleboard ttyS2

Angstrom 2009.X-test-20090331 beagleboard ttyS2

beagleboard login: SR1: VDD autocomp is not active
omap-dss DISPC error: dispc irq error status 100e6
omap-dss DISPC error: dispc irq error status 0040
omap-dss DISPC error: dispc irq error status 00e2
SR2: VDD autocomp is not active
omap-dss DISPC error: dispc irq error status 0040
omap-dss DISPC error: dispc irq error status 0040
omap-dss DISPC error: dispc irq error status 00e2
omap-dss DISPC error: dispc irq error status 0040
omap-dss DISPC error: dispc irq error status 0040
omap-dss DISPC error: dispc irq error status 00c0
omap-dss DISPC error: dispc irq error status 0062
omap-dss DISPC error: Excessive DISPC errors
Turning off lcd and digit
omap-dss DISPC error: Excessive DISPC errors
Turning off lcd and digit
omap-dss DISPC error: Excessive DISPC errors
Turning off lcd and digit
omap-dss DISPC error: Excessive DISPC errors
Turning off lcd and digit
SR1: VDD autocomp is not active




2009/4/14 Koen Kooi <k.kooi@student.utwente.nl>:
> On 14-04-09 14:55, Raffaele Recalcati wrote:
>>
>> I did several reboot and I powered off the at least one minute.
>> u-boot splash screen always appear.
>> then I have a re-sync
>> 720p appear in pm kernel modified to add hd720 format.
>> when X starts I have so many errors and the lcd becomes black
>
> Again, as you were told multiple times on IRC: use a proper u-boot without a
> bootsplash.
>
> Can we hope for some form of learning curve?
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


