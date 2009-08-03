Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MXxa4-0003Rx-Iz
	for openembedded-devel@openembedded.org; Mon, 03 Aug 2009 15:28:00 +0200
Received: (qmail 11634 invoked by uid 813007); 3 Aug 2009 13:12:34 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 3 Aug 2009 13:12:34 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 3 Aug 2009 15:13:04 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4-00009-g83a3792-dirty; KDE/4.2.96;
	x86_64; ; )
MIME-Version: 1.0
Message-Id: <200908031513.05326.marcin@juszkiewicz.com.pl>
Subject: [RFC] Xserver-common 1.30
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
X-List-Received-Date: Mon, 03 Aug 2009 13:28:00 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi

We have two packages which do similar things: 

- xserver-common from GPE
- xserver-kdrive-common from Poky

Basically they do the same -- select proper XServer, arguments to pass 
for it and have session scripts. Kdrive version uses 'xinit' to 
initialize X11 session as root user, GPE version is expected to be used 
with gpe-dm/gpe-login combo which handles user login.

This gave us few mistakes in past - some developers patched one of them 
for their device but the other one was used in image etc.

Some time ago I looked at xserver-common 1.25 and created over 20 
patches for it:

- moved xmodmap files to xmodmap/ dir
- use machine_id from init.d/functions
- xserver: at91 boards have RGB screen with recent kernels
- xserver: atmel boards do not need setup - defaults are fine
- xserver: set DPI in variable
- xserver: merge nokia n800 and n810
- xserver: use /etc/default/xserver if present and fallback to old way 
           if not
- xserver: added example /etc/default/xserver file (for poodle)
- xserver: added some devices from xserver-kdrive-common
- xserver: added Ronetix PM9261/3 boards
- xserver: no need to set "-mouse tslib" as this is set for all devices
           with touchscreen
- xserver: if we have unknown device then give it's screen parameters
           for x11 (from fbset output)
- xserver: introduced MOUSE variable for "-mouse" argument (KDrive only)

Most of patches were used to create 1.30 version which is available as 
tarball from GPE project. But due to my fault this version is broken...

Today I pushed 1.30 into OE metadata with few other patches which are 
expected to fix errors left in 1.30 release. It was not too much tested 
on devices so beware if your target do not works properly with it.

In short my patching ideas were:

- set DPI in separate variable instead of being part of ARGS
  + some devices needs only DPI setting
  + default ARGS are usually fine for devices

- use /etc/default/xserver for setting ARGS/DPI for new devices
  + no need to patch Xserver anymore
  + easy to tweak on device itself

- xmodmap stuff should be machine dependent so only one xmodmap is
  present on device
  (this part was not done yet)

- zaurusd, devmand should provide session scripts instead of being
  called from Ts_calibrate script
  (this part was not done yet)

I would like other developers to use it and test does it work on their 
devices.

In future I would like to add support for using "xinit" in 
/etc/X11/Xserver so 'xserver-common' package could be used for rootmode 
X11 systems (which would eliminate 'xserver-kdrive-common' package).

What do you think about it?

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




