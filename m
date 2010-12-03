Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1POUzf-0007OI-B8
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 13:44:07 +0100
Received: from [192.168.0.20] (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id EB90A1B40D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Dec 2010 13:44:05 +0100 (CET)
Message-ID: <4CF8E5C5.9000703@sensortherm.de>
Date: Fri, 03 Dec 2010 13:42:45 +0100
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Can not boot console-image (dm355-leopard)
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
X-List-Received-Date: Fri, 03 Dec 2010 12:44:07 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

i make a console-image and this does not boot. The kernel hangs after 
"done, booting the kernel.". Then i enabled CONFIG_DEBUG_LL and see, 
that the machine ID does not match:


Automatic boot of image at addr 0x87000000 ...
## Booting kernel from Legacy Image at 87000000 ...
    Image Name:   Angstrom/2.6.31+2.6.32-rc2-r49+g
    Created:      2010-12-03  11:43:29 UTC
    Image Type:   ARM Linux Kernel Image (uncompressed)
    Data Size:    2004176 Bytes =  1.9 MB
    Load Address: 80008000
    Entry Point:  80008000
    Verifying Checksum ... OK
    Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing 
Linux..................................................................................................................................... 
done, booting the kernel.

Error: unrecognized/unsupported machine ID (r1 = 0x0000085a).

Available machine support:

ID (hex)	NAME
e2855034	

Please check your kernel config and/or bootloader.



MACH_DM355_LEOPARD, and ARCH_DAVINCI and ARCH_DAVINCI_DM355 are set to yes.

What can i do?

Thanks,

Klaus



