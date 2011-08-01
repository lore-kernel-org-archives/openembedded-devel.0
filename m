Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1Qnhd4-0004jI-El
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 03:49:15 +0200
Received: (qmail 20412 invoked by uid 501); 31 Jul 2011 18:44:53 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.2/13382. avast: v3.2.0/110730-1. sophie:
	3.06/3.22.0/4.68. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.041586 secs); 01 Aug 2011 01:44:53 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 31 Jul 2011 18:44:52 -0700
MIME-Version: 1.0
x-mimeole: Produced By Microsoft Exchange V6.5
Date: Mon, 1 Aug 2011 13:44:51 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A723@nzc-ap-xch-02.ap.trimblecorp.net>
In-Reply-To: <201108011324.30087.manningc2@actrix.gen.nz>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Serial Console name for i.mx31
Thread-Index: AcxP6dIsa7+BIIOlSFWdSQrVp7GghwAAD/KA
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A5EB@nzc-ap-xch-02.ap.trimblecorp.net>
	<201108011134.03562.manningc2@actrix.gen.nz>
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A6FE@nzc-ap-xch-02.ap.trimblecorp.net>
	<201108011324.30087.manningc2@actrix.gen.nz>
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: "Charles Manning" <manningc2@actrix.gen.nz>,
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 01 Aug 2011 01:49:15 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Charles...

And as I said earlier, I have been looking in drivers/serial/mx.c, that
is where I saw that the function serial_imx_probe was not being called
if you remember  ...

My problem is what bit of code calls that function .. It is NOT in that
module .. I am trying to get to the code that calls the ...probe to see
Why it is not being called ... That is in some other module .. But I
can't trace it due to all the vectored execution ..=20

All the CONFIG_xxx defines are defined and yes, it is compiled in,
because if you remember earlier, I said I put debug statements in the ..
Init()
Function and that was being called, I put debug statements in the
...probe() and that is NOT being called .... I see these printk outputs
in the kernel ring buffer ..... All the obvious things are covered
Charles ..


>the driver layers (and hence serial drivers) only get set up later in=20
>the piece by serial_imx_probe() once the OS is running.

It's the "later" part I am trying to find ... I repeat, the bit of code
that calls serial_imx_probe(), I may be thick, but I can't trace where
it is ..
All I know is that the driver is "registered" correctly
(platform_register_driver() outputs no error messages), but the ..probe
is not called.

I am trying to find the bit of code that finds that there is an builtin
imx31 serial peripheral and trys to load the driver for it .... The only
code
I could find is the function platform_driver_register() in
../drivers/base which loads all the "platform" drivers .. I am currently
trying to put some debug stuff in that file to see why the driver is not
being loaded/probed ..

I hope I am being clear this time ..



-----Original Message-----
From: Charles Manning [mailto:manningc2@actrix.gen.nz]=20
Sent: Monday, 1 August 2011 1:24 p.m.
To: openembedded-devel@lists.openembedded.org
Cc: Bernard Mentink
Subject: Re: [oe] Serial Console name for i.mx31

Bernie...

As I said, look in the serial driver code. Where that is will depend on
what Linux tree you are using.

On a tree I looked at now it is in drivers/serial/imx.c . It could also
be under drivers/tty/...


As I said, there are setups for two different sets of code in there: one
for=20
the console and one for drivers. The console is used during early boot=20
because the driver layers (and hence serial drivers) only get set up
later in=20
the piece by serial_imx_probe() once the OS is running.

imx_console_xxx functions relate to the console support.
imx_console_setup() sets up the actual console.

There are a bunch of defines CONFIG_SERIAL_IMX_CONSOLE, IMX_CONSOLE etc.
Make=20
sure those are configured and all the console code is actually being
compiled=20
in and initialised properly.



On Monday 01 August 2011 13:03:16 Bernard Mentink wrote:
> Funny Man!  ..... What code .... The problem is finding the relevent
> bits ... As everything seems to be executed as tables of function
> pointers, it is very hard to fine what links with what ..
>
> (remember Charles, this is my 1st time getting into Embedded linux
code
> .... Give me a break!)
>
> -----Original Message-----
> From: Charles Manning [mailto:manningc2@actrix.gen.nz]
> Sent: Monday, 1 August 2011 11:34 a.m.
> To: openembedded-devel@lists.openembedded.org
> Cc: Bernard Mentink
> Subject: Re: [oe] Serial Console name for i.mx31
>
> Look at the code.
>
> That will tell you exactly what is going on.
>
> On Monday 01 August 2011 11:24:12 Bernard Mentink wrote:
> > Hi Charles,
> >
> > Thanks, but I thought that it was obvious that I am hooked upto the
> > 1st
> > imx31 serial port as I am using ttymxc0 .. ;-) I have tried seeing
if
> > I am getting output on any other serial port (we have 4 of the 5
> > brought out to connectors ..)
> >
> > The example .config file for the imx shows a kernel argument of
> > "console=3Dttymxc0,115200" with no parity/bits setting so I don't
think
> > That will make any difference ... But I will try it.
> >
> > Cheers,
> > B.
> >
> >
> >
> >
> > -----Original Message-----
> > From: Charles Manning [mailto:manningc2@actrix.gen.nz]
> > Sent: Monday, 1 August 2011 11:17 a.m.
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Bernard Mentink
> > Subject: Re: [oe] Serial Console name for i.mx31
> >
> > Bernie
> >
> > You have to hook up to the UART that is wired to what you're
watching.
> > Nobody on this list knows what serial port you are connected to.
> >
> > NB That the early console stuff is set up as a console through
console
> >
> > initialisation. THis is not the same as setting up the serial ports
> > for driver usage.
> >
> > As for the actual setting, it does not look good compared to what I
am
> >
> > used to because it does not set all the parameters.
> >
> > console=3Dttymxc0,115200n8
> >
> > But what actually is used will depend on the console setup (search
for
> >
> > console in the imx31 serial driver code.
> >
> > On Monday 01 August 2011 10:44:07 Bernard Mentink wrote:
> > > Hi,
> > >
> > > Can anyone verify what the kernel command line option should be to
> > > use the first imx31 uart? As far as I can tell it is
> > > "console=3Dttymxc0,115200"
> > >
> > > The reason I ask, is that I am seeing the kernel messages in the
ram
> > >
> > > kernel ring buffer, but not seing them come out the serial
console.
> > >
> > > I am porting linux to our own hardware which is similar to the
> > > LogicPD LiteKit platform (I have compiled the kernel for this
> > > platform ..)
> > >
> > > Debugging into the serial driver in ../drivers/serial/mx31  .. I
see
> >
> > the
> >
> > > function init_serial_init() being called ( .. and it's printk
> > > message
> >
> > is
> >
> > > in the buffer) but I am not seeing the serial_imx_probe() being
> > > called ..
> > >
> > > I do not understand the the registering of platform drivers enough
> > > to work out how the kernel connects the diver with the hardware
....
> > >
> > > Can someone enlighten me on how to debug this further ..... Or
even
> > > better just tell me to use the correct command line option and it
> > > all bursts into life  :-)
> > >
> > > Thanks,
> > > Bernie
> > >
> > > In addition:
> > >
> > > I added the earlyprintk command to the kernel command line and I
do
> >
> > see
> >
> > > these messages. i.e:
> > >
> > > Starting kernel ...
> > >
> > > Uncompressing Linux... done, booting the kernel.
> > > Linux version 2.6.36.1 (bmentink@2570-ArchBox) (gcc version 4.5.3
> > > 20110311 (prerelease) (GCC) ) #7 P
> > > REEMPT Mon Aug 1 09:51:34 NZST 2011
> > > CPU: ARMv6-compatible processor [4107b364] revision 4 (ARMv6TEJ),
> > > cr=3D00c5387f
> > > CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction
cache
> > > Machine: LogicPD i.MX31 SOM
> > > bootconsole [earlycon0] enabled
> > > Memory policy: ECC disabled, Data cache writeback Built 1
zonelists
> > > in Zone order, mobility grouping on.  Total pages:
> > > 32512
> > > Kernel command line: console=3Dttymxc,115200
> > > earlyprintk=3Dserial,ttymxc0,115200,keep
> > > PID hash table entries: 512 (order: -1, 2048 bytes) Dentry cache
> > > hash table entries: 16384 (order: 4, 65536 bytes) Inode-cache hash
> > > table entries: 8192 (order: 3, 32768 bytes)
> > > Memory: 128MB =3D 128MB total
> > > Memory: 126744k/126744k available, 4328k reserved, 0K highmem
> > > Virtual kernel memory layout:
> > >     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> > >     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
> > >     DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
> > >     vmalloc : 0xc8800000 - 0xf4000000   ( 696 MB)
> > >     lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
> > >     modules : 0xbf000000 - 0xc0000000   (  16 MB)
> > >       .init : 0xc0008000 - 0xc001e000   (  88 kB)
> > >       .text : 0xc001e000 - 0xc02e1000   (2828 kB)
> > >       .data : 0xc02f6000 - 0xc030c6e0   (  90 kB)
> > > Hierarchical RCU implementation.
> > >         RCU-based detection of stalled CPUs is disabled.
> > >         Verbose stalled-CPUs detection is disabled.
> > > NR_IRQS:180
> > > MXC IRQ initialized
> > > MXC GPIO hardware
> > >
> > > So it seems there is nothing wrong with the "ttymxc0" port
> > > assignment ... It's just the main serial console is just not
working
>
> ..
>
> > > Cheers,
> > > B.
> > >
> > >
> > >
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > >
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev
> > > el
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > >
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev
> > > el
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> >
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




