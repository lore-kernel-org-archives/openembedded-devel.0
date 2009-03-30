Received: from [212.227.126.186] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joerg@hakker.de>) id 1LoNOY-00046s-5A
	for Openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 21:43:42 +0200
Received: from tristan.localnet (port-92-202-121-238.dynamic.qsc.de
	[92.202.121.238])
	by mrelayeu.kundenserver.de (node=mrelayeu7) with ESMTP (Nemesis)
	id 0ML2xA-1LoNMS1DB2-0007WO; Mon, 30 Mar 2009 21:41:32 +0200
From: =?iso-8859-1?q?J=F6rg_Bakker?= <joerg@hakker.de>
To: Openembedded-devel@lists.openembedded.org
Date: Mon, 30 Mar 2009 21:41:30 +0200
User-Agent: KMail/1.11.1 (Linux/2.6.27-11-generic; KDE/4.2.1; i686; ; )
MIME-Version: 1.0
Message-Id: <200903302141.30822.joerg@hakker.de>
X-Provags-ID: V01U2FsdGVkX1/z1+QcR8RudVSjfhAK2sND0n3ApAr43WG29bx
	8AeLq1nGbMuT8A8BhTMe6zK5BE3WucKPqnJrWgCyQw1U27jyFG
	Lzu0vry6LDq6PhaXXi3TQ==
Subject: [PATCH] gcc-cross-kernel-3.3.4
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
X-List-Received-Date: Mon, 30 Mar 2009 19:43:42 -0000
X-Groupsio-MsgNum: 8845
Content-Disposition: inline
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_qBS0J6JUog9Go2o"

--Boundary-00=_qBS0J6JUog9Go2o
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Building gcc-cross-kernel-3.3.4 stops with the following error:

| In function 'open',                                                                                                                                    
|     inlined from 'collect_execute' at 
/home/jb/devel/cc/jammsession/oe/build/tmp/work/i586-angstrom-linux/gcc-cross-
kernel-3.3.4-3.3.4-r9/gcc-3.3.4/gcc/collect2.c:1575:                                                                                                                                        
| /usr/include/bits/fcntl2.h:51: error: call to '__open_missing_mode' declared 
with attribute error: open with O_CREAT in second argument needs 3 arguments                                                                                                                                                       
| make[1]: *** [collect2.o] Error 1                                                                                                                      
| make[1]: *** Waiting for unfinished jobs....                                                                                                           
| done                                                                                                                                                   
....
| make[1]: Leaving directory 
`/home/jb/devel/cc/jammsession/oe/build/tmp/work/i586-angstrom-linux/gcc-
cross-kernel-3.3.4-3.3.4-r9/gcc-3.3.4/build.i686-linux.i586-angstrom-
linux/gcc'
| make: *** [all-gcc] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /home/jb/devel/cc/jammsession/oe/build/tmp/work/i586-
angstrom-linux/gcc-cross-kernel-3.3.4-3.3.4-r9/temp/log.do_compile.17555
NOTE: package gcc-cross-kernel-3.3.4-3.3.4-r9: task do_compile: failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/jb/devel/cc/jammsession/oe/build/recipes/gcc.save/gcc-
cross-kernel-3.3.4_3.3.4.bb do_compile failed
ERROR: Task 7 (/home/jb/devel/cc/jammsession/oe/build/recipes/gcc.save/gcc-
cross-kernel-3.3.4_3.3.4.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 271 tasks of which 265 didn't need to be rerun 
and 1 failed.
ERROR: '/home/jb/devel/cc/jammsession/oe/build/recipes/gcc.save/gcc-cross-
kernel-3.3.4_3.3.4.bb' failed

OE Build Configuration:
BB_VERSION        = "1.8.13"
METADATA_BRANCH   = "org.openembedded.dev"
METADATA_REVISION = "8f8efbe43a7f28802d066f7f83915e8fbd0d4cc2"
TARGET_ARCH       = "i586"                                    
TARGET_OS         = "linux"                                   
MACHINE           = "epia"                                    
DISTRO            = "angstrom"                                
DISTRO_VERSION    = "2009.X-test-20090329"                    

The attached patch fixes this.




--Boundary-00=_qBS0J6JUog9Go2o
Content-Type: text/x-patch;
  charset="UTF-8";
  name="gcc-cross-kernel-334.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="gcc-cross-kernel-334.patch"

diff -Nur openembedded/recipes/gcc/gcc-cross-kernel-3.3.4/gcc334-collect2_file_open_args.patch build/recipes/gcc/gcc-cross-kernel-3.3.4/gcc334-collect2_file_open_args.patch
--- openembedded/recipes/gcc/gcc-cross-kernel-3.3.4/gcc334-collect2_file_open_args.patch	1970-01-01 01:00:00.000000000 +0100
+++ build/recipes/gcc/gcc-cross-kernel-3.3.4/gcc334-collect2_file_open_args.patch	2009-03-21 17:34:07.000000000 +0100
@@ -0,0 +1,11 @@
+--- gcc-3.3.4/gcc/collect2.c.orig	2009-03-21 17:26:11.000000000 +0100
++++ gcc-3.3.4/gcc/collect2.c	2009-03-21 17:26:47.000000000 +0100
+@@ -1572,7 +1572,7 @@
+   if (redir)
+     {
+       /* Open response file.  */
+-      redir_handle = open (redir, O_WRONLY | O_TRUNC | O_CREAT);
++      redir_handle = open (redir, O_WRONLY | O_TRUNC | O_CREAT, 0666);
+ 
+       /* Duplicate the stdout and stderr file handles
+ 	 so they can be restored later.  */
diff -Nur openembedded/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb build/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb
--- openembedded/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb	2009-03-21 10:44:02.000000000 +0100
+++ build/recipes/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb	2009-03-21 17:39:11.000000000 +0100
@@ -1,2 +1,3 @@
 require gcc-cross-initial_${PV}.bb
 require gcc-cross-kernel.inc
+SRC_URI_append = "file://gcc334-collect2_file_open_args.patch;patch=1"

--Boundary-00=_qBS0J6JUog9Go2o--
