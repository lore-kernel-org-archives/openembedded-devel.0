Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SV1if-0003Qe-3R
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 16:30:21 +0200
Received: from [192.168.0.45] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 857E1471D5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 15:18:11 +0100 (BST)
Message-ID: <4FB50951.4000503@communistcode.co.uk>
Date: Thu, 17 May 2012 15:21:05 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Building Valgrind
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
X-List-Received-Date: Thu, 17 May 2012 14:30:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am attempting to build Valgrind with mu very minimal package compiling 
experience, and unsurprisingly for such a complex program I am stuck! I 
will be happy to submit it to meta-oe once it is building and believe it 
would be very useful now that it supports ARM (and MIPS to some extent 
apparently). So, my progress so far:


 From what I can gather the autoconf class is passing --warning=cross 
which it doesn't understand... I'm really not very experienced at this! :-)

bb file:

DESCRIPTION = "Valgrind"
HOMEPAGE = "http://www.valgrind.org"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803"

inherit autotools gettext pkgconfig

SRC_URI = "http://valgrind.org/downloads/valgrind-${PV}.tar.bz2"
SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"

error:

DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
ERROR: Function failed: do_configure (see 
/home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/valgrind-3.7.0-r0/temp/log.do_configure.14418 
for further information)
automake (GNU automake) 1.11.2
Copyright (C) 2011 Free Software Foundation, Inc.
License GPLv2+: GNU GPL version 2 or later 
<http://gnu.org/licenses/gpl-2.0.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Tom Tromey <tromey@redhat.com>
        and Alexandre Duret-Lutz <adl@gnu.org>.
AUTOV is 1.11
NOTE: Executing autoreconf --verbose --install --force 
--exclude=autopoint 
-I/home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.11 
-I 
/home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/valgrind-3.7.0-r0/valgrind-3.7.0/aclocal-copy/
autoreconf: Entering directory `.'
autoreconf: configure.in: not using Gettext
autoreconf: running: aclocal -I 
/home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.11 
-I 
/home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/valgrind-3.7.0-r0/valgrind-3.7.0/aclocal-copy/ 
-I 
/home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.11 
-I 
/home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/valgrind-3.7.0-r0/valgrind-3.7.0/aclocal-copy/ 
--force --warnings=cross
aclocal: unknown warning category `cross'
aclocal: aclocal: file 
`/home/jack/angstrom.git/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/share/aclocal/gsettings.m4' 
does not exist
autoreconf: aclocal failed with exit status: 1
ERROR: autoreconf execution failed.
~

Thanks in advance!

Regards,
Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



