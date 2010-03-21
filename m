Received: from server3.tinynetworks.co.uk ([89.16.176.161]
	helo=mx.tinynetworks.co.uk) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn@welchs.me.uk>) id 1NtOK4-0000fO-9A
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 17:48:24 +0100
Received: from mx.tinynetworks.co.uk (localhost.localdomain [127.0.0.1])
	by mx.tinynetworks.co.uk (Postfix) with ESMTP id E2D8B636105
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Mar 2010 16:45:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=tinynetworks.co.uk; h=
	message-id:date:from:mime-version:to:subject:content-type
	:content-transfer-encoding; s=postfix; bh=nQq979msUpz8D57p86p9Ej
	wKoqI=; b=gE+MLTcsyJ5esNOaM9mEsZYnzrfLz+JW717xFwSb4xpO+ab8rWGDc2
	b8NaHU/0ad/zm1MFLoZRyOg2wRS93i2r8iSZND3/1tez+thkvhNbuXEzSwlASDig
	h2XNxGdRNjx1FNluZX5iUX4244H41faHCXXPUsrkDnCy0Rz0of2cA=
Received: from [192.168.0.118] (unknown [82.152.154.75])
	by mx.tinynetworks.co.uk (Postfix) with ESMTPSA id A91AC636056
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Mar 2010 16:45:14 +0000 (GMT)
Message-ID: <4BA64D16.3070901@welchs.me.uk>
Date: Sun, 21 Mar 2010 16:45:10 +0000
From: Martyn Welch <martyn@welchs.me.uk>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 89.16.176.161
X-SA-Exim-Mail-From: martyn@welchs.me.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Booting image on iPAQ h5550
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
X-List-Received-Date: Sun, 21 Mar 2010 16:48:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I've had a fair amount of success booting pre-built GPE images on an 
iPAQ h5550 I've got lying around in the past, so I thought I'd have a go 
at building an image for it myself and see what the latest stuff looks like.

I've succeeded in building the bootstrap, x11 and x11-gpe images 
(distro: angstrom, machine: h5000) and flashing them onto the iPAQ, but 
none are getting to a serial or GUI login.

The kernel boots and I see the kernel messages on the iPAQ screen and 
the serial console, with the bootstrap image I see user space running, 
on the x11 builds I see the Angstrom splash screen running on the iPAQ 
screen, but they don't show up on the serial console. After a while, on 
the x11 builds, the splash screen disappears and I can see the end of 
the user space boot messages.

If I plug in the USB cable from the dock, I see some ethernet gadget 
messages on both the serial console and screen, so the kernel at least 
still seems to be alive and it shows that the serial is at least working:

[  494.060000] usb0: full speed config #1: 100 mA, Ethernet Gadget, 
using CDC Ethernet Subset
[  494.150000] usb0: full speed config #1: 100 mA, Ethernet Gadget, 
using CDC Ethernet Subset

Also, if I leave the iPAQ a few minutes, the screen darkens, the screen 
light can be brought back by pressing one of the keys, so it seems that 
at least on daemon is alive. But I don't have any method to interact 
with the device beyond that.

The settings for the serial port seem good in the inittab (I double 
checked in a tar.gz image I built) and the links to the getty seem good 
(tinylogin).

The only thing I can think of is that udev is destroying the static dev 
nodes and not replacing them. I can to this conclusion because I see 
"Starting udev" in the user space boot messages on the screen, shortly 
followed by "Caching udev dev nodes", "Populating dev cache" then "root: 
mount: special device /dev/mtdblock2 does not exist". This node 
definitely exists in /dev in the tar.

I'm a little lost as to where to go from here, any suggestions?

Martyn


