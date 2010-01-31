Received: from mail-pz0-f191.google.com ([209.85.222.191])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbQOj-0002wN-LH
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 04:22:56 +0100
Received: by pzk29 with SMTP id 29so3161079pzk.17
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 19:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:cc:mime-version:content-transfer-encoding:from:organization
	:message-id:user-agent;
	bh=LrgIOyylYY8zALDRBgmi1js/0CBrIex9mfvIr0/ue18=;
	b=F/sCditz+OMNNGMT/TAr15Upe3kPyjzfC0iShzmUPI1EgRl+UIOOJ9SxxQbVmNon34
	s35yoNg5ysF7ZIu0RxGpM7BmF3y5Nr0f8/OporvHK5JXFrA3eTHXFgHgPHHGpt+pOhcw
	n7GnmCBRNq7294RZ+kEixAlrmQCsf0PuX/6tY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:cc:mime-version
	:content-transfer-encoding:from:organization:message-id:user-agent;
	b=MxbzZSdobF32a5kCwUqhNmPAexmlYtEni3BVRvYmWQ363mmtvRgoq19oPG0gQ2CIDF
	JeXvUiPjZCqNR/l5Ch1IT4vhDy2mQWPlK0sDx31w+W8l2A1YkCJidHUh5I5v+ZPTRseu
	P8iBdykauSZZtxzQtkBeFLiP/JICOp4Ing7uk=
Received: by 10.114.30.1 with SMTP id d1mr1917467wad.75.1264908028079;
	Sat, 30 Jan 2010 19:20:28 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 23sm3140411pzk.12.2010.01.30.19.20.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 19:20:27 -0800 (PST)
Date: Sun, 31 Jan 2010 11:20:18 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7dnj4v0mn1qzu@camelguo>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.191
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: slapin@ossfans.org
Subject: building u-boot - git failed
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
X-List-Received-Date: Sun, 31 Jan 2010 03:22:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I tried to building openembedded with the following configuration:
MACHINE=afeb9260 DISTRO=micro LIBC=glibc
MACHINE=dm355-evm DISTRO=micro LIBC=glibc
MACHINE=dm365-evm DISTRO=micro LIBC=glibc
MACHINE=dm6446-evm DISTRO=micro LIBC=glibc
MACHINE=dm6467-evm DISTRO=micro LIBC=glibc

And it failed with the following information:

rm-oe-linux-gnueabi-gcc -g  -Os   -fno-strict-aliasing  -fno-common  
-ffixed-r8 -msoft-float  -D__KERNEL__ -DTEXT_BASE=0x21f00000  
-I/media/work-disk/workdir/arm-926ejs-test/work/afeb9260-oe-linux-gnueabi/u-boot-git-r37/git/include  
-fno-builtin -ffreestanding -nostdinc -isystem  
/media/work-disk/workdir/arm-926ejs-test/cross/armv5te/lib/gcc/arm-oe-linux-gnueabi/4.4.2/include  
-pipe  -DCONFIG_ARM -D__ARM__ -march=armv5te -mabi=apcs-gnu  
-mno-thumb-interwork  -Wall -Wstrict-prototypes -fno-stack-protector -c -o  
board.o board.c
board.c:126: error: inline function 'coloured_LED_init' cannot be declared  
weak
board.c:128: error: inline function 'red_LED_on' cannot be declared weak
board.c:130: error: inline function 'red_LED_off' cannot be declared weak
board.c:132: error: inline function 'green_LED_on' cannot be declared weak
board.c:134: error: inline function 'green_LED_off' cannot be declared weak
board.c:136: error: inline function 'yellow_LED_on' cannot be declared weak
board.c:138: error: inline function 'yellow_LED_off' cannot be declared  
weak

for more detailed information, please see the following urls:
http://tinderbox.openembedded.net/packages/451342/
http://tinderbox.openembedded.net/packages/451366/
http://tinderbox.openembedded.net/packages/451383/
http://tinderbox.openembedded.net/packages/451406/
http://tinderbox.openembedded.net/packages/451420/

anyone can give me some hints?

Thanks a lot!

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


