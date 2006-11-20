Received: from [209.59.181.203] (helo=host2.dedicated4less.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <s@bigbob.org.uk>) id 1GmEGj-0002G5-IG
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Nov 2006 19:53:25 +0100
Received: from cpanel by host2.dedicated4less.com with local (Exim 4.52)
	id 1GmEE4-0007Aj-2i for openembedded-devel@lists.openembedded.org;
	Mon, 20 Nov 2006 13:50:18 -0500
Received: from 84.12.180.149 ([84.12.180.149]) by bigbob.org.uk (Horde MIME
	library) with HTTP; Mon, 20 Nov 2006 13:50:15 -0500
Message-ID: <20061120135015.ckbllosdeokgk8gc@bigbob.org.uk>
Date: Mon, 20 Nov 2006 13:50:15 -0500
From: Rob Neild <s@bigbob.org.uk>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.1.3)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2.dedicated4less.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [32001 501] / [47 12]
X-AntiAbuse: Sender Address Domain - bigbob.org.uk
X-Source: /usr/local/cpanel/3rdparty/bin/php
X-Source-Args: /usr/local/cpanel/3rdparty/bin/php
	/usr/local/cpanel/base/horde/imp/compose.php 
X-Source-Dir: :/base/horde/imp
Subject: cannot run strip
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
X-List-Received-Date: Mon, 20 Nov 2006 18:53:25 -0000
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

What am I doing wrong? The build can't find strip...

BBPATH=/home/rob/openembedded/build:/home/rob/openembedded/org.openembedded.oz354x

TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "akita"
DISTRO         = "openzaurus"
DISTRO_VERSION = "3.5.4.1"
TARGET_FPU     = "soft"

NOTE: package qemu-native-0.8.2: started
NOTE: package qemu-native-0.8.2-r1: task do_fetch: started
NOTE: package qemu-native-0.8.2-r1: task do_fetch: completed
NOTE: package qemu-native-0.8.2-r1: task do_populate_staging: started
ERROR: function do_stage failed

| install qemu.1 qemu-img.1  
"/home/rob/openembedded/tmp/staging/i686-linux/share/man/man1"
| mkdir -p "/home/rob/openembedded/tmp/staging/i686-linux/bin"
| install -m 755 -s qemu-img  
"/home/rob/openembedded/tmp/staging/i686-linux/bin"
| install: cannot run strip: No such file or directory
| install: strip failed
| make: *** [install] Error 1
| FATAL: oe_runmake failed



