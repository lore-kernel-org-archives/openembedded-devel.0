Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RWITy-0004jt-Jt
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 03:04:18 +0100
Received: by wgbds11 with SMTP id ds11so4987wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 17:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:subject:content-type:content-transfer-encoding;
	bh=9e0EeIQ+thIztlEjKJ0flQR6FRdfgvcolYA0L4mYVok=;
	b=snpS0AOzVynUbq3WxyPShPb5hT32qqDfpcAhm0rz4QCvldiaf3PWFuNdMFruuu3Wzb
	fuX5hWGEnkTDM565/AKwuOJawANemU77Jbhp9CbuXS2nVfGKFQWSVF/UmlmfS8x4eGOq
	58SYN/dJIjoBuUtLbYkAsDQ3qZNtuvUzghy6U=
Received: by 10.216.176.5 with SMTP id a5mr28500wem.4.1322791045395;
	Thu, 01 Dec 2011 17:57:25 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id es5sm7897039wbb.11.2011.12.01.17.57.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 17:57:24 -0800 (PST)
Message-ID: <4ED8307F.2060306@googlemail.com>
Date: Fri, 02 Dec 2011 01:57:19 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: fso-console-image problems
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
X-List-Received-Date: Fri, 02 Dec 2011 02:04:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am trying to build the above image for htcdream (MACHINE=htcdream, 
DISTRO=shr), but ran into two problems:

1. The bitbake almost finished when I got an error from 
fso-console-image.bb that "cannot satisfy the following dependencies for 
task-fso-compliance: connman-plugin-udhcp". OK, I edited the recipe for 
the task-fso-compliance recipe and deactivated this plugin (I don't plan 
to use any dhcp clients at all), then removed all traces of 
"task-fso-compliance" to force a complete rebuild of this and restarted 
bitbake. The build was successful this time.

2. I then proceeded to unpack the newly-created 
"fso-console-image-htcdream.tar" (the phone rootfs) into my 
newly-formatted smartcard (a single ext3 partition) and then did the 
same with "modules-2.6.32-*.tar" (the kernel modules). I then used 
fastboot and executed  "fastboot boot zImage-2.6.32-*.fastboot" to load 
the new kernel and boot the smartphone. The phone boots up, but the only 
thing I am seeing is a black-and-white stripes boot up screen (this is a 
splash image embedded into the kernel image) and then nothing happens at 
all.

I then tried passing various combinations of the kernel command line 
parameters via fastboot:

console=tty1 no_console_suspend=1 root=/dev/mmcblk0p1 rootdelay=8 
fbcon=rotate:1
console=tty0 no_console_suspend=1 root=/dev/mmcblk0p1 rootdelay=8 
fbcon=rotate:1
console=tty1 no_console_suspend=1 root=/dev/mmcblk0p1 rootdelay=8 
fbcon=rotate:1 nomodeset

etc etc etc, but to no avail - nothing apart from the damned 
black-and-white stripes screen just sitting there!

As a last resort I then did a complete rebuild (wiped out build/tmp and 
started from scratch with the modified recipe for task-fso-compliance to 
exclude the connman-plugin-udhcp plugin) and when it finished I repeated 
the same steps as above - nothing, exactly the same screen, NADA!

If I build shr-image all is well - the black-and-white-stripes bootup 
screen is soon replaced by the SHR logo and then I get the SHR Desktop 
after a while and I have a GUI. When I try to build "console-image" 
(similar in many ways to fso-console-image - simple cli interface), I am 
stuck also at the same step as above, but with a tiny difference - the 
black-and-white stripes screen is replaced after a short period of time 
with the OpenEmbedded logo with an empty progress bar and then I am 
stuck at this stage - nothing happens after that at all.

What am I doing wrong or am I missing something obvious here? Help is 
very much appreciated!


