Received: from [209.85.146.178] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <cliff.brake@gmail.com>) id 1JGJaT-0007pf-DQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jan 2008 20:42:42 +0100
Received: by wa-out-1112.google.com with SMTP id l24so2722630waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2008 11:42:41 -0800 (PST)
Received: by 10.114.58.1 with SMTP id g1mr3267044waa.91.1200771758739;
	Sat, 19 Jan 2008 11:42:38 -0800 (PST)
Received: by 10.114.157.2 with HTTP; Sat, 19 Jan 2008 11:42:38 -0800 (PST)
Message-ID: <f96d234e0801191142r7860278ei534592e039162838@mail.gmail.com>
Date: Sat, 19 Jan 2008 14:42:38 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: state of PXA270 xscale support in HEAD
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Jan 2008 19:42:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I used openocd successfully in the past with SVN r180 talking to PXA270 cpus.

With the current tip, this is what I get when I run "flash probe 0":

 grumpy ~ # openocd
Info:    openocd.c:93 main(): Open On-Chip Debugger 1.0
(2008-01-19-11:05) svn:259
Info:    openocd.c:94 main(): $URL:
svn://svn.berlios.de/openocd/trunk/src/openocd.c $
Info:    jtag.c:1289 jtag_examine_chain(): JTAG device found:
0x49265013 (Manufacturer: 0x009, Part: 0x9265, Version: 0x4)
Warning: xscale.c:1195 xscale_halt(): target was already halted
Info:    server.c:67 add_connection(): accepted 'telnet' connection from 0
Warning: jtag.c:1117 jtag_check_value(): value captured during scan
didn't pass the requested check: captured: 0x00 check_value: 0x04
check_mask: 0x07
Warning: jtag.c:1062 jtag_read_buffer(): in_handler reported a failed check
Error:   xscale.c:567 xscale_write_rx(): JTAG error while writing RX

I did try r180 again just to make sure and it runs "flash probe 0" just fine.

Thanks,
Cliff

Config file:
# config for Intel PXA270
# not, as of 2007-06-22, openocd only works with the
# libftd2xx library from ftdi.  libftdi does not work.

telnet_port     3333
gdb_port        4444

interface ft2232
ft2232_layout olimex-jtag
ft2232_vid_pid 0x15BA 0x0003
ft2232_device_desc "Olimex OpenOCD JTAG"
jtag_speed 0
# set jtag_nsrst_delay to the delay introduced by your reset circuit
# the rest of the needed delays are built into the openocd program
jtag_nsrst_delay 300
# set the jtag_ntrst_delay to the delay introduced by a reset circuit
# the rest of the needed delays are built into the openocd program
jtag_ntrst_delay 0

#use combined on interfaces or targets that can't set TRST/SRST separately
reset_config trst_and_srst separate

#jtag scan chain
#format L IRC IRCM IDCODE (Length, IR Capture, IR Capture Mask, IDCODE)
jtag_device 7 0x1 0x7f 0x7e

#target configuration
daemon_startup reset

target xscale little reset_halt 0 pxa27x

# maps to PXA internal RAM.  If you are using a PXA255
# you must initialize SDRAM or leave this option off
working_area 0 0x5c000000 0x10000 nobackup

run_and_halt_time 0 30

#flash bank <driver> <base> <size> <chip_width> <bus_width>
# works for P30 flash
flash bank cfi 0x00000000 0x1000000 2 4 0



-- 
=======================
Cliff Brake
http://bec-systems.com


