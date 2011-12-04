Received: from mail.hopgarden.net ([91.84.199.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <row@hopgarden.net>) id 1RXHgV-0000QD-Ed
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Dec 2011 20:25:11 +0100
Received: from localhost (mail.hopgarden.net [127.0.0.1])
	by mail.hopgarden.net (Postfix) with ESMTP id 2104E13B0063
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Dec 2011 19:18:28 +0000 (GMT)
Received: from mail.hopgarden.net ([127.0.0.1])
	by localhost (hazel.hopgarden.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id r6SEPaKuN7zd
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Dec 2011 19:18:15 +0000 (GMT)
Received: from [127.0.0.1] (dynamic-109 [192.168.1.109])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.hopgarden.net (Postfix) with ESMTP id 62DC713B0052
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Dec 2011 19:18:15 +0000 (GMT)
Message-ID: <4EDBC776.8050408@hopgarden.net>
Date: Sun, 04 Dec 2011 19:18:14 +0000
From: Reuben Wells <row@hopgarden.net>
User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Problems with OE / Angstrom
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
X-List-Received-Date: Sun, 04 Dec 2011 19:25:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi thank you Stefan for your help with my prior question, which turned 
out to be a problem in the repository.

A couple of additional questions:

1) If I use a console image from Narcissus, then I get console messages 
sent to the serial port. Building my own image, I don't see any console 
messages after the "Uncompressing Linux" prior to to a login prompt showing.

Dmesg output on my own image shows:
[    0.000000] Console: colour dummy device 80x30
..
[    2.375427] Console: switching to colour frame buffer device 160x45

Where as an image from Narcissus shows:
[    0.000000] console [tty0] enabled
.
[   10.382202] console [ttyS2] enabled

My "uEnv.txt" file is the same in both cases. How do I force images I 
build to send the console to serial port rather than the DVI display? (I 
don't have a monitor attached to the Beagleboard).

2) Using the online package browser 
(http://www.angstrom-distribution.org/repo/) it lists "postfix", but 
trying to build this via 'bitbake postfix' doesn't find the package.

3) Is there a way to build a set of Perl modules via bitbake e.g. 
Encode::Detect, Net::DNS?

I'm currently trying to build these via CPAN inside OE/Angstrom 
(BeagleBoard XE) and I'm hitting various compilation issues and missing 
dependencies. Ultimately I'm trying to install amavisd-new, but this has 
a long list of Perl dependencies and those that are pure Perl install 
fine, but those that have compiled c modules fail. I have different 
problems using the console image I have built versus an image created 
via Narcissus, but neither work. Using my image, I get this error 
message building a number of packages:

/usr/lib/gcc/arm-angstrom-linux-gnueabi/4.5.4/../../../../arm-angstrom-linux-gnueabi/bin/ld: 
this linker was not configured to use sysroots
collect2: ld returned 1 exit status


4) ps and top show the message: "Unknown Hz value assume 100". What is 
the cause (and fix) of this?


Reuben



