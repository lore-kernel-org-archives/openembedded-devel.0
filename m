Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RWshO-0000EQ-CO
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 17:44:26 +0100
Received: by wgbdt12 with SMTP id dt12so3573728wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Dec 2011 08:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Anp/rgLAO7SINIUR280sYbO4eDS8W3jKWuEkAqix7TU=;
	b=knxz/kpA6jenavrP3OieLT+jbHaJM0/WzZ3/C9mGhJ09+ynLXUV/uzBHnXC3dPdRUH
	yyvSX25Iz7flyunBJ7A9mN9l91gRMG0VG7Rv/vhpXC9F9M/grxo2rvkyOGcvbICQrmi3
	MLlJeVqr/H9/kEkqK4EFVxGpaDwbQLi+VgtkQ=
Received: by 10.180.4.67 with SMTP id i3mr4364733wii.1.1322930262475;
	Sat, 03 Dec 2011 08:37:42 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id fk3sm16977272wbb.10.2011.12.03.08.37.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Dec 2011 08:37:41 -0800 (PST)
Message-ID: <4EDA504E.7070304@googlemail.com>
Date: Sat, 03 Dec 2011 16:37:34 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
References: <4ED8307F.2060306@googlemail.com> <4ED960AB.5040502@googlemail.com>
	<4ED96455.8060008@googlemail.com>
	<201112031046.44018.GNUtoo@no-log.org>
In-Reply-To: <201112031046.44018.GNUtoo@no-log.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: fso-console-image problems
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
X-List-Received-Date: Sat, 03 Dec 2011 16:44:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> Instead of trying to edit the file manually, try "make xconfig" in the 
> directory where the kernel is extracted(something like work/htcdream*/linux-
> leviathan*/git/ ) and do it manually trough the GUI, then save back the 
> resulting defconfig, increase PR in the recipe and rebuild your console-image.
>   
That as a very good advice, thank you! The versioning "magic" is 
something I didn't know about (I always used to delete all related files 
in the tmp/stamp directory in the futile hope that the process/steps 
will be repeated at the next run).

OK, since I use rm_work, the git directory is no longer there, but I've 
had the git tar archive, so unpacked it, copied defconfig, renamed it to 
.config and ran "make ARCH=arm menuconfig" (I prefer ncurses myself), 
then switched the appropriate option on and saved the new file. I wasn't 
sure whether I should also switch the FRAMEBUFFER_CONSOLE_DETECT_PRIMARY 
option as I was not sure of its meaning and whether I actually need 
this, so left it as the default (empty/No). When I ran diff to see what 
has been changed the following has been altered:

--- defconfig    2011-11-19 16:35:46.000000000 +0000
+++ .config    2011-12-03 15:42:13.123656047 +0000
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.32.9
-# Fri Aug 27 19:32:05 2010
+# Sat Dec  3 15:42:13 2011
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -1199,7 +1199,12 @@
 #
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_DUMMY_CONSOLE=y
-# CONFIG_FRAMEBUFFER_CONSOLE is not set
+CONFIG_FRAMEBUFFER_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+# CONFIG_FONTS is not set
+CONFIG_FONT_8x8=y
+CONFIG_FONT_8x16=y
 # CONFIG_LOGO is not set
 CONFIG_SOUND=y
 CONFIG_SOUND_OSS_CORE=y
@@ -1233,11 +1238,9 @@
 CONFIG_SND_SOC=y
 
 #
-# MSM SoC Audio support
+# SoC Audio support Qualcomm
 #
 CONFIG_SND_MSM_SOC=y
-CONFIG_SND_MSM_DAI_SOC=y
-CONFIG_SND_MSM_SOC_MSM7K=y
 CONFIG_SND_SOC_I2C_AND_SPI=y
 # CONFIG_SND_SOC_ALL_CODECS is not set
 # CONFIG_SOUND_PRIME is not set


Interesting! In addition to a few extra options, the two SND_MSM_* 
options shown above are now gone - don't know why.

Anyway, I copied this back to the appropriate directory and bumped the 
version number, then ran bitbake again. No problems and I've had my new 
image, kernel modules (recompiled) and a few other things. Installed it 
and fastbooted my phone. The screen appeared this time - rotated as well 
- and I've had my login prompt. Brilliant!

Duly logged in, but there were a few further problems:

1. The keyboard I now have is completely unusable as the "alt" register 
(the blue row of keys) is completely unusable/inaccessible with the 
exception of the top row (where the numbers are). That means I cannot 
type/use vital keys like the pipe symbol ('|'), dash ('-') etc. There is 
also no "repeat" - i.e. when I press a key and keep pressing it, it 
doesn't continue typing the same key. is there any way I could fix this?

2. My ssh login is also problematic - when I try to log in from the PC 
host (via usb) this time I get the following error on that (PC) end: 
"PTY allocation request failed on channel 0". Don't know why that is, 
any ideas?

I cannot properly scroll/see what is happening on the phone system and 
neither can I see any of the log files as the keyboard is all screwed 
up, so I can't post any of these file in order to further help resolve 
the above issues.



