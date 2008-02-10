Received: from [81.169.146.189] (helo=mo-p07-ob.rzone.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <hns@computer.org>) id 1JOFdX-0002iQ-4o
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Feb 2008 18:06:39 +0100
X-RZG-CLASS-ID: mo07
X-RZG-AUTH: iojXUX2iu8lIbkehSGf3jGQYOvXUDskiVntSGy8EdRNO67K0
Received: from [192.168.2.175] (p57AE3C28.dip.t-dialin.net [87.174.60.40])
	by post.webmailer.de (klopstock mo51) (RZmta 16.5)
	with ESMTP id a0338bk1AFW3q8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Feb 2008 18:06:53 +0100 (MET)
	(envelope-from: <hns@computer.org>)
Mime-Version: 1.0 (Apple Message framework v753)
Message-Id: <75A74BC0-4CCC-44E8-BABE-A41508970838@computer.org>
To: openembedded-devel@lists.openembedded.org
From: "Dr. H. Nikolaus Schaller" <hns@computer.org>
Date: Sun, 10 Feb 2008 18:06:52 +0100
X-Mailer: Apple Mail (2.753)
Subject: Some questions on configuring OE
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
X-List-Received-Date: Sun, 10 Feb 2008 17:06:39 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed

I am trying to use OE and the MokoMakefile to build an OABI OpenMoko  
version for the Neo GTA01 - and for the Acer n30 PDA.

So far I succeeded in building everything without errors on a Debian  
Etch machine but it does not run.
The Neo does not complete booting to X11 and the last message  on the  
boot screen is

mcblk0: mmc0:e624 SU512 495488KiB
  mmcblk0: p1

Pressing the power key produces messages like:
pcf50606_irq:entering(irq=53, pcf=c0555800): scheduling work
pcf50606_work: INT=0x42 INT2=0x00 INT3=0x00:ONKEYF SECOND
pcf50606_irq:entering(irq=53, pcf=c0555800): scheduling work
pcf50606_work: INT=0x01 INT2=0x00 INT3=0x00:ONKEYR

but nothing else... The AUX button produces a ^@ on the console.

Before that there are some messages about initializing Bluetooth, CDC  
Ethernet, mouting the .jffs2 as root but no error messages.

The Acer n30 hangs in the X11 touchscreen calibration because the  
touch does not work. And the power management is worse than the one  
in the old Letux kernel. So I suspect that not all patches are  
applied when using the default machine/acern30.conf of OE.

What I need is some help how to configure the build system properly  
(unfortunately, chapters 7&8 of  http://www.uv-ac.de/openembedded/ 
openembedded-7.html are not completed).

Questions:
1. I could not find out if and which of the Letux n30 patches have  
been included to the MACHINE = "acern30" so far
2. if not, I have some patch files from the Letux project - but how  
and where should I configure those?
3. What do I need to change to compile OpenMoko for OABI so that it  
really boots?

Many thanks for any hints how to proceed,
Nikolaus


