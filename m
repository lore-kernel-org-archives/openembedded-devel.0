Received: from asmtpout030.mac.com ([17.148.16.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1NZ5Nm-00036b-T0
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 17:32:18 +0100
MIME-version: 1.0
Received: from [87.201.169.25] by asmtp030.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KWR00BX7CDM6Y40@asmtp030.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	24 Jan 2010 07:29:51 -0800 (PST)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=5.0.0-0908210000 definitions=main-1001240060
From: Elvis Dowson <elvis.dowson@mac.com>
X-Priority: 1
Date: Sun, 24 Jan 2010 19:29:43 +0400
To: OpenEmbedded Developer <openembedded-devel@lists.openembedded.org>
Message-id: <687C35F4-E7DC-4898-907F-8C1CE8890887@mac.com>
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 17.148.16.105
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Build failure module-init-tools-cross_3.2.2.bb on Fedora 12 x86_64
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
X-List-Received-Date: Sun, 24 Jan 2010 16:32:18 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii

Hi,
       I am trying to build the overo-oe development environment on a new Fedora 12 x86_64 virtual machine image. I am trying to build omap3-console-image.

It fails with module-init-tools-cross_3.2.2.bb.

Could someone please help me resolve this error? I am trying to get a stable 64-bit environment up and running for Overo, to take advantage of build speed up times for my work.

Here is the output from the bitbake -dd -c rebuild module-init-tools-cross command, after just specifically cleaning this recipe using the bitbake -c clean command for module-init-tools-cross.

$ bitbake -dd -c rebuild module-init-tools-cross

NOTE: Handling BitBake files: | (7979/7979) [100 %]
NOTE: Parsing finished. 7361 cached, 310 parsed, 308 skipped, 2 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 181 of 200 (ID: 2, /tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb, do_setscene)
NOTE: Running task 182 of 200 (ID: 3, /tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb, do_fetch)
NOTE: Running task 183 of 200 (ID: 5, /tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb, do_unpack)
NOTE: Running task 184 of 200 (ID: 15, /tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb, do_distribute_sources)
NOTE: Unpacking /usr/share/sources/module-init-tools-3.2.2.tar.bz2 to tmp/work/armv7a-angstrom-linux-gnueabi/module-init-tools-cross-3.2.2-r5/
NOTE: Running task 185 of 200 (ID: 6, /tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb, do_patch)
NOTE: Applying patch 'ignore_arch_directory' (org.openembedded.dev/recipes/module-init-tools/files/ignore_arch_directory)
NOTE: Applying patch 'modutils_extension' (org.openembedded.dev/recipes/module-init-tools/files/modutils_extension)
NOTE: Applying patch 'no_man_rebuild' (org.openembedded.dev/recipes/module-init-tools/files/no_man_rebuild)
NOTE: Applying patch 'manpagesopt' (org.openembedded.dev/recipes/module-init-tools/files/manpagesopt)
NOTE: Applying patch 'module-init-tools-remove-index.patch' (org.openembedded.dev/recipes/module-init-tools/files/module-init-tools-remove-index.patch)
NOTE: Running task 186 of 200 (ID: 7, /tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb, do_configure)
NOTE: Running task 187 of 200 (ID: 8, /tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb, do_qa_configure)
NOTE: Running task 188 of 200 (ID: 9, /tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb, do_compile)
ERROR: function do_compile failed
ERROR: log data follows (/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/module-init-tools-cross-3.2.2-r5/temp/log.do_compile.26025)
| NOTE: make -j 8
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT lsmod.o -MD -MP -MF .deps/lsmod.Tpo -c -o lsmod.o lsmod.c
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT insmod.o -MD -MP -MF .deps/insmod.Tpo -c -o insmod.o insmod.c
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT modprobe.o -MD -MP -MF .deps/modprobe.Tpo -c -o modprobe.o modprobe.c
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT zlibsupport.o -MD -MP -MF .deps/zlibsupport.Tpo -c -o zlibsupport.o zlibsupport.c
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT rmmod.o -MD -MP -MF .deps/rmmod.Tpo -c -o rmmod.o rmmod.c
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT depmod.o -MD -MP -MF .deps/depmod.Tpo -c -o depmod.o depmod.c
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT moduleops.o -MD -MP -MF .deps/moduleops.Tpo -c -o moduleops.o moduleops.c
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT tables.o -MD -MP -MF .deps/tables.Tpo -c -o tables.o tables.c
| mv -f .deps/lsmod.Tpo .deps/lsmod.Po
| mv -f .deps/insmod.Tpo .deps/insmod.Po
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT modinfo.o -MD -MP -MF .deps/modinfo.Tpo -c -o modinfo.o modinfo.c
| ccache gcc  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -static -L/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-rpath-link,/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-rpath,/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-O1 -o insmod.static insmod.o
| /usr/bin/ld: cannot find -lc
| collect2: ld returned 1 exit status
| make: *** [insmod.static] Error 1
| make: *** Waiting for unfinished jobs....
| mv -f .deps/zlibsupport.Tpo .deps/zlibsupport.Po
| mv -f .deps/rmmod.Tpo .deps/rmmod.Po
| mv -f .deps/moduleops.Tpo .deps/moduleops.Po
| mv -f .deps/tables.Tpo .deps/tables.Po
| mv -f .deps/depmod.Tpo .deps/depmod.Po
| modinfo.c: In function 'main':
| modinfo.c:338: warning: 'infosize' may be used uninitialized in this function
| mv -f .deps/modinfo.Tpo .deps/modinfo.Po
| modprobe.c: In function 'do_command':
| modprobe.c:786: warning: field precision should have type 'int', but argument 3 has type 'long int'
| mv -f .deps/modprobe.Tpo .deps/modprobe.Po
| FATAL: oe_runmake failed
NOTE: Task failed: /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/module-init-tools-cross-3.2.2-r5/temp/log.do_compile.26025
ERROR: TaskFailed event exception, aborting
ERROR: Build of /tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb do_compile failed
ERROR: Task 9 (/tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 187 tasks of which 180 didn't need to be rerun and 1 failed.
ERROR: '/tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb' failed


Best regards,

Elvis Dowson


