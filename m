Received: from qmta07.emeryville.ca.mail.comcast.net ([76.96.30.64])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1NgkPD-0002CE-9i
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 20:45:26 +0100
Received: from omta10.emeryville.ca.mail.comcast.net ([76.96.30.28])
	by qmta07.emeryville.ca.mail.comcast.net with comcast
	id hvJ01d0050cQ2SLA7vhiip; Sun, 14 Feb 2010 19:41:42 +0000
Received: from [192.168.1.100] ([67.188.141.116])
	by omta10.emeryville.ca.mail.comcast.net with comcast
	id hvhg1d0052WszPn8WvhhfP; Sun, 14 Feb 2010 19:41:41 +0000
From: ed <enelson1000@comcast.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Feb 2010 11:41:39 -0800
Message-Id: <1266176499.12424.6.camel@ed-hp-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 76.96.30.64
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: shared-mime-info-native-0.51 do_compile failure
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
X-List-Received-Date: Sun, 14 Feb 2010 19:45:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Trying to build image for mini2440 and get the following error.

NOTE: Running task 694 of 2862 (ID:
1434, /home/ed/mini2440/OE/openembedded/recipes/shared-mime-info/shared-mime-info-native_0.51.bb, do_compile)
ERROR: function do_compile failed
ERROR: log data follows
(/home/ed/mini2440/OE/build/tmp/work/i686-linux/shared-mime-info-native-0.51-r0/temp/log.do_compile.11554)
| NOTE: make
| Making check in po
| make[1]: Entering directory
`/home/ed/mini2440/OE/build/tmp/work/i686-linux/shared-mime-info-native-0.51-r0/shared-mime-info-0.51/po'
| rm -f missing notexist
|
srcdir=. /home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/bin/intltool-update -m
| if [ -r missing -o -r notexist ]; then \
| 	  exit 1; \
| 	fi
| make[1]: Leaving directory
`/home/ed/mini2440/OE/build/tmp/work/i686-linux/shared-mime-info-native-0.51-r0/shared-mime-info-0.51/po'
| make[1]: Entering directory
`/home/ed/mini2440/OE/build/tmp/work/i686-linux/shared-mime-info-native-0.51-r0/shared-mime-info-0.51'
| ccache gcc
-I/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/include/libxml2
-I/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/include/glib-2.0
-I/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/lib/glib-2.0/include   -isystem/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/include -O2 -Wall -Wstrict-prototypes -Wmissing-prototypes -Wwrite-strings  -L/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 -o update-mime-database update_mime_database-update-mime-database.o -L/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/lib -lxml2 -lglib-2.0
| /home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/lib/libxml2.so:
undefined reference to `gzopen64'
| collect2: ld returned 1 exit status
| make[1]: *** [update-mime-database] Error 1
| make[1]: Leaving directory
`/home/ed/mini2440/OE/build/tmp/work/i686-linux/shared-mime-info-native-0.51-r0/shared-mime-info-0.51'
| make: *** [check-recursive] Error 1
| FATAL: oe_runmake failed
NOTE: Task
failed: /home/ed/mini2440/OE/build/tmp/work/i686-linux/shared-mime-info-native-0.51-r0/temp/log.do_compile.11554
ERROR: TaskFailed event exception, aborting
ERROR: Build
of /home/ed/mini2440/OE/openembedded/recipes/shared-mime-info/shared-mime-info-native_0.51.bb do_compile failed
ERROR: Task 1434
(/home/ed/mini2440/OE/openembedded/recipes/shared-mime-info/shared-mime-info-native_0.51.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 693 tasks of which 674 didn't need to be
rerun and 1 failed.
ERROR:
'/home/ed/mini2440/OE/openembedded/recipes/shared-mime-info/shared-mime-info-native_0.51.bb' failed

==============================
Says it has undefined gzopen64
But gzopen64 is apparently there.
ed ~/mini2440/OE/build/tmp/staging/i686-linux/usr/lib:$: strings
libxml2.so |grep gzopen64
gzopen64
ed ~/mini2440/OE/build/tmp/staging/i686-linux/usr/lib:$: objdump -T
libxml2.so |grep gzopen64
00000000      DF *UND*	00000000              gzopen64


Any ideas?  





