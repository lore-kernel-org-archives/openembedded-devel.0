Received: from 173-11-172-146-houston.txt.hfc.comcastbusiness.net
	([173.11.172.146] helo=mail.breakawaysystems.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dave@lambsys.com>) id 1PEPC1-0007Se-Br
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 17:31:10 +0100
Received: by mail.breakawaysystems.com (Postfix, from userid 1007)
	id 430048BA001; Fri,  5 Nov 2010 11:30:17 -0500 (CDT)
Received: from [192.168.1.100]
	(173-11.172.145-houston.txt.hfc.comcastbusiness.net [173.11.172.145])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: dlambert)
	by mail.breakawaysystems.com (Postfix) with ESMTPSA id F231D1487CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Nov 2010 11:30:14 -0500 (CDT)
Message-ID: <4CD43116.5020304@lambsys.com>
Date: Fri, 05 Nov 2010 11:30:14 -0500
From: David Lambert <dave@lambsys.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 173.11.172.146
X-SA-Exim-Mail-From: dave@lambsys.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RDNS_DYNAMIC autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Random problems with building locales
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
X-List-Received-Date: Fri, 05 Nov 2010 16:31:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am getting apparent random failures when attempting to build 
OpenEmbedded with bitbake 1.10.0.  It seems that localedef is randomly 
failing as shown below. The first time it failed compiling UTF-8 es_NI, 
the second UTF-8 gv_GB, third UTF-8 es_NI again, and finally UTF-8 xh_ZA.
Initially I suspected a problem with my machine, but I ran diagnostics 
overnight with no failures. Has anyone else experienced this type of 
failure? Could you help guide me where else to look?


Thanks in advance for any help.

Best regards,

Dave.


NOTE: Task failed: localedef returned an error (command was 
PATH="/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/armv5te/bin:/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/bin:/home/dlambert/oe/build/tmp/sysroots/i686-linux/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux//bin:/home/dlambert/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/armelf/bin" 
I18NPATH="/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree/usr/share/i18n" 
qemu-arm -s 1048576 -r 2.6.24 -L 
/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree 
-E 
LD_LIBRARY_PATH=/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree/lib  
/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree/bin/localedef 
--force --old-style --no-archive 
--prefix=/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree 
--inputfile=/usr/share/i18n/locales/es_NI --charmap=UTF-8 es_NI).
NOTE: package glibc-2.9-r37.3: task do_package: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb do_package failed
ERROR: Task 159 
(/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package) 
failed with 256
ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
dlambert@development:~/oe/build$ bitbake base-image
NOTE: Handling BitBake files: \ (7090/7090) [100 %]
Parsing of 7090 .bb files complete (6676 cached, 414 parsed). 7279 
targets, 339 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 516 of 1345 (ID: 159, 
/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package)
NOTE: package glibc-2.9-r37.3: task do_package: Started
NOTE: preparing tree for binary locale generation
NOTE: generating locale es_NI (UTF-8)
NOTE: generating locale bo_IN (UTF-8)
NOTE: generating locale gv_GB (UTF-8)
qemu-arm: relocation error: qemu-arm: symbol unlink, version GLIBC_2.0 
not defined in file libc.so.6 with link time reference
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb do_package failed
ERROR: Task 159 
(/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package) 
failed with 256
ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
NOTE: Task failed: localedef returned an error (command was 
PATH="/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/armv5te/bin:/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/bin:/home/dlambert/oe/build/tmp/sysroots/i686-linux/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux//bin:/home/dlambert/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/armelf/bin" 
I18NPATH="/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree/usr/share/i18n" 
qemu-arm -s 1048576 -r 2.6.24 -L 
/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree 
-E 
LD_LIBRARY_PATH=/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree/lib  
/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree/bin/localedef 
--force --old-style --no-archive 
--prefix=/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree 
--inputfile=/usr/share/i18n/locales/gv_GB --charmap=UTF-8 gv_GB).
NOTE: package glibc-2.9-r37.3: task do_package: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb do_package failed
ERROR: Task 159 
(/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package) 
failed with 256
ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
dlambert@development:~/oe/build$ bitbake base-image
NOTE: Handling BitBake files: \ (7090/7090) [100 %]
Parsing of 7090 .bb files complete (6676 cached, 414 parsed). 7279 
targets, 339 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 516 of 1345 (ID: 159, 
/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package)
NOTE: package glibc-2.9-r37.3: task do_package: Started
NOTE: preparing tree for binary locale generation
NOTE: generating locale es_NI (UTF-8)
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb do_package failed
ERROR: Task 159 
(/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package) 
failed with 256
ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
NOTE: Task failed: localedef returned an error (command was 
PATH="/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/armv5te/bin:/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/bin:/home/dlambert/oe/build/tmp/sysroots/i686-linux/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux//bin:/home/dlambert/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/armelf/bin" 
I18NPATH="/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree/usr/share/i18n" 
qemu-arm -s 1048576 -r 2.6.24 -L 
/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree 
-E 
LD_LIBRARY_PATH=/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree/lib  
/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree/bin/localedef 
--force --old-style --no-archive 
--prefix=/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree 
--inputfile=/usr/share/i18n/locales/es_NI --charmap=UTF-8 es_NI).
NOTE: package glibc-2.9-r37.3: task do_package: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb do_package failed
ERROR: Task 159 
(/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package) 
failed with 256
ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
dlambert@development:~/oe/build$ bitbake base-image
NOTE: Handling BitBake files: \ (7090/7090) [100 %]
Parsing of 7090 .bb files complete (6676 cached, 414 parsed). 7279 
targets, 339 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 516 of 1345 (ID: 159, 
/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package)
NOTE: package glibc-2.9-r37.3: task do_package: Started
NOTE: preparing tree for binary locale generation
NOTE: generating locale es_NI (UTF-8)
NOTE: generating locale bo_IN (UTF-8)
NOTE: generating locale gv_GB (UTF-8)
NOTE: generating locale kw_GB (UTF-8)
NOTE: generating locale en_BW (UTF-8)
NOTE: generating locale xh_ZA (UTF-8)
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb do_package failed
ERROR: Task 159 
(/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package) 
failed with 256
ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
NOTE: Task failed: localedef returned an error (command was 
PATH="/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/armv5te/bin:/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/bin:/home/dlambert/oe/build/tmp/sysroots/i686-linux/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux//bin:/home/dlambert/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/armelf/bin" 
I18NPATH="/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree/usr/share/i18n" 
qemu-arm -s 1048576 -r 2.6.24 -L 
/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree 
-E 
LD_LIBRARY_PATH=/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree/lib  
/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree/bin/localedef 
--force --old-style --no-archive 
--prefix=/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r37.3/locale-tree 
--inputfile=/usr/share/i18n/locales/xh_ZA --charmap=UTF-8 xh_ZA).
NOTE: package glibc-2.9-r37.3: task do_package: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb do_package failed
ERROR: Task 159 
(/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package) 
failed with 256
ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed


