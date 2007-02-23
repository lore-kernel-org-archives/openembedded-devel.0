Received: from [192.132.34.13] (helo=amail.unina.it)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <ranaldo@unina.it>) id 1HKZXk-0004UK-66
	for openembedded-devel@openembedded.org; Fri, 23 Feb 2007 13:28:56 +0100
Received: from blaster.unina.it ([192.132.34.15]) (authenticated bits=0)
	by amail.unina.it (8.13.4/8.13.4) with ESMTP id l1NCStiu029430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 23 Feb 2007 13:28:55 +0100
From: Nicola Ranaldo <ranaldo@unina.it>
To: openembedded-devel@openembedded.org
Date: Fri, 23 Feb 2007 13:26:36 +0100
User-Agent: KMail/1.9.6
MIME-Version: 1.0
Message-Id: <200702231326.37015.ranaldo@unina.it>
Subject: Angstrom and h2200
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
X-List-Received-Date: Fri, 23 Feb 2007 12:28:58 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

New test images boots over my ipaq h2200, and bug #1677 is now closed, howewer 
i had to disable the S10checkroot.sh startup as it wanted to run fsck over a 
readwrite mounted filesystem, claiming it's very dangerous and asking the 
user for a confirmation. This should be patched in some manner. I tried to 
change the fs to reiserfs, rebuilding the kernel, but i was not lucky. To 
disable the bootsplash i readed the S00psplash script and patched startup.txt 
of haret, but to have a console over the frame buffer i ran make menuconfig 
on the kernel dir, changed the config and after that removed the kernel 
compile stamp, and runned again bitbake amstrong-gpe-image again.
Wath's the official/legacy method to give a different configuration to the 
kernel?
And now some other issues about gpe-image:
* the usb0-eth device is not present, is it normal?
* keyboard, fonts are bigger then rects and sometimes i have to hold down the 
pen to use it, if not the keyboard acts as i pressed the key and a backspace
* i was not able to compile a custom gpe-image (i used the prereleased for 
tests), the build failed on package freetype with:
./configure: line 2943: i686-pc-linux-gnu: command not found
configure: error: native C compiler is not working
* the last, may i use some kind of emulator before deploying the fs image to 
the ipaq?

Hoping i'm not boring you
Best Regards

	Nicola Ranaldo


