Received: from smtp-out116.alice.it ([85.37.17.116])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OCc5x-0006gy-DU
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 19:21:56 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out116.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 13 May 2010 19:17:16 +0200
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 13 May 2010 19:17:16 +0200
Received: from [192.168.1.116] ([79.21.48.109]) by FBCMCL01B09.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 13 May 2010 19:17:15 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 May 2010 19:17:07 +0200
Message-ID: <1273771027.8785.26.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 13 May 2010 17:17:15.0738 (UTC)
	FILETIME=[2258FBA0:01CAF2C0]
X-SA-Exim-Connect-IP: 85.37.17.116
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Handling different touchscreen calibration systems
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
X-List-Received-Date: Thu, 13 May 2010 17:22:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

hi,
There are several way to calibrate a touchscreen:
*ts_calibrate : it uses the framebuffer and so it must be started before
xorg(an init script can do that). works only for tslib.
*xtscal : works only for kdrive and tslib(if I understood well)
*xinput-calibrator: works with xorg and can calibrate many things,but I
had huge issues with it with tslib,with /etc/pointercal from
ts_calibrate it works fine but without it can't calibrate...
Note that it also supports other protocols like evdev,evtouch etc...
*other specific uttilities for evtouch etc...

How should someone handle this.
*in machine config?
*in the distro?
*in the image?

Also to add the complexity:
*ts_calibrate should be an init script
*xinput-calibrator and xtscal are Xsession.d scripts

Moreover theses scripts could be machine specific:

*For instance I've 2 touch screens on the bug device,and so I need a
specific init script for calibrating:
#!/bin/sh
if [ ! -e /etc/pointercal ]
then
	TSLIB_CONSOLEDEVICE=none TSLIB_FBDEVICE=/dev/fb1
TSLIB_TSDEVICE=/dev/input/bmi_lcd_ts4 ts_calibrate & 
	TSLIB_CONSOLEDEVICE=none TSLIB_FBDEVICE=/dev/fb2
TSLIB_TSDEVICE=/dev/input/bmi_lcd_ts5 ts_calibrate &
	until [ -f /etc/pointercal ]
		do
			sleep 1
		done
	killall ts_calibrate
fi

That script is shipped with a recipe named tslib-init,which I didn't
commit yet because of this mail.

*htcdream has the same issue with xinput-calibrator (require having a
calibrated /etc/pointercal so it makes it useless )

*bug 2.x seem to need ts_calibrate too but only for one screen

*om-gta02 has an evdev driver which requires to feed /sys nodes with
some calibration data,the script used is an Xsession.d script that uses
xinput-calibrator



I had the idea of making recipes for handling int scripts or Xsession.d
scripts,and including them in XSERVER in the machine configuration but
I'm not shure it's a good idea.

Denis.



