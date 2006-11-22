Received: from [62.5.255.22] (helo=umail.ru)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <abondarenko@gmail.com>) id 1Gmwrp-00005h-Sc
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Nov 2006 19:30:42 +0100
Received: from [85.141.163.75] (HELO localhost)
	by fe02-umail.umail.ru (CommuniGate Pro SMTP 5.0.12)
	with ESMTP id 48023329 for openembedded-devel@lists.openembedded.org;
	Wed, 22 Nov 2006 21:27:39 +0300
Received: from localhost.localdomain (localhost [127.0.0.1])
	by localhost.localdomain (Postfix) with ESMTP id 3168EBB52E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2006 21:27:39 +0300 (MSK)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTP id 3CA2ABB52E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2006 21:27:29 +0300 (MSK)
From: Andrey A Bondarenko <abondarenko@gmail.com>
To: openembedded-devel@lists.openembedded.org
Organization: KL
Date: Wed, 22 Nov 2006 21:27:28 +0300
Message-Id: <1164220048.821.1.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.1.1 (2.8.1.1-3.fc6) 
X-SpamTest-Envelope-From: abondarenko@gmail.com
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 496 [Nov 22 2006]
X-SpamTest-Method: none
X-SpamTest-Rate: 0
X-SpamTest-SPF: pass
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0242], KAS30/Release
X-Anti-Virus: Kaspersky Anti-Virus for MailServers 5.5.10/RELEASE,
	bases: 22112006 #230201, status: clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Glibc for Angstrom fails to build
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
X-List-Received-Date: Wed, 22 Nov 2006 18:30:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello!

I am just fallowing the manual on the oe.org site. I can not build glibc
(i.e. can not build anything). I am using gcc 3.4 on Fedora Core 6.

[shaman@localhost build]$ bitbake gpe-image
NOTE: Using cache in '/OE/build/tmp/cache/hx4700'
NOTE: Handling BitBake files: / (4045/4045) [100 %]
NOTE: Parsing finished. 3882 cached, 0 parsed, 163 skipped, 0 masked.

NOTE: build 200611222009: started

OE Build Configuration:
BB_VERSION     = "1.6.3"
OE_REVISION    = "7faa9e1500d9ce5c29c1b92c2545f05b296a34ea"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "hx4700"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20061122"
TARGET_FPU     = "soft"

NOTE: preferred version 2.5 of glibc not available
NOTE: package glibc-2.5: started
NOTE: package glibc-2.5-r3: task do_compile: started
NOTE: SITE
files /OE/org.openembedded.dev/site/endian-little /OE/org.openembedded.dev/site/arm-linux 
NOTE: package glibc-2.5-r3: task do_compile: completed
NOTE: package glibc-2.5-r3: task do_install: started
NOTE: SITE
files /OE/org.openembedded.dev/site/endian-little /OE/org.openembedded.dev/site/arm-linux 
NOTE: package glibc-2.5-r3: task do_install: completed
NOTE: package glibc-2.5-r3: task do_package: started
NOTE: preparing tree for binary locale generation
NOTE: SITE
files /OE/org.openembedded.dev/site/endian-little /OE/org.openembedded.dev/site/arm-linux 
NOTE: generating locale es_NI (UTF-8)
NOTE: Task failed: localedef returned an error (command was
PATH="/OE/build/tmp/staging/i686-linux/bin/arm-angstrom-linux-gnueabi:/OE/build/tmp/staging/i686-linux/bin:/OE/build/tmp/cross/bin:/OE/bitbake/bin/:/usr/lib/qt-3.3/bin:/usr/kerberos/bin:/usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin:/home/shaman/bin" I18NPATH="/usr/share/i18n" qemu-arm -r 2.6.16 -L /OE/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.5-r3/locale-tree /OE/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.5-r3/locale-tree/bin/localedef --force --old-style --no-archive --prefix=/OE/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.5-r3/locale-tree --inputfile=/usr/share/i18n/locales/es_NI --charmap=UTF-8 es_NI).
NOTE: package glibc-2.5-r3: task do_package: failed
ERROR: TaskFailed event exception, aborting
NOTE: package glibc-2.5: failed
ERROR: Build of gpe-image failed

-- 
WBR,
Andrey "Shaman007" Bondarenko

http://mobilelinux.ru
http://mobilelinux.ru/wiki



