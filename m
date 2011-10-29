Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RKHcA-00022G-ML
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 00:42:58 +0200
Received: from iph2.telenor.se (iph2.telenor.se [195.54.127.133])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id AAF66C46A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Oct 2011 00:36:55 +0200 (CEST)
X-SENDER-IP: [83.227.59.253]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AjIrANl+rE5T4zv9PGdsb2JhbAAMN4k+kRuPKQEBAQE3gmNAPQ0BCBgDAgECATEnCAEBulaDQYItAYMTBJQOkWE
X-IronPort-AV: E=Sophos;i="4.69,425,1315173600"; d="scan'208";a="504023182"
Received: from c-fd3be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.59.253])
	by iph2.telenor.se with ESMTP; 30 Oct 2011 00:36:55 +0200
Message-ID: <4EAC8007.4080006@telia.com>
Date: Sun, 30 Oct 2011 00:36:55 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: console-image: No login prompt
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
X-List-Received-Date: Sat, 29 Oct 2011 22:42:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Have build console-image and I am running it on an AT91SAM9G20EK.
The boot process freezes, and I have managed to verify that this
happens after the init process has executed "finished.sh".
(Put some print statements in this, and I see them)

Then nothing...
Normally I would get a login prompt

Have been searching for people with similar problems,
and I found one that claimed that /etc/rcS.d/S03udev
needs to run after /etc/rcS.d/S10checkout.

I tried this but this does not make any difference.
Is there some configuration item that enables/disables the console
after init.

finish.sh is linked from rcS.d/S99/finish.sh

Is the problem, that the kernel stays in level 1 for some reason?
Default run level is 5 (id:5:initdefault:) which I assume

Does that make sense for a console-image?

Should not level 3 be more appropriate if
you do not have any graphics?

Any reason why console I/O is redirected?

------------------------------------------------------------------------------------
# /etc/inittab: init(8) configuration.
# $Id: inittab,v 1.91 2002/01/25 13:35:21 miquels Exp $

# The default runlevel.
id:5:initdefault:

# Boot-time system configuration/initialization script.
# This is run first except when booting in emergency (-b) mode.
si::sysinit:/etc/init.d/rcS

# What to do in single-user mode.
~~:S:wait:/sbin/sulogin

# /etc/init.d executes the S and K scripts upon change
# of runlevel.
#
# Runlevel 0 is halt.
# Runlevel 1 is single-user.
# Runlevels 2-5 are multi-user.
# Runlevel 6 is reboot.

l0:0:wait:/etc/init.d/rc 0
l1:1:wait:/etc/init.d/rc 1
l2:2:wait:/etc/init.d/rc 2
l3:3:wait:/etc/init.d/rc 3
l4:4:wait:/etc/init.d/rc 4
l5:5:wait:/etc/init.d/rc 5
l6:6:wait:/etc/init.d/rc 6
# Normally not reached, but fallthrough in case of emergency.
z6:6:respawn:/sbin/sulogin
S:2345:respawn:/sbin/getty 115200 ttyS0





-- 
Best Regards
Ulf Samuelsson



