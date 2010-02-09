Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1NesCf-0007U3-K3
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 16:40:44 +0100
Received: from [163.241.71.52] (163.241.71.52) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server id 8.1.393.1; Tue, 9 Feb 2010 10:38:07 -0500
Message-ID: <4B718115.1010104@tycoelectronics.com>
Date: Tue, 9 Feb 2010 10:36:53 -0500
From: Jay Snyder <jay.snyder@tycoelectronics.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <mailman.1729.1265722552.14961.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.1729.1265722552.14961.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: error trying to build parted 1.8.8 : configure.ac:173: error: AC_REQUIRE: circular dependency of AC_GNU_SOURCE
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
X-List-Received-Date: Tue, 09 Feb 2010 15:40:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to build parted 1.8.8 on OE:


NOTE: Running task 551 of 565 (ID: 3, 
/home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb, do_unpack)
NOTE: Running task 552 of 565 (ID: 13, 
/home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb, 
do_distribute_sources)
NOTE: Unpacking ../downloads/parted-1.8.8.tar.gz to 
tmp/work/i686-angstrom-linux/parted-1.8.8-r2/                            
NOTE: Running task 553 of 565 (ID: 4, 
/home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb, 
do_patch)             
NOTE: Applying patch 'use_llseek_syscall.patch' 
(../2009-12-04/openembedded/recipes/parted/files/use_llseek_syscall.patch)    

NOTE: Applying patch 'parted-1.8.x.patch' 
(../2009-12-04/openembedded/recipes/parted/files/parted-1.8.x.patch)                

NOTE: Running task 554 of 565 (ID: 5, 
/home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb, 
do_configure)         
ERROR: function do_configure 
failed                                                                                           

ERROR: log data follows 
(/home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/temp/log.do_configure.24731)             

| automake (GNU automake) 
1.10.2                                                                                              

| Copyright (C) 2008 Free Software Foundation, 
Inc.                                                                           

| License GPLv2+: GNU GPL version 2 or later 
<http://gnu.org/licenses/gpl.html>                                               

| This is free software: you are free to change and redistribute 
it.                                                         
| There is NO WARRANTY, to the extent permitted by 
law.                                                                      
|                                                                                                                             

| Written by Tom Tromey 
<tromey@redhat.com>                                                                                   

|        and Alexandre Duret-Lutz 
<adl@gnu.org>.                                                                              

| AUTOV is 
1.10                                                                                                               

| NOTE: Executing autoreconf --verbose --install --force 
--exclude=autopoint -I 
/home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/parted-1.8.8/m4/ 
-I/home/oe/build/tmp/staging/i686-angstrom-linux/usr/share/aclocal-1.10 
-I /home/oe/build/tmp/staging/i686-angstrom-linux/usr/share/aclocal
| autoreconf: Entering directory `.'
| autoreconf: running: aclocal -I 
/home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/parted-1.8.8/m4/ 
-I /home/oe/build/tmp/staging/i686-angstrom-linux/usr/share/aclocal-1.10 
-I /home/oe/build/tmp/staging/i686-angstrom-linux/usr/share/aclocal 
--force -I m4
| configure.ac:173: error: AC_REQUIRE: circular dependency of AC_GNU_SOURCE
| 
/home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/parted-1.8.8/m4/extensions.m4:19: 
AC_USE_SYSTEM_EXTENSIONS is expanded from...
| ../../lib/autoconf/specific.m4:332: AC_GNU_SOURCE is expanded from...
| 
/home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/parted-1.8.8/m4/gnulib-comp.m4:23: 
gl_EARLY is expanded from...
| configure.ac:173: the top level
| autom4te: /home/oe/build/tmp/staging/x86_64-linux/usr/bin/m4 failed 
with exit status: 1
| aclocal: autom4te failed with exit status: 1
| autoreconf: aclocal failed with exit status: 1
| FATAL: autoreconf execution failed.
NOTE: Task failed: 
/home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/temp/log.do_configure.24731
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb 
do_configure failed
ERROR: Task 5 
(/home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb, 
do_configure) failed
NOTE: Tasks Summary: Attempted 553 tasks of which 548 didn't need to be 
rerun and 1 failed.
ERROR: '/home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb' 
failed



