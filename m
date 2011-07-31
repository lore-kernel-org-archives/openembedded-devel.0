Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1Qneo9-0001B4-Pl
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 00:48:30 +0200
Received: (qmail 3739 invoked by uid 501); 31 Jul 2011 15:44:09 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.2/13382. avast: v3.2.0/110730-1. sophie:
	3.06/3.22.0/4.68. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.032888 secs); 31 Jul 2011 22:44:09 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 31 Jul 2011 15:44:09 -0700
MIME-Version: 1.0
x-mimeole: Produced By Microsoft Exchange V6.5
Date: Mon, 1 Aug 2011 10:44:07 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A657@nzc-ap-xch-02.ap.trimblecorp.net>
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A5EB@nzc-ap-xch-02.ap.trimblecorp.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Serial Console name for i.mx31
Thread-Index: AcxPy79qVTNBJrIwTR24WgL9ktGKJwAB0BCg
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A5EB@nzc-ap-xch-02.ap.trimblecorp.net>
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: Serial Console name for i.mx31
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
X-List-Received-Date: Sun, 31 Jul 2011 22:48:30 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=20



Hi,

Can anyone verify what the kernel command line option should be to use
the first imx31 uart? As far as I can tell it is
"console=3Dttymxc0,115200"

The reason I ask, is that I am seeing the kernel messages in the ram
kernel ring buffer, but not seing them come out the serial console.

I am porting linux to our own hardware which is similar to the LogicPD
LiteKit platform (I have compiled the kernel for this platform ..)

Debugging into the serial driver in ../drivers/serial/mx31  .. I see the
function init_serial_init() being called ( .. and it's printk message is
in the buffer) but I am not seeing the serial_imx_probe() being called
..

I do not understand the the registering of platform drivers enough to
work out how the kernel connects the diver with the hardware .... Can
someone enlighten me on how to debug this further ..... Or even better
just tell me to use the correct command line option and it all bursts
into life  :-)

Thanks,
Bernie=20

In addition:

I added the earlyprintk command to the kernel command line and I do see
these messages. i.e:

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
Linux version 2.6.36.1 (bmentink@2570-ArchBox) (gcc version 4.5.3
20110311 (prerelease) (GCC) ) #7 P
REEMPT Mon Aug 1 09:51:34 NZST 2011
CPU: ARMv6-compatible processor [4107b364] revision 4 (ARMv6TEJ),
cr=3D00c5387f
CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
Machine: LogicPD i.MX31 SOM
bootconsole [earlycon0] enabled
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists in Zone order, mobility grouping on.  Total pages:
32512
Kernel command line: console=3Dttymxc,115200
earlyprintk=3Dserial,ttymxc0,115200,keep
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 128MB =3D 128MB total
Memory: 126744k/126744k available, 4328k reserved, 0K highmem
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
    vmalloc : 0xc8800000 - 0xf4000000   ( 696 MB)
    lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .init : 0xc0008000 - 0xc001e000   (  88 kB)
      .text : 0xc001e000 - 0xc02e1000   (2828 kB)
      .data : 0xc02f6000 - 0xc030c6e0   (  90 kB)
Hierarchical RCU implementation.
        RCU-based detection of stalled CPUs is disabled.
        Verbose stalled-CPUs detection is disabled.
NR_IRQS:180
MXC IRQ initialized
MXC GPIO hardware

So it seems there is nothing wrong with the "ttymxc0" port assignment
... It's just the main serial console is just not working ..
=20
Cheers,
B.




_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


