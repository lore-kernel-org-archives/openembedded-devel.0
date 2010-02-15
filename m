Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Nh7hc-0006q6-Mr
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 21:37:59 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KXW001S1H6ED7W2@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Feb 2010 14:35:07 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 01B4F14AF60; Mon,
	15 Feb 2010 15:35:01 -0500 (EST)
Date: Mon, 15 Feb 2010 15:35:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100215203501.GC14442@denix.org>
References: <1266176499.12424.6.camel@ed-hp-laptop>
MIME-version: 1.0
In-reply-to: <1266176499.12424.6.camel@ed-hp-laptop>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: shared-mime-info-native-0.51 do_compile failure
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
X-List-Received-Date: Mon, 15 Feb 2010 20:38:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Feb 14, 2010 at 11:41:39AM -0800, ed wrote:
> Trying to build image for mini2440 and get the following error.
> 
> NOTE: Running task 694 of 2862 (ID:
> 1434, /home/ed/mini2440/OE/openembedded/recipes/shared-mime-info/shared-mime-info-native_0.51.bb, do_compile)
> ERROR: function do_compile failed
> ERROR: log data follows
> (/home/ed/mini2440/OE/build/tmp/work/i686-linux/shared-mime-info-native-0.51-r0/temp/log.do_compile.11554)
> | NOTE: make
> | Making check in po
> | make[1]: Entering directory
> `/home/ed/mini2440/OE/build/tmp/work/i686-linux/shared-mime-info-native-0.51-r0/shared-mime-info-0.51/po'
> | rm -f missing notexist
> |
> srcdir=. /home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/bin/intltool-update -m
> | if [ -r missing -o -r notexist ]; then \
> | 	  exit 1; \
> | 	fi
> | make[1]: Leaving directory
> `/home/ed/mini2440/OE/build/tmp/work/i686-linux/shared-mime-info-native-0.51-r0/shared-mime-info-0.51/po'
> | make[1]: Entering directory
> `/home/ed/mini2440/OE/build/tmp/work/i686-linux/shared-mime-info-native-0.51-r0/shared-mime-info-0.51'
> | ccache gcc
> -I/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/include/libxml2
> -I/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/include/glib-2.0
> -I/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/lib/glib-2.0/include   -isystem/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/include -O2 -Wall -Wstrict-prototypes -Wmissing-prototypes -Wwrite-strings  -L/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 -o update-mime-database update_mime_database-update-mime-database.o -L/home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/lib -lxml2 -lglib-2.0
> | /home/ed/mini2440/OE/build/tmp/staging/i686-linux/usr/lib/libxml2.so:
> undefined reference to `gzopen64'
> | collect2: ld returned 1 exit status
> | make[1]: *** [update-mime-database] Error 1
> | make[1]: Leaving directory
> `/home/ed/mini2440/OE/build/tmp/work/i686-linux/shared-mime-info-native-0.51-r0/shared-mime-info-0.51'
> | make: *** [check-recursive] Error 1
> | FATAL: oe_runmake failed
> NOTE: Task
> failed: /home/ed/mini2440/OE/build/tmp/work/i686-linux/shared-mime-info-native-0.51-r0/temp/log.do_compile.11554
> ERROR: TaskFailed event exception, aborting
> ERROR: Build
> of /home/ed/mini2440/OE/openembedded/recipes/shared-mime-info/shared-mime-info-native_0.51.bb do_compile failed
> ERROR: Task 1434
> (/home/ed/mini2440/OE/openembedded/recipes/shared-mime-info/shared-mime-info-native_0.51.bb, do_compile) failed
> NOTE: Tasks Summary: Attempted 693 tasks of which 674 didn't need to be
> rerun and 1 failed.
> ERROR:
> '/home/ed/mini2440/OE/openembedded/recipes/shared-mime-info/shared-mime-info-native_0.51.bb' failed
> 
> ==============================
> Says it has undefined gzopen64
> But gzopen64 is apparently there.
> ed ~/mini2440/OE/build/tmp/staging/i686-linux/usr/lib:$: strings
> libxml2.so |grep gzopen64
> gzopen64
> ed ~/mini2440/OE/build/tmp/staging/i686-linux/usr/lib:$: objdump -T
> libxml2.so |grep gzopen64
> 00000000      DF *UND*	00000000              gzopen64

Actually, it clearly says it's *UND*efined in this context... :) As gzopen*() 
is provided by libz - looks like it may be trying to link against your host 
lib...

-- 
Denys


