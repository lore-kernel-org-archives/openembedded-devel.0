Received: from mail-ew0-f44.google.com ([209.85.215.44])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PSoMK-0005rn-0K
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 11:13:21 +0100
Received: by ewy8 with SMTP id 8so1037214ewy.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 02:11:44 -0800 (PST)
Received: by 10.213.30.1 with SMTP id s1mr1724546ebc.71.1292407903894;
	Wed, 15 Dec 2010 02:11:43 -0800 (PST)
Received: from mozart.localnet (95-29-187-35.broadband.corbina.ru
	[95.29.187.35])
	by mx.google.com with ESMTPS id u1sm796706eeh.16.2010.12.15.02.11.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Dec 2010 02:11:43 -0800 (PST)
Sender: Yury Bushmelev <jay@jay-tech.ru>
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Dec 2010 13:11:17 +0300
User-Agent: KMail/1.13.5 (Linux/2.6.36-ARCH; KDE/4.5.4; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201012151311.17359.jay4mail@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.44
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [2010-12-15] testbuilder failures
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
X-List-Received-Date: Wed, 15 Dec 2010 10:13:21 -0000
Content-Type: Text/Plain;
  charset="ibm850"
Content-Transfer-Encoding: 7bit

Hello!

Todays (tonights) testbuilder runs have some interesting failures.
You can look on overall status here: http://tinderbox.openembedded.net/builders/Jay7-tb/
Full build logs are available from my home machine: http://jay-home.ath.cx/testbuilder/logs/

BB_VERSION        = "1.11.0" (bb git master)
METADATA_BRANCH   = "jay7/testing" (forked from master after pull)
METADATA_REVISION = "03d6624"


1. kexec-tools-klibc failure for angstrom-2008.1/{collie,tosa}/console-image
NOTE: Running task 3593 of 5333 (ID: 3383, /storage/oe/testbuilder/openembedded/recipes/kexec-tools/kexec-tools-klibc_2.0.2.bb, do_c
ompile)
NOTE: oestats: task failed, see http://tinderbox.openembedded.net/packages/1279071/
NOTE: package kexec-tools-klibc-2.0.2-r3: task do_compile: Failed
ERROR: Function 'do_compile' failed
ERROR: Task 3383 (/storage/oe/testbuilder/openembedded/recipes/kexec-tools/kexec-tools-klibc_2.0.2.bb, do_compile) failed with exit code '256'

I've tried to run oe_runmake from devshell and it was compiled fine.


2. gettext failure for minimal/console-image
Build log is available on tinderbox: http://tinderbox.openembedded.net/packages/1280010/
Looks like libtool issue raised here: http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-December/027868.html


3. do_rootfs failure for {angstrom-2008.1,minimal}/ben-nanonote/console-image (mkfs.jffs2: command not found)
Build log is available on tinderbox: http://tinderbox.openembedded.net/packages/1279982/


4. glibc do_package failure for {angstrom-2008.1,minimal}/qemux86/console-image
== angstrom-2008.1:
NOTE: Running task 1732 of 5109 (ID: 198, /storage/oe/testbuilder/openembedded/recipes/glibc/glibc_2.9.bb, do_package)
NOTE: package glibc-2.9-r37.4: task do_package: Started
NOTE: preparing tree for binary locale generation
ERROR: locale_arch_options not found for target_arch=i686
NOTE: oestats: error sending task, disabling stats
NOTE: package glibc-2.9-r37.4: task None: Failed
ERROR: unknown arch:i686 for locale_arch_options
ERROR: Task 198 (/storage/oe/testbuilder/openembedded/recipes/glibc/glibc_2.9.bb, do_package) failed with exit code '256'
ERROR: '/storage/oe/testbuilder/openembedded/recipes/glibc/glibc_2.9.bb' failed

== minimal:
NOTE: Running task 1611 of 5230 (ID: 176, /storage/oe/testbuilder/openembedded/recipes/eglibc/eglibc_2.12.bb, do_package)
NOTE: package eglibc-2.12-r17.7+svnr12230: task do_package: Started
NOTE: preparing tree for binary locale generation
ERROR: locale_arch_options not found for target_arch=i686
NOTE: oestats: error sending task, disabling stats
NOTE: package eglibc-2.12-r17.7+svnr12230: task None: Failed
ERROR: unknown arch:i686 for locale_arch_options
ERROR: Task 176 (/storage/oe/testbuilder/openembedded/recipes/eglibc/eglibc_2.12.bb, do_package) failed with exit code '256'
ERROR: '/storage/oe/testbuilder/openembedded/recipes/eglibc/eglibc_2.12.bb' failed


5. Bitbake 'ERROR: Command execution failed: Exited with 1' error
This was multimachine build for {collie, tosa, akita} in same TMPDIR. Collie build was done before, akita build was started ok after.

oe@oedev:~/testbuilder/logs$ cat B.opie.angstrom-2008.1.tosa.log
Parsing recipes...NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
ERROR: Command execution failed: Exited with 1

I've seen this already yesterday but thought that was my local limits issue.


6. Error executing python function in 'do_distribute_sources' for angstrom-2010.x/collie/opie-image
NOTE: Running task 2280 of 6947 (ID: 3975, virtual:native:/storage/oe/testbuilder/openembedded/recipes/lzma/lzma_4.65.bb, do_unpack)
NOTE: Running task 2281 of 6947 (ID: 3990, virtual:native:/storage/oe/testbuilder/openembedded/recipes/lzma/lzma_4.65.bb, 
do_distribute_sources)
NOTE: package lzma-native-4.65-r5.1: task do_unpack: Started
NOTE: Unpacking ../sources/lzma465.tar.bz2 to /var/tmp/tb-clean-build/work/x86_64-linux/lzma-native-4.65-r5.1/
NOTE: package lzma-native-4.65-r5.1: task do_distribute_sources: Started
NOTE: package lzma-native-4.65-r5.1: task do_unpack: Succeeded
ERROR: Error executing python function in 'do_distribute_sources'
Traceback (most recent call last):
  File "/storage/oe/testbuilder/bitbake/lib/bb/utils.py", line 338, in better_exec
    exec(code, _context, context)
  File "do_distribute_sources", line 33, in <module>
  File "do_distribute_sources", line 30, in do_distribute_sources
  File "/storage/oe/testbuilder/bitbake/lib/bb/build.py", line 191, in exec_func
    exec_func_shell(func, d, runfile, logfile, cwd=adir, fakeroot=fakeroot)
  File "/storage/oe/testbuilder/bitbake/lib/bb/build.py", line 271, in exec_func_shell
    log=logfile)
  File "/storage/oe/testbuilder/bitbake/lib/bb/process.py", line 92, in run
    pipe = Popen(cmd, **options)
  File "/storage/oe/testbuilder/bitbake/lib/bb/process.py", line 59, in __init__
    subprocess.Popen.__init__(self, *args, **options)
  File "/usr/lib/python2.6/subprocess.py", line 623, in __init__
    errread, errwrite)
  File "/usr/lib/python2.6/subprocess.py", line 1141, in _execute_child
    raise child_exception
OSError: [Errno 13] Permission denied

ERROR: Traceback:
ERROR:   File "do_distribute_sources", line 33, in <module>
ERROR: 
ERROR:   File "do_distribute_sources", line 30, in do_distribute_sources
ERROR: 
ERROR:   File "/storage/oe/testbuilder/bitbake/lib/bb/build.py", line 191, in exec_func
ERROR:     exec_func_shell(func, d, runfile, logfile, cwd=adir, fakeroot=fakeroot)
ERROR: 
ERROR:   File "/storage/oe/testbuilder/bitbake/lib/bb/build.py", line 271, in exec_func_shell
ERROR:     log=logfile)
ERROR: 
ERROR:   File "/storage/oe/testbuilder/bitbake/lib/bb/process.py", line 92, in run
ERROR:     pipe = Popen(cmd, **options)
ERROR: 
ERROR:   File "/storage/oe/testbuilder/bitbake/lib/bb/process.py", line 59, in __init__
ERROR:     subprocess.Popen.__init__(self, *args, **options)
ERROR: 
ERROR:   File "/usr/lib/python2.6/subprocess.py", line 623, in __init__
ERROR:     errread, errwrite)
ERROR: 
ERROR:   File "/usr/lib/python2.6/subprocess.py", line 1141, in _execute_child
ERROR:     raise child_exception
ERROR: 
ERROR: The lines leading to this error were:
ERROR:  0029:                           bb.data.setVar('LIC', entry, d)
ERROR:  0030:                           bb.build.exec_func('SRC_DISTRIBUTECOMMAND', d)
ERROR:  0031:
ERROR:  0032:
ERROR:  0033:do_distribute_sources(d)
NOTE: oestats: error sending task, disabling stats
NOTE: package lzma-native-4.65-r5.1: task None: Failed
ERROR: do_distribute_sources
ERROR: Task 3990 (virtual:native:/storage/oe/testbuilder/openembedded/recipes/lzma/lzma_4.65.bb, do_distribute_sources) failed with exit code 
'256'
ERROR: 'virtual:native:/storage/oe/testbuilder/openembedded/recipes/lzma/lzma_4.65.bb' failed


-- 
Yury Bushmelev


