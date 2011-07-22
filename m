Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1QkGJ6-0001En-N2
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jul 2011 16:02:24 +0200
Received: from nvs0066 ([10.91.8.1]) by smtp.nedap.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 22 Jul 2011 15:58:16 +0200
X-TM-IMSS-Message-ID: <2f125792000167e3@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 2f125792000167e3 ;
	Fri, 22 Jul 2011 15:57:35 +0200
Message-ID: <4E298200.1040302@nedap.com>
Date: Fri, 22 Jul 2011 15:58:24 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 22 Jul 2011 13:58:16.0118 (UTC)
	FILETIME=[6778CD60:01CC4877]
Subject: strange error
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
X-List-Received-Date: Fri, 22 Jul 2011 14:02:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

funny error when the OE_BASE dirname contains "-OS"
It looks like it all occurrences in the gcc line with "-OS" are replaced 
by "-O1S" leading to a wrong path...



| make[1]: Entering directory 
`/home/jdj/OE-OS/build/tmp-angstrom_2008_1/work/i686-linux/libgcrypt-native-1.4.1-r0/libgcrypt-1.4.1'
| Making all in mpi
| make[2]: Entering directory 
`/home/jdj/OE-OS/build/tmp-angstrom_2008_1/work/i686-linux/libgcrypt-native-1.4.1-r0/libgcrypt-1.4.1/mpi'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory 
`/home/jdj/OE-OS/build/tmp-angstrom_2008_1/work/i686-linux/libgcrypt-native-1.4.1-r0/libgcrypt-1.4.1/mpi'
| Making all in cipher
| make[2]: Entering directory 
`/home/jdj/OE-OS/build/tmp-angstrom_2008_1/work/i686-linux/libgcrypt-native-1.4.1-r0/libgcrypt-1.4.1/cipher'
| `echo /bin/sh ../i686-linux-libtool --tag=CC   --mode=compile gcc 
-DHAVE_CONFIG_H -I. -I..  -I../src -I../src  
-isystem/home/jdj/OE-OS/build/tmp-angstrom_2008_1/sysroots/i686-linux/usr/include 
-I/home/jdj/OE-OS/build/tmp-angstrom_2008_1/sysroots/i686-linux/usr/include 
-isystem/home/jdj/OE-OS/build/tmp-angstrom_2008_1/sysroots/i686-linux/usr/include 
-O2 -g -fvisibility=hidden -Wall -Wpointer-arith -c ./tiger.c | sed -e 
's/-O[2-9s]*/-O1/g' `
| i686-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I.. -I../src 
-I../src 
-isystem/home/jdj/OE-O1S/build/tmp-angstrom_2008_1/sysroots/i686-linux/usr/include 
-I/home/jdj/OE-O1S/build/tmp-angstrom_2008_1/sysroots/i686-linux/usr/include 
-isystem/home/jdj/OE-O1S/build/tmp-angstrom_2008_1/sysroots/i686-linux/usr/include 
-O1 -g -fvisibility=hidden -Wall -Wpointer-arith -c ./tiger.c  -fPIC 
-DPIC -o .libs/tiger.o
| In file included from ../src/visibility.h:245:0,
|                  from ../src/g10lib.h:39,
|                  from ./tiger.c:26:
| ../src/gcrypt.h:29:23: fatal error: gpg-error.h: No such file or directory
| compilation terminated.
| make[2]: *** [tiger.lo] Error 1
| make[2]: Leaving directory 
`/home/jdj/OE-OS/build/tmp-angstrom_2008_1/work/i686-linux/libgcrypt-native-1.4.1-r0/libgcrypt-1.4.1/cipher'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory 
`/home/jdj/OE-OS/build/tmp-angstrom_2008_1/work/i686-linux/libgcrypt-native-1.4.1-r0/libgcrypt-1.4.1'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: package libgcrypt-native-1.4.1-r0: task do_compile: Failed



