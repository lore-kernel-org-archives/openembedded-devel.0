Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1QtQAX-0008Ec-Ja
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 22:23:25 +0200
Received: (qmail 13706 invoked by uid 501); 16 Aug 2011 13:18:45 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.2/13443. avast: v3.2.0/110815-1. sophie:
	3.06/3.22.0/4.68. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.012307 secs); 16 Aug 2011 20:18:45 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 16 Aug 2011 13:18:45 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 17 Aug 2011 08:16:17 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04C1AEDA@nzc-ap-xch-02.ap.trimblecorp.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Howto get Video Framebuufer working
Thread-Index: AcxcUVqqxHCVbTE+SDuPsrX8jJ6BvA==
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Howto get Video Framebuufer working
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
X-List-Received-Date: Tue, 16 Aug 2011 20:23:26 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Guys,

Can anyone give me a helping hand getting graphics/framebuffer working =
on a new i.mx31 platform.

I have configured everything I can think of that is required in the =
kernel (see relevent section below) and the i.mx31 viddeo driver is =
definetely getting built. (See the object files below)

However, I do not see any /dev/fb0 device .... What do I need to do to =
get one going?

Cheers,
Bernie.

------------------------------------------  video stuff built =
-----------------------------------------------
 ls drivers/video/*.o
drivers/video/built-in.o     drivers/video/fbcvt.o      =
drivers/video/fbsysfs.o
drivers/video/cfbcopyarea.o  drivers/video/fbmem.o      =
drivers/video/modedb.o
drivers/video/cfbfillrect.o  drivers/video/fbmon.o      =
drivers/video/mx3fb.o
drivers/video/cfbimgblt.o    drivers/video/fb_notify.o
drivers/video/fbcmap.o       drivers/video/fb.o


--------------------------------------- kernel config =
---------------------------------------------

#
# Graphics support
#
CONFIG_DRM=3Dm
# CONFIG_VGASTATE is not set
# CONFIG_VIDEO_OUTPUT_CONTROL is not set
CONFIG_FB=3Dy
# CONFIG_FIRMWARE_EDID is not set
# CONFIG_FB_DDC is not set
# CONFIG_FB_BOOT_VESA_SUPPORT is not set
CONFIG_FB_CFB_FILLRECT=3Dy
CONFIG_FB_CFB_COPYAREA=3Dy
CONFIG_FB_CFB_IMAGEBLIT=3Dy
# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
# CONFIG_FB_SYS_FILLRECT is not set
# CONFIG_FB_SYS_COPYAREA is not set
# CONFIG_FB_SYS_IMAGEBLIT is not set
CONFIG_FB_FOREIGN_ENDIAN=3Dy
CONFIG_FB_BOTH_ENDIAN=3Dy
# CONFIG_FB_BIG_ENDIAN is not set
# CONFIG_FB_LITTLE_ENDIAN is not set
# CONFIG_FB_SYS_FOPS is not set
# CONFIG_FB_SVGALIB is not set
# CONFIG_FB_MACMODES is not set
# CONFIG_FB_BACKLIGHT is not set
# CONFIG_FB_MODE_HELPERS is not set
# CONFIG_FB_TILEBLITTING is not set


#
# Frame buffer hardware drivers
#
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_MX3=3Dy
# CONFIG_FB_BROADSHEET is not set
CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
CONFIG_LCD_CLASS_DEVICE=3Dy
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
# CONFIG_LCD_PLATFORM is not set
# CONFIG_LCD_S6E63M0 is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
CONFIG_BACKLIGHT_GENERIC=3Dy
CONFIG_BACKLIGHT_PWM=3Dy
# CONFIG_BACKLIGHT_ADP8860 is not set

#
# Display device support
#
CONFIG_DISPLAY_SUPPORT=3Dy

#
# Display hardware drivers
#









