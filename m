Received: from qmta12.westchester.pa.mail.comcast.net ([76.96.59.227])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enelson1000@comcast.net>) id 1RZS5Z-0006Lq-2q
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Dec 2011 19:56:01 +0100
Received: from omta18.westchester.pa.mail.comcast.net ([76.96.62.90])
	by qmta12.westchester.pa.mail.comcast.net with comcast
	id 7WXT1i0041wpRvQ5CWo7E5; Sat, 10 Dec 2011 18:48:07 +0000
Received: from [192.168.0.101] ([67.180.186.245])
	by omta18.westchester.pa.mail.comcast.net with comcast
	id 7Wo61i00g5J6Mc33eWo6pk; Sat, 10 Dec 2011 18:48:07 +0000
Message-ID: <4EE3A963.8070504@comcast.net>
Date: Sat, 10 Dec 2011 10:48:03 -0800
From: Ed Nelson <enelson1000@comcast.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [2011,03 maint] Confused about xserver-xorg + touchscreen
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
X-List-Received-Date: Sat, 10 Dec 2011 18:56:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am trying to build a modified minimal-gpe-image to use xserver-xorg 
and use xinput-calibrator but for some reason it keeps building tslib.  
Consequently I have to modify xorg.conf so the touchscreen driver uses 
tslib and not evdev for the touchsceen to work.  This is OK but I 
thought that the new way to do the touchscreen was to use xinput and to 
calibrate the touchscreen was to use xinput-calibrator.  I tried to find 
a image recipe that used xinput-calbrator but didn't find one.

Is it better to use xserver-xorg + xinput-calibrator  or use 
xserver-xorg + tslib + modify xorg.conf?
Am I missing something in the minimal-gpe-image recipe?
Shouldn't I see something for xinput-calibrator inside Xsessions?


Below is my minimal-gpe-image recipe
==================================
#Angstrom minimal gpe image
# This image provides a barebone dm and 'desktop'
# Very angstrom and opkg centric

ANGSTROM_EXTRA_INSTALL += " \
                           "

XSERVER = "xserver-xorg \
            xf86-input-evdev \
            xf86-input-mouse \
            xf86-video-fbdev \
            xf86-input-keyboard"

SPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", 
"psplash-angstrom", "",d)}'

export IMAGE_BASENAME = "minimal-gpe-image"

PR = "r2"

DEPENDS = "task-boot"

IMAGE_INSTALL = "\
     ${XSERVER} \
     task-boot \
     gpe-dm gpe-session-scripts gpe-login \
     matchbox-wm \
     gpe-terminal \
     angstrom-feed-configs \
     xinput-calibrator \
     nano \
     python \
     ${SPLASH} \
     ${ANGSTROM_EXTRA_INSTALL} \
     "

#zap root password for release images
ROOTFS_POSTPROCESS_COMMAND += '${@base_conditional("DISTRO_TYPE", 
"release", "zap_root_password; ", "",d)}'

inherit image

=========================================
This is my Xinit.d

root@sbc9261:~# ls /etc/X11/Xinit.d/
01xrandr         40xmodmap        60xXDefaults     99gpe-login
11zaurus         50setdpi         89xTs_Calibrate
12keymap         55xScreenSaver   98keymap-fixup

================================================
This is my Xsessions.d

root@sbc9261:~# ls /etc/X11/Xsession.d/
50autolock        69ipaq-sleep      98standard-apps
60xXDefaults      89xdgautostart    99xWindowManager
root@sbc9261:~#

Thanks
Ed







