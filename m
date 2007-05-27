Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1HsJu5-0002Um-OI
	for openembedded-devel@openembedded.org; Sun, 27 May 2007 16:39:29 +0200
Received: (qmail 23841 invoked by uid 813007); 27 May 2007 14:38:07 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 27 May 2007 14:38:07 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 May 2007 16:38:03 +0200
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200705271638.03886.openembedded@hrw.one.pl>
Subject: RFC: MACHINE_ namespace
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
X-List-Received-Date: Sun, 27 May 2007 14:39:30 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


During usage of progear device (now packed due to lack of space) I found 
a problems related to how we use machine configs and X11.

1. We have "alsa" as one of machine features but no way to control kernel 
modules for it - all are added into machine config as 
MACHINE_EXTRA_RRECOMMENDS. Same goes to other features.

2. Progear device use X.org instead of KDrive so I had to create own 
images for it because by default we do not have a way to tell which X 
drivers need to be present in images.


Proposed solution is adding MACHINE_ namespaces:

MACHINE_KERNEL_ALSA   = "kernel-module-snd-ali5451"
MACHINE_KERNEL_PCMCIA = "kernel-module-yenta-socket"

And other MACHINE_KERNEL_feature to control stuff used in task-base.

MACHINE_X11_SERVER  = "xserver-xorg"
MACHINE_X11_DRIVERS = "xf86-video-siliconmotion xf86-input-mutouch"

MACHINE_X11_SERVER will replace XSERVER used now, MACHINE_X11_DRIVERS will 
allow to add needed drivers to X11 images for device without creating 
custom ones.

What do you think about this proposal?

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                 You can logoff, but you can never leave.
                 		-- Nina Liedtke, "CyberJoly Drim"




