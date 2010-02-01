Received: from smtp7.myhsphere.biz ([204.10.105.69] helo=mail9.myhsphere.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <balakrishnan@e-consystems.com>) id 1Nbt0W-0001cK-N2
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 10:55:51 +0100
Received: (qmail 10376 invoked by uid 399); 1 Feb 2010 09:53:19 -0000
Received: from dsl-tn-dynamic-018.247.164.122.airtelbroadband.in (HELO
	?192.168.1.8?) (balakrishnan@e-consystems.com@122.164.247.18)
	by mail9.myhsphere.biz with ESMTPAM; 1 Feb 2010 09:53:19 -0000
X-Originating-IP: 122.164.247.18
X-Sender: balakrishnan@e-consystems.com
From: balakrishnan <balakrishnan@e-consystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 01 Feb 2010 15:23:22 +0530
Message-Id: <1265018002.32037.22.camel@balakrishnan-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 204.10.105.69
X-SA-Exim-Mail-From: balakrishnan@e-consystems.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Angstrom - Touchscreen enable?
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
X-List-Received-Date: Mon, 01 Feb 2010 09:55:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,
   I am building "stable/2009" angstrom-distro branch in open embedded.
What is my problem is I am not able to enable 'touch screen'. I have
added "touchscreen" value in MACHINE_FEATURES variable also.
My configuration details is

PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
XSERVER = "xserver-xorg \
           xf86-input-evdev \
           xf86-input-mouse \
           xf86-video-fbdev \
           xf86-input-keyboard"
MACHINE_FEATURES = "kernel26 usbgadget usbhost vfat alsa touchscreen"

1.How to enable touch screen in "xserver-xorg" configuration?.
2.If it enabled in "xserver-kdrive" only, then why?
3.tslib packages is not getting installed to rootfs?

With Regards
J.Balakrishnan



