Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1J4oLi-0006b2-Gl
	for openembedded-devel@openembedded.org; Wed, 19 Dec 2007 03:07:56 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1J4oGr-0007Cm-DX
	for openembedded-devel@openembedded.org; Wed, 19 Dec 2007 02:02:53 +0000
Received: from v-209-98-139-195.mn.visi.com ([209.98.139.195])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 19 Dec 2007 02:02:53 +0000
Received: from grante by v-209-98-139-195.mn.visi.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Dec 2007 02:02:53 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Grant Edwards <grante@visi.com>
Date: Wed, 19 Dec 2007 02:02:45 +0000 (UTC)
Message-ID: <fk9u44$rgn$1@ger.gmane.org>
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: v-209-98-139-195.mn.visi.com
User-Agent: slrn/0.9.8.1 (Linux)
Sender: news <news@ger.gmane.org>
Subject: How do you find a rev of OE that will build?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2007 02:07:56 -0000

How does one find a rev of OE that builds?

I've been following the GettingStarted page trying to build
task-bask for about a week now, and I always hit errors due to
failed patches.  Here's the error du jour after doing a
pull/update about a half hour ago:

[...]
NOTE: Running task 284 of 976 (ID: 650, /home/grante/quarq/oe/org.openembedded.dev/packages/python/python-native_2.5.1.bb, do_patch)
NOTE: package python-native-2.5.1: started
NOTE: package python-native-2.5.1-ml1: task do_patch: started
NOTE: Applying patch 'bindir-libdir.patch'
ERROR: Error in executing: 
ERROR: Exception:__builtin__.CmdError Message:Command Error: exit status: 1  Output:
Applying patch bindir-libdir.patch
patching file Makefile.pre.in
Hunk #1 FAILED at 78.
1 out of 1 hunk FAILED -- rejects in file Makefile.pre.in
Patch bindir-libdir.patch can be reverse-applied
ERROR: Printing the environment of the function
ERROR: Error in executing: 
ERROR: Exception:__builtin__.CmdError Message:Command Error: exit status: 1  Output:
Applying patch bindir-libdir.patch
patching file Makefile.pre.in
Hunk #1 FAILED at 78.
1 out of 1 hunk FAILED -- rejects in file Makefile.pre.in
Patch bindir-libdir.patch can be reverse-applied
ERROR: Printing the environment of the function
ERROR: Error in executing: 
ERROR: Exception:__builtin__.CmdError Message:Command Error: exit status: 1  Output:
Applying patch bindir-libdir.patch
patching file Makefile.pre.in
Hunk #1 FAILED at 78.
1 out of 1 hunk FAILED -- rejects in file Makefile.pre.in
Patch bindir-libdir.patch can be reverse-applied
ERROR: Printing the environment of the function
ERROR: Build of /home/grante/quarq/oe/org.openembedded.dev/packages/python/python-native_2.5.1.bb do_patch failed
Traceback (most recent call last):
  File "/usr/bin/bitbake", line 134, in ?
    main()
  File "/usr/bin/bitbake", line 131, in main
    cooker.cook()
  File "usr/lib/python2.4/site-packages/bb/cooker.py", line 552, in cook
  File "usr/lib/python2.4/site-packages/bb/cooker.py", line 466, in buildTargets
  File "usr/lib/python2.4/site-packages/bb/runqueue.py", line 403, in execute_runqueue
  File "usr/lib/python2.4/site-packages/bb/runqueue.py", line 531, in execute_runqueue_internal
  File "usr/lib/python2.4/site-packages/bb/cooker.py", line 125, in tryBuild
  File "usr/lib/python2.4/site-packages/bb/cooker.py", line 98, in tryBuildPackage
  File "usr/lib/python2.4/site-packages/bb/build.py", line 292, in exec_task
  File "usr/lib/python2.4/site-packages/bb/build.py", line 281, in execute
  File "usr/lib/python2.4/site-packages/bb/build.py", line 98, in exec_func
  File "usr/lib/python2.4/site-packages/bb/build.py", line 117, in exec_func_python
  File "usr/lib/python2.4/site-packages/bb/utils.py", line 144, in better_exec
  File "do_patch", line 4, in ?
  File "do_patch", line 2, in do_patch
  File "usr/lib/python2.4/site-packages/bb/build.py", line 98, in exec_func
  File "usr/lib/python2.4/site-packages/bb/build.py", line 117, in exec_func_python
  File "usr/lib/python2.4/site-packages/bb/utils.py", line 144, in better_exec
  File "base_do_patch", line 4, in ?
  File "base_do_patch", line 2, in base_do_patch
  File "usr/lib/python2.4/site-packages/bb/build.py", line 98, in exec_func
  File "usr/lib/python2.4/site-packages/bb/build.py", line 117, in exec_func_python
  File "usr/lib/python2.4/site-packages/bb/utils.py", line 144, in better_exec
  File "patch_do_patch", line 100, in ?
  File "patch_do_patch", line 98, in patch_do_patch
  File "<bb>", line 339, in Resolve
__builtin__.CmdError: Command Error: exit status: 1  Output:
Applying patch bindir-libdir.patch
patching file Makefile.pre.in
Hunk #1 FAILED at 78.
1 out of 1 hunk FAILED -- rejects in file Makefile.pre.in
Patch bindir-libdir.patch can be reverse-applied

NOTE: Parsing finished. 4718 cached, 0 parsed, 218 skipped, 0 masked.
NOTE: build 200712181957: started

OE Build Configuration:
BB_VERSION     = "1.8.8"
OE_REVISION    = "6834c8854d34a28405ba69e170089d3a873e3d1a"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "collie"
DISTRO         = "angstrom"
DISTRO_VERSION = "2007.11RC1.2"
TARGET_FPU     = "soft"

NOTE: Resolving missing task queue dependencies
NOTE: preferred version 2.5 of glibc not available (for item virtual/arm-angstrom-linux-libc-for-gcc)
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 284 of 976 (ID: 650, /home/grante/quarq/oe/org.openembedded.dev/packages/python/python-native_2.5.1.bb, do_patch)
ERROR: Task 650 (/home/grante/quarq/oe/org.openembedded.dev/packages/python/python-native_2.5.1.bb, do_patch) failed
NOTE: Tasks Summary: Attempted 283 tasks of which 283 didn't need to be rerun and 1 failed.
ERROR: '/home/grante/quarq/oe/org.openembedded.dev/packages/python/python-native_2.5.1.bb' failed

-- 
Grant Edwards
grante@visi.com




