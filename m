Received: from out4.bezeqint.net ([192.115.188.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <boaz@segol.net>) id 1NXW7j-0001LL-It
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 09:41:14 +0100
Received: from [192.168.1.107] (bzq-109-67-29-87.red.bezeqint.net
	[109.67.29.87])
	by out4.bezeqint.net (Postfix) with ESMTPA id CD93AB0980E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 10:17:46 +0200 (IST)
From: boaz <boaz@segol.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2010 10:33:16 +0200
Message-Id: <1263976396.5407.3.camel@laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 192.115.188.213
X-SA-Exim-Mail-From: boaz@segol.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: glibc_2.9.bb QA error
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
X-List-Received-Date: Wed, 20 Jan 2010 08:41:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I am not able to get my bitbake to work.
It is complaining about glibc_2.9 Any idea how to fix it?

NOTE: Running task 1509 of 2067 (ID:
303, /home/usr/OE/oe-dev/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb, do_package)
NOTE: Running task 1510 of 2067 (ID:
159, /home/usr/OE/oe-dev/recipes/glibc/glibc_2.9.bb, do_package)
NOTE: generation of binary locales disabled. this may break i18n!
NOTE: the following files were installed but not shipped in any package:
NOTE:   /etc/rpc
NOTE: Multiple libraries (libnss_nisplus.so.2, libnss_nis.so.2,
libnss_hesiod.so.2) found, but LEAD_SONAME 'libc.so' doesn't match any
of them
NOTE: package glibc-dbg skipped
ERROR: QA Issue with nscd: No GNU_HASH in the elf binary:
'/home/usr/OE/Temp/work/armv5te-none-linux-gnueabi/glibc-2.9-r35.2/install/nscd/usr/sbin/nscd'
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Error in
executing: /home/usr/OE/oe-dev/recipes/glibc/glibc_2.9.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in
executing: /home/usr/OE/oe-dev/recipes/glibc/glibc_2.9.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in
executing: /home/usr/OE/oe-dev/recipes/glibc/glibc_2.9.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in
executing: /home/usr/OE/oe-dev/recipes/glibc/glibc_2.9.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Build of /home/usr/OE/oe-dev/recipes/glibc/glibc_2.9.bb
do_package failed
ERROR: Task 159 (/home/usr/OE/oe-dev/recipes/glibc/glibc_2.9.bb,
do_package) failed
NOTE: Tasks Summary: Attempted 1509 tasks of which 1366 didn't need to
be rerun and 1 failed.
ERROR: '/home/usr/OE/oe-dev/recipes/glibc/glibc_2.9.bb' failed

BR
Boaz



